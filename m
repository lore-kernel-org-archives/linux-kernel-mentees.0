Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AD21FC0F3
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755657767; cv=none; b=eyVHInoK1YunBRVFZrQQE6yh/ZcGrwqXlKzgF71EGZDyQwewqAJeh6fPj1E6b2fWuUCTwSk0fleFAY3tEYwGzCazbcfKjYiCAni5iva+svVXZIjfEfLk4sljD3VOwJBzeKgeN+ogKOqoC2k0Viphi0kI1mMM0cL9TcpAjdX/MuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755657767; c=relaxed/simple;
	bh=Q9s/1H9E6hoHtXrUZrrI8CwFU/UfqaIGHJwn3EhCeRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hhFeBIdMvoNG2sZoPLmgotZLikgDDSdJoePsc8+yN/+1M84eMLhjtbWXbkl5wpgJdVuMkeTXSH/VXHoM7OpwG4XDeub3N1ZItQoX8HBp1b/XmhY6ueRL7vO4vR/dM8RLUlar2eMJGAHb9Dk5aFjV614DCfo+QueXdivzYu4JcZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBMHV5tF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBMHV5tF"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32326bd4f4dso459598a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 19:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755657765; x=1756262565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgJSS4DuXeTEsBeU+yFhVC/r47vWoeem+y9c2tQdA+0=;
        b=DBMHV5tFAn3JPd34LwgrCNKvAzDJ05X+Np/CKxNHyW2XU5GaISfoHp8dItbEKNSFT/
         7l3VYhc6fLxt1rCq1isSoJqtw375gn1CbvSV7pqCwUspRu+Tnr+Cmxi4sdlT0lJfLGyO
         a80ghkaPFDglSYi+idNlkXYqw8xofgj6A7W8ow9otxbmmY8GbsYizKbuV733Js1ZL0l/
         pYM2omk6uLrzq/ldXG7z0BIGq4IsaEXI4nI1abyTtegz7Svk/b7/X26IAcii46PVRkqf
         QW9b0vaELoVnRXLOXz7lszc7ef7BMyBRjR7MF9p/a6F1Pg+4qecykrNrHeJY3MjtUUo8
         tAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755657765; x=1756262565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgJSS4DuXeTEsBeU+yFhVC/r47vWoeem+y9c2tQdA+0=;
        b=qxnLVWnTlNF0RTsGwTTTMkHLHjXVOMJEROWjIpTLqRz4pkPUP9Z6zvRUcP3b+Y5toF
         e27hc34QEy2Vcp1MPJNzUBLMjkgzWhKf8q80fTtfzwXCMlyggCrVEqmSsdV9Qvl+xGL4
         st/HRsxNrPyqic2xOvBvj2ulwhX/pBanyTbcvw6e8lvCCMOmDEtH/z6Qqb4QLgwCMsVe
         M8GqSmPhTetGbA1rFNltZXlknEg/KiScMuykM9Wdn6inbwKdepOsFQaPiVO1cgfiOO0b
         1IQbE01mgo2v0nWiq9qhdGf8OP93iISrRkqC5mqFc0n7zGN6nKQapVuytI78sYMUNcDW
         XyGA==
X-Forwarded-Encrypted: i=1; AJvYcCUNaQt9hLe9PvuOkaFfqR9ULELjB2gZmUBNmWSEExuNyhRdi1iCkGEM4Iv7BUZgRbgCZavbAQA9K1/lZimdJI4KZ0j/MQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmN2nevby1QvKrRoUDrPkT7xG7XiUmo39hL5Vjl8yx4goDQfY0
	EZQSpxHeOMvvp+pLlxSO3VoNw4+4SQr91xqJ7HKS8G6FRaAl0MaE5ooM
X-Gm-Gg: ASbGnctzHXUaLti/3eluBobgfFaRYvLRWRGLuuXV52+acTqlVyWMc32dNoWwQfJfj+u
	6hrNihYD4siDKqqSQka9sOMEdnuY6AYR87wbg08+F9HNYyknqlb4ZDfLF32CaVxnLvs7BhVUEKT
	yEYOA8phsJdnmR89tbKw1qXtlewUShMBkjHHWfGJxe2498LECopo4bCia1OU0Hq9SjrpLimhHe9
	jWg2XM3lUH+xnnqYXpzxWy70G3Aiz+gpq72CDinUCvi4AcU7ubupnWRLN800aKnnlvePwf95YqA
	XBNGyWUgD6pqxdHzeA/uLPBUAgsK77xK5K2vBY09nhrFLAzZf6hUYUFWYC0ozPKbGIoOylU5eVQ
	IZPNCf5i7lCWEYTWUyXU/BGoNkQ==
X-Google-Smtp-Source: AGHT+IHu+mQHQ9OUyB35MccefpKNmsfscyVloV5sAuGFK47KF7BEC+h9dbNGAQ+zFcZsPSySEL2IBA==
X-Received: by 2002:a17:90b:582b:b0:321:cd7a:8377 with SMTP id 98e67ed59e1d1-324d32d5c1amr5373995a91.0.1755657765261;
        Tue, 19 Aug 2025 19:42:45 -0700 (PDT)
Received: from linux ([223.185.135.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e258cb88sm639075a91.28.2025.08.19.19.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 19:42:44 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] selftests/timers: Improve POSIX timer test messages
Date: Wed, 20 Aug 2025 08:12:27 +0530
Message-ID: <20250820024227.11183-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Break up the ksft_print_msg statements to follow the 80 char rule.
- Capitalize "POSIX" and rephrase messages for better readability.
- Clarify that false negatives may occur in tests relying on timers
  if other threads run on the CPU.

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 tools/testing/selftests/timers/posix_timers.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index f0eceb0faf34..017a9e19ad0f 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -673,8 +673,9 @@ int main(int argc, char **argv)
 	ksft_print_header();
 	ksft_set_plan(19);
 
-	ksft_print_msg("Testing posix timers. False negative may happen on CPU execution \n");
-	ksft_print_msg("based timers if other threads run on the CPU...\n");
+	ksft_print_msg("Testing POSIX timers.\n");
+	ksft_print_msg("False negatives may occur in tests\n");
+	ksft_print_msg("relying on timers if other threads run on the CPU\n");
 
 	check_timer_create_exact();
 
-- 
2.50.1

