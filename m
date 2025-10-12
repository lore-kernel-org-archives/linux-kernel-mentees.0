Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78CF2D3A6A
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760290253; cv=none; b=beDngpm/MfQuWXta6Ym6GyC8A9zjzXjwfJfRDbRGlwRsdvdrltaXT1g28FD0QXlS1v8V0dyiHT2vPSQ9TAbEO01Q62okP43u43CuFCxgN8vdV+n16vDBFetGws5deXjeoDBq4pUk/YbYJDs6xot7jxhXiPTOVpchi1Z0O+Rkloc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760290253; c=relaxed/simple;
	bh=gzP73eKDgJq0OXCIKtEvkLfNMbdAuUvkBODtFN2PhFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fe12t8HtgT16JBKtsjccYJTqWfa9OxwEVNip2DtVIDbZ5pY+T+qMq1y5iUZmS0FGOhjYWdXKW0WBDxgsvTYHL9FjQsOItJaQwEgIOwuDcsHS+jLlMQXHeRho8gYBpc1F68HfedKMVK5/doG/9TUVuX60IRFF7SIyxiviv+3eswM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fomIP4UX; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fomIP4UX"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so4468730a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760290251; x=1760895051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a66RlRrFvTTKMeb9fHGsG8vzY8MvLsI+lGOp/Fg2CSg=;
        b=fomIP4UXSoWUoqlq2NHBNVAyCf8MDlBmb6XGAcj6vrvZ4jqydWCCSFmUnjlctyIeuK
         UPRp9upgl2rwzY2eTXf/6U93MjKac7DYHibqJr7082etXFjmQCkTmuJp4eekMEAphnlJ
         84KDlzRfdeeNnSU59tIFiOY0iFWns8aly28IeKfPy0mz8trM2EATBM5weH2qN9JbJsei
         yDdp+Fddjg1Ky/EfSSCHpTqsM8kVzdJaw6HTUW7J3Yn51FgpRkCjTCkClrKWkwq/vn27
         3E4k2bExn11BnG0tL7hmGaEt+McmH5ADIZs60XSa0ubZM8zV878VCktPbYrtXd1UBH05
         yJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760290251; x=1760895051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a66RlRrFvTTKMeb9fHGsG8vzY8MvLsI+lGOp/Fg2CSg=;
        b=rir2Y61m+d8p/XLck3r8+Dq1C/xsvQSpLONZYL+L15AKZLaQx6UUIAVM25J1zEQ3wR
         EviPKxXrZIYrb6UvY6aBBC4aOgJJYV2fp4jReHguAlebwX9up9aFW2l2Hc5Gjn2pZFei
         j4ES83avD81zMHkWmIxyDe9xBBU9JF4g2KsEcew0IagkRpw6i4SR4uC8KvUecxLdWvfx
         wxUecLOW7OKRllmhdxHa6PjCu1BIrqJZ+eFYLUUNHHQ7x90jliB4p9tV1r+BnVVVm2NK
         NaHKkw7J6qxGtR+sEqi2TebcxEVnm56fL7LRQ/u/P2k7UsqAGTDh7TX/tEqpKnUbqmcA
         v34A==
X-Forwarded-Encrypted: i=1; AJvYcCVZeM1LSm2svuwWcjeeGLVxYWDnh1vpzRZmPLI0NIJ4cj3E2pgN4ITdrPLYKryP1E5r9WvRNWuQF+dVFeel/197Gz9pLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YztmC4rV7CIWDMCDofH7+uATkNi3OoX7AHxIZKPKEDfukKcWKb7
	C5oSeK5BeqRZ7WsS1ojF9t4BxH/xerCBzjRfsliEGFvPwocFbhkzsBIU
X-Gm-Gg: ASbGnctIn5zs6VOsUzgqsUj4BwbuyWtOrlEdSpdEUXDRsl/Hw3tASyfrJVrvCz+7p5S
	GUBAcmU/COm4c5hvhi8e4f7qW6qTgmgzIC5BOodzsAwIhdqWcHJVzvvQhHz/UJpaBODwR3BQAbn
	nvxdZLTkZBk6FPMVxfWO5CtTO61E0GexZ8bdusjWF15vXY79fN0FuDjwImfgq+UVOEXr+WeZx3M
	PNvhGYHzd4X69+P8GDLfk5Zg6m/oCWBMDFUmeQ6ak11ZTAehiRb1NwWIETGGYd5kw0D1ooHGZ8u
	Wi9AwqBPD+jcTp/or7rVJUiSN76yZOI+of5s8XTPjOGI3tAqxKggA36+uVikidMcHdYeko2wx8K
	jxb948Onno3PLQHOlMM0e6l23aLk7+fnYtgZ2dN4YBFdg
X-Google-Smtp-Source: AGHT+IFWBRH6VbicjAATB63VVFZLQLGTV6p9y+k3koTCoCdtyT6rF2oBp0hHGijhX3XmV73xokjn1w==
X-Received: by 2002:a17:90b:3d87:b0:32e:d011:ea1c with SMTP id 98e67ed59e1d1-33b51112272mr28805345a91.15.1760290250919;
        Sun, 12 Oct 2025 10:30:50 -0700 (PDT)
Received: from Ubuntu24.. ([103.187.64.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09ace5sm9030616b3a.53.2025.10.12.10.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 10:30:50 -0700 (PDT)
From: Shrikant Raskar <raskar.shree97@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	matt@ranostay.sg,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shrikant Raskar <raskar.shree97@gmail.com>
Subject: [PATCH v3 0/2] iio: health: max30100: Add DT LED pulse-width support
Date: Sun, 12 Oct 2025 23:00:33 +0530
Message-ID: <20251012173035.12536-1-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree support for configuring the LED pulse-width of the MAX30100
sensor, and updates the driver to read and apply this property. 

Testing:
- Verify DT property read successfully in probe().
- Verify default fallback to 1600 us when DT property is omitted.
- Confirm SPO2_CONFIG register programmed correctly using regmap_read().
- Validate different DT pulse-width values (200, 400, 800, 1600 us)
  are applied correctly.
- Validate probe() failure for invalid LED pulse-width
- Tested-on: Raspberry Pi 3B + MAX30100 breakout board

Changelog:
Changes from v2:
- Fix DT binding schema errors
- Add default value
- Remove changelog from commit message
- Add missing header file

Shrikant Raskar (2):
  dt-bindings: iio: health: max30100: Add LED pulse-width property
  iio: health: max30100: Make LED pulse-width configurable via DT

 .../bindings/iio/health/maxim,max30100.yaml   |  8 ++++
 drivers/iio/health/max30100.c                 | 38 +++++++++++++++++--
 2 files changed, 43 insertions(+), 3 deletions(-)


base-commit: 8bd9238e511d02831022ff0270865c54ccc482d6
-- 
2.43.0

