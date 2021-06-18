Return-Path: <SRS0=f3wf=LM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5219FC48BE8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 09:13:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09B6060FD8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 09:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09B6060FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D5A41582;
	Fri, 18 Jun 2021 09:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQdinJBjzTn3; Fri, 18 Jun 2021 09:13:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 95042414C0;
	Fri, 18 Jun 2021 09:13:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B152C000D;
	Fri, 18 Jun 2021 09:13:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83C80C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 09:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64C2D6073A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 09:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fBYud23QhVNN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 09:13:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E3F560718
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 09:13:09 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 66-20020a9d02c80000b02903615edf7c1aso8995127otl.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 02:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=naLHEsuCCs4Fcb1r5mYO3/AVmqvBmoebiHpV20smRWA=;
 b=GHd7IR2qJU3StSL8QB47NRhFSsRGnHy4mieFnZDwqtAklNf7YBRKDvm/IGy9KBjnS1
 eWpMhv4Sg51xeG4ZfRuiPbZXWh2KWgD/LetEgJ0ZwB8NBngmTRHyiGkntSfaHEZAMRwe
 sqzEQ6yR0Zn4RU38m44TBbeJhAdr2ERNYV3BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=naLHEsuCCs4Fcb1r5mYO3/AVmqvBmoebiHpV20smRWA=;
 b=GLsTzT0BQOgs1gWDxf2YmhFb/BnmpM63fDqQTYuKxRsyHwVz0WydwkF10FDctSGhMT
 joqd8a+S5vMOJySnu/lB3GBQ8S8OBZML28OqvLDerAdRai9c8TCaX6Ox4iYbQ4U1kQGd
 94cUTqsQGchUtcDAaKIQgeeiMMocoPuAVBbm2+QRRq3OBuGvchBrJtxOumKEle1WiM0C
 ECD14Hu1VK+WluD1MaHOHSPOFBJgCY0TjRvbSbZS3/gxnLcBblFd6YSWU1semvQTSq7F
 /jthisGZg2Nk8kRn67vogLcj++L4paN1iHGbsGfg6xGFZWtLl5EV+kyzxHf66t7QrUx/
 w+hw==
X-Gm-Message-State: AOAM531XcyCE+kGpPdft3iQq0DAXcqCfxlxZKvnf3OtrKXfkpPrh3MpJ
 tgvMvKLqOwHb7fCAUPB4X6nIF6Zz9FMd0ahZS/o14w==
X-Google-Smtp-Source: ABdhPJxgpitxyVtOLxsFHGCQMUCu/rZqASW5/KbUvmThXsKPZTwp9fwtH9L3/bRNWE5tLQeLoP0eBWfvljngPPaBFEo=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr8438414otb.281.1624007588286; 
 Fri, 18 Jun 2021 02:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
 <20210615023645.6535-3-desmondcheongzx@gmail.com>
 <YMuCYqLafn5sGcFo@phenom.ffwll.local>
 <c384d835-d910-5b04-e88c-a7878ce6d37d@gmail.com>
In-Reply-To: <c384d835-d910-5b04-e88c-a7878ce6d37d@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 18 Jun 2021 11:12:57 +0200
Message-ID: <CAKMK7uE-3S_vOm7DsqFyvHngSTwoc5ibzt46-9FcC550Qd9+jw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: Protect drm_master pointers in drm_lease.c
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: Dave Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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

On Fri, Jun 18, 2021 at 5:05 AM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
> On 18/6/21 1:12 am, Daniel Vetter wrote:
> > On Tue, Jun 15, 2021 at 10:36:45AM +0800, Desmond Cheong Zhi Xi wrote:
> >> This patch ensures that the device's master mutex is acquired before
> >> accessing pointers to struct drm_master that are subsequently
> >> dereferenced. Without the mutex, the struct drm_master may be freed
> >> concurrently by another process calling drm_setmaster_ioctl(). This
> >> could then lead to use-after-free errors.
> >>
> >> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> >> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >> ---
> >>   drivers/gpu/drm/drm_lease.c | 58 +++++++++++++++++++++++++++----------
> >>   1 file changed, 43 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> >> index da4f085fc09e..3e6f689236e5 100644
> >> --- a/drivers/gpu/drm/drm_lease.c
> >> +++ b/drivers/gpu/drm/drm_lease.c
> >> @@ -107,10 +107,16 @@ static bool _drm_has_leased(struct drm_master *master, int id)
> >>    */
> >>   bool _drm_lease_held(struct drm_file *file_priv, int id)
> >>   {
> >> +    bool ret;
> >> +
> >>      if (!file_priv || !file_priv->master)
> >>              return true;
> >>
> >> -    return _drm_lease_held_master(file_priv->master, id);
> >> +    mutex_lock(&file_priv->master->dev->master_mutex);
> >
> > So maybe we have a bug somewhere, and the kerneldoc isn't 100% clear, but
> > I thought file_priv->master is invariant over the lifetime of file_priv.
> > So we don't need a lock to check anything here.
> >
> > It's the drm_device->master derefence that gets us into trouble. Well also
> > file_priv->is_owner is protected by dev->master_mutex.
> >
> > So I think with your previous patch all the access here in drm_lease.c is
> > ok and already protected? Or am I missing something?
> >
> > Thanks, Daniel
> >
>
> My thinking was that file_priv->master is invariant only if it is the
> creator of master. If file_priv->is_master is false, then a call to
> drm_setmaster_ioctl will invoke drm_new_set_master, which then allocates
> a new master for file_priv, and puts the old master.
>
> This could be an issue in _drm_lease_held_master, because we dereference
> master to get master->dev, master->lessor, and master->leases.
>
> With the same reasoning, in other parts of drm_lease.c, if there's an
> access to drm_file->master that's subsequently dereferenced, I added a
> lock around them.
>
> I could definitely be mistaken on this, so apologies if this scenario
> doesn't arise.

You're right, I totally missed that setmaster can create a new master
instance. And the kerneldoc for drm_file->master doesn't explain this
and mention that we must hold drm_device.master_mutex while looking at
that pointer. Can you pls do a patch which improves the documentation
for that?

Now for the patch itself I'm not entirely sure what we should do.
Leaking the dev->master_mutex into drm_lease.c just because of the
setmaster ioctl is kinda unsightly. And we don't really care about the
fpriv->master changing under us, we only need to make sure it doesn't
get freed. And drm_master is refcounted already.

So alternative solution: We add a drm_file_get_master() function which
calls drm_master_get under the lock, and we use that instead of
directly derefencing drm_file->master? Ofc then needs drm_master_put
instead of mutex_unlock. Kerneldoc should then also point at this new
function as the correct way to look at drm_file->master state.

This way it's 100% clear we're dealing with a lifetime issue and not a
consistency issues.

What do you think?
-Daniel


>
> Best wishes,
> Desmond
>
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
