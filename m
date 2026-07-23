Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F9B35F193
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823114; cv=none; b=OYa0lfo5BozN2JTTFKTjD6yigLbm5oTD21LoKvcYGNioW0sdXrzopRFoSVgu7DW3YzW909drVmllhGVjQ91dD+9wp9+tpmuaiL9aTbDFrbUT1nVkXxG08cssm8vsxP/23AH0viBQ/fXKrZHn0hFfZZTWr8s1mYZ2NkTXmG5agcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823114; c=relaxed/simple;
	bh=YvHRvVSLzzqqzkfqQCcnLbqcQacT4HKjmF9ufos0CJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pVcQUoOEYDSfvFJggh+U0crA3TWvyYZZkLyZNJM+rqvb9XOMt+3UBMrS83OUfYA9vRgt8r8srS+lWzUK5j3Z755QvMJHGzhhyo0Go+9AwV0UPnD5ynGFux2fJAgOoE3zCH2hB87HxRjJvriLLQLWPZoWgVFYqt0fAIzs2zRN2Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6HVU+Zw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6HVU+Zw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cad8076b01so11082025ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823112; x=1785427912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZ9g9dFCni59wwbH19gzslxq3IGq2T1h0tJXe1RGXic=;
        b=O6HVU+ZwE7Gi9i/W54pPqr5nnoXtWtgjE+Lulc2Y+mRn1BT+J0orKbAdk1X+E00heW
         yg56IGFvoj3cSD/8UiT4bjpWmKyPPAJLyot5/BZTd6ZYtzdgqsljDZSj2+w62KH3NFtt
         jarhvRZ3eJjBCa9Adp6u6ijmnPP19tRpMqBfAjWYgNWOYZRGUCOX2nyvxiZIdEKeQCGc
         isNLYEQxeXcht7d6Ow47WEt+gZ8+8EqdeQV5fsn96CddzcjUD+xqTyOWTD4hYfQHgcL8
         nwLzVG/juTxwphXkZaVECZdbH8/V7RKhyAAnx9wgSt8AFD0lqu51B6Bp4eBW86DLG2eI
         nRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823112; x=1785427912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZ9g9dFCni59wwbH19gzslxq3IGq2T1h0tJXe1RGXic=;
        b=rnOahQxPPnMQvlOlm9cTIxKwkrCNLBBk3qxme6N+OH0gqsWM2s98JDbnt7k5fMUrdJ
         DqbIcRjvnN6vmqrYogzwX5+dVlhGDt9t2dFS4Wjx65CfLUMkYdcYMOWQMXucXFDKpgLi
         huuVAPd8k78wm+51clUxqqpPBtCLIHB7YgA+bNqQ5VOKMkG+4xYECVvOBWk8sjl1wJbn
         dIShUiXlSdqarNHRV6d0PqiabIrX8w7IaKHV031cRewz/+G4rZvRhukuIR4QH9aKbWcn
         nn9Y57OAvH7r9BJYCOAt3bBKnfb6GFxu9/WV6CAbYFeA406oIQmQNT+5ZZFMYnLZ4mj9
         cT3g==
X-Gm-Message-State: AOJu0YxUjyfMlEEuJ43i4I/hW90FksEAHIQmO79jYQjuVuyDBMa6JhvG
	lkYJYbh4U7vDaFuxPfvql2WjCwfSKTOdzSAGVRxnbRJNThXX5fuxP+lsFAt+QtCed8s=
X-Gm-Gg: AR+sD10m82eElYovbcpKx7ggGagydp6DiD5psGH9e4+pf0Az5IF6R7CIwVRbjBhm5BQ
	eMD9etZyWwbOxJ0Y1W6pC6e80Xlxank7h/Ie9JvmBFiOuA+3lDbP7twSRPMM/QBIRRB+TVruHhu
	Z7xYL26MzVBF/V6adf2qdvgHn9t0fKM19ihzoivk1lAdltDonf7QUKF8qF5GyUkXy312wp7oek7
	Tmd2QPdjfenohUzHu9/RKua6qIZqA+HNab19sg6SgXRx+9wH44CN85iYK4NfxO+oJMA27TnD+Uo
	W9fhI/HgaOjSGtzmMyY6AYmrz8DcYL2b0nro+fACEkF23a7jihIObybfHj3SzRFOohoNcjjw3G0
	V+DnofOvo6+M5jP14ECuEKUUl+RA9pmJ5KowgbL3BuaLD8AZK8eqRqNLrJvdhbR6ex/tpbb5usI
	IK9Zr97AGKYRqlAyxgzTHwiLIM8tuJtQVtKTbT3jmjQ3S7+Bwe9EYT7067jOj6lBYexn1BJ4/Rd
	tg=
X-Received: by 2002:a17:902:fd8d:b0:2c9:97a7:3289 with SMTP id d9443c01a7336-2cfa752eae6mr44864035ad.43.1784823112099;
        Thu, 23 Jul 2026 09:11:52 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f362e00sm36303825ad.71.2026.07.23.09.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:11:51 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	mazziesaccount@gmail.com,
	adinata.softwareengineer@gmail.com,
	email@sirat.me,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] iio: chemical: cleanup codestyle warning
Date: Fri, 24 Jul 2026 00:10:38 +0800
Message-ID: <20260723161040.20318-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:
FILE: drivers/iio/chemical/ccs811.c

WARNING: Prefer __packed over __attribute__((__packed__))
+} __attribute__((__packed__));

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/chemical/ccs811.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/chemical/ccs811.c b/drivers/iio/chemical/ccs811.c
index ce7187ccd706..0e5c79b775a2 100644
--- a/drivers/iio/chemical/ccs811.c
+++ b/drivers/iio/chemical/ccs811.c
@@ -70,7 +70,7 @@ struct ccs811_reading {
 	u8 status;
 	u8 error;
 	__be16 raw_data;
-} __attribute__((__packed__));
+} __packed;
 
 struct ccs811_data {
 	struct i2c_client *client;
-- 
2.47.3

