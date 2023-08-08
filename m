Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57007C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Aug 2023 20:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8C12611A9;
	Tue,  8 Aug 2023 20:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C12611A9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fnsrIWtd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ms4pSi7V4s4C; Tue,  8 Aug 2023 20:58:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 01EA860784;
	Tue,  8 Aug 2023 20:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01EA860784
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5F91C0072;
	Tue,  8 Aug 2023 20:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E99CBC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 20:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C42CD8211B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 20:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C42CD8211B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fnsrIWtd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3ji-a7mEP6f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 20:58:15 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47CDC82119
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 20:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47CDC82119
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bbd03cb7c1so40441505ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Aug 2023 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691528294; x=1692133094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4mYS0E0S3XpBShTbT2N4ULzE/smbrejxctyKZkmYxrE=;
 b=fnsrIWtdT0z0cFi0yqq9DGs9hps2rgu+7OCt6DQTKclDznTkVtbSHQ01tBc1sL1NMO
 +vozi4FXMbInyy+/vhI31aGqoJEEPuoLtaFSETw8JvAUWdNiO6SwdnawFx9FtDOgkx7o
 lYQfiZqkqYBFaiOQf2BPhHkCc1VtBpjoIGp+5NBls/7IF/QEUWBXQCpnB5jBLPEn8Umt
 pM3jxMPPE/BYVftB1fKcqRqap04IJ3zSXwRzUV5M+cP3kM8UQuALIRqzZa6nHks+3gc9
 fR8IpeUDLx6gOJvFNZwJOmkkZ2TSKvOfk9n5FNh/CfON6bR/5fIPKdhGrQY4ZJEllYbj
 fPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528294; x=1692133094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4mYS0E0S3XpBShTbT2N4ULzE/smbrejxctyKZkmYxrE=;
 b=bhgbLXMRvN3n6L9uvlXqxYhMteINrS3i5Yx00IN2tTh9YMd4shdn31T+wKwdOvFtCV
 m5DrKCikqGZfP9qlZPSpLlpr5jBCdGpBgp2rug62Y7gfGeuN438BkY2n6OagN2WwM7Ab
 j+6alUXuUmNMXetayRScY4ooqf+b4DW8TOpxGcKNLCWDtecE9SF7OHL9of40r8Y8lajt
 r2H43+ahJkikzflB9sC9/IWi6jnFGEGEYrWR/w84SHlD5j6KnJEi7acjUnzgKFdRJRWW
 VSUTyVj0NbZ4S6gAH7ifuEELp7t/anaQSyemk4C12YejlG1+VPJIFUKDK0WkJsL4HbSy
 HmPg==
X-Gm-Message-State: AOJu0YxBNUywYO1DZz50s8FaqoQ/kYmmoz7v7rt72DIs4Se+q8cezvom
 hmRoIDz/kdfYc5PmTPd73oA=
X-Google-Smtp-Source: AGHT+IGR7E6c3nQAovGoU+QWgAJA+H84RS2ofPzMLXFvA6z5cHclqENykRudtZlcOLkdn8ynLX8Ebw==
X-Received: by 2002:a17:902:f801:b0:1b1:7362:9a18 with SMTP id
 ix1-20020a170902f80100b001b173629a18mr732564plb.27.1691528294548; 
 Tue, 08 Aug 2023 13:58:14 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:dc29:7938:e2e3:43a8])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a170902904800b001b9d8688956sm9440692plz.144.2023.08.08.13.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 13:58:14 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: Felix.Kuehling@amd.com
Subject: drm/amdkfd: Use memdup_user() rather than duplicating its 
Date: Tue,  8 Aug 2023 13:57:52 -0700
Message-Id: <20230808205752.23704-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 amd-gfx@lists.freedesktop.org
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

To prevent its redundant implementation and streamline
code, use memdup_user.

This fixes warnings reported by Coccinelle:
./drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:2811:13-20: WARNING opportunity for memdup_user

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 2df153828ff4..51740e007e89 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -2808,12 +2808,9 @@ static uint32_t *get_queue_ids(uint32_t num_queues, uint32_t *usr_queue_id_array
 	if (!usr_queue_id_array)
 		return NULL;
 
-	queue_ids = kzalloc(array_size, GFP_KERNEL);
-	if (!queue_ids)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(queue_ids, usr_queue_id_array, array_size))
-		return ERR_PTR(-EFAULT);
+	queue_ids = memdup_user(usr_queue_id_array, array_size);
+	if (IS_ERR(Iqueue_ids))
+		return ERR_PTR(queue_ids);
 
 	return queue_ids;
 }
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
