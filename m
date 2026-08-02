Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB412D97B5
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 02:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785636402; cv=none; b=f9LigudqvxNGGjpf8zuAq77IPnml7a2+pCHMRORNmKh8NiCcIBhu9eeF9T3/fjO6UaiXcZq+HCQFSNGEgD6LjfkNMm1SeLPKuFfoNaI0Fp5lNl+4T6VeR/VfEkLp26UbVfZ/38v8CICwZSyeBVMJn5wBC/KMn5/plzu3Cs+a8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785636402; c=relaxed/simple;
	bh=iOdYjF6hv/ITTRfMDORl9pV86CmTWdrTCbN5iAE0ALE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dS1mRVdDldjE/g2TWxjnm8TZCxJBuePjXMJxKOAwbdAtq8tsYg7I+Z0lJ2OrNrnfiId/YNisKy0jwhkQeT1otqyqlX3ocHOmmNWnA/0MYODCIPoskcaMIPSZ8Jv7LxMxgVXCBDF/8vWG6wzw2wBg18ReQNjPPORjnQWdPVD75SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpG0PSlr; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpG0PSlr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2316487a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 01 Aug 2026 19:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785636398; x=1786241198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=roCtpFt3o6xF6qwGmxiPg8URQzw6aIcPH38NLNstqGE=;
        b=GpG0PSlr8NPYd4NM2jElSiRPu1hcWrUMXhCoDYTMTJ5CzNKE7S/QKJFTwII+UNr4oI
         GEB2F4SiYUERhKsG9iB036tV+oWUWBF2QOK9ZoI2ReGotbUB+WC7DWe1MMLLPry5vgC2
         vGQEPUDZ64SD3RcvyZx/4+wdQwttl5VeuTdUV3eZWgA7ciFDyNmcSz8GrmVuzcEgaNpc
         H+y+QvMoZ5KiDVQ2PzcuQqv6C9Ze5g+x6fEas5l9qE05/LrtV9RgvYCCJ8j1M6vuspw+
         pLMXp9LoDD5Ebdn6mqTAExjg0S0y2/Ynrrwr20WfIk6Cme/TZ6SBWacZvQo7lZ235CQv
         zx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785636398; x=1786241198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roCtpFt3o6xF6qwGmxiPg8URQzw6aIcPH38NLNstqGE=;
        b=E6cj/iTroMR/GZ/HsmX3KV47AQg9ujlJ01dFNq6RkCTfaxknx7ZmVchTKC6TnOTUh+
         SOTGyYs01S5fwSQWCL2MoCZWVvTyP/OKTUr8teEok4PDwMy08SApwYyd2j0oZeSH9ec4
         u4LKvuDeRloENC6EfMKiOWO5mUMMjp8Jbi2GdLTmW84PP95nsXB+lbaRhvzxuaxdRKAW
         fPPnZN8A73TDX439fYDJNv9KRUqEDeog2FjLM8+w2eX9u5vQFX2beaSHTCYfszd12vQa
         m9uKxh3gV9RttBWjSjesOqD0NQBlonnMKnYgr/50gM9OuCB544tQ4TXq4LtY0Yw29XsK
         QQgA==
X-Gm-Message-State: AOJu0YwmzgG6aBqHDriv0aPcReTEl4nT32o6U+NJ8NURtRqoAt+skQQz
	JcQGqo+upqY+6owALwtx/y41qbnml7EwzagxF+KutKQ6yhkumzG6okTK
X-Gm-Gg: AR+sD11GNJMnchuHLju3iBEkzCtFmPRV6MX7nMa5hS2RyjvgYXiPIQg/EawZtP3wFyk
	XfeCblFcSLqmiNWTP1wai54pf1Rdw9vbcfMi6dzr+MKuAfTl8SRYdGDu1mpb0kQrHck84d7WlIj
	bxGagJcdSvywYZYmWvLwOJ3Pu01AUTX3Uv4AEM2ZcJCLW8vpe7NzwmVv7FcOttouwXH3eQlK2jZ
	ZbmH72JggNxqfIyjMAZg4wKgKM96bcfp08/NjiO62MT87GlP1zD5gPe3DO7q94Sxs+X0q1lu26P
	kLHyf1941zamzweKZSJsqAp4A3LosdmKMB6ngCn0cUvSCJKs83Z3hKeKJBTQmy6b5fsg6jxU5Ol
	eZoE2+IBqzrA94BY5gnG946vQ9U08v1/OcZfZgCP1Xgg8/YPiNNS+wsxR2jeJ2OBieOBuLU/gJ8
	4C4hVCops6vFQboQ1qLDnVogrzNbZFWR2tFT8bugioP2KUo35r1unoGdc1seDPTR/SrOn+bF5jX
	UJMsrbq8tOIOze5ADxY7K/2fABebUzo27IV/lUF/RecHQ7cI2ilbDgKvmYr3g==
X-Received: by 2002:a05:6a21:6487:b0:3c4:2c02:eabf with SMTP id adf61e73a8af0-3c92a9021e2mr5223879637.60.1785636398225;
        Sat, 01 Aug 2026 19:06:38 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm32231795eec.4.2026.08.01.19.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:06:37 -0700 (PDT)
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
Subject: [PATCH] iio: humidity: hts221: Fix checkpatch blank line warning
Date: Sun,  2 Aug 2026 10:06:13 +0800
Message-ID: <20260802020614.19732-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch warning:

WARNING: Missing a blank line after declarations
+	struct hts221_hw *hw = iio_priv(iio_dev);

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

