Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CA7C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 15:51:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7319C60FC3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 15:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7319C60FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B0ED80EEF;
	Fri, 13 Aug 2021 15:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLP79cbYzMmC; Fri, 13 Aug 2021 15:51:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0CE8680EEE;
	Fri, 13 Aug 2021 15:51:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB213C0010;
	Fri, 13 Aug 2021 15:51:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35AC2C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 15:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E63C60611
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 15:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZvE7Sxhwl4XT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 15:51:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1354F6060B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 15:51:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q11so13892883wrr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 08:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=chmAAuuu9/imXcL05QrcQEYuvIcsA2PuEr2bsNmWeMk=;
 b=YXNQ1jJxmMfb4W6F0Ii5J6L9JrznTqUjOcuFAqOOrX6uBrOVpgkK22QocovoZ8l10V
 qau/1XGthmja7EiXttRCYcn6dncQJxnTAlO0kX6joAsSq5pqJchTi7vuTc8ezgGzlkG9
 1rPG2lPmD4puppEecPzIS3+snUwBW4xNT4PhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=chmAAuuu9/imXcL05QrcQEYuvIcsA2PuEr2bsNmWeMk=;
 b=FzDtgJp4hBUabZroASdMcB8ujbQk8nxeXmNPp9pFNQ8dS19eJOS3SP5RpsMUMyOvDC
 SGLewkfFXHPEq0YLZBIZokUpsnZH++fzrCHogt0yInQYjfLDfNgU1PrEoG9IKYgg/8dJ
 LYEEhsqQULHP0ZaaLEqt9zai7Re1zX8m5CXf7eKS9ozqgpGF50KeqplHP2PGcULCWmcn
 N/N/qknDmt5yARuoi3xfl8B1I2tx0n46p7F29/RhBFLkuiMW43Lz2J7JvanAk3Lg1wvY
 Kti+RDqin0rHdsnu8HmRfVIiOfleolqqFJxYB1/DDpEm7yIsOWUomz0IlA9LbnQpMxba
 g4kg==
X-Gm-Message-State: AOAM532DVhaVVjqWdlg9mn91Bd67qh6/k9XLM8NVkxqK5dLwX3aNz/D2
 U+upKDFhg36bVlTC/0A5p8qJ0Q==
X-Google-Smtp-Source: ABdhPJxmL/0BdkkgG1cfg0Kb8lawu3ocVEXGdInJyWEC5vjU11a4bxLVspErgkAcGWROUTwh6G7ozg==
X-Received: by 2002:a5d:66d1:: with SMTP id k17mr3944388wrw.102.1628869871300; 
 Fri, 13 Aug 2021 08:51:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z13sm1942615wrs.71.2021.08.13.08.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:51:10 -0700 (PDT)
Date: Fri, 13 Aug 2021 17:51:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 2/2] drm: unexport drm_ioctl_permit
Message-ID: <YRaU7EB5shTUMZZ7@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210813085450.32494-1-desmondcheongzx@gmail.com>
 <20210813085450.32494-3-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210813085450.32494-3-desmondcheongzx@gmail.com>
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

On Fri, Aug 13, 2021 at 04:54:50PM +0800, Desmond Cheong Zhi Xi wrote:
> Since the last user of drm_ioctl_permit was removed, and it's now only
> used in drm_ioctl.c, unexport the symbol.
> 
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Applied to drm-misc-next for 5.16, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_ioctl.c | 15 +--------------
>  include/drm/drm_ioctl.h     |  1 -
>  2 files changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index eb4ec3fab7d1..fe271f6f96ab 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -522,19 +522,7 @@ int drm_version(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> -/**
> - * drm_ioctl_permit - Check ioctl permissions against caller
> - *
> - * @flags: ioctl permission flags.
> - * @file_priv: Pointer to struct drm_file identifying the caller.
> - *
> - * Checks whether the caller is allowed to run an ioctl with the
> - * indicated permissions.
> - *
> - * Returns:
> - * Zero if allowed, -EACCES otherwise.
> - */
> -int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
> +static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>  {
>  	/* ROOT_ONLY is only for CAP_SYS_ADMIN */
>  	if (unlikely((flags & DRM_ROOT_ONLY) && !capable(CAP_SYS_ADMIN)))
> @@ -557,7 +545,6 @@ int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(drm_ioctl_permit);
>  
>  #define DRM_IOCTL_DEF(ioctl, _func, _flags)	\
>  	[DRM_IOCTL_NR(ioctl)] = {		\
> diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
> index 13a68cdcea36..fd29842127e5 100644
> --- a/include/drm/drm_ioctl.h
> +++ b/include/drm/drm_ioctl.h
> @@ -174,7 +174,6 @@ struct drm_ioctl_desc {
>  		.name = #ioctl						\
>  	}
>  
> -int drm_ioctl_permit(u32 flags, struct drm_file *file_priv);
>  long drm_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
>  long drm_ioctl_kernel(struct file *, drm_ioctl_t, void *, u32);
>  #ifdef CONFIG_COMPAT
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
