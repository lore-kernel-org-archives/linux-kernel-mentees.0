Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E1E25EFB0
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Feb 2025 17:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293616; cv=none; b=RawH00sKSK4fQeiAFTVNwsL7z5Dp4SHDFhxthxE3rmZkvzoDLwfQDAUK1jXlMJZ89blR70xEQ7nLbzm4a7o5g5D0inO3gyGnoDplCWPX8Qx4QdfZqzx3qNY6hNwUcCJBPBDfE1/p+2ltywxhYqgDVM3UhQndhvt2SUlmF6wsMnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293616; c=relaxed/simple;
	bh=KUxFX+4f0Aizw7Mg85WPdNi8c0DEahMb6LLBmtuIvak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RmhOUm5d1kbuW46tytZk9AGiodikHxkjQsdk/HTHhEbu7jgWocvZ89L3bKpZZkNu73swJ2Kk2WTWs3KlM9GuehGNHefahaGc1svsVVoeRMeNiyq0LKimu8RX26PRAcsU4cB8NlNVgo5ZkdUcbwoLJRXyYKrryZA0e7hBq+wfXGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGH7V9Vl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGH7V9Vl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f74c4e586so62182585ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Feb 2025 09:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739293615; x=1739898415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K89iMvYVIaxnJ+fqwfSq5htV0qyp5rhqJml9Bv4LRmc=;
        b=lGH7V9VlLzJ6B2A1goktenvUsob0bXxkIlxSbLm08V9zGfOA/lp5wzRLucxABQcKW+
         3qrC5MSsXQjklAytcKVzlrJGdDrR9WHIRaK0pRPZ9xPcWzVgZbc/2Rurvee0NQ4nfxEJ
         YSW1rVaZb7UCiJGrenvsGCComEorRP4WdPs4ufEoTc3VZBCPNqjyMBrJHBD/FHNYUglK
         e/08JbfOLHrLOsX5Wk10xyO70UeZQfXRg1pIElIWb8E1wzU16retqHJOHV0c0bHMFfk0
         yuDtLMpzHqOyPTgz1HGAsl8nOYoeIg3wXZCGchbcqCtkUimJqBLWkxu6rmPNGACXS8Ig
         n30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739293615; x=1739898415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K89iMvYVIaxnJ+fqwfSq5htV0qyp5rhqJml9Bv4LRmc=;
        b=ZBv20sxM8QMpSCmJ396RPhTnSVtlYYMHmjXTd2jrxyPrreX0wjHHEIqBAQSH1gzTEC
         O2w3RixbrclHJnTh7r0qoheDeRhAKs9bH+yORA/Glq9AsJtQVUpZdEswUWrRZVaGnNyS
         cl1aSf3PJvfhKll4ifN03Xrt98kUtSuK9Ap34cbM+FIGKKTzzg6duyIyriF09RAxpFoq
         UoR3qgt6vNtBpMuHMWAZnnd0pTslPW9An5zOl7Vt2qShH7he4gAljHONXKcwvP5mNS9T
         p0sL8opxXQALVJiZO3vEyz6dksIm2ylagy4fyeZ37RkOEDJFnwbOgBtobk3VAKIupy5R
         DqNQ==
X-Gm-Message-State: AOJu0Yx9PC+HrF0Yk4LsFBD+dUEfih2S2Dlrue7yapoR71+UsItkyRO8
	F9yJOaXLKAe5/VTYHLlV2KyeoObSHdYBdKlXuz/hAgX6EEaS+YD4
X-Gm-Gg: ASbGncssGtiq7X9kP+9m00oEr/Bc9STn2N6ZA9dy/lI+nCiAsCbTnxMyMeVJZvJusR9
	hODD2DXxBoU4UKqeB0x/mabKJoecUnOFuvgqbMN6SfPyznRMkEr6ysFFrLYKTjq3yznGI6fYqzQ
	n0+Y/cjWutYWXAN38k4Ucf0PJR7KJEfERddCzo/BlLPFNZ+JX8gRx10noy1ibXya0t+VXi095jH
	gpeXjVMqKRligkTRsaDTAKtrQIoYdaHVRHrMDr4VDHisc0Ea6Z5251JqvYL94LD5SGTZJLWwCAE
	PK3agrW2zrzvXRf1s2V10cmcdHhcetLjiQzOkQ==
X-Google-Smtp-Source: AGHT+IGB+vjQ5s0SwmcosKl7wURY8go+C8mrSt4nLtcwIuChxJS2yP9IT5jNJEi+3sPeTRIN45Suqg==
X-Received: by 2002:a05:6a21:496:b0:1e0:ce11:b0ce with SMTP id adf61e73a8af0-1ee49f9c009mr8682058637.35.1739293614486;
        Tue, 11 Feb 2025 09:06:54 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad5572d641asm3337229a12.12.2025.02.11.09.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:06:54 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: horms@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] selftests: net: fix grammar in reuseaddr_ports_exhausted.c log message
Date: Tue, 11 Feb 2025 22:36:33 +0530
Message-ID: <20250211170633.4458-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a grammatical error in a test log message in
reuseaddr_ports_exhausted.c for better clarity as a part of lfx
application tasks

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 tools/testing/selftests/net/reuseaddr_ports_exhausted.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
index 066efd30e294..7b9bf8a7bbe1 100644
--- a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
+++ b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
@@ -112,7 +112,7 @@ TEST(reuseaddr_ports_exhausted_reusable_same_euid)
 		ASSERT_NE(-1, fd[0]) TH_LOG("failed to bind.");
 
 		if (opts->reuseport[0] && opts->reuseport[1]) {
-			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets succeed to be listened.");
+			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets successfully listened.");
 		} else {
 			EXPECT_NE(-1, fd[1]) TH_LOG("should succeed to bind to connect to different destinations.");
 		}
-- 
2.47.1

