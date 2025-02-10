Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770E244195
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Feb 2025 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203889; cv=none; b=guu4UYpUhYIfKVFvTJhALbLlIQ+akB3tsaeDRD162jri+OaLutHCorIXAPAuxktEDyp3MtDMgzQIy2x3oIeNq3dzqJDY1//Lf6R8SaDUj2GZLPwAGtB2yzns782XbB9dNXfHzCMHZZBnOU6exQcoZ4VMtojYONJT72Y5ooozZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203889; c=relaxed/simple;
	bh=Ju+jLIC+hdALWDNfTRKoeZW9qn5r+NTUgbFhV/yjG5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ujZJacQEyiaEsccjCEu2dyB95fYTIIyrxRDAraGPopI5fSPuQaqwqO1GpiYaLPTL0wOdoAoDpgj0MT9gVRZaj4/AzyfDQAziPykUl3GPdjpQHrW4LucDBFLEfju049WmhiLUV52QT5TPMJ4ByXSZlfnysBOn4ZxHARYTr9q13vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIK/0Iau; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIK/0Iau"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f6d264221so25414355ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Feb 2025 08:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739203887; x=1739808687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lt/TBqL493WxqFjgvfkZ2tS4krtyuV+0wcigwiXRZIM=;
        b=TIK/0IauN36p2S7J1iC73GTL0oK4BGMYJxyN1y00jrQgQYhC21egfopFaRzoQWVcHf
         /1QipJM1FANvGRxzyrYBm0SORwEDWkE12FHmnHMux8AeTRC0PDTVPKyqKVVK72r96p4z
         Nyh+0K53yimNXNngnu1uo1K6+UflD3NzDd1IOMq4P4+ZzUA+q9KkBfhurlKknnfpovFf
         1GU2ulGmvo9eC5UYUssnHfbnNzlKXtCb6xJVgeS48IJ9vpHro5ddzgl7GxaDENWyf83Q
         wY14DGksOPhkBjxi1Tqcnu2ODQ/pJjNwPcbAYlx+/Qv3I0OIN/cAuAqRC2YugLIrSWxs
         ZRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203887; x=1739808687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt/TBqL493WxqFjgvfkZ2tS4krtyuV+0wcigwiXRZIM=;
        b=RG0TRpKhu3ENib5a1jN5jOp4Hb3a1wlJXUYsznyzSpezy2VfLjpEOq3NAkL9B4L8YP
         g7QOQ+rS0IvL+uzCR2xPfe8Gb7ZBUhzEyRBwUX8RMruMH2/tXcvETmkESz+eZnwtLzCr
         TVps3dsRLBM/yU0IxYJDy4TNyL3UcGIWGfD93zZ+C89tR+OIfp816JBSquXvf/3NUqrZ
         h6TWSuMej9VpMpdNfc2R4y/9y96BIA4e53nLZMXHm2gsbDSK7Iwqw4hHHt4K4Lqn0WI0
         /ZLmaGIZnkMbEtZft4lVFfrjyQFhghE+OcA30T15POyPtTlM6gRu5z7/DQm//W+gfH+y
         9S7A==
X-Forwarded-Encrypted: i=1; AJvYcCVadqEk9sytk5YSeigBmzuzjwfHPKGP3yOvXbEAJRph9x1Erqs08/AXidakEHASf0GR4kw+D5GlKK0raK0XnmqQ9Ea0bQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxpH9S4JULQ6AniiSmNYWqVkTXXcLk6li+Wba4gDtdK45Ebqdo
	+4HbSWRJt1gnVYHBzHh93sjQzqJIfQuRBxYmwmt77GdOKHfd9ZBV
X-Gm-Gg: ASbGncuhhDKuT1vXnMY6dkgEvIxBMdxBabytRLeiTrKP14C/gQxt+dsQWGILJ4XsMrz
	immbz+GsOdvsGLzbJ8G6XzWlLjnwaYwKS4W6QaOD7rqyU0tjoqwSahf0jIFje/1Yi06eooLQjOU
	Z24J1noEUnxvgjtvrbqaJ2huMq+sI7zcD5Efrrut//3kOaNJpyyhlafHbPJoH8bPXfBjRE/Wy8R
	FEQls4/4TK60Z87++Wwp0vj+fd5215LEJj+0P1YOX9AVwUY0loqdbKic3tz7Ql7D5kdXMycnV0l
	2MT/18Fu/aIqm1/1oxaEFOY=
X-Google-Smtp-Source: AGHT+IGBP1tsRARuyphuA4dc3+m2aWSwlcSZROST1syG8GihtPtpjMQ+VBiiwMW4vsoTibNHhabUyg==
X-Received: by 2002:a05:6a00:148d:b0:730:97a6:f06 with SMTP id d2e1a72fcca58-73097a61364mr3937341b3a.8.1739203885416;
        Mon, 10 Feb 2025 08:11:25 -0800 (PST)
Received: from linuxmint.. ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73083c1f029sm3022516b3a.125.2025.02.10.08.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:11:24 -0800 (PST)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: mic@digikod.net
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	gnoack@google.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] selftests/landlock: add binaries to gitignore
Date: Mon, 10 Feb 2025 21:40:57 +0530
Message-ID: <20250210161101.6024-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the test creates binaries 'wait-pipe' and
'sandbox-and-launch' which need to be gitignore'd.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 tools/testing/selftests/landlock/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/landlock/.gitignore b/tools/testing/selftests/landlock/.gitignore
index 470203a7cd73..0566c50dfcad 100644
--- a/tools/testing/selftests/landlock/.gitignore
+++ b/tools/testing/selftests/landlock/.gitignore
@@ -1,2 +1,4 @@
 /*_test
 /true
+/wait-pipe
+/sandbox-and-launch
-- 
2.43.0

