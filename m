Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60ED2DA773
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759318787; cv=none; b=AV4SOF8YOAIlpEWFhii8JWKbEv4MOVt4fYJ6ZxRlZhGFW5/gjnKH9HLCtg4IkNTjiy1gEh6Birf4jLBoUATQ8x/SF+KOTDkfzQHoYPlbI1P1Bxwqq1UwqhFDQUyO8psCIgG1tWdg2Efqe75aOtirI9Y2jeBABWISNPiv+JrKJJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759318787; c=relaxed/simple;
	bh=EZ/ruoFThtPHmGMSXU+ZVodkvu94EYOb1JFHVd8D+zc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mLu8tJ6UIPaRTTVNUz3nrckzFMMTvFx8g14FcROjgGA0oGkoa4zsW7LJaUQJ04M0kR6g5n4FdSg7ZL5dGz0XfuyqeSOlXv3eSraLkT6AHBxJIYwYSymoyzpMU98XoWqwzubXzwkS+/l2573cYY7txmsLfknT36v4+//eKFe5Wxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDN09+Jk; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDN09+Jk"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 919724128F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 11:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZpWhAfGpj11 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 11:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74DCB41270
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74DCB41270
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HDN09+Jk
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 74DCB41270
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 11:39:44 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-27eceb38eb1so84597285ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 04:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759318784; x=1759923584; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucUKCkCMkh3x6kA2pKF0IykrcO1bxzY4CZHYLxDzmUA=;
        b=HDN09+JkEaUizj57OnsN/klNuZ//pU6hwTkf4Unjyuu/SRLurf5HsMPaW2+T/+eLMo
         I7GMlE9af037hqBUed/RjTEInQ5aQY+vOEnt9B+v77PM+R2/XVV7zD+mD/MXugRMHFKm
         rxgEN+EdozGmFU4Otf5ESPavcToiAH/uCQeHcTFLT7bmdco3YnmVg532wIc2dPRxpMf7
         yiy1V7ZeKcnsxEpoaGefOVNtJi50LoGZ2UQfrkoIDEWg99Nv0WKN9cwtylr0fKxT55UZ
         IYHIogFo2eDe/FgtaR/a9RIXxI+uo0NGD365HeYA6y2i0u1I00aYTxjxqoRwJizhez9V
         zfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759318784; x=1759923584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucUKCkCMkh3x6kA2pKF0IykrcO1bxzY4CZHYLxDzmUA=;
        b=suIdAwxjjbOTcGwLUWAUuglHEq0HbqCslI/im4UQPGrHRap/LsgAP3otCj+brv3o9n
         AM0+6lYdgV2ndRBf5FBjxSvwLm9CvrlP7fTIJITszJQhsiXsplB52vGcPTlYkBqiSJZK
         /qsaAILFCYtBljWygYZbufqdMHNDVg7UyC7UZCNWavctAELC2aQmKQi6Lk4vLf0jcVh7
         x6L/JkV25e4dQl4/zqH5XeOqypZmxCNtL1uVGmlelzKmpb66FpqmmxoCCaP6Qlz5r8cz
         y8XFL3cQVc2ayc3efyzyRjb6UwBXA8WHZ/WKsxgUDZRD01Qo+wD8vBnwVhcYmt00qaJe
         Kv4w==
X-Forwarded-Encrypted: i=1; AJvYcCWRz7xhrw2hBCIWmp6aNWi31yilBIramh3TzuCJaaKR2iR1avUp+z/iSquLZe/kMeCGlqHko/a5Bgk+KWSfrtVx/vhS7A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzlyRTLVYoH3JKjugAlVeaB+eeyaQnoE5Nm/bKN0mRnvyIikLpX
	Pw+aHvBU3LxmVcLg8nqA1MT4ivFEBq+m2td8E906GxwayzVdibLdS9pA
X-Gm-Gg: ASbGncvhUxtAbqEKKRc9wDAjqFpbKEXpCnBaI6FT5ybjSI6b+f7s/SmZpsBARdGwr2R
	Bvf+8Hj5Y0g6fzShidnt/eFhPu2ybGXjJ9tcE3/yAABa2nDtaocP/TTuQHY42XF7w0MXYwNmrDw
	+emIJpdvsS/tOOq3owIWLgG/Ge3jMR3Pe7+6PaKzyemorQG4AI716JGmhn8/PGC6UgZUkXXx9xf
	KoMpqNTWr67VuKya7TZdxI6fr96D2H0A/RmP6YHq4sTcpeyvaE0wC1bEJ+0uwSVsI8H5nDbQt4U
	Sqslq0lmVIeziJQx4LLg9ogR0BzmrSwcv3xPVEPDCkVciybMp5U1/cuvUDcJqwH/A7bg9kw0Wvk
	chT0qVL7J5rF85rvhTSg+rsmnjYXMg93x33bN2D3lFB+y5h82YiSPUlPSv6z6JFo7MtFd5b70dA
	==
X-Google-Smtp-Source: AGHT+IG+vpAX3tAnKfYzMMgoEqi+4cPK2iHVtV0PmHOHWt1nTyquJ83FzARzXBcYPKEjPuTIuKYquQ==
X-Received: by 2002:a17:903:b46:b0:252:1743:de67 with SMTP id d9443c01a7336-28e7f318717mr29455975ad.44.1759318783552;
        Wed, 01 Oct 2025 04:39:43 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28d195d5583sm53135215ad.117.2025.10.01.04.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 04:39:43 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Don Brace <don.brace@microchip.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	storagedev@microchip.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com
Subject: [PATCH] scsi: Use kmalloc_array to prevent overflow of dynamic size calculation
Date: Wed,  1 Oct 2025 17:09:35 +0530
Message-Id: <20251001113935.52596-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kmalloc_array to avoid potential overflow during dynamic size calculation
inside kmalloc.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 drivers/scsi/smartpqi/smartpqi_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index 125944941601..7ff39f1faf38 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -8937,7 +8937,7 @@ static int pqi_host_alloc_mem(struct pqi_ctrl_info *ctrl_info,
 	if (sg_count == 0 || sg_count > PQI_HOST_MAX_SG_DESCRIPTORS)
 		goto out;
 
-	host_memory_descriptor->host_chunk_virt_address = kmalloc(sg_count * sizeof(void *), GFP_KERNEL);
+	host_memory_descriptor->host_chunk_virt_address = kmalloc_array(sg_count, sizeof(void *), GFP_KERNEL);
 	if (!host_memory_descriptor->host_chunk_virt_address)
 		goto out;
 
-- 
2.34.1

