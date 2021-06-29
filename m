Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F65C11F6A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 14:49:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB2F161DD1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 14:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB2F161DD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8156E836EA;
	Tue, 29 Jun 2021 14:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvVdOqenmV2R; Tue, 29 Jun 2021 14:49:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B824C8361C;
	Tue, 29 Jun 2021 14:49:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94C37C0010;
	Tue, 29 Jun 2021 14:49:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 107CEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0635D40124
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGMisyVeYoR3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84698400C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 14:49:01 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 80so2956491pgg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hH3BEmirKSuCMG+otrkbrO7MFlVhUAOTXc8+tfT2ViE=;
 b=CmsSoVHisxtL5wc2dRYcuv3RXt4YJoTRY52jbBO/cfouxzT1cktadnQlTTtjdfV7eX
 XrRdmBBiy46aMtnlrPIg4PPrZ0omLn0BBW5I+JFHQ/9jifHfyYABH5AvFf4M1Tj+8rXB
 xHdwqRXTBSkDbaNDF91QBdigZcnvfGBo6yAi+8IbUs4kGvCx7mhlxeixVcmssgl+8Jp1
 AP+6BLvcjEZoX9zn7/uevMb+zdVbW0yO6ROdePvGIke7MjpynFvkCOzaqqiATaK5fzPG
 cH1DIVKtev4ztg8AwReRgMihYw7yiAWFlRxCKNPaA1GRAr3NoUPyjmv/VQIiVUQNw+0T
 6teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hH3BEmirKSuCMG+otrkbrO7MFlVhUAOTXc8+tfT2ViE=;
 b=UeDNugyKrGLwVHm8KmBDZb5XcWuDaiUyKCrfvIwTJOrEWWerjl4YwP8O3FPPSSgJr2
 /SbnxhQZx7mvRQ/Aj2QeOqLp/vVlV+1LqGNi4WHtFF0qb/Byq4X5RxZY4zJRRj0/6f1o
 +oC3iOq+Wm7Id447Y1WyyQi98RmNW5TSuESAoGGdvGaP6mbAD5ojuW09DgV7eQHiRmOn
 o/Vrk9JhjG8JRkD299FYp2lMUIZJOn2yo6TGO20SxJpea7wIC1sI5Od+bSXftNAMHddg
 FF1h5sG5G5Z1fYVsdpK5Z0KwgTmjKSg9yfba2oZTi7fXDA9Eyx9UPbexIDpCjXzLqwEb
 iQhQ==
X-Gm-Message-State: AOAM530+XTWmSHnSAeAR2XPMKIyjph6gDMHIICI+bQxoUZecdO2U3X/i
 tzWbRvvb8OESgbCFCDJD7cg=
X-Google-Smtp-Source: ABdhPJwyYmOtahkEBc/yRLHUGc0/q8zi0UJFuXJbXkMG/kOJ/BHpsIiVZwqyh9W58qN0z9sWu++LBA==
X-Received: by 2002:a62:1408:0:b029:304:1caa:dc36 with SMTP id
 8-20020a6214080000b02903041caadc36mr30701779pfu.8.1624978140983; 
 Tue, 29 Jun 2021 07:49:00 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i2sm3417262pjj.25.2021.06.29.07.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 07:49:00 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gustavoars@kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH 1/3] hfs: add missing clean-up in hfs_fill_super
Date: Tue, 29 Jun 2021 22:48:01 +0800
Message-Id: <20210629144803.62541-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629144803.62541-1-desmondcheongzx@gmail.com>
References: <20210629144803.62541-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
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

On exiting hfs_fill_super, the file descriptor used in hfs_find_init
should be passed to hfs_find_exit to be cleaned up, and to release the
lock held on the btree.

The call to hfs_find_exit is missing from this error path, so we add
it in to release resources.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 fs/hfs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/hfs/super.c b/fs/hfs/super.c
index 44d07c9e3a7f..48340b77eb36 100644
--- a/fs/hfs/super.c
+++ b/fs/hfs/super.c
@@ -419,6 +419,7 @@ static int hfs_fill_super(struct super_block *sb, void *data, int silent)
 	res = hfs_cat_find_brec(sb, HFS_ROOT_CNID, &fd);
 	if (!res) {
 		if (fd.entrylength > sizeof(rec) || fd.entrylength < 0) {
+			hfs_find_exit(&fd);
 			res =  -EIO;
 			goto bail;
 		}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
