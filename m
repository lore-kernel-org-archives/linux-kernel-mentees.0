Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A881B6D08
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756244990; cv=none; b=Rlf7AKjcjhL2MjbbQdYHmVxCKhv8l68GEpE5M5AXs4Vf3vGuBp2RkxUwWRkBUQijC3q1Ivjlb1GweY7MSVyr+KHA41hwxcNaK+OS6D6PHcv3Yv8KAdpymGRsIlHRM6MLbs+3CMA3J1rSnX+Y35CYVMUOFXKWHtLWteG5SQCPNgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756244990; c=relaxed/simple;
	bh=YTP7oljg0BII5171/1yq3+K9FoB8VehllhNiO9W07Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ttl46UR3Ve3LvP/WAJT0EtPDCSWTBif4/Pj4Q2qsHvjQmYP2lbGRxki5N4UsUbm8QJA1oOYI+qGsMi1bSzcSRxbAKwXyTDMGjpwyLBmDUowS9D53Pzh1uGvqPxyYptK3mhfHNB97VH1VWBMzbZakPyo9eXZnJDA2YY1l/uLL+D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJi029PB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJi029PB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so38632075e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 14:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756244987; x=1756849787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGxiUv+9T9MyXGrGc5hXaCPQg3e9+++0LsEZqWpGIE8=;
        b=fJi029PBXmAlZUfQmulD6rEhxaJIZuLxS9j+4I2gZiKOi/1AMXssZDrZQfrqVHEsnV
         nKS5rT+lNVS3xFSTuBH6SbkFqxxYnNfmN1/y+hZ/Jn76ie/CT5IQygEb7F6oqrICYHp9
         lESPllPh3/vue8yhxiaq0WF3jmjGrhvcyHcBV+1evKMNkZXhDyvjTsFPLry9WoRuCicC
         4Rc1coRGAm6A69skuElCy724ha4yt8CD8N41BkkO8jWyuGYBo9a44k6fK7bVXRmfmqIH
         SgxIX5VkMZVUH4v2i4QF3IKhQgnad5dDWvlaAoHNYZFOFmOf6oWV0P8OaltVOqqmuu/o
         Rpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244987; x=1756849787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGxiUv+9T9MyXGrGc5hXaCPQg3e9+++0LsEZqWpGIE8=;
        b=rPe19YbSOXzcZE6EZg+QPRggpXTgPJihzqDoUm0q9lhPKIGXCQEkQ1P+bEn0bw7nQe
         t5ptwKAMMdlg+0cNSPz57/1sDP1uOJmfzW0aqdiDDpyWSHAcj7Wp+sOHbCSBVHESAKCl
         6tj5eRdROh7sxO/mWvE23DUb6xAZ3q1qdwo8mDN40+clW4d4xwsB65yf/bGSF+SgHJPx
         i5F9BDYtk2cP107k7FzhzHXmdx34c5Pb6R+yasQk+GcW9ChhgTOzQvPXDYi6WyhBI1yZ
         Yon1onTDCii+YB0+CD4cWZrI233iGwzH12vIIs3AzCtJ4HhrxAexJPukBS6DUrG1CjVU
         Kjkw==
X-Forwarded-Encrypted: i=1; AJvYcCUbVpM7PtaE3+npS1VSRFQg9HdeJsc63TvQhFAwEkxsXyEoEEAyG7lFPMYSwn0tRly7XMOk9s68IqUmAKKeWQGnAaZ7oA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd1DSz8ezhrhElnAMuukVGYnYRo+vEkAelgaP/DL7Ph1O2QwP4
	0IsExpYfhuZrqP3hU1Z/8rzwnMJ7kW4iO31G4epq2Jiahxr+e/3APMfK
X-Gm-Gg: ASbGncunHfqX5gx/140qf7MQrCVI6R7d39IR39BiOqP7jm+V0eNTDUFDAMyg0k6iSCc
	Y4Ch+Z3eYrWZAs0nYIyv1oQ4/0kuMqcYPB5CX3MCyGCNKjjA1F8LmTpV2pN46bfOwCEpF6IDaSA
	yxMWx3yVuVRTrdUuUJxwnI2qcR4HeEpMVCDyR8t7r8bhFY1ofuk6vv1ouu1mIWibFzCIosEKSUr
	Y6WVPRt3NOON1XV+faTZMtbh+ZQ5eCYBwLEouxqpPVGmPUhhjffqtz0nzXaBCx4pix4xs9zJUXB
	1VahvolYoqlSU4Lp/oGX44tHXKp9z9ZCxTUvrCR5F+c7C71xem1QMYgU6bVvMkOhv+PUFYjmwEK
	WFMlPXNeQ89CBvyPpAhpM1mtNc6W9gvp8eB5YT2S8syldcgiden+0VGGTQ9kagaCU
X-Google-Smtp-Source: AGHT+IHv+Wry+OjQYum2M7c57rs+J3M7hZ2o5axY1fUO2E8dRSkddQaT/i6JHD3BgXqPOrIfoE/gqg==
X-Received: by 2002:a05:600c:3b95:b0:459:df07:6db7 with SMTP id 5b1f17b1804b1-45b5179b2a1mr156669565e9.6.1756244987084;
        Tue, 26 Aug 2025 14:49:47 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211b19sm18309207f8f.39.2025.08.26.14.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 14:49:46 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: bagasdotme@gmail.com,
	Markus.Elfring@web.de,
	broonie@kernel.org
Cc: shuah@kernel.org,
	will@kernel.org,
	mark.rutland@arm.com,
	ebiggers@google.com,
	catalin.marinas@arm.com,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	thiago.bauermann@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH v2] selftests/arm64: Fix grammatical error in string literals
Date: Wed, 27 Aug 2025 00:49:13 +0300
Message-ID: <20250826214913.866695-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix grammatical error in <past tense verb> + <infinitive>
construct related to memory allocation checks.
In essence change "Failed to allocated" to "Failed to allocate".

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
Changes in v2:
- More descriptive commit message

Original title is "Fix typos in malloc return value check"

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

