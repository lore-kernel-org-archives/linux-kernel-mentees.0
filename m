Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E904C1DB127
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985597; cv=none; b=mRSoThjTlrhgx9NgYF02nZrdY9pibOPTYNaFMwY/7Tyyf0I07Bl3k7xOnPMamEpJePoXg0TSFmADpkbJc9shbcVI5h8hq7v1ACabAsHkX0bDEQ5oaoHCpHi369eUCaYV0ny27OI1yeo9VINeLihDNZfK4yWGDSkLtaDgpb4hz/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985597; c=relaxed/simple;
	bh=qAY6EeFJTZG28TvoJgL9U5bXPgvj6ZZgzASuq00yAbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nWux7WCA+V/rNFE0BIKuZFMF8fMoUWTNRNHu3gJ/S8+rPlqpZ1GoY6Shl3EMQ3zCBjFRLBTmgE3fBCtMcDbKfsXi66bqlY7vKrW8TdAd3CzRJ9DqYwz1dzzEpy3/HOOaiqBAcRawnvy2OdVdmrUMy9QjvIZEAUNtoGI9dndxtiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=UIe2d6di reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="UIe2d6di"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d817bc6eb0so52171555ab.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747985593; x=1748590393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhDC8DXcjYenT+PN1rPVu6Md6wucoYZjvtH8KVhEPDM=;
        b=UIe2d6diHnIIHrGHaWZFaL+CIORDeokQyF1/x58HYOnP7YMFnJciP8NjBSOwnFuXjQ
         26eOuDcxcv83Dqq8/4m+IMnlWaxgn90ZH293Awdb3jw+uh0D4zPAVWtaqJaqXvxLpOce
         zC6heUhgVqYltGmFgHjcWJS2FP0fu7ZShyQxSiDYHh817/6mjw4mggh175LWk9DhFgJ5
         NVwTa+ivgolrAfCZUSEuYZ0U6U/rkG/zmh7F4VlRfPN1uJhywYa/AR8WaJQkb3MBYsQd
         xEdofZz6hHrpZY8fmn/Jht9kWe0Dc0/58EpYP6qBhHKtZ3UfRnRKMxn1l8IAWZppCh1R
         Bn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747985593; x=1748590393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhDC8DXcjYenT+PN1rPVu6Md6wucoYZjvtH8KVhEPDM=;
        b=A4749OB6tRx6oZstM4wTp22MdnHOK9b2noCXB2QG1jmUzlRF+Q/yu61AFzLIRFgRUD
         hgH0ALVCPufLTps6ASh8OLxAyKXuL2xTdq1SHJNs98MCfWySVyc6mTt1Rmz9xEQ7N3KX
         A55mgzXdeVZXaOnxgHdPSODNmIxfzhghJbVka+QUQhICBZYpEjss6n7sKxGjFHFPplCf
         Wa5d+Y2Ft9/hU+nfFbUylFSn5ug9AN2Fgvp7CdHyJxLKic+VW7lgYRW2qc04SJ15zeUp
         /ma5ZZckv7RFhFPMc4U+ogYlUDcXnXb1FmqUOKKfsKD5joDuR/AFNlMX09bXBVgRPrpe
         8GYA==
X-Forwarded-Encrypted: i=1; AJvYcCUpBenvNiMytugU65OseYMNQ3WQsLSoe78dpVaNsQlyYveAOk0k/Vem/6S2p95u/DRhpSaleeYHAo1iP+gzgz5g2A/0Qg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3E6VVusvF/JAmtZrIRDvIMKu8/vX1WEwJbjF0is/JjTQWDmxV
	qQVmCSb+ds5TCElHXSOuF0YVJzF2HzQHjLkOsl7wQnVqocytBUwPnGs9hqLdmsFmroc=
X-Gm-Gg: ASbGncsT06CSnarJ39A78SU3/+jGDaDJsOan21DzMiiglmhDSA1s9kkD9C8JzTnJTo4
	nklugDi+P2U3sDt6nJOKnhbSt3awB8qxsUWBZ8N5tTMuWZdFf1lDm3dG1stmSlKudLiejyoE2HE
	MyXPQBEikcq7GR/Mlz1btSTuOX9R5mYwTMa2wm8HJliqcJn8gRw8DGnEQ6KibJXLWKLIsA8391e
	X6Hin3iVLHr6yqGKLoFHe1NfMaQmEPt77mB0YXifJUWjONdIKwhmpU8tDpU613EaP/HyF1YdZyO
	ILrMxu7bTuHiPKn0AVxLe9GaDC6LkHC47SnTNlNGltQZC0mXCk+v5+jDhFCVuF0iDPwZ0jHbPYP
	CAH6t2rQ=
X-Google-Smtp-Source: AGHT+IG79dWbaOnWh6fbDdUHStp0frh1mqNr2bxuilmex7AQRbHU72XCruvtgyU30RqIruk4/I1vVA==
X-Received: by 2002:a05:6e02:3b05:b0:3dc:7a9a:4529 with SMTP id e9e14a558f8ab-3dc7a9a4999mr104600585ab.16.1747985592940;
        Fri, 23 May 2025 00:33:12 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc3ae5b9sm3460807173.32.2025.05.23.00.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:33:12 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2] kselftest: x86: Improve MOV SS test result message
Date: Fri, 23 May 2025 01:32:21 -0600
Message-ID: <20250523073220.112238-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apparently, this test completes successfully when it completes execution
without either causing a kernel panic or being killed by the kernel.
This new test result message is more descriptive and grammatically
correct.

There are no changes in v2. I'm resending this patch because I addressed
it to the wrong email for Shuah.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 tools/testing/selftests/x86/mov_ss_trap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/mov_ss_trap.c b/tools/testing/selftests/x86/mov_ss_trap.c
index f22cb6b382f9..d80033c0d7eb 100644
--- a/tools/testing/selftests/x86/mov_ss_trap.c
+++ b/tools/testing/selftests/x86/mov_ss_trap.c
@@ -269,6 +269,6 @@ int main()
 			);
 	}
 
-	printf("[OK]\tI aten't dead\n");
+	printf("[OK]\tkernel handled MOV SS without crashing test\n");
 	return 0;
 }
-- 
2.49.0

