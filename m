Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BA21FFC41
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752727503; cv=none; b=i721xfDuRzp2fAGP95tsQcapcvPSrKbSgZKN1ZhMBVu60quWZN0v+5LPzOyyoC8OFM0jSgmKp9rzF9p7nLeVQCajbazMTL6uSLmJNiaHDdxCKfBoT5U0MM4yt3rAjp8ruOyb3wRctUM4ZHtnsC9A2yTW0aOXcc3f43SwqwW7ZN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752727503; c=relaxed/simple;
	bh=xYY88o1HZHO/K9meJ92FwNw3WDacmrol27HB7s9lxng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBGlKD9kqghWpU6UtAVgK1d0Z4pWsUt6Ztiu28IH57NOxF1Yu1tNUtPQ5hNM1edxlDfnUm2arQBY018zEIti/dLdQjqI3Ywn69/95Au2tFIKmevS3vaKBCU9FEa3sz3xXeGrg2OtqUGYJd3AYWmVoklqlIUbxLhCYePrGz3byWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKH6FXc+; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKH6FXc+"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73e64e87d49so334565a34.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 21:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752727501; x=1753332301; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8BxFpUzbTga+mXNbGQF0qc8Yea8aD1D/kK9ilcak6H4=;
        b=ZKH6FXc+G8MxUtnZy25jfc9xrvsqhT6BszxnLFxAwgq95JBzyluiJ1mfjZtw/6c1+Z
         YpAe+2y9daxoTjNQXCynJTvEvsqrTGx6HyTcPmRW/SRnmk7eUoo+DeaCvJnA9sDKHjWQ
         dq+y/YW5tP6TEWJsn94gVCEigC0vLPMKbHPm3Drf1PaXfMK2hHggor9eGjRMl9CUpPnH
         IJmtw7hkGd229lNolwxH19ME9vRMAU4NLphnFTwutybdWR6zI/ahaiLKpI1+JWPLwvM5
         NzwwTVAZvrzn1QyrLYrtwSmZdPVBMI/X4Zv0SDxxRVxh53HqPaDEHJhQ5ItC75aBIVvL
         cq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752727501; x=1753332301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BxFpUzbTga+mXNbGQF0qc8Yea8aD1D/kK9ilcak6H4=;
        b=PAig7SLopDTm1eI02HudJRB+0m4Guf6Vro/YEeF1ubr8QijBjQFnATAEiRcaGi9uNA
         593WF+P5E0BxFIlgjT2V6Q8rWJVD4D22B2OCom5y/8uo94mOntaT6bcWMmP7EqrRmc4i
         mpi7CVljBApsD4LN2WDf3iBRCbLVOyW7mIi+DSIBleKWQO211Ei3nDzkhH2JifvLp8Qq
         S/7J9xlMobM3MPgCd4hLdwECUPEUqFxwLgx6hwKMSy/ggcL2/JvFj56chDS5ZBDK1xMO
         GitNw9WA2x6n/mjqdSUa3UuCks89JJ8ScL/p+y37HKxAFWv+1yH0jyKleB0dhEziY0lo
         Yxzw==
X-Forwarded-Encrypted: i=1; AJvYcCUCYE6MHdq4ruMCAwTepLWeyhExnsvzutD80h5cpNvHx9S1YPrWLlqzzNDlzz4hrpkYenr8bSnKv1rdmNz5AojnDyi8iw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwnsh+/6WyjMIVODT2DCeqxdZKUByhbX88G9dMg98uEaoVwDth
	eraf8iVJ87yhxJi/RsELpg5AWfo3OLiU9KGpst0fDC1aPPpmScqyxeS/SEjxF752Y1A=
X-Gm-Gg: ASbGncu5MmyVxQrGhIiRsIMMlORd8/m5LKEOPUudeSYcMS6wdLC24PXqhtsX/YA/vz0
	umghMdTT2saRzPofXg8n0Wp58LENwF1TITRSoJupGObDPA3D+xJiT3I1z8gaKaEpQ9pmue4bHgK
	ldCsWpTkO0ycQUkojsgR7SztmHl2fHipjBkwDYQEFKTlqWgV6n8S/o19959Z7K/9UiEbDGHTigc
	seDbwLu3haoWQ/seaEFTd0ahHuPNFnyQCLr4OBlPXDrTaLaGmD2KUuTKbYEhJmmE8owycuDaxZM
	4zBRITXf8FIlBpU/IYrRvvpgqmES6cKonl4lhoi+EbN9NKUelkVFz3PfSCRjg1U+3zph8OsnnY5
	+pX30Z3oWJ9g7LNJb5F9fvCY3Lj8p
X-Google-Smtp-Source: AGHT+IE+DpDEa75xpbSgyLwwke9OcELJPLIznBHV4EgtqVLoSi+kaH/6b3ycchLcJ6wlacIG2Wojvw==
X-Received: by 2002:a05:6830:71a4:b0:72b:98d9:6b1c with SMTP id 46e09a7af769-73e66604fbcmr4375731a34.21.1752727501133;
        Wed, 16 Jul 2025 21:45:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e776b0dc9sm202888a34.26.2025.07.16.21.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 21:45:00 -0700 (PDT)
Date: Thu, 17 Jul 2025 07:44:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2] staging: media: atomisp: add missing mutex lock in
 atomisp_s_fmt_cap
Message-ID: <06f61db2-da3d-4de0-8ce5-04e135add870@suswa.mountain>
References: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>

On Thu, Jul 17, 2025 at 04:30:03AM +0300, Abdelrahman Fekry wrote:
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index bb8b2f2213b0..d3b8e480065e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/pci.h>
> +#include <linux/cleanup.h>
>  
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-event.h>
> @@ -416,8 +417,15 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
>  			     struct v4l2_format *f)
>  {
>  	struct video_device *vdev = video_devdata(file);
> +	struct atomisp_device *isp = video_get_drvdata(vdev);
> +

Delete this blank line.

> +	int ret;
>  
> -	return atomisp_set_fmt(vdev, f);
> +	scoped_guard(mutex, &isp->mutex)
> +	{
This open curly brace should have gone on the line before:

	scoped_guard(mutex, &isp->mutex) {

But actually just use:

	guard(mutex)(&isp->mutex);

It will hold the lock until the end of the function.

regards,
dan carpenter


> +		ret = atomisp_set_fmt(vdev, f);
> +	}
> +	return ret;
>  }

