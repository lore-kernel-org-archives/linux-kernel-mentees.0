Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1775248883
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705334; cv=none; b=ZqALQxJDVrFFLJwxs3kBOacOCmp8f59h91O3UqPo8z6nwuh1ceARGIuKrvBk0xjVop/gDgiVok2Ex/83JxueKcXK+RqzL8xU1NZdxjn8AkwWgHpYEYQ5nUD/GP8SWZkCp4BHJnbYRlCF7Cs+YQgjnDqXleE7/hpRZKQvLodflZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705334; c=relaxed/simple;
	bh=lw5cb12WTQW5V8LKlGN3d+ABzL6hKt0x7IsEIl0HPdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JG6FJPYwQ1g3wSjyLOQyVcDFqqnAvm6wW7+bfPVE68E56lrZGWVm5jGxBTI5XKK1Vzh8eyXr5N1qmtEyRyXqHbId4dLeO3ng9+cJYtin+MwwBqD6WMTzZAMek/6/rxGegROZ8A6v41k4geM8zhGUhY7hsVaaFVndz9jTjeYhm0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHejTMIu; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHejTMIu"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7833765433cso2589228b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705332; x=1761310132; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vm1q1yJNMMPqej5XCUEQWCVG1hgmSTxZ5v4pBOj1eAo=;
        b=gHejTMIuM58X0KuBzAm+ksHm+bKIS5dR2xVsxL9KuMtrGoeaN2uCN0QUFkoq2WdPLq
         sX5ujnD7j/BGABvVmU14ndw0H2wW9rNUbdS5P9vu2bIvkXbMdG3lJTG5PUFs3AM3rqI2
         3vJuW9R283OBk1mqg8ov/M7uEqhapV8dTWJBCDVY3diTmh9vQQ7oO71AvcmT5U0cGy5A
         KoCg6wkLm5Bx9mC2kORrb6QUCcV7OZz5yVe7rgw2+6N5F17z0ZmhVM6AiPFw+ShAE7kf
         AlXRScNh/hIK0riaAruGD31h38/4qhTy4YYC94zJ6+lqVGzuGvIoXY3oiXKwPa64qAMW
         u5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705332; x=1761310132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vm1q1yJNMMPqej5XCUEQWCVG1hgmSTxZ5v4pBOj1eAo=;
        b=FBx0b9U9DrycJd0cLmLT74ILSrXT/Dx1SGR2QOUAjmZt0MrMTZyYNCD/fY4w25/mSI
         Bdffu3fs59Emz5KPbIZebsjFX9PDfEIRm1cEZ+4VWd0QLINxy5/5a+byMEWkB7ZVkkI2
         IBqpx0G1Wpx6iDBnXpzgdyxrWiYZGCY+CFrY425r9T8FpKudOfqlpv5vmmm/dNZrQrhF
         NLZee2FoWpn+Q/xQ+Wqprj9iPL1XQH9CEcd6s8Kf/hoqPDxq1wgB2AT9G4LgPIc1M4fL
         1lrRkuZrHnW1R6y9/19aVSHBvzDMAb1HMLlFhR4oee7iYGz1cZnh8Da0cSKyz5IlFNzv
         8ITQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyzPVdmV3LA4PVe/oCsJH3IwSgRnzIBa/I2dohB4kuHs/6rGsoHh/aWzVxG8B39MUcf6dMgRbjAwSYM3XxO0iIYiHEUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyY/OlbMWiqifcJo5m5l2PvpuZJm4mqxAut+IHiliR1uC7PY7Id
	+nYHIuENh433bLJS8SonRdg13WOtLrG2/Aljt90ecL0gfYAqk6w1W1KK
X-Gm-Gg: ASbGnctuSivjNa2Nbwsr7h/wr3NMboh4Gfb34e27PdhI3WISKd2dSxjwbb81VIqRvnX
	i+w3xY3Y4VVf1ITkf2LTEXaJHAlrE1K5PRnqUO3idNloMUAFoX+NzB81cug7f2SkRVPEcKbaaDD
	XEJlbls12ZjHru2T8mIJbQR9ZbRUtsrYrtpxTGHL5cG1kBzpqNMIfSP8kAiPTKE7nBrTJ6I0JfV
	/dy296Rd7vMw3PLV57R24MTQZyasaq+iP4gaII46P5JXoYPc3tsHCD+8Btt0F6fWLx23yOii7gH
	CDAk0eSLXdCQ+SbRgflBvLdboBurU6JOfOfUTO+l3QJ1yDVzkdRwQCPhJtFP8dlN4vj8H0iTmin
	DhbY0J9qh8CLUq8m8vf46vSYDQHRRHhYRnEKGhxqM65n76LoXmR51vz+JFLVBfmVr6vFJ6KbsZ5
	oZgvkD+v7AeRF9AUaF/Bv67k0=
X-Google-Smtp-Source: AGHT+IFwTxIM7KbRMRI4pagPw+NiPSPIsNhdBx3JaSyasAkdLl7zRtFXNHdz/QIh6BaZIRnxB4f6nQ==
X-Received: by 2002:a05:6a21:4d17:b0:334:a9f2:558c with SMTP id adf61e73a8af0-334a9f255cemr3877419637.5.1760705332044;
        Fri, 17 Oct 2025 05:48:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b06076bsm6390184b3a.4.2025.10.17.05.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:48:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 17 Oct 2025 05:48:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 1/3] docs/hwmon: Fix broken maxim-ic.com links to
 analog.com
Message-ID: <826742f1-d1b3-49cf-a1d2-5a64d1e58d16@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017105740.17646-2-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017105740.17646-2-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 04:27:16PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Broken redirects fixed to their proper analog.com links.
> Fixes warnings in 'make linkcheckdocs'.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
> ---
>  Documentation/hwmon/jc42.rst     |  6 +++---
>  Documentation/hwmon/max16064.rst |  2 +-
>  Documentation/hwmon/max16065.rst | 16 ++++++++--------
>  Documentation/hwmon/max1619.rst  |  4 ++--
>  Documentation/hwmon/max31790.rst |  4 +++-
>  Documentation/hwmon/max6650.rst  |  8 ++++++--
>  Documentation/hwmon/max8688.rst  |  4 +++-
>  7 files changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/hwmon/jc42.rst b/Documentation/hwmon/jc42.rst
> index 19d10512f6c0..df47a5d265cc 100644
> --- a/Documentation/hwmon/jc42.rst
> +++ b/Documentation/hwmon/jc42.rst
> @@ -5,7 +5,7 @@ Supported chips:
>  
>    * Analog Devices ADT7408
>  
> -    Datasheets:
> +    Datasheet: Publicly available at the Analog Devices website

Please refrain from making such unnecessary changes.

Guenter
