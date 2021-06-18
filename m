Return-Path: <SRS0=f3wf=LM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B227C49361
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 21:50:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B3B613DA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 21:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B3B613DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 683DB83CEA;
	Fri, 18 Jun 2021 21:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvUfDl0AX5tk; Fri, 18 Jun 2021 21:49:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7594883CF8;
	Fri, 18 Jun 2021 21:49:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A0CBC000D;
	Fri, 18 Jun 2021 21:49:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3078AC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 21:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2247540413
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 21:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZnUSyuLUmzD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 21:49:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D05A40412
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 21:49:55 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id h9so12138427oih.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 14:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HftXY5HZKwK0KDmrBsoMx+gpdQ5siROESOKP5dy/F8=;
 b=E5olw9SNmfZevEbrfodkTk+8lQ8FK9yhuIepr6RmTNMNS7E/5JPaqHsWjJwljb/7co
 wjYovRqsciFEBTwBolV2xyNw5YM4FDKM8ubtqaGgcfizb7PcKO3xu4CrXDvMhJVW2hCw
 T7rR7MbxN2++yz8pOf+/WOx1KgNeQIEW0F/bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HftXY5HZKwK0KDmrBsoMx+gpdQ5siROESOKP5dy/F8=;
 b=Y45P7ILamjValdYaa5J2gJE5rqDs8eYvM7bjf4a55hkIzkYxmcMWCjsaB6kNJCZyUs
 R3P3CgNFtGqjbTZkIY29Y3usIDc3w8ckCLQXmcIzipzl+6Xed2ZsgEkWpPyD2jNcwVzS
 /MD6covAgSYX9UzmoPPi1nH6IQ/Hf/G0TTEJpbHJJnj1sfXTrMRUeLeLy358Mo8LY/R5
 uNGYDwuAP6pHyx1FW2cGHKv5zBHvdpL9geIgxXhMqn2wwreO8wY6CuGEWJRst8TOUiBa
 qs0Vy9aQPPCmgW6hFFwK5D9MIvphXIBQvBeK4GZY1MyNxWHXG1BXIYqoZ21Jw7vDgV2n
 EYYg==
X-Gm-Message-State: AOAM530dZeCg0IRjsn8tmSMvNzt15ebkcDVR5IAJjUsFIxU0JHiemQU8
 ZABBQGV0m6yNG4PFMDE8NtLwaQpHosVbymryqpNblQ==
X-Google-Smtp-Source: ABdhPJwKO5vg9+uabQtIu/70bMMPgrZlz4a83uLAcEPA/chF0LOMNhAfoDdvjtPr7xyUaHQEQ4CfnCCKrYrBx3IsfHU=
X-Received: by 2002:aca:530f:: with SMTP id h15mr9047358oib.128.1624052994077; 
 Fri, 18 Jun 2021 14:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
 <20210615023645.6535-3-desmondcheongzx@gmail.com>
 <YMuCYqLafn5sGcFo@phenom.ffwll.local>
 <c384d835-d910-5b04-e88c-a7878ce6d37d@gmail.com>
 <CAKMK7uE-3S_vOm7DsqFyvHngSTwoc5ibzt46-9FcC550Qd9+jw@mail.gmail.com>
 <a43b752e-e823-01ea-9902-1c5e173aa6bf@gmail.com>
In-Reply-To: <a43b752e-e823-01ea-9902-1c5e173aa6bf@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 18 Jun 2021 23:49:43 +0200
Message-ID: <CAKMK7uEdoLUc5HAXR3Bvdj1yp=ooEr-0cEuHrBX6uKXJXjPcxw@mail.gmail.com>
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

On Fri, Jun 18, 2021 at 6:54 PM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
>
> On 18/6/21 5:12 pm, Daniel Vetter wrote:
> > On Fri, Jun 18, 2021 at 5:05 AM Desmond Cheong Zhi Xi
> > <desmondcheongzx@gmail.com> wrote:
> >> On 18/6/21 1:12 am, Daniel Vetter wrote:
> >>> On Tue, Jun 15, 2021 at 10:36:45AM +0800, Desmond Cheong Zhi Xi wrote:
> >>>> This patch ensures that the device's master mutex is acquired before
> >>>> accessing pointers to struct drm_master that are subsequently
> >>>> dereferenced. Without the mutex, the struct drm_master may be freed
> >>>> concurrently by another process calling drm_setmaster_ioctl(). This
> >>>> could then lead to use-after-free errors.
> >>>>
> >>>> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> >>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >>>> ---
> >>>>    drivers/gpu/drm/drm_lease.c | 58 +++++++++++++++++++++++++++----------
> >>>>    1 file changed, 43 insertions(+), 15 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> >>>> index da4f085fc09e..3e6f689236e5 100644
> >>>> --- a/drivers/gpu/drm/drm_lease.c
> >>>> +++ b/drivers/gpu/drm/drm_lease.c
> >>>> @@ -107,10 +107,16 @@ static bool _drm_has_leased(struct drm_master *master, int id)
> >>>>     */
> >>>>    bool _drm_lease_held(struct drm_file *file_priv, int id)
> >>>>    {
> >>>> +    bool ret;
> >>>> +
> >>>>       if (!file_priv || !file_priv->master)
> >>>>               return true;
> >>>>
> >>>> -    return _drm_lease_held_master(file_priv->master, id);
> >>>> +    mutex_lock(&file_priv->master->dev->master_mutex);
> >>>
> >>> So maybe we have a bug somewhere, and the kerneldoc isn't 100% clear, but
> >>> I thought file_priv->master is invariant over the lifetime of file_priv.
> >>> So we don't need a lock to check anything here.
> >>>
> >>> It's the drm_device->master derefence that gets us into trouble. Well also
> >>> file_priv->is_owner is protected by dev->master_mutex.
> >>>
> >>> So I think with your previous patch all the access here in drm_lease.c is
> >>> ok and already protected? Or am I missing something?
> >>>
> >>> Thanks, Daniel
> >>>
> >>
> >> My thinking was that file_priv->master is invariant only if it is the
> >> creator of master. If file_priv->is_master is false, then a call to
> >> drm_setmaster_ioctl will invoke drm_new_set_master, which then allocates
> >> a new master for file_priv, and puts the old master.
> >>
> >> This could be an issue in _drm_lease_held_master, because we dereference
> >> master to get master->dev, master->lessor, and master->leases.
> >>
> >> With the same reasoning, in other parts of drm_lease.c, if there's an
> >> access to drm_file->master that's subsequently dereferenced, I added a
> >> lock around them.
> >>
> >> I could definitely be mistaken on this, so apologies if this scenario
> >> doesn't arise.
> >
> > You're right, I totally missed that setmaster can create a new master
> > instance. And the kerneldoc for drm_file->master doesn't explain this
> > and mention that we must hold drm_device.master_mutex while looking at
> > that pointer. Can you pls do a patch which improves the documentation
> > for that?
> >
>
> Sounds good, I'll add it to the patch series.
>
> > Now for the patch itself I'm not entirely sure what we should do.
> > Leaking the dev->master_mutex into drm_lease.c just because of the
> > setmaster ioctl is kinda unsightly. And we don't really care about the
> > fpriv->master changing under us, we only need to make sure it doesn't
> > get freed. And drm_master is refcounted already.
> >
> > So alternative solution: We add a drm_file_get_master() function which
> > calls drm_master_get under the lock, and we use that instead of
> > directly derefencing drm_file->master? Ofc then needs drm_master_put
> > instead of mutex_unlock. Kerneldoc should then also point at this new
> > function as the correct way to look at drm_file->master state.
> >
> > This way it's 100% clear we're dealing with a lifetime issue and not a
> > consistency issues.
> >
> > What do you think?
> > -Daniel
> >
>
> Makes sense to me, since the drm master itself holds the lease, as long
> as it isn't freed while we're using it, there's no need to prevent the
> value of fpriv->master from changing after we access it in drm_lease.c.
>
> I was going to say that it may be unclear when to use the
>
>         master = drm_file_get_master(file_priv);
>         ...
>         drm_master_put(&master);
>
> pattern, versus when to use
>
>         mutex_lock(&dev->master_mutex);
>         master = file_priv->master;
>         ...
>         mutex_unlock(&dev->master_mutex);
>
> . The second pattern, for example, is used in drm_getunique, and also in
> drm_setversion which calls drm_set_busid.
>
> But on closer inspection, it's clearer to me now that those functions
> need the master_mutex because they access protected fields such as
> unique and unique_len.
>
> Would it then be correct to state in the kerneldoc that
> drm_file_get_master() should be used to look at drm_file->master only if
> we aren't already holding master_mutex + have no other need to grab
> master_mutex?

Yeah that's sounds like a good decider for which variant to pick.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
