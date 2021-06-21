Return-Path: <SRS0=0rjs=LP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC78EC4743C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Jun 2021 14:47:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D8BF6109F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Jun 2021 14:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D8BF6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6E23825CA;
	Mon, 21 Jun 2021 14:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oCXwoKeKGBFP; Mon, 21 Jun 2021 14:47:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9C2E681DB2;
	Mon, 21 Jun 2021 14:47:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75A82C000E;
	Mon, 21 Jun 2021 14:47:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D58DC000C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jun 2021 14:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFBDA81DAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jun 2021 14:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mc1JHyyPmluJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jun 2021 14:47:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6100D818C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jun 2021 14:47:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id j10so3925193wms.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jun 2021 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=YEBo064pSywI1ujONVGHoZZKvA4NTzTko1+RKgE7D4g=;
 b=ba2SBCZEyQczhq+VJB5dko7tHajxH0Kr8zPf/FpzXkBcOBOd1+gQdelwkrGRmbmtYt
 IeU/rlUg/x6OAUNNXf8w/mVgNqJBOrxMGH3lD8/wJ/0b7O/9a9YoDsBf+3XDY2J5t9Sc
 xqnXyV8rLXwr3aYu/qn880YNwxTb6P6UHjWCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=YEBo064pSywI1ujONVGHoZZKvA4NTzTko1+RKgE7D4g=;
 b=WfksMSXvHLSSe5LWz8O56299p0A4eElmzm7LNYXoaukC5LJDCrhRDm0e5E1yDcTOi4
 MJzBGB4FXVoQWFA4gQYIxfQ6jl6b816AqQy/QGDBXKDUx1F6dAkAJBTBhzkmDrMhL6q6
 Rq4eMNFHZMB2hbdE4wKSri6aVB02+Csx0fCW0AqHH5mpkwOSB8Ax5UgUzmRqi7OwBPXK
 6F8drw18xAKZyLHHD/m7c3uuHRTom3dqt0RX8zFG387uGrgJQX8T9s38g+4GCWBz8ghg
 tN6Tj36rjad7O7ZSADUeBYVcl+MjOryhKd6nWMJFAq6KFsIo0shuK8M1VkrYjIBeBMVb
 BjFA==
X-Gm-Message-State: AOAM533EbIIHee5rPrj15P8fdWVHaNksVKIw7tMPOTUPtO/bXIeXTIdU
 HNb5FXJmdylsh09Yq12rLpjtCw==
X-Google-Smtp-Source: ABdhPJwx0NURIBc04sBsMiB1Va00uzekc6gUFEM7F1Qh3cnDnwUQz9ga6rpO0g2rcOrcvWMzIRBfMg==
X-Received: by 2002:a1c:df09:: with SMTP id w9mr23599465wmg.91.1624286844131; 
 Mon, 21 Jun 2021 07:47:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c133sm3326560wmf.0.2021.06.21.07.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 07:47:23 -0700 (PDT)
Date: Mon, 21 Jun 2021 16:47:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v3 2/2] drm: protect drm_master pointers in drm_lease.c
Message-ID: <YNCmeYdY8giE8M9b@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 emil.l.velikov@gmail.com
References: <20210620110327.4964-1-desmondcheongzx@gmail.com>
 <20210620110327.4964-3-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210620110327.4964-3-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: tzimmermann@suse.de, airlied@linux.ie,
 Daniel Vetter <daniel.vetter@ffwll.ch>, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-kernel-mentees@lists.linuxfoundation.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Jun 20, 2021 at 07:03:27PM +0800, Desmond Cheong Zhi Xi wrote:
> Currently, direct copies of drm_file->master pointers should be
> protected by drm_device.master_mutex when being dereferenced. This is
> because drm_file->master is not invariant for the lifetime of
> drm_file. If drm_file is not the creator of master, then
> drm_file->is_master is false, and a call to drm_setmaster_ioctl will
> invoke drm_new_set_master, which then allocates a new master for
> drm_file and puts the old master.
> 
> Thus, without holding drm_device.master_mutex, the old value of
> drm_file->master could be freed while it is being used by another
> concurrent process.
> 
> In drm_lease.c, there are multiple instances where drm_file->master is
> accessed and dereferenced while drm_device.master_mutex is not
> held. This makes drm_lease.c vulnerable to use-after-free bugs.
> 
> We address this issue as follows:
> 
> 1. Clarify in the kerneldoc that drm_file->master is protected by
> drm_device.master_mutex.
> 
> 2. Add a new drm_file_get_master() function that calls drm_master_get
> on drm_file->master while holding on to drm_device.master_mutex. Since
> drm_master_get increments the reference count of master, this
> prevents master from being freed until we unreference it with
> drm_master_put.
> 
> 3. In each case where drm_file->master is directly accessed and
> eventually dereferenced in drm_lease.c, we wrap the access in a call
> to the new drm_file_get_master function, then unreference the master
> pointer once we are done using it.
> 
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

I think this approach looks much clearer than the previous. I've found a
few smaller things below still. I think at least ...

Cheers, Daniel

> ---
>  drivers/gpu/drm/drm_auth.c  | 22 ++++++++++++++
>  drivers/gpu/drm/drm_lease.c | 57 ++++++++++++++++++++++++++-----------
>  include/drm/drm_auth.h      |  1 +
>  include/drm/drm_file.h      | 15 ++++++++--
>  4 files changed, 75 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 86d4b72e95cb..0c64a77c67a6 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -384,6 +384,28 @@ struct drm_master *drm_master_get(struct drm_master *master)
>  }
>  EXPORT_SYMBOL(drm_master_get);
>  
> +/**
> + * drm_file_get_master - reference @file_priv->master
> + * @file_priv: DRM file private
> + *
> + * Increments the reference count of @file_priv->master and returns

Does this format correctly? I'd go with "&drm_file.master of @file_priv".

> + * @file_priv->master.
> + *
> + * Master pointers returned from this function should be unreferenced using
> + * drm_master_put().
> + */
> +struct drm_master *drm_file_get_master(struct drm_file *file_priv)
> +{
> +	struct drm_master *master;
> +
> +	mutex_lock(&file_priv->master->dev->master_mutex);
> +	master = drm_master_get(file_priv->master);
> +	mutex_unlock(&file_priv->master->dev->master_mutex);
> +
> +	return master;
> +}
> +EXPORT_SYMBOL(drm_file_get_master);
> +
>  static void drm_master_destroy(struct kref *kref)
>  {
>  	struct drm_master *master = container_of(kref, struct drm_master, refcount);
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index da4f085fc09e..65eab82f8acc 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -107,10 +107,17 @@ static bool _drm_has_leased(struct drm_master *master, int id)
>   */
>  bool _drm_lease_held(struct drm_file *file_priv, int id)
>  {
> +	bool ret;
> +	struct drm_master *master;
> +
>  	if (!file_priv || !file_priv->master)

So here we still have a ->master access outside of the locked code
section. I think the best fix for that would be to move the NULL check
into drm_file_get_master (where we grab the lock already anyway), and
update the kerneldoc to state that it might return NULL.

Same with all the checks for ->master below.

>  		return true;
>  
> -	return _drm_lease_held_master(file_priv->master, id);
> +	master = drm_file_get_master(file_priv);
> +	ret = _drm_lease_held_master(master, id);
> +	drm_master_put(&master);
> +
> +	return ret;
>  }
>  
>  /**
> @@ -132,10 +139,11 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
>  	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
>  		return true;

master->lessor dereferenced outside the lock or without holding a
reference.

>  
> -	master = file_priv->master;
> +	master = drm_file_get_master(file_priv);
>  	mutex_lock(&master->dev->mode_config.idr_mutex);
>  	ret = _drm_lease_held_master(master, id);
>  	mutex_unlock(&master->dev->mode_config.idr_mutex);
> +	drm_master_put(&master);
>  	return ret;
>  }
>  
> @@ -158,7 +166,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>  	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
>  		return crtcs_in;

Same here.

>  
> -	master = file_priv->master;
> +	master = drm_file_get_master(file_priv);
>  	dev = master->dev;
>  
>  	count_in = count_out = 0;
> @@ -177,6 +185,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>  		count_in++;
>  	}
>  	mutex_unlock(&master->dev->mode_config.idr_mutex);
> +	drm_master_put(&master);
>  	return crtcs_out;
>  }
>  
> @@ -490,7 +499,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  	size_t object_count;
>  	int ret = 0;
>  	struct idr leases;
> -	struct drm_master *lessor = lessor_priv->master;
> +	struct drm_master *lessor;
>  	struct drm_master *lessee = NULL;
>  	struct file *lessee_file = NULL;
>  	struct file *lessor_file = lessor_priv->filp;
> @@ -502,12 +511,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	/* Do not allow sub-leases */
> -	if (lessor->lessor) {
> -		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
> -		return -EINVAL;
> -	}
> -
>  	/* need some objects */
>  	if (cl->object_count == 0) {
>  		DRM_DEBUG_LEASE("no objects in lease\n");
> @@ -519,12 +522,22 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> +	lessor = drm_file_get_master(lessor_priv);
> +	/* Do not allow sub-leases */
> +	if (lessor->lessor) {

Here we check after grabbing the reference, so looks correct.

> +		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
> +		ret = -EINVAL;
> +		goto out_lessor;
> +	}
> +
>  	object_count = cl->object_count;
>  
>  	object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
>  			array_size(object_count, sizeof(__u32)));
> -	if (IS_ERR(object_ids))
> -		return PTR_ERR(object_ids);
> +	if (IS_ERR(object_ids)) {
> +		ret = PTR_ERR(object_ids);
> +		goto out_lessor;
> +	}
>  
>  	idr_init(&leases);
>  
> @@ -535,14 +548,15 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  	if (ret) {
>  		DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
>  		idr_destroy(&leases);
> -		return ret;
> +		goto out_lessor;
>  	}
>  
>  	/* Allocate a file descriptor for the lease */
>  	fd = get_unused_fd_flags(cl->flags & (O_CLOEXEC | O_NONBLOCK));
>  	if (fd < 0) {
>  		idr_destroy(&leases);
> -		return fd;
> +		ret = fd;
> +		goto out_lessor;
>  	}
>  
>  	DRM_DEBUG_LEASE("Creating lease\n");
> @@ -578,6 +592,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  	/* Hook up the fd */
>  	fd_install(fd, lessee_file);
>  
> +	drm_master_put(&lessor);
>  	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
>  	return 0;
>  
> @@ -587,6 +602,8 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  out_leases:
>  	put_unused_fd(fd);
>  
> +out_lessor:
> +	drm_master_put(&lessor);
>  	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
>  	return ret;
>  }
> @@ -609,7 +626,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>  	struct drm_mode_list_lessees *arg = data;
>  	__u32 __user *lessee_ids = (__u32 __user *) (uintptr_t) (arg->lessees_ptr);
>  	__u32 count_lessees = arg->count_lessees;
> -	struct drm_master *lessor = lessor_priv->master, *lessee;
> +	struct drm_master *lessor, *lessee;
>  	int count;
>  	int ret = 0;
>  
> @@ -620,6 +637,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> +	lessor = drm_file_get_master(lessor_priv);
>  	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
>  
>  	mutex_lock(&dev->mode_config.idr_mutex);
> @@ -643,6 +661,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>  		arg->count_lessees = count;
>  
>  	mutex_unlock(&dev->mode_config.idr_mutex);
> +	drm_master_put(&lessor);
>  
>  	return ret;
>  }
> @@ -662,7 +681,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>  	struct drm_mode_get_lease *arg = data;
>  	__u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
>  	__u32 count_objects = arg->count_objects;
> -	struct drm_master *lessee = lessee_priv->master;
> +	struct drm_master *lessee;
>  	struct idr *object_idr;
>  	int count;
>  	void *entry;
> @@ -676,6 +695,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> +	lessee = drm_file_get_master(lessee_priv);
>  	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
>  
>  	mutex_lock(&dev->mode_config.idr_mutex);
> @@ -703,6 +723,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>  		arg->count_objects = count;
>  
>  	mutex_unlock(&dev->mode_config.idr_mutex);
> +	drm_master_put(&lessee);
>  
>  	return ret;
>  }
> @@ -721,7 +742,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>  				void *data, struct drm_file *lessor_priv)
>  {
>  	struct drm_mode_revoke_lease *arg = data;
> -	struct drm_master *lessor = lessor_priv->master;
> +	struct drm_master *lessor;
>  	struct drm_master *lessee;
>  	int ret = 0;
>  
> @@ -731,6 +752,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> +	lessor = drm_file_get_master(lessor_priv);
>  	mutex_lock(&dev->mode_config.idr_mutex);
>  
>  	lessee = _drm_find_lessee(lessor, arg->lessee_id);
> @@ -751,6 +773,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>  
>  fail:
>  	mutex_unlock(&dev->mode_config.idr_mutex);
> +	drm_master_put(&lessor);
>  
>  	return ret;
>  }
> diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
> index 6bf8b2b78991..f99d3417f304 100644
> --- a/include/drm/drm_auth.h
> +++ b/include/drm/drm_auth.h
> @@ -107,6 +107,7 @@ struct drm_master {
>  };
>  
>  struct drm_master *drm_master_get(struct drm_master *master);
> +struct drm_master *drm_file_get_master(struct drm_file *file_priv);
>  void drm_master_put(struct drm_master **master);
>  bool drm_is_current_master(struct drm_file *fpriv);
>  
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index b81b3bfb08c8..e9931fca4ab7 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -226,9 +226,18 @@ struct drm_file {
>  	/**
>  	 * @master:
>  	 *
> -	 * Master this node is currently associated with. Only relevant if
> -	 * drm_is_primary_client() returns true. Note that this only
> -	 * matches &drm_device.master if the master is the currently active one.
> +	 * Master this node is currently associated with. Protected by struct
> +	 * &drm_device.master_mutex.
> +	 *
> +	 * Only relevant if drm_is_primary_client() returns true. Note that
> +	 * this only matches &drm_device.master if the master is the currently
> +	 * active one.
> +	 *
> +	 * When obtaining a copy of this pointer, it is recommended to either
> +	 * hold struct &drm_device.master_mutex for the duration of the
> +	 * pointer's use, or to use drm_file_get_master() if struct
> +	 * &drm_device.master_mutex is not currently held and there is no other
> +	 * need to hold it. This prevents @master from being freed during use.
>  	 *
>  	 * See also @authentication and @is_master and the :ref:`section on
>  	 * primary nodes and authentication <drm_primary_node>`.
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
