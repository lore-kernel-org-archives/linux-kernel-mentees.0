Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5D1EA84
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Sep 2024 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727638281; cv=none; b=R0X0xY+zCY+Ck6vuUwQwN2ze8plhAfWD/i5WtJmqMCo7lyaIm9v+FfO8MDglvQzw0s/kOrlZjS/0PSfvaz141dY45+V7P1rmYGFsfgiiJ8gvV+rnM0JY1iNG9xZKiByaFFwQayTlxlrtQqgHCqfP67sb1DqFWH4rLThtZlDzxKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727638281; c=relaxed/simple;
	bh=wTAFUu2HR05YCznqD3LOSXMINOzSP/J0jVLhbDAFaVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5DMkudgk3TCqiNX6XCSs1s1f6v31etNxsweXY4QQGrZB17b35jqT0wQyvS/ZmxDlroI5awkUoSxFEt83k5yXzT7MDoEV/zz3pUSxl0NQjhl9IPNDcZbhAHVr/v+A6PUuSNUmn/SrC0YIjLb4zSgIE1n+KBOGTSe//w2iHBU/ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xlnu1HKH; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xlnu1HKH"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4371580EC0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Sep 2024 19:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DGgx1WpNpCo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Sep 2024 19:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4643780EBB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4643780EBB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xlnu1HKH
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4643780EBB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Sep 2024 19:31:18 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7a99e4417c3so326900785a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Sep 2024 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727638278; x=1728243078; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1isPk0/yiaThPVpTHXqwNM5xUZ8cavb3R5rhfzcYlo=;
        b=Xlnu1HKHZTkq+kSHimWtglTCgQAZloQeSy1H1WHMvrICfAFtivQCBIe7qdNLS7+7uP
         rZt5si5H6xjntL1o/i+DbFQw6i+FpBakSHv3Q1/yQBMzQDfVEFrwadt+teK9XOQBQ+kS
         sHscrQjJOjTP6EVfPPY4j/JkPBRKMl1n3QWslv7/nfNoPk6bhwmwjkd1rpf7fw8o4rzV
         wxXhKDMBuSoXv7+RKDyxo1ag294dY9k8S2IFImhHOBwuub1vBKio3izPTqzOoyc9quqp
         rViCMneWkW2aDBMxSOfstqSotij7jo69m8WYogYl2OxOthVYn6Vc7AwG4RnoeXK6hPlz
         mCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727638278; x=1728243078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1isPk0/yiaThPVpTHXqwNM5xUZ8cavb3R5rhfzcYlo=;
        b=sEE6XU1M1/BdeWqVrabPDzhmV57gppTNvpArV/ClYHMzXvC21mtiuMMQK49kV+sytX
         6w0iEEiktdZVDF47alNzez9DUDlwFGL+DaxOcWQUQpv5Z4NP15At0a7nZqNsbm6cCvEn
         nG4ZS7LbugnSzTHYxTFl8NVOSpdjKNhwFEX5Jl9n/8nw5GKOHN/WhXo9s7eDI8E602KH
         /AQyJKrNkc6sSHye4B4QSFAi7AX3u6s5p85jgHqp0n4FoD+OXLBtya6aLZN+urZM824Q
         vhRtSixCtUOIaZmoOzOwJjZBZQb3rU9rAibyrgK9Aq7GLjwAscyhQsZRU5pkwBOEVVDx
         dd8w==
X-Forwarded-Encrypted: i=1; AJvYcCW7/fyNx/zFxmUlXhpXjRJE+eil9cUiKczc8m5XmkJUJe3EE0bGM3EGZcyjbKq4ZzyS81hjOodJ/mdhgCugNWe58VuYRg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxqBLADfzrTEfqlEkXQ8STLORjoJYGYn4fk4jXoX9DyGTdxoByB
	OCPAN07YGqHRt+iklSFdS+uqhAwPPshCiXViuqGxq5/lJRKNBKkT
X-Google-Smtp-Source: AGHT+IGsTEnIDy283jw9lkr/mcK/PBIK3rY6wv6YWW4CeyY5xrhPWizkTM/1vAeHXQvUdyhRVi7etQ==
X-Received: by 2002:a05:620a:1925:b0:7a9:bb80:1f56 with SMTP id af79cd13be357-7ae378476dcmr1723689785a.33.1727638277644;
        Sun, 29 Sep 2024 12:31:17 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3782c533sm346399685a.97.2024.09.29.12.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 12:31:16 -0700 (PDT)
Date: Sun, 29 Sep 2024 15:31:14 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org
Subject: Re: [PATCH] iio: imu: bmi270: Add spi driver for bmi270 imu
Message-ID: <nsqdetgfr7p5klex77alaeoosgi5o5phhnri5kcn735wsn7e5o@phuellsm23nd>
References: <20240927183717.3613601-1-lanzano.alex@gmail.com>
 <20240929155437.60115014@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929155437.60115014@jic23-huawei>

Thanks for the review!

On Sun, Sep 29, 2024 at 03:54:37PM GMT, Jonathan Cameron wrote:
> On Fri, 27 Sep 2024 14:37:10 -0400
> Alex Lanzano <lanzano.alex@gmail.com> wrote:
> 
> > Implement SPI driver for the Bosch BMI270 6-axis IMU. Provide raw read
> > write access to acceleration and angle velocity measurements via the SPI
> > interface on the device.
> > 
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> 
> A few minor things inline but looks good in general.
> 
> Jonathan
> 
> > diff --git a/drivers/iio/imu/bmi270/bmi270.h b/drivers/iio/imu/bmi270/bmi270.h
> > index 608b29ea58a3..8950e6234203 100644
> > --- a/drivers/iio/imu/bmi270/bmi270.h
> > +++ b/drivers/iio/imu/bmi270/bmi270.h
> > @@ -4,11 +4,13 @@
> >  #define BMI270_H_
> >  
> >  #include <linux/regmap.h>
> > +#include <linux/iio/iio.h>
> >  
> >  struct device;
> >  struct bmi270_data {
> >  	struct device *dev;
> >  	struct regmap *regmap;
> > +	__le16 sample __aligned(IIO_DMA_MINALIGN);
> 
> For the read path you are bouncing anyway, so the DMA_MINALIGN is only needed
> for anything the write direction.  Make the suggested change below and that
> will bounce as well so that you don't need this.
> 

Understood! Will remove in v2 and use spi_write_then_read

> >  };
> >  
> >  extern const struct regmap_config bmi270_regmap_config;
> > diff --git a/drivers/iio/imu/bmi270/bmi270_core.c b/drivers/iio/imu/bmi270/bmi270_core.c
> > index 8e45343d6472..4decdad791d9 100644
> > --- a/drivers/iio/imu/bmi270/bmi270_core.c
> > +++ b/drivers/iio/imu/bmi270/bmi270_core.c
> > @@ -66,16 +66,9 @@ enum bmi270_scan {
> >  	BMI270_SCAN_GYRO_Z,
> >  };
> >  
> > -const struct regmap_config bmi270_regmap_config = {
> > -	.reg_bits = 8,
> > -	.val_bits = 8,
> > -};
> > -EXPORT_SYMBOL_NS_GPL(bmi270_regmap_config, IIO_BMI270);
> > -
> >  static int bmi270_get_data(struct bmi270_data *bmi270_device,
> >  			   int chan_type, int axis, int *val)
> >  {
> > -	__le16 sample;
> >  	int reg;
> >  	int ret;
> >  
> > @@ -90,11 +83,13 @@ static int bmi270_get_data(struct bmi270_data *bmi270_device,
> >  		return -EINVAL;
> >  	}
> >  
> > -	ret = regmap_bulk_read(bmi270_device->regmap, reg, &sample, sizeof(sample));
> > +	ret = regmap_bulk_read(bmi270_device->regmap, reg,
> > +			       &bmi270_device->sample,
> > +			       sizeof(bmi270_device->sample));
> >  	if (ret)
> >  		return ret;
> >  
> > -	*val = sign_extend32(le16_to_cpu(sample), 15);
> > +	*val = sign_extend32(le16_to_cpu(bmi270_device->sample), 15);
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/iio/imu/bmi270/bmi270_i2c.c b/drivers/iio/imu/bmi270/bmi270_i2c.c
> > index f70dee2d8a64..ce8279ae90cd 100644
> > --- a/drivers/iio/imu/bmi270/bmi270_i2c.c
> > +++ b/drivers/iio/imu/bmi270/bmi270_i2c.c
> > @@ -9,12 +9,17 @@
> >  
> >  #include "bmi270.h"
> >  
> > +const struct regmap_config bmi270_i2c_regmap_config = {
> static const
> 
> (same for spi one)
> 

Will fix in v2!

> > +	.reg_bits = 8,
> > +	.val_bits = 8,
> > +};
> > +
> >  static int bmi270_i2c_probe(struct i2c_client *client)
> >  {
> >  	struct regmap *regmap;
> >  	struct device *dev = &client->dev;
> >  
> > -	regmap = devm_regmap_init_i2c(client, &bmi270_regmap_config);
> > +	regmap = devm_regmap_init_i2c(client, &bmi270_i2c_regmap_config);
> >  	if (IS_ERR(regmap))
> >  		return dev_err_probe(dev, PTR_ERR(regmap),
> >  				     "Failed to init i2c regmap");
> > diff --git a/drivers/iio/imu/bmi270/bmi270_spi.c b/drivers/iio/imu/bmi270/bmi270_spi.c
> > new file mode 100644
> > index 000000000000..906b9b852a09
> > --- /dev/null
> > +++ b/drivers/iio/imu/bmi270/bmi270_spi.c
> > @@ -0,0 +1,89 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
> > +#include <linux/module.h>
> > +#include <linux/spi/spi.h>
> > +#include <linux/iio/iio.h>
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/regmap.h>
> Alphabetical order preferred.
> 

Will fix in v2

> > +
> > +#include "bmi270.h"
> > +
> > +/*
> > + * The following two functions are taken from the BMI323 spi driver code.
> > + * In section 6.4 of the BMI270 data it specifies that after a read
> > + * operation the first data byte from the device is a dummy byte
> > + */
> > +static int bmi270_regmap_spi_read(void *context, const void *reg_buf,
> > +				  size_t reg_size, void *val_buf,
> > +				  size_t val_size)
> > +{
> > +	struct spi_device *spi = context;
> 
> I'd be tempted to rename the input parameter context to spi and then
> parse it directly to the spi_write_then_read()
> 

Will do! I named it context since that's what the function pointer uses

> > +
> > +	return spi_write_then_read(spi, reg_buf, reg_size, val_buf, val_size);
> > +}
> > +
> > +static int bmi270_regmap_spi_write(void *context, const void *data,
> > +				   size_t count)
> > +{
> > +	struct spi_device *spi = context;
> > +	u8 *data_buff = (u8 *)data;
> > +
> > +	/*
> > +	 * Remove the extra pad byte since its only needed for the read
> > +	 * operation
> > +	 */
> > +	data_buff[1] = data_buff[0];
> > +	return spi_write(spi, data_buff + 1, count - 1);
> That needs a DMA safe buffer (unlike write_then_read which always
> bounces).  I'd avoid that complexity by using spi_write_then_read
> here as well but set the read to 0 length and pass NULL for the buffer.
> That function is intended to be used like this as it special cases 0
> length for either write or read buffers.
> 

Understood! Will fix in v2.

> > +}
> 
