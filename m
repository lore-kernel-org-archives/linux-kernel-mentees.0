Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C332C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Aug 2023 20:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAC7340151;
	Sun,  6 Aug 2023 20:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAC7340151
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NQ7Dx+NY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hz0j2cdoNnkU; Sun,  6 Aug 2023 20:06:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7A49B414C5;
	Sun,  6 Aug 2023 20:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A49B414C5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44012C0072;
	Sun,  6 Aug 2023 20:06:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27BAEC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 20:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE6874091A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 20:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE6874091A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id huxm9jZndAqh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 20:06:30 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDF2140104
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 20:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF2140104
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-686ed1d2594so3732709b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Aug 2023 13:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691352389; x=1691957189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OQMn+nUvoYrtKWuXbPyVqz57rqA4nMHv0ArCSIqw2yU=;
 b=NQ7Dx+NY/Lz11X2A7IsLs1SsnOqKk9u0UFOhZx3fLWoZcZc6p7clwRu6HQ51y8Gk12
 nEo3UjfzvrpQrpL6nP6imK+TIKtsEzf6NteKeWFPAo7I4Bv+24FC98lrFp1nO5AkkibV
 6RKDUlObclgc8hA76iE5mqNm2VbbMfvGreGioQc0gV+q9XWxytrfMeUSTIxRI8PUebe0
 2UWKJ14no3C3xWPcHianMAtulmTJbFXNgVEaEbp54xK+4JvSWw5nORNILjwXvpXu3YkS
 EiGB2w+1uJdHfqaNY868XryY8ZKzuYpwCPeUFMTL210wqgf98GbBZYRivKt0MUX0WhYQ
 acfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691352389; x=1691957189;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQMn+nUvoYrtKWuXbPyVqz57rqA4nMHv0ArCSIqw2yU=;
 b=Q250XH8eh3NKH9PkSquv3nicEfMH2yVkpmTOtD7E05X89pLsEVzjasHpm+atVHssaG
 OqLCBbU4irTM1PAmkaX3IZxQeDbrZDInKgX3rbS1UnTKro0YF2HpzLwIbmHltxPMUdqE
 Zy8pKL9QDaz0MFUQrCSr7zeG6Wm2TB8k01ABSGcJAIoiAWpHuK30MIfw4uUFdDp4VU1j
 1rRnJOQ7gvjQFUfVA39MuF2i0iKZsy3d8kfcjzOAvd/SLt99HRRRC+6I7MjHbI95RNnS
 sNwWYWy67PaW/eHbK/boakgJJvyWaTCHC3+XtcUQdPud6MdHrKHsBIJbR9SPQtMTDq6N
 GIrQ==
X-Gm-Message-State: AOJu0YxF04NqVkb9kYSxSmx41yfKDOY7recoLemh1ubOi9nN6Qk16pzK
 tQmmcQSPRkB+so5qrB4DOIVArgskhHD+Ng==
X-Google-Smtp-Source: AGHT+IFOlWZzUFchlFd4iMRuiDbE8cP433/OXvPa03YCPWC5GsltkG/qEqckNvxFkwdffU/2OzqxvA==
X-Received: by 2002:a05:6a21:498a:b0:13f:a69c:53af with SMTP id
 ax10-20020a056a21498a00b0013fa69c53afmr8188391pzc.61.1691352389174; 
 Sun, 06 Aug 2023 13:06:29 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:bb85:602f:712d:8309])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a62e118000000b006826df9e286sm4824634pfh.143.2023.08.06.13.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 13:06:28 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: stefan@agner.ch,
	dev@lynxeye.de
Subject: [PATCH v2] mtd: rawnand: replace one-element array with
 flexible-array member
Date: Sun,  6 Aug 2023 13:05:27 -0700
Message-Id: <20230806200527.18797-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

One-element arrays are obsolete, and flexible
array members have taken their place. So, in
struct tegra_nand_chip, replace the one-element
array with a flexible-array member.

This fixes warnings such as:
./drivers/mtd/nand/raw/tegra_nand.c:189:5-7: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
v1 -> v2:
 Corrected commit message
---
 drivers/mtd/nand/raw/tegra_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index eb0b9d16e8da..f34cd8cd0eaf 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -186,7 +186,7 @@ struct tegra_nand_chip {
 	u32 config;
 	u32 config_ecc;
 	u32 bch_config;
-	int cs[1];
+	int cs[];
 };
 
 static inline struct tegra_nand_controller *
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
