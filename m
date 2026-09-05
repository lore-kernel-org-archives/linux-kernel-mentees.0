Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A14B4772B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Sep 2026 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622551; cv=fail; b=eWBO+wWrrkq5He+nLfI+zIl5+Ad1/vrITLYsDVDCQ2wf6LADEERrZdSkJyvGrLEphWFB+bQHIn7eB/ANUlKmgjI5Sm+s6vtoik2wE/VXFeTtt9fjxpLAdJtLrHz+N5cr2J2ZuYJ5m4XDUbPSxA6/9LWkhMzsyAdNqY6Augt7hTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622551; c=relaxed/simple;
	bh=GvmssypO3wFrEaIA/09y7tkUfGE1ozQEU6tFnebwajA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NL0+fSyqsHPdGWtCd8wQyrZ2ImOQrKupZsYeZSTEjmTMC+j4k+qpWaodQeAoV3khRPGTR2StMiSOhUW+DhDfFOjp8R2Hbk8zvntkSGFUIrhIGqL+ZHRcWeLKkNF2MnT2Ot3DfvpAw8oOglQbZDayELpoPabx/uFAaUUACdpPTwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ec3N7qvn; arc=fail smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ec3N7qvn"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92D9140B0A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Sep 2026 15:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.748
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a522vwxqzyvh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Sep 2026 15:35:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BE01040B09
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip="2607:f8b0:4864:39::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788622545;
	b=oO4PXCx+lkSrpI46mX42kaUcJnIb95ed0lVpLfJXe+0mefBTEzRSHvY0GCOf3WHvd3Cr
	 3S8ybSRBXdWqa25V8YGg9MUriO5udsV3F/NurQFPmWEPgiDecyaCjUhbCed8HyLe7UvTe
	 aFI4S+shA/SFMDD0Dv2fx4uFNsE/dxj5rTGB1iUL4sfZ1XBHR5VGuOA0Cc+65nwSU5f9/
	 CIKfZC8rsVcVSkDZ7nliwpgag09ZomtLo5RBBlPNe5+PVxo+JyDF8v3zTnEPOLzpMGYUV
	 1A2DWhHr2u++g5Puac+hEWrTmxa/7ly9fa3BZo8EdsF+M/z8qk2nBYQeYkauCfsjkdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788622545;
	h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lm42doHswCi3RtZeu7IIEEdGs2pytFeZf/X0boG9eKM=;
	b=TBdg4IwkbRC4xNgURFgigsecZEjoaAQoDFjPXHDFybyzkwzWcB6dFyAEazV8wPpHy7hs
	 MgywaN4l8hYiBr75hQ2lcnTivYtuwUsNIM1c+SQSz2BDre+GO13hgaGNDge/gwYxGrKXT
	 aAGwXCA7CijPeCaU/INLfYSaKgjJyJaH9frHYQzsMLqRJFR+aVDLPiuwe8lPPnNxr5OHE
	 ikeZg1eXjBktjxwMPakM9zk2MzwtFvVl7CfN7DQet7ZiUa2TRwVPfvZt7OGx01kgAQyME
	 MnABci0QehmoxByjO+c56VN/6cPrjII6u4rchxQ3SAwqkRJTxPV+QouzVIEWkayX6Iw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ec3N7qvn;
	arc=none smtp.remote-ip="2607:f8b0:4864:39::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:39::10; helo=mail-pj2-x10.google.com; envelope-from=ayushmukkanwar@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ec3N7qvn
Received: from mail-pj2-x10.google.com (mail-pj2-x10.google.com [IPv6:2607:f8b0:4864:39::10])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BE01040B09
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Sep 2026 15:35:45 +0000 (UTC)
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39666e7c9edso93302a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 05 Sep 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788622545; x=1789227345; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lm42doHswCi3RtZeu7IIEEdGs2pytFeZf/X0boG9eKM=;
        b=ec3N7qvndlfIGSCMZV+uc5D4tzKK4/t20LfJ+CHVzGxyjFCga6zjfRiaVQfrlNU26w
         h2ZjUqgfy54DKiAjbfVOyBAYBZ4951ldGV23NR7QKMqx3sqTUqteLGGvDmxbFDqN5b85
         HvB2zHU2YZ7NyBFXwWoFZGfeZUd+GR/PqbL0uCoNSuU5doVrXeqjM7XW6l5kETLpGHPr
         kXIBH/QGgWHczFa4GlmLDvnSyIW6d5VOUY2+nAoziXL4mLItXzD1zXL1vzlI6If56HwB
         kfNGh+vL5Ua142NQ++I6aJv4jmpxG100CueOcTVCeKMVVymb0fHD6mAjNqmK4Z7+Ok9/
         mquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622545; x=1789227345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lm42doHswCi3RtZeu7IIEEdGs2pytFeZf/X0boG9eKM=;
        b=QG5w/7qSXf5T3Lmc6BQTKayfnN3KOqRnsTlxaVIFNT2jIFyH6hVXlqaoVuwamcQ4wU
         oap35IEHpOVWAjIW9nhjpA6nNyxX418Opb+KZK8ybgAbHjFfagJhfwuLyJRM9ubibSh/
         pLjH04gTaBpsnLbpRHRhRtFLIBl++6TDpRQIjdrc+5e9riysXgPf2rz3YZMGTgSo6VZf
         N9/7Q3k4aKWu0KO1TBdZgzq82cX3S/N0L86ZVcFc31Kn8nwtO5+3qLwiUY22WnYI9VbT
         MlW805eaOPHvLFubxNhrcPFnPSZvx9mZWWoviz+DC8+49bdUfcPIc3+MqH0rbcsCVA+S
         aOyg==
X-Forwarded-Encrypted: i=1; AKwUvBw0ucFEGFR0iG0nRNg4r+wybmZCLGXGRTFrd7gHYNUPPHUYiRmeoLx6zmN0NpPrZN2V4D6k4i1rk2vUo1AHis9z+QbdCg==@lists.linuxfoundation.org
X-Gm-Message-State: AFuF++knq/7OICfn8AG7cq3rtQncScfto5Z4EsupbbLN94VyyX9qgnZf
	p5b82njhWVQFuSX91odKRaQboHFTaA6h8WFKOOHF8d14W1yzTBDDfhrr
X-Gm-Gg: AYBFou1OYv0g6iaCKJ5fC3eNMnDay7LicJdMoROCo42b/JI3I34bFn1R7EkcBkJyrr3
	tYFFre4OEhf0u2All0aQAxmxO5HQ6SMpJG1ayEh+Ua6K72Du2r0tI5IqACbdG3BMTx2dsKJhlNh
	1IhnS0FOEAFg34YaiY88ULcdE8VXQ7FeAYKe7w8wZgBnE1zwbA4MIK9SvSEmhHJ4hPYejqYdS2N
	euyJy4kswDg5WOPOpp84cGoLB/VfuTDrAR7tkAAj8X4rpaXrrUpPbZemrZ5H4PFZu1x+e3qUShe
	plkStbfNaAhKvSqGq4SdZX/XIv30AxCVCnJHkNXVc3PFeaobvdmHo59dwLusil8nhI1SDw2vxFK
	SG2DCHJSKSLJd03f+5263q2JXEYwpeCLhVggmYe6+QrXP7RLRu9RPHOOvlTCd2UOzFk91GdMvIC
	RdE8jIaPB4fHgV7ynd0ekY8clfcI/mD13Cg3V5dQFF7EXRmIYTGeaQ1xurQgOFHKkTU+XLsphuN
	oCNqJ6xF/bIvIPfKjVf/ld3ZGCATRGKATloZnIsT0g6CApTT/oJmUOQ40gzFAfzIncz6hycYSwV
X-Received: by 2002:a17:90b:528c:b0:38e:7069:7117 with SMTP id 98e67ed59e1d1-39b3d3f7890mr7019686a91.0.1788622544549;
        Sat, 05 Sep 2026 08:35:44 -0700 (PDT)
Received: from fedora.iiita.ac.in ([103.119.35.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm10493484a91.11.2026.09.05.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:35:44 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	ayushmukkanwar@gmail.com,
	sashiko-bot@kernel.org
Subject: [PATCH 2/2] staging: octeon: fix out-of-bounds reads in tx path
Date: Sat,  5 Sep 2026 21:05:30 +0530
Message-ID: <20260905153530.36693-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
References: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. cvm_oct_xmit() and cvm_oct_xmit_pow() blindly trust
skb->protocol == htons(ETH_P_IP) and dereference the IP header
without verifying if the packet is long enough or if the header
is in the linear skb data area.
Fix by checking if skb_headlen is larger than
skb_network_offset + size of ip header.

2. cvm_oct_xmit_pow() copies packet data into a fixed size
hardware buffer using a hardcoded memcpy() size. If a packet
is smaller than it, memcpy() will read past the end of the
skb buffer. Fix this by using min_t() so that it does not read
past the end of the skb.

Fixes: 80ff0fd3ab64 ("Staging: Add octeon-ethernet driver files.")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260615172734.42038-1-ayushmukkanwar%40gmail.com
Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
Note: This patch has only been compile tested. No runtime testing was
performed as I do not have access to Octeon hardware.

 drivers/staging/octeon/ethernet-tx.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 5e536827f87a..452bc9fc8a5d 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -361,6 +361,8 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	/* Check if we can use the hardware checksumming */
 	if ((skb->protocol == htons(ETH_P_IP)) &&
+		(skb_network_offset(skb) >= 0) &&
+		(skb_network_offset(skb) + sizeof(struct iphdr) <= skb_headlen(skb)) &&
 	    (ip_hdr(skb)->version == 4) &&
 	    (ip_hdr(skb)->ihl == 5) &&
 	    ((ip_hdr(skb)->frag_off == 0) ||
@@ -571,6 +573,14 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 	work->packet_ptr.s.back = (copy_location - packet_buffer) >> 7;
 
 	if (skb->protocol == htons(ETH_P_IP)) {
+		if (unlikely(!pskb_may_pull(skb, ETH_HLEN + sizeof(struct iphdr)))) {
+			cvmx_fpa_free(packet_buffer, CVMX_FPA_PACKET_POOL, 0);
+			cvmx_fpa_free(work, CVMX_FPA_WQE_POOL, 1);
+			dev->stats.tx_dropped++;
+			dev_kfree_skb_any(skb);
+			return NETDEV_TX_OK;
+		}
+
 		work->word2.s.ip_offset = 14;
 		work->word2.s.tcp_or_udp =
 		    (ip_hdr(skb)->protocol == IPPROTO_TCP) ||
@@ -587,7 +597,7 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		 * does.
 		 */
 		memcpy(work->packet_data, skb->data + 10,
-		       sizeof(work->packet_data));
+		       min_t(unsigned int, skb->len - 10, sizeof(work->packet_data)));
 	} else {
 		work->word2.snoip.is_rarp = skb->protocol == htons(ETH_P_RARP);
 		work->word2.snoip.is_arp = skb->protocol == htons(ETH_P_ARP);
@@ -596,7 +606,8 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		work->word2.snoip.is_mcast =
 		    (skb->pkt_type == PACKET_MULTICAST);
 		work->word2.snoip.not_IP = 1;	/* IP was done up above */
-		memcpy(work->packet_data, skb->data, sizeof(work->packet_data));
+		memcpy(work->packet_data, skb->data,
+		       min_t(unsigned int, skb->len, sizeof(work->packet_data)));
 	}
 
 	/* Submit the packet to the POW */
-- 
2.54.0

