Return-Path: <SRS0=bMK4=LE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1D0C48BD1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 10:11:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188C3613BD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 10:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 188C3613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9C624000B;
	Thu, 10 Jun 2021 10:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UtN6UDqBMNZ5; Thu, 10 Jun 2021 10:11:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D50F340395;
	Thu, 10 Jun 2021 10:11:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A657DC000E;
	Thu, 10 Jun 2021 10:11:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 097B4C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 10:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2EB5405DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 10:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2iu2b1mXdbk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 10:10:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41EB7405D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 10:10:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso6160502wmi.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5ZeqK3HUGMU0I48g2CrdimQGpsG/P2Fm0SB2rJBA/ig=;
 b=aGMbzbK1h0Cd5C0t9Z3TF/pasVGK/w7r/+ch+aAz14hUy40O+6QVoqnFZNjaC55ljP
 4GUNwDrHQSKJlfOx8+UdoGm4fzDfKYDrlhtpHvPhS48xm1xIUrr8RoImy7ZCnPMAUjKw
 sgoqEt6SSmGZnYnIznUd1/Pf96LsWkqPvGayU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5ZeqK3HUGMU0I48g2CrdimQGpsG/P2Fm0SB2rJBA/ig=;
 b=uJJZNZC4fFvZAR1yldQwIaJEOlOkg26N+Evc8M+nE7kV2rWHaeQgz8EKy8HPopsDbq
 xKyAaq2TzkR8LMRNEvQwrJcXg3JVmjxTgz21IDwPnYICsw/3XXmjP4/k7w528v33o/LR
 l+2jkkqlMsE/UWW8jWYTpqSkctQbfm+uFBCzZiFj7C1WPlHc2+T5taXHO/icT6otpehT
 JhKx1TtckEC6S+LsqbIF7ikq9OfAeSyndA8uP9x7b6lUYNkO8E4mPYocZru4f0HcY/AW
 vQT3672HwSWj3NB1paRLjbiVRvss03xtR/eF9+RhY52+hlUWExk/X1n3x9x58v7rRRv8
 4YZg==
X-Gm-Message-State: AOAM533TxxTaaHcscdUDC5+PHjavpO1Xbi60k2eRil7Q29RCSqTIjdhX
 faXMg8CtApY6MXtgGJnCjOElrA==
X-Google-Smtp-Source: ABdhPJx8m3+mYf6GO8iNd3ecqDNmRAG+tsOPxNYY58+AEcXlbsFNNcsRKOlwZ/kVSeNufh93SOrIVQ==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr4353737wmh.130.1623319856112; 
 Thu, 10 Jun 2021 03:10:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f5sm3386554wrf.22.2021.06.10.03.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 03:10:55 -0700 (PDT)
Date: Thu, 10 Jun 2021 12:10:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] drm: Lock pointer access in drm_master_release()
Message-ID: <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210609092119.173590-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609092119.173590-1-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Cc: tzimmermann@suse.de, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, daniel@ffwll.ch,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
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

On Wed, Jun 09, 2021 at 05:21:19PM +0800, Desmond Cheong Zhi Xi wrote:
> This patch eliminates the following smatch warning:
> drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'
> 
> The 'file_priv->master' field should be protected by the mutex lock to
> '&dev->master_mutex'. This is because other processes can concurrently
> modify this field and free the current 'file_priv->master'
> pointer. This could result in a use-after-free error when 'master' is
> dereferenced in subsequent function calls to
> 'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.
> 
> An example of a scenario that would produce this error can be seen
> from a similar bug in 'drm_getunique()' that was reported by Syzbot:
> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
> 
> In the Syzbot report, another process concurrently acquired the
> device's master mutex in 'drm_setmaster_ioctl()', then overwrote
> 'fpriv->master' in 'drm_new_set_master()'. The old value of
> 'fpriv->master' was subsequently freed before the mutex was unlocked.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Thanks a lot. I've done an audit of this code, and I found another
potential problem in drm_is_current_master. The callers from drm_auth.c
hold the dev->master_mutex, but all the external ones dont. I think we
need to split this into a _locked function for use within drm_auth.c, and
the exported one needs to grab the dev->master_mutex while it's checking
master status. Ofc there will still be races, those are ok, but right now
we run the risk of use-after free problems in drm_lease_owner.

Are you up to do that fix too?

I think the drm_lease.c code also needs an audit, there we'd need to make
sure that we hold hold either the lock or a full master reference to avoid
the use-after-free issues here.

Patch merged to drm-misc-fixes with cc: stable.
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index f00e5abdbbf4..b59b26a71ad5 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -315,9 +315,10 @@ int drm_master_open(struct drm_file *file_priv)
>  void drm_master_release(struct drm_file *file_priv)
>  {
>  	struct drm_device *dev = file_priv->minor->dev;
> -	struct drm_master *master = file_priv->master;
> +	struct drm_master *master;
> 
>  	mutex_lock(&dev->master_mutex);
> +	master = file_priv->master;
>  	if (file_priv->magic)
>  		idr_remove(&file_priv->master->magic_map, file_priv->magic);
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
