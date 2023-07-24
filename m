Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447BBEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Jul 2023 22:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B750B60BD9;
	Mon, 24 Jul 2023 22:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B750B60BD9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K7TpzLZS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28k1UJwVJymY; Mon, 24 Jul 2023 22:15:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CFADC60AEF;
	Mon, 24 Jul 2023 22:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFADC60AEF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD27BC0071;
	Mon, 24 Jul 2023 22:15:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4C8AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 22:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1EFD60BA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 22:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1EFD60BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlB46QMRkK6w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 22:15:10 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A43FB60AEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 22:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43FB60AEF
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so7181636e87.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690236908; x=1690841708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VR5kr5/P9TZGbX0T3kYzKuPMSI9rX/Q6fFU/FogHPdo=;
 b=K7TpzLZSFTbsm+Zv7HTkwil6Z+M7WziaM9XD+4kQ3KbFBS+CPxNzQrS+qIdDt0xqjD
 ZhGlG7k4TswErdRWQr7kCaIbWRNbpdXCncvvhqnzcXjaYffiry/TwVlxasM+tMlTdHgr
 qv/H794OC21k3pldfu4o5v58DYcOGMwGjBqGDcATYR4s2vL/xxG0Zj+SZF7QW8RyVuYH
 gduR5At2PuMloDYbL/jjtySnPlkyb3YNhm89qFF68cu9gckTzkp5tboSnfRnAfmfUuxo
 lZHOf6lrOj+0h38jW1l+s+gB9LeY4cCWviRw1w+z3u23YshK5fPkSaE0SlbInmZmf2Ii
 bJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690236908; x=1690841708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VR5kr5/P9TZGbX0T3kYzKuPMSI9rX/Q6fFU/FogHPdo=;
 b=MtgzGToW76w2ylM0VbcDrLqX4dYSdJIzWD0niyTcYLxa+i55mdygLUIchatEce3/fW
 60FMOtUhaLG9/suIJ+J+ieZuI8+EE1qlRzMf0uaFTsYWhwa9sLD6EgNK0bhA/FyV16BC
 NrLQXoJ9ZD6lPEFDEQKmtJ+XFqkBfbm3tOAO74Sds1yl0czxwRKWudi8y+GdGJ2CPsxi
 DAzctIYU8Iur476wLMhbYesWmLHNTovjvReP7K+a5y79UFqj/HcJC4cM3CgIm5/ju3sh
 LqmuvVZrUzbAxMXmJ8iY5sy8fuflpxQ0xl3i8qF86jPZ09M/aS3MaWSEtdmpoRyaYC0r
 aFyg==
X-Gm-Message-State: ABy/qLYQP+WnSyP6n/H5s6pSpEh1l3ogxEexUpNo5Rol7xuVEWmsb8oB
 Fpk61hKjQy4vJZ2+2I26v20=
X-Google-Smtp-Source: APBJJlHb1Go1ALd4vfaDEL4yOJa8bVJ3Xvjgg/THhW+h1vUVM31EjGe8IiZLRMQz7JoQxb2F7Oqutw==
X-Received: by 2002:a05:6512:3b84:b0:4fd:f84f:a729 with SMTP id
 g4-20020a0565123b8400b004fdf84fa729mr3185178lfv.11.1690236908188; 
 Mon, 24 Jul 2023 15:15:08 -0700 (PDT)
Received: from localhost.localdomain ([77.222.25.78])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b004fba077e654sm2401130lfq.194.2023.07.24.15.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 15:15:07 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jasowang@redhat.com, netdev@vger.kernel.org,
 brouer@redhat.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drivers: net: prevent tun_can_build_skb() to exceed xdp
 size limits
Date: Tue, 25 Jul 2023 01:13:26 +0300
Message-Id: <20230724221326.384-2-andrew.kanner@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230724221326.384-1-andrew.kanner@gmail.com>
References: <20230724221326.384-1-andrew.kanner@gmail.com>
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

Tested with syzkaller repro with reduced packet size. It was
discovered that XDP_PACKET_HEADROOM is not checked in
tun_can_build_skb(), although pad may be incremented in
tun_build_skb().

Fixes: 7df13219d757 ("tun: reserve extra headroom only when XDP is set")
Link: https://syzkaller.appspot.com/text?tag=ReproC&x=12b2593ea80000
Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
---
 drivers/net/tun.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 18ccbbe9830a..cdf2bd85b383 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1582,7 +1582,13 @@ static void tun_rx_batched(struct tun_struct *tun, struct tun_file *tfile,
 static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
 			      int len, int noblock, bool zerocopy, int *skb_xdp)
 {
-	if (SKB_DATA_ALIGN(len + TUN_RX_PAD) +
+	int pad = TUN_RX_PAD;
+	struct bpf_prog *xdp_prog = rcu_dereference(tun->xdp_prog);
+
+	if (xdp_prog)
+		pad += XDP_PACKET_HEADROOM;
+
+	if (SKB_DATA_ALIGN(len + pad) +
 	    SKB_DATA_ALIGN(sizeof(struct skb_shared_info)) > PAGE_SIZE) {
 		*skb_xdp = 0;
 		return false;
-- 
2.39.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
