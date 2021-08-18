Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C48C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 10:11:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C2F60524
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 10:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17C2F60524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF7980E19;
	Wed, 18 Aug 2021 10:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMDpTOJvDvUO; Wed, 18 Aug 2021 10:11:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A076080DF0;
	Wed, 18 Aug 2021 10:11:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 807F2C001A;
	Wed, 18 Aug 2021 10:11:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EFD1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E8DF402D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBqTYXdiMxiv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:11:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3D4640186
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:11:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r19so2244587eds.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=H6PUEJyT8yWFOs/eHUeXPFvL6SwbW/T0LWe0T2e8WmE=;
 b=GKjpI8oonPri08s2r40yIS07xBV5kd2Qcb0M+wEuCc48wKNdDQIcz1gsIg0w4AFPZH
 fTpmm7yg9dJmucZ4YwxqzV+MpHC7nNcfaQkUUDSl0ws5L1i10t9UlUGKJQLYp2Mrjnr1
 vXTDxTOZGh7Zh9xS2H8s1TXo6uM0qU+/eBKhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=H6PUEJyT8yWFOs/eHUeXPFvL6SwbW/T0LWe0T2e8WmE=;
 b=d2BPVyPCgdfmf3wlm5Fse4RhM6LC11wxp+ieSKBoO8ZyhmBgybTaBuple0iLRnk3Q3
 ItV/KZI/svpfnAA5ZjyJYYLuyYlMbHPQ19LI31LPv2T6raUW6rkWG2Z98Gm1K4WhreQ5
 ALvxMVwHwaHupeYIhy8GuLr4UR5zoJwLCHLkPU9vDd6+TDSemlPg1JhdA2Sgacju5zvO
 /xozYMeEw/OOhAlxkj/zChC8McFreHGk/IHcRaSc5gg9J5A3Ddv3s58MKZ99xJq+5cpE
 Oc2gQ77VMcd/jiuLBZOBdbEBbZJqsmUsjhSV1lvEoADKCzuFcEuo0zuV+f5qG+cbk9DP
 N05g==
X-Gm-Message-State: AOAM532uW2oVHm+h3zPkB8z8lElxyYx0RVTmDDjBNaulb8hkIZZvEwj4
 k9bLo5muZ2XG7QMT6kRgU1CnGA==
X-Google-Smtp-Source: ABdhPJxpWiWQ18UJm+hCSjJLPLxbcWNd9HkyUYKyAPssMAGCuTk1/N1o8a5V6hH6cJCPXAjYQUffNg==
X-Received: by 2002:a05:6402:b88:: with SMTP id
 cf8mr9311655edb.281.1629281469070; 
 Wed, 18 Aug 2021 03:11:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j22sm1805495ejt.11.2021.08.18.03.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 03:11:08 -0700 (PDT)
Date: Wed, 18 Aug 2021 12:11:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v3 4/9] drm: fix potential null ptr dereferences in
 drm_{auth,ioctl}
Message-ID: <YRzcuiQrLFsWowas@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-5-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-5-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: axboe@kernel.dk, walter-zh.wu@mediatek.com, tzimmermann@suse.de,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 oleg@redhat.com, mripard@kernel.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, sumit.semwal@linaro.org,
 dvyukov@google.com, linux-media@vger.kernel.org
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

On Wed, Aug 18, 2021 at 03:38:19PM +0800, Desmond Cheong Zhi Xi wrote:
> There are three areas where we dereference struct drm_master without
> checking if the pointer is non-NULL.
> 
> 1. drm_getmagic is called from the ioctl_handler. Since
> DRM_IOCTL_GET_MAGIC has no ioctl flags, drm_getmagic is run without
> any check that drm_file.master has been set.
> 
> 2. Similarly, drm_getunique is called from the ioctl_handler, but
> DRM_IOCTL_GET_UNIQUE has no ioctl flags. So there is no guarantee that
> drm_file.master has been set.

I think the above two are impossible, due to the refcounting rules for
struct file.

> 3. drm_master_release can also be called without having a
> drm_file.master set. Here is one error path:
>   drm_open():
>     drm_open_helper():
>       drm_master_open():
>         drm_new_set_master(); <--- returns -ENOMEM,
>                                    drm_file.master not set
>       drm_file_free():
>         drm_master_release(); <--- NULL ptr dereference
>                                    (file_priv->master->magic_map)
> 
> Fix these by checking if the master pointers are NULL before use.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  drivers/gpu/drm/drm_auth.c  | 16 ++++++++++++++--
>  drivers/gpu/drm/drm_ioctl.c |  5 +++++
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index f9267b21556e..b7230604496b 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -95,11 +95,18 @@ EXPORT_SYMBOL(drm_is_current_master);
>  int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>  {
>  	struct drm_auth *auth = data;
> +	struct drm_master *master;
>  	int ret = 0;
>  
>  	mutex_lock(&dev->master_mutex);
> +	master = file_priv->master;
> +	if (!master) {
> +		mutex_unlock(&dev->master_mutex);
> +		return -EINVAL;
> +	}
> +
>  	if (!file_priv->magic) {
> -		ret = idr_alloc(&file_priv->master->magic_map, file_priv,
> +		ret = idr_alloc(&master->magic_map, file_priv,
>  				1, 0, GFP_KERNEL);
>  		if (ret >= 0)
>  			file_priv->magic = ret;
> @@ -355,8 +362,12 @@ void drm_master_release(struct drm_file *file_priv)
>  
>  	mutex_lock(&dev->master_mutex);
>  	master = file_priv->master;
> +
> +	if (!master)
> +		goto unlock;

This is a bit convoluted, since we're in the single-threaded release path
we don't need any locking for file_priv related things. Therefore we can
pull the master check out and just directly return.

But since it's a bit surprising maybe a comment that this can happen when
drm_master_open in drm_open_helper fails?

Another option, and maybe cleaner, would be to move the drm_master_release
from drm_file_free into drm_close_helper. That would be fully symmetrical
and should also fix the bug here?
-Daniel


> +
>  	if (file_priv->magic)
> -		idr_remove(&file_priv->master->magic_map, file_priv->magic);
> +		idr_remove(&master->magic_map, file_priv->magic);
>  
>  	if (!drm_is_current_master_locked(file_priv))
>  		goto out;
> @@ -379,6 +390,7 @@ void drm_master_release(struct drm_file *file_priv)
>  		drm_master_put(&file_priv->master);
>  		spin_unlock(&dev->master_lookup_lock);
>  	}
> +unlock:
>  	mutex_unlock(&dev->master_mutex);
>  }
>  
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 26f3a9ede8fe..4d029d3061d9 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -121,6 +121,11 @@ int drm_getunique(struct drm_device *dev, void *data,
>  
>  	mutex_lock(&dev->master_mutex);
>  	master = file_priv->master;
> +	if (!master) {
> +		mutex_unlock(&dev->master_mutex);
> +		return -EINVAL;
> +	}
> +
>  	if (u->unique_len >= master->unique_len) {
>  		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
>  			mutex_unlock(&dev->master_mutex);
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
