Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4AA7D098
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 24 Aug 2025 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756041435; cv=none; b=Zum+34F9F7CcMpFtreavGexc7yXIGoWd38ghHRvhxjJw71rzkcjTNwb1RK8yj0vCo9ZOHDoYRqh7KYytPfIEMY2zhPyx3tH5o5EPI/2NkzM4L2+CmWoCO8vpKuei5h/FAIYbpkZWffktgPT6LoAdPy9fQycii/CXPggSvcCKCiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756041435; c=relaxed/simple;
	bh=aW2h0iy5gKk1+VvNp0eqYZTL0H7VitB+EhzBXV5jkvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EUtEx+UuRkPGSRHHbbK/Yrj41W7vI5BcSGWtjbuxbUgTgZhutzNo69tTVMCQn5Xp20tIftuTomhaLu7BAfyDx0AQjBJPipokHRz/dtJUlDZNrNPyRwkP8aj9lw9t44NpGId55lHNGJvAICCSv/jpFyuWYWxYanWPEbCHrrK4G3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDIiSfmP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDIiSfmP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so20839925e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 24 Aug 2025 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756041431; x=1756646231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2N4Xz/BxoJnUC9kUOnfvhJZVau4iCsVpuk+xhLKOTWE=;
        b=KDIiSfmP+mHKPbWReGLQNaQVdHlCfbENNzjJxIXPqOmJ7aDFY/kR3MYs1RnUm8ZltN
         8c8pHRVJdpT5YsdIzjyEnRw3JPF8O2bfRk7PTPjHPuf/Hsh98KOy96nsyiKof4qewPBO
         Ws61rzP3OW1+/gUo8SJ2Mr/NWlHHSD0eFkoQpNSBQMm4b7gRN2IxoN9qdarhYYC7lIJT
         TXxIH+WEGslW4+PCm9pLzJCtYH9+AH/m7M3vuUn3X7eSpgAy+9HHBltKsQzxtknTYo7c
         sZYYWQEc0HF1HUqY6I80wFdpZtAUXSP/RG3y0gHndqQWlaJDaascZ50NL8Diqm8V4lNq
         f/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756041431; x=1756646231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N4Xz/BxoJnUC9kUOnfvhJZVau4iCsVpuk+xhLKOTWE=;
        b=axp9copd52ky+xjdgP+e9oOvwWITdcVRcevRGJzWNT2MUQKZOCDOUlaXjzoT78CsWv
         01E27veGFM9uOhjhIre+NiQQ548dJg33NS+ff10zzPE8iM2cFh9oXONx9DkjM3ld8hLQ
         tQG6RKbGBpsWObkT4Bks02oJnZxfAtAGoYrAv5USW8kjeNQ4CYxwgzcNq7HkteOF6+Yq
         UPQNsKh92M/wq90wl3LAcHU2IU9wtfSWLyvSwuaLKNk7oOllrXxSeV5GzWFiD0LQxix+
         eD1fET4g1NJ1rO78xabRHEmjSXbgwKIkuC+rX2M/jRwE7Yb8aGiJFoBOdb4JlmuesLo0
         PAOg==
X-Forwarded-Encrypted: i=1; AJvYcCUApzptthgadV+iB6+MJjBzKU2aUBzUFJ5tUVGQ4JrOpoGCvQgdajD5eTPmhbcRhnpJDx28V+cDL/EB6Ly2Uvq3ALib0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5tZ4XKsFdyTBoqJr/XhIBXkqWf6j3oVkTSdcUWt9SE+2MXzUt
	KdwDKTFJtJ9QTfL+d1Jlgt05v8/KTmWQKk6BKQV4zycnbGOt0QhXNYWO
X-Gm-Gg: ASbGnctE+74PBReCbMGGj/iEk7ErdUfr1uO9YUNjeZufEcNqxaTSCBQkPZaarwX0ooJ
	hGUcIwiHritjD1shjKRd5OyA0nOngxmdqQefg4+W1G1JE54W7J0GEnWF81jS514CTY24SPaHOra
	snj/+YmwGuCkxJGYfkkX0ZQkmyml82XeU5v39+Le23Yc74O7oCYoaRlN6hKNd0ju4tAfFz/hUSX
	WcvdEoGAUULCg8LC7ePRRpVNIiam8MwXdKjM8Z3TYb6+zKHKBzqUCsr/EbTU+WO3tIzQV7DvJhc
	1CzGe9/kBM+0DNaQGH3cH9C4sEpvCAqEjHBThfwqVSmUHzcDb5356GOixEnbXd1mT6aCnwwqjV8
	eCbJRmKO99ZdGQ0cQPg7w3ND1CWhxUFYecNtKRuOhAWQfF8wJJ7Irhc2Mr7v3AA/6T0IvmLm8D/
	YHNH/YpyPLqA==
X-Google-Smtp-Source: AGHT+IF0p6X6DqMaft8bVb+xHZzWcrilM0oEkMehJr2d4YlsCBG5vyIsnO0FKQC5OMwp0lsuPqbhag==
X-Received: by 2002:a05:600c:198f:b0:459:d709:e5cf with SMTP id 5b1f17b1804b1-45b5179b710mr77565375e9.3.1756041431473;
        Sun, 24 Aug 2025 06:17:11 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e8f4552sm75658355e9.8.2025.08.24.06.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 06:17:11 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	ebiggers@google.com,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	linux-kselftest@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH] selftests/arm64: Fix typos in malloc return value check
Date: Sun, 24 Aug 2025 16:16:47 +0300
Message-ID: <20250824131647.490439-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix double "-ed" in malloc return value check

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 tools/testing/selftests/arm64/fp/fp-stress.c   | 2 +-
 tools/testing/selftests/arm64/fp/kernel-test.c | 4 ++--
 tools/testing/selftests/arm64/gcs/gcs-stress.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index 74e23208b94c..ddc01efea3f9 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -549,7 +549,7 @@ int main(int argc, char **argv)
 
 	evs = calloc(tests, sizeof(*evs));
 	if (!evs)
-		ksft_exit_fail_msg("Failed to allocated %d epoll events\n",
+		ksft_exit_fail_msg("Failed to allocate %d epoll events\n",
 				   tests);
 
 	for (i = 0; i < cpus; i++) {
diff --git a/tools/testing/selftests/arm64/fp/kernel-test.c b/tools/testing/selftests/arm64/fp/kernel-test.c
index e3cec3723ffa..0c40007d1282 100644
--- a/tools/testing/selftests/arm64/fp/kernel-test.c
+++ b/tools/testing/selftests/arm64/fp/kernel-test.c
@@ -188,13 +188,13 @@ static bool create_socket(void)
 
 	ref = malloc(digest_len);
 	if (!ref) {
-		printf("Failed to allocated %d byte reference\n", digest_len);
+		printf("Failed to allocate %d byte reference\n", digest_len);
 		return false;
 	}
 
 	digest = malloc(digest_len);
 	if (!digest) {
-		printf("Failed to allocated %d byte digest\n", digest_len);
+		printf("Failed to allocate %d byte digest\n", digest_len);
 		return false;
 	}
 
diff --git a/tools/testing/selftests/arm64/gcs/gcs-stress.c b/tools/testing/selftests/arm64/gcs/gcs-stress.c
index bbc7f4950c13..cf316d78ea97 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-stress.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-stress.c
@@ -433,7 +433,7 @@ int main(int argc, char **argv)
 
 	evs = calloc(tests, sizeof(*evs));
 	if (!evs)
-		ksft_exit_fail_msg("Failed to allocated %d epoll events\n",
+		ksft_exit_fail_msg("Failed to allocate %d epoll events\n",
 				   tests);
 
 	for (i = 0; i < gcs_threads; i++)
-- 
2.50.1

