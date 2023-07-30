Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59189EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Jul 2023 22:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3979409EA;
	Sun, 30 Jul 2023 22:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3979409EA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=m8kbP+Xv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWkCoVfAbgaV; Sun, 30 Jul 2023 22:39:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3C87F409DD;
	Sun, 30 Jul 2023 22:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C87F409DD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12E66C0071;
	Sun, 30 Jul 2023 22:39:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D1EFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 22:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D645F813DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 22:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D645F813DD
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=m8kbP+Xv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJVtCPAvc-Ab
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 22:39:37 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF4F8813D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 22:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF4F8813D5
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-686f94328a4so2091474b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 15:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690756776; x=1691361576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kkl17oE2wR6zva//MUlEQG1ENNCznUpqn4/SajYEyCg=;
 b=m8kbP+XvyxiNjpii5Eng6H8g7dxHiLH/tP7XJ2E6iFDonVdq1GDCwysqSual1AeUhl
 W+3d5n8rUfWft73HcKqZzXDnuaiDAMryWe2X//NupTwizMqG3aEbVp+DQD3o6+q4ctKl
 NeHYNBoxRSlwkGy2LVShEw+MAxDJFo6qlmrrE6SdYbXLjBCRjc+q1bZiinYkpB7uPUZa
 +q8RkTe87I+Tcr1baS0Co5e3VHlg8aTeijAegkj/8gMA9qvj7P0W4aStUBYoiMaPLv8V
 BxrXSbXPvy32Zyv/jUdf0LfV21UH0TP9Tyfc7Yo4qDodtBuCs+hVozwg6aVuBvhT389H
 /81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690756776; x=1691361576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kkl17oE2wR6zva//MUlEQG1ENNCznUpqn4/SajYEyCg=;
 b=ZHNz9xIF0O1vF2sAzMLPk6BA+BIRFzgLQ4DYLHylPRQg4WtEppNOysCPXrf7GmH+Ya
 tDVLPvs1nqnzSBbs9R8ACTZTA8BK6TyWxVt0ewU7wbYqvUfwxym6o6tDUFzjxTbBxdr8
 xtvttum5KQyTMmJ9D9H3WnAVUWxRWvtX1VZ6WNWZyc4qdeBXlUTv/EM1mZbeT5Rg1Z6b
 uhhBYzMEepyLBds+5kDjAdYv8xixcX2qRHsUwR8am2FPKCVCZ9syq0onuqIAtM4ZnL2F
 QkyCkKHoBjfIDstif6ozg7BCvcf65/V2hbikGlL/fshuFAtp5Jkbs70bNG7IZP4nVV4o
 dHQA==
X-Gm-Message-State: ABy/qLafiIo0hh5+G3nKq3q9d/d8Aj+HcnOAPoJ7SqXkpR5L6ug+9z8o
 LBMBhem9eGLzUlIXgZEkSfI=
X-Google-Smtp-Source: APBJJlHBHPCbEIjnyx9j8UAGPEmYcK6uUe2oNG6U+JMT3KcVjWe64GY2jG6TPC9Wkg3XS5Rx4IIT7Q==
X-Received: by 2002:a05:6a20:3d21:b0:10b:bf2d:71bb with SMTP id
 y33-20020a056a203d2100b0010bbf2d71bbmr9220925pzi.27.1690756776160; 
 Sun, 30 Jul 2023 15:39:36 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a62ae14000000b006675c242548sm6286146pff.182.2023.07.30.15.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 15:39:35 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: srinivas.kandagatla@linaro.org
Subject: [PATCH] nvmem: u-boot-env:: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Date: Sun, 30 Jul 2023 15:39:15 -0700
Message-Id: <20230730223915.13157-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: rafal@milecki.pl, linux-kernel-mentees@lists.linuxfoundation.org
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

We are moving toward replacing zero-length arrays with C99 flexible-array
members since they are deprecated. Therefore, the new DECLARE_FLEX_ARRAY()
helper macro should be used to replace the zero-length array declaration.

This fixes warnings such as:
./drivers/nvmem/u-boot-env.c:50:9-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/nvmem/u-boot-env.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/u-boot-env.c b/drivers/nvmem/u-boot-env.c
index ee9fd9989b6e..5f4f53c6c17b 100644
--- a/drivers/nvmem/u-boot-env.c
+++ b/drivers/nvmem/u-boot-env.c
@@ -47,7 +47,7 @@ struct u_boot_env_image_broadcom {
 	__le32 magic;
 	__le32 len;
 	__le32 crc32;
-	uint8_t data[0];
+	DECLARE_FLEX_ARRAY(uint8_t, data);
 } __packed;
 
 static int u_boot_env_read(void *context, unsigned int offset, void *val,
-- 
2.41.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
