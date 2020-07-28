Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C93C433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 02:30:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCB35207FC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 02:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnJMCKAI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCB35207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8FBB38788B;
	Tue, 28 Jul 2020 02:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TN4VHl1ENecz; Tue, 28 Jul 2020 02:30:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 85C8487880;
	Tue, 28 Jul 2020 02:30:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76160C004F;
	Tue, 28 Jul 2020 02:30:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FCA5C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 02:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3F24B85FA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 02:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pz19ppGO7wXd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 02:30:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 89F3585E60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 02:30:12 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u64so17328262qka.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LghMRY0eJz69FvNdTsfGPJkdBB+xNH9H4rz/7MbnCRI=;
 b=bnJMCKAIkqv0DGEntX13OzGGsZW0+aLpEjGvdVH+nwpdCRplj4EbvcqI8cbWbjSJBt
 ESwvwcvL3cM/CMZjuhngVhK6SR/K9NLKWx1wgtzSxQsFKhuHTBvbY+oisLuA9J/fUvLZ
 W+32kca1wzmT/Hl7g1nITD/8xfQJShz4P/N2EEOexgDzSpRxuq66oPEaUrLncjzd/bea
 oamgmazXldhBcjM32ClHTQ110SD4Og1HV4BekIr4hfA78fLILc8ilNwuHGFCGGcTBdim
 3HmJzPqwMwpu81xHRInRsucvn0hkNc2h1EPFLrK4blGnw2CSM/RPHLJ7KBY+2sP85y4U
 ijJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LghMRY0eJz69FvNdTsfGPJkdBB+xNH9H4rz/7MbnCRI=;
 b=rMNFobOfu5v6husHZ/35gv3PtVfi8ijJCvRz8NES+vSVNqvEYOjrHalHB9f6gmEt/O
 azPH4FU+IAl4rFwwM8rOCNNnuCq7Bw3ClhBg63N/+JM320iUps+2Bih3lxgXN/vxQFUM
 ElvXV4Ps43uX42e3rPOQ8xT27BEsA/Z/WCp3Vi8sq4qgpxRhxIlN1xEi2n0wtfqXGD2t
 2m/GkMUURa/6p+WcmKEbe5icIF1ogEjHCRCQ/WnqF8KQQneoptP/b6WPCHIbMo3Zig1+
 036JQH2XKWzXMVJgnzZ3c6tSQDZLm5yPtMJv54H22wS6rE7GsCbcqrBbAADs0dUm7Wn6
 Myfw==
X-Gm-Message-State: AOAM533oMpsgyFBDdMPao2hHPNHBTZz0Z0/RgNwF4ugk9DN9pG7ScSYT
 +xnU+BLWPR3GbcD0c41ZiQ==
X-Google-Smtp-Source: ABdhPJxMp6DcUWEKQIocOpTM4d9HTvWLZLU8wxIErmHS9bFo53Aq3b3460+pTV09zE/YLSONmTToNA==
X-Received: by 2002:a37:4916:: with SMTP id w22mr26521332qka.246.1595903411573; 
 Mon, 27 Jul 2020 19:30:11 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id x12sm19496229qta.67.2020.07.27.19.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 19:30:10 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>
Date: Mon, 27 Jul 2020 22:28:59 -0400
Message-Id: <20200728022859.381819-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 linux-kernel@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Arnd Bergmann <arnd@arndb.de>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-kernel-mentees@lists.linuxfoundation.org, netdev@vger.kernel.org,
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@chromium.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Andrii Nakryiko <andriin@fb.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>
Subject: [Linux-kernel-mentees] [PATCH net] xdp: Prevent kernel-infoleak in
	xsk_getsockopt()
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

xsk_getsockopt() is copying uninitialized stack memory to userspace when
`extra_stats` is `false`. Fix it by initializing `stats` with memset().

Cc: stable@vger.kernel.org
Fixes: 8aa5a33578e9 ("xsk: Add new statistics")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 net/xdp/xsk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 26e3bba8c204..acf001908a0d 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -844,6 +844,8 @@ static int xsk_getsockopt(struct socket *sock, int level, int optname,
 		bool extra_stats = true;
 		size_t stats_size;
 
+		memset(&stats, 0, sizeof(stats));
+
 		if (len < sizeof(struct xdp_statistics_v1)) {
 			return -EINVAL;
 		} else if (len < sizeof(stats)) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
