Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5BF26AC3
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 22:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261306; cv=none; b=frL/Zet/VseGLGL/jfJFrYflKqhff7X+V2e8bKsFVe8llBrSZRLxLEL1ogQTSYROgZXpGvYq8cnXdJm0YurQWcfYpWfiAqJdoQnur7h8N1xgJXYm+4PkMteATYwIB/+2lmH6EyqrQl4cTQenspzDYPrXDL6ivCELb1T+fLSagPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261306; c=relaxed/simple;
	bh=3j2GE9l3wGOmBQOG6S4c822rAlthmoDqPjq3LP9n+Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGDq5C0rBYvN8O/nzatVcV1CkefhPapSxFtDbRaStkzSaEkAHFTeOyKEYIOnPpYilks3nexyPIR9rDJK0KGn1Lf7OM664HEeGdS/LgCLxmamimt9y59uAH59hHozynh6rJMeV8A8FwQYDoopdScg/bboRVhja3lgQRjGqxSqI98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVcikTWV; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVcikTWV"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22fa414c478so1994975ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 14 May 2025 15:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747261304; x=1747866104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oHfsdh270VAzzwWx6ys6xW+UP8Uvsw1TOQddVAOSGTA=;
        b=nVcikTWV8NCtkKAyORB9zK7QhWeJH8qcR6qser3YCckobMqw6z8hFweojzxyFAGRUq
         e64ElyFsifljqzFADrTNoieDQiFFukmiArRLZG6xsQ3vZTuZV2O77su1Zv2ZVv26w+P8
         FGfxc2MyXlqdyfO0qq7uG6DQj5qu/57Uxm9I2Noz1KuAwruuGFe820maQbg1gAQXsUIv
         j4QzbQ2qxjM/nNdvoSvu4Uumn71xASFzLM/2VCWsg2Kx/zuhz0mLHM3R0k9ZwUUQsMCu
         Wu4uPEWjSMbKqPltJYvAqUj0z/gEbtWg89iLjRQTCJn6wD/DyRdjC0WZAe0ylQkjCT4u
         XjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261304; x=1747866104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHfsdh270VAzzwWx6ys6xW+UP8Uvsw1TOQddVAOSGTA=;
        b=oeWe+xIAmF8tYWKwBx32bvS1DzzqNV6LYfBwrJOaA5R5aHYP13VPwty5DcSV/RjZ+q
         Jlh1UCg+mvkTXRvBLUk5M7oAHlSMkvHcSoGR3JkL4t3fAMeBJJH3qnGh+Nt05puIONOg
         ldVeRf4w63VD1S5yGC7Hasu7GM+m53nk02g1wSZUKIUxir8/loSx2J+LrBgf+JC41rDc
         c/5SqIjDDnUBa47VDq4EqpA+wMln69MnwhfH3ne7NxAFqZFuvRgdYfGVaIsQJxbEDlcw
         vYCq9Y0LI/HqwVUU/REHOMOUx9B9phr+xLYv19losRLFuCYVDQLfSNO91zKL/hz9xb7V
         ov1A==
X-Forwarded-Encrypted: i=1; AJvYcCUWQfEGZStBccH31fPmYQ/CiU51LwtEcEvr6kDXvyCGE3LupV6RKF2MLi1+OhMG9IuRx0gVwHV6z7oiDYPg9u9T4drmFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmG9iLa9BYjHJNM+MHXXm5wseiwqsmpO/+c+dxp2Lllj1HWOMO
	p2LHnwb11y8CYwknVzL5hZqVGF1vMjf4qZm2L4BaMvWkXbSMaH5J
X-Gm-Gg: ASbGncsaugx3OuqNdfdXBVhKgPNehMi5jkhI43W8QTZ27Qq9f6HXYi6nnTeATtU3fiI
	qSTtn0ePFxUIq6hLjOdY1FrKKxKMGIxsogrccVtbJ/rmEZDDn0FCRZq4WRMZQt+vYgu9R/+3imn
	/R4AJ71J8cRfOfjKj5NvbNMAPPbBsTN5ZczFcqBlcJkAlsjY+e+wYrIrLp6lgPQCBYCL3/DkXPv
	s4WRD6CnfCQ58iwA8hnD8caaWKJvejNgyuxOXvQc5NW5EL9+v9T8fQNuH0XmX6kYEo85Xax7ot+
	MlgViqX8ulR6oBg6lusW2ZJqR/fKZftp3LAFVQVQxO1G6shlnCzkJf8cEEDll5neAB9o69zHqMi
	r
X-Google-Smtp-Source: AGHT+IFttTpWsrfV8CTbyFUfOClZsN4VaZgrm7diOQZyUoMIOzoXxLxvFc2uEuwrls7nKlhcN5t+2w==
X-Received: by 2002:a17:903:b0e:b0:224:76f:9e4a with SMTP id d9443c01a7336-23198119c40mr70961585ad.14.1747261304097;
        Wed, 14 May 2025 15:21:44 -0700 (PDT)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828ffbdsm103836525ad.196.2025.05.14.15.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 15:21:43 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	rk0006818@gmail.com
Subject: [PATCH] selftests: timers: Fix grammar and clarify comments in nanosleep.c
Date: Thu, 15 May 2025 03:51:12 +0530
Message-ID: <20250514222112.396705-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improved the clarity and grammar in the header comment of nanosleep.c
for better readability and consistency with kernel documentation style.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 tools/testing/selftests/timers/nanosleep.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index 252c6308c569..84adf8a4ab5d 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -1,12 +1,12 @@
-/* Make sure timers don't return early
- *              by: john stultz (johnstul@us.ibm.com)
- *		    John Stultz (john.stultz@linaro.org)
- *              (C) Copyright IBM 2012
- *              (C) Copyright Linaro 2013 2015
- *              Licensed under the GPLv2
+ /*
+ * Ensure timers do not return early.
+ * Author: John Stultz (john.stultz@linaro.org)
+ * Copyright (C) IBM 2012
+ * Copyright (C) Linaro 2013, 2015
+ * Licensed under the GPLv2
  *
- *  To build:
- *	$ gcc nanosleep.c -o nanosleep -lrt
+ * To build:
+ *     $ gcc nanosleep.c -o nanosleep -lrt
  *
  *   This program is free software: you can redistribute it and/or modify
  *   it under the terms of the GNU General Public License as published by
@@ -61,7 +61,7 @@ char *clockstring(int clockid)
 	case CLOCK_TAI:
 		return "CLOCK_TAI";
 	};
-	return "UNKNOWN_CLOCKID";
+	return "UNKNOWN_CLOCKID"; // Could not identify clockid
 }
 
 /* returns 1 if a <= b, 0 otherwise */
@@ -90,7 +90,7 @@ int nanosleep_test(int clockid, long long ns)
 {
 	struct timespec now, target, rel;
 
-	/* First check abs time */
+	/* First, check absolute time using clock_nanosleep with TIMER_ABSTIME */
 	if (clock_gettime(clockid, &now))
 		return UNSUPPORTED;
 	target = timespec_add(now, ns);
@@ -102,7 +102,7 @@ int nanosleep_test(int clockid, long long ns)
 	if (!in_order(target, now))
 		return -1;
 
-	/* Second check reltime */
+	/* Then, test relative time sleep */
 	clock_gettime(clockid, &now);
 	rel.tv_sec = 0;
 	rel.tv_nsec = 0;
-- 
2.43.0

