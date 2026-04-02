Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D6E3093D3
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  2 Apr 2026 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143057; cv=none; b=nd3RcsxqDch/rE+JDFq5Px4kib5B6G1LYj9qAJYcm1n7f8RlhUSBWXLurib3iJ/VRGR21tG5yiZ5NKwa8zozS8PHPskeqvBajlXcrJnbbVjQfFXzoimZU621MRrOTvNBtdiokxp1edYwfIXn8oyZcwv/cldE4mFfWozzwkZyvro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143057; c=relaxed/simple;
	bh=qqYIlX/ogMR1tiVGPxMuhx0CZ/IF8ISju/5h5Esyr1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLn+4po0rGDdJgYdAwKww/IX+TmzMEc4+2xZKU4LRvs5yuBzAHQwUxLV91rrALQUhsWHfgCGpfw9bSdgCp7jiDPIeuqRjZRW0bf71bcXF9jE6VUAMFyRiNTekZbizRStaKC/gCfyt9RFOixAh5MahHcyoSuWdVhL2/4XCNThC0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp8M3FcT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp8M3FcT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso10778135e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 02 Apr 2026 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775143054; x=1775747854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjcxZkjC7ao4lhP5f+c/QRvePzRlIefpoXPLd+zFiP8=;
        b=Zp8M3FcTmZn+4Y4m3EdNcYS2r9zTjpoH/GaA+pLPfuKUvcwvdRCFk3sskq4pDTQBDc
         TOcNLMEgl2bhabNSVaC+IPcmj1TyIFrYr/idAJRxHVtuGgh5FMeFuD6f0H88iEQE4SoA
         CIaFJ/Jv6WqXEaVJ0zr2FaPiwFC4KeEisiOqR0vhK5/DjUPTzb39NB8iUCgXjIf4Fx1J
         ejz9/ienGWWVCgtcKD7g/oydA5kJyC+xoThXoVUukHWHvoLQVzw+4upUwyZg68tZUIrx
         E9luy2WJdmDzyd8DmNOgpqpbCrphBXIVNsZxerIB0ioP89tjWbrKPQBCemvCpeaRML8w
         ONxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775143054; x=1775747854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QjcxZkjC7ao4lhP5f+c/QRvePzRlIefpoXPLd+zFiP8=;
        b=iDD/VlpO6AbpQLkujoACI47LwiLZXUKyqeGA3OSbRk9VabchycqJnJ75jkoCedzchq
         wdJEDTiYwYGkfNocS3WB8HqSGiP6BXK1swY9zWAyrnGzUA1N68OpLYUyrF4EfwUyzswN
         aZrW0PnfPCysPT4m8chrqshNLYsHFPIcd1f4LOZLrnhN4nnCt4eiuAO8T0d5Hgdz15gT
         Sz6c8Kdp/3gwEkNJHRHSh1WPHJXQxAF0z7DGpgxCt14vw49QhoZ4ytEVX545f/St3y6i
         cz71NcXLoWiDzSfRis4rpnHByujNIs+XcbOoIhfap06zGOz5E+GolFbV/IUB0ZXeMc59
         oibg==
X-Forwarded-Encrypted: i=1; AJvYcCVugp+pdbaSUKgEDrNDpUJndYENS8l0ENazIWlLI0Phu2jitcTTSym1KQ45vXida/o8AUJlbtc8LRY8RUkQdY+VUGt2HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUrUpk/AL4apVv5LkEXfijAuzukW/AVo7jDTIJuDwmN59DKAl1
	u2BgEr4jw6LpWWFYaH6q4Io9pmrJRLZB57mlwm/USQnc4AWKiLdVUbNA
X-Gm-Gg: ATEYQzwiI8SRCmY3V6kuIWYTA5sHSZUoXa8q1qEG5TyuTMIqksQruNZMorZMoEzpZD/
	3xDvqE4Eu8Zz5ap+Y8p/bmVpoYlXE2IY9dXgwlnKaK/Ch56K8ogOgNx8Vq7BAeliH3NJcOl3O3D
	IVD5DHvljU53FkPjt4opEyf2lIW7EIYPutK31YBAOwDXxD/3DZlm0ILH4YtKdbj+SOcZj4LPO2w
	2FCQrr92KATbtjnvwOD+IcAMj+u8F1JMbiOwoPGcFCujumdgaOA61upxY5ZkKaOMvLwax74s3KN
	XlZpmR01nM8hx25Hnh9QgvqgxUG3XEj0e8scPu8F77huTSGVxk4mJlJsd1ai89GKwNimdJx0Gx5
	kyhhljG4AWsaGdUgdLIh7/dtRaaXPDlMzufMe3u3tR1F989VBp4HQ1UBWqm0XsWnFQOZNk87FPN
	UZI9OjfH/XWz5Z0Laln/Lre+EELOZZ5IxmQrRe8cMAsCgyG17lmTBS
X-Received: by 2002:a05:600c:34c1:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-4888359dc50mr132126455e9.24.1775143054090;
        Thu, 02 Apr 2026 08:17:34 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm327405075e9.2.2026.04.02.08.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:17:33 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: ktsai@capellamicro.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	daniel.baluta@intel.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 1/2] iio: light: cm3323: fix reg_conf not being initialized correctly
Date: Thu,  2 Apr 2026 17:17:29 +0200
Message-ID: <20260402151730.18901-2-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402151730.18901-1-aldocontelk@gmail.com>
References: <20260402151730.18901-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code stores the return value of i2c_smbus_write_word_data()
in data->reg_conf; however, this value represents the result
of the write operation and not the value actually written to
the configuration register. This meant that the contents of
data->reg_conf did not truly reflect the contents
of the hardware register.

Instead, save the value of the register before the write
and use this value in the I2C write.

The bug was found by code inspection: i2c_smbus_write_word_data()
returns 0 on success, not the value written to the register.

Tested using i2c-stub on a Raspberry Pi 3B running a custom 6.19.10
kernel. Before loading the driver , the configuration register 0x00
CM3323_CMD_CONF was populated with 0x0030 using
i2cset -y 11 0x10 0x00 0x0030 w, encoding an integration time of 320ms
in bits[6:4].

Due to the error into the initialization of data->reg_conf in
cm3323_init(), the print of integration_time returns 0.040000
instead of the expected 0.320000. This happens because the read of the
integration_time depends on cm3323_get_it_bits() that is based on the
value of data->reg_conf, which is erroneously set to 0.

With this fix applied, data->reg_conf correctly saves 0x0030 after init
and the successive integration_time reports 0.320000 as expected.

Fixes: 8b0544263761 ("iio: light: Add support for Capella CM3323 color sensor")
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
 drivers/iio/light/cm3323.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/light/cm3323.c b/drivers/iio/light/cm3323.c
index 79ad6e2209ca..0fe61b8a7029 100644
--- a/drivers/iio/light/cm3323.c
+++ b/drivers/iio/light/cm3323.c
@@ -89,15 +89,14 @@ static int cm3323_init(struct iio_dev *indio_dev)
 
 	/* enable sensor and set auto force mode */
 	ret &= ~(CM3323_CONF_SD_BIT | CM3323_CONF_AF_BIT);
+	data->reg_conf = ret;
 
-	ret = i2c_smbus_write_word_data(data->client, CM3323_CMD_CONF, ret);
+	ret = i2c_smbus_write_word_data(data->client, CM3323_CMD_CONF, data->reg_conf);
 	if (ret < 0) {
 		dev_err(&data->client->dev, "Error writing reg_conf\n");
 		return ret;
 	}
 
-	data->reg_conf = ret;
-
 	return 0;
 }
 
-- 
2.53.0

