Return-Path: <SRS0=L/ns=LR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F16CC4743C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Jun 2021 07:43:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B93B96128C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Jun 2021 07:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B93B96128C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B5016064A;
	Wed, 23 Jun 2021 07:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O62RaCdPQy3T; Wed, 23 Jun 2021 07:43:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7A6F060705;
	Wed, 23 Jun 2021 07:43:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53528C0010;
	Wed, 23 Jun 2021 07:43:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EEDA8C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 07:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2CE582F06
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 07:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w7xilCpL4V_L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 07:43:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFEF982ED1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 07:43:52 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 n99-20020a9d206c0000b029045d4f996e62so1074729ota.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 00:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cWzvtRTbDifdl+PxaGCuS2g5VXsz2HZV7fjfjiuvl1s=;
 b=MwPZIV8ivWfiDYeNv72T0B+TQPZZrJ03iZ4rRoU2dOZH5hIhooeh4E9s44iqSXCJga
 rLhAfs3qLh5yoXMJcT0SlHUVp9mhu3ulY2L3UIReEZwzMCwACBeBALYnuoHv4l2iNsTi
 GPNyV/KpMzRb/s3TAd2ysZR4QjPPytSEIPRro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cWzvtRTbDifdl+PxaGCuS2g5VXsz2HZV7fjfjiuvl1s=;
 b=AuYbbJL9C8cbukzxWiKP1vUqcXTu6rad7OJX5htGoXLAJzuR/Eb/mVG1eUl5xwXx7v
 52VFNNrvhfqQ9/6XrTDUDpdlRswUa5a8Up1fCa8l9jpA3Cp+aZoyGfaqhgqbjToLwi7e
 ngzeAuVFYTp8iU1abK33P+mztRFFzSK4l9YlRGUQBgvsjWvvnZnmSevu6bZy8Izw9nUZ
 0UlxelB9lRdhsTdM/k13nKfp9P1utGieYjZp/sXqJVrx4eveDrgDMzLXZ5QGVe50eG24
 cRGI4qrJ0aE4xvrMrQeAEprr4akERqW8ntiJ3MOeInleYcL/DtjBOvBJo8KEkwkF/noZ
 BfSg==
X-Gm-Message-State: AOAM533uUS0jwREibmAUa41p6XQdlAxXXuNP7ZBMuk+ThAMd8mOx0QXh
 3zaCoOPmv7Qkxv/nqTMAkmYLDjzGo5WmoXuHK3Z83Q==
X-Google-Smtp-Source: ABdhPJwFpV7dlXUDEnB4E9Qw7A63kO4THfzJY0ME2w2Az3FtLmVWlU6ptDgsAet4iMbRa20uvHGl6WIJBc9CZdE8dbM=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr6705525otb.281.1624434231910; 
 Wed, 23 Jun 2021 00:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210620110327.4964-1-desmondcheongzx@gmail.com>
 <20210620110327.4964-2-desmondcheongzx@gmail.com>
 <YNChRvGjIz6++jnd@phenom.ffwll.local>
In-Reply-To: <YNChRvGjIz6++jnd@phenom.ffwll.local>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Jun 2021 09:43:41 +0200
Message-ID: <CAKMK7uGPo=iFffph=fRYeuE=RoGJ1JahukPAwszY7Rsu5rb=5Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm: add a locked version of drm_is_current_master
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: Dave Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
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

On Mon, Jun 21, 2021 at 4:25 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Jun 20, 2021 at 07:03:26PM +0800, Desmond Cheong Zhi Xi wrote:
> > While checking the master status of the DRM file in
> > drm_is_current_master(), the device's master mutex should be
> > held. Without the mutex, the pointer fpriv->master may be freed
> > concurrently by another process calling drm_setmaster_ioctl(). This
> > could lead to use-after-free errors when the pointer is subsequently
> > dereferenced in drm_lease_owner().
> >
> > The callers of drm_is_current_master() from drm_auth.c hold the
> > device's master mutex, but external callers do not. Hence, we implement
> > drm_is_current_master_locked() to be used within drm_auth.c, and
> > modify drm_is_current_master() to grab the device's master mutex
> > before checking the master status.
> >
> > Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> Merged to drm-misc-fixes, thanks for your patch.

Cc'ed you on the revert, but this blew up in intel-gfx CI. Please cc:
intel-gfx@lists.freedesktop.org for the next round so CI can pick it
up (it doesn't read dri-devel here).

I'm not exactly sure how we can best fix that issue in general, maybe
there's more. But for the specific lockdep splat around getconnector I
think just pulling the call to drm_is_current_master out from the
connector mutex should avoid the issue (just store it locally and then
still have the if() condition under the connector mutex ofc).
-Daniel

> -Daniel
>
> > ---
> >  drivers/gpu/drm/drm_auth.c | 51 ++++++++++++++++++++++++--------------
> >  1 file changed, 32 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > index 232abbba3686..86d4b72e95cb 100644
> > --- a/drivers/gpu/drm/drm_auth.c
> > +++ b/drivers/gpu/drm/drm_auth.c
> > @@ -61,6 +61,35 @@
> >   * trusted clients.
> >   */
> >
> > +static bool drm_is_current_master_locked(struct drm_file *fpriv)
> > +{
> > +     lockdep_assert_held_once(&fpriv->master->dev->master_mutex);
> > +
> > +     return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> > +}
> > +
> > +/**
> > + * drm_is_current_master - checks whether @priv is the current master
> > + * @fpriv: DRM file private
> > + *
> > + * Checks whether @fpriv is current master on its device. This decides whether a
> > + * client is allowed to run DRM_MASTER IOCTLs.
> > + *
> > + * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
> > + * - the current master is assumed to own the non-shareable display hardware.
> > + */
> > +bool drm_is_current_master(struct drm_file *fpriv)
> > +{
> > +     bool ret;
> > +
> > +     mutex_lock(&fpriv->master->dev->master_mutex);
> > +     ret = drm_is_current_master_locked(fpriv);
> > +     mutex_unlock(&fpriv->master->dev->master_mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(drm_is_current_master);
> > +
> >  int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
> >  {
> >       struct drm_auth *auth = data;
> > @@ -223,7 +252,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
> >       if (ret)
> >               goto out_unlock;
> >
> > -     if (drm_is_current_master(file_priv))
> > +     if (drm_is_current_master_locked(file_priv))
> >               goto out_unlock;
> >
> >       if (dev->master) {
> > @@ -272,7 +301,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
> >       if (ret)
> >               goto out_unlock;
> >
> > -     if (!drm_is_current_master(file_priv)) {
> > +     if (!drm_is_current_master_locked(file_priv)) {
> >               ret = -EINVAL;
> >               goto out_unlock;
> >       }
> > @@ -321,7 +350,7 @@ void drm_master_release(struct drm_file *file_priv)
> >       if (file_priv->magic)
> >               idr_remove(&file_priv->master->magic_map, file_priv->magic);
> >
> > -     if (!drm_is_current_master(file_priv))
> > +     if (!drm_is_current_master_locked(file_priv))
> >               goto out;
> >
> >       drm_legacy_lock_master_cleanup(dev, master);
> > @@ -342,22 +371,6 @@ void drm_master_release(struct drm_file *file_priv)
> >       mutex_unlock(&dev->master_mutex);
> >  }
> >
> > -/**
> > - * drm_is_current_master - checks whether @priv is the current master
> > - * @fpriv: DRM file private
> > - *
> > - * Checks whether @fpriv is current master on its device. This decides whether a
> > - * client is allowed to run DRM_MASTER IOCTLs.
> > - *
> > - * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
> > - * - the current master is assumed to own the non-shareable display hardware.
> > - */
> > -bool drm_is_current_master(struct drm_file *fpriv)
> > -{
> > -     return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> > -}
> > -EXPORT_SYMBOL(drm_is_current_master);
> > -
> >  /**
> >   * drm_master_get - reference a master pointer
> >   * @master: &struct drm_master
> > --
> > 2.25.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
