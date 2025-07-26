Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB821A426
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753556083; cv=none; b=M843XkSFpvX+NX8l0jKXY7iOe8EA/PKH2IykE4dxilAwzkSfXjOw2ispzSF3gp+Ow7e+slZL7iZ80Dr1S6oHJBeAT/jGLlnO+A25rTxVzia3umQqOXIOsT6q/Pxc7tzdIUo35sNDQu3cTF3t/S/rbIlbnkhp9PR3DFx93jicu/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753556083; c=relaxed/simple;
	bh=jN/bOZJKSgFzgJ9o+tglJc09DttMQIfo7cYiDWe4YGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnUSpiG4UgFuqBkWgLtilFnNvROxCwTUL6hQrqct4M3Hz5AW5Itie8G15kNZxlqBEq1c1NugoNZouK7NxvCeoOlgp3P1Xt++lUr/Vr71M9Saj3CnnBM9eZeRFNnNnfURZDMm4TlNklFk9MQqTBvPDoCKl+tStcgdlg5LA4rKedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROs47Ecq; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROs47Ecq"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234c5b57557so27126685ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 11:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753556081; x=1754160881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7kVErw+2M73e7AcLM+G/ti+P0e+oCHBlDMfj/liYyqY=;
        b=ROs47EcqVJqJ6Ik/R0gwyC0axaz87YXwA+NY/rFcZKFkoxsdEifADuoEl8jIcLAXxV
         +OeQtqMmgJZv69ZCClkp9Y2s1pvRk4LOYFKNB11WEfSZSfndrgoP2ZqUqHlTxW1//5YQ
         t2oWSjyDXmgBDnINYYUbV4JE58YpHcbN7QT6BhOJXheV0RLAelZHkhg46t5TwWUP+ls4
         6S9EtoqGBPFdb2/JGtDo30EndE1sPc1ZJh/DG6XcffDjLdQl70hOyb/hmvYGA4/lDtft
         G/38aRb+S2L+PlZQPkQ+MVLn7IvUEBZzwDk4JIsJFu5XZdZ8KPKtTFS9NFmRwqX7VIKS
         HdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753556081; x=1754160881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kVErw+2M73e7AcLM+G/ti+P0e+oCHBlDMfj/liYyqY=;
        b=JCaJh+4iE9jGsRcA848emwFUuYO9Ae3Y2d1/GCJlQ8h2lw2NIhgN6XE82JvIjKA1rv
         +c2g/PyyDrsb5ywLEo32RJewgFfrVws4wN2SU7tw+ywcfzhCV4yiKijQYP607bcdUQJu
         1jFItBim7ivE7y8PtZTewPsJs563j+rJVBI+EylITyvXCOaK3e3N/aI9yGz0N3qIPP9F
         S+fJLczl0QojY0OFP1KJJoh4X3V3EPYZMrdzv4djYTabYKyGWNyNEfH6Dd+SjsUf0PJa
         BJbtElmNSasIbunXA28rkic54Su6Tlr+rvfJzRBEUSD/OkVlGIfnS4kOaLSDLmGqEw40
         XA7w==
X-Forwarded-Encrypted: i=1; AJvYcCXrKQD9wn/OEDJNYCvTCaHyL/JDZON/NnEcjc4Y/KQR+aM5kh8ZMR06w7utH5lLrKJVJLb387HqUtuSSJAxY3FObpNi9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGs0PNQFOS0nF8tv8y80PVzM/lKNQh2JuPiy4m6XsowRASsCur
	20+eA34xJILCgPB0uiBb4571xzitq5TofTRPnz6aBFemAgPrnP044c//
X-Gm-Gg: ASbGncsvePrPh+OpqdMZOnLcttIsk6rMveE6reDFGivIaL6M+Hn8Y1Xc9DdB07QQ/rM
	uphy/i7rl2F/zA7EjuPxVuuXxPr9OymDdjhuuhIkIn/TKMDsxzlKPizVOvoxW+FjuqHcqLpHkMA
	Zs4GGtLRWzhNZRyZuf8vnK6EumufmwewvCXMqRmAgpajp5ii8ZPX1Ip/FTfRcawK1wdwEJB0UuD
	BJe6sx2htrM/DhNk8TuM3SAs1oFuOk807TmyoJ89U5Pci0r+dsFPEa9Z7yomKJKoIg2RZjvgWYL
	hVeKfuGlsCYuadGSO60EBxIMWHi8E7hLqD04OgEs9N1kUR3B9W5NGKkcn5VgqbconFT5hifYcM6
	JFEYRh4k3mONT8B2+xjSaprQ4atTWwQ==
X-Google-Smtp-Source: AGHT+IG0sgdycRxmHC8UktEn55Lgz+Tj0EvhZYQqjFKoAy4OyWyzTwjzmUv5uOmTdoMhzt20izQ+Zw==
X-Received: by 2002:a17:903:204c:b0:23f:f96d:7579 with SMTP id d9443c01a7336-23ff96d7ab4mr5422885ad.37.1753556081277;
        Sat, 26 Jul 2025 11:54:41 -0700 (PDT)
Received: from archlinux ([205.254.163.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512d29sm21363395ad.140.2025.07.26.11.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 11:54:40 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] checkpatch: suppress strscpy warnings for userspace tools
Date: Sun, 27 Jul 2025 00:24:32 +0530
Message-ID: <20250726185432.162632-1-suchitkarunakaran@gmail.com>
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
scripts/, which are userspace code where strscpy is not available. 
This patch suppresses these warnings for files in tools/ and scripts/.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e722dd6fa8ef..1533cfbc8305 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7020,19 +7020,19 @@ sub process {
 #		}
 
 # strcpy uses that should likely be strscpy
-		if ($line =~ /\bstrcpy\s*\(/) {
+		if ($line =~ /\bstrcpy\s*\(/ && $realfile !~ m@\btools/@ && $realfile !~ m@\bscripts/@) {
 			WARN("STRCPY",
 			     "Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88\n" . $herecurr);
 		}
 
 # strlcpy uses that should likely be strscpy
-		if ($line =~ /\bstrlcpy\s*\(/) {
+		if ($line =~ /\bstrlcpy\s*\(/ && $realfile !~ m@\btools/@ && $realfile !~ m@\bscripts/@) {
 			WARN("STRLCPY",
 			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
 		}
 
 # strncpy uses that should likely be strscpy or strscpy_pad
-		if ($line =~ /\bstrncpy\s*\(/) {
+		if ($line =~ /\bstrncpy\s*\(/ && $realfile !~ m@\btools/@ && $realfile !~ m@\bscripts/@) {
 			WARN("STRNCPY",
 			     "Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90\n" . $herecurr);
 		}
-- 
2.50.1

