Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B984E19ADBF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Jun 2025 18:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751221502; cv=none; b=X0SerOFecH2z05R60OjTUXcT9DGHcGqrEHE/tGNpBrqRB27jpfWyIgNLudbzaawt9TfqwDAJ3DC86NtBH8BlmBBv2xfpMqsDPmw/6Oxjz9um6l4TaTCEyrcfq8LHpYK/21DOG+24jxZ83K7gF6/x/09ajX8+wmZQ8SyrTjakdAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751221502; c=relaxed/simple;
	bh=DhBKlmjLOiyFfEEsVCIlTdKsD++1KdN8yi/Q0MbSXQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PlBxkXuzSP3aSrwECJsELjyATlX76QhrD7oJi2958DES6Hz0NC6gNHr5UMryQmDKyoOZ92R6QGR0ZLIPsa0CQ4TPJ/p2W6fOgRc9zOxs8fh2rG2GM7JJRNtdNIr2xR0TNWN+fUWncr+Nrj4s8O3fnyfD1uc7NzxAPk/9aUwPOIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ygmag+qu; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ygmag+qu"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5498D4038A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Jun 2025 18:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgThhhH6tiFL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Jun 2025 18:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B21F140388
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B21F140388
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ygmag+qu
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B21F140388
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Jun 2025 18:25:00 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6fafdd322d3so17126196d6.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Jun 2025 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751221499; x=1751826299; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PCn0+ucEkRvS1MPOQbl5PoaWNKu1L1cu8L9SbyabJaI=;
        b=Ygmag+quPooCqR4VdArgb+s7cIFfXBzzrcZp7Vy+HTEbLW0y1SHi7o6mOcR+1lojfU
         EM1cQvrOmTm0e7ijB5ByibGJ3zKFmwozr5SZU98DAIrVBE3ktzPvRyoZ5kO1l1NIpawd
         v0lqOr9P9Q4SSxzj2j81n3ogg/XhryOJw+0OPKJV4ozFYo4Fy/VOwcxTH+yVy9xnY0xZ
         6XCfKJrOgDmLtI3x/+o2pR3C1+Y9govxEqbp+HXM4oM+yDFxyZELBUj/ATh8whmwm/7V
         D90p6a8jrvSdhj/Jgk823tZ4pfQv9pzQrp9Lz+3JMHuh78byE4M4ojBKOJjEkng1/vLp
         qJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751221499; x=1751826299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCn0+ucEkRvS1MPOQbl5PoaWNKu1L1cu8L9SbyabJaI=;
        b=gIAhoD8KNxsKMEhtPFAVQuS5W0AAfW/gONFtxhrn2h182RmI1Ole8W7zv1oipjMg6J
         OluRcZLQnCVYoX/ZeDFgiaONQi8EVY8xW5PNgzq7vx3KZi37KTUW6BfJrOnyNrHIAjc0
         6M6RCFbCul5fxGGD0DNlYWJyW4Y2XaLhOzXGELwy+y+Ps8Mi0M1s2t75GcGckGjACkSI
         kugyHhPv7aKSO/KECqhpLJM7U5p+RTodShPFhw2FKf8u1fZVayWhWU4epszlLsvx3ODl
         LxIKDNOZenvp1XUY/mgX6COFq1bX2RaKKCOKs7GQKcw3eJY6hTtzGfSFOubZeMoOjbVr
         R92A==
X-Forwarded-Encrypted: i=1; AJvYcCW6q6hTPUjfc4J9x6qApONySOH1DBOQpttMuaPTvSopFjuOFqcP70cUbcgvHAQhZDlZw/HWUD8tiFXNKEzv2o2SgfgMVQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YznlpxEDvW0FPWvJ82sb4GtTOp4ylvZaB1BVC2e2+9nyYftdJhm
	Y5NQ4lhTKwevYywjYukduvG8Vc91BCXgpYsyohFOsDeXqueaoaAtP3Bd
X-Gm-Gg: ASbGnctQyIBdSCMs+tuyyL2TGwMESQOFi5oVLxsQGxkx3q1ABoZ5uUFEKV88EfRZVRV
	SuTGjX1inIK9c455HsbuV3CU38ihLPxMrIs7dB0DOtBp/cI0OI5qAdrG8Yhpj58jEnYxRshe+kR
	n9kzRvwyHJ9s4QTBt3VPV96o91A15R7MIV1jPwwY04VoOKr8ounDPyrf8ePKqXSodsugOBj+UlL
	dFMEnaWkXzVHeE7X/r8gU4f3KQVVofOWuQ+fVCgZ3Kqz8FTc441ZHQ+5AKzQYFrMETNlPhRtO0V
	hzsemMHJuDzB0cfwocm1ykZ3FV6Y83P8L94kqObShSlBx2pw
X-Google-Smtp-Source: AGHT+IE8ZFa0LSuu03SsIfsP4BI06sEZwP6Jddmvw7w8JwUeW05PDyCVNTa79hGOPUDZS+0Hpq8xJQ==
X-Received: by 2002:a05:6214:2466:b0:6f8:8fdf:f460 with SMTP id 6a1803df08f44-6fffdcfc04bmr176240576d6.9.1751221499271;
        Sun, 29 Jun 2025 11:24:59 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771ab9d6sm55220746d6.28.2025.06.29.11.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 11:24:58 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] EDAC/amd64: replace sprintf with sysfs_emit in show functions
Date: Sun, 29 Jun 2025 15:24:48 -0300
Message-ID: <20250629182448.265407-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update all device attribute 'show' callbacks in the EDAC AMD64 driver to
utilize sysfs_emit(). This change adheres to the recommendation outlined
in Documentation/filesystems/sysfs.rst.

This modification aligns with current sysfs subsystem guidelines.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 drivers/edac/amd64_edac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index b681c0663203..b6d211255ef0 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -552,7 +552,7 @@ static ssize_t reg##_show(struct device *dev,				\
 	struct mem_ctl_info *mci = to_mci(dev);				\
 	struct amd64_pvt *pvt = mci->pvt_info;				\
 									\
-	return sprintf(data, "0x%016llx\n", (u64)pvt->reg);		\
+	return  sysfs_emit(data, "0x%016llx\n", (u64)pvt->reg);		\
 }
 
 EDAC_DCT_ATTR_SHOW(dhar);
@@ -571,7 +571,7 @@ static ssize_t dram_hole_show(struct device *dev, struct device_attribute *mattr
 
 	get_dram_hole_info(mci, &hole_base, &hole_offset, &hole_size);
 
-	return sprintf(data, "%llx %llx %llx\n", hole_base, hole_offset,
+	return sysfs_emit(data, "%llx %llx %llx\n", hole_base, hole_offset,
 						 hole_size);
 }
 
@@ -602,7 +602,7 @@ static ssize_t inject_section_show(struct device *dev,
 {
 	struct mem_ctl_info *mci = to_mci(dev);
 	struct amd64_pvt *pvt = mci->pvt_info;
-	return sprintf(buf, "0x%x\n", pvt->injection.section);
+	return sysfs_emit(buf, "0x%x\n", pvt->injection.section);
 }
 
 /*
@@ -638,7 +638,7 @@ static ssize_t inject_word_show(struct device *dev,
 {
 	struct mem_ctl_info *mci = to_mci(dev);
 	struct amd64_pvt *pvt = mci->pvt_info;
-	return sprintf(buf, "0x%x\n", pvt->injection.word);
+	return sysfs_emit(buf, "0x%x\n", pvt->injection.word);
 }
 
 /*
@@ -675,7 +675,7 @@ static ssize_t inject_ecc_vector_show(struct device *dev,
 {
 	struct mem_ctl_info *mci = to_mci(dev);
 	struct amd64_pvt *pvt = mci->pvt_info;
-	return sprintf(buf, "0x%x\n", pvt->injection.bit_map);
+	return sysfs_emit(buf, "0x%x\n", pvt->injection.bit_map);
 }
 
 /*
-- 
2.50.0

