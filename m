Return-Path: <SRS0=OZPh=LF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD0EC4743D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Jun 2021 07:27:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A46B3613AE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Jun 2021 07:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A46B3613AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68CA483BCC;
	Fri, 11 Jun 2021 07:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ydynhsidx7gD; Fri, 11 Jun 2021 07:27:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 655C783BA8;
	Fri, 11 Jun 2021 07:27:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39B97C000E;
	Fri, 11 Jun 2021 07:27:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D582C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 07:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D490240695
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 07:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iLnXGyx-6SPm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 07:27:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3653340E43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 07:27:04 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 j11-20020a9d738b0000b02903ea3c02ded8so2289499otk.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ef52vRx74fc5UCfQHCig8+5esV/3pCK5+NiUbiLHnvQ=;
 b=Y8ThRrG17JeXYR82682Is0eVQuuGT56zmi/UILuLbklbnOVQnRJ1XIFjtxrdreVOaF
 GKaqSSnp7EA3r+zs6//WcDeAM/4EyuYJhcPtU5c8VEUluGgfIZNKeJJQBqWrcKIRyRXr
 OM0MezCo/yFyiRRiG1Zkhf1jxbtS+PdNwVLn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ef52vRx74fc5UCfQHCig8+5esV/3pCK5+NiUbiLHnvQ=;
 b=qpRMvqGT8YK/lvidgQjSkNYQXxP3P9cCxTVj5SL1k8DhjgT6uj2eHBEYVadih+ern9
 1WVm5+58esHVT/aoxAM6Dh0xCBu9qjZFnXbG+X6FNpclrWT/Fw+dE0GR7AtzrnpnMWsH
 w1CJdOftKf4FA8ipQWJgEtrwt5RlZHAKVp4Sfo3XqdubaO9luXNshGeJtoBVALGBM/mq
 zAMmmFT2k/493p6vouUUVtqzt4Msyc0ZaeJmdbkkCldWJf/Zj0/oRhCh+ox8urzxuzXQ
 i2Ieo9/Om+jBdE41ACr+LPXU40cjkYloxwc32XUAfwGq6RjJcXbJMvuAP1PxzduU2ivt
 iteg==
X-Gm-Message-State: AOAM531a/D24kYgfu6zqaM/t6TCElLnVYfi2AYUoa1FJHuMX9wDqF0sp
 FpTSHTs7CNStww9MBxqLh/RsFFefkaqkhX8ATIw7Fw==
X-Google-Smtp-Source: ABdhPJz3IOQqQF+lRvx53nYLgYJH0he5j+6eXuQM7b70P1oLbyxSfT5qUOpvpqgUteIugcKijfjghWgWanPrcPLy+6E=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr1933399otb.281.1623396423931; 
 Fri, 11 Jun 2021 00:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210609092119.173590-1-desmondcheongzx@gmail.com>
 <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
 <f16f4123-bd0b-f09c-ddf1-7197c841b588@gmail.com>
 <YMJCdG7k5sNaiHen@phenom.ffwll.local>
 <d8150fdb-3a59-e491-f148-1c528fe3c824@gmail.com>
In-Reply-To: <d8150fdb-3a59-e491-f148-1c528fe3c824@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 11 Jun 2021 09:26:52 +0200
Message-ID: <CAKMK7uEAs0ZJiN_x0Od03yiLuh38=x8vNqv=b3Zr7BMy+Fbr1w@mail.gmail.com>
Subject: Re: [PATCH] drm: Lock pointer access in drm_master_release()
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: Dave Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
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

On Fri, Jun 11, 2021 at 4:18 AM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
 On 11/6/21 12:48 am, Daniel Vetter wrote:
> > On Thu, Jun 10, 2021 at 11:21:39PM +0800, Desmond Cheong Zhi Xi wrote:
> >> On 10/6/21 6:10 pm, Daniel Vetter wrote:
> >>> On Wed, Jun 09, 2021 at 05:21:19PM +0800, Desmond Cheong Zhi Xi wrote:
> >>>> This patch eliminates the following smatch warning:
> >>>> drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'
> >>>>
> >>>> The 'file_priv->master' field should be protected by the mutex lock to
> >>>> '&dev->master_mutex'. This is because other processes can concurrently
> >>>> modify this field and free the current 'file_priv->master'
> >>>> pointer. This could result in a use-after-free error when 'master' is
> >>>> dereferenced in subsequent function calls to
> >>>> 'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.
> >>>>
> >>>> An example of a scenario that would produce this error can be seen
> >>>> from a similar bug in 'drm_getunique()' that was reported by Syzbot:
> >>>> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
> >>>>
> >>>> In the Syzbot report, another process concurrently acquired the
> >>>> device's master mutex in 'drm_setmaster_ioctl()', then overwrote
> >>>> 'fpriv->master' in 'drm_new_set_master()'. The old value of
> >>>> 'fpriv->master' was subsequently freed before the mutex was unlocked.
> >>>>
> >>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >>>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> >>>
> >>> Thanks a lot. I've done an audit of this code, and I found another
> >>> potential problem in drm_is_current_master. The callers from drm_auth.c
> >>> hold the dev->master_mutex, but all the external ones dont. I think we
> >>> need to split this into a _locked function for use within drm_auth.c, and
> >>> the exported one needs to grab the dev->master_mutex while it's checking
> >>> master status. Ofc there will still be races, those are ok, but right now
> >>> we run the risk of use-after free problems in drm_lease_owner.
> >>>
> >>> Are you up to do that fix too?
> >>>
> >>
> >> Hi Daniel,
> >>
> >> Thanks for the pointer, I'm definitely up for it!
> >>
> >>> I think the drm_lease.c code also needs an audit, there we'd need to make
> >>> sure that we hold hold either the lock or a full master reference to avoid
> >>> the use-after-free issues here.
> >>>
> >>
> >> I'd be happy to look into drm_lease.c as well.
> >>
> >>> Patch merged to drm-misc-fixes with cc: stable.
> >>> -Daniel
> >>>
> >>>> ---
> >>>>    drivers/gpu/drm/drm_auth.c | 3 ++-
> >>>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> >>>> index f00e5abdbbf4..b59b26a71ad5 100644
> >>>> --- a/drivers/gpu/drm/drm_auth.c
> >>>> +++ b/drivers/gpu/drm/drm_auth.c
> >>>> @@ -315,9 +315,10 @@ int drm_master_open(struct drm_file *file_priv)
> >>>>    void drm_master_release(struct drm_file *file_priv)
> >>>>    {
> >>>>            struct drm_device *dev = file_priv->minor->dev;
> >>>> -  struct drm_master *master = file_priv->master;
> >>>> +  struct drm_master *master;
> >>>>
> >>>>            mutex_lock(&dev->master_mutex);
> >>>> +  master = file_priv->master;
> >>>>            if (file_priv->magic)
> >>>>                    idr_remove(&file_priv->master->magic_map, file_priv->magic);
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>
> >>
> >>  From what I can see, there are other places in the kernel that could use the
> >> _locked version of drm_is_current_master as well, such as drm_mode_getfb in
> >> drm_framebuffer.c. I'll take a closer look, and if the changes make sense
> >> I'll prepare a patch series for them.
> >
> > Oh maybe we have a naming confusion: the _locked is the one where the
> > caller must grab the lock already, whereas drm_is_current_master would
> > grab the master_mutex internally to do the check. The one in
> > drm_framebuffer.c looks like it'd need the internal one since there's no
> > other need to grab the master_mutex.
> > -Daniel
> >
>
> Ah ok got it, I think I confused myself earlier.
>
> Just to check, may I include you in a Reported-by: tag?

Sure.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
