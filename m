Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AF340DFC4
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Apr 2026 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776618633; cv=none; b=uh76luGF/a8WHXoYDAHdn0Ud1RtIdWxMhtaVnoqFdONlNouPecrRPW8GnBot9w1xAdp8TmzuJRWX5EcIoJTR6G9ozuAQdZgfeCJr9ec2asSufXeavBhvr+kLRaDdHWknReEOKDMMu6/lyfwGTVdbymCapUYfhXWXLvmTK5RHMlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776618633; c=relaxed/simple;
	bh=g048MkCvqSOBynlchfJh57UY0Z1vzIEQS6EpQbM4rkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZXNq8yfyMNvE4blsyuIDQYZhFZHL0G/odAn6GLwyLVdYW8PJ3okyFlgeTp5Rofcxxv3V2c5+Cihlg6yerAuy4kPtq0q5c46aNhnvYJ0Km3FOdODYnA5x3x9OV2Ew6Rro3NVEc+QHNnkA+OAiE1efhmsSKAWnf4ILyxa7uUR76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLCRAYk5; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLCRAYk5"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3614826eca4so1632953a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Apr 2026 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776618631; x=1777223431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOL+TTkZLOen7KX0j3LR+g56bpC3CZN3+QqLNYREIS8=;
        b=FLCRAYk5/N7cbC9ZlgclRCw6Ba7j5AOmDhxDVLw6eUJSZk9Ae006sjsN/EM5MlSrr3
         bi0N7113DUhbHiuq4wIbqvgrLd1xUibY98ckt0GUe8Enk4I9ROvwvRkBOZ9LRHEA7QSU
         LizaBdBdOKoXbkefwmn7MSWY+/5N5Zh4M1CBBjPlCp0jUbRm7Ax4eXEfbG0hG3a3WCf7
         zeZqMak0y7wTwFzDKccWxkAvM/Z2vwuxkmkRYe1Q9IU6zqNEifAEPP1ptTn9mYN7pWT6
         BDhHJOvFcUKAvs/DAXFLKg0VpRdjrerbcu32fcOumN2pFb6+UXAGMThB4ZX6g6HSpnz/
         dcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776618631; x=1777223431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOL+TTkZLOen7KX0j3LR+g56bpC3CZN3+QqLNYREIS8=;
        b=A3zNuoJmBCM9kd5iaD43P5+CddIjytcJALt2PIH+dKHTR5m38mcFiDzZn+ykcDRIko
         fEI7Hfv5iZdjMu1DtYfEWv0CTQt3uxcGOXIJGZ/EMkY1OB++8X94dhI1SW6PBexyklno
         X7Mo8sG0C+T5MWLpdK+HELGLnHVr1cSW2mRCu7BRatO/bimv9RxvVBwoK6iCcMxxz/mZ
         4Ba9efg7Tf4zkD7Rt6/FYwSXmpNx5s1WFFeOMu707Tu/NewBJgIfJjeryxZq7QC7Jijk
         nfx7UtkfpTLVKDP+Zfhqc3Z2VQe1IHo8drvH427oPWzZYDYZO9Gib2iIVqhACFgRELMq
         vXAw==
X-Forwarded-Encrypted: i=1; AFNElJ+OEmJ1mHlDsQgVb7q8nq5uw2lTdIJ2PWOoUT4NRvYxdKnVonwTN0YcrWX0rrHF+EWsFGS9Rm2SNyEiGhy48OnLZhmUng==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvlDdh0C1vQWXJCh8ER6QbvoXVZiTTd1tMXRtV1RBwq7x49kGv
	qrzFJQKJQ7R2YYgGBaXQRapc1VN2DkFc2K7VBReYvjFWZIRb2celzYOr
X-Gm-Gg: AeBDiev6Ict4JO5wg2JFhSX94bkqykXqxq3TAuW9Hw5TepHaJeHh15ZHJi7JP1HDVj/
	Ho9mC11132oSMAVS3E18oPkcFQwlggB36FE1sn/8fz/tIVr7+5mBpwLzOQfRafhymxGgCYl4c1n
	qZNu/C1RCC4lCIlxZ3tZHirbJf99dvyEuX44/LIjoVe2V6aDQQRFvf36TufaLdSevHWmfVIwwzr
	hhaF1H6fIm1wLHVhZ0lFZXS+LTqM33XJkfWLyW8uvjvC4BOsOBqrxzPrhLR/eweFOIhf2LPlsiv
	kytMhxhWlxZscS3zZ2jqfngNQixC231fElNlb2enNcJ4QDpnSIF0LKFFdH8dEAo8yiRgUXNC8mz
	77KDC6hNIl7NmIG6g/E8P760X/isYS9V24wptTb6XFJOeChg3WRn6VpdHFAysSzWhuhI8CS2bdV
	nzpvfhJfLhNZCS/iIzWi2IvumXbm3RcR35+RA+1wg/QCGMf2335PMwDfeaJCBoddXKmwjt2S6a+
	FfiHZekF1afd9t4Ng==
X-Received: by 2002:a17:90b:4c52:b0:35c:30a8:31f with SMTP id 98e67ed59e1d1-361403bdd28mr11782171a91.2.1776618631255;
        Sun, 19 Apr 2026 10:10:31 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3casm98158695ad.17.2026.04.19.10.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 10:10:30 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	W_Armin@gmx.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: fix spelling mistake "Minumum" -> "Minimum"
Date: Sun, 19 Apr 2026 22:38:35 +0530
Message-ID: <20260419170835.347910-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a spelling mistake in Documentation/wmi/devices/lenovo-wmi-other.rst.
Fixing it.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 01d471156738..1d0410500d3f 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -144,5 +144,5 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
     [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")] uint32 FanId[];
     [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
-    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
+    [WmiDataId(4), read, Description("Minimum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
   };
-- 
2.53.0

