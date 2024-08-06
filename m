Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C94246444
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 17:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722966509; cv=none; b=gU9mDMT8G7HJXXD69aJvJCV56YpGckkQLduWI2mYMtH6qZitzb6VUxH4TrFYViibvaLeZ1qqq5h+FZuQGWdC2SlySRkXDGTFNq9EJ3qgeIUCw2ak5oOQx0VpY8iIdsrM4vyy+E1/WRdSWz89VhMyeyV2dZEo3fL3l4+aV31Zta4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722966509; c=relaxed/simple;
	bh=vBDC4xo9mbVO1SY74xWdWYDnd5MRWexVdsUupjrLjyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUTo2HgLDT9Uzl8QrkO5Pr8XWwmDvPEtrXHZV+ZeWGCbrIFvsJ6SIJyi3pApgxe3efp0yXnnX2h3T+l1M2cOsnXAeZpRoCfjqPAFf4+bX4niHSZQvCMuxT+vkDhScC16OHnweKi0r1b7RXLDTETrNWCUSbLLYXDeY2/DQ7BCI9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNI4wFWj; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNI4wFWj"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 190DB403FF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 17:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdU9CdwT-x29 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Aug 2024 17:48:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 14E6A403B2
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14E6A403B2
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KNI4wFWj
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 14E6A403B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 17:48:26 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70d2d7e692eso752896b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 06 Aug 2024 10:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722966506; x=1723571306; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Cdrno72hqQxJb3X2e7mH5XWUDnJWg3spI0M3gLifjw=;
        b=KNI4wFWjnHsMAJFixjxEXpUcq+J/55NH/TkenluGivJmazrnRbaGz+i5mU1uw1CTIU
         UJRRMzw/UdGMPgkltnqooDe1w/wqdYX8CSUrskLx/tbIC/C5rTDhly8MfBIB1g4uBdZg
         fryN/JdVfpcRzF5dV7ISeD35Ms5yK3jFMfY6/VEU/iKPp4zLWPmYsIFrMLUMbVyTZf7W
         NWZxqNQHz+3BEDzQzoyDX3vaj6xaLHJESh3DGpdRle5rjqOEmZ7y2tMBQ63CsiNIly64
         usf+pUkxY5yG+i6VZsKIMGA1nFAgSgVM8PVtXlvnvFKgQPW+2IRV9QrlRCYw2u5qcXkm
         av7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722966506; x=1723571306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Cdrno72hqQxJb3X2e7mH5XWUDnJWg3spI0M3gLifjw=;
        b=V9p/YkpKB9FNRLadNFQmgncQqrTRUpuPafmeMIoexKpuACLfR0VSmKayh8SkJvN1ph
         /2h8rPQw4kBC1GWg/frozg6lU8pC4iUoJXT9tEZTOz1py5IVxNX6Uo4EV2ra5PLzBcQ0
         tuWKCjcdlnqQbjhYtYXz8gFd9ahNXmhLWGFkOlF4QKpGDf7Q4O9Z5tjDbRjnN92UrFw4
         bmanK05E7wh83SUMrwGfL14GZQ/mxqs07oBq0awaQ3ipKJpxWCjpfjqOswuSFLdvE6AC
         NEhnq8bEivUpfy5a/A1oMPbPkUOB4Waqk41QG+qzrELllPLfm51J0G391rAGsNJvQpG6
         ytzw==
X-Forwarded-Encrypted: i=1; AJvYcCUVY+x/5CqKtVp7WHERun8nLDxabC5fzmB4VH14XGW2hhLdQABDnZfqqgNXUVb7gkQM6NWWoLEISAwpIrCzhQOxGKXE2eEnOXktLW5NFvpFLDOb4OUaFBCVTm0YAovY
X-Gm-Message-State: AOJu0YxWF7Z2Vr363s6rvJIuXLkBLtDMbIhH+2tUONW2ITwomk0YZ1Oe
	xIofAIV++iro8V5touk7qWWWt8PVYd/TgE7L6OaFzoLYEJSdvoh4
X-Google-Smtp-Source: AGHT+IHF6ZPuSk0kgk91RJ7K16gv5yUw2DkiVVYF4+Fqgd7PX6IJ8xGEME+Z0x/y2rTs1lRZLulxNg==
X-Received: by 2002:a05:6a00:c95:b0:70e:9213:f321 with SMTP id d2e1a72fcca58-7106cfcf2a5mr15610008b3a.14.1722966506066;
        Tue, 06 Aug 2024 10:48:26 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([122.169.160.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec401c9sm7247174b3a.53.2024.08.06.10.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:48:25 -0700 (PDT)
Date: Tue, 6 Aug 2024 23:16:31 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, andriy.shevchenko@linux.intel.com,
	biju.das.jz@bp.renesas.com, nuno.sa@analog.com,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: accel: bma180: Fix dataready interrupt to use INT2
 pin
Message-ID: <ZrJhd7wd5R+GwoYj@embed-PC.myguest.virtualbox.org>
References: <20240805173237.475797-1-abhishektamboli9@gmail.com>
 <20240806173228.264f0114@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806173228.264f0114@jic23-huawei>

On Tue, Aug 06, 2024 at 05:32:28PM +0100, Jonathan Cameron wrote:
> On Mon,  5 Aug 2024 23:02:37 +0530
> Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:
> 
> > Update the interrupt configuration to use the INT2 pin for
> > the dataready interrupt.
> > 
> > Address the FIXME: support using the INT2 pin.
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> Hi Abhishek,
> 
> That's not the intent of that FIXME.  It's pointing out that the driver
> does not currently support the wiring configuration where only INT2 is
> connected.  The change you have here breaks the configuration where
> only INT1 is wired or both are wired (as it will register the
> interrupt handler on the int1 pin, not int2).
> 
> I'm guessing that is the situation you have is int2 only?
> 
> To handle this you need to add the firmware queries to identify the
> interrupt by name. See for example driver/iio/imu/bmi323_core.c
> bmi323_trigger_probe()
> 
> 	fwnode = dev_fwnode(data->dev);
> 	if (!fwnode)
> 		return -ENODEV;
> 
> 	irq = fwnode_irq_get_byname(fwnode, "INT1");
> 	if (irq > 0) {
> 		irq_pin = BMI323_IRQ_INT1;
> 	} else {
> 		irq = fwnode_irq_get_byname(fwnode, "INT2");
> 		if (irq < 0)
> 			return 0;
> 
> 		irq_pin = BMI323_IRQ_INT2;
> 	}
> 
> This defaults to INT1 if available, but will find INT2
> if interrupt-names is provided in DT and specifies that only INT2
> is present.
Thank you for the guidance. I see that I misinterpreted the intent of 'FIXME' comment.
I'll work on implementing the logic to query the firmware for the correct interrupt
configuration, as you suggested. I'll refer to the example in bmi323_core.c and update 
the patch accordingly.

Thanks
Abhishek Tamboli
> 
> > ---
> >  drivers/iio/accel/bma180.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
> > index 6581772cb0c4..d44409afffbf 100644
> > --- a/drivers/iio/accel/bma180.c
> > +++ b/drivers/iio/accel/bma180.c
> > @@ -126,7 +126,7 @@ struct bma180_part_info {
> >  #define BMA250_SUSPEND_MASK	BIT(7) /* chip will sleep */
> >  #define BMA250_LOWPOWER_MASK	BIT(6)
> >  #define BMA250_DATA_INTEN_MASK	BIT(4)
> > -#define BMA250_INT1_DATA_MASK	BIT(0)
> > +#define BMA250_INT2_DATA_MASK	BIT(7)
> >  #define BMA250_INT_RESET_MASK	BIT(7) /* Reset pending interrupts */
> >  
> >  struct bma180_data {
> > @@ -425,10 +425,9 @@ static int bma250_chip_config(struct bma180_data *data)
> >  	if (ret)
> >  		goto err;
> >  	/*
> > -	 * This enables dataready interrupt on the INT1 pin
> > -	 * FIXME: support using the INT2 pin
> > +	 * This enables dataready interrupt on the INT2 pin
> >  	 */
> > -	ret = bma180_set_bits(data, BMA250_INT_MAP_REG, BMA250_INT1_DATA_MASK, 1);
> > +	ret = bma180_set_bits(data, BMA250_INT_MAP_REG, BMA250_INT2_DATA_MASK, 1);
> >  	if (ret)
> >  		goto err;
> >  
> 
