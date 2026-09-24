Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3854DC551
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 20:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283221; cv=none; b=N8j75dk36+oniM36cMisGBRNWNQ0RtQuGH8/8vDfizqZpdkaZMN+b6RPkZfYhQ7vVYs+Sb5YSZ/8MDtRCymWi8/1J8MvqJFs9+jGae70HAy2P+OUexsU3hRBNIUE8wmQIvI9YI2+0sTy9YunT7trBfzrNkYjjNWdkDL9GaonBoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283221; c=relaxed/simple;
	bh=YXZNt7FoFx2gvLvRF36mGXyBk/084QFiboasIv3H5kY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdKefwAT4A7mbtmtFNl9ioYUepX2Tzzu2Ess6e2C+u/fU8bjfSYTsvlXl3h7hgTxilyXwVT7otUKjr0ohE6A0mIsB3a5zvTlSaMVpyuCrNgL49/VKqgLTBWa68hT0F5siMklN+fc5OZIMHuKPfz+emNrGrjdxpfi1xka/qnd2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es8pDd2c; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es8pDd2c"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48434392b02so151873f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 13:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790283218; x=1790888018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKIBJvMX0GJgTDoKadjpCO9qp4INYSWWQBf64XMtjRA=;
        b=es8pDd2cJoQjIDixrhKW9OREqJ+SpmgE1Dht3Juo6J5mQZUpN3AEOg4GK9veul6YF7
         iYjeq1dfHGgIkgb/ggr5Dde0+8Mj+XwyMbsXtpoktVdFBiDM1RUFg1an9IcrpSB+ZAF6
         CIDFOEpncTAlsNoldgTfFeY2lytTEJ8HOF7rWMbFJaaXOvvbxCiDaqBITBPpe2eCSETH
         EeHRv0FYxW4fyBnxk+fZzZLZn1ovDQitzxYfH0enmhdJLuK80c88DWvKUnTLg4XIg1dn
         scRhX8XWGirvJt2QXfBqVbCC3QvAyRR6M9ISf5lE2edFYtXfjddK08dI4vzHorgqScA/
         RprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283218; x=1790888018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKIBJvMX0GJgTDoKadjpCO9qp4INYSWWQBf64XMtjRA=;
        b=ED0f/9RErH5+/qofYf3uBl8HXTy+WLCyayjfKrY7obQsmOHjyiCO9740h5G3Be165m
         ODQ8JxhiN2rnGRxqW2H+mZC3+dEt/6+U2gOKDJfnPsMD3nZbo9XsCm274QUbwwOwRQfx
         xaHC1v0U1kjB2H3BsGT/c/EX/8pTqc8gBDpsdDRp/MIM9qCMiBQ9/3pBC0YBVNMS8YDC
         yTeGv5yAZgBkgUbo6Q3nALUFuPSLlvgFMWL0o79IJzHKOq4Rc1V0NspiuaXtqM8QAkkV
         5KKjkGV1QYZTpvV98vZ/EWm6iX83SkAR4+Uwl2ZRmvPu1km5t3B4JwVmmxJh5Gv2+b6X
         YtIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzut8ey0vV7luxrfFYrQe9/foicibk8z1HT1uJRNQxP1bohVpJNVPFrOJ643hrSqNZbQO0hNb9viagruIPcCT3AHOANbA==@lists.linux.dev
X-Gm-Message-State: AFuF++nUWRtjhsT2S8YsMC0VWpn1pzmWFJA+fVVwPE6Be65H1YeRzufS
	NqqsVbvDrGzXgC+/ycjxzQwWYGPDG5Rc+b7GHc26s1tkIDZZrqpreryQ
X-Gm-Gg: AYBFou0qRSE9fA9X18uQHE1edvHrhINCpltgza2PdPjhQj3XrAFlj4Ou9w89neI/S2K
	iJVuC1Qj1ZQynfAJBIBcncFir8e58GSVsR6N5Xho2+Yojop9TxfaXuuPIRfZdbwsqJ75bIvYJ+K
	L2+IdLCIhQ7gkK1ZV4Swo8f2jSzVon3xkO/qBblqI7qk1l3r1V/Z8rfdY+Fd0/nlqc+GfLMQ8S7
	2ZebwBV5OIgRLPGm12AVNRo0GEofM765BlwQmcVBhME7EorumYvJKnw2fl+hlzTo8HHauG01EeH
	f1JfvPWuD+ZLmExphfJlBETp3YplqfxlJN8Cbaxi0w0JWrFe1TZdM+U/7ygwTZUesUWByd2wPQF
	yBghlIN13E3bNb/Bjtl01BLMbNPI81UZ+dko8Vc7iafKy963Ve+uETaEYpCghsnys6dTrsUX2LS
	pbVTf/InWXxtEwrpdD5JaE8NjHlu6szXVPv0Mtu48rMvAyYSiQ2T0vZRyfirzOpTeh4Xq9nnlfo
	z5AES1P4ETynU//1905
X-Received: by 2002:a05:6000:1886:b0:486:e8fa:f9b7 with SMTP id ffacd0b85a97d-488716c12f0mr6527375f8f.13.1790283217820;
        Thu, 24 Sep 2026 13:53:37 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm1691360f8f.1.2026.09.24.13.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:53:37 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Lamparter <chunkeey@googlemail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Date: Thu, 24 Sep 2026 20:53:23 +0000
Message-ID: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

temp1_input_show() drops the low bits of the temperature register by
dividing the raw value (raw / 32 on the LM70). These bits are not part
of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
return some of them as 1, and the TMP125 fills them with copies of the
temperature LSB. Division rounds toward zero, so a negative temperature
with any of these bits set is reported one LSB too high.

For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
the driver reports as -24750.

Use an arithmetic right shift instead, which drops the low bits and
rounds down. tmp421 had a similar problem with negative values, fixed
by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
values").

Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 and arm (ep93xx_defconfig) with CONFIG_SENSORS_LM70=m. Tested in QEMU (arm64 and arm) with a stub SPI controller returning the datasheet register values; not tested on hardware.

 drivers/hwmon/lm70.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
index 8b525725fef4..b29bac7a4cc1 100644
--- a/drivers/hwmon/lm70.c
+++ b/drivers/hwmon/lm70.c
@@ -96,21 +96,21 @@ static ssize_t temp1_input_show(struct device *dev,
 	 */
 	switch (p_lm70->chip) {
 	case LM70_CHIP_LM70:
-		val = ((int)raw / 32) * 250;
+		val = ((int)raw >> 5) * 250;
 		break;
 
 	case LM70_CHIP_TMP121:
 	case LM70_CHIP_TMP122:
 	case LM70_CHIP_LM74:
-		val = ((int)raw / 8) * 625 / 10;
+		val = ((int)raw >> 3) * 625 / 10;
 		break;
 
 	case LM70_CHIP_LM71:
-		val = ((int)raw / 4) * 3125 / 100;
+		val = ((int)raw >> 2) * 3125 / 100;
 		break;
 
 	case LM70_CHIP_TMP125:
-		val = (sign_extend32(raw, 14) / 32) * 250;
+		val = (sign_extend32(raw, 14) >> 5) * 250;
 		break;
 	}
 
-- 
2.47.3

