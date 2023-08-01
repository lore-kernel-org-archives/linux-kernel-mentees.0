Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EF5C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Aug 2023 22:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5DCA60FF0;
	Tue,  1 Aug 2023 22:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5DCA60FF0
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kaotcAVc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iP3iWZukcquv; Tue,  1 Aug 2023 22:08:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DE8DB61163;
	Tue,  1 Aug 2023 22:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE8DB61163
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE13EC0071;
	Tue,  1 Aug 2023 22:08:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0403FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 22:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCA134063B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 22:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCA134063B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=kaotcAVc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t59FbJbLYwsb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 22:08:48 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6D93404D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 22:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6D93404D8
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b9cdba1228so78707031fa.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Aug 2023 15:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690927726; x=1691532526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G1hkgYbEyenByhiJwV7HkHjwBRGI9O4uNXYD4EgYxI0=;
 b=kaotcAVcJkwsqpE9BJbV/XN+eV8bYnbuh3SRhYaVa0Q/fSJh+DRrukxPvbyd8radiL
 P7aNclrVt4fzkZQSQy9toXXQEUtU33zUdgWp8436CNj6cUaj0nykCVaQQhSf+HXCpB3L
 nqVc4olywChap+KoZXu6zpr/PM2yGPeDb+pRoUESyWkGrf0UTzlDA17bWU0yUpXUhgdz
 qOMixXr2r/5m7Q80jNGtbzZKKlkmkHZutQSBLUEUtnVKFwfQi9TMzkIlqHahckUuxS5o
 cxvEConNhDfn8iiaxVy8h699euN19H+A6fxbZ4NnIhb6oLS2gMwXBYc8nFzUY/QFIipd
 devA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690927726; x=1691532526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G1hkgYbEyenByhiJwV7HkHjwBRGI9O4uNXYD4EgYxI0=;
 b=GaAkwiT7yS9f9IkPWugvX7EXyTp3xcpzzUf/bcT7JCocbRfAWjza/5IMf/tTydfuwK
 Xt9JKAKaIu09FzXYIyc496DxhDKfW3v+reVVEyXQdtanOhCkkFo23feTU81fj4kJZTds
 yE1FL/gCsoW5bGSgExls0X+C4HrxngI7flkQvMdYjvqhVE8CtEa3B0/Dh2gUqPBQjfl7
 wHS+k5Lq3dPfFUWgCS/ZCEJPFB8jneEk/lFLl68H61ztVPzl7BPEEhwNQKaqqyD06PLo
 Tq02Sf3UlVLbk/r2W+MugfxyrYVbszIwK3F+m3pVftn1FLBCCXzKJAMcIxm/Uh+Ehs6g
 7oqw==
X-Gm-Message-State: ABy/qLZ9Ea9L2ZfIcyeIT/myic0YGgaKqHeq/j+DdJ1eG0nWHUoA+VKN
 W+4vU6a4/7p3seWUgvfgvh4=
X-Google-Smtp-Source: APBJJlEQLbXtHrYLczB2Kt01YL/EZrQRIWtxgHivm16qea/RpBi1FApyfFFXUDWH4sX5Hq88RIbR4A==
X-Received: by 2002:a2e:805a:0:b0:2b6:e2aa:8fbc with SMTP id
 p26-20020a2e805a000000b002b6e2aa8fbcmr2976839ljg.8.1690927725514; 
 Tue, 01 Aug 2023 15:08:45 -0700 (PDT)
Received: from localhost.localdomain ([77.222.27.96])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a2e95d2000000b002b9ea00a7bbsm1391013ljh.60.2023.08.01.15.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 15:08:45 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jasowang@redhat.com, netdev@vger.kernel.org,
 brouer@redhat.com, dsahern@gmail.com, jbrouer@redhat.com,
 john.fastabend@gmail.com, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] drivers: net: prevent tun_build_skb() to exceed the
 packet size limit
Date: Wed,  2 Aug 2023 01:07:11 +0300
Message-Id: <20230801220710.464-1-andrew.kanner@gmail.com>
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

Using the syzkaller repro with reduced packet size it was discovered
that XDP_PACKET_HEADROOM is not checked in tun_can_build_skb(),
although pad may be incremented in tun_build_skb(). This may end up
with exceeding the PAGE_SIZE limit in tun_build_skb().

Fixes: 7df13219d757 ("tun: reserve extra headroom only when XDP is set")
Link: https://syzkaller.appspot.com/bug?extid=f817490f5bd20541b90a
Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
---

Notes:
    v3 -> v4:
    * fall back to v1, fixing only missing XDP_PACKET_HEADROOM in pad and
      removing bpf_xdp_adjust_tail() check for frame_sz.
    * added rcu read lock, noted by Jason Wang <jasowang@redhat.com> in v1
    * I decided to leave the packet length check in tun_can_build_skb()
      instead of moving to tun_build_skb() suggested by Jason Wang
      <jasowang@redhat.com>. Otherwise extra packets will be dropped
      without falling back to tun_alloc_skb(). And in the discussion of v3
      Jesper Dangaard Brouer <jbrouer@redhat.com> noticed that XDP is ok
      with a higher order pages if it's a contiguous physical memory
      allocation, so falling to tun_alloc_skb() -> do_xdp_generic() should
      be ok.
    
    v2 -> v3:
    * attach the forgotten changelog
    
    v1 -> v2:
    * merged 2 patches in 1, fixing both issues: WARN_ON_ONCE with
      syzkaller repro and missing XDP_PACKET_HEADROOM in pad
    * changed the title and description of the execution path, suggested
      by Jason Wang <jasowang@redhat.com>
    * move the limit check from tun_can_build_skb() to tun_build_skb() to
      remove duplication and locking issue, and also drop the packet in
      case of a failed check - noted by Jason Wang <jasowang@redhat.com>

 drivers/net/tun.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index d75456adc62a..a1d04bc9485f 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1582,6 +1582,9 @@ static void tun_rx_batched(struct tun_struct *tun, struct tun_file *tfile,
 static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
 			      int len, int noblock, bool zerocopy)
 {
+	struct bpf_prog *xdp_prog;
+	int pad = TUN_RX_PAD;
+
 	if ((tun->flags & TUN_TYPE_MASK) != IFF_TAP)
 		return false;
 
@@ -1594,7 +1597,13 @@ static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
 	if (zerocopy)
 		return false;
 
-	if (SKB_DATA_ALIGN(len + TUN_RX_PAD) +
+	rcu_read_lock();
+	xdp_prog = rcu_dereference(tun->xdp_prog);
+	if (xdp_prog)
+		pad += XDP_PACKET_HEADROOM;
+	rcu_read_unlock();
+
+	if (SKB_DATA_ALIGN(len + pad) +
 	    SKB_DATA_ALIGN(sizeof(struct skb_shared_info)) > PAGE_SIZE)
 		return false;
 
-- 
2.39.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
