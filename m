Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3C6322534
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 15:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705221; cv=none; b=qelH9bEoje5HV+No6I+U3nPh81aG3Fyfh5KF8ngYXsqJJRIEAYyMDBd7oE4e5s+PrvCGqPTtxGuwv2+Bfy3j6BU3lI8Ez9RpzY0YH2J/tiiZGx9XOrxbnJB1zn8LetFJIG7bT3Ak2+oxc9qKmnuoqla6CmjvxVY1biz97AewM2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705221; c=relaxed/simple;
	bh=a/hCJoXL5I+lxBOtX74CyJftUCvYnA5vpF2rrW1Yp9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qo6m5AjoqFIFsCas330cjSJcktyaCSf/yE13xpFngMn4pseysU/iifkMrqlbXFA7OjEcVsK+sLZCL86gPz6qe0KTeW2KlQaBbbbgZUg7lvk1+Fcyfy2uMRToDIJKy97JNmeMUGroyH48WzxvBgkjlN7ZPJpi9sUc1/1eInvXT6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+v4JFnB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+v4JFnB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2445805aa2eso55299435ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755705219; x=1756310019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=85YxivsvpcP5IRNp6DBdLOeXv3NB9wRFZGxkMTe9r9E=;
        b=K+v4JFnBOHLK0QDHGtaja6vE5inWWJTkYz0rJd3eEQNnfNgD5peBE516jkr90Z34fO
         btRrLqO9ESA476o9Q35mjdPp3aK2UKm7RQDxmLVDhxoGV7azhUaBDbtPpnAOcvMQj9Ko
         F0exWR7ux6WYv7zCJ49fhzHgp9isiVZ9ksHFU5yvHwSElJVt+dauFNjeyGAVXvwTeIVQ
         H6+lYYgCWnczFkFsnFbOPr6tTHZ0NWo37xIkZHQEGO90yryyDtgHFgqQVzYwBbXzgwWJ
         n+Xqk46/oMpSttN43w5WMmxq/ROlUOpdvMSC8Mp7uSHk1kpuCzD+lQfIWae0IiWf6Yiv
         xGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755705219; x=1756310019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85YxivsvpcP5IRNp6DBdLOeXv3NB9wRFZGxkMTe9r9E=;
        b=Yzf3nh4AFTBe/+nyoiAf6rcTZDgyBO60eHsIeXjS9FAC0pA+gILeTZvZQ2WBc+NtEh
         Mq9M4huT40IQOyTfVALWpJE2zln/MiR98qlcgSDuuQCuBKGoI+klcQ4DaMSp60NFonXP
         mLliQuNpwPsMEj1UGh2Mee+ul4s3ZH2sFp8s/d7YVpIhAICoQ5KAEBAf2kN42LtgZRSq
         v2XL8Cng+cIkAOFMPHSNDgh8mScjFRLB6ca9lS0MAoI+zYHHe67FAYZh6Ji/es3HbwyX
         d4AOMVwCRLTgnlz7V0NFJSzXDsKWplAT+EKI6YftIvvRaskQT0X+ai5dYF5dR9S+yY2W
         cY8g==
X-Gm-Message-State: AOJu0YwxRhk2SCPowjvSS+Kg3dFqUCtxdIGzVJBfgtECK4WwwckJ9xzX
	TARwjE2j9EqcJBw6jcj3d+O8d3qG3yHfJeQraBmPLn8vf847UMVIRvUL
X-Gm-Gg: ASbGncv6XYCZFvFE14/O03jTaKNMsZ3487Fs3PXzJ8lsUgMCMWiBN3mZwFMKF5fuCTt
	GDg4L+oN8yHscAdWgO12yRri7GuFYmxmaIfZYGrN4x07WMGSpjt640ZhRTgvymOpn9g5hjGxITf
	+PuWOWUzufgNPaEJZoJrv2oo8yMnpTvQBZu0DZxzRpugZS0lzJq6uTeGoFxxbzxKz+Vwi+29Fx4
	ofkuRM/zs9OKQRhpkLNiGhLanYnwLKMEGZXafbhTFQmI5w+NHfpA2wDe1f5/F/Jit+V4Vnon7z9
	FbsT3mN4spJdzLskwgtQ0Zg7ZvcsqNyPIKNAoG1V12oOBaiH5NgO/ZnVlG8syvU1PWPNVVkhyZw
	wmQAFHMFrZqFNpYYYrNxHR1uvsd2ExJ+CfetzCPmo3Yvdex+PSA==
X-Google-Smtp-Source: AGHT+IGQlZwARaldPqzdhtQ7tbsSk3uP7Nk0kfrYh02Q6xCWNl2/Qy6d1TtZcYrK2wV5sowJ+h3p1w==
X-Received: by 2002:a17:903:11c3:b0:23f:d903:d867 with SMTP id d9443c01a7336-245ef2272a8mr36335675ad.35.1755705219237;
        Wed, 20 Aug 2025 08:53:39 -0700 (PDT)
Received: from localhost.localdomain ([202.164.136.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51c7c8sm30188675ad.140.2025.08.20.08.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:53:38 -0700 (PDT)
Received: (nullmailer pid 71549 invoked by uid 1000);
	Wed, 20 Aug 2025 15:52:14 -0000
From: Kathara Sasikumar <katharasasikumar007@gmail.com>
To: skhan@linuxfoundation.org, linux-kselftest@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, katharasasikumar007@gmail.com
Subject: [PATCH] selftests/bpf: fix typo in comment
Date: Wed, 20 Aug 2025 15:47:59 +0000
Message-ID: <20250820154758.71280-2-katharasasikumar007@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling of 'occurrence' in uretprobe_stack.c comment. This
patch fixes a minor typo in the BPF selftest.

Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
---
 tools/testing/selftests/bpf/progs/uretprobe_stack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/uretprobe_stack.c b/tools/testing/selftests/bpf/progs/uretprobe_stack.c
index 9fdcf396b8f4..cbc428a80744 100644
--- a/tools/testing/selftests/bpf/progs/uretprobe_stack.c
+++ b/tools/testing/selftests/bpf/progs/uretprobe_stack.c
@@ -27,7 +27,7 @@ SEC("uprobe//proc/self/exe:target_1")
 int BPF_UPROBE(uprobe_1)
 {
 	/* target_1 is recursive wit depth of 2, so we capture two separate
-	 * stack traces, depending on which occurence it is
+	 * stack traces, depending on which occurrence it is
 	 */
 	static bool recur = false;
 
-- 
2.47.2

