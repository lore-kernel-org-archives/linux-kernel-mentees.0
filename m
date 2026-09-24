Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024D4A3F00
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 21:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286427; cv=none; b=F+Lr4DMZndPSr958Q78d1Gst7n0E6noAFZdcmTLjADZHzcOXaKHZ/LxMBH4NhzTZT38rnuYdAT3Jpl4tZkjWE9ppCX0AqQIhPuihKxY2kuVvtpo2hKvHRjLZsdzFNCpo6UlSzhgiPX2FrT8BFIhK50qFg1FNt8+x8lUYwRXDEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286427; c=relaxed/simple;
	bh=sJB8a2Uid+eUS/2yZz14rm+h24VJn2Vq54W8G0uPAe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b7DZjsRco+P9M4fBhn8ozbStcsWdPC9bFYtOrSDnI8O4vIa6CODaUpLUbJMJ6XVCAWK6qskAKsyr9zMCG7KUCmNHH5gmHEE0z/AqhKClkZ3VIdOcByDpO/YepPZIfxyEt79DMjCaoy2z/hsB146ED4FjGVnjppmZFf4geKMZHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVXXqu06; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVXXqu06"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144efd1ea76so197578c88.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 14:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286424; x=1790891224; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vmbHwdbLykki4BBoXNNKdYpZGlaAV7d37IywwLOJY5w=;
        b=RVXXqu06TKMZNoK5T484bEz/L+wQIbcDWqF5HnQUBiw1k5OUU8VS3l0hc9qkEQ2K2Y
         ryIxZamMuE4llM895kpX3Db6iIkEzmAO8UITnUyCzzsXDzrgl9IW9ZQP6qzFc00LuxH+
         G+T9Xk99NFna/N8PWP+/LC+F3taF9JUQhLz6Z/99HCWbGnC2SQ6pCOm8gY2ys1oRhOtl
         xKiY+GMonbLizPPdvk41Dm2hJOaPY0UepEuuA5Yh6sthECEo6uHgnwxs7wiiJoboGr0f
         k8Iki/TkhIRJDmE2nWPkmYl3sjE0fvS1MHOrThpre2wixvd1xyC/xB/hBsdKErgZo6US
         d3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286424; x=1790891224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmbHwdbLykki4BBoXNNKdYpZGlaAV7d37IywwLOJY5w=;
        b=0aHJjwq6wqAi7N2SV/rfYbDMxYCcjEykxpYfG6DV/IFQja9Piw8LOVY++V/33eRueq
         RrIXjgl0/RaWPoD66dkT6QlWIP07kp098VIbvRqaZPV17UpHuAu4pdyCUenbUrKTUwtT
         scbWE3j9qg1hMxizJ/HRXKeiHcYZZQebKK77S6TQC2kj32XV4By4G2bQ5VVVFhrXX9ya
         w1Ib2DcyVw8Azgab4uXEQmmIqDsLltun+p0SoDbaLYkMFAz2aKujoBsUhzvBMlhPpLI7
         3cJameqZQ19dxZ4dZ2TxYzr2ZpPpdCnjJcIqyWKmU+ysYSLEZrzDtLJ0Wiw7Ou2L0gom
         2xrg==
X-Forwarded-Encrypted: i=1; AKwUvBziLQteo9EozaldAac4cdXe8HOlXKilmCVKxLgq0+BBdjw8mIZ8CW3oixtay4EIxUciFOQyKQ/ldSeosNVt7FvGrzlgQg==@lists.linux.dev
X-Gm-Message-State: AFuF++nAbbAnPPdCZMPqwo03YL+rWVRRHfADkDgtAyxcB6g2jF90Vz4o
	3v1L4Ya0JwwzVrbqZBtPx0EdpCB48GtX/a+jNRGTob7cI1spvXHPt6w=
X-Gm-Gg: AYBFou158lF59ELd+htTX9mnbjR/G69MMLFexxFqgKdsfhiYXxFwo/uz0rKxR7d4NdU
	EVSpSd31uaYR4hc+pwHeqOZ3ZQhnN1UqGuaTJzsGa4NACGWthFmWpResIJclUnGy8G7FXa+dRW4
	a9FrKV4Fu8efilh1oQpbmxohjt63LVcD/ilHKe5gatCDZEP/d+T9gCUYMmCkC5fvtjaHiD8ZvX/
	E6Esz37diAxS52jMz4JLD/5Okp3LUfmpiaLvpMgkE5sSuMq09nMQWWIW8s8tjA73jBWkaIlhJKS
	eV55qwncbKUu/S6h8HaTYjRQtqU7/dNU6p1yG9gB076vHHkJrUld34iJIf1JFQiHOQ+rPhzplBN
	yJuDNoiguu7BtL5rU+1FFMmJlrs3LYU3raGox3po5Btpszn4o04r3wF+yTZyag5hNK2Nxw03yMp
	+iMEsKQxp47Ja2ai3B+KuW94RbKzQxCgHzv5UnQL6bD0dk9HOwoSYVIcA98peCEXKm+qCHrd3bW
	wQA++XpscTH5/jAv8eAbcFvkBOJHC/YI20Ll8poVp1fRnf6PA==
X-Received: by 2002:a05:7022:3b0c:b0:143:761a:863e with SMTP id a92af1059eb24-145040d406amr4150298c88.44.1790286423822;
        Thu, 24 Sep 2026 14:47:03 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm1171577c88.7.2026.09.24.14.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:47:03 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: nico.antinori.7@gmail.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: christophe.jaillet@wanadoo.fr,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jkoolstra@xs4all.nl,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org
Subject: [PATCH] fixup: remove uninitialized variable bl
Date: Thu, 24 Sep 2026 18:45:57 -0300
Message-ID: <20260924214640.6149-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <29b7f9786f08989c8f941ab85a76c62d1f5ee43b.1790200427.git.nico.antinori.7@gmail.com>
References: <29b7f9786f08989c8f941ab85a76c62d1f5ee43b.1790200427.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the uninitialized variable bl and fix the IS_ERR check.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Small follow-up patch that fixes usage of unintialized variable.

Apologies for this oversight!

 drivers/gpu/drm/tiny/ch1115-i2c.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ch1115-i2c.c b/drivers/gpu/drm/tiny/ch1115-i2c.c
index cb6198a8e55b..631dd25e7dcc 100644
--- a/drivers/gpu/drm/tiny/ch1115-i2c.c
+++ b/drivers/gpu/drm/tiny/ch1115-i2c.c
@@ -751,7 +751,6 @@ static int ch1115_probe(struct i2c_client *client)
 {
 	struct ch1115_device *ch1115;
 	struct device *dev;
-	struct backlight_device *bl;
 	int ret;

 	dev = &client->dev;
@@ -802,8 +801,8 @@ static int ch1115_probe(struct i2c_client *client)

 	ch1115->bl_dev = devm_backlight_device_register(dev, dev_name(dev), dev, ch1115,
 							&ch1115_bl_ops, &bl_props);
-	if (IS_ERR(bl))
-		return dev_err_probe(dev, PTR_ERR(bl),
+	if (IS_ERR(ch1115->bl_dev))
+		return dev_err_probe(dev, PTR_ERR(ch1115->bl_dev),
 				     "Unable to register backlight device\n");

 	// DRM
--
2.47.3

