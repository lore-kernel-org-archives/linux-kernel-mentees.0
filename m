Return-Path: <SRS0=+j5t=LI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95ECC47094
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Jun 2021 19:41:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ABB86102A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Jun 2021 19:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ABB86102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32DC26083A;
	Mon, 14 Jun 2021 19:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Av5Wfl2W9JIr; Mon, 14 Jun 2021 19:41:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4E56260837;
	Mon, 14 Jun 2021 19:41:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34DF6C000D;
	Mon, 14 Jun 2021 19:41:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CB92C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F1CC6083A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HODxCoRnbl2J
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1A5A60837
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:41:38 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id j8so3571786vsd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YSHdbBdLxbYZlWemrHLO8rn/WxjGLmePBCR/uXkKydQ=;
 b=gXbiB53zsC9A0e6yeqxynJ8K2CU29DzKA4rzf1CmwQvBwYBn+qnXX00hnKL5om0qVR
 cZYQavTAVYQMj1TX1A03OZ0h8xN0QWjRi+Ot6oIO5CtnxrYernwAO+aRzRp3yH64G1rr
 ayU0qODqGk8qCobFP6cO3js4NbtPKGRSEHEZha27t/AxNpXM90jHZFHYCV199wbhQJwc
 8y1yo+s1VL5UTlxtX51mcg1lHVG49NvzDvT7V0wTFv/iEdQe8jPd4hqxvYzOUN702JC8
 /3JI292H5UcLiwYfN8HGcIP4pH2klkqR0/tKzMJjkhtUPZFpAe8tFKz3PscRB4LnvXz6
 lufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YSHdbBdLxbYZlWemrHLO8rn/WxjGLmePBCR/uXkKydQ=;
 b=dJEniGt1QKiRUQMe4+OPtsle/EYz1ldiKmFMhHDHGKbLaaHU91SJUnk2rzuVLAhpae
 1tnNdFZ9AFD6ZBF5a+eNQJXzvyOY3uQawUVC9QwHOrkSw6WRm567aQqnetLLEyEZjmRP
 0om5o9M+BLdKoeud3pfjkzgZJ3CrTP+MXKwDg+01ZLsM4GqJThqXPvQaIpZwLyOiiqiq
 FUGL6hxQofBRGbCvVpCf+oLsEbqnaixlbhT3Sbm3vRaCOSPkVslc/TFAKQIQ7wrzYHcF
 RtPBHnCc7OsCOD5pJJrF7MM9ZtZ8PsEm4Ki5UjPhO0/QZTK/mXWY8L9eRo6rHuEhw853
 yf2w==
X-Gm-Message-State: AOAM533yYwrzzZSODuN7VBXk9CpDbaPAnhu/xpT0ej85ZTRO5PwVs1r2
 fcekfIK1y9ItDGzGRdoaZnKMhvfFAJ02xv1lIj8=
X-Google-Smtp-Source: ABdhPJytersYuO9TTLsR8N3gF2P4x9FpF+WT26vt3Abg72qCHav0Z8Q32sRLjm0DV7rnqHjAmyOKCwgXPuG7IinDHjY=
X-Received: by 2002:a05:6102:2159:: with SMTP id
 h25mr1281799vsg.19.1623699697567; 
 Mon, 14 Jun 2021 12:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210612125426.6451-1-desmondcheongzx@gmail.com>
 <20210612125426.6451-3-desmondcheongzx@gmail.com>
In-Reply-To: <20210612125426.6451-3-desmondcheongzx@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 14 Jun 2021 20:41:26 +0100
Message-ID: <CACvgo51r3NK_ddQPPD9vBzkJq7A4CcYS4nawxZqqDB8FXK5gcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: Protect drm_master pointers in drm_lease.c
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, 12 Jun 2021 at 13:55, Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
>
> This patch ensures that the device's master mutex is acquired before
> accessing pointers to struct drm_master that are subsequently
> dereferenced. Without the mutex, the struct drm_master may be freed
> concurrently by another process calling drm_setmaster_ioctl(). This
> could then lead to use-after-free errors.
>
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---

<snip>

> @@ -578,6 +594,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>         /* Hook up the fd */
>         fd_install(fd, lessee_file);
>
> +       mutex_unlock(&dev->master_mutex);

I was going to suggest pushing the unlock call further up - after the
drm_lease_create call. Although that would make the error path rather
messy, so let's keep it as-is.

<snip>

> @@ -662,7 +684,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>         struct drm_mode_get_lease *arg = data;
>         __u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
>         __u32 count_objects = arg->count_objects;
> -       struct drm_master *lessee = lessee_priv->master;
> +       struct drm_master *lessee;
>         struct idr *object_idr;
>         int count;
>         void *entry;
> @@ -678,8 +700,10 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>
>         DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
>
> +       mutex_lock(&dev->master_mutex);

As-is we're dereferencing an uninitialised pointer in DRM_DEBUG_LEASE.
Move the lock and assignment before the DRM_DEBUG_LEASE, just like
you've done in the list ioctl.

With this fix, the patch is;
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
