Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D7E34B43F
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 11:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141207; cv=none; b=Zx+4pWb6U7VmcYdMa/XbS9pCzHUNax1Ryb8SoPCqepurUREKYc6t72Nt/lnYcyy9NpStFxaiT+yFUq1VfCHDAOtpXY4woEoAoi0DbY9Ge1MFglXybpblI1Mox4cZDGsvGN43NIHuvoiZxbzpsKCC6tA+Conmaq3ld4bgDSkfUEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141207; c=relaxed/simple;
	bh=K9N7M1ZjN3z1WJxYykFBbNi+6CneAf8c60wxc0WHulg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d5JqAQF+n+Ho9vKpRlhgJgDSkYrTkkoMkvFIZ4pfZpLcLgr9KsdK1bcIZMr+Debs8i59yTx5EMljiLwYdcZFIDquj4AQfz+u3B8dcuuzyPNBJIx4pjWy+obwfw1Hgdim/qcSYhaSpcjD19FMM+1S9wbkUGfnVi8ruQyvvbWWAGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LV6Gp9bT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LV6Gp9bT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-842264dde84so269156b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 04:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780141206; x=1780746006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=luqBjoqoF3Z7JDzd6A8AeZTGf17c0e9ADpiWAI4vL/k=;
        b=LV6Gp9bTGO8J+bIGGEN7ivKCulZoSANliLAdfQRT1kLims2PfHBTq4hLk4IhXAayrQ
         xybeziLzfglyRJS9efwLTCYVrB8O66rAol0Dr5wEjKg3XIBAjpBwz4uWhGsV1DKM7UIh
         WECcqgNhALpn7OUJv5eUNTV3m2wnRgABgxBlBbcSPcvoPHU8z4vl3MYPO+rvZE0d9Sb8
         AdHIgA3kGvrJFC/cxRzJN37vumLefvjItM7Qek9mPEOiBHcWHj4H2MQKSFWSm2xfaYlv
         IwfmOlBJfi9sRYenRrdB3QIsYnH/dy2c3ajhyHiBB59Oxoq3bu5w5XSPyCqHlQpgg754
         wt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780141206; x=1780746006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luqBjoqoF3Z7JDzd6A8AeZTGf17c0e9ADpiWAI4vL/k=;
        b=g4GKseMoE/KjubZU/1YqTmCmx8ijH4vU5BPa7pb5myBum5BlKsT9DwuQIA/mEHKNCt
         CAfIg5/Mp4kk3/Lk0byfuNQysibFHlRCV34aIg27pwGuHdrTgthAE7L3CyasBmDaJ4yJ
         /ktYi/cYpacjwO8m3MuUTeKhlCT5JDhliagxe8dKoevAFsyKDooJ9XoAAVjjHrd+oXcY
         QzdqVE5cunB8HstMWSLpverHW/SihEePUNLGGjJf7M82AU+V9rVvoTA0oBAt+yienFVa
         SL/Gqq6fCfnryTxD0FTnVpr2bKC1j+RcSJ37ekzbM/FsM/cdrL/7/OU3/evFdueinZ0A
         NJ9g==
X-Forwarded-Encrypted: i=1; AFNElJ/PsSxBVpOvW5/2UfNh2BPUuiw2NO8LkRt8ALPW2atrpvsskjvFkvrRYkrIetJ4HfughSZaK0h1XnqZG3r+Gj92VrVsiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3+J5527OSeaY0AUemmuK1MOMiXt+2GZZvbmWpeBxQguOVMYXJ
	qdfqGNGF2629d/FDi0TvZnPolUTXdkfTEHUTDZ0fMBw6CjDhhGbj9bYj
X-Gm-Gg: Acq92OEwg5ULBNAKfZcOGgmpiJ0SRuG9Kw3os7Y7e0KOwi4AXuZTDfElixuiHXz5vZ7
	sfe05dXNVspqNedyvRYCHKirrHgC2q3DU8T0xE4lKiRxMBz7lmYVRQe1VnaFlKBeulJ7OqgA5sb
	VWcVPYBsDcQIP0I0ucBrXFLTRtcx5a15iMnrMbE74xt807YZOCDLYhjPETIKvqj3v+QyOf3d39T
	R9TrnjCvajvabankIy4kq2LKS9oK9FyHmRTw1Vdh9cF5vYVOrHcZMMGPKKXZF3yUiKa0WcgDdH4
	NJ2+Usmm3PsgYd+CBAA1QyoyIZfIA/dpU8ovzYedWF13v+65Z+Y9iKnJ5z4qhwM5k1cC5TRjnqj
	ux1aehif9rEZx4xbOcViyR00ZCIb44DUjq2YMRK9Ju5Imrtt2EE22nOecyPPVwZd2wq3w/7nRGJ
	jOrs+1bXKrEpno8qnqF7hMiZmX65iSWZR0cUnDhar/wPnPMhEp+mWDMi9Kgw==
X-Received: by 2002:a05:6a00:909a:b0:82f:1f43:7190 with SMTP id d2e1a72fcca58-84210934847mr5368824b3a.3.1780141205793;
        Sat, 30 May 2026 04:40:05 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm5467518b3a.26.2026.05.30.04.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 04:40:05 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	apokusinski01@gmail.com,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH 0/4] iio: pressure: mpl3115: add hardware FIFO support
Date: Sat, 30 May 2026 20:39:34 +0900
Message-ID: <20260530113938.171540-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MPL3115A2 pressure/temperature sensor provides a 32-sample
hardware FIFO with watermark interrupt support. This series adds
FIFO support, enabling buffered data acquisition with reduced
interrupt and CPU overheads.

1/4 - Convert to devm-managed resource allocation
2/4 - Clean up interrupt handling and locking
3/4 - Generalize interrupt pin routing
4/4 - Add hardware FIFO support

Tested on Raspberry Pi 4 Model B with an MPL3115A2 breakout board
(I2C1, INT1 on GPIO17, falling edge)
- FIFO circular mode operation
- Watermark interrupt generation
- Buffered pressure/temperature data acquisition
- Buffer enable/disable cycling
- Oneshot reads after FIFO operation

This work builds on the DRDY interrupt, triggered buffer,
sampling frequency, and threshold event support previously
added by Antoni Pokusinski.

SeungJu Cheon (4):
  iio: pressure: mpl3115: convert probe to fully devm managed
  iio: pressure: mpl3115: clean up interrupt handling and locking
  iio: pressure: mpl3115: generalize interrupt pin routing
  iio: pressure: mpl3115: add hardware FIFO support

 drivers/iio/pressure/mpl3115.c | 421 ++++++++++++++++++++++++++-------
 1 file changed, 332 insertions(+), 89 deletions(-)

-- 
2.52.0

