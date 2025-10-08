Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFDA29D294
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Oct 2025 03:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759893483; cv=none; b=EcvFauTVl0ci94a2Cvq+HhVRm2iOXQnyvfws38+kq0Vav6lcDFIJTYPugpJ9CQnmayAare7mtoiHfO8KsVLe6ikADdY7cB3KF0eESMOmZwpC3Ar35TM6ybLXuLsCLvy1+R2HyUfZsXQ6UFgqUQEnAPcSZ8VGsCTL11gjXn+MLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759893483; c=relaxed/simple;
	bh=fIWRrEbesPeIWiQ6eMVMhIFPJ5Vl3n8thvPxlDqtswg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TeNfVvNBmCcsM3QQJHAkS53tXOHso4ZndFjR4HupfJJykUYGjU9Orn5OZVd3bVIs2ItNVo0B0HuIiRkpqQWjgbpMCskVcOfN8ICOnXw1WMeHmACnkdNo54WX6OKWq6CQOz0cTaaAR/jwLLDBjQygKkTXpf1N0PhhfGkjtV+aDL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ww142fP6; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ww142fP6"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-3324523dfb2so6217564a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 20:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759893481; x=1760498281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUBWpVB64KIAGGN3DNkFK9HbyeXvjuC9xFABF4qCWPQ=;
        b=Ww142fP6fhxI+RCAFRVBgsn0PUXtzqEA9N6cYeaeZk38BCTnekUFE2opOVYciSKmHu
         YoOs7h2QzqipvuQ9wszbBAfvpZwzteuGm5SmTS8TyCsSw+FjmtT4QlPSQYRVUCK2Flfj
         UjSSBwvYC0CLQctaFFNi4py/3tbMvFwvE+4Y454CJU8uY6vnLsBy5q+EsLR/MOVLuoeT
         NC4KJoo8pQ5YcPpfutaO0tF2wFUTeSMJDN7O8mHAsfJsdB7hNnWcv9PhDbZSFvl7Joui
         BNkKANSIxgeaODFhKhXH8CJ+4Yepk94ujVdmJqV1XV4KYMPnJwCXrQ2MTDZ+ZXfuVgQg
         pAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759893481; x=1760498281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUBWpVB64KIAGGN3DNkFK9HbyeXvjuC9xFABF4qCWPQ=;
        b=Qovj6oOXvxxUU8Zg2clrjmEBcp9P+9tKwzH+m/2U161qHy+Tjo2TyDcyEuvL1OGFwB
         9QhadWyTM3fcFhWcEj9ms4DANR+YD/kNSPKnUxFcN+FQdjACBDEr81KM7TiFX+W6TaFp
         Fdb8lvUbwMmyL5pXzkqR2YObC1nLgcWDnAk929yPcPlxMAC9OXNciQF6PekHyUg71Eao
         ZdKRMaznolzJryAuSn4qyQH2hqama7iPh4nroAL1gCHZVR626VzjGa+HMiyPgYyrfEp7
         TW+iTj0y62fxLrNBqB8gT68xaFtL4ypaF5aE10O6TBeACW0hHccWNHe9Pl9BKgOaYDsD
         g7HA==
X-Forwarded-Encrypted: i=1; AJvYcCXhbd1jq+alWTmCr63NYzGuOD/54Ja77vi6wxkD0RLhQoiQ+KU5x7TM7kwjBx4XzYRQgmdKnEMot5VKGcvH54S93ihrUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAZa7hiVWvH+Ejeb5PFOlACwEtjmZFMIhC1957PAXW6fKiAPuE
	/+ClwLE8022wvAAa0gfVdsrAac59uGbOCwLzTFbOKzytpYSX/SejXHwI
X-Gm-Gg: ASbGnctPKBkzAR4bGQQwqhCn4SGfcIUd/1Ng2D/Pa0I01O30XWT3QCu+l3Ksd5O798f
	CW8v3iuE5MAucHMZEyMSkrJtDFf84t2OYvrGSJcjOsMCiz7r+Z+ureOq6nus6EjuP6RCmO2NLhL
	kKtkQcfmTudDv3D4XYEib7dz4DClKS/iUPBnqMbQM5jVtg96zR3MZXKL84RGv3hlkO4LnsyEbMn
	RBEeRpOYH4ijIAs4FMUMYKXauTN4aN09xZ/kjT/1gkGit9SHtefEvEe5GEY2/VJx72wWynVszU6
	rU+IVk+8gdn8ACBux2ITCoTgbLwv2mhv/DxGx4i1Juc55YbSHMjeT8vCKv2P61p8lQ5ZfgAW2kW
	4K4TI6dSbkUKicKAnKrIFqAwDRKcj+wo/zRROJ5BfWCALvmIFrQ==
X-Google-Smtp-Source: AGHT+IFbdt9o4+B6JZ8AWtV8URWuFR7skbc+7Fl9EFjuHuykYyJ4lLgk47E5Wl6/dwG7ikfSKtGBqA==
X-Received: by 2002:a17:90b:1c81:b0:330:7a11:f111 with SMTP id 98e67ed59e1d1-33b513be2c9mr2208816a91.35.1759893480753;
        Tue, 07 Oct 2025 20:18:00 -0700 (PDT)
Received: from Ubuntu24.. ([103.187.64.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f5990csm16527746a12.38.2025.10.07.20.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 20:18:00 -0700 (PDT)
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
Subject: [PATCH v2 0/2] iio: health: max30100: Add DT pulse-width support
Date: Wed,  8 Oct 2025 08:47:35 +0530
Message-ID: <20251008031737.7321-1-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for configuring the LED pulse width of the
MAX30100 sensor via a device tree property.

v2 changes:
dt-bindings: iio: max30100: Add pulse-width property:
  Add unit suffix (-microseconds)
  Drop redundant description
iio: health: max30100: Add pulse-width configuration via DT:
  Improve default handling
  Used FIELD_PREP() for pulse width
  Use dev_err_probe() for error reporting
  Fix signedness issue

Tested on: Raspberry Pi 3B + MAX30100 breakout

Shrikant Raskar (2):
  dt-bindings: iio: max30100: Add pulse-width property
  iio: health: max30100: Add pulse-width configuration via DT

 .../bindings/iio/health/maxim,max30100.yaml   |  6 ++++
 drivers/iio/health/max30100.c                 | 35 +++++++++++++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)

-- 
2.43.0

