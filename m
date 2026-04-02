Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3AE2E2852
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  2 Apr 2026 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143056; cv=none; b=qnUQS81ytv8VoTMgHp8E4OGxXUftq86CvfHmKBkJjvBlDUHdrFFhcAZgH5Qccgzcm3CKL/VqTScapdORjzFUn3jYc0rfzMz3YBsdRVmXQrLQSceXGTiJiHCsa2Vse9KhRSLu9jalAdV7NHE/QaoXRlNIu/ZnFyAzy0KQwcOKV8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143056; c=relaxed/simple;
	bh=aHlNdC7p4DbRc/CSG+7y5M1Es1dchVp3/OjYYcQIzik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f9BbW+Q9p2EhNrJAMytXsZ5UMAzVLJqroEjn+IwE0gBrrwkZP2W68zGq70zfCNLb4bw9LhEsc3q07nYhyXmPjVvyekPKTe2x6iJh+sVPYfQzxl6yp9kxUWCj73PoAiWS5k3BCrqE8LOJdyX4ZZlwFKm5HIHRFVcqFd1mB7zDInQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6zwSr6/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6zwSr6/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so9275885e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 02 Apr 2026 08:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775143053; x=1775747853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mntd8M4unC7CNIQW3NEt3PPWaslHcdDa4XbiAqvFdwc=;
        b=J6zwSr6/jWGgcjC5+Fs262UT1CerZw5GBIp2Xgk4mwPP6JbUCrC+sD2HtNlY2DJ7ZO
         xy3PQdSU+7WF+9wINAqe97lUcyswfSqTw2Zzfpm3QfnEH5GrBR+3ZOO1DG+2n/IsgQfU
         8yrfSjveunewFrmS/5+LVEWOAiUgk5igdvmqBT3Z/wyn1tkDV86FC/kNibC+CH5gu0HT
         kjvw91bilUxB+/96cd6cXTwDWH5h7Npyfm4AqWb0pBP5KL1exbz3b+eh/1M0tCYFkoMg
         X9U4kl/LiiaXh9SRoSG7WYuV+smtiOsYuWdldgxwyezJ33XrCG4qpJedWEdt1wE/uNNS
         tmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775143053; x=1775747853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mntd8M4unC7CNIQW3NEt3PPWaslHcdDa4XbiAqvFdwc=;
        b=QbwopxiR4Fx2kHc1z7dvcr4dYvRPvdc/Tvw5mKErhwH/EFHf8gYRGRT5KR/U1Np+LY
         8sv8W+unOJU7VuCslXp/ipNvj43+Gdm9yYg0smcxeb8ytEO3X28X0CbMKPu8u4KxHo+q
         fVDFp1VCIGaBCtHjRna5dJ12PBFPhrKQTzDxnypTz9IaWNHMgr3DBhtezrbyEhdjaSmY
         oGJ85DW/sfqbPJEBuNfM4h2XgaXJnTMITRCvIqoPLumlRJAxewOyGoTwwP2C9DvgMUTz
         v5Pjbv+y77Qw2xM1qOyamPJhkA1PqVAI3GtOWUXEBemXYaY3hzGQjIH4Y/S8W602hoqU
         NahQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDCh0sIFQjCG5p7gazVdOB5yVRwqD34SrpJgNYNPPYaOEW1kvCSPULL1hu28orW86QPldHWgOYj15cu3thb1qGXjFPqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBUHv82pYxpW9E/PkoojtTjuLjFZP+H6EzupKqqbQbpcyCdJ4N
	Eu5mqijcVX8juQ8/9+tuCgurdGZaAyBM+YduhelGIes8zoH75XMDDF/K
X-Gm-Gg: ATEYQzxoj6AbW8q+68E3PyC9z0PeSmKKND/XJS70kMNqfzZ8FHm0Bo0Gvp+nSaZ76tH
	SGYxeT5PSQTwGn5cl+UTw3dTrUFAz97lMW4B4Z7nYZJZvtxLZBsKX6gLcYAikufM7bOyyfwY/R1
	b/Hcjge2O+b9tRBuqCbNwOsp9LOKB08ASYQ1osPwUIDZCHiy/4NJvira8o2DFhyiWr46qGQgbjG
	9PZIwBdt/CvyC5yKT4HNvgYC6ZZ2SJtV/s/mLgK4PGGAb8DBCXjhMaN0qEd23XK8XgOdcnEuV+w
	JAFj5PoW7GZqSPEp7YYzd1AUEjaMsbxN/6reifuuUA3XhMXEG/+Mg4h5rwQQDBhWeiteLklmYCz
	+iSGkImiPFBboPGRp/2dQoqMsrpWt+YvhhAvCGHEExWd1nXrKt9jIBpzlzf1ddkRlJvQKs6u2Ho
	VR4sK7L5suG1Efh63z+L+I1jaTwaxZ6meZvUxnK9lhpd1XFZEdm6fN
X-Received: by 2002:a05:600c:1e85:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-4888b5112admr64270425e9.0.1775143052811;
        Thu, 02 Apr 2026 08:17:32 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm327405075e9.2.2026.04.02.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:17:32 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: ktsai@capellamicro.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	daniel.baluta@intel.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/2] Subject: [PATCH 0/2] iio: light: cm3323: fix and cleanup
Date: Thu,  2 Apr 2026 17:17:28 +0200
Message-ID: <20260402151730.18901-1-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a bug and does a cleanup of the CM3323 
color light sensor driver.

Patch 1 fixes data->reg_conf being incorrectly initialized with the 
return value of the i2c_smbus_write_word_data() instead of the actual 	
register value. Tested with i2c-stub on a Raspberri Pi 3B.

Patch 2 converts dev_err() to dev_err_probe() in the probe path.


Aldo Conte (2):
  iio: light: cm3323: fix reg_conf not being initialized correctly
  iio: light: cm3323: use dev_err_probe() in probe path

 drivers/iio/light/cm3323.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

-- 
2.53.0

