Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5563B0AE9
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453266; cv=none; b=uzom7Kuk/CtQoUSU8ySrA0sXb3mo81SAf32d4kNYfYkWipsianNr6lu0+mQz3fpbzXi3etC0xAwF+14H3uIm541B+j6BlZR6VivFUdwO0ULmJU1852ksFP5aP5Ue9GYHNliw8SI9zt6JopMeWJbbxr2A34YtjgHXjbJDaPul790=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453266; c=relaxed/simple;
	bh=i+te5LxeNXfjJjKfGqFDIuk1wWeRe58/ljtNFiAjvXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZ93/SBFZg6qNVbqQmvZHNwGlG/NPV8KMKhrXe/5oNxcvqvvLhBtZuDM+vSTs57eDalqUDRje0ZgmBnguOcEFEUExZtuQ4DzzW/88OQQBdX2t9OMFYdmS5PsNg+GOo/pVAUbPs/J5O2eCdi5SBc6R1G9z3mfriQrOpudmpAhZq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ooeFiXT0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ooeFiXT0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so18292775e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 05:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779453263; x=1780058063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlnYnPb7deSBfYn8dj/YiBzt8a6SjFibSLJrCP9deBQ=;
        b=ooeFiXT0SdjTVnX3IRuxp2QyRjwgqAXaIC9/qRoh1T2vspPHP/5atQAX5MUgFuxdE9
         jKudTBI3LtAw5zO5aDD0EuMoIIrBtwyW9izCOy8Ql0mHxEMP5YZ/QS3RT6ZIE1xMX3kM
         GpRoJV+Rd0NGkwmeuk7j/MuhlmGb9AeIMMxDapaFZFhWmUBizdumAeQcIcrOjVo+7TMh
         YjkfxlNjc5ftby0MjLFB/beXmvsagRlp9s1mKNXwkS1QWe1xuASmW9c7dCycnltncZa0
         XhRO0YY5raKmLiiim1jvrQRs8T5jrTY9rOO6bhrFZao7d6av1DaaJYiqKdedi++cNCaA
         mkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453263; x=1780058063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tlnYnPb7deSBfYn8dj/YiBzt8a6SjFibSLJrCP9deBQ=;
        b=FmNFm0nB99GX9K3sFSrWxeqIdT5b1DKyAS8IKE2fUQw6hH0o2FZpicimwN0gzzOrCN
         D6p/I7tEHmythDZ1YBzbzWqRoRwnm8mBPLnEnaPVu6akosnk0Y1QNOAHMtrSMDkM5gJN
         40gwLqNZFsenHAruQq9/93Oc2mbwztN5GIhWPiKIMB/4jCSRshEGasqRaP7varVG3oU0
         VIVwSQE8gZuPYE49EOzAu+0TgGdeT8jUbolpYwfoixJk9Ii2T7+wRfHLswgFNvjSA1PW
         tPRthDmbz06d05Nm5SK94IniHV16+X3VfUBtyKL6Ye4IFldr+TTPLSrQWch8whZiEYQM
         6DmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UjelZ5r4w7Gjn85UdPEmD2Gxym2NaEmDQt9kIE4s47q8ARwdTlWOthOULKrq3leuuh/7Z22haN8zd7RZUQAcYnparNA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbVggIYLT6pfdc929xYYaBwu3zSf0rh4RJvqfoSoUuyt+2TTpv
	8hcRpEyFG43YurPlqdc+DAIA90QKtj8Tj8ELPgfaW3GoBsjpPVx0mJj+
X-Gm-Gg: Acq92OGUJpHu1hooMd926SolLRp3v5J7bY7jgI3rjh9yUq3VnkqmPeGA3feUn9Lnnms
	+WyrAsYeigMwzLpXvba43mEg9HM5FycCHKM2q7wrxBGTvBClHHOCs8qlcP76XCpclkfMhdUMN4B
	9LsN7FZDCqIhrBKqwv8WkoLnx8LUdkexXFeeu11Mq6q/Z+/Z/jCNB8Fac/v1sDy/psxdhvOk4xg
	yflMo5ZCx/eFe0QjlFO3WMNWN0Lvrv/IX6W79/XlDdmvK33iaKjQySkix8ZGimCeXvozdUaECaE
	goKlmBMs6zKeg7RxmeLi+RSVszPN2KD1RuVvH9r8QBgl6033bzTZkGLt5SqE3bDYi2vpTv+jOx8
	qrZsDLTiNP4s0W5TLSrGAhI6WjtadywibMYzwkl4G0BXjyKfpQjQWUpQZLW6JfBRglB0xE4FfKT
	dyCW7e/sN8GJQ7XVGFhYFXe/NlfL0RaYdPRw08oRM/ULLtLS4OWY+ToaupM4qoFvA=
X-Received: by 2002:a05:600c:4fd0:b0:48e:82b4:b54 with SMTP id 5b1f17b1804b1-490426d1ebbmr44443135e9.23.1779453263098;
        Fri, 22 May 2026 05:34:23 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm14760175e9.31.2026.05.22.05.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:34:22 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	joshua.crofts1@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 2/8] iio: tcs3472: sort headers alphabetically
Date: Fri, 22 May 2026 14:34:13 +0200
Message-ID: <20260522123420.45495-3-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123420.45495-1-aldocontelk@gmail.com>
References: <20260522123420.45495-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the #include directives in alphabetical order in preparation for
adding new headers in upcoming patches.

No functional change.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
v3:
- No changes.

 drivers/iio/light/tcs3472.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index 849ca7885d71..1803bb882804 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -13,16 +13,16 @@
  * TODO: wait time
  */
 
-#include <linux/module.h>
-#include <linux/i2c.h>
 #include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
 #include <linux/pm.h>
 
+#include <linux/iio/buffer.h>
+#include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-#include <linux/iio/events.h>
 #include <linux/iio/trigger_consumer.h>
-#include <linux/iio/buffer.h>
 #include <linux/iio/triggered_buffer.h>
 
 #define TCS3472_DRV_NAME "tcs3472"
-- 
2.54.0

