Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D21126C02
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 27 May 2025 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354856; cv=none; b=DXBlBvR2BSl3DCseH+0lIpqQe6klr0K1ffx4AB8FgVfc9rADZFjkXpnQzAvW2A0fWOHV+hIHmpdetenF12ATkla+Hf1hoLGeJ8doZUy/DYk3ymcDZxjJGGB1aJrqUXEAU2eh49tl/ur6Ggf0lPqjoIvUppS5mtct/HTUaia1IFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354856; c=relaxed/simple;
	bh=iV+5TQFLMdpDIjSDs6o0Yi6BOun9sKQbdLa23G/sI5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jt6s8zFzgTJcLqAPejtj/RZzASm16iQ8XuffALYviXdaQSih4zw1PJuiz5kISZns8wLcz3zeHqML989n3NRPNceE1UMo3iFXQvS8bUCUhQZFAbBC4dKy9M5WUzSQE6yi2vNLBnvsXx12OA7vuITM02RujKp150Auym8tVnVD2jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BX3qBNaZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BX3qBNaZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43f106a3591so3790265e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 27 May 2025 07:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748354852; x=1748959652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpK0x0wXhOnGFBSWU3ce03ScwCxpFS8ONVx7+umFELU=;
        b=BX3qBNaZmteA2dazEW+Wg0+1B9Wb9UOGbABoIns1TbJL25CaMjN5wIytPg8dUa5jC1
         rCQ4BTGqKYbBn7Q8ZbAxiayzm//I8rm2Lu7fKwhj0ycypwZvjapPupN29qOfnBmJigAv
         VEhzXQ9K2ykR8SDFA98O3CgAZuXLqhkvDFJKxlmvN9jlM1T0Yfpr629RYFen9579oOh9
         wE/ALsXJELOgjm6mJ30kSW8x0I0bAMV4IgP58gyJPuvKpTOboBFr6B55iS53hYbVoreX
         zMochwAiOTiwITqqxQAEnQPeSry1kxGY9DUdsSK/Ac21gE0YCyjnOMYRSJeey2YCoDQ1
         rl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354852; x=1748959652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpK0x0wXhOnGFBSWU3ce03ScwCxpFS8ONVx7+umFELU=;
        b=N26tv2dZ5AzgEhJzRPGY+4Qqj141zeNLI9T/8j9VvGmiUexJ5TJkwL+cdy+jSw7Lsg
         4UXZwx6auWjtQbTu1hubnq0/CEnegajlFynnCSeS/c7L6Z7+0xGymrRHsysgbjAp4mwF
         Lfe2/BrWCA+FLCcNEl+vSyraYZ6unypxWWAz7fcyw3ddGZPxXCKeuGtVsfoMaks0n5IC
         Z6PB6ijRA3On3xvK6q4hSh6pkJOesfCSjSAo2o9PZfBHxK5P5Xp6E37WIUVBSL7GV+Qg
         KbmU3+tIVQgAVx33MuSn7UojqwP3kZjIoVO0NS7RnFjO61RjNnJmhqlG04yNP7HRbuUl
         AZJg==
X-Forwarded-Encrypted: i=1; AJvYcCXwz7ESLjO8XeLbrBr+XHQwSpdPOUkp+O4u4v1MTstyvIOwzZtUNWVZzAM+ENgpV3RN70IoReDK78+jmgUM2+2OJOPZ4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWhs6zJEok3N1EplpUIzA5JGob/h1pp0eIdjFKoQhKCnjSap5D
	hgsOcQlqf7Hn6KUJ+KhSadzM3JbsK/U1lAsYd7DhTK3Ga78/AOYAJZGM
X-Gm-Gg: ASbGncsE2LzAp3v4oqQJQrG1ABeN7wizouEZfPtFCcjTstG8Rim1YFYohRxgrdb7vZ7
	wxYsFypMd5OSGDLo7/0/KNsutwfpsOc45XPcIind5/99Ahx37gXxQG8q+NXsLpWW1akNGNHsdoL
	i0ZFS4Uk3nyOj91Z1Q7KbOnX5wJ7x4jWPMjWdhhjqOdDHhn5AVcVbTMa2BbcTfsZHu7P/1BMkWf
	ODduKlIvC2qDcle7QJTt+r3xt2sj9cknfR7jF0umd8EXmSi6oWfMb3OpSXA3/TnBCDl6L/kxKtE
	EBAUjuBdsZR+mtNU014TVCN1ffVO2F15BXSU5ZEj5zeIC2EsLX8bL/w5HACZOQRMkyoCP4yKm+i
	DzhbEFBCobEd9dQ==
X-Google-Smtp-Source: AGHT+IF5wR0JTE7yne3C1fjsCZJEquPOk+vzdCS7cS6ql1aWdP7U83LYFb0zWYD9Fq2nGsaFp64KIQ==
X-Received: by 2002:a05:600c:510a:b0:441:d244:1463 with SMTP id 5b1f17b1804b1-44c8f355466mr46368625e9.0.1748354851830;
        Tue, 27 May 2025 07:07:31 -0700 (PDT)
Received: from localhost.localdomain ([156.208.106.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29548sm284630675e9.4.2025.05.27.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:07:31 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] selftests: acct: fix grammar and clarify output messages - Fixed email case mismatch in Signed-off-by
Date: Tue, 27 May 2025 17:07:27 +0300
Message-Id: <20250527140727.16910-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e2ad679c-7c68-44c1-b4fb-20b3d02a7c35@linuxfoundation.org>
References: <e2ad679c-7c68-44c1-b4fb-20b3d02a7c35@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, i already sent version 2 as a new thread 2 days ago
but found out that i should also send as reply to
the original thread so here it is.

v2 changes:
- Fixed email case mismatch in Signed-off-by

This patch improves the clarity and grammar of output messages
in the acct() selftest. Minor changes were made to
user-facing strings and comments to make them easier to understand
and more consistent with the kselftest style.

Changes include:
- Fixing grammar in printed messages and comments.
- Rewording error and success outputs for clarity and professionalism.
- Making the "root check" message more direct.

These updates improve readability without affecting test logic or behavior.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 tools/testing/selftests/acct/acct_syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/acct/acct_syscall.c b/tools/testing/selftests/acct/acct_syscall.c
index 87c044fb9293..2c120a527574 100644
--- a/tools/testing/selftests/acct/acct_syscall.c
+++ b/tools/testing/selftests/acct/acct_syscall.c
@@ -22,9 +22,9 @@ int main(void)
 	ksft_print_header();
 	ksft_set_plan(1);
 
-	// Check if test is run a root
+	// Check if test is run as root
 	if (geteuid()) {
-		ksft_exit_skip("This test needs root to run!\n");
+		ksft_exit_skip("This test must be run as root!\n");
 		return 1;
 	}
 
@@ -52,7 +52,7 @@ int main(void)
 	child_pid = fork();
 
 	if (child_pid < 0) {
-		ksft_test_result_error("Creating a child process to log failed\n");
+		ksft_test_result_error("Failed to create child process for logging\n");
 		acct(NULL);
 		return 1;
 	} else if (child_pid > 0) {
-- 
2.25.1

