Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C8E2D6E44
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 02:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785637777; cv=none; b=EaYb210QRdD8JCjjZjPv4RdNlpxnDEpE8CYUrnCB9SqGDZETWFFfal+/HwYxXYIof1tIKLTS7qx95e8fXpHrIGCfxMemyvgqLRU8PVIJajQMepKbPK7jmAy9+njIxwhUR5PlZjN8Oz/rwNIYNck3y7nHaIJSbWCyefpBRZImUqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785637777; c=relaxed/simple;
	bh=m0LO42+wSFkD3zvU+UTFyTbOs+ixM6ivuQ3oUBeH9Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdvN12MVTnPilAuxAYEGRBiqYejt0bbMT5LVLk1/C4UcC5aMOfF+HWhunVLlAYB2Imd0xS+RLI20Hg2J9hkl8sqc0PnjgRJBFUN5MzBf5JZQxJi8ze1j0o0VOtSNBVi5LRE4XNrlfAv2vWlD2xAc+QX5MWMfBcc5KlwuEU5kthc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciOkkUsM; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciOkkUsM"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so1716489a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 01 Aug 2026 19:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785637776; x=1786242576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OER6JPCaTkm5KRkSvzvVyVEwdjpOA0SgyH6QrFA8oUw=;
        b=ciOkkUsMgy2Pg+2AGjqnBLD2aISo+0TZ51i54VpYC4Gqe6b1M+nTKsnT5wo07Si7ct
         yU1v/Ul72IHB87foyrspKIQFmHZoTMFMkxGh/zQmkF4NEgX3C+1agTGXLyRegvkROrj+
         9HdbKtQ0R8J4NIFnunRb73EV9WhI4WxFZJHEFbufmJpVPcyUT7TxE79p0ug4QLNaysZO
         izHT1FyyFIGELnNA1y0o4wH/RagEk5FNdwIcFVodnlHTTf2ISlPaX2Ywffi/EEiijB1d
         jl3HtZmim3txDVMklFj7EsZNHYRLpNX/lgGC37H1+jP0/lR1SNl9W5zfYp+nqAzbe8HL
         si9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785637776; x=1786242576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OER6JPCaTkm5KRkSvzvVyVEwdjpOA0SgyH6QrFA8oUw=;
        b=C2yPLZatpNh0316DqJ2rYnKpfv2LPHt1NG5zdtb36Spgt6SIOx7EQ4AwhZDFAX/jjg
         3T8CGKM1iTUnYwAbZCQtCxd+N7fV37iczf958Y03Kz1A6apY2QkFCltOSvb0JLWttWrt
         NUpLUY3nWbBhN4jprBkZRVBr0wG0viotUjMehroy48WG7FrZlyGAXGb6XlAcFMwT7sIS
         NCAlnLHMqzfbhIx1Gp+k10IsvcGXDQjnqEShWITCrF7M2qKKAzIuqwPVsv42CfRAHepA
         vwHaWkp2cr/ovfN42Ilxnr6a0+WY1QjIJY+oXmcQRYZP4q+9J0ceaFPeKL9/NwhD27W9
         RAcA==
X-Gm-Message-State: AOJu0Yw5QeHWxbYczCvcyotLUM6Uy2EEsCpIkQKS6BNylps13kV/jJd1
	pAjAkINF/OPWme1MAtYmzwj2+66oNPJppy/7iPVbnPpc0372jPr6S4BK
X-Gm-Gg: AR+sD13MwicG17IkpG14Y9cnkcJGS2BbYvij+c3PK1wVsevmfIpHNcGRtb/bNIux5bu
	6q4p+UEKtSRc7YF5sBV3K9wRYqnqzdTFwoKdvZ7f2Yh0u+qt/oWGoGIQ2B00AGee9RBAKv0W703
	MvrBkq08mhQOMKhY0dJ+GQDtTZkefPEc+i6YVk4JY8RV7/9Qjg/VVUYN1rtZlVuEQm1WLYlTeR/
	xd0baJI9ZTojRRjZzv5TD23ng2hZib9xZskqG+vJwKMIPo74XmcIH05leyon35Ds81S9Np+y2px
	MOwWsgNIg0znstzto3AX4SFFmktpkgenSRxEdLdzrLB3E9HEkjcm6CZJA6XXdf00RpLSx+66nU9
	D8irXlnp0fZ8AkM9bjH0USOIXzue34U5XahqVrt5WK8UtfgN9N77A/uMpWODwSk1fHNwbWawphX
	mZ4N1VRvLVzUIXdO19FiRiwDyMBghEJo6TNEAyaIrTBLr5ZRS4t3eb05ku68kx2fDekWt2K8Ku4
	3QUK8zXTAZT8wLUq1bQZbTBVO+SQVckPvpkTcM5et9VyXvdl1yAl2m+7RDrMw==
X-Received: by 2002:a05:6300:189:b0:3c8:ead5:bf58 with SMTP id adf61e73a8af0-3c92a889565mr5350108637.51.1785637775787;
        Sat, 01 Aug 2026 19:29:35 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm17296155c88.2.2026.08.01.19.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:29:35 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: joshua.crofts1@gmail.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	u.kleine-koenig@baylibre.com,
	email@sirat.me,
	adinata.softwareengineer@gmail.com,
	mazziesaccount@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] iio: chemical: ccs811: cleanup checkpatch __packed warning
Date: Sun,  2 Aug 2026 10:25:56 +0800
Message-ID: <20260802022559.23138-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723235312.432a895c@systembl0wer>
References: <20260723235312.432a895c@systembl0wer>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change instance of __attribute__((__packed__)) to __packed per
checkpatch.pl warning.

Reported by checkpatch:
FILE: drivers/iio/chemical/ccs811.c

WARNING: Prefer __packed over __attribute__((__packed__))
+} __attribute__((__packed__));

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>

v2:
- Rename commit message to include driver name

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

