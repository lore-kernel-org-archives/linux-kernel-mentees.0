Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C37A2797AE
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  5 Aug 2025 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754406540; cv=none; b=W4S0jK8d2uAiemGx5KoewEjwRz1qjRwQF3RBevPVQznMqmymrybv0P0ZNTllPk0BAYleQOFpgxIuouwGdtPwb5poX2WyWYIbY7+VhvLWyNyfG1z9+kQ7LAh2N1QBIGzGnofksQurCB7SgRRbOzhGlFj1jJqg05GDaVr9hPUZvYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754406540; c=relaxed/simple;
	bh=6ooIakJHfw7YXMmRWfrQTaJz2DBq2g0w8g/ZJdwjlOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=alPgdgdTYS9zC5w0xa1AUxX4NaU9h9bK01eKHEYpdWrwVmJLuaFYUiLRNcN8h0WlaEbMKj5RiwuDKzSp91SAbuf1C4eBwS6KYWEO2f2N5PZiEYs0xx+p73ldTrsSxGuZffIR1RCaOMTvUGE02Zhjra41WXsmx9LqqlvesDKOY0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=sVkFCCSa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="sVkFCCSa"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45896cf24ebso44323325e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 05 Aug 2025 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1754406534; x=1755011334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H1NFToLTMCBICwkF2bXpGG3zLl1KYY37VeQX64wTwe4=;
        b=sVkFCCSaqM4tQ21zm1ZTseBWRV/jgwSqJKRM21fidqXk8iMmhJiNwGaOP1MYMyM1f7
         XV5TUIzTK3xcRoRP+X9D7SGDCHn6Xx+u5qPS4YJr8XBpUoKyxa4OBnjtXO3vcBBdUdsp
         zcd68lRFlVfUiiXegtetjwRIu5skC2kFaIuckWhqGJTGST1Bq/EpAxCG+uwSedgv0s9L
         9fwoXOVO57XLI5h9S6aJTCzokOpZJBbwdpWmT2Ty0Hx4FJUhnVTr6i3uq1Ui0XnoogWR
         d+GSKOfdAX7a2N/G6SLsIuQNlhAfBKkhFxX4qIRHqXexVHEX/s33htXBiPuGsiYFetr+
         rwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754406534; x=1755011334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1NFToLTMCBICwkF2bXpGG3zLl1KYY37VeQX64wTwe4=;
        b=XJ/TPcU+4Sba/3vOudoEbedXAgB+5we5ej6yIxMz5/ZrW2QZf0bq/RFfiK4O9a05y3
         FTazPA6OCuKmpRaesq6C/Olpm5LIWLsg/P3oEr2OnwuYZOyYwKW0v2qfGF6DXHdKS0Pg
         2jmYBzv3x8n0ng3vjsx1CWvlbswlwMx3BbaFSoP2w/JeSNyVop086styoBNHJ1iFLnEq
         utcyn2X6SI33tQDpqPLgM4HYUJgEe4Dp5EVjV+lp1qVYvXjKpzC2/KZIDC4ABzDKq+9Q
         r6pYykqgA31aLl6C1TKqNb8fHn050KLSwdGDsehP4y5aMt8ct5LZ90bJ9pmXkovaR1hj
         eg7w==
X-Forwarded-Encrypted: i=1; AJvYcCWnLn01KcRbUeaRpLUETzEQAXRbzxQyv46euPFoMToze4BKztojfr0hH4Uh8SgMZC+DVh3mGT6Gx1phmUHEdk8Te6RGmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwK+ewLaW2O5v4hOwUINYJeGwlUk0TMKjZqRQ9HW+Rf7d7GJtTb
	KgGFbuCk7tFpAzYFyXwPJfxi8IEhjYd74m68DvdZxjsFzzofFXdgMmJUH8d0HM7ZQjs=
X-Gm-Gg: ASbGnctQ16eqdZ4+lyGVrnP28mP03PdWdGvFWp4qSQqJu7HaICJ82jKYxaVPKUuWkVm
	4woiZ5kQK6WP5LgAPQbw845+waUwo1Ee6MJVEjVAkLzS348OZnyJx+scPNyDdYLic7rX30Yxiys
	7I9sPjCd7IlthaXZv/+OIPQ16SykgJYeMvvg2clZBjuZc+coX2LunkVmRQeKgRj9rNYgh2ftr4G
	OpROZHSKT56jaWWz8NJjAQIpbtuajYeEWpSVYKQ+BJf7BONXQNpHZSdQv6uH5ay4Izxsd3uXH1q
	ErfbOmBp9HQ5IZUiTCCEYEffFhs1hYl83pNE6k+LlP76FT5nLKKeFqJ7pAOjdmV9e1kCzZHAKsp
	CzMW3A/yTVgzn3LhpcLxYO9xwcsJcnqJ4di6uGZqj1Qyi77w8
X-Google-Smtp-Source: AGHT+IFxn5pLwK5DhH3KCFQWy4nsv5vsgTiDMhFW15HhwD65qkQk4OJb8IifzI8vS1mm024ju4SDkg==
X-Received: by 2002:a05:600c:1c98:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-459d8c2833amr66948015e9.7.1754406534167;
        Tue, 05 Aug 2025 08:08:54 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:e77f:3816:a0b:2c4d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469582sm19264199f8f.52.2025.08.05.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 08:08:53 -0700 (PDT)
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
Subject: [PATCH] pinctrl: spacemit: remove extra line in debug output
Date: Tue,  5 Aug 2025 17:07:01 +0200
Message-ID: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug output for spacemit_pinconf_dbg_show() prints an extra newline
at the end. This is redundant as pinconf_pins_show() in pinconf.c already
adds a newline in its for loop.

Remove the newline to avoid the extra line in the output.

Example current output:
$ cat /sys/kernel/debug/pinctrl/d401e000.pinctrl/pinconf-pins
Pin config settings per pin
Format: pin (name): configs
pin 0 (GPIO_00): , bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)

pin 1 (GPIO_01): slew rate (0x0), bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)

pin 2 (GPIO_02): slew rate (0x0), bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)

...

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 9996b1c4a07e..fb361f2acb54 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -707,7 +707,7 @@ static void spacemit_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 			   spacemit_get_drive_strength_mA(IO_TYPE_1V8, tmp),
 			   spacemit_get_drive_strength_mA(IO_TYPE_3V3, tmp));
 
-	seq_printf(seq, ", register (0x%04x)\n", value);
+	seq_printf(seq, ", register (0x%04x)", value);
 }
 
 static const struct pinconf_ops spacemit_pinconf_ops = {
-- 
2.43.0

