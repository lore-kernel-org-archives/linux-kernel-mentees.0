Return-Path: <SRS0=MGRu=NR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C71C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Aug 2021 09:53:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFB9660F45
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Aug 2021 09:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFB9660F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94BFA81947;
	Thu, 26 Aug 2021 09:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Q9I06oIisdS; Thu, 26 Aug 2021 09:53:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6BC0C80F43;
	Thu, 26 Aug 2021 09:53:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F265C0010;
	Thu, 26 Aug 2021 09:53:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFE28C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 09:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7EF54022B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 09:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0LirRmE7CsAU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 09:53:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 720A84020B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 09:53:23 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i6so4109054wrv.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 02:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ni1xy5Gepkk5NBQpOY3IACWkfMQ9OHRnfHvZ7VxtDs0=;
 b=EBbw5iuDgYoyjp0ztZeG08LqtiQBuGcd9QoDWNg0HwrHnneLUVjUgC7pGsSdoL6C3v
 uTJ9HDjYdICngR2YolnQ0jaIL+xRyz5Q9EFgSHRAwY9gqRpoLAagGbHUmySATzqhlDkh
 KTEbPFkHJh7n8Kyre+edSDiovcx7s92Q4Mgns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Ni1xy5Gepkk5NBQpOY3IACWkfMQ9OHRnfHvZ7VxtDs0=;
 b=OkQOh7RDMTH5cB8KS6qpc8v9YaNS1JhhPePBpo1XC/qCH69aVkp2ZJwjS8auajOEDG
 kScAfMmzIB4B2htMKVMz6DwVzGGB+etOoDtn3rIu6l2uEDrKitagqDRkv06RupSBeX4h
 Q1GBDzAJZv7nYQdgI2bK9xss104xhXSFyFVjPz04xEPaGd2Z/iCUErldMJ/0AJED4h8g
 3DIi1H9NTMmu3xjG8k7dj6PPsVWW4nSVHwRhcu8AkK81dZc/87LKchyhyoWjaOy/XadU
 zS5Tm52fEpJNa1w9yAxwLCHXOj/xRlH63oD9HTeaCmz/xUQlcBIFL15IzDmFuucZRUwE
 ZhOw==
X-Gm-Message-State: AOAM533PHY0eZVCMBJ2Fx+YKgGFTOUiMv+mUwlTIk16pOD5G1gNTctH5
 9acRnZDx6qR0pxW1YwkbUKdXqg==
X-Google-Smtp-Source: ABdhPJx1lz50jPKLRZSlFYgcMNWnHQNKvfoVO+OADtOF8BUg3znumuN3XCwj3fk80kP8jB86qYRwcQ==
X-Received: by 2002:a5d:47cd:: with SMTP id o13mr2937109wrc.246.1629971601523; 
 Thu, 26 Aug 2021 02:53:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o12sm2581867wro.51.2021.08.26.02.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:53:21 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:53:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v8 1/7] drm: fix null ptr dereference in drm_master_release
Message-ID: <YSdkjvWN9RAijZJy@phenom.ffwll.local>
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
 <20210826020122.1488002-2-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210826020122.1488002-2-desmondcheongzx@gmail.com>
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

On Thu, Aug 26, 2021 at 10:01:16AM +0800, Desmond Cheong Zhi Xi wrote:
> drm_master_release can be called on a drm_file without a master, which
> results in a null ptr dereference of file_priv->master->magic_map. The
> three cases are:
> 
> 1. Error path in drm_open_helper
>   drm_open():
>     drm_open_helper():
>       drm_master_open():
>         drm_new_set_master(); <--- returns -ENOMEM,
>                                    drm_file.master not set
>       drm_file_free():
>         drm_master_release(); <--- NULL ptr dereference
>                                    (file_priv->master->magic_map)
> 
> 2. Error path in mock_drm_getfile
>   mock_drm_getfile():
>     anon_inode_getfile(); <--- returns error, drm_file.master not set
>     drm_file_free():
>       drm_master_release(); <--- NULL ptr dereference
>                                  (file_priv->master->magic_map)
> 
> 3. In drm_client_close, as drm_client_open doesn't set up a master
> 
> drm_file.master is set up in drm_open_helper through the call to
> drm_master_open, so we mirror it with a call to drm_master_release in
> drm_close_helper, and remove drm_master_release from drm_file_free to
> avoid the null ptr dereference.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I guess we should also have a cc: stable on this one? I think this bug
existed since pretty much forever, but maybe more prominent with the
drm_client stuff added a while ago.
-Daniel

> ---
>  drivers/gpu/drm/drm_file.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index ed25168619fc..90b62f360da1 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -282,9 +282,6 @@ void drm_file_free(struct drm_file *file)
>  
>  	drm_legacy_ctxbitmap_flush(dev, file);
>  
> -	if (drm_is_primary_client(file))
> -		drm_master_release(file);
> -
>  	if (dev->driver->postclose)
>  		dev->driver->postclose(dev, file);
>  
> @@ -305,6 +302,9 @@ static void drm_close_helper(struct file *filp)
>  	list_del(&file_priv->lhead);
>  	mutex_unlock(&dev->filelist_mutex);
>  
> +	if (drm_is_primary_client(file_priv))
> +		drm_master_release(file_priv);
> +
>  	drm_file_free(file_priv);
>  }
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
