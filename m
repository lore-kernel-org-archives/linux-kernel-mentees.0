Return-Path: <SRS0=2FyS=LC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FED0C48BCD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Jun 2021 16:20:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFED861287
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Jun 2021 16:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFED861287
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74282402CB;
	Tue,  8 Jun 2021 16:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVEohYPLQMye; Tue,  8 Jun 2021 16:20:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id A30B5400E7;
	Tue,  8 Jun 2021 16:20:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F9BCC000D;
	Tue,  8 Jun 2021 16:20:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65052C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jun 2021 16:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 465C682FEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jun 2021 16:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3hq2kJ4sZeF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jun 2021 16:20:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B24582F31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jun 2021 16:20:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m18so22249134wrv.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Jun 2021 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WHP+bfUpSSgGU+40YQorcw79is7T2xXrk6IDd2U02us=;
 b=c/v0NunbtdBf4Xod9Iby2PJdbikNXHp0gGbmCubNDw59u9q+q37XhdKtWUVUnFxG0D
 /mvqUjSLG6Drp3g+Jz0p8IOhe11FJ7AOkte64ETRH1iBseT1w05UpzQqgb4yyTNW+kfl
 nnFJDfxFmxYnq6Z6MOackwV895C/U/b1UD0B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=WHP+bfUpSSgGU+40YQorcw79is7T2xXrk6IDd2U02us=;
 b=Q6SfqCX8zdvLf4REAYDGn78ZGqp4Kcj3x9yzf+Q8Q2+fL4UUE1X8js5Mcq4z1A7l6v
 Gj+tnhq3H9FE9ui1LyeMtchHcQetbmn/aZ0cHHRGGC86u1Y9/AMU3jVxutyTbUKF32Hc
 74+mwif4HS8MAyNXCdKL2cTzFh2CuRwOfT7RlREb9Fly9/5vvCsXQDncxmjhxceex7la
 N52liQI/+8mHSnUT+IQCWWbReZW6FmQApFmLwqxUTVCVUuDe0z7ImFC3ssJMR+rRl34E
 oWCgPYOsTXo2xieSgaT6MD6OVn5O3lHGn7bV4yANrUqmEdEW0frqr8oaxEFJjQ4A1STX
 JQGw==
X-Gm-Message-State: AOAM532+9ZXcdliM8cwTKyioXgucH0pIvgQR2gqpCcGJKMznhZ4Ususy
 +8itYbpzQumz0LtZ6WoNAjPK8w==
X-Google-Smtp-Source: ABdhPJz+2SyUcy0W2KB1qYd96JVRrSCiw9s0a2u5+A255K0jX40r7indtLoxfqUrXGXSkFD91UfgkA==
X-Received: by 2002:a5d:6b0b:: with SMTP id v11mr22883654wrw.339.1623169202970; 
 Tue, 08 Jun 2021 09:20:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m37sm11891194wms.46.2021.06.08.09.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 09:20:02 -0700 (PDT)
Date: Tue, 8 Jun 2021 18:20:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] drm: Fix use-after-free read in drm_getunique()
Message-ID: <YL+YsFUKtK5LbGex@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com
References: <20210608110436.239583-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210608110436.239583-1-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Cc: tzimmermann@suse.de, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com, mripard@kernel.org,
 daniel@ffwll.ch, linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Jun 08, 2021 at 07:04:36PM +0800, Desmond Cheong Zhi Xi wrote:
> There is a time-of-check-to-time-of-use error in drm_getunique() due
> to retrieving file_priv->master prior to locking the device's master
> mutex.
> 
> An example can be seen in the crash report of the use-after-free error
> found by Syzbot:
> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
> 
> In the report, the master pointer was used after being freed. This is
> because another process had acquired the device's master mutex in
> drm_setmaster_ioctl(), then overwrote fpriv->master in
> drm_new_set_master(). The old value of fpriv->master was subsequently
> freed before the mutex was unlocked.
> 
> To fix this, we lock the device's master mutex before retrieving the
> pointer from from fpriv->master. This patch passes the Syzbot
> reproducer test.
> 
> Reported-by: syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Very nice debug work, thanks a lot!

> ---
> 
> In this patch, I made the assumption that dev and file_priv->master->dev
> refer to the same struct drm_device*, and from my test runs this seemed
> to be the case. If this was a wrong assumption to make, please let me
> know.

Yup that's correct.

Patch applied to drm-misc-fixes and cc: stable added so it gets
backported.

Cheers, Daniel

> 
>  drivers/gpu/drm/drm_ioctl.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index d273d1a8603a..495a4767a443 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -118,17 +118,18 @@ int drm_getunique(struct drm_device *dev, void *data,
>  		  struct drm_file *file_priv)
>  {
>  	struct drm_unique *u = data;
> -	struct drm_master *master = file_priv->master;
> +	struct drm_master *master;
>  
> -	mutex_lock(&master->dev->master_mutex);
> +	mutex_lock(&dev->master_mutex);
> +	master = file_priv->master;
>  	if (u->unique_len >= master->unique_len) {
>  		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
> -			mutex_unlock(&master->dev->master_mutex);
> +			mutex_unlock(&dev->master_mutex);
>  			return -EFAULT;
>  		}
>  	}
>  	u->unique_len = master->unique_len;
> -	mutex_unlock(&master->dev->master_mutex);
> +	mutex_unlock(&dev->master_mutex);
>  
>  	return 0;
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
