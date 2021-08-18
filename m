Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D3DC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 10:05:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54BFF6108F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 10:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54BFF6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1003E80D6B;
	Wed, 18 Aug 2021 10:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIesRd4lwtqr; Wed, 18 Aug 2021 10:05:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DDD5880CD9;
	Wed, 18 Aug 2021 10:05:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD1B3C001A;
	Wed, 18 Aug 2021 10:05:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6623C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B51EF6000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxrievL-sgBa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:05:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D71060008
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 10:05:06 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id w5so3896394ejq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=+UugXJNovZ2vqktgPlIQAdEvTrXzjK5N1Cr++nIj3DA=;
 b=R42e8IjQDth0gJLIVgsbrUrhAc6d0ey998kv2PQoRChb7eJx00eZ1Gm0c/EhfBivkC
 IBNmrGkJ8ApCpeW2C+4cEd65TeabJc9SlX1xYSqdk72h0IEQ+khLKq7zNM6jv5wHaBvB
 ZXdjx0ctrHer5bc0vfxlwQtTRpuI1JQHIunWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=+UugXJNovZ2vqktgPlIQAdEvTrXzjK5N1Cr++nIj3DA=;
 b=aqdiR2pIbRKafJc+yHWtHfqfUwPmBkewLzWGSJCodsxXOWxZtfo0G31mqVEX5oN+PA
 d4wmnpLbiIiLpfcMNn2LdN3ECciFfO/8Vg4dcRXCW0S3xXyRmPZABBeM8QDJYKbqne5v
 rJi5GqUfLjWW3ZxXGowBoStRiKRrutzoi9fv/TNEonJsZGvoCbOLIki/rCoArr8Pc6qc
 b/RD0iP2C/fu49DLhq+50GENWMUwOlf2Q9AOLUg2+95JU0FGPncNkJ/hcuay+1dMFIoy
 JVsILRyifLTkVq72vD+0UelyYArM0NWh7mKsMKSrv4pz1iQvzJnKt8w8kDPj8vCAF9F/
 DI3Q==
X-Gm-Message-State: AOAM531uXl7ZNoGUYeCKdpJ+5NVgVZQuf+OZtbg9xwGKJ1Ps8WOwei2e
 WPKsI5wlACcH+x7eUGZU70riqg==
X-Google-Smtp-Source: ABdhPJyCL0wNSTVtmCi+TFUYXg5lqc4ePLGIxn2k+rFjGuAVDwSBiMK9lqUgzHWBYJDOF+Ij9NGXdA==
X-Received: by 2002:a17:906:150c:: with SMTP id
 b12mr8875986ejd.275.1629281104548; 
 Wed, 18 Aug 2021 03:05:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e22sm2384475eds.45.2021.08.18.03.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 03:05:03 -0700 (PDT)
Date: Wed, 18 Aug 2021 12:05:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v3 2/9] drm: hold master_lookup_lock when releasing a
 drm_file's master
Message-ID: <YRzbTUM8ggXlIEyr@phenom.ffwll.local>
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
 <20210818073824.1560124-3-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-3-desmondcheongzx@gmail.com>
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

On Wed, Aug 18, 2021 at 03:38:17PM +0800, Desmond Cheong Zhi Xi wrote:
> When drm_file.master changes value, the corresponding
> drm_device.master_lookup_lock should be held.
> 
> In drm_master_release, a call to drm_master_put sets the
> file_priv->master to NULL, so we protect this section with
> drm_device.master_lookup_lock.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

At this points all refcounts to drm_file have disappeared, so yeah this is
a lockless access, but also no one can observe it anymore. See also next
patch.

Hence I think the current code is fine.
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 8efb58aa7d95..8c0e0dba1611 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -373,8 +373,11 @@ void drm_master_release(struct drm_file *file_priv)
>  	}
>  
>  	/* drop the master reference held by the file priv */
> -	if (file_priv->master)
> +	if (file_priv->master) {
> +		spin_lock(&dev->master_lookup_lock);
>  		drm_master_put(&file_priv->master);
> +		spin_unlock(&dev->master_lookup_lock);
> +	}
>  	mutex_unlock(&dev->master_mutex);
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
