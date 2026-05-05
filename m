Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79383BF693
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  5 May 2026 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005405; cv=none; b=RR/OBfhsm/6M0na0e/ETrCZL1V/PHo8GebqBL9cYSeEHfNYdS0gyk4uPoOR8xkv1VI9Cx+0gGHuFGnuM7c1g+xkSnD1KTjqjo1JaE2iy1zZBxARgNwyi9xIZDh3w6PlaSZTaui0k773XfMzcyg5ZK5JlhMW9kUQPcEI3HSHlybQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005405; c=relaxed/simple;
	bh=3idjY7q8VZaKR5zK5Erme2evT7lSxrnzywEyJMy9X2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X5hf3IEg5iKWBrXopBRUDDVTHT0PynxWi59Yhv0Gr2Ekldpanx8MZCuNIUa1YFswxmG7dEcdn0A7XRPfarpSPIZjfAeOd7xUYpmWlmRv8I30RTUx8S9nDxJxSAtxEQULxYfcLmY90my42TYbeBILrCsS8+WXJ9WGZEwsa9A/6II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1uvZ1J/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1uvZ1J/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-837b39eb078so1743565b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 05 May 2026 11:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005403; x=1778610203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWTJjKGnCUFekx/y0zBWtgZOF85zFt7y6+neh4e6+dU=;
        b=A1uvZ1J/kXW9UIUUTeehT+0Qkg7f7rMfUEIExni2sJHzDGfw6veAMrDMb0EgeG1PCk
         CarF8Z4buI6gz1GPrO929xZz8ZUZKf6bOx5wivFtlXHjCSHAHrJ4wG5NLABJ+SOzYhDa
         jBSpjkiu6DdIycgNlPxrseIHjMv2TB9g4u/CHDGRQt69kxRtbQTIr2JO53MtedLMV2A2
         TjC+xeVbDEckDj3v87l4mokDcwzozO9Z97INSYme0oX7e3ku24NDaWzZdKLqBiIsGgg0
         SHf8jkaaFj+LvGlv6Y+wBq10ZZdRp8VCHXgS2Ya6mjg+8fHzgzDEIDO8z8XD0a7z4ZnG
         xsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005403; x=1778610203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWTJjKGnCUFekx/y0zBWtgZOF85zFt7y6+neh4e6+dU=;
        b=Nag6ykStxaEYLpaCY39v1W43c2eK/lzUVu2lilGcIzzDigIKDidI2sgS0gbP020KAE
         EglWCN8oaftegyBulhaUvNm5+tRxX8SjLtj7mhFAVs32qMkpw7pmWK2T3ToZ0Dma6aL9
         H36fSFPvzNjfWO5GOxh7xBtfxDg3JdxRC/W9HyjX0FaMNV9ds58KnNGxQNTqlr1S0i8v
         U6k4HkxytkBrlFYzypUckyIQKhzXaIuNMACgfwuoEgUoxN6wAqytxYyAXqNdDrqln5Xi
         wk8ZaY3fmpCcjCb4v/ad3+IyZgnsffdtItnZifxgOge/hZSUZ+CSb3NZHfVeayzm+JFi
         JAaw==
X-Forwarded-Encrypted: i=1; AFNElJ/baatNSg8LW3ucZhnpxPtqIRz8Nwlafaj/6lLr4oYN7ZsLg3Hf0gC7mAyDc/OwfyxaK1GEOviWY/uJyFPHpAM6CjVisA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyU7Man8RTeKCvtmLFDb/EVFz6pz69w7hcog+BR+zZkh+1XqYKs
	VO0gha5UvduEnO5aLRtKErK6OzRlHei95ZULwKekvP/crIWPlJ62mQVIg3AFuSEN
X-Gm-Gg: AeBDietQ51C5DZxxkg2/HDfi1AB9xhhsNdgEeSVs0RFZcHy3iP70RWHJ0yW+J5QYU9K
	3YIWqYuuyZz9+yk/OlhXf+3TXnFuusZ7LTGxtpaCPH9eoUWh9F/0Fi/b85/3Q76pq37xE2/bfR+
	3Da6W3iY64Rd9hsyhpVBHJhlzWFbFTS8mZGVdYdYvOjlHsn7JU+ch/w6za36sv21NYyisvj5p9q
	fjRLRiUG1U77SbQ+ar8IgM91q1MPwjGfo1MNvm/ULHBFOkP5cNjXWh5Sd3TeqDr5zfWZKUhEnRb
	cU4GZ5GyDe7C749ShueCOj+1Z3bBZvfzGv7XKAzHSROmvDuHrlMQmbqHB2Qd9XmUHkMlat87t6h
	ZU6CgTo7rZ/3+nOnaP2YoyqY3NW/ubbxf97EpCSceS+sQ8IFemECGn4QwCUSwS75IAwjf//IRRw
	GqL2XKPescddcv/HmNE4sN18sr1/DV1R1skrFAOBMAX6orEvXI2BGgLfxg534=
X-Received: by 2002:a05:6a00:1822:b0:82f:3ecc:c42f with SMTP id d2e1a72fcca58-839246caa8amr4509989b3a.40.1778005403184;
        Tue, 05 May 2026 11:23:23 -0700 (PDT)
Received: from mo-Inspiron-5559.. ([2001:fb1:d8:b0d8:5f5a:b3a6:e7fc:e897])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965646254sm3081784b3a.10.2026.05.05.11.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:23:22 -0700 (PDT)
From: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
To: shuah@kernel.org
Cc: broonie@kernel.org,
	skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	woradorn.laon@gmail.com
Subject: [PATCH] kselftest: fix doc for ksft_test_result_report()
Date: Wed,  6 May 2026 01:22:13 +0700
Message-ID: <20260505182213.22924-1-woradorn.laon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix documentation to reference ksft_test_result_report() instead of
ksft_test_result().

Signed-off-by: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
---
 tools/testing/selftests/kselftest.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 6d809f08ab7b..b50a8478d4d3 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -346,9 +346,9 @@ void ksft_test_result_code(int exit_code, const char *test_name,
 }
 
 /**
- * ksft_test_result() - Report test success based on truth of condition
+ * ksft_test_result_report() - Report test result based on a kselftest exit code
  *
- * @condition: if true, report test success, otherwise failure.
+ * @result: a kselftest exit code
  */
 #define ksft_test_result_report(result, fmt, ...) do {		\
 	switch (result) {					\
-- 
2.43.0

