Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDC62DCC0C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 02:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747965921; cv=none; b=pbaDMUfjMujzl6VjLnLPGW4fRD0XlE9Dzn/eE9z9fOZhbQ1VLU3+ngsj8jjhBC4sBFps/6f/iPJ/YcXUSiXlrJxcr7h1auyegVJpPGSLfkTXUp73i3itE1IfC1e9o9/DIgkOkSDpMV5hpjRMpBPTLOPkWUpW87L0l2DLa4LgplE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747965921; c=relaxed/simple;
	bh=t6vkiS2YUjIOsD7RstZJwo0bDC+lblm3s/+4t7X26eM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I6lV2Ag0Zx/NmezmwUqAOOjI0LXyJb3zqPeDLK22GRVP3tCR7yUXfv6mkW9Yh5TaZk2sVa2p5hkwbxIgiV16qhNHBugf2lM1OAGsF+fy+IwtWE8iEjCS12E/I+02q8/ZVABODYNIrrYM5KHZpHyskla8IIWF4auNnlOe5QdPfA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJK1yp18; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJK1yp18"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a36255d0f6so1031530f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 19:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747965915; x=1748570715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ab4TBY8+6wZEJCd9/Shv1fgIXmlDtuiVTX73n4iUE6I=;
        b=ZJK1yp18VDto6WBHTwlxMOIg7CDOYmqw3XrFFjlAFmFtwQZ1XjLUTZIu/1EE9HyUOO
         KyQEYr5ocKSN8r1ZxbidAxSGApbYTVIRiN6ByRI6diljuIJlDwLz8bn8q8jZ5vG7dNHK
         8dYbQVby07+47s0X79Kj28xwQX+rdAPIu1zFXqPCdtoYMXkXVAolpDPU3ghAY38JVR1x
         61XrgVA8GrzrSy+D6NAaIdx6agHjB7CNrABztM/w77VZIWJcVDo49cAi2xMbA1W8eQH/
         XYVG+0Q3rzHlvnDPjMVZ75uDBRpGYLQMjZnSoObeq6wC+wX5KPysJ1M/m/PIbpOcDdqv
         iaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747965915; x=1748570715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ab4TBY8+6wZEJCd9/Shv1fgIXmlDtuiVTX73n4iUE6I=;
        b=LGLAGSIpJimkU7uFB9b+X/sAcKm+eCkSBBNqY6/K1uPGkecB22gpIDS2nmAlE1Y0LY
         J4hcBasO+pb6Uk1Cfxn2ESToCn6kdv2T9bGgdraqid++Kghc3UmOv2Mi9nlZppGR259t
         StMNMENkAjgyrF8DTwf5JngXTQ2bAR01cAyJQBbRwfUr6ISbmB/jVew9dX9+QvBDT+56
         O0coq75OMJj+LkESOxEJ6tFo7+bPslLrqTXXIoectDPzesGh0lnZ6dbn+9k+iULclDl1
         7oVwbpJvQiqbXneHd5kGZpZDR5NMctJOft861Y1wetdLtPMK4GguMN4yiF/aWsmi8Odw
         9eEw==
X-Forwarded-Encrypted: i=1; AJvYcCUdPLwLPBvvT0MDfujti5ytFx+n2ifYbsgQEhQXjSW/foV+SIpSAclUvcJLUfY1TBHXCRVuucEWpaLQJpRAGgX5ZRdA+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzWdbqgRe6Aka4u03N8fTRLzedkN5bJxul5jlLAbbm3RfuQJWC
	IU2uaoIs1tgYyk1uTaY3RLPPkbBf9nXFgcs6b+U8BE5J1peIyx/0xvA5
X-Gm-Gg: ASbGnctyBRq9EK2zxjhu8VylVCg+Y3vjvvuFcbeu9Q9Yh5kf7GKUEnmmVwWz0XsRpVu
	8nwAPF6eZz1jfD326RoRUZyHoNOhpnsyprbnP2WIwC0zxtAAofNNCVOOgsuNz3MDnAg0RWvBKk4
	MMN7cPpO0KILnchmhDdETsR5Y6jYcPl0ycsAGUc/ffKGLjowwmlGtuDdCGSuNUM7ZafKGRq/VJq
	jymYZhLhUkVawyg6sVY1JV2+/zFrstl7F97JyhHyMZBgbn/AKSkDScqKex8Hknl2x4BSyuGAr0A
	kh3PDOj2tN5Nbff8bYVJXNOz/pqzLdPYzCzgjpqNGxI0v5nX5BkgMeKuqZY51bk3bgK1wjr5yHM
	PVctm8/DFSA==
X-Google-Smtp-Source: AGHT+IHAFXL5jLJGKCr103UUn0BkLeRHNRUbWGrRTGlyoRnpv5jHh/LALzOyA2CTUOXO1w+tqRiLDw==
X-Received: by 2002:a05:6000:40db:b0:3a3:591c:40f1 with SMTP id ffacd0b85a97d-3a4c2e5f6c4mr163203f8f.16.1747965914704;
        Thu, 22 May 2025 19:05:14 -0700 (PDT)
Received: from localhost.localdomain ([156.208.37.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f0556bsm122486855e9.12.2025.05.22.19.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 19:05:14 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] selftests: size: fix grammar and align output formatting
Date: Fri, 23 May 2025 05:05:11 +0300
Message-Id: <20250523020511.10306-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the patch. 
The Signed-off-by line mismatch reported by checkpatch
has been fixed.

Improve the grammar in the test name by changing "get runtime memory use"
to "get runtime memory usage". Also adjust spacing in output lines
("Total:", "Free:", etc.) to ensure consistent alignment and readability.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 tools/testing/selftests/size/get_size.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/size/get_size.c b/tools/testing/selftests/size/get_size.c
index 2980b1a63366..d5b67c073d8e 100644
--- a/tools/testing/selftests/size/get_size.c
+++ b/tools/testing/selftests/size/get_size.c
@@ -86,7 +86,7 @@ void _start(void)
 	int ccode;
 	struct sysinfo info;
 	unsigned long used;
-	static const char *test_name = " get runtime memory use\n";
+	static const char *test_name = " get runtime memory usage\n";
 
 	print("TAP version 13\n");
 	print("# Testing system size.\n");
@@ -105,8 +105,8 @@ void _start(void)
 	used = info.totalram - info.freeram - info.bufferram;
 	print("# System runtime memory report (units in Kilobytes):\n");
 	print(" ---\n");
-	print_k_value(" Total:  ", info.totalram, info.mem_unit);
-	print_k_value(" Free:   ", info.freeram, info.mem_unit);
+	print_k_value(" Total : ", info.totalram, info.mem_unit);
+	print_k_value(" Free  : ", info.freeram, info.mem_unit);
 	print_k_value(" Buffer: ", info.bufferram, info.mem_unit);
 	print_k_value(" In use: ", used, info.mem_unit);
 	print(" ...\n");
-- 
2.25.1

