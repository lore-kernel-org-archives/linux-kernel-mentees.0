Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFE73A6F1C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 May 2026 22:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625142; cv=none; b=kbLXOe4RIK9ztH6NC+T6uyKTdamKDbsQoMlOJQk0CCSN8VYSREMypPsXzkb+2em+8XFCw9LpfrdUE+zdZigJnHjaOT8fnhG29bZsMH1/5gtkmE7mcvcb7aO6LR5LSnf8gIpFYsvhD2eINEjarzWxoh18vBMCFa3bcB8wcT09LkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625142; c=relaxed/simple;
	bh=ND2HtCTQC52eoNszzlf2ntg7RmeZZ7jwrn6D3EdhVS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYsocLOZT9J5FfmjPFq6aHXx8GIG/5QQv9bZ9pSmd7EyNhGuNjH95j5ksFaxFfUt1QzD1unUHQiD1bKHhG2agOaKyEMUuRxFHAQ5TLx6eVCMniPG+xt6bg+3N51xCFPs0fSvFeizwLc7mgycYCvHhv1P2FbIR8ZNKdwcqPqkpUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CB1eEUst; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CB1eEUst"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso69766235e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 May 2026 15:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625139; x=1779229939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6/kdt7V8DIKCNh3YMA+Wq12M5OeKEn3QJo7BlhEzSU=;
        b=CB1eEUst2txekSwGGpMXrp0tiIqCYHxzgXQs7pRrBTZBDCGFZtjyn5ZlTd8QUb63sQ
         d0i4F1crp6MQc7Ho5feZnIJ+N3+FkIunW7j9/MX51i5Gt0x+EOvGcKPO7REFvKJ3Hl01
         uQ+/209UXQM2JN+st+N2JTnEvRJI3pDM9LYd3z8NYO0dneSpYxR2jFPaEUL0BATsbFGV
         XJszCOt1hYOseuC/r+rQsea1My4B6YukT/7aWfSL+Ob2xnFO7mAzHwkpl4gMVvdR/RK7
         fj7TAnvvp4QhxwM5pVrpV0mv6cKxAMnxt1Mj5lcipXTt3g8EnrrpDd2Kzdpc3HmqPjhN
         kB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625139; x=1779229939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t6/kdt7V8DIKCNh3YMA+Wq12M5OeKEn3QJo7BlhEzSU=;
        b=j0Gfb1Ia9yK4U0/V6idRONBlBd4e5Zmwzx4E0mk0V998GLb2tUX4bzF8qJi9oMWQP8
         xz2CT/YTcT6eO6/V4g7/ter7eLVKpGp3PNVGzSQLMPK7z/NzSgulBJwIv02sfodAKaMh
         SN8pYLVOFTPzkVjpsC5YoUSl9jGizyEaxBKRudrauPNrNtTwXpaRz/wceF2f4httU8ns
         GgGoF19Eqx1N9SwFjw6M19uEglHl7dUYcdJhZTDgYe/Sia8DLpGwt7WHsUeQ1ZZP1XvU
         Wg9cF11+HsvBk8AXDDNxXNqfXOK3KxcYyg0HY0NeBk2IZj9JHOwgiyn85zOyQ0L/Luv6
         VHzw==
X-Forwarded-Encrypted: i=1; AFNElJ/TqIhG12RzrttI6shYgVtdfXVzsGPuz30qfWhq17cuTgBsFery79gLB2LWRt72/S9gyqTR2z0kPygLreHkBuOr88xs4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLnWmED9nbpHNyWO4uR1dsH1IovE8+yvvvhO8UX44LZd1HlhcY
	iLOvhZ9ZUb/RahLc2njJl4LF3WbVMrWe1zLracfwOMAERZ9A8pHaj1tV
X-Gm-Gg: Acq92OFxsFzecd9nQSOEL9OXJJljumGW+Xp8xYSsVVCxrErgbkIgcbMqwGLaihx7SI5
	SfVyKv9LzUsfleCYsgWoCD+YGz0KTMTIsH5n8yuiAkWQh+PMpCrTKKHKhqzYIVxCxn9069WWdRf
	ARLfp/S8or44HSvWF8cM//J6gQjLa6gTYjQV6fJBOIhn/DUHzbOT4VHSHw1j13X4X0aMoGE3SIs
	VxIyoUJcAwUzIiZF6z46ZcnkYIrgWyENaY347hhqhe27agLojLBAQFoTe5L5MdiGXabkmS9hsoD
	04m6JNG/KGpHs4kYW29O8ZjI45pdPzOHSqQVk7nTYh/JUmgEKTwbLLfxRJku/GZKhsHkn9UL0n8
	jeg87BFOieuW3qEkvGjFJ32wyL0elsMiY5PIbJHo7LkcdDESD7NQka0mkfuGbwSc1+dn5AKeiH2
	gUo1gay+r1eOxXLaY90wWfITkskinkipiGg+OGjaMcNiGDjPKAc91Ls7k=
X-Received: by 2002:a05:600c:1f90:b0:48f:81ea:ebbb with SMTP id 5b1f17b1804b1-48fce99dc1cmr929805e9.6.1778625138873;
        Tue, 12 May 2026 15:32:18 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3c65f2sm47377375e9.1.2026.05.12.15.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:32:18 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 1/5] iio: light: tcs3472: sort headers alphabetically
Date: Wed, 13 May 2026 00:32:11 +0200
Message-ID: <20260512223215.25596-2-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512223215.25596-1-aldocontelk@gmail.com>
References: <20260512223215.25596-1-aldocontelk@gmail.com>
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
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
 drivers/iio/light/tcs3472.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index 12429a3261b3..9b0f64cd9c50 100644
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

