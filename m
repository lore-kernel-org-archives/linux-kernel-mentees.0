Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4D41C71
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Oct 2025 01:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760491783; cv=none; b=hDDza6LCY2ngthLCpU+iZKjlH+PSx66yABPBuAoh7Boq850ckan95rKhNOJwWLSf5hb6rPOB9mgL8IO6/N4k2NCWH0KBWlQEU9EEHpCKke1EeLwhfYNsWXYJjU5zsMOa4n8gBIC/NIYaVZRWEInt2ZZuEwQg8stl38P1g+QSIrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760491783; c=relaxed/simple;
	bh=EkDTdmk7VtedbDx8TuiDmQUnQUo94nagjsaRQEZkOHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tluFo+L55e74kOkf8DRHOkcBS/ioPWCCWe/Y1QEtU0FUTmVNFUMcWLNptZoChSvWCTYfucimYu0Rr2XtYL7L8msHDMbvpkEZZ/bHPnSTXXDVyIbbgbLjMdwb8dS5ipca/FPJkOdVS9VL2fce5I4tJX9egz+VxZcECA8ASXxAjS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGg3M4Rd; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGg3M4Rd"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D11F380F67
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Oct 2025 01:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeG1nObvuBIP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Oct 2025 01:29:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB4FC80F50
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB4FC80F50
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HGg3M4Rd
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EB4FC80F50
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Oct 2025 01:29:40 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-269639879c3so57484115ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Oct 2025 18:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760491780; x=1761096580; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fvYbXimvUZhpQiNzNTlCeS9B/GqAi72nC59INjCGqc=;
        b=HGg3M4RdyeAeTfa3rTu6Ff/5xdBd/hlr0sKFOlekpBMOFgCjZtThDwuXwN6X3c0liW
         u2Xf+NyLZmMEKJQpUWL4cONWyhQKp7sKBdOg364n33umgI0zRMAODMoTUCtrcD0xtHkj
         gbNQRlABxIrwTWYLOPX42tNBWz8/872nyt0emUpOGmN9BxcQuL4S/kgoGx9s5/S5hoMd
         aQhYVhF72P0fSnL8osgGFDM+UKNWzQnvd42M40ob3Fyn+16ZAi9GZJx+EDFdJsbQwlmy
         r9MEukzlV+GCqB1U0aZvSuSU164MtVrBegW9NgKnDgFURKSg6DViSLHzqnzhsa9nqef4
         pO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760491780; x=1761096580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fvYbXimvUZhpQiNzNTlCeS9B/GqAi72nC59INjCGqc=;
        b=Z77hSW1VyZ5IaR2q0iPxv9Cacq2EJqFqQ6R6tBmKvAt7hJ0GBORLyfpJIxF0WjLyzZ
         638cEG3lJVF6aZtdpImoCWjT5rsQ4mRR6bs89ZSznXuy6TEOuWDmBj/+/3m6LCloJ1wx
         JFfJH2JDOVXDqjGwV+hjw90QJl29eH8cuVd7mhjeGug4PGxBj9NVMidE9QxLQXTgFHvE
         sPG/M/0u9kJyVa8OTHjctC3B1A4jWOZL6LswJsDOfxSw2hZqNAExR2zid55Q2hLkEjoT
         +5s9jMvkWY31Zwj7qCU3mMpKwMEUAhdjqrZQM+cmzUV13sIwHe55oeUmfVVpFqdoFggb
         rTfg==
X-Forwarded-Encrypted: i=1; AJvYcCV1WGSbsXkuEqUDXYrLbPMc7Ol1ecNxwz4baqC1xLZpHHZdai2pXUWQu0qkcYZMNjZ8R39T/dcF410aqfndqJDqnGk9EA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzHo6T9cBbSi4D02Bx5rTnjYOrgaEU+5wUDp/N0VGKuxih3dcZY
	PsWyhclOza1eHoV0BhY7jH77GGxZhtGZFR3cpkb8WU/Fek7hLPUFRzR2
X-Gm-Gg: ASbGncvK03Wan2onTns6/kw1TCTmvwHrpgIIaqF48djx440R2SR8pV7I1GlvTOpUCOQ
	uKVv9nshN7GJurWF9ENukJGQ7tn3KApJ/B78n2pfLttYTAGzt+yXLukA0x9FMAGu5ryaJxWGSY+
	IylkhE23jL/u/zKDx05qF9Wc6vd8QGsoEFnlQZ2bqOeeP1J801jXnYPLf517i58c3VgUU1IKf2a
	9Gb2tRpaC2fSFEvCHhdXhW7OTAtmBUgnIIrhHMd4K4ySMH5cUH4/JQRKTwBPqkL6mR3X8A+PIut
	91Cx5827+7qAjdnhWpyf4o6JwbRVmS0fjCgc2D0iQwKjTErnwZMmU6UdB0TnvcZi3jadxSEyQ+H
	6TOPJvKoKcF9pNyeU5N4oHtCyD6uMjCHC3N8l+gVlLCUDoje7mPI+/MvKRIxVc0Wki8CBWy+PxG
	Wukro+WQ==
X-Google-Smtp-Source: AGHT+IETwzTDN79xce98tBpGmn6d5BjHIybgvoONdJrdp+zyqvV2gOBUk6dEmaq5sMqA1PTfzaY8Iw==
X-Received: by 2002:a17:902:e78f:b0:269:74bf:f19a with SMTP id d9443c01a7336-2902735639emr331745545ad.11.1760491779973;
        Tue, 14 Oct 2025 18:29:39 -0700 (PDT)
Received: from ti-am64x-sdk.. ([152.57.123.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034deb0e7sm177275485ad.11.2025.10.14.18.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 18:29:39 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com
Subject: [PATCH] docs: Makefile: Sort Documentation targets case-insensitively in make help
Date: Wed, 15 Oct 2025 06:59:22 +0530
Message-Id: <20251015012922.19467-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid case-sensitive sorting when listing Documentation targets in make help.
Previously, targets like PCI and RCU appeared ahead of others due to uppercase
names.

Normalize casing during _SPHINXDIRS generation to ensure consistent and
intuitive ordering.

Fixes: 965fc39f7393 ("Documentation: sort _SPHINXDIRS for 'make help'")
Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Notes
 - Patch is tested with make help command.
 - Verified case-insensitive sorting.

 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 3609cb86137b..00c81e7947a9 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -23,7 +23,7 @@ SPHINXOPTS    =
 SPHINXDIRS    = .
 DOCS_THEME    =
 DOCS_CSS      =
-_SPHINXDIRS   = $(sort $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)))
+_SPHINXDIRS   = $(shell printf "%s\n" $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)) | sort -f)
 SPHINX_CONF   = conf.py
 PAPER         =
 BUILDDIR      = $(obj)/output
-- 
2.34.1

