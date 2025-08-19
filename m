Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4216F0FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 03:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755572487; cv=none; b=b4wid3B2qGDCN7uXhPRen9/BuWkSmld++YqikFWAL8jTlKMz745QYZAr1ZDY8P4cfruM6C648cQZRa8XWxG6XGXgXEBRcAdfXo3bhFc/ht3u0dUqVi0GMQt1cZR8E75hfBLNGvwEHex1m9oRSmJEGWfNzUSK+KCdaQIIvmJ1ltk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755572487; c=relaxed/simple;
	bh=LIUlD0bOhl9LKp+DEmmBizXl3Wwv9AcVYNU8bGnJHI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wqw4Ori/eAzN9bLWOBS0LJkzCUrkzgAvFQXkp1cMPLxwdqD+8QqlSLmeaZZY7m9bVs6AhNFhgbW0PQe+lWDmg8YK8gEtptx0rALEtVYUM249mg/F7WezjdopYKw+zoB6zfSzPU0bf/CpijjcdnpuqBJ6GSF9uEhJEYktCynmQyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBpHk4LF; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBpHk4LF"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 129D240079
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 03:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uR2MSYNKHCj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 03:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=higuoxing@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7863940061
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7863940061
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jBpHk4LF
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7863940061
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 03:01:25 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76e2eb49b83so2996597b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 20:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755572485; x=1756177285; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJI3ZAK11NgguXE2fOYjbQz/OCmgh5JmGWFmHEPsM9M=;
        b=jBpHk4LF6/xALlZjrG5iqH8gpQ3abGvUEQ7TZHtXJx4Vofps4bHZroJs+x/AMOBhvw
         tammbjHDKGrVhnUdKmZnaom7n6c+43rEKhYj9ycVFe5yAiCEEAe4tBipGsumNdbFEJrj
         JHTML3PAx4nmTuoLs7hJxWaaBPavGLIEGO5jhELyWbCz+lkTW48fc/AULGcdwhC8FKYx
         t62CqC3GNHudGTGWFqv7h6SJIRG/URvz3BQqyAElHtIcKrU3BLjqcbevNPtCU/LqW2Xi
         g3hPStP4ZZkNtt/zHa2xFxTMt2zUAmfgSlmpSNTwp8LfoEBfTLHWF9awy/eAPLiQssGU
         +cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755572485; x=1756177285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJI3ZAK11NgguXE2fOYjbQz/OCmgh5JmGWFmHEPsM9M=;
        b=qL0TsxNosf4zuagNIhk8z6ZLHcb0IynAMKclZObuM1SLPw6LBEtiOhFLmXEr2Gtbbf
         MVQtiDPGGF/BqHNl0NP2iDmY2bKp46RhOO4GMJGeGkSKS6VgY6h1rnhm2B0wauCzcQS8
         GYIe7R2Sqqo9oEj/pwjZMIAIjaqz3oPjFoxfG8MimQAl+LDLjCcL6QqFQ73e/L/CxKQV
         NngdRLHXu32XE7VMAVKnNau1URMCRJsyToGghC6GY0hcesZobV8cohW+B1WERPPztQGa
         fzJA9IwwizjIZfD6F2KjrGI9/yUfWewPBQBBwm7N1zWBIojblVIFEI+Axl92yluHb2kP
         rPEg==
X-Forwarded-Encrypted: i=1; AJvYcCV1UwIBCKq8D5zFICTKAscqMLp2gO0MsXImDeSVnY3NsCSB13Kr5psA1BTEuXQ1Gz6n/ILndWZihmIcO5CxEr6+blkdFA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyDlDJjns7blaqRgeYTOZp+d//Bkz3zO/WejnNFKbKeAffoEsAg
	8xJZWCvsCae8u1iJl/aEahQ+9fzw0KSHjgxqncyZFton1Wwa6VxhViCz
X-Gm-Gg: ASbGncuOPXftn0k1IHNdjTdTS2XeZjt5S6na3PSk8b1EhHO2Vc17/sVcz1ndPM3A5uz
	9YZSmBW/pMdcGxFi0wbuCOpjKJEyEkXAIbKEGPqt4am5AAmrykmcELeoTpnyzIu36Yy4vcWhsH0
	KqLiXHWFbgZGO1FvnpKWLcNhuPBhJ9iPtDW9uUq1uIDN/uYM7mxHpAxk/KSIKAqDjGR/8g1EXNw
	NSwBQoWKqIYx9CROd62B3iwXGSGVYpRrHcOWQuW+4JBYG6KixywkYk+xrMXh285or77BH2Objwr
	SjWh6YFjhD26EqWnHEnXb+aoIo3PvMjKh7Vp6bcAX+aMs9QMNdlIwE+cfTU/BKO3e0bQX3vcVdc
	r5EbcAPhYlc7hKHhUL2JRAMXTgO/OywZ1Ti8YaVil2q5Qsm4Ms1U=
X-Google-Smtp-Source: AGHT+IGLpgy5TvyasZFI/Vtx4TN6UNximlO3d90vg7k7nAu1nnDWi5zDUi8y2Lx8PkZXhWjYVJxK+A==
X-Received: by 2002:a05:6a21:6d81:b0:23d:9cca:e710 with SMTP id adf61e73a8af0-2430d492bd2mr1133064637.44.1755572484615;
        Mon, 18 Aug 2025 20:01:24 -0700 (PDT)
Received: from localhost ([192.19.38.250])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76e7d0d3990sm1021214b3a.10.2025.08.18.20.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 20:01:23 -0700 (PDT)
From: Xing Guo <higuoxing@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	jhubbard@nvidia.com,
	amir73il@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Xing Guo <higuoxing@gmail.com>
Subject: [PATCH] selftests/fs/mount-notify: Fix typo memebers -> members
Date: Tue, 19 Aug 2025 11:01:12 +0800
Message-ID: <20250819030112.1136441-1-higuoxing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I reviewed these 2 tests and found there's a typo.

Signed-off-by: Xing Guo <higuoxing@gmail.com>
---
 .../selftests/filesystems/mount-notify/mount-notify_test.c      | 2 +-
 .../selftests/filesystems/mount-notify/mount-notify_test_ns.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
index 63ce708d93ed..18147594d619 100644
--- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
+++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
@@ -208,7 +208,7 @@ static void verify_mount_ids(struct __test_metadata *const _metadata,
 			}
 		}
 	}
-	// Check that all list1 memebers can be found in list2. Together with
+	// Check that all list1 members can be found in list2. Together with
 	// the above it means that the list1 and list2 represent the same sets.
 	for (i = 0; i < num; i++) {
 		for (j = 0; j < num; j++) {
diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c
index 090a5ca65004..67c05bbc5e45 100644
--- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c
+++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test_ns.c
@@ -236,7 +236,7 @@ static void verify_mount_ids(struct __test_metadata *const _metadata,
 			}
 		}
 	}
-	// Check that all list1 memebers can be found in list2. Together with
+	// Check that all list1 members can be found in list2. Together with
 	// the above it means that the list1 and list2 represent the same sets.
 	for (i = 0; i < num; i++) {
 		for (j = 0; j < num; j++) {
-- 
2.50.1

