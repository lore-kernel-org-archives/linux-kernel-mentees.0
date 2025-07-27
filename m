Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60921DB95E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 12:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753620658; cv=none; b=XqJldJMDmne4cunZ7QcJW/IjPP3NcJJlCFODW4m+0rLmnCoHV8px0kMmz6j1AKv+l4AOCMXxJFAynhST1aHtdlB69rgBxmvHyBnK+WYbSLCqMSZ/8kuUQhE7M8zXUYBuvzw95PYA4940lzHktKCxLtIHZr59QjdQrNXMidthPbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753620658; c=relaxed/simple;
	bh=qphoEMJcvtchYG0cd1lDMN9S2qws/1jokATGeV0IvRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhE/tJug4FRj5rify9a3xPp4JkHSllnz1f3RqXnMpm65XlOlKpmFbba7ZTIU8aJZoGW1UrYfZfJMwlgINz6iEZOq1sv03SfTPD4OmKCxL3Qp85RZHSEtmxj7W8G0W3Q9TAin1Wa555FRYzKAUdOgVJ0SaYrk6VDl3jvIreXw+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHcq0AQD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHcq0AQD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-75ce8f8a3cdso2266165b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 05:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753620656; x=1754225456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OniimkhjVvSRmOjn7OfXVTo4mIJlM2vbjYTCYN8vti4=;
        b=IHcq0AQDc6bbGMDXoS+lizsfVnPCXBafGrw08co70nJVBgs7tpktI/tC0hn1kY9eQs
         tTO5lxnD5LvHwUTTjXKE41S51v8Gb03l6D2cG3YumHNdUwM+5CNavwxBrBauVBzLhe4Z
         fvDJGI1ai29HRtFTyc5+hpIxHp2mZ3kUwKxOsBCv07h5rleSu/sz9B6DBZjm4pCLcCFg
         YdOWIO2uJVdmXIyWYT/Dg3K/GNjuAfiWlQJ8vQ5VWvqKWHkOdAVDMTst2anZSqkJJ7se
         sVwNLh85bncz64ERiDYSaikzUE4uuNLUI1DjSqS2TQdXiHNRNxbUxt0kjcIDa8oxEYdT
         zREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753620656; x=1754225456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OniimkhjVvSRmOjn7OfXVTo4mIJlM2vbjYTCYN8vti4=;
        b=jU6dH2m1qaTlXKs5EYeEud+ntJ8x8Pgy47x5Dtk0oVOc0165ky3PgPLRLuRon8tgQ+
         iIR/G/uptR9JmpyYK0Ao85FFyo9zyn8tfDDP02L3IRtIyCWFuMhfaQDC2//t31uqCo0i
         4OX2W3NLDBB9JvGuqEgG2vkElsp6OUGrqaPuS7vG+hOQ6o/gVPHYTyLqDyeTIa0WeCof
         mUHSfz1oGeVOe44EQTM4Qa5JpHJAPpJUYsEZvi+DgodS2HgzD7FRALXcZc1PbNj83idw
         X/FWMkckgmkqZz7CKHuz89WvcQXvQdX6zTbq5aC4EbEsNgDY9LzRSwARs3bzsr7oFbTz
         oODw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Oc0vKZLTPYiA76X5EXwncp5f6DbsWJuYoIVVEX53CQYNAKmQvJGsf67tlYmMXPn7y00284gRwiyiBvD/odyXhJV+Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLAG1unCQMw9BhDqaKUkgYrvnUfroCPc2Yo9qAbWy26J9AtHb3
	mAMnimPO/MGS9XRDFDdMpJpFO9orFmfgBkYDIcT6mB2F1zo+cFexc3ru
X-Gm-Gg: ASbGncskwYY0flTTg2BNJOKaF0F2G/xtAf7Kk0Aynz6Ioj1ao1abKZzakqTH12b6bgm
	Lns1GRqX/P11O7Wo1pwVd473w7PeBxjhhReakzqc5+zTSc4IfWaRDcvi2NmgX9vFr3+UrpoD61s
	7twrTkHS2Agsk+YQzj1uLM2uQCp6CaOjjifWoaVMSrsuY9WuRz8TgAJf395CCsH4s9ZtzKmzSyd
	hI5YkBrdZjpfYuZzhYB6Lg7O/yDBHpTk4h2U2252+nb6+StPRf9x18BZM4ByfI5L1dyqMYKUV+h
	ekWNV9HvsV8YLgc/kEUKMn/+oOYRZdTqGsrRrO73uEYRb9giHhQreGkC8IYrDy71slhI/Kp4KUm
	J5MZtMrC8gcTZ4iYadYb6HcxxIXvuQ90=
X-Google-Smtp-Source: AGHT+IH1flJT/T4l3mHSvsO0oBzDl0gqh5Ie6QQ/+2/IZOeyCeYqWnPuNL8IEyNBDHU0KD+WMklzow==
X-Received: by 2002:a05:6a00:1890:b0:748:fe1a:3432 with SMTP id d2e1a72fcca58-76336a3b834mr9228192b3a.9.1753620655613;
        Sun, 27 Jul 2025 05:50:55 -0700 (PDT)
Received: from archlinux ([205.254.163.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c02640sm3471873b3a.37.2025.07.27.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 05:50:55 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v2] checkpatch: suppress strscpy warnings for userspace tools
Date: Sun, 27 Jul 2025 18:20:44 +0530
Message-ID: <20250727125044.101779-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch.pl script currently warns against the use of strcpy, 
strlcpy, and strncpy, recommending strscpy as a safer alternative. 
However, these warnings are also triggered for code under tools/ and 
scripts/, which are userspace utilities where strscpy is not available.
This patch suppresses these warnings for files in tools/ and scripts/.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>

Changes since v1:
- Create is_userspace function to check if the file is in userspace
  directories
---
 scripts/checkpatch.pl | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e722dd6fa8ef..472cd8aac9c3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7019,20 +7019,24 @@ sub process {
 #			}
 #		}
 
+        sub is_userspace {
+            my ($file) = @_;
+            return ($file =~ m@\btools/@ || $file =~ m@\bscripts/@);
+        }
 # strcpy uses that should likely be strscpy
-		if ($line =~ /\bstrcpy\s*\(/) {
+		if ($line =~ /\bstrcpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRCPY",
 			     "Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88\n" . $herecurr);
 		}
 
 # strlcpy uses that should likely be strscpy
-		if ($line =~ /\bstrlcpy\s*\(/) {
+		if ($line =~ /\bstrlcpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRLCPY",
 			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
 		}
 
 # strncpy uses that should likely be strscpy or strscpy_pad
-		if ($line =~ /\bstrncpy\s*\(/) {
+		if ($line =~ /\bstrncpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRNCPY",
 			     "Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90\n" . $herecurr);
 		}
-- 
2.50.1

