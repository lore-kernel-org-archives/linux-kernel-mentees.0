Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C923203B5
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701736; cv=none; b=h7PDdbpKvWYPlyiq1fd0TD/PCp5Eo5Kjt2BBJhsLXz7UQToJykBGtw10MYrS38/GtcEakWEFkMsXUzXt4O29vzg9QCMpj6gbFLDBrREHhyWpcF/BB/IDC8RQvpjfYf530XwX+fZjhPBNr8y3tV+pzWQRVURbCPl7GcU1+PG4G8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701736; c=relaxed/simple;
	bh=FqdPPHWyb5z7Q8PiNBhfYnPb8hAOhJOZpHcwbgKE7Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TulB7k5NpVNElzxKYmUmwfBL4ALe2fTqQB73FkSMYU9sI8SCFV+Yrj88r8SZSExilou7WcLlZwblJx7YxgoECbkVZDY7cwr+22jtlNW74+wtgJk1F45n3WXM3kSPvCYBus9dbFHYWhvSqn4MiTDCcBXlNSHaFDaMv972IuTmSJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bo71WtFp; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bo71WtFp"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-321cfa7ad29so854905a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 07:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755701734; x=1756306534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0V2bDIBX6RG9O1tv9XNytM5AkMScDjTGK8YhSMkxjM=;
        b=Bo71WtFpBR1nK6a59jXaWEjc4iXYGOTZMAJqGJxAjPR7slYIiLmxjxmDxILD/hDdbB
         nk1vAAho15dEQyQKS//kZehctI+5WUvd/swJD+7vKFfeMEKSLp8A9FqBdVwT9cUQvekv
         V033+MiZyeHYhUn7R7xAa7eqfcmyFI8TP8l8RLP8TkU4a9ffadb0FmMtjpJ59Klp6KSV
         idLtrBJS0/CrDwoizQH82/9BODKl63IgCkRcOv4/YZ1ncRQ1MjmMVg+BHW8k2qOe2ZsV
         Uq/C8zsP73m932KVa1tVR5d0Py7AXOo+Gvei/DXo4GfZ7iRikXHoixZDK/97Vm6KOqKL
         8YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701734; x=1756306534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0V2bDIBX6RG9O1tv9XNytM5AkMScDjTGK8YhSMkxjM=;
        b=kPpn0ULoVUUwGF4uJgT7qhM5W2Xm06pqYzg5xs05BP7AE/Eq7MYJVmsGczZ57yA+TB
         jKrklgd2mUjdGHCWlXvLOOyXzCUDtzymnO/3Cu0ToFr7zGGpukvzLkdRgYg+GFkCTiGW
         8P25zsDd0pdtnoUxNGAou8LYmRVgieh/y378jqD8W432+28TnIXLVUEZ53K/1GXQ+nuP
         auM/3Jfe/Sy8S2PI61aqdQypq0a0bXBb7T0U9l6ZiitRLL9Xb654x8UMxfZuWvk+YzDg
         NCX4YM9JwN+u69ELZDLmMO+tig6mGcWhdoAWIcxkq0ApGKSN8SloS/PwGIAs/wsA/2uG
         PgcA==
X-Forwarded-Encrypted: i=1; AJvYcCXeFXgd43+SQkc/3Kxuu8nqqaeJOpEH48aXXYCSHISAauL5EorEhlalBU+izundlBfJzwQK6rkfG22Y0Key58fcD8froQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHsL3h7ZUPp0Rq3cTIQN+Ue/qYCWSg5G0DtjAP3SvpEPP7L1Ji
	6iOEokcQnZSVfUZHm0W/ghRKQDis1sTmxWOdM8myg6ThF3lswBX+TgWE
X-Gm-Gg: ASbGnctK5lG62uLkgwwNrj5aRO9Fh8oeOlOPTf8W+52jIZO3WIPVXGsnTY0ACk4sh93
	7oCdw9HCn6d/b/Ze32KqZmyWa/UVKPPlV1DI3opaTOolKRVOcPpILCSMPNoaiXqMdhtt9L8bRyl
	9RlD8bECK6a8H5NVdfsVRuLt4Hv/eI5h8bXscfQMUeZyCx6ZqR+JI3tYkuvoY1FcvwmMjJBaDcU
	De39VGPf4vNo8kpcJ5zVQ4ZoQE4SiV++6F+oizqG85GNqT2QEFdfdrKanvYqf+7y09A7XwQzYaR
	sAMyu16eGnfVildDwnrYjbZJzsACU/l48uTxZZFog3VJlpQRQwMphExwxJ/ZjFV87zT2F8AX9fg
	zQhL2+weItWWLmyuwXg==
X-Google-Smtp-Source: AGHT+IGmg/Cdj77TohGjYD8IlyALQCYhp/tkC4enDj7ZH8cBGpX8QTjsNTkyqiMmliHyuGe6n21pIw==
X-Received: by 2002:a17:90b:1810:b0:31f:252:e765 with SMTP id 98e67ed59e1d1-324e1086f4bmr4174755a91.6.1755701734365;
        Wed, 20 Aug 2025 07:55:34 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e8f20c7dbsm2403650b3a.68.2025.08.20.07.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:55:33 -0700 (PDT)
Date: Wed, 20 Aug 2025 20:25:27 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	simona@ffwll.ch, skhan@linuxfoundation.org, krathul3152@gmail.com
Subject: Re: [PATCH v3] drm: Replace the deprecated DRM_* logging macros in
 gem helper files
Message-ID: <aKXh31C9LGZBgu7Y@Terra>
References: <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>
 <20250819121517.46998-2-krathul3152@gmail.com>
 <a5d58430-1ae7-4b7e-8275-dad09a5c8cae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5d58430-1ae7-4b7e-8275-dad09a5c8cae@intel.com>

On Tue, Aug 19, 2025 at 10:14:30PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 8/19/2025 2:11 PM, Athul Raj Kollareth wrote:
> > Replace the DRM_* logging macros used in gem helper files with the appropriate
> > ones specified in /include/drm/drm_print.h.
> > 
> > Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> > ---
> > Changes in v3:
> >     - Revert all changes to drm_gem_objects_lookup()
> >     - Use drm_device as suggested in [1]. 
> > Changes in v2:
> >     - Change drm_gem_objects_lookup() to take a drm_device* argument.
> >     - Make appropriate changes to all calls of drm_gem_objects_lookup().
> > 
> > [1]
> > https://lore.kernel.org/dri-devel/90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com
> > ---
> >  drivers/gpu/drm/drm_gem.c            | 10 +++++++---
> >  drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 4a89b6acb6af..fbea8c50f17c 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
> >  	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
> >  					  GFP_KERNEL);
> >  	if (!vma_offset_manager) {
> > -		DRM_ERROR("out of memory\n");
> > +		drm_err(dev, "out of memory\n");
> 
> IIRC we shouldn't additionally report OOM errors as there will be
> already lot of messages when we hit this
>

Okay, then I will remove it.

> >  		return -ENOMEM;
> >  	}
> >  
> > @@ -787,6 +787,8 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >  	u32 *handles;
> >  	struct drm_gem_object **objs;
> >  
> 
> remove extra line and please run checkpatch.pl as it should catch that
> 
> also consider declaring variables in reverse-xmas-tree order
> 

Got it, thanks, I'll keep that in mind.

Best regards,
Athul

> > +	struct drm_device *dev = filp->minor->dev;
> > +
> >  	if (!count)
> >  		return 0;
> >  
> > @@ -805,7 +807,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >  
> >  	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
> >  		ret = -EFAULT;
> > -		DRM_DEBUG("Failed to copy in GEM handles\n");
> > +		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
> >  		goto out;
> >  	}
> >  
> > @@ -856,9 +858,11 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
> >  	long ret;
> >  	struct drm_gem_object *obj;
> >  
> 
> ditto
> 
> > +	struct drm_device *dev = filep->minor->dev;
> > +
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
