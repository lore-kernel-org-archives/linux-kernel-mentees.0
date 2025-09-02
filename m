Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB7E340D85
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  2 Sep 2025 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756835147; cv=none; b=HFA7BAGi9Gczz3+X3ZyoPNcTSpLcIOiQ9F1DJFLnMju8JqDT4/dP7sljl310FSElET744P8cHz4ejn+BhaF/RwKc8YlVgWQLKCaJ+OwzSrxuOH+v+a92fKwV8xsnuR4JDaqmRPlRtTHugUeKuXYkK6aTFrutYMrbgruDE48E0xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756835147; c=relaxed/simple;
	bh=T1cNLnm6fzB7ytY14KThLj3IRp6/I0MEf6zLS1aqZ10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDHWimw80M4OS3hAXy2xfWzj3r1KhLX/DHnDEhUdMVGI2Ant9Hu02eArlpdXMrGUjsGqFxGgZNSOcrcymP9ajHLgrXmP7LEJTAoHYV4OFtWn9TH8jUlNrr3nZSaMaz94KVr2YV7y5itooPnfcrISelEUNoZaoZ8y03Ty5/2x01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKX9NJ/9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKX9NJ/9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-772301f8a4cso5128866b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 02 Sep 2025 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756835145; x=1757439945; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mLftuepl8Ai11mnJzzF3qo/kXusPLAacbdlidpMXOjM=;
        b=UKX9NJ/90c+4TV7V1Y+lNv9sCFtz5BDx0ck0vIkTDezc0+yaOynHSQj6xVVKgSnY24
         E8htF6NXAFPp1DrIJtG0aO3TP4I0I5Z+webYyeAB/auwQEHHTPci/TaytdxLkEQURIQz
         L8L6gHmaXXnPXpA1vXnKoNiTUsHuX3HWcNEdlx7EqB+c6iZix67H8Ov73xLgqh0a4fo4
         JZ7pHqpDe2kQcTdm1u8LRincnOOlKRBTLo1j0tfuSiYOgg3gF9RA0qgrB7w5y+htLSTf
         zeYWMbuHzqQt2cTN4qV/g1+uowxCCyWghoZ4O4Esn17hrt+QpPvZ6q4LAI9fHemO7IXE
         /Mag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756835145; x=1757439945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLftuepl8Ai11mnJzzF3qo/kXusPLAacbdlidpMXOjM=;
        b=OEeB+Fj8xxxZ1EUYEdWrYr0l9dqLWr7TazYLKatc9+EJ3OTrTgdQ08S+Qfs1IChvVP
         Fmc8LdfFMuVkxruaG8UwrvYzkRRJpsIW5I4QUSFRCx4Q7zzDXmTRpW4iHrWYGuJqAbDq
         +frwZmpPuvlepxFFCgRwCFvNOAl/3/oZ1/InMVz4eT7VQjvkXnRaPnQx/bqV9eZzmc9e
         pI+626oVlzOH+cr9+8UIiKvKzw+DloFF9QsUYTY/+TBSCziJc1hiKPq0CY0eUPyDXLZh
         DagCxnC9V349znnGvnZzP/UgWZWKeC93KeOnCKls6g/CCOjhlF9wNi2vb3fyZVZx+IpA
         VlhA==
X-Forwarded-Encrypted: i=1; AJvYcCV/7ZZjaGmpHiiJsQIVhs5WElnj3jo0BtmRaQdKdCiRjtcGDC6igZW3UIXDAM7zFgJd7Cdub0aGbVc7HxkQWwysYByJGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUchLw9fHzqRa65g509SZNhqaOiU7mlpHdw9Y0u49KcDpXH5G+
	j7bgpeYF+jXBwwa+magViuJEHNj8KOoG6zm7M5b+dgHcyyeg1lzrKdtc
X-Gm-Gg: ASbGnctpWCLUL2FkCn06m/QOGzJ/GU5PJyQnGLxkG6iUlhonS97F8BuEJNGGiM00sgH
	BkImD5WYB2pyfrVoGITBFk6nRXxlPcVOo6voc+OIeeZRhryAdN+M1kUzqU3fanV7sWaABCbMZbM
	em6S1rUSho2RZ5NJlKFK/9U1NbjC2P0jkK0YF66FaO6PNcIC3N+pXnGueWaRE+McyykehnU6xSp
	6cHKxvu1q6IQb/36n7mZ0pnuIoNgXL+rjrTIsV6RAYc4LP2kdLju54xlmYrrNTWVGVfs5xYJSyz
	X9Tzeyga/mpYFSDSlMKixP/BcV1YnxfQ49w5viGiUkh23rh1afZdHwo5/vzBfUOXMhEn67gA9Jt
	3WmTT7FYjdD+Iujq27uqrAG+SGsKjik3jXn/qHLE=
X-Google-Smtp-Source: AGHT+IHraZscRDQf4h1fjj89O4jtpkvZmFKpvnnflKmKHVlG1h1oO0o54pzOpCTebqJtHo6A7gyQVw==
X-Received: by 2002:a05:6a20:258f:b0:240:1241:5f2c with SMTP id adf61e73a8af0-243d6dd13dfmr20064959637.10.1756835144876;
        Tue, 02 Sep 2025 10:45:44 -0700 (PDT)
Received: from Terra ([2001:df0:b240:6cbd:e842:2f6a:96d:9188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm8154759b3a.40.2025.09.02.10.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 10:45:44 -0700 (PDT)
Date: Tue, 2 Sep 2025 23:15:39 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: tzimmermann@suse.de, skhan@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	simona@ffwll.ch, mripard@kernel.org
Subject: Re: [PATCH v4 RESEND] drm: Replace the deprecated DRM_* logging
 macros in gem helper files
Message-ID: <aLctQ5pbI5vITf0S@Terra>
References: <aLcGnf_wrY5QuZZC@Terra>
 <6a5cc1e0-ea0a-4d7f-8834-20a371346d79@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a5cc1e0-ea0a-4d7f-8834-20a371346d79@intel.com>

On Tue, Sep 02, 2025 at 05:35:48PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/2/2025 5:00 PM, Athul Raj Kollareth wrote:
> > Replace the DRM_* logging macros used in gem helper files with the
> > appropriate ones specified in /include/drm/drm_print.h.
> > 
> > Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> > ---
> > Changes in v4:
> >     - Some codestyle corrections.
> >     - Remove OOM error logging in drm_gem_init().
> > 
> > Changes in v3:
> >     - Revert all changes to drm_gem_objects_lookup().
> >     - Use drm_device from minor.
> > 
> > Changes in v2:
> >     - Change drm_gem_objects_lookup() to take a drm_device* argument.
> >     - Make appropriate changes to all calls of drm_gem_objects_lookup().
> > ---
> >  drivers/gpu/drm/drm_gem.c            | 13 +++++++------
> >  drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
> >  2 files changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 4a89b6acb6af..dc3d6cfa692b 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -102,7 +102,6 @@ drm_gem_init(struct drm_device *dev)
> >  	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
> >  					  GFP_KERNEL);
> >  	if (!vma_offset_manager) {
> > -		DRM_ERROR("out of memory\n");
> >  		return -ENOMEM;
> >  	}
> 
> nit: you can now remove { }, didn't checkpatch.pl complain?
No, it did not.
> >  
> > @@ -783,9 +782,10 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
> >  int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >  			   int count, struct drm_gem_object ***objs_out)
> >  {
> > -	int ret;
> > -	u32 *handles;
> > +	struct drm_device *dev = filp->minor->dev;
> >  	struct drm_gem_object **objs;
> > +	u32 *handles;
> > +	int ret;
> >  
> >  	if (!count)
> >  		return 0;
> > @@ -805,7 +805,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >  
> >  	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
> >  		ret = -EFAULT;
> > -		DRM_DEBUG("Failed to copy in GEM handles\n");
> > +		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
> >  		goto out;
> >  	}
> >  
> > @@ -853,12 +853,13 @@ EXPORT_SYMBOL(drm_gem_object_lookup);
> >  long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
> >  				    bool wait_all, unsigned long timeout)
> >  {
> > -	long ret;
> > +	struct drm_device *dev = filep->minor->dev;
> >  	struct drm_gem_object *obj;
> > +	long ret;
> >  
> >  	obj = drm_gem_object_lookup(filep, handle);
> >  	if (!obj) {
> > -		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> > +		drm_dbg_core(dev, "Failed to look up GEM BO %d\n", handle);
> >  		return -EINVAL;
> >  	}
> >  
> > diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> > index 4f0320df858f..a507cf517015 100644
> > --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> > @@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
> >  
> >  	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
> >  	if (ret) {
> > -		DRM_ERROR("Failed to vmap PRIME buffer\n");
> > +		drm_err(dev, "Failed to vmap PRIME buffer\n");
> >  		return ERR_PTR(ret);
> >  	}
> >  
> 
> otherwise LGTM, so with nit fixed:
> 
> 	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> but you still need someone else to merge it
> 
Thank you, I will fix it and hopefully get someone to merge it.

Best regards,
Athul
