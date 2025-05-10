Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553861DED6D
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746902868; cv=none; b=R2paHG115sh8K/wBVMSnfEQE1Fad2wdTxDkXEjjFRXTq/EoUgX3xg/gPhwM8jxIa5quvUQhSWRLqKdRqzxEX9Zmwfmp0hAQ9yjVTWTqLIHErD8VKkiFBdXAQHcgKkwZfTnEJIm/FGYSrCGtWq/pNIlkVeGohn+6u5rHAPYqJcEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746902868; c=relaxed/simple;
	bh=L1j19XD16Pmx2xa/rrGqIBgP7XAqdou4yQFSC/F63nY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXHm9vi89vXD9vzeGVxG/m/650KrCoya8Dq5rd+TIhc2eiKg7XDxGdJUkSU8RYA/aCVXzQxgmc5n8HbdD18oQggpVomJVlC5Mdq9PpN2KbKbJLTThDzbbNUYWdsmIyVrYYu/HYTGqHl07DLxkHgqfqkUT3EW/p/BW6d8nhLTfAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B68a5zHQ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B68a5zHQ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b074d908e56so2072861a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 May 2025 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746902866; x=1747507666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q61TaHYW+ivShFmxukNezPRDLRq+ybo9Om6oxCMvOBo=;
        b=B68a5zHQqZoZuobVCAm1rYCWh5ULEG0vyFSUi05cFdVG36sLhLetENacrynm9tawvC
         8S19IBB5vYhxF24VjdfPRuVj2Z0J8NpH0mgApxEvO7P5Vm2r2laoFkCJlrF1AvtiBf7e
         gdvooA3py26lIYCvHjfRSzKhABHw1swVgPJ89N8JKu8PxSKHuGJuKEv86Abk8tHiyKVY
         dtllMezCZN3EhhC4qBomBROVbAqUXljCrV/51KfQ3n0dp8SV3tMXS+gYF4OuLi7Q1K5I
         ZohcxwwodvjJGzkXWLtHZkjwAkW0igJ1seD/0dgvPtBciTHz7t5CmOk2uias20gLx0yc
         gmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746902866; x=1747507666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q61TaHYW+ivShFmxukNezPRDLRq+ybo9Om6oxCMvOBo=;
        b=MGzJNsUq3VQAwy0zTv/g71GnyeLL4EUVnMeXZAZTRooilHZXAApQ6tKHbdYPD1z3bN
         g/KHn/td0RWEV98KFVToUpDgub1hggJD+lKz7evyznGP/M7L6fjttLNdv6KBpiQymp0R
         aNnTC+CddE3CxpeNlEiQKNB9fE402JXhf7f5Zii9eDtQNYwYgy4wDWyFu9nGOfLYGCz9
         Rm2oxpWubOeiDNI49UKfckpoes6YD+IsKvXEenvQBrYBPGl/CRKfapyfOQVOLLqBpwGN
         TIf58q3caTV8s8fIw7ogmZh1UeSrnV2DFDub0eAL02eXo7DGeZ1eP1OCUDXWWdCeK2hq
         aveg==
X-Gm-Message-State: AOJu0Yyy0RUFH7/W7DcNFEKmTGoRIu/WYuUIAyKjGCS16/ar+1mUgNPA
	r/Bo/f7/SWvk4XAIykBnv86dxQJFsn6MUkCBM2FUPRt2/IFH+md9
X-Gm-Gg: ASbGnctS0O2WzJJjp/q+vbvvgrd3AjiFUCJPZ5NEbcDuz/wPtCUzmAVR8UXjvDM7S0G
	skJ9xMpsrnyZuA7PfHP31s53u1wn0zjejAijINISVOyfW6/R7HUt5NNLnqZReFpPTVmXEyA+NGX
	rmFf+D1hKQBv5nfgvCF4fej+krt3+HZAj5uB3s93s6V3fmG0QHnvOXglIoPQOIB9f/z3xK3AeuI
	zy2RqB+LygxkFz/xtegzrS7a0BEztaWdZGbO3kIB5MAT+s6Bc7iThf19K3Do3g1NBa6oznnHTta
	9WmKUwNe1uxX8BOgUjoQ5E6g/mRKN+h6qHoHIYqRxHtoe/MrQjhgumUzf4+Pd6iYTY20uWfCNkp
	u06k=
X-Google-Smtp-Source: AGHT+IFDX15DHKvx49SFGOI3uN8yupopOlTlzXxH3QBsDKhq46eIZIKSEuAlW0EQtuv21T6o+iDmEQ==
X-Received: by 2002:a17:902:e84d:b0:22e:62cf:498f with SMTP id d9443c01a7336-22fc8e961a1mr125418135ad.38.1746902866378;
        Sat, 10 May 2025 11:47:46 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:7b7f:bab1:cfed:9805:ea32:5760])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b450sm35797895ad.178.2025.05.10.11.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 11:47:46 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: trenn@suse.com,
	shuah@kernel.org,
	jwyatt@redhat.com,
	jkacur@redhat.com,
	linux-pm@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] tools/powercap: Implement powercap_set_enabled()
Date: Sun, 11 May 2025 00:17:09 +0530
Message-ID: <20250510184709.44935-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The powercap_set_enabled() function previously returned a dummy value
and was marked with a TODO comment. This patch implements the function
by writing the desired mode (0 or 1) to /sys/class/powercap/intel-rapl/enabled

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/power/cpupower/lib/powercap.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tools/power/cpupower/lib/powercap.c b/tools/power/cpupower/lib/powercap.c
index 94a0c69e55ef..7947b9809239 100644
--- a/tools/power/cpupower/lib/powercap.c
+++ b/tools/power/cpupower/lib/powercap.c
@@ -70,6 +70,22 @@ static int sysfs_get_enabled(char *path, int *mode)
 	return ret;
 }
 
+static int sysfs_set_enabled(const char *path, int mode)
+{
+	int fd;
+	char buf[2] = { mode ? '1' : '0', '\n' };
+	ssize_t ret;
+
+	fd = open(path, O_WRONLY);
+	if (fd == -1)
+		return -1;
+
+	ret = write(fd, buf, sizeof(buf));
+	close(fd);
+
+	return ret == sizeof(buf) ? 0 : -1;
+}
+
 int powercap_get_enabled(int *mode)
 {
 	char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
@@ -77,12 +93,10 @@ int powercap_get_enabled(int *mode)
 	return sysfs_get_enabled(path, mode);
 }
 
-/*
- * TODO: implement function. Returns dummy 0 for now.
- */
 int powercap_set_enabled(int mode)
 {
-	return 0;
+	char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
+	return sysfs_set_enabled(path, mode);
 }
 
 /*
-- 
2.49.0

