Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E6E16C874
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722277438; cv=none; b=qh7FafpEpRnJbH+cGX1ByEUv82cZrpjgqYVpQSRxv/6zitDgZV4Dk+jIvvZXTaIoHYE+Z+a8DQlHBHRKhwvQt6ez00WYBaXCjkfLN6I1q+kp++2Pac03Yqe06avXwbAF2HgLMuiBhYEjiMV3PSyaDoRgVG+9GKjxD2malItuVDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722277438; c=relaxed/simple;
	bh=MPHG3o+R/QFUrik3POHpb8zmr6Vkpss+gxkQBRrzTJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J7ft5efGwxHpVDwLhHANBqnxYZgGGH1I38YV6FCDigeo2WT3YmmPLlxZiI6Pi8GJLFhsaESpXucsE/AbsFOhQqK3MT9cW+P2xbOYRgRMYO3IStHIwdgkg1Wld1hXW41Kt+3Jnbnu4n9dnhKg7BYs0j596t35CfGki4rgxnIJkj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuFikERu; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuFikERu"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B69D40391
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 18:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKLgNnxLdrQF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jul 2024 18:23:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83B4D403A8
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83B4D403A8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PuFikERu
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 83B4D403A8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 18:23:56 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fc66fc35f2so21330505ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 11:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722277436; x=1722882236; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yemLqtqvWl8R5S6sIbsu7pMycbwVn/6prDN8HksHxqM=;
        b=PuFikERu+05zgOxyBwtGf9Ed2T/14sBpxniS8JFsI/ii1FzcMH2jV1HRskXvQQEXGF
         wrXv2gKgZLrl4OigU4kurrNCKSJgSaJgIL1KMx/Efb6m7LXCCyVXIqqUx4AMd9kIpT5b
         Mn4iJ3xHp6wU+NhobPiGvUkdiFFnlnrL+E/tZ/cEW+1qWi2bd+HJuXHJlMrhR/WgEVnu
         EdJFM7QSB09RGWzqRAh0dik2F88JDayVv6jDGQgTTKc0wNzdTNVXIuBzGpiIHc2QowIo
         T3jDGYSfGjbqbN09uFwNPW1AWqnstkCdBI4TfUvzYidju4tROnGrsqikknG7ji96o3vG
         2+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722277436; x=1722882236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yemLqtqvWl8R5S6sIbsu7pMycbwVn/6prDN8HksHxqM=;
        b=YKGuoj/mK0U7zs9iG672pZtm0vzGCt/dX48Yh5IvhfvtlaszoldW0Pyu5DB1bLffol
         Lhy4v9bXVq7+2+xBTMWLuwooSWsyzOfYMt5JNiRVo8TvN7LnC9bOYMKCq3cgSHfB/SfJ
         M2h40PNMQH5s57W9/jJAjNUw5s7RuY++oQutmlatB1DqfXZ1+tR0JSy85GvGRX1PA2wz
         mhjOpZ0+CdPVHURRnUac8YbNyQEYTgCMop01UV/FCd7O9XCW20qu1DHQPHQIbtaYvpGH
         ZzKmmg7qxQL9LXcjjLFUbqzHDMO48JjIV7X+s10agDFAza1oscp8u7NFwZE+4FQidrkK
         vgWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeZGYszM8LbFm0RIox6TWKsFeXuK53/C+apstxodllJG5JwjZR57IO//OKrq44OheTq6BQPxHg1JLch8wslQbpZIz5TRskW6C3wlaF16QxUgSzJgexFY9h+ObHlInl
X-Gm-Message-State: AOJu0YyRkMoD3BUrE9gk7Hh5Cdz9wgyOhIlWbmp3QxtttjR7jwCb8JYY
	fhSarOQlNIM1DYpEiF0JR1xzoNfJZM7UO4FITYYpfCcmD2WYjymB
X-Google-Smtp-Source: AGHT+IH9+iUBJzVZU1XfIa0JLsbNv0olGSFfaWJAbdv0AQIjRWjfQ4jQRRWTZK213BA3ZnX9F8rSog==
X-Received: by 2002:a17:90b:1a86:b0:2c8:2236:e2c3 with SMTP id 98e67ed59e1d1-2cf7cf7fdb3mr14524692a91.17.1722277435364;
        Mon, 29 Jul 2024 11:23:55 -0700 (PDT)
Received: from embed-PC.. ([106.205.109.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb738fe04sm10925787a91.12.2024.07.29.11.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:23:55 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Date: Mon, 29 Jul 2024 23:53:48 +0530
Message-Id: <20240729182348.451436-1-abhishektamboli9@gmail.com>
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

drivers/usb/storage/ene_ub6250.c:1509 ms_scsi_read_capacity() warn: right shifting more than type allows 16 vs 24
drivers/usb/storage/ene_ub6250.c:1510 ms_scsi_read_capacity() warn: right shifting more than type allows 16 vs 16

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

