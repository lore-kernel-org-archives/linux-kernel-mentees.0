Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630B048CD67
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635118; cv=none; b=JWltLYYJHWsZt5tmJUfRHLKNcZAOp1wFhPwNInqXEKc4DWI3t7x9mve8AC1Quij+0yYPuwROdr1foB5/bnAx0vgUSDi1JJ6dxppdHDCuBroXUf7jwgxODD4HzD3gkqMAJP6WLowa2exGrGbhXF1uOr//wvn3Mvyj0uhEy0vFi9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635118; c=relaxed/simple;
	bh=6/z9IRV5ZQn/Frw7BWoJwC2CimqWWJl4hMDciS+A1D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjCM5CEcm4nCmR2ZvD/MTZZNxLQ5LqSjZQj4qQLYxSryjECsIDH7z2n2hwACmphDfV2oaMwRGjG5yTw972g9X4F/ZGjclhJS/1/kE0cTKDD3D0m7KVlYXiuwqcZXg6yYsj+PIi+VFRqc8RxTvgPiiCaQKYG0wwkJ2udABEsc9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPat0F2V; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPat0F2V"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso1542719a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635116; x=1787239916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRy+t8tNDkimDr+BoBwwY6yvO7nk9mVt02bQsB0YYA8=;
        b=lPat0F2V562XqUb22IS8xIJ00Q60S0Gjv9omeXho96bhBAvWx990a4yVmss0xaOc1/
         KzhkH2DAYVqGp9GsZZCCmaqqWIZI3VEf0ikh4gzCTmmxO/BYZLOP4YkBMKDpHFC33n4g
         IAxd6PwlPZXmpWnxcUbGrRjAs69cLeTx0LBoJghs38E7t4V3xr8jU7IxMO4smq//9oIV
         OF/DUMk4zR6BQz+N7Zq2fA+Wwdi94T0bvlRUDSrHIn3qNTHJEE+wRD2FUARnGpFerb2r
         mHMVopHMDOYIYpu9ik3wTb2gWP3oP44Il6Uo00YPUFEb5wcCRM8G85Ormi2YauJB3f5D
         cHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635116; x=1787239916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRy+t8tNDkimDr+BoBwwY6yvO7nk9mVt02bQsB0YYA8=;
        b=DdMbFLdaDoPiFOkKKkjve0SSUUOJzDmz6Kyj2TknjvbvNXw7Mvw3XHJ9H/3D69cfcJ
         FuILOBVP30WEW73RWajOre188M79Q+5EILbC86ECfk/RgBA7KBofK2wTwEPJJEV5TpPo
         jgpFeNuJKzDAQyOJxFLKTfgejCcl+pIuv3FHXf8QyWREacFfa6uTbOVeGtwNS63fTVxp
         CT7cAinU51kps7fxiBQKa+6NOm/q/wBeszxxTHvdw02yhOyfALNWpdrpXuEYUsGeLzcW
         QEGNK5XLSZ77Yt2Ius6OkC0SigazeZqUFYpvy8fVdvCS701mVH65zZRI+RNcId2QJeZf
         EKBQ==
X-Gm-Message-State: AOJu0YxsznLUCjzU9YydAStIqkezKzUM/JNE/7Z1N3pyYfvcfCyUl41T
	jFb7RmTFLCKC6vaybF7WK8CfDKLxUNBlRg/EIPDQFLRwPSEY/gjLBwXl
X-Gm-Gg: AR+sD13rFPpn3ZeHpKJU52And9ubCmRXA+xYqr+pnM9HZGSI6il7N549V0BIgeEco9a
	oB+Jz7vGRapGPqciIe9VJOxk7vxI5z3pA6+J6aRI4JaxnYF9p0KetRiBpk/VXRMhckC7hI8OfVI
	j1cCjOwhucPFR+hQE8q7qwfaBFoM+7Bt0og52bb15VyGb51JiyCPexXBIZZkESTGSC9q0QlqXIY
	a/37RYG1cbZ3f+jVt5JesGs9sRwiNdX3u75TrKvCUaobdO6H5o9ZBJlKPYPjn+ULUI0T92ts5/F
	x5Eqnne7NiCSOPyzYR+7icnToZWF7DSKt7kT6Tda3tPhGB6QqMfZKUEFoPBNqE2ngKCh/NRm4MS
	6glzHUPL5F1SuHjApE1UQULvYXd9cNcMHk0tCREel+IQmDfmOrQvbstD7QVYEntpOg8zicNuqrT
	NIImkCy/68z5lUsIUQX1RfvPfPccl12hx5Pf1MyP0XZdFlyhUKxXNSsqC5VtzeURiVDmXS+GyOI
	4QAQ7T5Bqzwak4EiulpDW6hQBBTyQKEtyJNwGNj+2OFdzIrBSl8g+0UWQRDtA==
X-Received: by 2002:a05:6a20:2589:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3cc5503a34bmr8643790637.14.1786635115961;
        Thu, 13 Aug 2026 08:31:55 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec082943fsm7960604eec.29.2026.08.13.08.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:31:55 -0700 (PDT)
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
Subject: [PATCH v2 3/5] iio: humidity: hts221: Allow unknown whoami for DT fallback
Date: Thu, 13 Aug 2026 23:31:27 +0800
Message-ID: <20260813153129.12423-4-adinata.softwareengineer@gmail.com>
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

The WHOAMI check currently returns -ENODEV when the chip ID is not
0xbc. That rejects Device Tree fallback compatibles.

Keep failing if the WHOAMI register cannot be read. On an unexpected
ID, log it and continue so OF fallback matching can work.

Use dev_err_probe() for the read-failure path.

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hts221_core.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index 76a391f421f5..b73c26aae9ec 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -136,19 +136,15 @@ static const struct iio_chan_spec hts221_channels[] = {
 
 static int hts221_check_whoami(struct hts221_hw *hw)
 {
+	struct device *dev = hw->dev;
 	int err, data;
 
 	err = regmap_read(hw->regmap, HTS221_REG_WHOAMI_ADDR, &data);
-	if (err < 0) {
-		dev_err(hw->dev, "failed to read whoami register\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "failed to read whoami register\n");
 
-	if (data != HTS221_REG_WHOAMI_VAL) {
-		dev_err(hw->dev, "wrong whoami {%02x vs %02x}\n",
-			data, HTS221_REG_WHOAMI_VAL);
-		return -ENODEV;
-	}
+	if (data != HTS221_REG_WHOAMI_VAL)
+		dev_info(dev, "unexpected whoami 0x%02x, continuing\n", data);
 
 	return 0;
 }
-- 
2.47.3

