Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD966C63798
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 10:38:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC4396108B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 10:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC4396108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 828D3605DA;
	Thu, 22 Jul 2021 10:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqUHOlDjUuE0; Thu, 22 Jul 2021 10:38:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9CBFB6059B;
	Thu, 22 Jul 2021 10:38:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F600C001A;
	Thu, 22 Jul 2021 10:38:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86AD6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68322605CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HrJB-GmXXUbY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:38:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 652336059B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 10:38:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id hc15so7700818ejc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 03:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wstdp1MW7vJbJhg9S6cQf30gHHvyvOesRSnlOhoSLio=;
 b=h+h448QZAeHgdzElhjIT7EVFpu2g3yncCXFAsqDRIlSE3VCkeb8XYv1XLXU30ldtly
 DYH4gNzgye3p6+lFgsRyqYCHq9GBYVe783jE5nqDtXJZNpJjsMpO2Vwi7vCWnNl0RJkk
 S3ujNtCviEkax03zXYTgYFkpLx5jQLmG/h14o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Wstdp1MW7vJbJhg9S6cQf30gHHvyvOesRSnlOhoSLio=;
 b=UjUO/0b9a21xzL2DozixKmcTKK3Kr8lGojuzrdwMWldnO+zTtxkGi+5zqoLM41fvUw
 6vCTIIUzNL7+kzOBZVTq6sGaT8Ssaw1MfxfP4TU9LaMuwlfjK+75pXlEIdET198zBeAI
 KziqIC3IiFPX5AkhSNTdfRTcdfWr8QMJ2qzaCm6OpLZOgaFvvUfZL7g7+nXPcoX5e/hD
 Ee+7ph9qmzs4WfHSUksEL1WX47CEYu14T2WKjqqFoEW29PACnt0p0xp4D+XW3g9fpG8Q
 G+rd2UUP41Xg6iMiwcUF2KRrBKOGX1u5K8nBYUyyx3k81KnQc7CtO+sx2cvXnMCUBRE9
 It6Q==
X-Gm-Message-State: AOAM533k8iF2J4oBhp14PXOoMdnTxfJBhSlEg7hwXplEzjsUxCboG10S
 SdYgoDXe/pBbJ+GTu+SbG4XkmQ==
X-Google-Smtp-Source: ABdhPJyvNFTXUsWWogCgbPWqj36KbH0l8c92VS2Gb7tEe20TGtUFTGN7YFqOdDdDz79DMhuBpXMesA==
X-Received: by 2002:a17:906:f92:: with SMTP id
 q18mr43617437ejj.353.1626950292593; 
 Thu, 22 Jul 2021 03:38:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id cn21sm12272770edb.81.2021.07.22.03.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:38:11 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:38:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
Message-ID: <YPlKkvelm/mcnCj0@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-2-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722092929.244629-2-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: tzimmermann@suse.de, airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, linux-kernel-mentees@lists.linuxfoundation.org,
 zackr@vmware.com
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

On Thu, Jul 22, 2021 at 05:29:27PM +0800, Desmond Cheong Zhi Xi wrote:
> Inside drm_is_current_master, using the outer drm_device.master_mutex
> to protect reads of drm_file.master makes the function prone to creating
> lock hierarchy inversions. Instead, we can use the
> drm_file.master_lookup_lock that sits at the bottom of the lock
> hierarchy.
> 
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  drivers/gpu/drm/drm_auth.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index f00354bec3fb..9c24b8cc8e36 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -63,8 +63,9 @@
>  
>  static bool drm_is_current_master_locked(struct drm_file *fpriv)
>  {
> -	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
> -
> +	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> +	 * should be held here.
> +	 */

Disappointing that lockdep can't check or conditions for us, a
lockdep_assert_held_either would be really neat in some cases.

Adding lockdep folks, maybe they have ideas.

On the patch:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
>  }
>  
> @@ -82,9 +83,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
>  {
>  	bool ret;
>  
> -	mutex_lock(&fpriv->minor->dev->master_mutex);
> +	spin_lock(&fpriv->master_lookup_lock);
>  	ret = drm_is_current_master_locked(fpriv);
> -	mutex_unlock(&fpriv->minor->dev->master_mutex);
> +	spin_unlock(&fpriv->master_lookup_lock);
>  
>  	return ret;
>  }
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
