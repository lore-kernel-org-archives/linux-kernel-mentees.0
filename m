Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37990C00528
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Aug 2023 19:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CE2641F5C;
	Thu,  3 Aug 2023 19:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CE2641F5C
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=k5NDFDrE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_uQTI17KbrT; Thu,  3 Aug 2023 19:00:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1D4A2408FA;
	Thu,  3 Aug 2023 19:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4A2408FA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9284C0071;
	Thu,  3 Aug 2023 19:00:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA4FAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 19:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE1D540253
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 19:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE1D540253
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=k5NDFDrE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yeRkeh9QJ2wU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 19:00:30 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D5E24186B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 19:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D5E24186B
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99c1f6f3884so180798266b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Aug 2023 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691089229; x=1691694029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fpJNHhs8hGi2yDC45xTTVL8bPEioZdZntYr6lajc9vM=;
 b=k5NDFDrEg+9nNDfAkqK83fDOp8A5hffycEbrlbI1/HFSkoagQYZMmMPYLy72x3L1wF
 JTyYZl2/V9SuoMJt9V3F/7xfyxu01MSFXa2Xhu/TtBD6BVVPbIYsb+0cN3OSQ4ZzY7qV
 sLMQfRL+DlBOv9af5SFsYVhKt8Yrf8E+RH9PvIzTXoXF5B3MwM01l3mdjlPDFa94T/5x
 XIi4lG512p/FVDpSvNiARyeXHw50IbimFnqlTAn/a/o63GlyqwYjJBdWDdtAbFGbfknY
 PcDd53ab0QCfjsii/z7pcosDnLaQrDL9LBgq9QPpZCYn7XUPYkMAEojnEN9BefiQyZTN
 77Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691089229; x=1691694029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fpJNHhs8hGi2yDC45xTTVL8bPEioZdZntYr6lajc9vM=;
 b=UI8rwCVeCSLvjPSbcnscXABoe9j68YV7uxZ9+Uivrfz/B+Q9DA2kGIPeQsHPHD36zC
 3peG//pv5JwCkMFRKbj47MAbHnieLnXx6JkwfbZ7hya60WTxdbnhu56KCq33kX+k3rB4
 78A+hF7aW9CKO7+YSL81Bb+ffrQUAUoaFme54kO6zl0DzG8S8KIiLv/H/7jeyRWhs5Js
 Yx6M48STXX5cQum2Cm4wMB0hOOhEmDFmm/+PhSs/3rjpAs5ZrUDVyyioEPl86QEJDFea
 FS9ldM4d4Bpw9OFJDbbkMETTDkkg85Se8dvdbwFWXceQKK4sTHYZratVSQ4Jbi2EH3rx
 vpwA==
X-Gm-Message-State: ABy/qLb/LYUs7s6BaTacYy3fNgVvsKA/B7s9r8yXxiZdyt8AWbsVh+ig
 duzTuS/Dni9g1zoEfesYbIc=
X-Google-Smtp-Source: APBJJlErSeEumK9R9+wnkEORl7kuxFvXLYgJU3sv1JvX9YTgWXsr9PNifF6jZ1kMyJr/QPo0T+vz+w==
X-Received: by 2002:a17:906:20d9:b0:994:47a0:c730 with SMTP id
 c25-20020a17090620d900b0099447a0c730mr8455282ejc.43.1691089228564; 
 Thu, 03 Aug 2023 12:00:28 -0700 (PDT)
Received: from dev7.kernelcare.com ([2a01:4f8:201:23::2])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a1709063ecd00b00992a8a54f32sm182939ejj.139.2023.08.03.12.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 12:00:27 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jasowang@redhat.com, netdev@vger.kernel.org,
 hawk@kernel.org, jbrouer@redhat.com, dsahern@gmail.com,
 john.fastabend@gmail.com, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 1/2] drivers: net: prevent tun_build_skb() to
 exceed the packet size limit
Date: Thu,  3 Aug 2023 20:59:48 +0200
Message-Id: <20230803185947.2379988-1-andrew.kanner@gmail.com>
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

Jason Wang <jasowang@redhat.com> proposed to count XDP_PACKET_HEADROOM
always (e.g. without rcu_access_pointer(tun->xdp_prog)) in
tun_can_build_skb() since there's a window during which XDP program
might be attached between tun_can_build_skb() and tun_build_skb().

Fixes: 7df13219d757 ("tun: reserve extra headroom only when XDP is set")
Link: https://syzkaller.appspot.com/bug?extid=f817490f5bd20541b90a
Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
---

Notes (akanner):
    v5:
      - always count XDP_PACKET_HEADROOM in tun_can_build_skb() as there's a
        window between tun_can_build_skb() and tun_build_skb() and XDP
        program might be attached there.
      - rcu_read_lock/unlock() for tun->xdp_prog were completely removed and
        there's no need to use rcu_access_pointer() instead which was noted
        by David Ahern <dsahern@gmail.com>.
    v4: https://lore.kernel.org/all/20230801220710.464-1-andrew.kanner@gmail.com/T/
      - fall back to v1, fixing only missing XDP_PACKET_HEADROOM in pad
        and removing bpf_xdp_adjust_tail() check for frame_sz.
      - added rcu read lock, noted by Jason Wang <jasowang@redhat.com> in
        v1
      - I decided to leave the packet length check in tun_can_build_skb()
        instead of moving to tun_build_skb() suggested by Jason Wang
        <jasowang@redhat.com>. Otherwise extra packets will be dropped
        without falling back to tun_alloc_skb(). And in the discussion of
        v3 Jesper Dangaard Brouer <jbrouer@redhat.com> noticed that XDP is
        ok with a higher order pages if it's a contiguous physical memory
        allocation, so falling to tun_alloc_skb() -> do_xdp_generic()
        should be ok.
    v3: https://lore.kernel.org/all/20230725155403.796-1-andrew.kanner@gmail.com/T/
      - attach the forgotten changelog
    v2: https://lore.kernel.org/all/20230725153941.653-1-andrew.kanner@gmail.com/T/
      - merged 2 patches in 1, fixing both issues: WARN_ON_ONCE with
        syzkaller repro and missing XDP_PACKET_HEADROOM in pad
      - changed the title and description of the execution path, suggested
        by Jason Wang <jasowang@redhat.com>
      - move the limit check from tun_can_build_skb() to tun_build_skb()
        to remove duplication and locking issue, and also drop the packet
        in case of a failed check - noted by Jason Wang
        <jasowang@redhat.com>
    v1: https://lore.kernel.org/all/20230724221326.384-1-andrew.kanner@gmail.com/T/

 drivers/net/tun.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 25f0191df00b..100339bc8b04 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1594,7 +1594,7 @@ static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
 	if (zerocopy)
 		return false;
 
-	if (SKB_DATA_ALIGN(len + TUN_RX_PAD) +
+	if (SKB_DATA_ALIGN(len + TUN_RX_PAD + XDP_PACKET_HEADROOM) +
 	    SKB_DATA_ALIGN(sizeof(struct skb_shared_info)) > PAGE_SIZE)
 		return false;
 
-- 
2.39.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
