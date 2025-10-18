Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319DC27B4EB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760816870; cv=none; b=F7GOGFyZht+VE/I/RuDB/AtvfyoDxAKb5NPHXYDK3fpQvTfRbSpFpJIRkpDn9fJHVaWymI5FE8DUXzqwGKII7UlcHEdldebRYSYhSYPuIwX5CrpfkTkSM7R/jJ1FTPpQSka/WqYL6adt0cuYeYjUd7qo2iBfsZmkGlC+lFYdKmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760816870; c=relaxed/simple;
	bh=Cfl4Z2FbFTuUkk0lsxnRbzkKFuArme+w8C49aQPGsGA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EeQBob1L+B5WwNrOcB6clZotg2V+B1RwBpsYpr/dWC+fvdb7z6eBAahqDHVCTufAiv1xWqCPvF55KbAV+rs/Ojim3q1xdqJQzl5Bi14K9elS/oFHYLCCp4M4TwzlYm/sCxC/cA4tPheVOdSvJnCivXEyerhkqdCmYpLnv7WNgdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESJro6bD; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESJro6bD"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D77140521
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 19:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHiz5t9-uwfQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Oct 2025 19:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=kriish.sharma2006@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFFBF40519
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFFBF40519
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ESJro6bD
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CFFBF40519
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 19:47:47 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7930132f59aso4197389b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 12:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760816867; x=1761421667; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5yV3R8MF8NT84u8F8kj/y6IDmqDUWQnCYW6rOFqRXs=;
        b=ESJro6bD7IOpkiugQ8A/Zk1CpAEsJMqhthqf7T09yhAuMjPORhzU2SzwlRVCH5QiCI
         5yiVIsZSJwQAtKHnyoShVB/RfwBWTQ3ApEcDQXNZTTHmnRm/MQLgL0aSgMLMf7JOMq1h
         rkE8im4wQzJNehfR546JDgKwxMK//AgoQKG2XgzmqyDq2n7Mcy6y3U7bJkQZSNIch+mb
         DoBHQShO2pevJTB/jYl9kd8zmFBicAwck8C+6d/A4RdZ931HU8jEEeSkQ4FklR5W1lcf
         BPAlZW/uvmT8OGqOH9am8DpjWnoFvHY/G21otP6uZjyqYiOHQNmje8VSykok/8XD1aBo
         SoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760816867; x=1761421667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5yV3R8MF8NT84u8F8kj/y6IDmqDUWQnCYW6rOFqRXs=;
        b=pPMW4wD1LE1TLVMXmImxtqN0XKKEW+9iwAFqweAPmWO1O/2uw1dmRxs4pYfBV8CWGg
         50vTMsgrWa3Litd1UEZ18pZ7R9WYMPBScjnOR49gu76uey08nwdXBFo7wIk3knG4l93z
         NgzsEvN973yK+ZP2O2Awn8eOCte+tB8SDBnUWO7g0gHYAuU1MQ9Kzm8pLrGP/lI+xWxZ
         1AwdT8Gmy+Z6CiOy+KqeSsn7XUDSomdIWWoO4laaCdK1ubj/tlKv0NpqNCypg0roFvgC
         ybZ5wna5ddPAZCZG7ZYJ19lwODHBC4C6fL8ncDGmyS6JdtkwYZHRKfwLUuW8n4XyoxoL
         oEig==
X-Forwarded-Encrypted: i=1; AJvYcCXZ1as6wMyTPQGBiJGfOEYexHZZogSn79T6EeT1dtNAmDz6FDnhr+He8WuITtj9awd+sj/6k76cgHYOR9xPL1S8UIHmjg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzWpuFDby/AtfXVyzhSk8X9323i14eV6NbXx45dmv2/1p7wuq2M
	x03at4wwsYGWaigA2of2U+Ii+3/uUP6pYovIIoY4Z059iG31JGWMjivX
X-Gm-Gg: ASbGnctsT9Mr3H3u9E2huAyPEl6hjD3hvPILXgwUDGx4ML3eNIaRAiLvK2C0gVncURu
	aaBnrJjax7MYJYlV7k/Bsh/N1ZRPnZbeyES2wuFUAQI1LOK2Q3+sUHJjGuhuwvq6OpPOQFysbzq
	GB2rvpBeSykiRnXzr0nZyO4BeMYyM+OP1KacSjdnzwZoEhXD+2secggjuvfie5sMVHDA0qwrHOD
	BPFh8DT/AdIefQH1MbWqjq8yiz8sh7mKcHqyOWJVqNAuQy3S9/LaF6LN6VBJOzZSKdOR3yrDCGY
	aq7tSWohAeATGH6NyuBEQIhHcECuxqqaxL6hNfL67jLWA/v7zfx1Kh8lFRSDObaAcr2MeYGJt2K
	RDy5ZsU4YIgdB0BgTkeVopxunmUK0xKpH9TQZupQassZZPJa2WYUYfQfPiLpgOPm5iiH9sf9/SL
	6TPs6oTmwRez/qhAeFZctkHuGZLC9U
X-Google-Smtp-Source: AGHT+IG1Pua+a+sQ0qZ4QW/DYh0Y01qkTB8IAIZS/QdD7Qby73bidnVcHrczxog/3EXRJO12bNVf0w==
X-Received: by 2002:a05:6a20:12cb:b0:2ff:eee8:abb5 with SMTP id adf61e73a8af0-334a85fdc5dmr10873862637.60.1760816866916;
        Sat, 18 Oct 2025 12:47:46 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f25b0sm3502738b3a.49.2025.10.18.12.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 12:47:46 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] xfs: use kmalloc_array() instead of kmalloc() for map allocation
Date: Sat, 18 Oct 2025 19:45:28 +0000
Message-Id: <20251018194528.1871298-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using kmalloc_array() better reflects the intent to allocate an array of
map entries, and improves consistency with similar allocations across the
kernel.

No functional change intended.

Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 fs/xfs/xfs_qm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
index 23ba84ec919a..34ec61e455ff 100644
--- a/fs/xfs/xfs_qm.c
+++ b/fs/xfs/xfs_qm.c
@@ -1218,7 +1218,7 @@ xfs_qm_reset_dqcounts_buf(
 	if (qip->i_nblocks == 0)
 		return 0;
 
-	map = kmalloc(XFS_DQITER_MAP_SIZE * sizeof(*map),
+	map = kmalloc_array(XFS_DQITER_MAP_SIZE, sizeof(*map),
 			GFP_KERNEL | __GFP_NOFAIL);
 
 	lblkno = 0;
-- 
2.34.1

