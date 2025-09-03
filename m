Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2348729CE1
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  3 Sep 2025 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893717; cv=none; b=ApjUI3OYZey035XyGGIbQrhT4OCR6P0NcqyIwujnJbIlKjZ6ti2bh4xZDgMZZpoHxYNV3i8BE6AGrQPVycnSXHQqciSIj+4oGUk8wJGyzoyTZ1beZnEGs0mVXNo43tsEnWthQArw2LPYIQ4H0LvgOORXUga5KvLv73lzV9aEgNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893717; c=relaxed/simple;
	bh=kHulDodA6XjjDXaF8f3RTdeG+b7HsT9DN9fR8XCqMLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ppHKlPwv+oTpVxvbrLeZ5eKinZzTK7APy/gOwUh3PSs1qIG8vJlGBmUPvec5P3A0xzRBuJ4xqmrXvrX3QAz/OHql/y5fntlmAcf8hgIEolK02EvO2HM8CtZp7c3qbjf5dz8rx1j7pkMZbyNjbdrRkUNVp/3mNPEterd4XNAM+dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=lJwrQUt+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="lJwrQUt+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b7c56a987so21832445e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 03 Sep 2025 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1756893712; x=1757498512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ9qYB7I/+26Ck84iyosBQZh4d5xKjRCMcgtP0AqugE=;
        b=lJwrQUt+Js3sbt0HhgljnBRowA/cBzBJ2Kd+YYQHhektSYuLkm8t/8rurfF1zx7Vn0
         eVvq3+ywfW3YqvlJZlNoXSJPo62rps9872LL5QC4OF0EohRCEBFALvhzbMMOw0yxNeF2
         cHxMUBTE1XEEamV6Iu3V4MPoBsJImUS/0TaXHGu54pUNW6+dKLzfVAGYHCw0zTvVq57s
         M6EeBJfuMSE4kJj2WhGBJ1dAU5CBJOHJ7B2drttcY3bNNBD/gF1Wc1UrmFJNPBBZxvwb
         abTaBy0GtWiAqVahFkDVRrn6Li4Q3xhoaWAWhZKsMc+JAGoS+4M7rWkgvLXHVTCq0NaU
         GIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893712; x=1757498512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJ9qYB7I/+26Ck84iyosBQZh4d5xKjRCMcgtP0AqugE=;
        b=uf26wRKtoeh/NyrNd1Pbbvmhk1B8Sd07gwrTSwyEp3IqIlruA/p9y27mYcDa0A0nrc
         T3Pu2L1hehD1BAmmG4SCam/hsZmTeYzKmwviFEye03CVnKXyAXgxAB75DDpYj5NY0ys+
         y6JeXwgULvRKP9mtVrJeYjftA9QuvSd2KGj38lhIKHmC8vhD3zUIPdmq1P1Sy4d5jmRq
         UnVxga7/PwsxdZerxqfpdTKtR/NVXnEpmL6J6xfNdHHLM88VDJk6Og+FZv5B6DnV9iLn
         ld0O8MpGOeGMm0D37OMt6GGxR0b7QEYLcvMCAiZid3Ht3+cdPiV9xf9V7vM16FO7oPre
         8sbw==
X-Forwarded-Encrypted: i=1; AJvYcCV4Sd4MbTEL0oOk8gKxGR9jZ3Dx4I9vD40HVyTTY4ytVgLwdUFVJytifW5J5phq/90C99OalFW3KAgMUuP3fUCE35dXlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzW1S1iQ9Y4eHqP4wNqFTfph6Q7rWXETMCdq/R9NSgW0ih3sYyR
	it6wvcMBJr2jQD43Vgqp24ERdzIrmMUx1TW2+OVKy3dbDO9xRjpWEu6UuCEvA3nu08I=
X-Gm-Gg: ASbGncvm1w4EsPTtzpiFVGep0FmjUoj9FZ49lyYe2DySiizH2VicDz8ZdvXlRMM/njz
	yaw06aLScBPAMSvJbKGLCNBiPBkLRtSBdGtN3vFwU2d0Bd7wWK7JVy2oH440Sm9bYDTK0S5mmmG
	e5uL8AI0PFDQ8GUy7r+3xxcyDdb1ZK5+ARBlpVaNPbMbRm/qeH3ImXW5fj5i0r6J6kdDU7x43JM
	r2fljt1EXpRohn5MqG22jm49SYdj+296RopYME83FPmYAUWwJWGW9mcBZpRCKwzvCl5Woc6SZPo
	ghndv3gYs+vpglyJU3wHTv3QMbghmIWg7Cp/9sg2h44s3YdpsNO4D4ExYmLt/8mr1WAKQvLmZ9h
	7pr0Wd0aMr88XJneZLU367wh2daXulf5+J43yU+X5jcquVa12
X-Google-Smtp-Source: AGHT+IFlZq5oArcxA6dWnPr6LijEjpa+jLN9n3zA6K+uDuCGQ1hNKxqSyhK3P1G01ko5LeH0BDMpxg==
X-Received: by 2002:a05:6000:26c5:b0:3c8:29eb:732e with SMTP id ffacd0b85a97d-3d1df539ea3mr11440863f8f.59.1756893712086;
        Wed, 03 Sep 2025 03:01:52 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7e45:593:64fd:6612])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d729a96912sm10945323f8f.8.2025.09.03.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:01:51 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: linus.walleij@linaro.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] pinctrl: spacemit: fix typo in PRI_TDI pin name
Date: Wed,  3 Sep 2025 12:01:04 +0200
Message-ID: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The datasheet lists this signal as PRI_TDI, not PRI_DTI.
Fix the pin name to match the documentation and JTAG naming
convention (TDI = Test Data In).

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 9996b1c4a07e..a3f433b611f7 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -847,7 +847,7 @@ static const struct pinctrl_pin_desc k1_pin_desc[] = {
 	PINCTRL_PIN(67, "GPIO_67"),
 	PINCTRL_PIN(68, "GPIO_68"),
 	PINCTRL_PIN(69, "GPIO_69"),
-	PINCTRL_PIN(70, "GPIO_70/PRI_DTI"),
+	PINCTRL_PIN(70, "GPIO_70/PRI_TDI"),
 	PINCTRL_PIN(71, "GPIO_71/PRI_TMS"),
 	PINCTRL_PIN(72, "GPIO_72/PRI_TCK"),
 	PINCTRL_PIN(73, "GPIO_73/PRI_TDO"),
-- 
2.43.0

