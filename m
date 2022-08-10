Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16481C19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Aug 2022 03:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8011640A96;
	Wed, 10 Aug 2022 03:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8011640A96
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PrqePyJw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2lTo6Qat1lCy; Wed, 10 Aug 2022 03:16:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6855D40195;
	Wed, 10 Aug 2022 03:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6855D40195
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50B64C0032;
	Wed, 10 Aug 2022 03:16:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1308C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 03:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98C77819BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 03:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C77819BE
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PrqePyJw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jzmjvlSmFLXN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 03:16:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C200D81970
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C200D81970
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 03:16:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z16so16213032wrh.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 09 Aug 2022 20:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=84NRcLKFfe/6XQq15qNZMiBSNFJ+/AXaHO09WwjXOT0=;
 b=PrqePyJw637rEQIgXaT5QRPPe8o+bbDEL8SJeUu+NzC/ASKCeew3qy5DdUr5Jrh8iN
 BDvJIsZtCJa6EyY4lqbG7Lbo/KvV0y2QqHhfDRhCpC/ZMwPQEv/2spQM6FFukn/3Hsyh
 0LRW38JmCm3jdEh5uMQREhhdhoc5BqyGEq/mz/6KI44alJ7sffbjToVgrTUYTdkXXy80
 qpcqPrtzkOEl4/4KJUQGUk8xwFfKK99En3egrrKrmbjPGlMppD0z/Z4KNDCrr7iranpi
 P3EZK+5MPIFMJe3A5iID2tNdkiB+tHElTRp/ierU2zSSrle/bckLJVm8BSr+UZL1Zdfd
 CDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=84NRcLKFfe/6XQq15qNZMiBSNFJ+/AXaHO09WwjXOT0=;
 b=ZR+x9NCyoX8l3lteWT+sl0wWRhZKHYmiBLYG7j/O1J2hx4m3Epa3l+3RyMPNVpgqq+
 mEv8PjD7o+GzDXFDTXtazKQ5KWSMSjseuwTlEz2M38IV2sF2RRylFuxCYfRWna8Ljckz
 EOYS0vWb6n311smggT0pXB/t9ERs+UEhNIXAm/ynjX1A//mDqYmuQy/8W2Y0i7T74BkT
 lrFzrb+haNweWqkv+7fmT0wm5ldiqAOeQSSixlVrn5D5aTCeUfU3A9hb2Ypqac+bsDUS
 jtP8ejk+hYU6NpssUm8GRNrhOjjhWkeIeDQj95mFbU8Bc/hNcJRdFrCw6bDHulHvRnif
 bwnw==
X-Gm-Message-State: ACgBeo0C1DSWf8myvKuBj+bmP095Kn9BfmHk0US3OAKmSyBif8JlwlOq
 LzTZe75L8Q8IRyW9QFej+L0=
X-Google-Smtp-Source: AA6agR6vbi9PzSN4LXg7Z8Hv8wrETrEAOO6ZTjf85QXAaPac7lJ9PgZj6Gek3NzO0bdQJbVRiaSzVg==
X-Received: by 2002:a5d:64e2:0:b0:220:7dfb:ab6f with SMTP id
 g2-20020a5d64e2000000b002207dfbab6fmr15514382wri.664.1660101396774; 
 Tue, 09 Aug 2022 20:16:36 -0700 (PDT)
Received: from localhost.localdomain ([84.255.184.228])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a5d698b000000b0021eff2ecb31sm15575961wru.95.2022.08.09.20.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 20:16:36 -0700 (PDT)
From: Mazin Al Haddad <mazinalhaddad05@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] tty: n_gsm: fix missing assignment of gsm->receive() in
 gsmld_attach_gsm()
Date: Wed, 10 Aug 2022 06:12:52 +0300
Message-Id: <20220810031251.91291-1-mazinalhaddad05@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: daniel.starke@siemens.com, jirislaby@kernel.org, paskripkin@gmail.com,
 syzbot+e3563f0c94e188366dbb@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Mazin Al Haddad <mazinalhaddad05@gmail.com>
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

Fixes a bug reported by syzbot. A null pointer dereference can
happen when attempting to access the "gsm->receive()" function in
gsmld_receive_buf(). Currently, the "gsm->receive()" function is only set
after a call to the GSMIO_SETCONF ioctl. Since the gsmld_receive_buf()
function can be accessed without the need to call the line discipline
ioctl (GSMIO_SETCONF), the gsm->receive() function will not be set and a
NULL pointer dereference will occur.

Fix this by setting the gsm->receive() function when the line discipline
is being attached to the terminal device, inside gsmld_attach_gsm(). This
will guarantee that the function is assigned and a call to TIOCSTI,
which calls gsmld_receive_buf(), will not reference a null pointer.

Call Trace:
 <TASK>
 gsmld_receive_buf+0x1c2/0x2f0 drivers/tty/n_gsm.c:2861
 tiocsti drivers/tty/tty_io.c:2293 [inline]
 tty_ioctl+0xa75/0x15d0 drivers/tty/tty_io.c:2692
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd


Fixes: 01aecd917114 ("tty: n_gsm: fix tty registration before control channel open")
Reported-and-tested-by: syzbot+e3563f0c94e188366dbb@syzkaller.appspotmail.com
Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>
---
 drivers/tty/n_gsm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index caa5c14ed57f..1d74dd9d70d0 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -2825,6 +2825,11 @@ static void gsmld_attach_gsm(struct tty_struct *tty, struct gsm_mux *gsm)
 	/* Turn off tty XON/XOFF handling to handle it explicitly. */
 	gsm->old_c_iflag = tty->termios.c_iflag;
 	tty->termios.c_iflag &= (IXON | IXOFF);
+
+	if (gsm->encoding == 0)
+		gsm->receive = gsm0_receive;
+	else
+		gsm->receive = gsm1_receive;
 }
 
 /**
-- 
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
