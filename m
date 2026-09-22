Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E43548541
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Sep 2026 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111840; cv=none; b=CGN6kpdmG2gNOc/R163k3w0CBHOUlEYbDvBvvQwyllk8Zxrfi/ozS9QeBR1m/AyoY5XSZGUUEiqNUNBTNnf3NVCKrBo6WmXXT8Odhk8vTi3LZ2qttr0wwzw8OpazaHZPHehX/rQRQiDcLukW/wWuLUORS13wZtsEElgg6OSxCwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111840; c=relaxed/simple;
	bh=eqQky4L6vFtBRd5JuCtAYhYItfEVb6bBoMxiAflUToY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZ04ht296HL3eDRjBOrhsMiHQEPV0ajqRT6rHgc/CgIP10861IL7UDFqxlH7cWgdy+bTohC3bM+ygfv5Vlc4MeYlxqlzT0OT/VHwC9pDQG4C3CKJX/Im8ynZ75iBnDDBG0CUiR94IZq87biMtEoKqaHDsJH8XC/iRvMqdjUAKnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRt9JyG+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRt9JyG+"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso215424a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Sep 2026 14:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790111834; x=1790716634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBiLSQPmd8h7HPBJ0oHvFXtAParwes62y7xIdG7uRP8=;
        b=cRt9JyG+5Zxm+vNAUy9nrDCVDTZQlbH1XkL1QJWIxXtQjjQkA4cd6laDEy63EWisZF
         HOzAKMUTjExQZZTysEqmTNhXWUUXy50pv2ZlDYpjFPsgULMAGS0Hd/dYde4TEWWt1y5H
         KcUGtizn2MFvlp5lf+qoj89MasYpVr/za/nS/JSf31EicBL8/QhPk2pYDkKPZqEdFxi9
         qX4Du/C8pk9b7jtTxQd8JPNmYeMUCaeQg5dlqCdbhSHP/CVrVjIrC7qJa/1mvyq9o/YN
         V3sAMEoIZXVUFFFuPT2b/uGelkKf/NyTIbeoxDxMk35uuxMPTzQc7X0eU1bbIZtidZxh
         oZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111834; x=1790716634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBiLSQPmd8h7HPBJ0oHvFXtAParwes62y7xIdG7uRP8=;
        b=WXddFAIWQD07hutTVCthPWPyXGf5B9a/XpxkxUGTYXf1O70xS35RG0OfZHNt1wYt9Z
         uP+aJExcu9AdlmwfHDgcU8IzaVyoKqLzUOG1faPfkLe1IkP09X922+73zYj2KjxKf3iG
         qiXh3smH48RWjzdHdWmtMfzzrX9/IJOKxEVkE95gFcr7J+5VDDyTa2+Tbg/TC7Q7ZdqQ
         tA9JoMj2F4mEztZQBQ9RjSTzyQYHDe5RtVDbwXaURfE08bHALGsOeHN4xVyHpYtFobaI
         GFk7z6JHggFyIl2uAnK8zyNV/3d+u3w5QFu/18gk/ZXMfsE2snvN6zg4en2MxfLTvbMz
         ZU3g==
X-Forwarded-Encrypted: i=1; AKwUvByShWWnh2Dnx+OCJb9IljNJdO/V7k7her4CDeNJkr6Ft4Takm3X2ExytCYSqIo168Vv3PA939XZi21dVlGVxkzvJXJUUQ==@lists.linux.dev
X-Gm-Message-State: AFuF++n3NhH7d4/QwOyNRrlkMmelhmiG8G4YsOvUzCrfIaOfID4MSFmz
	rBK9jcKkfdwhQ0NCIeZsFjPVQyxS03tJdQVoWMyrxSv3NmVGsDQtw5FT
X-Gm-Gg: AYBFou3ZhvXqJ+dCV7xl6xtkKYYZJzuUHEWRMSKn5zgmE9fpPjz38xLijyqscEeHHr4
	gV3a3vEo+QCijSRk2keOO6nMeeKq8tP7CaHtyD81Ro9BlSXUZiuku2tw8k/wHYBkOwW0R0yhfPr
	EGfYqai0ciaVunLorHZHuAJv8AUnww+s7+VO/dtXYh5+zigOiLuoTm3xVLBEKp0FA8i4dTBOKXI
	FUXzQcH3dx73uszuSwbgW5oKihOHIV8riMrF6F7Q9vw8dTC86YTZ/GHU/OFmP3lPTKEgr90ayeC
	OYss4TTETLtGVrs4OSu1llbIYIEsBmx+ux8ZLtnsOBV1I/dg2H7Vi9ahVMCtwyCmkSTIQr+EAs7
	BJ3JT734RfruPdc8H/nXKKnPEU1NgHzDzAGeEBgVhWuUhAVjjhQjpYeM5J5PHfJEUQXRUZhWZOv
	MJv8P4+eJz7tLBYxDcxJOdI/uVCXWQMQwHppKh51Ln9V3TBGIgfNRFewcFfNqXh4SLcwIISO50t
	Mm0Zs1yfk+rxDoIfcE=
X-Received: by 2002:a05:6a00:288b:b0:878:3705:5720 with SMTP id d2e1a72fcca58-87c857f2d1dmr1780277b3a.44.1790111833487;
        Tue, 22 Sep 2026 14:17:13 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb8e37sm320280b3a.5.2026.09.22.14.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:17:13 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thorsten Scherer <t.scherer@eckelmann.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH] gpio: siox: normalize return value of gpio_get
Date: Tue, 22 Sep 2026 21:16:58 +0000
Message-ID: <20260922211702.1480614-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio_siox_get() returns the masked bit from the cached input or output
byte, so for most lines a high level reads back as a value between 2
and 128 instead of 1. The GPIO get callback is expected to return 0 or
1 (or a negative error code).

Since commit 86ef402d805d ("gpiolib: sanitize the return value of
gpio_chip::get()"), gpiolib rejected such values with -EBADE and reads
of a high line failed. Commit ec2cceadfae7 ("gpiolib: normalize the
return value of gc->get() on behalf of buggy drivers") made gpiolib
clamp the value instead, but it now warns on every such read.

Normalize the value returned by gpio_siox_get() to the [0, 1] range.

Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_GPIO_SIOX=m on next-20260922. Not tested on hardware.

 drivers/gpio/gpio-siox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 958034b9f3f3..d60680ace144 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -148,11 +148,11 @@ static int gpio_siox_get(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= 12) {
 		unsigned int bitpos = 19 - offset;
 
-		ret = ddata->setdata[0] & (1 << bitpos);
+		ret = !!(ddata->setdata[0] & (1 << bitpos));
 	} else {
 		unsigned int bitpos = 11 - offset;
 
-		ret = ddata->getdata[bitpos / 8] & (1 << (bitpos % 8));
+		ret = !!(ddata->getdata[bitpos / 8] & (1 << (bitpos % 8)));
 	}
 
 	mutex_unlock(&ddata->lock);
-- 
2.47.3

