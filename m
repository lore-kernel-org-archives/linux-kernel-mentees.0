Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD75F2853F3
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 02:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755571953; cv=none; b=BigGcZM90UMUpNzfH+hKodik4/YB8tDO90yiYD1cdeqLu6Aen8L2kpirfSWGKy/muHCGflxX7lZa9IwZCYA/X3Y86AEb/LZWTYmW8V2q5y/6AiLIUHaoUQlOmWca+WzHoYhwOKpPIuGYds296mVbCYXKId5Gd/wsFqfisnOx6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755571953; c=relaxed/simple;
	bh=Y8x0Dz67DsKdjkPQ4PqlBubQxlf28YguajRC+ZrW2pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QR/Jt5OIZOl49lwBtmgsGoEhFdbf3B/X15cbsX0OTTkfB2MQhRmBgcS7BY6drLFsoCMllwNJPZkdqiTUkGKsHkx9pPPQTyhdAn6J/gubfJNLZrNdH9WAMNnMJyB1vfUWV0oAtRhHGuAo+y1bySMqQj+ayidI91fwn3IT0s1ZgSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsshH9ew; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsshH9ew"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-323266cdf64so3721119a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 19:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755571951; x=1756176751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkCzBsvlP6/Ffz6cOOw96jrDeHTlV8A8u/fp/nqqvhc=;
        b=LsshH9ewgI0Rrn9nevz3XcOTI8rJrlR350U+PhWBgwYc3p5Xf3hx11iYNkOxbdL4pO
         peZzJ8eTSuHfvYPLle2ChjPsCVm2x4LuzwRftWRB9nf9KrIyPq+U5DEfEO3EUWH3oXtG
         og9kHeF2yj8fexwubHjxwO3ErUcssaWN25p83GzFt3EkwFDddN3yFkpFMrJrqhBWLdzt
         /XpDDuedOueo4SYRLDZmgxNiyAC2cFYN6N3NsM0J84mItYZzGoVZIIJ9AGQo/DJEzzWU
         DIBxgKoYc6cVgWlrf39dsbPgcqk6FS2UEzPH8Y09TxGF0QlpQwYiWHXxeLBI8JWn0DoC
         0PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755571951; x=1756176751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkCzBsvlP6/Ffz6cOOw96jrDeHTlV8A8u/fp/nqqvhc=;
        b=BeK9iYJih+LHnZcr+WAz0iemhG1fnv5YhI71Xo21JHAdKdU1mRzbb74GdOr3G+q/0s
         vsWXdMdhzb2TuOJXdDZ2MrwUV2v7Sp+g6kf+hmArqR2BBxa7SonamDq0x2IGl9Aae/YA
         VZ8DGm1zj2Rp5kM/0SLM7SQQfhlkJs5WY8MEmYlLdEMbWl09pRZ5egPh7qbkeKRRA9Im
         hs4bx6Isb8DQ3u1GuuV4CndQ4GEGdXASHu05StGFqSHyyI2SHE8DN4U8BpZ/U4HFf7PD
         EvEJReriKrRRjzCF2R9nXONc+84Z9ekwOSC0nIpiNWuzgjuzxJVP8P6b9opb8Bu9mSqU
         b9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqSBinErWCH2RGLHthozyGNDhx9yjJlfPJX/H7tGHc2coB9htvTBE8X7F6KN7mURkv5uax2J3xcdH1O8WdAtjmdRFiGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIFvWcQ+YUb3f9+I9CFeKxjsdZsdqw46SS2Sql7vw++V9rc5rh
	e8lYHF+HqkxP0BUa3Msl4QZNkCYXgq7pE3o6QF6an48IqjnvJ8I97st7
X-Gm-Gg: ASbGncvGfYLP83i8E2AagFnItR2bi02bgijBg09SMEc3l4ENhsRKlGm7ofO9+3iZsV7
	HHHcG75qbCgcgtVMNaV5KGeENhR3QElD7aEiClFw/pLXZBhrhG3xSh4RSipFs4j+s6acdh3fQqJ
	ImvFirc3SD43QpRxQUm1wwxfbXP8/hHJ74qLcU05AOu3E4qVEbBqEorL3xlO720PJ3ZOJGwLpoj
	ercLye2ZVkL8Cws3V8Z4nnGGszbN8x3dvIzAgLbWwz3SHgnWBb0F4/5BY1UiRBr99tvnxg/jrDa
	0YVJpuXAhR7zdLEw1thSm+RrMfB1Ep9B/JVzGGTeb0SpSBLiAELA+uN1kNnqpGi8pg9hG/F/zYn
	sZnaKqDyn43fawUhFmpfbo+yT
X-Google-Smtp-Source: AGHT+IFyQEfl1JPJPxf0BZz+v6ihfWCb5OyV0lLUdFcv0lT0Fbn28LslaGE9gKAirHH4EXO//Ee0AA==
X-Received: by 2002:a17:90b:2fc3:b0:31f:2bd7:a4d2 with SMTP id 98e67ed59e1d1-32476abd39dmr1551147a91.35.1755571951020;
        Mon, 18 Aug 2025 19:52:31 -0700 (PDT)
Received: from linux ([223.185.134.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3ecc64sm1315532a91.15.2025.08.18.19.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 19:52:30 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	corbet@lwn.net,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] watchdog: cpwd: Clarify wd*_timeout parameters
Date: Tue, 19 Aug 2025 08:21:10 +0530
Message-ID: <20250819025159.6292-2-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819025159.6292-1-viswanathiyyappan@gmail.com>
References: <20250819025159.6292-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reword "in 1/10secs" to "in units of 100 ms" in MODULE_PARAM_DESC
and the corresponding documentation to avoid misinterpretation of
the fractional notation.

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 Documentation/watchdog/watchdog-parameters.rst | 6 +++---
 drivers/watchdog/cpwd.c                        | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 0a0119edfa82..4257a59792de 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -122,11 +122,11 @@ coh901327_wdt:
 
 cpwd:
     wd0_timeout:
-	Default watchdog0 timeout in 1/10secs
+	Default watchdog0 timeout in units of 100 ms
     wd1_timeout:
-	Default watchdog1 timeout in 1/10secs
+	Default watchdog1 timeout in units of 100 ms
     wd2_timeout:
-	Default watchdog2 timeout in 1/10secs
+	Default watchdog2 timeout in units of 100 ms
 
 -------------------------------------------------
 
diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 13a4d47e68cd..c0a5c6f274e0 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -163,11 +163,11 @@ static int wd1_timeout;
 static int wd2_timeout;
 
 module_param(wd0_timeout, int, 0);
-MODULE_PARM_DESC(wd0_timeout, "Default watchdog0 timeout in 1/10secs");
+MODULE_PARM_DESC(wd0_timeout, "Default watchdog0 timeout in units of 100 ms");
 module_param(wd1_timeout, int, 0);
-MODULE_PARM_DESC(wd1_timeout, "Default watchdog1 timeout in 1/10secs");
+MODULE_PARM_DESC(wd1_timeout, "Default watchdog1 timeout in units of 100 ms");
 module_param(wd2_timeout, int, 0);
-MODULE_PARM_DESC(wd2_timeout, "Default watchdog2 timeout in 1/10secs");
+MODULE_PARM_DESC(wd2_timeout, "Default watchdog2 timeout in units of 100 ms");
 
 MODULE_AUTHOR("Eric Brower <ebrower@usa.net>");
 MODULE_DESCRIPTION("Hardware watchdog driver for Sun Microsystems CP1400/1500");
-- 
2.50.1

