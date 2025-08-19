Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99701DEFD2
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602198; cv=none; b=JTKRWDtF4273M85fuAyFTHJWWeeMyCsnePK+wYvcMRpYN0pWeyaXGTBW3MDRzY02Ebh0pKCVJG/5uLz0Waa0hrpHDTDQVvzwKjbsgBuN9TLRoxILmKGesYQdL0csJZVYJ0e3dY0YmSp7a1edKDjP+skExbXYEBHhmG5nIbhnki0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602198; c=relaxed/simple;
	bh=yd/W/JxE6i2hbi6nQnwBCqzEw9ZZ3YJL/I+7B8U/O/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6IjUVQuMQWb5V2qXHKxdopnjdqL1lLa8U08UEbUQL2kHShNHoDQIVzAbA20Prx290nSwV5fnQD6oqqd4XU3y3yxOCYiB9xPq40dLgVfCsN5xIX3alvQGbDx09gjGuY+BdMG/XL+ByrYUgzyd0RXbR+eXXabvml33AhzMBnqIYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTjKdvdN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTjKdvdN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2445805aa2eso41978705ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755602196; x=1756206996; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HqS3d0NR6IqU3PuzHJ4SMg1Xfpj38gv7VrlQrAk74Y8=;
        b=JTjKdvdNO/khbPlp1zO67An+kKkS7I6VxQtbzbeAXSG4E+sdOsn/DywgvewUVhLqlo
         k+m6zjTtE+wIxahZdQoFyi092oxhM2/FJwvlCGFXU16qPhfkkTFWNheLmYW3bfmNKwns
         kvK92DSG1ApIoP5WBh121iBikQRKb/tSl6ce9LDtePzTTULjDcgdUTEOqR2s621gqdbs
         MGIXyTGaNTP/fWNsVBz9pb35BYXcXXEw8h8oB3waq/EvWfK75UCiqcJzZUoV0MLr2LxY
         OOAoOtr0OoND6SBiwm193s0LZzpKUlLdS3ecKlEwEvXmifcgUHTo9Wsok0H7On71bs8r
         zAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602196; x=1756206996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqS3d0NR6IqU3PuzHJ4SMg1Xfpj38gv7VrlQrAk74Y8=;
        b=M8ytqL2rY5907K/KYSG6hG2V5sxvPDjWUpnU7+tx/Ooa/NdqRhy7MwyYkG+14kyVzM
         qIj9eOlzQ742XLJcygWUWVi6MC0dMqur/GWX/asxEfAnaISBYaTJWhe62FzQZphDC6i4
         NA/nySHpsrqj3bEVY5KOfbltacYbNbx9sOXLLAo8gmmpg4itsFl8/QKGyH9pcI/91xpu
         4ofHBSrIL+bLOvf5hgjF37h+3S4vV5xqAeML+gzAlPfNt8hnld00/e1FhNKD3gkj9HPO
         NaJyWRVNfhseKa1kQP9WlKs+EoB9XHeB2oYzWNV/d72Wta+c6pRBBrAtecfSLljo5FE5
         /bxg==
X-Forwarded-Encrypted: i=1; AJvYcCUjktU3/lBJWGceLErdSHF5fPH+r21HFgX8dW4e4ThJ4ziqabCbMwoUfiaTUkko9MmIsTX7hJUs2VDn23XzG3WkLfrCuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfefFpDQz9xlgj2RzzVf/aRS6lrGDhzmoH+uvDqgEdvrTYyNPl
	2uC5WODLjWHMshoEwc4o2MmF8OuyHQxTiePQKRdIRDB5Si0FnBoOADLZ
X-Gm-Gg: ASbGncsJEKVhQqPdRkPWDWm1tphXm35n9rFWVEiseXrzPJiA+wczksjvb4uCarVY+69
	5BPJ7whYRVA9WwWtiZKLGG/czFPV0r/STK7xh5LvcRmiAQReWw5YGmaXqgsht1Ozj3MEKI05+wV
	+iDgUcKM0bcAAjSgQsO2QHQXGU4ObBPRI69yF4r/xly7uLgpcvG/+Ami7bTxzNF9D/Ybo2h6iYx
	O0WF7axJGBhZf8xjzkN0osRWTYrazrd/rbp9bGeHbF5SLCjQ0JSfE/zqdk8VenQ+33evtnS8yVo
	2QGLXOuVX8ZUhBDBio9FGebOAkWS384KN94D1PJbHPJjmgTaKGEWSuilgzA09wojXlJ0y8Nh5iN
	doIWbZ/+phEUqNdBD8g==
X-Google-Smtp-Source: AGHT+IHSoR+NU5YCpaPXFKS7cE/Fi+7cw3lEoddJGn9NYJrQY0F0AIXAu3Xti0MjWaptmgHCNbj9zg==
X-Received: by 2002:a17:902:db0b:b0:242:460f:e4a2 with SMTP id d9443c01a7336-245e0307277mr24452965ad.23.1755602195872;
        Tue, 19 Aug 2025 04:16:35 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9ef62sm105663305ad.6.2025.08.19.04.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:16:35 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:46:29 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, tzimmermann@suse.de
Cc: tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	simona@ffwll.ch, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] drm: Replace the deprecated DRM_* logging macros in
 gem helper files
Message-ID: <aKRdDRLZIEgZ17Ms@Terra>
References: <f94151b4-893a-4758-a118-153076a20d3c@suse.de>
 <20250818192247.58322-1-krathul3152@gmail.com>
 <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>

On Mon, Aug 18, 2025 at 09:42:46PM +0200, Michal Wajdeczko wrote:
 
 
> On 8/18/2025 9:20 PM, Athul Raj Kollareth wrote:
> > Replace the DRM_* logging macros used in gem helper files with the appropriate
> > ones specified in /include/drm/drm_print.h.
> > 
> > Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> > ---
> > Changes in v2:
> >     - Change drm_gem_objects_lookup() to take a drm_device* argument.
> >     - Make appropriate changes to all calls of drm_gem_objects_lookup().
> > ---
> >  drivers/accel/rocket/rocket_job.c       |  4 ++--
> >  drivers/gpu/drm/drm_gem.c               | 12 +++++++-----
> >  drivers/gpu/drm/drm_gem_dma_helper.c    |  2 +-
> >  drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
> >  drivers/gpu/drm/v3d/v3d_submit.c        |  2 +-
> >  drivers/gpu/drm/vc4/vc4_gem.c           |  2 +-
> >  include/drm/drm_gem.h                   |  5 +++--
> >  7 files changed, 16 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> > index 5d4afd692306..db7c50c9ab90 100644
> > --- a/drivers/accel/rocket/rocket_job.c
> > +++ b/drivers/accel/rocket/rocket_job.c
> > @@ -560,14 +560,14 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
> >  	if (ret)
> >  		goto out_cleanup_job;
> >  
> > -	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->in_bo_handles),
> > +	ret = drm_gem_objects_lookup(dev, file, u64_to_user_ptr(job->in_bo_handles),
> >  				     job->in_bo_handle_count, &rjob->in_bos);
> >  	if (ret)
> >  		goto out_cleanup_job;
> >  
> >  	rjob->in_bo_count = job->in_bo_handle_count;
> >  
> > -	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->out_bo_handles),
> > +	ret = drm_gem_objects_lookup(dev, file, u64_to_user_ptr(job->out_bo_handles),
> >  				     job->out_bo_handle_count, &rjob->out_bos);
> >  	if (ret)
> >  		goto out_cleanup_job;
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 4a89b6acb6af..ee1e5ded6dd6 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
> >  	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
> >  					  GFP_KERNEL);
> >  	if (!vma_offset_manager) {
> > -		DRM_ERROR("out of memory\n");
> > +		drm_err(dev, "out of memory\n");
> >  		return -ENOMEM;
> >  	}
> >  
> > @@ -764,6 +764,7 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
> >  
> >  /**
> >   * drm_gem_objects_lookup - look up GEM objects from an array of handles
> > + * @dev: corresponding drm_device
> >   * @filp: DRM file private date
> >   * @bo_handles: user pointer to array of userspace handle
> >   * @count: size of handle array
> > @@ -780,8 +781,9 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
> >   * failure. 0 is returned on success.
> >   *
> >   */
> > -int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> > -			   int count, struct drm_gem_object ***objs_out)
> > +int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,
> > +			   void __user *bo_handles, int count,
> > +			   struct drm_gem_object ***objs_out)
> >  {
> 
> can't we just use:
> 
> 	struct drm_device *dev = filp->minor->dev;
> 

Ah, yes. I think I can use that. Thank you.

Best regards,
Athul

 
