Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D628BC63793
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 10:39:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07E9961279
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 10:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07E9961279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD95C8276E;
	Thu, 22 Jul 2021 10:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IiLdVx55bYiq; Thu, 22 Jul 2021 10:39:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 070568277E;
	Thu, 22 Jul 2021 10:39:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6E28C001A;
	Thu, 22 Jul 2021 10:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AA47C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 689A18277E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnQ-cuvqHAzT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:39:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A4478276E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:39:53 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id ec55so6211735edb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 03:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=jnlm21J6SlYJjPe81X61eHbfm5OMgcOz8zyqmSLYvPQ=;
 b=NpBBKqrdi56YhzkxFSewaW9GKDUpQ+fUhYE5+RkUh/mBRnGlUYIeNVp7gFkyHII+Wc
 QRxqAzGrpMvRUg6TI08B6k9huJMutm+Hx1aPAR8bebLUxzxn13SB0Kk39EHnBS3c4YZR
 fWGT8oKhgDjLRfSJ9uW+AomaH4j1haN9aSZ0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=jnlm21J6SlYJjPe81X61eHbfm5OMgcOz8zyqmSLYvPQ=;
 b=exiynmzjP5VJB8YHH4XhLpzDUepi7Aj9SHB4N9KJz3agu0jrwlhVWpzrOnFHkNczbW
 9T7kaAJDyLTbLtlKM/xSatcsMUrGPEyQ0J13b9clLwyJUqpffDMkH5yLF759knXRShub
 4Tk59sNCUACIeee5XJurpOG47nHZTq4G7lO9DPnEs/+c71/91UBkNOkZBUdleekA3QS+
 TvVgcLo8oMK1NLSdRCb4VDsXXXkySMcWgdJzykbZDz/9RM6oMAw730IGXLR1wiT5qck7
 U1yH+MFFZt1DdEhcj8ry9jPX4jcG0Cw5EVBR7lMnam4WOxBZhSjybCCNg4W5cK58ikd9
 QTFw==
X-Gm-Message-State: AOAM532e952tT2QB5jRg8BeCohnlwCoSS/RR8I4xzdf0rjDF1vWonkve
 h2Je9feT8Fk/hFS8Tk1Wpuv9rw==
X-Google-Smtp-Source: ABdhPJzr7EsXEh64NgUGE8NlxZu8PVM5/iUdV7lOJ1gOxWRo5nSODbf792yJ2bwdGRFWp7KaBmVx0g==
X-Received: by 2002:a05:6402:d2:: with SMTP id
 i18mr53783290edu.17.1626950391725; 
 Thu, 22 Jul 2021 03:39:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id cq22sm12251755edb.77.2021.07.22.03.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:39:51 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:39:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 3/3] drm/vmwgfx: fix potential UAF in vmwgfx_surface.c
Message-ID: <YPlK9b+7CN533jpl@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-4-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722092929.244629-4-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: tzimmermann@suse.de, airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-kernel-mentees@lists.linuxfoundation.org, zackr@vmware.com
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

On Thu, Jul 22, 2021 at 05:29:29PM +0800, Desmond Cheong Zhi Xi wrote:
> drm_file.master should be protected by either drm_device.master_mutex
> or drm_file.master_lookup_lock when being dereferenced. However,
> drm_master_get is called on unprotected file_priv->master pointers in
> vmw_surface_define_ioctl and vmw_gb_surface_define_internal.
> 
> This is fixed by replacing drm_master_get with drm_file_get_master.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'll let Zack take a look at this and expect him to push this patch to
drm-misc.git.
-Daniel

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> index 0eba47762bed..5d53a5f9d123 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -865,7 +865,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
>  	user_srf->prime.base.shareable = false;
>  	user_srf->prime.base.tfile = NULL;
>  	if (drm_is_primary_client(file_priv))
> -		user_srf->master = drm_master_get(file_priv->master);
> +		user_srf->master = drm_file_get_master(file_priv);
>  
>  	/**
>  	 * From this point, the generic resource management functions
> @@ -1534,7 +1534,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
>  
>  	user_srf = container_of(srf, struct vmw_user_surface, srf);
>  	if (drm_is_primary_client(file_priv))
> -		user_srf->master = drm_master_get(file_priv->master);
> +		user_srf->master = drm_file_get_master(file_priv);
>  
>  	res = &user_srf->srf.res;
>  
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
