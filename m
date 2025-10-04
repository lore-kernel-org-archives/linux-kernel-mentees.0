Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F4D217723
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Oct 2025 01:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759542997; cv=none; b=UeCSiuiVPgLOqxY+zFvmcFXUgo7OM0LE5bpifgyMAvI51AQv+s8XNGstFgTp3jvdWEaqrhIHwqAwbQLL5NuzDGek7u1U2xs8z+la9CC7EHc33gdSLfCbivXTasg0hL6Ibu+lqC4LYCRubYbQj0dlalSeQRZ9Gy+EB2S2+Pr/gDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759542997; c=relaxed/simple;
	bh=hORoEnA4rNo9eZ2TnSKm6bO35jEMPOOzljSvUmmDcv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IYzHL1DnWN+9IyNDRwohoIeksaofjEG5T5Yyszit43ea1nyaDfIKBoD6mLcn0T52yL25ESspBsIeOTbhuNsQpkJfs0ZZTzqtBTfjnnvLYMf3TmjHwAe3awIbFEa7Io6XUsuiRpWHbfihjT7cEhkg5zqTbcC1EgQgE1ax4MQLBqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4wJkwVE; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4wJkwVE"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-26a0a694ea8so23207095ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 18:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759542996; x=1760147796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yTEqLH7hif0P56GR/htRgCIrTJyGDU/Of++XnbDqejk=;
        b=D4wJkwVEpjdIx6HEnvfqi9FVMpNYFOjJgDVu+mjQSOFS107ZQ2+q/ulzvKi/z4spDk
         wN68I5yb7ls6LN0fuvSZD8sxaZ4+9DOiosDo5MCmsz20oxuQnkMz0neTUP8iuamd8DX3
         cmGntAOlkoH0JoV845bNOoVeVXqMsXoQSE3rO5z9z+tBJWtUOy4dHZPDQ+H8g1JiXxpv
         Vea8JNx08e3B8HCf09mN27xaRXaPrzRD/6p6SNVCn5FxlbjL0tm082u6NTbvlOhk+Ujt
         KoBnBvHxRSIjmoPZ9mNllW9v1lPotlAtmuWR8qrNol2zqzi6oXEERzJBvtzwQFc7Y0vq
         1aOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759542996; x=1760147796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTEqLH7hif0P56GR/htRgCIrTJyGDU/Of++XnbDqejk=;
        b=alt7PCuZkFlj3WeH1uRI4ll08DUO1C6HaPec07XYmhGOr75sJF+PdDSmhngzfsXjzL
         HSPLV6xbyXQ0lq0eSuEE0ZFyyYIIrsGms68oSBapO9R0I15RME+t9HoIeapmI/Fk/z9Q
         DvsR4vLfzjX1jLiol01avYfyWF37M5u+PAowBwAVhPso/WaRquu0mCYGSj/n9NbtL0Sb
         XEsHAa6YCtgEgLmhbCv2A/fA4Yt0JlRBBBkFJo4//C3dNVAURxTpjghRtKVr96o7QB4e
         DbOLFpxzAgYSh8cBi9KVDFS4CXQEu1ZEePiiIU2MhBFiTRcLiWaTScBu2beiQdDHGFqv
         cl9w==
X-Forwarded-Encrypted: i=1; AJvYcCVMv/TP55ZTGOUsATB0wdqcUsp+QtUhgsVDheLoOXkAz/ufg53JUEgmipmet75khNU5OHuzA/mLo6hP30XcB/+ndU6U6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYAQ1FZNSe1uNOnppoX4FT6lVzHY9hAlGKvgNT5UarfyWg7/+D
	+5vom+xi7scx+NE33xtLy5ZbJOeBJ9/6801ThsZ2we+GrM1neUVwuJ65
X-Gm-Gg: ASbGncs5gKDG/atOv5pF/B1gTQZHZ+eW+LU5ZcTCkIrmMmki9ql2l/GI2rlwU5ntg4Q
	DOik/xelVv2eF9YOz+Nr2ImC2owlld7/V2RRmfGGTU41QP4RT+f+xKu3rBJD7rvzbCJesGXbGxI
	izZAJIMbJ1LH5mUqKjp3yJZbQR/vRxXrWdK12TMV6Ifnn6jGySdLcAwmKUQ6iFp/8/hchBrYwiG
	cr9OYhQL9xm1BXiUD4KzRNXdLQPaV0WC7IgY1wq/aZT6ckLM8IElrRTVq/Mtjh92CzJDjkjLV7Z
	l1AD7GTu4KCCRQzEEMFBuI6nxqShE4QZLnMJIXDiI8hWTyicQO3k3Adh0S62KwXjGOQw9TZkyWF
	HDDOCQqom94T39kUIoNnmz+rK7t4dWHbCTrY27EJk776Ok8PdaccI5aM=
X-Google-Smtp-Source: AGHT+IFNiL0NAmoLijKiqKFOV1i/A4WOPLrh/tgGYP4tBcXBAwrLn0RbO3aVkg2rfnZrEJWChZJVIA==
X-Received: by 2002:a17:903:a86:b0:248:fc2d:3a21 with SMTP id d9443c01a7336-28e9a5cdd22mr51596345ad.4.1759542995628;
        Fri, 03 Oct 2025 18:56:35 -0700 (PDT)
Received: from Ubuntu24.. ([157.33.197.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d134859sm63197485ad.57.2025.10.03.18.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 18:56:35 -0700 (PDT)
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
Subject: [PATCH 0/2] iio: health: max30100: Add DT pulse-width support
Date: Sat,  4 Oct 2025 07:26:21 +0530
Message-ID: <20251004015623.7019-1-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree and driver support for configuring the MAX30100
pulse width, addressing a long-standing TODO in the driver.

Tested on Raspberry Pi 3B with MAX30100 breakout module.

Shrikant Raskar (2):
  dt-bindings: iio: max30100: Add pulse-width property
  iio: health: max30100: Add pulse-width configuration via DT

 .../bindings/iio/health/maxim,max30100.yaml   |  6 +++
 drivers/iio/health/max30100.c                 | 39 ++++++++++++++++++-
 2 files changed, 43 insertions(+), 2 deletions(-)

-- 
2.43.0

