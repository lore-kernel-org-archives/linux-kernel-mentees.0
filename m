Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8542D7DF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758730003; cv=none; b=N/+g44zZ2dclrEsFgjlosJfZF2Uop14WRLjT+yBFWMaghmJ7HelwO/GqPNBNl+HatF3Vvk9CfKcb45+bfPX58Y8yhd+wX56VNGTgHzfYGpl7va2Oivx7MGu69WmVHIYvMg7xSo7YZs92/RxfHXdUVrCL5WJ3RgTf1fedbomEzTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758730003; c=relaxed/simple;
	bh=YIxKVzr9qaXBN0ZylLrG8vLvgAuwWPudPeCshwDYBxU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xjovj4HIgvzqkLgfq4UDxRTPhmjxAqg77e+V72f+MC/MeDY8BY57zEoYt2CZeSQbIkQp76vE37O+LYDgWRY5ytCpHJfuKdmGaZCP/ED/2D3UMRwrB4o0vRE6FmodTA6+9QqRSG29PWrwyMk6VWy6GgYWBGApYHIfcJ1PeRLflYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDUia5O4; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDUia5O4"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F0DC40DB2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 16:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vru_1H1UR2Ph for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Sep 2025 16:06:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF82B40D48
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF82B40D48
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FDUia5O4
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DF82B40D48
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 16:06:40 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso4283600e87.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729999; x=1759334799; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KAxo+DN0iB6IwYVHObHr0a0ySgSeQeXI1l5BX4eIFNE=;
        b=FDUia5O4XuOTT3syzyF+lNbGPzGcEsZu9hBAw8H+PuetMLjui+q8H1Ynw8ErOfZ/A3
         K+OqDfJzxQCO2ImvBQIdR9yJlvfoDzzJpETEmorX21tBfGWFJs38yYb0lZLK/mLUqaU2
         u082ZqQ62wPlyqDIFkaesAcXM7gW108DMOj16dZCBSsiGlOwjiKoaKRXs3FSVQyS4O5k
         FC97w4JsMS0U8lvWagTELTIMf8UvSNGYLkDjFwbbdGbXfDCsBaC05ludmdngojtgtvgW
         9VORdPug2dGcuh2SCNlAqr3AgMbt+1bazAN+XjXiIuz8JAdoJ6rLqUjKUhJHEPsANjI5
         u4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729999; x=1759334799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAxo+DN0iB6IwYVHObHr0a0ySgSeQeXI1l5BX4eIFNE=;
        b=WRc4sIR8SVBnIf9y0CjGgoxcN2uHGsZYscOQ4M4M4DmdnkOqw8JyjjEtshkSPbSB17
         nhMDmygGmSVglqSqqs3dCq1+hxSHdAikA4XlTp9nQziJGvjda12WbYu7X1oGQyvT6bAT
         /A7eLdXuhEeuC+nJiZl99ZO53rD/npyTn3L99UDbh7hSaPhCF61C4e2nruueQlEmddlP
         lTftMatsIxkAKPEFQqhkBXYBGbxD3trVsWRYf/FpPEdXfSDGrq0wc6cFA5nrBJ1Hx/iz
         Jka3SKVwGEpbjJNBnvUIQ8MB36BfX8n2Ro3S4opwb7hV0DJDNQ/6/C8onM/nlTBTRYv6
         b0qw==
X-Forwarded-Encrypted: i=1; AJvYcCX5PW3uWlMD0Gb4zXVZPha/DkdLWfRIqa8dz7Thyajjg8wqDBArvbjKGvqXeQHioFhkB6CSf9UqAG+ZZTSxlwr3emiXqA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxHq9fE4l5WsRVjkNsNZTp4qQamt9ksCp0+/UmDfRMFN8JUtCmF
	zkBle4JJit5GMoczxsSMUyocJ4aO2sdnGSEOdmzTt70v2+THqCsUd0Ce
X-Gm-Gg: ASbGncu8ka3/VvSL2E5+WFg7bvOUbS6Knhk61i1i4C3PyAcW7pNtbtcMexCtQWOL/Bb
	OKCa2xJrFjrl5neKGArJ+IusPdFLIr+ba5Dv50U33qimDriiwgoJynsdsYuvbmAKd7zVORVmykf
	BxIPnn+wDpbkWz36DwZCylZr+NwsnIrN2toFwBJlLIVgACs7h+ZgeaLLcr9CrVoK6anZTKXWoue
	PoiJ2H93ILzyX/LkVIPmicvCBOmtE6SOwYJKM2wxpoGKbBbXIcqNyLmjqSGEsHdINYvUSCLQ+Pi
	mSjGhHChigT4WM2tbrPZBpmo3q0D7bdnn4JMkIoshB2NcN2sNk7H7fyqb1wlBSlgumbdSN7Tuvw
	/AMTmHHVv5pHxug5Nv0SmCDLZqjq26tFW3s1Os7Yak0gkpGdSdpUNTIwrqBMZjmIip14SByOILf
	o=
X-Google-Smtp-Source: AGHT+IFDBzKsODxZa5m6nzGg5A7qtS3fuJNPx/zQKV/tyVpLAB1PmpmnTWNVaKa6Mdu/j/mesTokIA==
X-Received: by 2002:a05:6512:3ca6:b0:57c:2474:3734 with SMTP id 2adb3069b0e04-582d2f24cbfmr4630e87.37.1758729998141;
        Wed, 24 Sep 2025 09:06:38 -0700 (PDT)
Received: from localhost.localdomain (host194.safe-lock.net. [195.20.212.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57bef64ecc2sm3414595e87.129.2025.09.24.09.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:06:37 -0700 (PDT)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: sathya.prakash@broadcom.com,
	kashyap.desai@broadcom.com,
	sumit.saxena@broadcom.com,
	sreekanth.reddy@broadcom.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: mpi3mr-linuxdrv.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH] driver/scsi/mpi3mr.h: Fix build warning for mpi3mr_start_watchdog
Date: Wed, 24 Sep 2025 18:06:35 +0200
Message-Id: <20250924160635.27359-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix watchdog name truncation.

In function mpi3mr_start_watchdog, watchdog_work_q_name is build
snprintf(mrioc->watchdog_work_q_name,
	sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
	mrioc->id);

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 drivers/scsi/mpi3mr/mpi3mr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/mpi3mr/mpi3mr.h b/drivers/scsi/mpi3mr/mpi3mr.h
index 8d4ef49e04d1..5307fcdf216f 100644
--- a/drivers/scsi/mpi3mr/mpi3mr.h
+++ b/drivers/scsi/mpi3mr/mpi3mr.h
@@ -66,6 +66,7 @@ extern atomic64_t event_counter;

 #define MPI3MR_NAME_LENGTH	64
 #define IOCNAME			"%s: "
+#define MPI3MR_WATCHDOG_NAME_LENGTH	(MPI3MR_NAME_LENGTH + 15)

 #define MPI3MR_DEFAULT_MAX_IO_SIZE	(1 * 1024 * 1024)

@@ -1261,7 +1262,7 @@ struct mpi3mr_ioc {
 	spinlock_t fwevt_lock;
 	struct list_head fwevt_list;

-	char watchdog_work_q_name[50];
+	char watchdog_work_q_name[MPI3MR_WATCHDOG_NAME_LENGTH];
 	struct workqueue_struct *watchdog_work_q;
 	struct delayed_work watchdog_work;
 	spinlock_t watchdog_lock;
--
2.39.5

