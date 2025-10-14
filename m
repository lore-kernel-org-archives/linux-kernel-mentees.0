Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D78313551
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Oct 2025 12:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760444840; cv=none; b=Oal0+/FNnuRNloCPv54cosHL/MjFDSXzfIEW4SFd++gHTXDBNPKOf8lxpUmHrFleQqkpxappFbPcZla5LLziuWCg6qubBW2UREWL5hv91D5GOiX2s9VeY0PkZtFnNLEJv6XdlxeeIr6Y7PSYRL0lbKc1aTxO+HfLssW3Z75gx/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760444840; c=relaxed/simple;
	bh=UpiGm1rT9EBDp1/84eMBMTQZvXgS8tY9SKg2mGiKuq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/t089i/DAfP1/cgHa8T8DPEgnmGLdkDXSO/GC5ZgMX2Mmt85Bop4Dr/Jml0gBrXhyswaXawNQ5NDGvD1EXACxUGiHVnAX3Ouz/wL83OVK0hT+e9hwnSfI8MRU+PMfiIeds2BVRjuB9uGYkTQkD7jpV7hJ+1TEp6hfzQOS3Z6MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jwjb7Iyk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jwjb7Iyk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e52279279so37638565e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Oct 2025 05:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760444836; x=1761049636; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QjHopu1UwDxsV5IdNPvI1jrj2EChfALYrLzFCq9lMBc=;
        b=jwjb7Iyk+kW6O8pdfCIl0T/ueMYQNqB72E+tvIhmzMpQ0pejAEjHVrK2AZQI2gWiB5
         GQOK/1M8JreNRQcd8hcSjTNCjR9Y/wGUQ8vNI8lApP76avNJTsBjOLJv2eGpy8xxS9LR
         J+C1hjl0qnlOaieGGQUJ9bxbn6jG2JSxewsGEv4e6r8y3NIre80mfZ7dUNW01bF7RiWM
         h7e8hh4rsk5hRpqmPRJZ2tb4Nfx9c56kj1p58j8ehykH0LGo3XFGZOTFT9Kl65+w4oUP
         0AGp7PKdbkYP/hWhszRv4MA/qsxZtRn6yLd0yucg1CBsmxeZ9NAll0+E+9XjkcwEzzXM
         cLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760444836; x=1761049636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjHopu1UwDxsV5IdNPvI1jrj2EChfALYrLzFCq9lMBc=;
        b=wVtWmrIa4jo1AJRQgz8f+MBkS9clhNbKPU/8SwvJaFl3zMA02M7yYsMWwwJliUGWcR
         DZ9q6AV0AnS6AUUTU1pOt/RfkB0rvY5bi72/7CVyV5cpYqcMLOh5i0vP2brCMIMwwD7q
         GqBzoj+cnu6Qyk5W/az02D18aZCDPV9JifiT8Lxu0n1qf6HM8iKtkgAI9QPIsL9xg5qN
         oxLU6PRoiPlIo7S+3y+a+o1UXl+PEUvPgS2TWMtLDhlwdTUmLlUCjQXsdJGVhFTNTkrI
         NdVgVWe9LD4tbz/0o7hzzRsPyLqWgHix32i1sMT5nEcl7g7f+OfGqoPHt2PAnexNw1NO
         fEWA==
X-Forwarded-Encrypted: i=1; AJvYcCVtlcVGoLjX4uuvQTAYdkhLA733+0zCNKrqcoaIPJJQvEJR2cik9pdA/6x+ShuSd4AJRo0ePtFDd4d/F8zDlyk9/iZ2IQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfmqVrz+vlS9ICuF8zzvf+xxAMaFg+ptqykjo9s7MO/3Jhsg1Q
	Z69QaScX7J3hrYbsLwB8AzhK5F/SesuzkJWJ7sRbMVX+OfLc/whu9PxRCSmouyWnJWk=
X-Gm-Gg: ASbGncvQTcKluguoV3jhcucDHisBIGlaW8Y0/nNm9j8KBUOSvhJB55doub+uiOrp5Xr
	7XZMKkTAcy95oJQXJL3fFYDR4Gov/wfncVWANrriz+0wlXre6d59QT89YfLw2WwHt2C3eGK4J9e
	WqSW4tXi8ZNJlKgM/YvUdwJy1Or9hy4LtLBY16tpUdnPGvHLBlMJR7o19Aq52MuT5z/8q3uNAAL
	GUXQcrrFZOQzWr+AA/LfhPN08mvJkNAcQJHZjFfykJKqZ6ivZSTQbo2yq10HNZBuBPGR7Me3XuQ
	ns6o3/viNOZ5TL23FjMKWwDQ0+JXLIgTX6B+CdNce7MfJz6LaW4nobWARVuhLbcvmw63QUaAtky
	a/lKLc5g2hxWk4UIZ1sdgKObnguNwaLdKinS1ybfeoUHAmD3j/NqS+F6J/qajNg==
X-Google-Smtp-Source: AGHT+IGpLJmj5ZZeE5vtmTg4lu6fLIqoCQTKP25wq9imxhpp1Co0qw1M1pvst4NVF+ct3P1g5F4ilQ==
X-Received: by 2002:a05:600c:c116:b0:46e:3709:d88a with SMTP id 5b1f17b1804b1-46fa9b17e16mr141372525e9.33.1760444836001;
        Tue, 14 Oct 2025 05:27:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb4989601sm232872755e9.9.2025.10.14.05.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:27:15 -0700 (PDT)
Date: Tue, 14 Oct 2025 15:27:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khalid Aziz <khalid@kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Rakuram Eswaran <rakuram.e96@gmail.com>, chenhuacai@kernel.org,
	david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	lkp@intel.com, skhan@linuxfoundation.org, ulf.hansson@linaro.org,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in
 pxamci_probe()
Message-ID: <aO5BnwkNNyv_GOGS@stanley.mountain>
References: <xxtrhbv5qm2crtvc5ejpgu5caadsmms3rfulmosjwq7lumrko3@5mlcpk24hymm>
 <20251012183804.15171-1-rakuram.e96@gmail.com>
 <6j7ix5yof7qmrp6cgxhqver7yimvmgj7dujqu4l7cnzbpjksfd@5sp7am47gigw>
 <8afff048-4fe1-440a-9739-e5a5ea43d6eb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8afff048-4fe1-440a-9739-e5a5ea43d6eb@kernel.org>

On Mon, Oct 13, 2025 at 04:54:13PM -0600, Khalid Aziz wrote:
> > @@ -703,20 +705,15 @@ static int pxamci_probe(struct platform_device *pdev)
> >   	platform_set_drvdata(pdev, mmc);
> > -	host->dma_chan_rx = dma_request_chan(dev, "rx");
> > -	if (IS_ERR(host->dma_chan_rx)) {
> > -		host->dma_chan_rx = NULL;
> > +	host->dma_chan_rx = devm_dma_request_chan(dev, "rx");
> > +	if (IS_ERR(host->dma_chan_rx))
> >   		return dev_err_probe(dev, PTR_ERR(host->dma_chan_rx),
> >   				     "unable to request rx dma channel\n");
> > -	}
> > -	host->dma_chan_tx = dma_request_chan(dev, "tx");
> > -	if (IS_ERR(host->dma_chan_tx)) {
> > -		dev_err(dev, "unable to request tx dma channel\n");
> > -		ret = PTR_ERR(host->dma_chan_tx);
> > -		host->dma_chan_tx = NULL;
> > -		goto out;
> > -	}
> > +	host->dma_chan_tx = devm_dma_request_chan(dev, "tx");
> > +	if (IS_ERR(host->dma_chan_tx))
> > +		return dev_err_probe(dev, PTR_ERR(host->dma_chan_tx),
> > +				     "unable to request tx dma channel\n");
> 
> We should still release DMA rx channel before returning here.
> 
> >   	if (host->pdata) {
> >   		host->detect_delay_ms = host->pdata->detect_delay_ms;
> > @@ -724,25 +721,21 @@ static int pxamci_probe(struct platform_device *pdev)
> >   		host->power = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
> >   		if (IS_ERR(host->power)) {
> >   			ret = PTR_ERR(host->power);
> > -			dev_err(dev, "Failed requesting gpio_power\n");
> > -			goto out;
> > +			return dev_err_probe(dev, ret, "Failed requesting gpio_power\n");
> 
> Don't we need to release DMA Rx and Tx channels before we return from here?
> 
> >   		}
> >   		/* FIXME: should we pass detection delay to debounce? */
> >   		ret = mmc_gpiod_request_cd(mmc, "cd", 0, false, 0);
> > -		if (ret && ret != -ENOENT) {
> > -			dev_err(dev, "Failed requesting gpio_cd\n");
> > -			goto out;
> > -		}
> > +		if (ret && ret != -ENOENT)
> > +			return dev_err_probe(dev, ret, "Failed requesting gpio_cd\n");
> 
> Same here
> 
> >   		if (!host->pdata->gpio_card_ro_invert)
> >   			mmc->caps2 |= MMC_CAP2_RO_ACTIVE_HIGH;
> >   		ret = mmc_gpiod_request_ro(mmc, "wp", 0, 0);
> > -		if (ret && ret != -ENOENT) {
> > -			dev_err(dev, "Failed requesting gpio_ro\n");
> > -			goto out;
> > -		}
> > +		if (ret && ret != -ENOENT)
> > +			return dev_err_probe(dev, ret, "Failed requesting gpio_ro\n");
> 
> and here.
> 
> Looking at Documentation/driver-api/driver-model/devres.rst,
> dma_request_chan() is not devres managed interface and thus will not be
> released automatically. Do you agree?
> 

The patch changes dma_request_chan() to devm_dma_request_chan().

regards,
dan carpenter

