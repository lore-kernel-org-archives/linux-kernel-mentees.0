Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3B6C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 10:04:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E5CC6108F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 10:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E5CC6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D10314048D;
	Wed, 18 Aug 2021 10:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ra7r6l-1kDZ9; Wed, 18 Aug 2021 10:04:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7B0334015C;
	Wed, 18 Aug 2021 10:04:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57E69C001A;
	Wed, 18 Aug 2021 10:04:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37B18C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3314480DFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6Ro7QeO7vj9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:04:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D55E080DEE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:04:10 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id dj8so2284753edb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aMU29SN6YoovEcOrsusWnZbE8h+1MpQpJA0/wZfLGeE=;
 b=VuWlpnTGk6pLgRyLxLDnxv4NkP9nRhdxy0N90/5pUe8bPs6Uj9DlrqMj6WsvKlpXXI
 111QEnOZPfJS/mHK8sfTzq5rrN40iXdDm7HI7rmq/xmBL8FDwz+BFyPzr5yB3ovwv8zV
 0GGNgLYV0nqj01x2rcDXp61Hl2zl/sKi6V54I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=aMU29SN6YoovEcOrsusWnZbE8h+1MpQpJA0/wZfLGeE=;
 b=O5UHdZ2J5EsHNWxf8mSmE1nT2rWK+gCHf3G6x3Hr2matYKieS0LOLJS6h9vcaTpLrq
 KvM5prktVdcax/zW/BFiZa6CgdK+nccz8EFZ9pwD+n6D8Tae/GRbLyi+aKQRO3vWqvCo
 OofBSN0usHjBxYiRjQUy1plqJhmNeNYWJWF5o7sayDuXDB+gqxI8GVBD5uxR9az7Grwq
 TqlXDJH58OrMLMJunRlUQq3vGW/DPEw/JrW7icI78/0WTD07ykFLj+PBNPJ2LoOsW+gs
 8SPXgXmDx5uvYvXdyehFSUF+5vRRNdhqbVADFSxl3/J0MJJW1mMl0mLWbARFX8VLmsDl
 FVkw==
X-Gm-Message-State: AOAM532u0Z6UnFHhAa7c6UloBnf/JxrqTbCsmFvf9AuqlZpwI4zMkFH6
 RZBUVaCOe3MlXHRu2pDY8CRfqA==
X-Google-Smtp-Source: ABdhPJzQXPwY+sWxgn3k6s9LT4/gWaw0MMn3Os6faeWcHmmeyRNaM7zRWGLx0tEfvU1T3JleVgbcdA==
X-Received: by 2002:a05:6402:14d9:: with SMTP id
 f25mr9279034edx.343.1629281048926; 
 Wed, 18 Aug 2021 03:04:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d16sm2384140edu.8.2021.08.18.03.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 03:04:08 -0700 (PDT)
Date: Wed, 18 Aug 2021 12:04:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v3 3/9] drm: check for null master in
 drm_is_current_master_locked
Message-ID: <YRzbFnkricE65Hn5@phenom.ffwll.local>
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
 <20210818073824.1560124-4-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-4-desmondcheongzx@gmail.com>
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

On Wed, Aug 18, 2021 at 03:38:18PM +0800, Desmond Cheong Zhi Xi wrote:
> There is a window after calling drm_master_release, and before a file
> is freed, where drm_file can have is_master set to true, but both the
> drm_file and drm_device have no master.
> 
> This could result in wrongly approving permissions in
> drm_is_current_master_locked. Add a check that fpriv->master is
> non-NULl to guard against this scenario.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

This should be impossible, drm_master_release is only called when the
struct file is released, which means all ioctls and anything else have
finished (they hold a temporary reference).

fpriv->master can change (if the drm_file becomes newly minted master and
wasnt one before through the setmaster ioctl), but it cannot become NULL
before it's completely gone from the system.
-Daniel


> ---
>  drivers/gpu/drm/drm_auth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 8c0e0dba1611..f9267b21556e 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -66,7 +66,8 @@ static bool drm_is_current_master_locked(struct drm_file *fpriv)
>  	lockdep_assert_once(lockdep_is_held(&fpriv->minor->dev->master_lookup_lock) ||
>  			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
>  
> -	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> +	return (fpriv->is_master && fpriv->master &&
> +		drm_lease_owner(fpriv->master) == fpriv->minor->dev->master);
>  }
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
