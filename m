Return-Path: <SRS0=/XFi=C3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C935C43463
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 12:48:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F2520717
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 12:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="XJthRxMj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F2520717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60C3F86B34;
	Fri, 18 Sep 2020 12:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNQQega0DGTV; Fri, 18 Sep 2020 12:48:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E30D986AE1;
	Fri, 18 Sep 2020 12:48:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0B1EC0888;
	Fri, 18 Sep 2020 12:48:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D433FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CFE0286B34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTZm2RuSBdLv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:48:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 672B786AE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:48:42 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id g4so6025073edk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=SOcYopzpVA91Ur8JOndAUuW5kC5KQpU+aqaU8ciX7/I=;
 b=XJthRxMj7p5FVQ8UB8QHPjpkyrZ1DYRAiW2zVjRAhJUW0e0QzTxX9S0LywyZSJEGAX
 oQ6rcMf41/DYJXO67/Xq8aoMk84qRFYHTNdeA/7L9sScQbt/SEfZaJSlI5KxMxxR+CIT
 M/6Aec09cMTtIOtfSD5s3TkOo40GHFODxElv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=SOcYopzpVA91Ur8JOndAUuW5kC5KQpU+aqaU8ciX7/I=;
 b=ZTkLe3A0F8FzkoifeoXrm2MrwID51svXLUV4b7W2/AX0GY6qaVzotUl8hfDYDr1I9v
 +2AJqyRfov4gkUif0Rpd4q7GqYz9lf0vO8mItDeWE9pOintxvikJLoZbwyFfMfs2DiO5
 hGWxfR4sWATovv+tDKesV98UJyBnvGlIUhY3tM5hYCGsliWwvOg6OgQfPqXFl3gkxxL3
 150+hyebi4PIAzdf7IQF1LxnfLtaWvGMb5wIHnNmMtMHp0Gv06k17dutSRmU7Hq23Ooo
 qrCxpZoXL2n32Lf7Md6A+okigfk7MuaNdXIjcIfny6MYCBuyO9YNKXwiYWyKOPxBNOLc
 SNOQ==
X-Gm-Message-State: AOAM530Q52O6cWPL3bZIesjoPnxAqQJIYoKw+PhOIF+5D6Mm5PbtzGyx
 I7V5VYV8U/17uQ6wjGTmmgSontrr+ev6+92v
X-Google-Smtp-Source: ABdhPJzrTC3CW6AB1dTSGBrjqUS3H6j44ck9bWQgvGGmKSFb26qrBxqU+OHgoRbREA252KDgVlNEww==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr41100529wrs.153.1600432926218; 
 Fri, 18 Sep 2020 05:42:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d2sm5156057wro.34.2020.09.18.05.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:42:05 -0700 (PDT)
Date: Fri, 18 Sep 2020 14:42:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200918124203.GY438822@phenom.ffwll.local>
Mail-Followup-To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>,
 Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>, linux-fbdev@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
References: <20200917115313.725622-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917115313.725622-1-vaibhavgupta40@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Antonino Daplas <adaplas@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andres Salomon <dilinger@queued.net>,
 Bjorn Helgaas <bhelgaas@google.com>, Paul Mackerras <paulus@samba.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] fbdev: aty: remove CONFIG_PM
	container
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

On Thu, Sep 17, 2020 at 05:23:14PM +0530, Vaibhav Gupta wrote:
> The changes made in below mentioned commit removed CONFIG_PM containers
> from drivers/video/fbdev/aty/atyfb_base.c but not from
> drivers/video/fbdev/aty/atyfb.h for respective callbacks.
> 
> This resulted in error for implicit declaration for those callbacks.
> 
> Fixes: 348b2956d5e6 ("fbdev: aty: use generic power management")
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>

Applied, thanks.
-Daniel

> ---
>  drivers/video/fbdev/aty/atyfb.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/aty/atyfb.h b/drivers/video/fbdev/aty/atyfb.h
> index a7833bc98225..551372f9b9aa 100644
> --- a/drivers/video/fbdev/aty/atyfb.h
> +++ b/drivers/video/fbdev/aty/atyfb.h
> @@ -287,8 +287,8 @@ static inline void aty_st_8(int regindex, u8 val, const struct atyfb_par *par)
>  #endif
>  }
>  
> -#if defined(CONFIG_PM) || defined(CONFIG_PMAC_BACKLIGHT) || \
> -defined (CONFIG_FB_ATY_GENERIC_LCD) || defined (CONFIG_FB_ATY_BACKLIGHT)
> +#if defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) || \
> +defined (CONFIG_FB_ATY_BACKLIGHT)
>  extern void aty_st_lcd(int index, u32 val, const struct atyfb_par *par);
>  extern u32 aty_ld_lcd(int index, const struct atyfb_par *par);
>  #endif
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
