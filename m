Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BBD1862A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 06:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759386647; cv=none; b=KaAfqPuSWxObwpr+RcuwWQ/sKkDp7G3igqKRo2O0xAhIRXwDrwceKM7CSfcpWrGL1TWFDe38qKw1VOcLT/3Fe4oh3vR1KKdgmZP1sO5CX8J/9TKzDJzXwwly42x4/9jetlBdx70V1Se/1uvuqqAEQpRnwAetrCIrcTDe89ZdQ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759386647; c=relaxed/simple;
	bh=YIxKVzr9qaXBN0ZylLrG8vLvgAuwWPudPeCshwDYBxU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=abCezcvtFcDKsITJNPdp/1+u2juH1sAo13qlOhxPpe5mZO+iJcJMDbE5w4RYhuiPywHl9OEkUR6fldI3UZAtVn3fl2MjR/zD+QzNpgCDGxlRtranLU7XrfJGhP0Uq+iWJ2Ho3Tj9/MPvHWoQCAbiZ0hkSA5hhWLX7SqZfCq1fBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdFiuGVL; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdFiuGVL"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ACB840297
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 06:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_TNW9NhgHQy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Oct 2025 06:30:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 385604009A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 385604009A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EdFiuGVL
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 385604009A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 06:30:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-afcb7322da8so139677566b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 23:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759386643; x=1759991443; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KAxo+DN0iB6IwYVHObHr0a0ySgSeQeXI1l5BX4eIFNE=;
        b=EdFiuGVLSe4VC6jPABkjdxNhSX8P8/d4RdLdY7KpDm7/9IFnoXlWg0a76uTV3KaEij
         MrQgEtvpRycxh7jGsGsyGmlBXW4rqwkBAsJcQ0Z8t6EQz9gNWALLV+zo15yyKo0at+kM
         ANAssq1a9MKOrHQJApi7vug3Dy2W2dQGTeiviIpuHHjSoXB0MAnMk5yLZ0oV1qpaaaVv
         jxeBQyqLHDph650wTWP3puKiV50mctiTCc69ST10DuDFItZ6azhpqjePmiKlGo8Mlr8f
         3783Py1eLBWk6hrgIGuJFQdMTzn5p1sc2dPkXu227MUkqqYs883g47xKScWTwI6U+rtD
         V4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759386643; x=1759991443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAxo+DN0iB6IwYVHObHr0a0ySgSeQeXI1l5BX4eIFNE=;
        b=LljViVQzBp9OAsypMZKXwYTfnHnFvN7jl88RcVTeRJRnWv14lLpEkcDVHDhfvLeNgB
         k7aRAaMq47X7akPvVTX/n2zdfDKeE71wrYIxkEHeKVjTzxn3/4Dirf6qhoHusYpRSUSF
         4wE/mi86y8I52mz7FsoZB7X7IKPX5vts37WHoduCfURYjHrD6o45Sh1n7GYe5HVyzgma
         DY11BeUgUWXH87ThrVFYQ3mb6me+EkANd/zXIsDyS2Rwhto/UILxboCbRQNqKIapHIzV
         iYi967VDJ7eTKqByW8llb0muFXRpf3rY7BLHJiFcLQZcDL2KK1x4XhmASU0hBAvSNb5M
         Dvmw==
X-Forwarded-Encrypted: i=1; AJvYcCWAt1nmUW5ysffoYRSr4j8A8C1rtkrkH0oNIPdPedmEWXx4wm5x9UWvGFreynsioOp6cI/fJQksmKqO2n/6zmgoqAbOEw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzm0/MZuRsmqOxcXlEtKFWkrkNAga9qGS6NbmbC45tT66NFWFwm
	hNf5G2qbqTBJ1pWoQ3UrxuTxUBy6F0Zlz/zvwR1bHXNlykcmEsRvC1Qx
X-Gm-Gg: ASbGncvS0n2igC7tmyV7XZBGeJBPtcghqlCPzitNey0AApTBndxfdEcFST8F/7jGdZz
	zAA1vcLwltscAjoEaUpUmji43ODQgoA+g/jNIzkTiQXd4fKxliVf+NKzjoN4yIpuOvhR+tfyqCe
	+aanvrjeYvktH76OwGxPAikxGn3OSFUpt5Imo/IxPM+SlGtjImHEpVa0KEpqSLlrPi69zOZ36Ay
	44bw7UnXN3NgPVcgKF7F6K2FjqvG1xOdZbcizaoZvlzywt9PqaoXBrVuinFu4x8702gQUBK5t6o
	o5/I8JCyVOpnai6k3qZXmeBx8AmjLqfPhl0tkMF3n+wpow94lgltPi2L/JDK/cTJ55rHtNfSiXC
	7ERBel6+UGWenHX2yn3tFzEQJetetSHXIdQMb+eIK0R4BUbaoSWvmKoUynkRGvgAQ8Fe91vhivk
	ZNjG7QjLEJxAqPBjk3Zjx7GfJvZFnl/w==
X-Google-Smtp-Source: AGHT+IEJ4e5RsTkszdNBup8ct9QWtwmGLRs7pM/Ik8mg+tFniTBcoaDxurre2cHsPZE3caW8pu/D7w==
X-Received: by 2002:a17:907:944e:b0:b3e:5f40:9894 with SMTP id a640c23a62f3a-b46ea31d2abmr807245466b.62.1759386642808;
        Wed, 01 Oct 2025 23:30:42 -0700 (PDT)
Received: from localhost.localdomain (user-46-112-72-121.play-internet.pl. [46.112.72.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e78242sm134271266b.35.2025.10.01.23.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:30:42 -0700 (PDT)
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
Subject: [PATCH RESEND] driver/scsi/mpi3mr.h: Fix build warning for mpi3mr_start_watchdog
Date: Thu,  2 Oct 2025 08:30:38 +0200
Message-Id: <20251002063038.552399-1-kubik.bartlomiej@gmail.com>
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

