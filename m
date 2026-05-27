Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B82323535E
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 27 May 2026 01:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779846070; cv=none; b=fO2ehcMRMmlORVUKbiSxcbgG8CGsTfoGXtP+fH+L+/GQnZ+qDkv4J40yZh36d4+DBskBaibZjb4Vge6dxZc4zVl0+6U0b+y9DCHon1r5HE28WoSoCy/DWV0l24pa2mnW3UQ/DqSnKFW8o0gAHVy8kxXQ0hI3fQWhC54ncl5v/JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779846070; c=relaxed/simple;
	bh=nXG00qI4jbRkiq1UNzqhNcbG8PzRvXDO1LwaoONKdlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=au//WnjbMiDa7PZCBVYdOlpzbq9H1ee0uYmd9bgBs7VtoE/mnZmH++R3eIfVRt9hLsXZ9j04FF6rR0R3EGhOelVisuYWy/t3i1YH+CiJKhlwrURjgBDaO8ewEXFVmGsTaX0YHGU+uXggiyZTkp4Z/nQJ/RHlpXf138G1r9FTYJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkDDiQE4; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkDDiQE4"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5751b7d147aso4119762e0c.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 May 2026 18:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779846068; x=1780450868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+obQ+QMObdWoIY0dkdCGKByIrij2b20AJF6FCBoa2Rw=;
        b=rkDDiQE4m79KYB2nZy7quw7r0ZV9ywF9wZYLwXrj1Y2gSFnKIY1cpBA0hvjFRSMiwJ
         YOzfAoV0CFc+1uU1vEgnbWBHTrcnPWTBxIkl7bM6e/B3G3dm0hhBTo2fsedWRcWIHyH/
         YAIEP4WbENcZ5rZLdcGnYJSj3RDEzlQmcZ8p3Nf+FBprhwxIVk80Y5zBV4/Xl5/I9lA+
         4N0kMCddNzA26ZA5apVckJcOzhJXi5MCnUHJ3q8v8a5Y3QGHGbrRSO8rgtHkAc26qAAj
         Szm9hi7vGJ8e2HraP6cfrNOsYErlKQ/h1GMcFaqAp1QWyMflh7W71PiLDTbaw4sxy6JY
         UARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779846068; x=1780450868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+obQ+QMObdWoIY0dkdCGKByIrij2b20AJF6FCBoa2Rw=;
        b=jIFBz/YuKTMHsD/SICfrOUbPIisHJhIcBl6pSHvIYSKx1yHJEpZ8KCcN7vxrWuDH9n
         v+XJcXGbolJ9et6cmJ8d6qlj/LeDkphvE0753q6UA5DSPFXTPcNw4IBLDwfpuG3slMgY
         p8k1VILUh9lH8OtYL7FtFStSzZ4eNljBey0b9hn+ty5CsKWtZi3iX/VRBuXl2Cw/D46/
         lcIUyPB0PnrQ8EidAEtKETj+DBc34bQhzHg1cKtO3mb3ioVRIXJgygDcuL9Y07I4EzB2
         lbck1DvOFjNNlTzm2v92MnlULvntCEie03teuWtuGmn9L/2PI5oaHvyPXBBqPE60n9WC
         ExAA==
X-Forwarded-Encrypted: i=1; AFNElJ/Q/6ZKzihRRvcoZAkA6kwzJSXxTtX3y/fRHPjV1Ijklnk/1ufQbP1y3mbhMD1jT+C391xpFWg1bSVcLLqOT/ikIF9wNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPT8oxC1Mjdo8LpPrlpHc9MvLyzxcKOxr7ilE+yi9R9gVtvzQH
	Rf29ShJEb1d7NEg1ps1XGqJ0JJ/Lb1+y37iXQd2x7NK1Nahbpabgw9cd
X-Gm-Gg: Acq92OGitT3tvkq53uOMm/TAj8bg4XCg7vhtDmvAtzat+h3O1/1dpsDfWyq52p5Egzp
	vBz1Ok0nu23lmFt7QbNhKkVB7jF0ZOCI1G+FzUvthcKeN5Xo2NUgAWG6qdzCJRZMVnjZZWaIJ7B
	eGjTURut5VQhiR/t52/hVk9Gee1JdKJ1ldrgeaknQAeYEKdczwGYpQlU5c/YFryt05XY5oTuOyb
	P9FUvvi7DdV4lOdf4ZXPm0dCZjEaBOxFU6VG8GOE/n56NfAX2QyjTVLvpZT7I6RgJudXzKLy24O
	SzOuxk/ghJDPRJZjh0vw7MB/JjIMUj3AUv0BE+9tk/3gJeZ//6eozqxp1cTaluGMsKIbm6y8JLA
	om2XnwcEwPq/615fmVc2xe1bFCUaK9uXhkzWiB+lQNSfziuKgT9YNcypIfS9BcFqKkCHLvvzd4Q
	1tZfl2QXXLqO+bN5twnjyFHoN3RHOPE6LtUklon8IjXOgixBKIPNr8NJUeiMhoEQrlrczzBcvql
	Ys=
X-Received: by 2002:a05:6122:ca1:b0:575:3b34:28b6 with SMTP id 71dfb90a1353d-586624cee61mr10386614e0c.11.1779846068065;
        Tue, 26 May 2026 18:41:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:730:757b:d7ca:355])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f2f791d1sm18491348e0c.5.2026.05.26.18.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 18:41:07 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] iio: adc: spear_adc: sort and clean up headers for IWYU
Date: Tue, 26 May 2026 22:36:38 -0300
Message-ID: <20260527014058.35265-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is sorting existing includes and then cleaning up unused
headers as well as adding new ones to follow the IWYU principle.
---
Hi, all, 

Creating a series as suggested at v3, no functional change.
Tks and regards.

Changelog:
v4: split into two patches as requested by reviewer
v3: https://lore.kernel.org/all/20260324221313.119473-1-rodrigo.gobbi.7@gmail.com/
v2: https://lore.kernel.org/all/20251206132120.11059-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20251009182636.187026-1-rodrigo.gobbi.7@gmail.com/

---
Rodrigo Gobbi (2):
  iio: adc: spear_adc: sort includes alphabetically
  iio: adc: spear_adc: Align headers with IWYU principle

 drivers/iio/adc/spear_adc.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

-- 
2.48.1

