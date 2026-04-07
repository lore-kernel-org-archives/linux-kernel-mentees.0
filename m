Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D60A363C41
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Apr 2026 15:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575030; cv=none; b=EBiDUDewjKnHYReAxfiv3zcqnRgI9L5DfSpvJeDyZZ17lnFvXShaqmrIbndtjFs/ErH43KCAaTZVp59Hrec1F5vudTpArWUi5vRT8S4U+Y9Lele85mhIrw7AN+Ju2DIze7Q5yUkoMbpf+pTtXw5GwdgbSI3HDBzw7+5gkc3lCQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575030; c=relaxed/simple;
	bh=bMBU/Sp/Hd+8dWJzIBSChhEWAq6h8QnFVVi6t0Td8CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJmoUP21GEFPDb+fUfPt/kB+s2LES06e09DF2HiWSEhZz/35kYXAmsZW8FOr0yaUYebruN4Ic8fwv7N9odRPNIWW68Fy3Ys41yTyrZwls48oMbxIdg9Jfgoqlomwlo6fGRjamrvYlcrckPPkonOY71oQN4gLJocAbz220SyyYqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6zI0HTe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6zI0HTe"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d17bb1c1dso4465039f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Apr 2026 08:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775575027; x=1776179827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7ul7R4AdJ4kZnhxBsfC1ozDk40Au8wWcQ7o5oSGrE0=;
        b=q6zI0HTeJSrRrN1LBR193jwHLa9UxOK9Vvv4WdmEJugcXhTbnDKmbg074gk4ME+fqv
         Sv94OfJiVM8M1FzovinAdxXnp4oizfYHodh3HYvZSoI5RUB2+/dvlQq0e56wqm+kJdBq
         kVA6z0BiVqIY2fe9Bq6BejhsZCMhEGEyxILM+9Yt4ZIyon50n7sRDDaukxk7YP9OQMCU
         IKhHK8a3ZMTY6fRYyDuh3dUt9PX2+yEGFMcia+LPP4NPjUxcAkB0X3OrcFtqvCER3ama
         wNkftUH1DC/ZysaVlX8/v6y62m0tLL1bpDtLxlBsADD9l9iE+iNjl8GC2WpkjKshnEIk
         pEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575027; x=1776179827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I7ul7R4AdJ4kZnhxBsfC1ozDk40Au8wWcQ7o5oSGrE0=;
        b=s6ARJ3BW7Mcu28lfEkck7/UxrOGWhsySz/7X06ZXlcMshHkhI56N45XcWzHUm+0ywy
         B8GQqtahcrRJmci3F2aOFm6ydz/97eGK81a6mXaLk/cZoBHEL4AThiTFDx6t+t24Ho8l
         23pynZvPrGfinom9B9BoHRSXbBp/xtCsiSA1iZ3yPXOzrCP5s0CJuG/AgsRxJKAujkoi
         3S2zym0g6aCqR4K/bDjxW9F2j9oSeOELnjQFoUg2cql9GVaVzeeUcChzK5i6jxvcixgO
         /SAx3fcq2FQw5Q5sfU4CUe1/mPJDtfWu98ZjqpyAuP8RGAyGxae7zeMof8B7ry9qeQ/K
         TPqA==
X-Forwarded-Encrypted: i=1; AJvYcCVpH3+66ejkYqwOLo7W4Pm0tTuFisKds/nEGZUf2AchKErFP4FwxEFkJe2O2Bo0Hn9CetaEx3ECWkaCk2vf+cZA2a7Arg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6Bq/EvCd4R2ZkAFghaXiz6dVt2Xnkxod2U/jFe5TA8dPOf0Ep
	AvXnkvBSJFITdgXKkOujEFc8Ss1IUaZSnNCHhTxd6D+Xlp7OlfV80N3g
X-Gm-Gg: AeBDieuiPe2Fubq5DK35W6Rl/U61SL9deVzNWIvuJBJNfLC/rE0XDUA6omsklPhGPwL
	N1vzoMCOcBScyp5rwk4CwXU1aYEXSluD3jjS3nmGs01qLhARsibdpDIH8S3kUraqt/toU8Da/5V
	RPbHpim+Vo9ruU2uToL49oHIq83Y9dAz6t++PSEAG7QIUvcd3ixQFvSwW2RMqPJHjLVFalBAY20
	al8WqYsSRvhU6qCSzWW5C/qkjnRVQOaN7yAARw+xAXWA8eG/3+coD9KYGncPhiZ7hC3/yNaaYUl
	Pd8G1rrD2y/HAAaMH7xA7zX6cYhk3npWz3KKT6fbZKf3/8zXk1BVkrl2pxN3A0QPX8VOPiyGyfi
	dg+RcI5VVuZUjglmR3ycE/lR6hxgOjYRWcdS+ZDVkH90kySk8W7VI0EvOL0XKVc2ssioWpU+8mS
	5CKrJt3NgVPofndaDn2T8vcLrhCJj8OsM5JQzF9d+bgchE+DOhls8=
X-Received: by 2002:a05:6000:184d:b0:43d:61:652a with SMTP id ffacd0b85a97d-43d292e8ab6mr25974359f8f.40.1775575027008;
        Tue, 07 Apr 2026 08:17:07 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([37.163.52.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm51924922f8f.3.2026.04.07.08.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:17:06 -0700 (PDT)
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
Subject: [PATCH v4 1/2] iio: light: cm3323: fix reg_conf not being initialized correctly
Date: Tue,  7 Apr 2026 17:17:01 +0200
Message-ID: <20260407151702.15208-2-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407151702.15208-1-aldocontelk@gmail.com>
References: <20260407151702.15208-1-aldocontelk@gmail.com>
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
kernel. Before loading the driver, the configuration register 0x00
CM3323_CMD_CONF was populated with 0x0030 using
`i2cset -y 11 0x10 0x00 0x0030 w`, encoding an integration time of 320ms
in bits[6:4].

Due to incorrect initialization of data->reg_conf in
cm3323_init(), the print of integration_time returns 0.040000
instead of the expected 0.320000. This happens because the read of the
integration_time depends on cm3323_get_it_bits() that is based on the
value of data->reg_conf, which is erroneously set to 0.

With this fix applied, data->reg_conf correctly saves 0x0030 after init
and the successive integration_time reports 0.320000 as expected.

Fixes: 8b0544263761 ("iio: light: Add support for Capella CM3323 color sensor")
Cc: stable@vger.kernel.org
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

