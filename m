Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC0127057C
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755497746; cv=none; b=FKaIlIAf2nFuU9xzYdxZFMqho3UW1vlh+ia/qozJr5eSzJpbC6xh3QyfaaHcjQrk3RY4jh1ZttH5bx9HeI3DnRXx8MS0GJ5G0ukTXBzsp1RdPfHQgiAciK9wS+/kz6az8M0h0pI58Do3fpmAnWijdiWGX16Pv8bKJ0P/798rAgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755497746; c=relaxed/simple;
	bh=MYHptY7qVMdCeYExxbFTjOvHEMfmgG75pzPebFLBE6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIr7/l7qz188to2qIeWjsL98fGXdbuh/b85JtI51s35tP15HArxc5tsz/0wtvMXhxS7ljrObzbTWoL2m/QDxPSPY8HK+AOEGLMmSAZfOHoXUVWQBRn1luQ/RDwuknTGL4lGpcu5CSmhk4UivIZdaW1p1dZ8iC5HSQ/r90jewtsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXDZ6VlU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXDZ6VlU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso2499218f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 17 Aug 2025 23:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755497743; x=1756102543; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+PSsAQl2WRt5OEtha/zrB/DgNNONu4LNMZgefW2fQN0=;
        b=kXDZ6VlURclVz+l4gz/uIbIp8QN55CLoFsGHvbATYLeuX5v2G1Oo0kL1H0af4cBthc
         tg7nq4tgyLAgXf/UlXA7SdoMA3doiJJMPn1hfwY7gWuw65H6klpjddDzoMzIi0WCmrBt
         SoCDxrg+90yzBs5aMBmOHD812FF2VebJ712TnEnnjKD/PWO312IncAQ8I21M33u/dt1u
         d+TqMjw6BQgjgSmUdEwzbqYfbgneu7wT3QVZ0OTJnIg+LIoh6wm/NRqY8nTbsenvv8Jd
         NOTfO9OY3RTcgnLs0qjufeY6rEYLT4FgPLHhEYPgFgmoeoidoqGGejSLtR1WP91CvLEp
         /SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755497743; x=1756102543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PSsAQl2WRt5OEtha/zrB/DgNNONu4LNMZgefW2fQN0=;
        b=k98l1U5XsRpyjZX+UAHLoIgBPkMrRxgHEJquLkYJSXPJFLGzTPIK9truStpmxZptuE
         cknWegM/fO3ZJaI3jDcVOE2o7AvSJCmKEo3SiJx9MOsWSACYTAQwDWK+imdBfdFpRt1t
         npG5XP6oZXq5lBkxKRYmrjR5pbHmcarDR2YWI3eikAAzRUnlrmKzbwYezSyQFjDWkZPT
         jyASd+iiwsWRqG+FRTZ4MrHTELXlTyZAfDXJYUp7eXSjYET3UepyrE+zkKeFZQJblV94
         LX8tob0jLfZQf7xKkX0eErlscgkORpc8XFsfb2LDWUmIPg+4pTEJ0gqOiD57OJvFMAxl
         FW2g==
X-Forwarded-Encrypted: i=1; AJvYcCX1hbZ+5WAMOXum3LX1QrbJZlBtqgmuvO4VkVrlfRNcfb6+htMlA3qrs595oCTCbgZpCOvaWNLzt/TDXc4sIAeWP5gQrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKcu0Te2acFB2AQZPY5WbUDrB1KxydTeaHe/P+admOAavvK6FM
	8Qqyg6prK4C4wm4vujUVQC3fJ7b02cOi1Hn2gIRYR3pBbA0BSIQX//gCMrBj4uGvpLE=
X-Gm-Gg: ASbGncs9YM3ju2Di7LnEm2HsdltWsWKUdjM2yOOw+m+5XNQfGrp5PKNTGIqbqcHNM/O
	ow2KtVo6PqamQGfFkNkIj1Af0Cvo6Qg3d6zfW8yi8T7LHbYqVhlZgI0Q9sPt08ZX6bQgKFtQXCH
	91CAOVFpsCtRStY4bM2H46pBTAI96kQnGX65ZYADswWJh5MPJk6m4ULy4BCE3UqP9o84/nJIGQB
	bs7QxrcAt3PEr7AsILKylGR3YYg4K0Ztj5VinZJSciLwiYw9s6irNdyAOdiGt5pBjVJkgeB1IPS
	R3aZ07R5hLuHgSx8VM19lJRqzt9r3eWFp/x3jx/v9N6CMIBf3LvJ5G3mCZafOTs9tF2Beid8wwk
	NzdgqXmm73F1XX/60E6JfQH0PtwUc0E9USaVU740mj+c=
X-Google-Smtp-Source: AGHT+IG09uXnf83+BxfTTXuZFbE6IWpXIJALIrxVKeBEh/KVAHcmGhBFx2Xg2Z9xfz9OU41mjepSqQ==
X-Received: by 2002:a5d:5f54:0:b0:3b7:9af4:9c93 with SMTP id ffacd0b85a97d-3bc6a55e8cbmr5720130f8f.35.1755497742661;
        Sun, 17 Aug 2025 23:15:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1ce9758asm155462025e9.15.2025.08.17.23.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:15:42 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:15:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3] staging: media: atomisp: Add lock asserts for various
 functions
Message-ID: <aKLFCjIEEbEUqEXK@stanley.mountain>
References: <20250816170603.41051-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816170603.41051-1-abdelrahmanfekry375@gmail.com>

On Sat, Aug 16, 2025 at 08:06:03PM +0300, Abdelrahman Fekry wrote:
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index be5f37f4a6fd..03067479dd69 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -1447,9 +1447,11 @@ int atomisp_css_input_set_resolution(struct atomisp_sub_device *asd,
>  				     enum atomisp_input_stream_id stream_id,
>  				     struct v4l2_mbus_framefmt *ffmt)
>  {
> +	struct atomisp_device *isp = asd->isp;
>  	struct ia_css_stream_config *s_config =
> -		    &asd->stream_env[stream_id].stream_config;
> +	&asd->stream_env[stream_id].stream_config;

Don't delete this whitespace.

regards,
dan carpenter

