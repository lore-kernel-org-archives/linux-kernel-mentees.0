Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE3548CD7C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 15:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635114; cv=none; b=eAuPsekgoT8A22dVA90fqgN31GIjm6+zz65JE5D18Qf5cIqGBWKpa0IPMEGS5LT3gVAbl538nf3ijd2xLar94lLYUOQUdsi70PrGqK9f5i0NEj4Q15MWiawOyQ7g9x2u6lHK7o5gTMLE/lWM1Gehkt7l2Rqr9K9Bu2pH74sda7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635114; c=relaxed/simple;
	bh=NX1mj7lWqmufaNh1/+yRMHowMT7G1KD8ApMLqE2vOgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCv1/9Wx903dY7W4aapvbsynOCqvYeOo9UlYfBm73BUw658kZl7ktMwWCfhb5u7IrAoLJL72TvZUdH3rmkzmaXKrb8fJ0u+t5Qg9CfrmjoL79yEP7N1fM3IcZpQu7+Y4b9S4t1sJuhtP/zZRwBkrtN0sJxGwzgvmavLv+Og5ZnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zbs4zxLm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zbs4zxLm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc97653887so1081155ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635112; x=1787239912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLBFetwFpohNSM2IPfXMfUKp4/p+7rRpSzLCPfNU/RA=;
        b=Zbs4zxLmZ79ZEr3Gfo4oQ2nl+T4Top7YP3nbIZnuzNd8VT6XrJxeUvGg3zSzQaQARC
         D8P71mSC9oXUsMyirUuMCu/PKj+Aoc8QrxvmKoUR1G3BBI+tcmpPKAgZJPNOaLTXzktL
         26FQ958WVvXQzDDPjDoJDAx7PqgN+RUXOwa1uaVK1F8XoZJEdesNbOkGatUaEUC+brfo
         JCADyq0JCCkh038abahHweFzO99Wj2FNam2qP1pKLFRseIxsEzMnfzHs6mjfrGBl2640
         9WhPPxaFcXsr1gen2aaFkz7tNkPpMr2Cw30Tcdl6J2a0q+t0xPJ/65Y0ZtsYxnzuT7rC
         8jBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635112; x=1787239912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLBFetwFpohNSM2IPfXMfUKp4/p+7rRpSzLCPfNU/RA=;
        b=HSbuXjyjVWVMnOy4haRmXeROakm7wZ7lRGuP4A5UMJ6c2kAL3pdOhvV4KW5hB6CtAA
         MHtEiXpiMO77LXB6qE9KEUYsoMykWrxNiMLQUsFoZh72VXH3XxBuQURupm+QXBFAmDuh
         b7UWKn4akmViwTy8XsowISKUfk39fORDgCxl2+EbCQuYDShlNrsstzCgQ2u6TEJJoO5y
         qbsM9CmRSL//7vYN3ZxXHBAR2P1zHatEOa1lnjGJLuL0BV1H/MBX/6csDu1+qVz5FbW7
         oW7mKkRDoDh+/A5bpoEQZXgUR5aTmA4oKxNt1pg/AY66vPFTwaUASp2sX415wOLNcppm
         MGag==
X-Gm-Message-State: AOJu0YxYprDMU65Oa7uHxk5hkn7St7BVdTuRI4nI+aCV0DZZiRLsvqEx
	YPh76ShftJlj1knt+xhe2X212T1lM3KaKGOWQjDrqFabgXMS6x3gC2pS
X-Gm-Gg: AR+sD11NZlj5OxZdhJXb5YwMD5er01LghAMYYwdjtNYiMX1Uh5HRPAKO47dhxWI8BG5
	vW0BeODxlWct2sc9CQ5S6DGUk8Y23bMvPrvU3ZhsbVkJ4HzpV8+dw8C9PCvgIQBB/Qc0vgtRH0z
	Z9lEAtVyB0CxyIiLtq0ae04JYlxKzJ4kg4dDVyOGfKkIRIZ3/b3QluSJfBvypciW+v/ipeq2xFQ
	zMclSFJm076Tmvq3XiJmVFRI6m0VWDZw8x7NDxzxDv4HSu6C531Q9+JzuB7kb5emU2ds0bLyfpE
	lHLdUk/YehrjGyxyMY2ZrR/q9FIfIP497VL7UDm7DNeaJ7YipbV/OanbqGsZnKxzNKAt/v6lFrQ
	8GFgFe9tN81t1GGG5R2o5o79H6bqLSYKfWBcYOBBRL442sO6k2XdKiQx93k3IefgagpIiyRQBVA
	kVOKaMlpTRNMa52W6W63eA2bOtxdUHEVovYBkn6ppme9UXM1hGRqrm/Ix59cOAxA12iP5q1PY65
	E4S3mYP3XYQYBtVeOcl7FH/u+x/R/SaFvOmQIqhB6gCg0YZFb/yMZ+MZwZtcw==
X-Received: by 2002:a05:6a20:6f8a:b0:3c4:4272:b400 with SMTP id adf61e73a8af0-3cc5524204cmr10350676637.18.1786635111712;
        Thu, 13 Aug 2026 08:31:51 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec082943fsm7960604eec.29.2026.08.13.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:31:51 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: lorenzo@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Adi Nata <adinata.softwareengineer@gmail.com>
Subject: [PATCH v2 2/5] iio: humidity: hts221: Add a blank line after variable declarations
Date: Thu, 13 Aug 2026 23:31:26 +0800
Message-ID: <20260813153129.12423-3-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813153129.12423-1-adinata.softwareengineer@gmail.com>
References: <20260813153129.12423-1-adinata.softwareengineer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve code readability per checkpatch warning.

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hts221_buffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/humidity/hts221_buffer.c b/drivers/iio/humidity/hts221_buffer.c
index 4d03db19063e..c868549d09c0 100644
--- a/drivers/iio/humidity/hts221_buffer.c
+++ b/drivers/iio/humidity/hts221_buffer.c
@@ -194,6 +194,7 @@ static irqreturn_t hts221_buffer_handler_thread(int irq, void *p)
 int hts221_allocate_buffers(struct iio_dev *iio_dev)
 {
 	struct hts221_hw *hw = iio_priv(iio_dev);
+
 	return devm_iio_triggered_buffer_setup(hw->dev, iio_dev,
 					NULL, hts221_buffer_handler_thread,
 					&hts221_buffer_ops);
-- 
2.47.3

