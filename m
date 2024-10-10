Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB161CF5F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 10 Oct 2024 18:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583758; cv=none; b=XnMm0ykEKfAs1KUnFNcEKSkCrjGoqqzyiG2xKXMsq46XNYIHnccMk5R/U4jAwdB3pXbzV1PbtDNS2Ry6vxr2dN3LEofAODM6n2GNxeHgT6+sU73zIxiE2WjrW0F2jJnlfxuj+Krlzk+dz+aFtfIY2rqZHUJBDepdQjuePJJRkMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583758; c=relaxed/simple;
	bh=aJh8hqhZ6jb+TxSaj3u+M+TB08HBSsjpDstazo9dh/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=exAyHUBZFXqgvQ7S0K0Mm+/E2u9BaN1We9RpBfZWnuVYOW8555g6Mmg0FFclPXXER1pk+7pPM+nYygDZv/snBJxgwfGM/qiiPDKqwtwIq9cRywJTvorCV0pdw7u2byLi9ldpQ5XUiS3+wqJJA5J/OveylFWRXnmbwIDkUfY8NAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQxePJ7g; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQxePJ7g"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A3F410DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 10 Oct 2024 18:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IC10lEPeX43 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Oct 2024 18:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D241E410D1
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D241E410D1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vQxePJ7g
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D241E410D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 10 Oct 2024 18:09:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54EBC5C5AB7;
	Thu, 10 Oct 2024 18:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E7DC4CEC5;
	Thu, 10 Oct 2024 18:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728583754;
	bh=aJh8hqhZ6jb+TxSaj3u+M+TB08HBSsjpDstazo9dh/Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vQxePJ7g2uhhBotcxea8bJpwbLUF2M0WubO/Mjxn8XnJ0gKAZiXxox7MpjjC9aNMM
	 MxV3S+8Nqj7b1y/Php/xD6iMgY6/tmX7PE6GFgRyYwXC1DZqnsOwwreJQAHkf6YS0m
	 W5t8JDkIAI9hT3jDGFs5tgsPCdSQwZNK2eeTZiSgIPYejM5QXXnoGeQTjUpftq3Szj
	 Hl6DV9Wo6AlL1XiNJWdL3LqTiv9P8SiZ+5bzgoEiUjmiSewIQqrkEj5+E5aN2Snijw
	 XlITCfM36CSdEcYn4MP5sKIbpFXWpqNPlb9FwkcWtSSHaP6VzkP2QQKr9sMO7pg9x9
	 BghzAf1YITY/w==
Date: Thu, 10 Oct 2024 19:09:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 1/1] iio: imu: bmi270: Add spi driver for bmi270 imu
Message-ID: <20241010190910.383f4489@jic23-huawei>
In-Reply-To: <20241002033628.681812-1-lanzano.alex@gmail.com>
References: <20241002033628.681812-1-lanzano.alex@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Oct 2024 23:36:22 -0400
Alex Lanzano <lanzano.alex@gmail.com> wrote:

> Implement SPI driver for the Bosch BMI270 6-axis IMU. Provide raw read
> write access to acceleration and angle velocity measurements via the SPI
> interface on the device.
> 
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>

Hi Alex,

Applied with one minor tweak. See below.

Applied to the togreg branch of iio.git and pushed out as testing for 0-day
to poke at it and see if we missed anything.

Thanks,

Jonathan

p.s. Thought I'd sent this already - hence I actually applied this last weekend :(

>  struct bmi270_data {
> diff --git a/drivers/iio/imu/bmi270/bmi270_core.c b/drivers/iio/imu/bmi270/bmi270_core.c
> index 8e45343d6472..638ce2c30d0e 100644
> --- a/drivers/iio/imu/bmi270/bmi270_core.c
> +++ b/drivers/iio/imu/bmi270/bmi270_core.c
> @@ -66,12 +66,6 @@ enum bmi270_scan {
>  	BMI270_SCAN_GYRO_Z,
>  };
>  
> -const struct regmap_config bmi270_regmap_config = {
> -	.reg_bits = 8,
> -	.val_bits = 8,
> -};
> -EXPORT_SYMBOL_NS_GPL(bmi270_regmap_config, IIO_BMI270);
> -
>  static int bmi270_get_data(struct bmi270_data *bmi270_device,
>  			   int chan_type, int axis, int *val)
>  {
> @@ -90,7 +84,9 @@ static int bmi270_get_data(struct bmi270_data *bmi270_device,
>  		return -EINVAL;
>  	}
>  
> -	ret = regmap_bulk_read(bmi270_device->regmap, reg, &sample, sizeof(sample));
> +	ret = regmap_bulk_read(bmi270_device->regmap, reg,
> +			       &sample,
> +			       sizeof(sample));
Trivial but this is an unrelated change.  Possibly valid but doesn't belong
in this patch set. I'll drop it whilst applying.

>  	if (ret)
>  		return ret;
>  

