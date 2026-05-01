Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76A3E9F71
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  1 May 2026 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777652899; cv=none; b=ZG84kAWVTKzxBIKuSX22OAgkr90g/8hpKDXgFpbbL5Psvrt51UNrlSWog3W7KC/0Qf6CCquwsy/ZgtVjnVkYfUoICcrZAfS8dyiHQfLMN8Jh+Rh9mwe1Th+7IjQHOrmZZDFn4OiMjUXFzTSgfBaDXXrukHQngO+Uzaenk52sScQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777652899; c=relaxed/simple;
	bh=bCRKbF7xQHc64osfO4JM1wubcsdfQjudflP5eRVlikk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c05daWzyEStU5+f6t1UIHOLn6BG4vdgj6nW4iS12E/dtziYGo0jWzN9Fa3ur2uguwbi3RwxjCtkeP5uENeX3fAUyEWLeRuq/H+C6VPnhgHdU73VLY866lOIJC2+jN3IA6gX6BPGnK7iotHVvtu77J1WQgiTOBSIkBRKNlkJXYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp6u2Hjp; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp6u2Hjp"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1685957a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 01 May 2026 09:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777652886; x=1778257686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GT/RM0CFG1D1q5BzoHJa9xAcl2JxNOjlfH6pR++zzyo=;
        b=Zp6u2Hjp+yjCkFCgNelmLC/5vR9IcpyNKpnZVDq9ZYlQX5jxo5oLoIfWIyxhDa/zlp
         iUvb7DzCtA90pE8wt1laKiqqREHaHozgA5ZS6sP2nJPvDH0Z4mdJv0H+F3qUGWkJA16z
         EG2jcm6xAB2CmyzOv8uR/9/cRhMw6t4ckyfnvoeleWMvHBrKNAIe4uCXYQMO2Rk/XTfR
         2J0qrfcEPfezom7Z20VO6MaQnNaMo4gLMw6FrJPUEvtlvw4OI3G0iAdiZfB7af1oJzEp
         7YNwMFk93JE+lMTx6B4s5JktOUjeVGoM9ofOyBYl4Tz88tbnHcZtoF3kpwYAE0Py/9Ae
         5pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777652886; x=1778257686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT/RM0CFG1D1q5BzoHJa9xAcl2JxNOjlfH6pR++zzyo=;
        b=YCQmxSyNvrhqpzz85o3BGncwJM2rHYHZEKqgyfm9HrJYiD+kcjG0V5Gtz53e8E4Yfa
         DukNnjNICWGQh9Zizh2KhDqp6CFBST0dBHQhZNVK/MwZdggExZrMG/2K062nW7hPngKs
         G2rMBuuawRQr3ZDAitesG6DqEfB8OrM8Uy2MJqmVYyKQPvapovXztU8xemWkJ0NRThrZ
         02lLJQoHJc4IlXeDi8ekxHcxB4WHJx4WVwD96MbvHfbMslSKv19d2VKaaScNABcNrjUF
         J5xhlgKz/r2oXiblOLkg3q2U7GVPXsOPMkOn77D9bagu5qTwzxV+22LRI+0v7zNiJwRz
         zMyg==
X-Forwarded-Encrypted: i=1; AFNElJ+1DUBu9gvbYn4kO6AaILE/+kIJ6bOcR2oCO1Za+6saqZnFXJs+3r8U4Pyp0h0RL9NHjmpcQwfVMNuaOXCAM8JMNzKAig==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRS1OILh/b8OumfiWt2qTEGKy8t4XS/F7cTuPqvcFQ0fSE058Q
	fGnubJypIl3uYf+Wb0YT2l5rwbqF2F+ARuUzQ/XRe6fiN6KX01kKDuM=
X-Gm-Gg: AeBDieto6Rb1bh21S8tfotcFHC+v4lA85fOvr6IH+BigBs5ssTkQFzSaLmX2bs0b/SG
	/F2iUB6ew4utySD1IrZKLPP6m1KBeYCP1D+ab21BDFydigRVsw4HwLxs2q3LideZeoOOZy8ow6D
	jB2invdiUwZPO2/fKelSc7x7MWotJWgd1K5pW2pIyRzCgAte03ABaUPt8I8dCZBThyAuqACOkby
	Jw9cL3P/haNa3j081X7BDpeh4Uuesa8v/Ki61yDVEg1DwrKLntuxvO8CO8yCshc4IXIBhbyc+3U
	VhZv1u3zi0aBj2oqzWVykHH84hfHM5ooWF5iPXCjZhPg1JElWy7QaZ/hU1D6kHN54E2GhOItckh
	wjw78oZkz6OAz8yK1STmcCqjSi9m/IPaMartSo6owkhBAJgW2mzWdtLglhx6/eFaZPSSlWHmFa2
	iWXfAh7yvPJvWE2BZ+jS9QnIuqoKW4+09fUJaCBAVusvgt5MIl3Zbo
X-Received: by 2002:a17:90b:5830:b0:35f:be11:b3e0 with SMTP id 98e67ed59e1d1-364c2f20cd7mr9386102a91.2.1777652886086;
        Fri, 01 May 2026 09:28:06 -0700 (PDT)
Received: from localhost.localdomain ([59.16.109.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf54203sm6186720a91.7.2026.05.01.09.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 09:28:05 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: brendan.higgins@linux.dev,
	david@davidgow.net
Cc: raemoar63@gmail.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] kunit: Fix spelling mistakes in comments and messages
Date: Sat,  2 May 2026 01:27:37 +0900
Message-ID: <20260501162739.3861-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two spelling mistakes in kunit tooling:
  Bascially -> Basically
  higer     -> higher

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 tools/testing/kunit/kunit_kernel.py | 2 +-
 tools/testing/kunit/kunit_parser.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 2869fcb19..58557c47d 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -218,7 +218,7 @@ def _get_qemu_ops(config_path: str,
 	# exists (I learned this through experimentation and could not find it
 	# anywhere in the Python documentation).
 	#
-	# Bascially, we completely ignore the actual file location of the config
+	# Basically, we completely ignore the actual file location of the config
 	# we are loading and just tell Python that the module lives in the
 	# QEMU_CONFIGS_DIR for import purposes regardless of where it actually
 	# exists as a file.
diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index 1c61a0ed7..0e1d2f498 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -268,7 +268,7 @@ def check_version(version_num: int, accepted_versions: List[int],
 	if version_num < min(accepted_versions):
 		test.add_error(printer, f'{version_type} version lower than expected!')
 	elif version_num > max(accepted_versions):
-		test.add_error(printer, f'{version_type} version higer than expected!')
+		test.add_error(printer, f'{version_type} version higher than expected!')

 def parse_ktap_header(lines: LineStream, test: Test, printer: Printer) -> bool:
 	"""
--
2.43.0
