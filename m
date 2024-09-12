Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019531B982F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152784; cv=none; b=V4yrKKuKttbEVTY+labmvARva0HCFTbtZPj4fAlnTnpHCreS7d1pP0RsyeiQ3HruQOcnzBggGVNc6Vs+a9JpwDAgjDJog+X43GbzpmCxGch+5U49j1tckG2ddiM0a3jBWJyXhGLan+zzNrCtYNtjrECRkr7adxuOmNhVMbRBVCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152784; c=relaxed/simple;
	bh=OWL4mlcwtG9tysqDuntuby0lkx3kp3yrJUTlD+NSAk4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MujvL+bp60PZUJRz+Rci7tk2+w8nuSNf8e5kvTbjMdrYro5pBcLBtRDE1VqZMPpm3JuC89U67RidbnkL7JujUVMaH5WYojuFw1DKeFJt0rSskr+Ai6lq5flfrxZ6zxJNT/fmHuiqQP90uR67VPBVbXEx8G1of0vfXCTjMN+80I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQf6zqjQ; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQf6zqjQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8515041047
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 14:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lF-UuOAp9WN9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 14:53:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8235B4105D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8235B4105D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mQf6zqjQ
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8235B4105D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 14:53:01 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2d8a54f1250so742316a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726152781; x=1726757581; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5IKbYoDJEP2KO85oswQmEdobyY+Md1ZqhM7AUuMvg0=;
        b=mQf6zqjQbhPCZNyK1gRggeg8It5KL5sua+lBVxpOiBc/VaOpMz5HVd2xomKuCg5TXx
         9w4naKQFzA2I2Zkqkz+LCSCeizXjDht9zvkPbNrGhFPH6jDwHt+xSQOAlbeiSuB/6dyG
         oTzJ8e0uijH9FS7ncRhxG7OV0187rAGgOw09FUeKwxm6+WbQsx5vBv5DugmKN0F370O9
         uyL45+K8fk1lPud3vWAQwflLmqdosrf9ylSxEYquNRHtjyYupDM0GSvxz1NgKnFW/h2I
         dFOx8uKxjsUt3bdmAJmYkO8Sf1/RdWkImYbvPu5xUXVrSAx6Wa7/Fbw+wKtV6XqpssHO
         RvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152781; x=1726757581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5IKbYoDJEP2KO85oswQmEdobyY+Md1ZqhM7AUuMvg0=;
        b=fr1Cx/nIsYYF/XqlAMFvc5OhYA6UI2JnU4us0XicChj+oNinxH8FgyNEsk/jut1X6B
         G5bh3rcDrGVNdlQklGb7I2QVHf1NNslHHeaYZeWbaGEAH6x2jw2qgtr/mdENaHtthXyu
         yeg30+vWEis6yup7G6puhYIgIa3rifOx4wBqBvTJK+FFg6tX+exhFZpIVDgNfK4xlkVE
         6clKB5KhIs+kIH5A4awB+5th1f/p/Kjwzcy13G7OcaOlELmPrQOcv/whdBU9U9o2x69V
         YSC6bbZb7jJ/Bn496hjWWgeDW46mG9w+NcoxeXQ4kLK59iGS1TZSTdqdVaP8bqrtt3Tg
         hjFA==
X-Forwarded-Encrypted: i=1; AJvYcCUhqvHTTATzCsrNCm16XNBAa4ElnGkFE+v9fkj4XahDjPO/e2BuUwNz87opfbmLiVEePjFeHK1E10+RoCq9k+7VkAudYQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxgBfp6qd5ePY290oLZhnyCdShZSc0QFj6aHd0qWkw8WEYWeYU6
	RdwZIZwOcF+L6zwvvktpTALxcU+3u6ntJc5yZJ4PCZzbddiO3qLe
X-Google-Smtp-Source: AGHT+IGnHgXzCoYLfVO4IAmPffp9UdTT8UdZ3TotNadEvQeLFNoK2/xvDlu0w5z7lWOj456UG/fd0A==
X-Received: by 2002:a17:90a:3ec4:b0:2d8:8509:85d1 with SMTP id 98e67ed59e1d1-2dba00826d9mr3133023a91.38.1726152780589;
        Thu, 12 Sep 2024 07:53:00 -0700 (PDT)
Received: from embed-PC.. ([106.222.232.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadbfe4b41sm12760161a91.8.2024.09.12.07.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:52:59 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] usb: storage: ene_ub6250: Fix right shift warnings
Date: Thu, 12 Sep 2024 20:22:47 +0530
Message-Id: <20240912145247.15544-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change bl_len from u16 to u32 to accommodate the necessary bit shifts.

Fix the following smatch warnings:

drivers/usb/storage/ene_ub6250.c:1509 ms_scsi_read_capacity() warn:
right shifting more than type allows 16 vs 24
drivers/usb/storage/ene_ub6250.c:1510 ms_scsi_read_capacity() warn:
right shifting more than type allows 16 vs 16

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/usb/storage/ene_ub6250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index 97c66c0d91f4..ab6718dc874f 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -1484,7 +1484,7 @@ static int ms_scsi_mode_sense(struct us_data *us, struct scsi_cmnd *srb)
 static int ms_scsi_read_capacity(struct us_data *us, struct scsi_cmnd *srb)
 {
 	u32   bl_num;
-	u16    bl_len;
+	u32    bl_len;
 	unsigned int offset = 0;
 	unsigned char    buf[8];
 	struct scatterlist *sg = NULL;
-- 
2.34.1

