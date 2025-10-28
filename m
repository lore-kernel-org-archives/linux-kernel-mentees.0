Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2693A336EF9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761663353; cv=none; b=H0F2bAykDNhavFkI9l9jQyUq23RQLw+Bdn5g06rTT/0DGQX2KHX7lib4NC95xuCQj7WitBDuvWUTpsHOk8RDdfXLKoqOd7P6QAwr7fxbi+Tvnw5FTIEBtW8HN2Yu1dzBMHkzWG1x+2YkA53ZfL5d9GSDH4pypgnvgYL+b9Yju0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761663353; c=relaxed/simple;
	bh=4DfI7OcUnB+kIuMTQXNdtCg+eWdy+FCdGYX959o/v1g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=c6McA06lxQj7K8b1AbTu2Ge3MTxQzruyn7Pi7lkMMhZ1BL9R/eVgsmd8F571uWuaYvnMGf2khtARYck87rP607WUcXqml/Oe2x4BZ4CuVWnCfXXbkO+SXireDzRV2AONwI/4kHthvLVBj/H5Yfct2FgxKO5Y8MvZqtWL6nrB7AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsvWrLjz; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsvWrLjz"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA146150F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 14:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9CpzoYY8mpg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Oct 2025 14:55:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DFA561507
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DFA561507
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WsvWrLjz
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8DFA561507
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 14:55:50 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-378d50e1c77so55385901fa.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 07:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761663348; x=1762268148; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cxgC3Ar205SePZa68q9SjHUQRYO31L1UuAjDONdLHVE=;
        b=WsvWrLjzzmakrKe47ZgP69ZwvrQVgBL2eqmIPJ9wcxdECOfagNuLtB9R9cJV86ye9D
         qsOSBzoI0yfc+YC3IlLBfqZuJn6+8iD61+iMb1u/KYEO+sOfXfLPZ5oB/PoLfrseKOi5
         9OB+H6OVb10CHHhRhU2+LVCzThIFHbCCLgwLSrLsEJGV1AnVWaDZMVMlLiDI8veOuboD
         ht31Z762Uuk3axDo1ZTq++ymxaSPBybPNbUNMC0j9nRQu4T00xwrQieNG5grEl1CW4oA
         Pjbd7KQRHMDUmmxl2hk15HRNzLQZE/JKLc/SblcLTXkr9VwW1NVzu4q0XpU9/imZlNkL
         fOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761663348; x=1762268148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxgC3Ar205SePZa68q9SjHUQRYO31L1UuAjDONdLHVE=;
        b=QUwy77kIx4D5oq7ht9H3ikzv7WMdnnNUO+KzJw4nHtFqRVLsvzb/HLD8A7gLnU0E+b
         rV/sHngYInMHMn0WdrCxnwnQgNWVtjNZUyiclLBk35qYrmLNpIPXZmDdTVnY2OievrPi
         9waHxL544H0GNjE+OggxqpkW8FQFlMvCGN2krS9RKN1BQNmsa4t0Wa55EAJGcd5HKBjp
         JF8AFVVDP3nCHdY7fACPvi4TYuttzJg78PL3PCiZAClG7goDjMc3UoID6u4KklOAPBoJ
         +zJQIpIo1ltFCgHlU0ZPCjiKYpzcSGJwsJwlW+/07MexzgdR3gj60CUHCz4Hkzl9057t
         KHVw==
X-Forwarded-Encrypted: i=1; AJvYcCUJqzrD55b7nfjXm0Cz1JoYyFsxdOdYts58t6kPVdGorrfA9amdlF81vfytNdVtuVSLAV1NoD6AHh12zEcW0z1wmpIsVw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzlP5LrD7r0zUnwU2c7xTMv/mZqdgi/cqGPllwzSAiJrxxLzWS8
	HRUhhhwJmJzDyoNtg/Gygtpq7DWQUxIM2DRoE+TFCmnMrIHjowpz6rpZ
X-Gm-Gg: ASbGncuVP5qNi6dms/P5EQ7K+tTMydl9N2mf8SNP8RDb3Oyh20Agsu5rbJ109O99kaV
	vuybQF/Q0GJpkqkanAWLdd79XYUXNnUdxuuWfjp8EOGDZKXg3iVKgA8mANA2ZiueP0VwiXynhK3
	0p9pc5HxCkLvGQWf3IPZ4ggyIwP4KtNCpKYMJhtsKobDoiotKFMAygXADo1POB8LBjfonBvk6sx
	z/QpaGOa+l9qPBxMg3355J2qoyktjMf10XcREYzRz1fh+NH18GKUrVy6iqZ76kU86MHBcNX4CW8
	oe5INy9woVDuskMo1tZ/aHL+x2ZUIENzQ0TgA+hWl3PzEY/jbXosJ2rSmus0iGWaDMw/ezrNAQF
	IPYxTFxHO7tj1R3PG2PLGLL334PqHFjbnAJsn0dhtRRLhSZoVnSGs+Ujil93tC+PeQB35vBQjG8
	J8tr46OiwSEXe3WIbwPO9LCWJ0xpGl+TD19/GHtG2NAYix5w1GcpEjrzxfzw+eG6EvqIygZ+9xJ
	zbBZtsF7ull0/7M7fKP5eDEPrP67TU=
X-Google-Smtp-Source: AGHT+IEYtMFNcBTkx5BcQJAnt4IjKAPptrA7hwRAVKe8cUNymnzw27KPZxunv/Xg4w6rE9Z8xlhI2Q==
X-Received: by 2002:a05:6512:b05:b0:592:f9f4:7932 with SMTP id 2adb3069b0e04-5930e9cb1ebmr1304002e87.33.1761663347674;
        Tue, 28 Oct 2025 07:55:47 -0700 (PDT)
Received: from localhost.localdomain (host194.safe-lock.net. [195.20.212.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59302878849sm3082988e87.80.2025.10.28.07.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 07:55:47 -0700 (PDT)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: sathya.prakash@broadcom.com,
	kashyap.desai@broadcom.com,
	sumit.saxena@broadcom.com,
	sreekanth.reddy@broadcom.com
Cc: martin.petersen@oracle.com,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH RFT v2] driver/scsi/mpi3mr: Fix build warning for mpi3mr_start_watchdog
Date: Tue, 28 Oct 2025 15:55:34 +0100
Message-Id: <20251028145534.95457-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC warning:
drivers/scsi/mpi3mr/mpi3mr_fw.c:2872:60: warning: ‘%s’ directive
output may be truncated writing up to 63 bytes into a region of size
41 [-Wformat-truncation=]

Change MPI3MR_WATCHDOG_NAME_LENGTH define to properly clarify
the required buffer size.

The mrioc->watchdog_work_q_name buffer in
the mpi3mr_start_watchdog() function no longer requires adding mrioc->id,
since mrioc->name already includes it.

mrioc->name is built using:
sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id)

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---

I do not have the hardware to full tests it.
Tests only built kernel without warning and run kernel.

Changelog:
Changes since v1:
- Add define MPI3MR_WATCHDOG_NAME_LENGTH (MPI3MR_NAME_LENGTH + 15)
- Change watchdog_work_q_name buffer from size 50 to MPI3MR_WATCHDOG_NAME_LENGTH

Link to v1
https://lore.kernel.org/all/20251002063038.552399-1-kubik.bartlomiej@gmail.com/

 drivers/scsi/mpi3mr/mpi3mr.h    | 3 ++-
 drivers/scsi/mpi3mr/mpi3mr_fw.c | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/mpi3mr/mpi3mr.h b/drivers/scsi/mpi3mr/mpi3mr.h
index 6742684e2990..be15d5ec8b58 100644
--- a/drivers/scsi/mpi3mr/mpi3mr.h
+++ b/drivers/scsi/mpi3mr/mpi3mr.h
@@ -66,6 +66,7 @@ extern atomic64_t event_counter;

 #define MPI3MR_NAME_LENGTH	64
 #define IOCNAME			"%s: "
+#define MPI3MR_WATCHDOG_NAME_LENGTH (sizeof("watchdog_") + MPI3MR_NAME_LENGTH + 1)

 #define MPI3MR_DEFAULT_MAX_IO_SIZE	(1 * 1024 * 1024)

@@ -1265,7 +1266,7 @@ struct mpi3mr_ioc {
 	spinlock_t fwevt_lock;
 	struct list_head fwevt_list;

-	char watchdog_work_q_name[50];
+	char watchdog_work_q_name[MPI3MR_WATCHDOG_NAME_LENGTH];
 	struct workqueue_struct *watchdog_work_q;
 	struct delayed_work watchdog_work;
 	spinlock_t watchdog_lock;
diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c b/drivers/scsi/mpi3mr/mpi3mr_fw.c
index 8fe6e0bf342e..18b176e358c5 100644
--- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
@@ -2879,8 +2879,7 @@ void mpi3mr_start_watchdog(struct mpi3mr_ioc *mrioc)

 	INIT_DELAYED_WORK(&mrioc->watchdog_work, mpi3mr_watchdog_work);
 	snprintf(mrioc->watchdog_work_q_name,
-	    sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
-	    mrioc->id);
+	    sizeof(mrioc->watchdog_work_q_name), "watchdog_%s", mrioc->name);
 	mrioc->watchdog_work_q = alloc_ordered_workqueue(
 		"%s", WQ_MEM_RECLAIM, mrioc->watchdog_work_q_name);
 	if (!mrioc->watchdog_work_q) {
--
2.39.5

