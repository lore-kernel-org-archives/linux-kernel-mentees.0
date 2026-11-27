Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804005;
	b=EzcnMHJBAyAH4lyXvtE13A72wgtZH+hvLUyNBEBmISiGJ/nQIAr2TAPBDiXQdnClUnMe
	 TJrp5F9hjTNHcsMYAT4JudF3lCY0qwV/c8zAof3WrMy6im1g68JN+671yAgcGF08AP2Je
	 Bpw23kuQKGb5SY77pR44IiSoDvJcptgwQZP2Hoe2ZNcBEiA2owcsLo1ghPpyHI9Ox1HUd
	 QgnO8GeDA2uBiS3QSSS/YSX/s/b9LoswmP9SxMmo7zOrffUb1rMkLkkLFwdnExP1WeqzI
	 mGolJERPJrBFwuG1rPw3Cj6uoShxRIxJo0ZuyaXVi8ScdFMgZzCUEwhHR68QuTYwTHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eOXYjnqWWVMXkspdzQNEoKVv+Aym7CHLpb3HIl0SgT4=;
	b=xM5Iec4rqTlC1pX7Ju6TSxsueIhJcwizvkxgR01O6Rp1eqa1NrLnbZJp9HWRiloCbapp
	 3/Nei2DsfyZisOWMukSvFLttYo5cz5ciYy0wDmK8ld3L2lR21cGQMbVuLgCTYv1YUTdqT
	 1mcwuj47ePFRCupU7MHdkC48ZzaHR39NyTBZSIhpZ3PS+jGocFK0qgUVr3dh1POpW4D1n
	 C0WOuFYx7f9yjC13c+8ltHNzP2y4XjEF4++P/dX9J4VH2b0HebP7jBIeF3ctrRJePNQkt
	 T4GD6SDt//BTi8X5LmeKqjkjA8AIFuvWlKc8hyrXJWSFwYR97pgEczp1FTBvRv1DTSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHmz+NFC;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3015606A33A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 18:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3015606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHmz+NFC
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91f0274f88cso109088966d6.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 10:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804003; x=1796408803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOXYjnqWWVMXkspdzQNEoKVv+Aym7CHLpb3HIl0SgT4=;
        b=KHmz+NFCYO84BtfR0dxgVqcb6NzDmu5qTtFcfJvXG+gSzFQCQW/4BGr5oBUEbRf3Qg
         xJCf9Ct4Ooh8iq3waO688bi6mqpDvr6IUQ4fQ2GQDUs6L8VMBPH9+A0UlLsmmj+V37Am
         /fA/AifPBdJjgxPzOuRsBd7BM7gBoe/v24RbY5rX76Rg6+K/wmqPnWaM79BbKuUP1SZm
         x6r1sdW9q+A7w+gHCUVdVSKgEc7Be+gjii1dyBcjhwRREdBzWUeDBKW+Z1C5Z4VXpuIH
         BlSwE/swrKxnR5RZ0BPpweZ0pLLm7gOQLsjw3TsKcuP/E89Ukpw7stMePVuZqWveNMTG
         bi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804003; x=1796408803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eOXYjnqWWVMXkspdzQNEoKVv+Aym7CHLpb3HIl0SgT4=;
        b=G8kjHo2tm3ELpkW+35NE0hAhxtngLWrARp+2NSjV1SXSG9AlvXnL4ktzIObM1c8voW
         OC6NKyODsc0644wMN5u+FoOV+tCe5dOg3WlA5vvjyW4KhVlmVoGUWBbJfKs6g5E0qsu3
         DWSM4iSf6jRtaRL1K/gUAVWXZ0Uu2I7VvqfXUl1Xn5rEDWUjjzFgUqEEwTnZY9mfPFj+
         N9fEdEnNnC7chlYzdJqElF/k2mimxhphMost24n8fZ5zPbd47o43NuvFdzGRjC7y12vL
         l62ka73+pMwAxaqsH4NTrsYyurVvN9c6jw0Oc5wtK1fnL9bT88drY0Isk1y6fUTHyR27
         heig==
X-Forwarded-Encrypted: i=1; AL+hErFB3/dnvtUef+gF+ZhxHqTAWue4eDUkD6+xZI77dR3bk+kVlXo1bwiEYi1US7NW37pr0cRxuNJwyaKLG9h3gqnYaJN5Dw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8C1DcsKOcEICRJx+UEY4nXUuUhK14VNyxEqTo1IZLV9E8mvqoj
	vIiN99sRfVYhOPw/0/JdJfMZ5zQaPEsLkFRhM8lmIl3JSR2uO2IZ831R
X-Gm-Gg: AZFdTZcnP+IlkQhnd4svLSQxbgm5015VaMisZEYFq28zcuaFFLQxjOHPC6zWnGd2vWr
	QIDuRKk8SR76AeIK2/p/mW+mC/pURW8kCq0UwrHShih7pp//6Eem9f0AybYOthdewTAd3lR4pxg
	gsCJw4WUCvtX5y9JefFOy1lOfNKpPTAIWlT/NLH0hkaQ6piw1/2CHBhSR4Ti8wQu4knHmHBfWVx
	tZPiwJOai1K57D4IFyv7ERSnE2+GyYs8dZTsHuUfwocKE/7E2YOzI6YMk5bfTr0jq4wEpG8R66M
	P94Mx4ItAB2TIVkJGpX55HzRmm91Uu+42pH2cBh9TCsBv5kkJ7fhzEE2cvqYYHWsN+EEt9buuSP
	cJsXLn9T7iVEjL4QU/DpELJqJ5Si2eLCsZIrHI0fl5WoEHjiDh34uie55NLICX+ARNBX664+R1g
	HDgNkP+jZY3es4ERcP29ebW5/K+g36KOrj5B6sHEM5Il7W4d5i1IFr4oYGX+V1PHFMVTBsm/1wo
	80EsbVaNTDZ4OKvXBH7gRjaSPGAf9Dkuw88gNymn2iwJkNd3PQkghnxoSjyUNA3Cmv/y1S9X2EQ
	DjmtZAVdR4ikGow48i9tCdKePRYTWWANeJ4=
X-Received: by 2002:a05:6214:4686:b0:921:1ac1:34e2 with SMTP id 6a1803df08f44-921653a9042mr253658056d6.24.1795804003603;
        Fri, 27 Nov 2026 10:26:43 -0800 (PST)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213514d20esm222777366d6.23.2026.11.27.10.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:26:43 -0800 (PST)
From: Marco Chen <marcochen.dev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	pmeerw@pmeerw.net,
	matt@ranostay.sg,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 2/2] iio: health: max30102: propagate I2C read errors
Date: Fri, 27 Nov 2026 13:26:36 -0500
Message-ID: <20261127182636.83803-3-marcochen.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127182636.83803-1-marcochen.dev@gmail.com>
References: <20261127182636.83803-1-marcochen.dev@gmail.com>
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

max30102_read_measurement() returns -EINVAL for every failed I2C read,
discarding the error code returned by i2c_smbus_read_i2c_block_data().

Return that error code instead. While at it, move the existing length
check above the copy as well, so both checks happen before the data is
used. The only caller, max30102_interrupt_handler(), stops reading on
any error, so behavior seen by userspace is unchanged.

Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
---
The I2C error path was found by inspection, but was not actually tested
on hardware.

Additionally, checkpatch.pl --strict reports "foo * bar" for the 
multiplication in the length check, but I think this is a false positive.
Not sure how to handle it though.
Thank you.

 drivers/iio/health/max30102.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index a553c0e011e0..829e8b18512d 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -264,6 +264,11 @@ static int max30102_read_measurement(struct max30102_data *data,
 					    measurements *
 					    MAX30102_REG_FIFO_DATA_BYTES,
 					    buffer);
+	if (ret < 0)
+		return ret;
+
+	if (ret != measurements * MAX30102_REG_FIFO_DATA_BYTES)
+		return -EINVAL;
 
 	switch (measurements) {
 	case 3:
@@ -279,8 +284,7 @@ static int max30102_read_measurement(struct max30102_data *data,
 		return -EINVAL;
 	}
 
-	return (ret == measurements * MAX30102_REG_FIFO_DATA_BYTES) ?
-	       0 : -EINVAL;
+	return 0;
 }
 
 static irqreturn_t max30102_interrupt_handler(int irq, void *private)
-- 
2.56.1

