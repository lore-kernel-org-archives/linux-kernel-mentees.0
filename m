Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADE520B1EA
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Apr 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315778; cv=none; b=eKnGRZk9KhIns3pqkGhz76qIhDjpwfXNMApYlcrprA7/05/cEC41ZG6gnzdjycywokqbBnpTr5Oaihrq305Y4o28XTku9VTnp/LDGaShI4QAJM0y528953qf8KRmrFPxuE7bdZIFh6bC/vQziIoU4CdVpi3kFOeai3eb/Xxfe1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315778; c=relaxed/simple;
	bh=OaDHdFMJReEzzMzGKjfztjktwikXKwV2jaClKSYlPh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BI0i4gouKrTP9NQbj8Q3X8Q1TKw2FZPS06l82X7Bd9njgbSpmXrHXeprUdlrrREsuQLVo+Gc+7HNUPd0KGWRTy5fk95exyD4kMJaSV8zjMuqj/Pj4grRpX1jcGLyFU4Jdtqh4NIlJ0TxhQcp1pNOqT4uSlxnNfSPmrDIAaln500=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o/kl7RRj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o/kl7RRj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0782d787so35000185e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Apr 2025 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745315773; x=1745920573; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+QO98qmgj2ki6WgHqTR2cADuePWk5fgnSKgzFwIQUw=;
        b=o/kl7RRjo5EDZVTTFVLNzinz1Q667Q6lFcqfTWIxd04OAV6tiw2LZazt+BIDOgC6KZ
         Juvg/cK10D03hl76pfRtShUSK6joao9b3MzPpFnX06z4qHHqB373ia6M1HscjyQ0A82/
         cV/tVKuRaFdtOFTMGnWi0vFtG1WWJEMO8nt2zAmrj4zcnmZs1tDLXhBa2AaeqmJTkPJb
         cGCKoS83PsX4gm3JrPinowbrhQAxzCBL1ed6NN9wvyxvVPR0zeypk+uPkL5cGg4Db3Sy
         zAzdOzrAx0jFUaViF8wY0BStObBS3oRy9w6sPp4Bq+EcEo0kTGtLNxCBv84sIJ81rnz5
         c+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315773; x=1745920573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+QO98qmgj2ki6WgHqTR2cADuePWk5fgnSKgzFwIQUw=;
        b=Oqx7XWVToZlYlYQCQAjTF9tL+UUUgcVGQER0LUZVwyIbm/hlMUqKLHASRUUnm5OMsJ
         zJfSeI7jXKfrx+57hmLqCOgUKamz1wybnc9Sxx1JFaNRno/lAvikpHMZWLOsxBULtPfs
         18k0nC+TfYHqpGMLfTuclHZH09N88l7xTNNnp8TOFuzo6fHlvefytzn8PVDnOEO7P46e
         R9phPHGZzBdfLsbGJLV3x+u8iVIdDIRCl1cTqyKnBMWbqvaa/ZfVVupkflLRqKuBWXGi
         JcBH5jwszHYwqWN6tj9lVE0LzuRUurVKnIxRt21z2Np1MJxIkZCwHFbR0u9LieWyy84H
         mrig==
X-Forwarded-Encrypted: i=1; AJvYcCXjvE1ST83lCiw0wGt+PV1/6+p/HzvIJfISS0V7Vf2gna+MC9WZjkZyNr51IIp3ZK4ktJjyWo2TSqQfPAlGZmhQhf/5cQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw1ESmW1Sy0greJUaBSOSW+iH0w7zAwTmzRT6T5ecI0UJpgeHh
	qtB998/HxSdH0MEi/wxdwHXRCSFxg+P+EalOs6I6TCQ0aKNa0yUMoeFvHAp5j78=
X-Gm-Gg: ASbGnctcW27mqLYSHj4pv0fn5PA9nUsidYKtlhn5NuvMdxXRGEHTvw7vlvp5yO30Ezd
	rWKy7vS241Sc7+L3w2n32a1+niCD5wmhq81Q8L2VK8gpXk13iCsE+nKNGd5fu9D+Ojy+F68vZqx
	oDqUy7P+vYLdQZvNKpuJfDFN+purDYZAQAQLGCXqVGzXKRdLqJOAWzdpSkbwonm7J4+xsN7rEQd
	E1mQwmiH9MvYc82D5lQKqgQdv86pOEID084elnoGqRKPsLxpJ3PMCBjOn53b3CqV0LLrbnrUdfu
	B3GFKpVjx5eCtLwIYplAaZUxjDRS9YToB+Irac74jLKVtg==
X-Google-Smtp-Source: AGHT+IEsd7/SkNcLAUxED4n6XevcQYOpxf2v+BtFf+hSK1o6FW2FhCD6Cwbfwe4yTzK66M4PoWZ8mA==
X-Received: by 2002:a05:600c:190d:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-4406ab67e15mr128331075e9.7.1745315772926;
        Tue, 22 Apr 2025 02:56:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5bbc13sm165298515e9.17.2025.04.22.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:56:12 -0700 (PDT)
Date: Tue, 22 Apr 2025 12:56:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jacobsfeder@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	sergio.paracuellos@gmail.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] axis-fifo:  Remove hardware resets for user errors
Message-ID: <1a34379e-4c41-40ec-99f9-87342c33b45c@stanley.mountain>
References: <20250419004306.669605-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419004306.669605-1-gshahrouzi@gmail.com>

On Fri, Apr 18, 2025 at 08:43:06PM -0400, Gabriel Shahrouzi wrote:
> The axis-fifo driver performs a full hardware reset (via
> reset_ip_core()) in several error paths within the read and write
> functions. This reset flushes both TX and RX FIFOs and resets the
> AXI-Stream links.
> 
> Allow the user to handle the error without causing hardware disruption
> or data loss in other FIFO paths.
> 

I agree with the sentiment behind these changes, but they are basically
impossible to review.  The reset_ip_core() does some magic stuff in the
firmware and I don't have access to that.  How are you testing these
changes?

> Fixes: 4a965c5f89de ("staging: add driver for Xilinx AXI-Stream FIFO v4.1 IP core")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 7540c20090c78..76db29e4d2828 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -393,16 +393,14 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  
>  	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
>  	if (!bytes_available) {
> -		dev_err(fifo->dt_device, "received a packet of length 0 - fifo core will be reset\n");
> -		reset_ip_core(fifo);
> +		dev_err(fifo->dt_device, "received a packet of length 0\n");
>  		ret = -EIO;
>  		goto end_unlock;
>  	}
>  
>  	if (bytes_available > len) {
> -		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu) - fifo core will be reset\n",
> +		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu)\n",
>  			bytes_available, len);
> -		reset_ip_core(fifo);
>  		ret = -EINVAL;
>  		goto end_unlock;
>  	}
> @@ -411,8 +409,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		/* this probably can't happen unless IP
>  		 * registers were previously mishandled
>  		 */
> -		dev_err(fifo->dt_device, "received a packet that isn't word-aligned - fifo core will be reset\n");
> -		reset_ip_core(fifo);
> +		dev_err(fifo->dt_device, "received a packet that isn't word-aligned\n");


The commit message talks about "user errors" but these aren't user
errors so far as I can see.

>  		ret = -EIO;
>  		goto end_unlock;
>  	}
> @@ -433,7 +430,6 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  
>  		if (copy_to_user(buf + copied * sizeof(u32), tmp_buf,
>  				 copy * sizeof(u32))) {
> -			reset_ip_core(fifo);

Yes.  Absolutely.  Delete this.

>  			ret = -EFAULT;
>  			goto end_unlock;
>  		}
> @@ -542,7 +538,6 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  
>  		if (copy_from_user(tmp_buf, buf + copied * sizeof(u32),
>  				   copy * sizeof(u32))) {
> -			reset_ip_core(fifo);

Same.  Delete.

This type of code is often written for a reason.  Potentially as a hack
to paper over a real bug.  And then people get carried away adding resets
all over the place.  It's fine to delete the last two calls but I would
be very careful to delete the others.  Even though the patch might be
correct it needs to be tested very carefully.

regards,
dan carpenter

>  			ret = -EFAULT;
>  			goto end_unlock;
>  		}
> -- 
> 2.43.0
> 
