Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCC6C001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Jul 2023 22:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF02160BA8;
	Mon, 24 Jul 2023 22:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF02160BA8
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hYUPPntx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zD3Ex7Qxqbm; Mon, 24 Jul 2023 22:14:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B40A660AA5;
	Mon, 24 Jul 2023 22:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B40A660AA5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8729CC0071;
	Mon, 24 Jul 2023 22:14:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D3DAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 22:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9A0E40584
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 22:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9A0E40584
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hYUPPntx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxk_HoYaUCsY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 22:14:22 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB7A7403C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 22:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB7A7403C7
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fdfefdf5abso463854e87.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 15:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690236859; x=1690841659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yAsZdb1l2a00omNbaFLi6X9Z1M8KVaOQyZOE0+c0Tbc=;
 b=hYUPPntxc6s6ZI4Cv6z9ft0y9WjAHYLbjp4SyKtPI00sUEkmzSHvNUNDypAdtXKVn7
 ynUhu6KxwYHAZvUCNW+2HRJbaTFRlavjUeajGgTnONjK0MlNiaz5r1Y/geWjqRs1Q1rq
 KwrxAF55ex3j2qhvNLaDm9k6H78/5KU79/fipttlxE9I422PoXt70UVSBB8ey9ClHTr9
 9ju9MM0jTVFy/FPIdtBqZbEYxjJMe5861wtQvpkW/htfOqRfHjGj1vkujcN+phTOa2jY
 fZTh60p+kt1nY5Jw7Y9wBB39JPD2XHqJuHEefozlnjfVXVqWATdaczWsvYN0K1BsJrjl
 oReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690236859; x=1690841659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yAsZdb1l2a00omNbaFLi6X9Z1M8KVaOQyZOE0+c0Tbc=;
 b=ZIdPxm9Gzop8uOG/P0QQuKZT8E9ukSWSX20XlIdw6VTm5C/Ol+OeAQaqC5gqS4Gw0s
 8mqmwKqqBTWn2g+InqKizLoG7bMBbHvsEyyILuDKudvL10P7FJEJEADumdfmqKZbhZ/e
 569ifKWX4wtk91+zfrUwabgco873BMoSq2RkLzFq4yqrKkjTNVh110M1r380TmDtrUJN
 5JV7ZNNVdJFiVYxh9jV1UDGbwGDvp0PKGUBVKrY59erRHuIefNtYtFwExeoG71h/Ctby
 NXO/o6lFxL3KUaWr23kV5vf4dy1CKMJ0fey0Kg/7Ipl7kaim8un+bug0TK1sM071v1Kd
 mUbQ==
X-Gm-Message-State: ABy/qLZKaxW1bmfcpT/aa19y8ziGKm27lejtUMYiQMm3sPqVOr64mAUG
 TX5lYxk2pe+alU54S3dKaEo=
X-Google-Smtp-Source: APBJJlHAx+uI4qxDU4os4KVjWZLmaw4hsPui/tQzNXMFfBkFTUJUsBeQZifK5GQTbHM+kZ5qOj9tyg==
X-Received: by 2002:a05:6512:6d4:b0:4f9:58ed:7bba with SMTP id
 u20-20020a05651206d400b004f958ed7bbamr7337865lff.16.1690236859228; 
 Mon, 24 Jul 2023 15:14:19 -0700 (PDT)
Received: from localhost.localdomain ([77.222.25.78])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b004fba077e654sm2401130lfq.194.2023.07.24.15.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 15:14:18 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jasowang@redhat.com, netdev@vger.kernel.org,
 brouer@redhat.com, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drivers: net: use xdp only inside tun_build_skb()
Date: Tue, 25 Jul 2023 01:13:25 +0300
Message-Id: <20230724221326.384-1-andrew.kanner@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Syzkaller reported the following issue:
=======================================
Too BIG xdp->frame_sz = 131072
WARNING: CPU: 0 PID: 5020 at net/core/filter.c:4121
  ____bpf_xdp_adjust_tail net/core/filter.c:4121 [inline]
WARNING: CPU: 0 PID: 5020 at net/core/filter.c:4121
  bpf_xdp_adjust_tail+0x466/0xa10 net/core/filter.c:4103
...
Call Trace:
 <TASK>
 bpf_prog_4add87e5301a4105+0x1a/0x1c
 __bpf_prog_run include/linux/filter.h:600 [inline]
 bpf_prog_run_xdp include/linux/filter.h:775 [inline]
 bpf_prog_run_generic_xdp+0x57e/0x11e0 net/core/dev.c:4721
 netif_receive_generic_xdp net/core/dev.c:4807 [inline]
 do_xdp_generic+0x35c/0x770 net/core/dev.c:4866
 tun_get_user+0x2340/0x3ca0 drivers/net/tun.c:1919
 tun_chr_write_iter+0xe8/0x210 drivers/net/tun.c:2043
 call_write_iter include/linux/fs.h:1871 [inline]
 new_sync_write fs/read_write.c:491 [inline]
 vfs_write+0x650/0xe40 fs/read_write.c:584
 ksys_write+0x12f/0x250 fs/read_write.c:637
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

frame_sz < PAGE_SIZE check was introduced in commit c8741e2bfe87
("xdp: Allow bpf_xdp_adjust_tail() to grow packet size"). But
tun_get_user() still provides an execution path to exceed XDP limits
for packet size. The way to mitigate this is to reduce xdp to be used
only in tun_build_skb(), without falling in tun_alloc_skb(), etc.

Reported-and-tested-by: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000774b9205f1d8a80d@google.com/T/
Link: https://syzkaller.appspot.com/bug?id=5335c7c62bfff89bbb1c8f14cdabebe91909060f
Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
---
 drivers/net/tun.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index d75456adc62a..18ccbbe9830a 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1580,8 +1580,14 @@ static void tun_rx_batched(struct tun_struct *tun, struct tun_file *tfile,
 }
 
 static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
-			      int len, int noblock, bool zerocopy)
+			      int len, int noblock, bool zerocopy, int *skb_xdp)
 {
+	if (SKB_DATA_ALIGN(len + TUN_RX_PAD) +
+	    SKB_DATA_ALIGN(sizeof(struct skb_shared_info)) > PAGE_SIZE) {
+		*skb_xdp = 0;
+		return false;
+	}
+
 	if ((tun->flags & TUN_TYPE_MASK) != IFF_TAP)
 		return false;
 
@@ -1594,10 +1600,6 @@ static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
 	if (zerocopy)
 		return false;
 
-	if (SKB_DATA_ALIGN(len + TUN_RX_PAD) +
-	    SKB_DATA_ALIGN(sizeof(struct skb_shared_info)) > PAGE_SIZE)
-		return false;
-
 	return true;
 }
 
@@ -1809,7 +1811,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 			zerocopy = true;
 	}
 
-	if (!frags && tun_can_build_skb(tun, tfile, len, noblock, zerocopy)) {
+	if (tun_can_build_skb(tun, tfile, len, noblock, zerocopy, &skb_xdp) && !frags) {
 		/* For the packet that is not easy to be processed
 		 * (e.g gso or jumbo packet), we will do it at after
 		 * skb was created with generic XDP routine.
-- 
2.39.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
