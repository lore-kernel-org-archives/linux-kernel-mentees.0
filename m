Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FBE2AD25
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 21:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172686; cv=none; b=buzxBFCKAU+8zWTHhJbFmmCRe447EiQPDuDXkCKNa813TcR4FhWNvQTbL4jLtiV0IAxjC1RP0kZU6NTHcYzNb+N2IwDxqxhjljW+57mjIeyQYPiW4w+AyF6mDtnv6vfO4ySphhtxNVDZEIIeEdDm9+EN/UdcJeA2fh9Fje+jOMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172686; c=relaxed/simple;
	bh=wG/Wp1GjJWoFt+2qnjj6hA+4W+5qF2qQBrY0vwHfkDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TJwbj61WYc+Mn+ySYn+lt15RgGpuSEcF5wrAtOsduRZXHOrMwT6rgRX8aNTX/gp4G8OL5b86zsYJLcgTNZq0QdTp1xMtXjPLlWHVcNqZswDStqITX8GDBvaibEGsSpN65D84CV7m19JhwaLoXuA5wJTKVTBq1lfSvsBzvAjcNdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vc232Lvs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vc232Lvs"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a0b4c828c1so746502f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 14:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747172683; x=1747777483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stc73lGvEUEFWN8GCfFvarZDGFQnQhaMztIejiIT7GA=;
        b=Vc232Lvs9ZPs3Bo7F4YVa+r+HQ9WP4z1XFc9qEgJVu3NB3BHqVEsV3+cOxtKf91CCa
         xqjYMtinLJ5xVp6gP906yHBIeuRfg6i058+blQCaS0iRWS3bGtcl+NclhuCVCMl6sRU+
         3nUMeKZY9asd7tAASw+XBbz/H7dppjxZ75kxa23i4yuAF80iICL3ixCH65HY6uOOc6KZ
         Pph1QkuHxEVQKgqS/mrFey7VEGpDvKrXaIb6q2dluTufd5bWoMpb6dLGL+yEmwLfIi6j
         0nwWfxxbJ2Xet70wiBI7cmHH+UAf7UEiWtftnun9PvmmKNYcnTEj1IrfwUTVWV4yCxwK
         zkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747172683; x=1747777483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stc73lGvEUEFWN8GCfFvarZDGFQnQhaMztIejiIT7GA=;
        b=JUc1Q2A4kzZsBqD9RBfe0734xAEO3VhYcHFmEnd6wdg8eNwfr4t8QP5gVuVYvASx1N
         JPaU4d3pcelXjrzKQaSLt1EYsCfvCKKJ6SRchxYAdJzLmtEj4oiipRWck2a7Ru9VdQqZ
         clg7y8mBEabWAFpKdWJsYWrGarAFK1GGKvYjCj0imR7gafDw3mXPukKsERWThHT+cbQc
         TOLTTMPhk2GGT105ra/1KRiHhb9JjfgzxvtdWV5Trcd7FXmyZ2UNr10eJnlKgn6vPBqT
         4u+B6/dPD0CLBVhyb2KD4XrD0rK1w0wfmqCHJV0kdqQdw/Z/UO/XhsiMr6bh4Gi7wP3e
         G3gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi0j0wO2r9W+IJtWZgzGBvjKuFHtL4ML+fN7lcwAMtHyzrk2iFO7G+lRPZ1d6x9Njp2yJ5LFM+wyRnzhtfVOJb9K4nYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKdahYrA7UPnQAsRaNQNt1SXRZVQdrKFp1SHo3ePklvmaTIJcu
	AmUVqL/nZJzxliJt1GS/W3r4Jg8elX01CyunhbSmc9cGotyBl3l4
X-Gm-Gg: ASbGncvr0X0uvFxR4Dw/FHulRYImiy7h7x27MGYQoBZyyvlCErYhN+LrxfyiP6LmuqM
	jSXXT33TSuagETY2O4lYQ85m+jPjUGAJydbbPWQFHxPVR/So/3gVab8qoGuCOmsQPFsPsiTPjHt
	w3Eric43ps+lH/SSQkg0eQLN93IdvwlYSWBUPx5KFUW7k9neCXBmeJNAbZMpTxBlaILCWUQObek
	oaSJOFrJpK0aVK162ZTfIqQdlNVj9QyqcClPb8IWfJAvRk16c+7Bj0aI2Ty0fympbqtngZOAKZF
	7avnlOuL0nn4K+B1DWvbl70e9u4pVflFnNEx1de/vlHWbGlw9pwigWMIFmLAflF10GMXLWmUjuX
	ZjTdsJ/ftkOmM
X-Google-Smtp-Source: AGHT+IGXzF5SWGhOVx2TJPz9L7bLLfgkV4fFuGpa+h/kDahVnCWf39qyoJG8ICFLqHS6nS1618YzdA==
X-Received: by 2002:a5d:5f4a:0:b0:3a1:f535:e9bb with SMTP id ffacd0b85a97d-3a3496a6553mr260806f8f.5.1747172682778;
        Tue, 13 May 2025 14:44:42 -0700 (PDT)
Received: from localhost.localdomain ([102.44.114.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2a12sm17334787f8f.44.2025.05.13.14.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:44:42 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
X-Google-Original-From: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
To: shauh@Kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>,
	Abdelrahman Fekry <AbdelrahmanFekry375@gmail.com>
Subject: [PATCH] selftests: size: fix grammar and align output formatting
Date: Wed, 14 May 2025 00:44:38 +0300
Message-Id: <20250513214438.300430-1-Abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve the grammar in the test name by changing "get runtime memory use"
to "get runtime memory usage". Also adjust spacing in output lines
("Total:", "Free:", etc.) to ensure consistent alignment and readability.

Signed-off-by: Abdelrahman Fekry <AbdelrahmanFekry375@gmail.com>
---
 tools/testing/selftests/size/get_size.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/size/get_size.c b/tools/testing/selftests/size/get_size.c
index 2980b1a63366..d5b67c073d8e 100644
--- a/tools/testing/selftests/size/get_size.c
+++ b/tools/testing/selftests/size/get_size.c
@@ -86,7 +86,7 @@ void _start(void)
 	int ccode;
 	struct sysinfo info;
 	unsigned long used;
-	static const char *test_name = " get runtime memory use\n";
+	static const char *test_name = " get runtime memory usage\n";
 
 	print("TAP version 13\n");
 	print("# Testing system size.\n");
@@ -105,8 +105,8 @@ void _start(void)
 	used = info.totalram - info.freeram - info.bufferram;
 	print("# System runtime memory report (units in Kilobytes):\n");
 	print(" ---\n");
-	print_k_value(" Total:  ", info.totalram, info.mem_unit);
-	print_k_value(" Free:   ", info.freeram, info.mem_unit);
+	print_k_value(" Total : ", info.totalram, info.mem_unit);
+	print_k_value(" Free  : ", info.freeram, info.mem_unit);
 	print_k_value(" Buffer: ", info.bufferram, info.mem_unit);
 	print_k_value(" In use: ", used, info.mem_unit);
 	print(" ...\n");
-- 
2.25.1

