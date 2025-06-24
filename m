Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AF426CE24
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782663; cv=none; b=spEuP8AxnFSqOW7m3pTwZS1xkoi7IBpvelihCJshJE4xwyxzbCNWl9VBExMqNR4TN+C8R3cbHTHhaIIx5Sgjm1Ippx9dXmlk73wYoeDMla1uhvOkfJixMXFIunJPl0aoznVamOLS96kCDwMoesd2cUnQFMWwR7pfkkvHrXi1WHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782663; c=relaxed/simple;
	bh=QcvjBdtjzx4el21ou2AyjFk3PoVeXVF0t0TqhAXdQAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4m+ToIWGp9m9bx5REy4mKjNKOMXK5JBpWcd4ohpFekvN0pPICRGZRhV+uvgMdgyAbyJW6Wwp1bje/WzqUcwQldp5EGeSlaj4IAGTFw9bm9gSs+m12zij5+RJL+tLhhQaeAZdw7EAsUveLgvTYWRWMU7c50AEdOHOd07oVkHL+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e6QjuP2Q; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e6QjuP2Q"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso3425533fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750782660; x=1751387460; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xauWGZibla3a88RvY6yarAsOrTLbYeOTyPsrWKTduDk=;
        b=e6QjuP2Q/0GjNhiG2PaDACaee4Es2bAQH/odw4I+wEBaZhFxIE7azIGtprUAxZhvxt
         KN3OGgDPMAwqFa6g0VMSRJ6KEDp24owcL9S0Ry73EwT/e///8KjSqltIcLHPTkaqaa2z
         oJViSgF0DMB6XhE1iavwd8Fyrdjn8RBBzzH/m9wYp9YIftAnYKorVXfFVll3f4VMhQzp
         l5kESGhfHk3xqsxM9DY6v/o1Fi1kWoKhS+cia9js/5RfO6WhwZOFugxjJ4lTh8yo2LZW
         YTr2L/mSKLhxbIHIkvkrsKQkCMJFZXKW9XvzSV8MO9JLUkOl224CCLBHBF9xrGg8dlen
         +z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782660; x=1751387460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xauWGZibla3a88RvY6yarAsOrTLbYeOTyPsrWKTduDk=;
        b=Wx7Phf8KClk4gVYw81uz9EiDxbBMu8MMdUYD/obXgEt/ZS2cVHFPEKJHtaVpYmQIUY
         JZ3SX2ekO1Kc3di1WhHpkJ7PFkv3Tl6LFBT8ZcrZ+83XQxlqalyobWkgJsiG5lxf1S7t
         7ubPRD5w2MGgapFvJxD4m9AhK/G1tbRnc+k4zIMITAYcXoDE0wxCFl7bopyilmPWmltI
         1NH6NSRfW7AH5MeI/d5LvlCPA5XcsqO016rpbCPOybspTKz3rTWLSSkiZMsUq5DBmSoG
         VrTy48ZWVu4O7uDDgHRumh/EtRJP6clDxlrBw6ATSK1EcTS/qh74oqTCISCYVsRH88s6
         s32A==
X-Forwarded-Encrypted: i=1; AJvYcCWfJrbtM6aRbMIFSH/xi44NlxSsOAF06Wk4gPw4qOhBy4wyAHXx7yRYyVT00FNqUxvbLQtLC2HWJHSLrOnPhs/QW4USFw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+epW9WgOHSJxy8Cr2d8GP6DDzUK8GOTJP9AU83BwHCJZ+oTAT
	nRu5/gDZ8kokaCwFfCfsAcv3c6G+Ts8pFuHLZRdB/XhL6ZEHTt/S3AYk7Us7qIfHKGM=
X-Gm-Gg: ASbGncuv+F/Hw9ihlCDcD4QeAn8eiOyh8y/kMkwz8a981VXsMJohLsAnSe4O9Uj7UsV
	LlbaXgNl/DYy5ZizPxNi6ReYLjOBt9lieDJPlE+OH1ln1peNmig8q4aRwXiWWLgYW0kJjjLuxRj
	GnwxM4OPjdZW/O4LjHZpSbDgPOB7ki3Q7JaNzQx/aSpzoa1Wdnv1VeCfhh1dvXqSNOJwJ1sBc9Y
	BK/4JaKgI9wZE1fg64we+WdJmBngQUCFVMblLEFLgiUo5cYgLn6lPlXYUbb6Ph0lstP22J/hszC
	1eVToMWOXDA7RL3HEwDFHSfqYanRm2LHBnwJSFKD4ZVJDcGCpXj8cCJ46li4UpLsl2vIsqRqzcf
	PhpQ3
X-Google-Smtp-Source: AGHT+IGcNnn1LPrlnNqMBw8pIeYo2YoTiOvJeFOaf225KGbqOfzpC8jSGqoDPVjT+4qvrB73k5LY2g==
X-Received: by 2002:a05:6870:2b14:b0:29e:5dfd:1e17 with SMTP id 586e51a60fabf-2eeee5773e2mr12099997fac.23.1750782660133;
        Tue, 24 Jun 2025 09:31:00 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee664c3cb9sm2167708fac.6.2025.06.24.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:30:59 -0700 (PDT)
Date: Tue, 24 Jun 2025 19:30:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>

On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
>  int hmm_init(void)
>  {
>  	int ret;
> @@ -130,14 +48,6 @@ int hmm_init(void)
>  	 */
>  	dummy_ptr = hmm_alloc(1);
>  
> -	if (!ret) {
> -		ret = sysfs_create_group(&atomisp_dev->kobj,
> -					 atomisp_attribute_group);
> -		if (ret)
> -			dev_err(atomisp_dev,
> -				"%s Failed to create sysfs\n", __func__);
> -	}
> -
>  	return ret;


It's really unclear how this "return ret;" is supposed to work.  Was
that part of the sysfs_create_group()?

>  }
>  
> @@ -145,7 +55,7 @@ void hmm_cleanup(void)
>  {
>  	if (dummy_ptr == mmgr_EXCEPTION)
>  		return;
> -	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
> +
>  

You've introduced two blank lines in a row here.  (checkpatch.pl -f
will complain).

regards,
dan carpenter

>  	/* free dummy memory first */
>  	hmm_free(dummy_ptr);
> -- 
> 2.25.1
> 
