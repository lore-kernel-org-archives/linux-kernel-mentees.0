Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847ECC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 15:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D0561038
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 15:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21D0561038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43B140149;
	Fri, 13 Aug 2021 15:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9uySSIXWt9c6; Fri, 13 Aug 2021 15:49:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ADD1A4052F;
	Fri, 13 Aug 2021 15:49:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E5D6C0010;
	Fri, 13 Aug 2021 15:49:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD9E9C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 15:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99B4940285
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 15:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zEuwG9vEKXNy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 15:49:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BC3F40225
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 15:49:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so9987568wms.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ztLJ/Z+w/7lJ5b/Gbdd/xzcgAKq8QbJW4xzGVnxKtmU=;
 b=VLZcmBZFpeecdhW43NS93mX0TUmD4RRZFXTte21P4ljJ+Z7SqAEHsmih2/viWCa1GP
 XVqRC/eooDWii6hMe82zSBMDH6wlIfLabTRJlHlFKI61nAn+zF70v7+G5m/naoRvhdK+
 5gFnIMW2IYCWa7XmwgHY22kW4jd9UYnpwT7M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ztLJ/Z+w/7lJ5b/Gbdd/xzcgAKq8QbJW4xzGVnxKtmU=;
 b=c+GnoRHE1VOwssFpW/0jQT6L0L1efOBjdDs0370gJzhEXKVFztsPW2E++07NSn8s1r
 c0IXAVaXiGwqOAek8Ic6O8OVE1XIjgSgAz2rP49H6GQtzG9Z1yclYfgaq54qYzrLFXUe
 +fiQ8USWtQ6WPIppyIduOJQnMhnRMJMVdyE0HQPvSOWeWTVel5EsLz+BcroeauIfZ4Bi
 AMvKnzeZdMbQUZvNj06Y7rl4UVNKd/gdnZX9ritVfzQg8BJaOo6teOheA4YrJnwhn2tw
 9Zd+CPpeZz6ynODL9VOYgW74sp6Qi3SY7/byGe+GO2d9A58x9jXt6lTZTImI7zU8xz7G
 rhbg==
X-Gm-Message-State: AOAM5321tep9vLPAg4BUpgbZGyh20OIE+Mu1nxmyyEenaYhx7xbqm6HZ
 MJX1mao4TJKfADvW+L3Bp/920Q==
X-Google-Smtp-Source: ABdhPJxgv00YCCMnsEDstzGiimNG6Hq0UjsyzTqm4ij09dB+S3kQni5KbAi2iQDrwWKxyWK0S6/YUA==
X-Received: by 2002:a1c:27c2:: with SMTP id n185mr3213014wmn.20.1628869757778; 
 Fri, 13 Aug 2021 08:49:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l38sm1699851wmp.15.2021.08.13.08.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:49:16 -0700 (PDT)
Date: Fri, 13 Aug 2021 17:49:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 1/2] drm: avoid races with modesetting rights
Message-ID: <YRaUetPzT5EKaZkf@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210813085450.32494-1-desmondcheongzx@gmail.com>
 <20210813085450.32494-2-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210813085450.32494-2-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: tzimmermann@suse.de, Daniel Vetter <daniel.vetter@ffwll.ch>,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
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

On Fri, Aug 13, 2021 at 04:54:49PM +0800, Desmond Cheong Zhi Xi wrote:
> In drm_client_modeset.c and drm_fb_helper.c,
> drm_master_internal_{acquire,release} are used to avoid races with DRM
> userspace. These functions hold onto drm_device.master_mutex while
> committing, and bail if there's already a master.
> 
> However, ioctls can still race between themselves. A
> time-of-check-to-time-of-use error can occur if an ioctl that changes
> the modeset has its rights revoked after it validates its permissions,
> but before it completes.
> 
> There are three ioctls that can affect modesetting permissions:
> 
> - DROP_MASTER ioctl removes rights for a master and its leases
> 
> - REVOKE_LEASE ioctl revokes rights for a specific lease
> 
> - SET_MASTER ioctl sets the device master if the master role hasn't
> been acquired yet
> 
> All these races can be avoided by introducing an SRCU that acts as a
> barrier for ioctls that can change modesetting permissions. Processes
> that perform modesetting should hold a read lock on the new
> drm_device.master_barrier_srcu, and ioctls that change these
> permissions should call synchronize_srcu before returning.
> 
> This ensures that any process that might have seen old permissions are
> flushed out before DROP_MASTER/REVOKE_LEASE/SET_MASTER ioctls return
> to userspace.
> 
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

This looks pretty solid, but I think there's one gap where we can still
race. Scenario.

Process A has a drm fd with master rights and two threads:
- thread 1 does a long-running display operation (like a modeset or
  whatever)
- thread 2 does a drop-master

Then we start a new process B, which acquires master in drm_open (there is
no other one left). This is like setmaster ioctl, but your
DRM_MASTER_FLUSH bit doesn't work there.

The other thing is that for modeset stuff (which this all is) srcu is
probably massive overkill, and a simple rwsem should be good enough too.
Maybe even better, since the rwsem guarantees that no new reader can start
once you try to acquire the write side.

Finally, and this is a bit a bikeshed: I don't like much how
DRM_MASTER_FLUSH leaks the need of these very few places into the very
core drm_ioctl function. One idea I had was to use task_work in a special
function, roughly

void master_flush()
{
	down_write(master_rwsem);
	up_write(master_rwms);
}
void drm_master_flush()
{
	init_task_work(fpriv->master_flush_work, master_flush)
	task_work_add(fpriv->master_flush_work);
	/* if task_work_add fails we're exiting, at which point the lack
	 * of master flush doesn't matter);
}

And maybe put a comment above the function explaining why and how this
works.

We could even do a drm_master_unlock_and_flush helper, since that's really
what everyone wants, and it would make it very clear which master state
changes need this flush. Instead of setting a flag bit in an ioctl table
very far away ...

Thoughts?
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c           | 17 ++++++++++++++---
>  drivers/gpu/drm/drm_client_modeset.c | 10 ++++++----
>  drivers/gpu/drm/drm_drv.c            |  2 ++
>  drivers/gpu/drm/drm_fb_helper.c      | 20 ++++++++++++--------
>  drivers/gpu/drm/drm_internal.h       |  5 +++--
>  drivers/gpu/drm/drm_ioctl.c          | 25 +++++++++++++++++++++----
>  include/drm/drm_device.h             | 11 +++++++++++
>  include/drm/drm_ioctl.h              |  7 +++++++
>  8 files changed, 76 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 60a6b21474b1..004506608e76 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -29,6 +29,7 @@
>   */
>  
>  #include <linux/slab.h>
> +#include <linux/srcu.h>
>  
>  #include <drm/drm_auth.h>
>  #include <drm/drm_drv.h>
> @@ -448,21 +449,31 @@ void drm_master_put(struct drm_master **master)
>  EXPORT_SYMBOL(drm_master_put);
>  
>  /* Used by drm_client and drm_fb_helper */
> -bool drm_master_internal_acquire(struct drm_device *dev)
> +bool drm_master_internal_acquire(struct drm_device *dev, int *idx)
>  {
> +	*idx = srcu_read_lock(&dev->master_barrier_srcu);
> +
>  	mutex_lock(&dev->master_mutex);
>  	if (dev->master) {
>  		mutex_unlock(&dev->master_mutex);
> +		srcu_read_unlock(&dev->master_barrier_srcu, *idx);
>  		return false;
>  	}
> +	mutex_unlock(&dev->master_mutex);
>  
>  	return true;
>  }
>  EXPORT_SYMBOL(drm_master_internal_acquire);
>  
>  /* Used by drm_client and drm_fb_helper */
> -void drm_master_internal_release(struct drm_device *dev)
> +void drm_master_internal_release(struct drm_device *dev, int idx)
>  {
> -	mutex_unlock(&dev->master_mutex);
> +	srcu_read_unlock(&dev->master_barrier_srcu, idx);
>  }
>  EXPORT_SYMBOL(drm_master_internal_release);
> +
> +/* Used by drm_ioctl */
> +void drm_master_flush(struct drm_device *dev)
> +{
> +	synchronize_srcu(&dev->master_barrier_srcu);
> +}
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index ced09c7c06f9..9885f36f71b7 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -1165,13 +1165,14 @@ int drm_client_modeset_commit(struct drm_client_dev *client)
>  {
>  	struct drm_device *dev = client->dev;
>  	int ret;
> +	int idx;
>  
> -	if (!drm_master_internal_acquire(dev))
> +	if (!drm_master_internal_acquire(dev, &idx))
>  		return -EBUSY;
>  
>  	ret = drm_client_modeset_commit_locked(client);
>  
> -	drm_master_internal_release(dev);
> +	drm_master_internal_release(dev, idx);
>  
>  	return ret;
>  }
> @@ -1215,8 +1216,9 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>  {
>  	struct drm_device *dev = client->dev;
>  	int ret = 0;
> +	int idx;
>  
> -	if (!drm_master_internal_acquire(dev))
> +	if (!drm_master_internal_acquire(dev, &idx))
>  		return -EBUSY;
>  
>  	mutex_lock(&client->modeset_mutex);
> @@ -1226,7 +1228,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>  		drm_client_modeset_dpms_legacy(client, mode);
>  	mutex_unlock(&client->modeset_mutex);
>  
> -	drm_master_internal_release(dev);
> +	drm_master_internal_release(dev, idx);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7a5097467ba5..c313f0674db3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -574,6 +574,7 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  	mutex_destroy(&dev->clientlist_mutex);
>  	mutex_destroy(&dev->filelist_mutex);
>  	mutex_destroy(&dev->struct_mutex);
> +	cleanup_srcu_struct(&dev->master_barrier_srcu);
>  	drm_legacy_destroy_members(dev);
>  }
>  
> @@ -612,6 +613,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> +	init_srcu_struct(&dev->master_barrier_srcu);
>  
>  	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 3ab078321045..0d594bc15f18 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1116,13 +1116,14 @@ int drm_fb_helper_setcmap(struct fb_cmap *cmap, struct fb_info *info)
>  	struct drm_fb_helper *fb_helper = info->par;
>  	struct drm_device *dev = fb_helper->dev;
>  	int ret;
> +	int idx;
>  
>  	if (oops_in_progress)
>  		return -EBUSY;
>  
>  	mutex_lock(&fb_helper->lock);
>  
> -	if (!drm_master_internal_acquire(dev)) {
> +	if (!drm_master_internal_acquire(dev, &idx)) {
>  		ret = -EBUSY;
>  		goto unlock;
>  	}
> @@ -1136,7 +1137,7 @@ int drm_fb_helper_setcmap(struct fb_cmap *cmap, struct fb_info *info)
>  		ret = setcmap_legacy(cmap, info);
>  	mutex_unlock(&fb_helper->client.modeset_mutex);
>  
> -	drm_master_internal_release(dev);
> +	drm_master_internal_release(dev, idx);
>  unlock:
>  	mutex_unlock(&fb_helper->lock);
>  
> @@ -1160,9 +1161,10 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
>  	struct drm_device *dev = fb_helper->dev;
>  	struct drm_crtc *crtc;
>  	int ret = 0;
> +	int idx;
>  
>  	mutex_lock(&fb_helper->lock);
> -	if (!drm_master_internal_acquire(dev)) {
> +	if (!drm_master_internal_acquire(dev, &idx)) {
>  		ret = -EBUSY;
>  		goto unlock;
>  	}
> @@ -1204,7 +1206,7 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
>  		ret = -ENOTTY;
>  	}
>  
> -	drm_master_internal_release(dev);
> +	drm_master_internal_release(dev, idx);
>  unlock:
>  	mutex_unlock(&fb_helper->lock);
>  	return ret;
> @@ -1474,12 +1476,13 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
>  	struct drm_fb_helper *fb_helper = info->par;
>  	struct drm_device *dev = fb_helper->dev;
>  	int ret;
> +	int idx;
>  
>  	if (oops_in_progress)
>  		return -EBUSY;
>  
>  	mutex_lock(&fb_helper->lock);
> -	if (!drm_master_internal_acquire(dev)) {
> +	if (!drm_master_internal_acquire(dev, &idx)) {
>  		ret = -EBUSY;
>  		goto unlock;
>  	}
> @@ -1489,7 +1492,7 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
>  	else
>  		ret = pan_display_legacy(var, info);
>  
> -	drm_master_internal_release(dev);
> +	drm_master_internal_release(dev, idx);
>  unlock:
>  	mutex_unlock(&fb_helper->lock);
>  
> @@ -1948,6 +1951,7 @@ EXPORT_SYMBOL(drm_fb_helper_initial_config);
>  int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>  {
>  	int err = 0;
> +	int idx;
>  
>  	if (!drm_fbdev_emulation || !fb_helper)
>  		return 0;
> @@ -1959,13 +1963,13 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>  		return err;
>  	}
>  
> -	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
> +	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev, &idx)) {
>  		fb_helper->delayed_hotplug = true;
>  		mutex_unlock(&fb_helper->lock);
>  		return err;
>  	}
>  
> -	drm_master_internal_release(fb_helper->dev);
> +	drm_master_internal_release(fb_helper->dev, idx);
>  
>  	drm_dbg_kms(fb_helper->dev, "\n");
>  
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 17f3548c8ed2..578fd2769913 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -142,8 +142,9 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  			 struct drm_file *file_priv);
>  int drm_master_open(struct drm_file *file_priv);
>  void drm_master_release(struct drm_file *file_priv);
> -bool drm_master_internal_acquire(struct drm_device *dev);
> -void drm_master_internal_release(struct drm_device *dev);
> +bool drm_master_internal_acquire(struct drm_device *dev, int *idx);
> +void drm_master_internal_release(struct drm_device *dev, int idx);
> +void drm_master_flush(struct drm_device *dev);
>  
>  /* drm_sysfs.c */
>  extern struct class *drm_class;
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index be4a52dc4d6f..eb4ec3fab7d1 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -600,8 +600,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_legacy_setsareactx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_legacy_getsareactx, DRM_AUTH),
>  
> -	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, 0),
> -	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, 0),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl,
> +		      DRM_MASTER_FLUSH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl,
> +		      DRM_MASTER_FLUSH),
>  
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_legacy_addctx, DRM_AUTH|DRM_ROOT_ONLY),
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_legacy_rmctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> @@ -722,7 +724,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
> -	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl,
> +		      DRM_MASTER | DRM_MASTER_FLUSH),
>  };
>  
>  #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
> @@ -781,13 +784,17 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>  	struct drm_file *file_priv = file->private_data;
>  	struct drm_device *dev = file_priv->minor->dev;
>  	int retcode;
> +	int idx;
>  
>  	if (drm_dev_is_unplugged(dev))
>  		return -ENODEV;
>  
> +	if (unlikely(flags & DRM_MASTER))
> +		idx = srcu_read_lock(&dev->master_barrier_srcu);
> +
>  	retcode = drm_ioctl_permit(flags, file_priv);
>  	if (unlikely(retcode))
> -		return retcode;
> +		goto release_master;
>  
>  	/* Enforce sane locking for modern driver ioctls. */
>  	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
> @@ -798,6 +805,16 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>  		retcode = func(dev, kdata, file_priv);
>  		mutex_unlock(&drm_global_mutex);
>  	}
> +
> +release_master:
> +	if (unlikely(flags & DRM_MASTER))
> +		srcu_read_unlock(&dev->master_barrier_srcu, idx);
> +	/* After flushing, processes are guaranteed to see the new master/lease
> +	 * permissions, and any process which might have seen the old
> +	 * permissions is guaranteed to have finished.
> +	 */
> +	if (unlikely(flags & DRM_MASTER_FLUSH))
> +		drm_master_flush(dev);
>  	return retcode;
>  }
>  EXPORT_SYMBOL(drm_ioctl_kernel);
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 604b1d1b2d72..0ac5fdb375f8 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -111,6 +111,17 @@ struct drm_device {
>  	 */
>  	struct drm_master *master;
>  
> +	/**
> +	 * @master_barrier_srcu:
> +	 *
> +	 * Used to synchronize modesetting rights between multiple users. Users
> +	 * that can change the modeset or display state must hold an
> +	 * srcu_read_lock() on @master_barrier_srcu, and ioctls that can change
> +	 * modesetting rights should call synchronize_srcu() before returning
> +	 * to userspace.
> +	 */
> +	struct srcu_struct master_barrier_srcu;
> +
>  	/**
>  	 * @driver_features: per-device driver features
>  	 *
> diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
> index afb27cb6a7bd..13a68cdcea36 100644
> --- a/include/drm/drm_ioctl.h
> +++ b/include/drm/drm_ioctl.h
> @@ -130,6 +130,13 @@ enum drm_ioctl_flags {
>  	 * not set DRM_AUTH because they do not require authentication.
>  	 */
>  	DRM_RENDER_ALLOW	= BIT(5),
> +	/**
> +	 * @DRM_MASTER_FLUSH:
> +	 *
> +	 * This must be set for any ioctl which can change the modesetting
> +	 * permissions for DRM users.
> +	 */
> +	DRM_MASTER_FLUSH	= BIT(6),
>  };
>  
>  /**
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
