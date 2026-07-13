Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799843F4DDA
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943936; cv=none; b=pjz2QH7hkR/iQ2V73z0MQ6Ysfv02hHsckL4Ogl704opxXaDzFcRE0fO7Wm36hXb/bOBiVAYtxhS+9aAS+tTYldwBLqp6gV1ev+fySwYR8YvQHFLFMeSnKDCUFT9P6g53E84vxNZvDEarySXJH6jYJhUIGhkIbGCSwSxutIbd1SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943936; c=relaxed/simple;
	bh=tuUhSWsXBqBlAORq9TsPaWcw9THuG6DmItaa24bC9j8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U9yYPgJcOW+OHjXXTG0GEbSKqzdZcGCWl3Tl53rCJgmGBRUNVs+JemUVYt5mkMvGlfDAhzLnCr5i4lg1GvHV0T4YOhmcsOS2+sxvJK2FL95IdoOPWNf2tR5wKKOQm0E/PsubQDh9no1TXs36b4IuDny/TzkeT8xpGd4i+1vZ4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmK4beUM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmK4beUM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cacd69a9c0so31520605ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783943935; x=1784548735; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KMCqb0ZisPZZmgRadRDvZ258fCl2AulK6nt/+PSX+EE=;
        b=hmK4beUMMSiT4od9KiNy9gxlQmV16mMW+F6y2fn6IDTvhFwAMlh7a8HJsAU+z6yLUy
         vA2foyORPYi1RrAYY8WNW2kP3q4DQghDpzZ0G8Jcs3xEbiyi7Lrxk2Wq56+82Jt9xhPE
         S2Af9B6MvanYoWTwCE9mzQXbrNIXYBVD8Jq46yBGeEo4nW4SNTqqMLEpZlvUbPOrXT0a
         PH6WPLSAUXEbriQ7gNL8hhXoCnV/ATt6Qy8bPJOlBs5Uly7ZBowAxpQvSV0rYMQLFFYu
         ahTzBVDDws5YhP5KEFvMKZwv2bwAoteCv0zHDwrTtoBr4Tl5mYI0ndN8i7ZwL8HWc4wl
         Y/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783943935; x=1784548735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMCqb0ZisPZZmgRadRDvZ258fCl2AulK6nt/+PSX+EE=;
        b=dmsmxzsD7FPRiJhdjhydfwXM+rH5wI+FsL7j0PmQ7erSCehSiueu7TiMyP8/6SEjEG
         GmtV5ntt4oCRiJ93gIQb5Fa770zzFcVjQhq0doc2JmXtI/2DRp36d3YiiEiNkhlOciUP
         Z/GZvTBam9Bn6MdeuPqgD1Gh1xl6l0qPma2c6jDq5Ab7vNhZBBmqQyXPf7eNeGbtaATX
         D7RI0uVLrGIfDGzwb6EhpjwbYT/GNGr4qWu8fQPZuo5qhfbXEPQt1YHtnzaBfZIQAdc9
         lmf26vuIajn35Lx/Jc4j1oUXSmlx8awYoZ9O7u0ZCpV3FjAi90IXmdOblKsGEkLZ+6zt
         nUSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2Fz6tS3YIU0uyOcVz3KlD1V0Vas/axxddDdWZyhHL9Awx/AZdUIU/IDDrPqXs0Wl/v/87wGtn6Z7OS1kvVQab7NrG2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhkCj5ywra+BpZcPGNnTzPL/B0MW1VP23dpB7WY2riK9ffZ0DP
	zUGxiTjIoFT+c0s6qCqo0W5ko+Q10lOolHLgAaIqM9Z6F3+/TZztmtsghRjdiw==
X-Gm-Gg: AfdE7cmO8iQtq8Y1hAUCvSD6jWEDSCGgUJwGEZtNF/ASDBOiiuQwFMpHIhcQl4PaSum
	3VZfiSv9dwufAtJ+YOoyCmlf4E2T6NBwKkgoKoAsbvSbwN/J6KKpWxd09m2QJFBe/907Hy7T9Un
	WdRFK4DPiYIs6NfSZ7+qTWUqQ0zg8UyxNx8sJFOHavCI8oFqvIOdZh2oi4xmYD+yXBdHB2oYSPN
	ymN/ybFvgZ66OWRtsN2Y4V5adXf4RWfFVZFmBSBKVT3IFiITrmWvQjLl/7QVSzyG5z/4AuKsoxt
	I1ZKFU+6RW+GZGgOjAyqY5KkDSZQ2oJzMmQNZ3jB9BCIOFZh/nJ9XddYpJQelSRpV7Lp/lc6tSO
	jgGV0+PQs53q2U0LqZwSotw/muCqa4P+l0zXLAZofKPrRUiWaaqLFnkicj0V207CEkTdT39W3mp
	+jJg7DPf42Ha17sjrh6DtABhpXkGwJUI/MAaI4y/6z4sg26UPOAg==
X-Received: by 2002:a05:6a20:a11c:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3c110b6e09bmr9547183637.54.1783943934740;
        Mon, 13 Jul 2026 04:58:54 -0700 (PDT)
Received: from primary ([223.181.22.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm63668369c88.13.2026.07.13.04.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:58:54 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shreeya.patel@collabora.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH] iio: light: ltrf216a: fix runtime PM reference leak in error path
Date: Mon, 13 Jul 2026 07:58:29 +0530
Message-ID: <20260713022829.234370-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ltrf216a_get_lux() acquires a runtime PM reference by calling
ltrf216a_set_power_state(data, true). However, if
ltrf216a_read_data() fails, the function returns immediately without
dropping the reference.

This leaves the runtime PM usage count unbalanced, preventing the device
from autosuspending after a failed read.

Fix this by releasing the runtime PM reference before returning from the
error path.

Fixes: 83f0bcd40d5c ("iio: light: Add support for ltrf216a sensor")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 drivers/iio/light/ltrf216a.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/light/ltrf216a.c b/drivers/iio/light/ltrf216a.c
index 3f34ddc911b4..3ec239eb5831 100644
--- a/drivers/iio/light/ltrf216a.c
+++ b/drivers/iio/light/ltrf216a.c
@@ -247,8 +247,10 @@ static int ltrf216a_get_lux(struct ltrf216a_data *data)
 		return ret;
 
 	greendata = ltrf216a_read_data(data, LTRF216A_ALS_DATA_0);
-	if (greendata < 0)
+	if (greendata < 0) {
+		ltrf216a_set_power_state(data, false);
 		return greendata;
+	}
 
 	ltrf216a_set_power_state(data, false);
 

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.53.0

