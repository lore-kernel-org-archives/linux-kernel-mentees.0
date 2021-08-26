Return-Path: <SRS0=MGRu=NR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EB7C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Aug 2021 09:58:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB456610E6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Aug 2021 09:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB456610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76B0C40262;
	Thu, 26 Aug 2021 09:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifwdUuptAhyh; Thu, 26 Aug 2021 09:58:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5160E4014D;
	Thu, 26 Aug 2021 09:58:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34B42C0010;
	Thu, 26 Aug 2021 09:58:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 115EBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 09:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E603B81AD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 09:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TdwEdJWmNN8p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 09:58:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCAE281ABA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 09:58:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u9so4073904wrg.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=K6u0Zu5YEr8y4W3P37RoD4zOuM0xcePf+NAf5fjmYUY=;
 b=OYntDdruYT6QL81TNNqsV14R7lpWMhP5RNvBBtu2FU/YaAjcMa/NOOsp/utPM+YdQo
 iAuUtfEyiPHywQWdOkUzyiLsNGFBqBEh/kpLbm/8ZWRZimxDXWEkTPdStN1CRJyB+2L+
 ess4YxVwDk5SZGgcAAgBLRdOtUeFSgGL2pR80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=K6u0Zu5YEr8y4W3P37RoD4zOuM0xcePf+NAf5fjmYUY=;
 b=G7RmU5tRqnBmWHIzxU3o4qogW+JspJi+ioo0B/dDUaRaivCtcwDtQ4SBHsUdxAhi4T
 M2PL0Qjdv65mo6GUz1p0Qt6tYKC0aVRTNW9Vx1kWbsBDQ8pmt3b+fC0tBiqn4BI6G0XH
 DLrOV05vFhH/sJdcokT5aWg/qYKcPHBkd/ydSquPjAqKgSjw6X2L7btonv2mxlcpqEBw
 EXwWPY1pR7UOfYYpy16WWO1Z9rvDfdI5BU0MnMeRUG/gDb2+J1q3TqJeDmznAr7T9PHE
 LeE9/Azt/fHvSKBE1lF0SSIr8k+pWNHioL0b0AXp3P5s5IkeWz6RB63WIfCpzpKGkWTh
 9Rxg==
X-Gm-Message-State: AOAM5327zhxnlF7JroN/TtTG2kHM/XZswrQ0ZwqhvYHOCbiNP67ueN2u
 8JpuyZCrJM271rII7U6nhDLpig==
X-Google-Smtp-Source: ABdhPJyy1AIu+N6Qrm0z0c8isGbaksnKSxYxmVOligV+SnW4ABRlEHb7NKPuhCyurRIGXrKY/cYmRg==
X-Received: by 2002:adf:b741:: with SMTP id n1mr1668981wre.120.1629971894987; 
 Thu, 26 Aug 2021 02:58:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m4sm7986290wml.28.2021.08.26.02.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:58:14 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:58:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v8 3/7] drm: lock drm_global_mutex earlier in the ioctl
 handler
Message-ID: <YSdltHVQnIr+vkTn@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com,
 tvrtko.ursulin@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-4-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210826020122.1488002-4-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: airlied@linux.ie, joonas.lahtinen@linux.intel.com, jose.souza@intel.com,
 chris@chris-wilson.co.uk, sumit.semwal@linaro.org,
 ville.syrjala@linux.intel.com, linux-graphics-maintainer@vmware.com,
 matthew.auld@intel.com, airlied@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, aditya.swarup@intel.com,
 lucas.demarchi@intel.com, mripard@kernel.org, linaro-mm-sig@lists.linaro.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, andrescj@chromium.org,
 matthew.d.roper@intel.com, tvrtko.ursulin@intel.com,
 dri-devel@lists.freedesktop.org, karthik.b.s@intel.com,
 linux-kernel@vger.kernel.org, manasi.d.navare@intel.com, tzimmermann@suse.de,
 christian.koenig@amd.com, zackr@vmware.com
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

On Thu, Aug 26, 2021 at 10:01:18AM +0800, Desmond Cheong Zhi Xi wrote:
> In a future patch, a read lock on drm_device.master_rwsem is
> held in the ioctl handler before the check for ioctl
> permissions. However, this inverts the lock hierarchy of
> drm_global_mutex --> master_rwsem.
> 
> To avoid this, we do some prep work to grab the drm_global_mutex
> before checking for ioctl permissions.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index d25713b09b80..158629d88319 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -772,19 +772,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>  	if (drm_dev_is_unplugged(dev))
>  		return -ENODEV;
>  
> +	/* Enforce sane locking for modern driver ioctls. */
> +	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))

Maybe have a local bool locked_ioctl for this so it's extremely clear it's
the same condition in both?

Either way: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		mutex_lock(&drm_global_mutex);
> +
>  	retcode = drm_ioctl_permit(flags, file_priv);
>  	if (unlikely(retcode))
> -		return retcode;
> +		goto out;
>  
> -	/* Enforce sane locking for modern driver ioctls. */
> -	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
> -	    (flags & DRM_UNLOCKED))
> -		retcode = func(dev, kdata, file_priv);
> -	else {
> -		mutex_lock(&drm_global_mutex);
> -		retcode = func(dev, kdata, file_priv);
> +	retcode = func(dev, kdata, file_priv);
> +
> +out:
> +	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
>  		mutex_unlock(&drm_global_mutex);
> -	}
>  	return retcode;
>  }
>  EXPORT_SYMBOL(drm_ioctl_kernel);
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
