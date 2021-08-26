Return-Path: <SRS0=MGRu=NR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AD2C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Aug 2021 12:51:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8592460184
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Aug 2021 12:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8592460184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4978D42628;
	Thu, 26 Aug 2021 12:51:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKEx0AzB14Qg; Thu, 26 Aug 2021 12:51:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2AD6642595;
	Thu, 26 Aug 2021 12:51:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E358C001A;
	Thu, 26 Aug 2021 12:51:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18909C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 12:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E77008268F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 12:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AhK0o9byawP7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 12:51:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 982CC82681
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 12:51:17 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u3so5951675ejz.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Aug 2021 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=FpiPnansJu8DUu+/nHhIKk3mLIrXLuVC7r4JsYSdoWk=;
 b=ftuxs5ZJnnCztKpDs1pIMs0oUtnLWsyEXzaS2DrIYBCSzQ24ijdkVP5Max2f76G1/Y
 aK5Tpqc8weHkVwlG3lxMhCnRlCLBnvlO3YhanwRSGhdrr7uIabDMFcOi0p17/+CXJSW6
 ej/XHYGU+xOQfkQcnBxPFqwJ1+c3hJneZ6xL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=FpiPnansJu8DUu+/nHhIKk3mLIrXLuVC7r4JsYSdoWk=;
 b=s4tMPdNW4wpF0ekLsD+vikLUuD9mJQItvNTeZyxyr/pjWB8+c2LfoykvJi0Ic5wu6F
 DbjGcbviSiqENlEJtHMKUT8ce7YLmxH/+NjFDTh5WLz18tUFih+3Nd7Fo82WTXjeBNoh
 7ZPyjQHUyorWufi0Qv4uOyS8X+Kb3x+udOxKZJK6ddUiIdtzqdRRTKjEGUZAODLhBtIn
 iHM69joc7VVqbpeSSqktuR3+Kl5fRFl8kjtyjho7Vxti2CB4EVFxqn5YLdZBwCKUBkpv
 cl2hywYkSZHrqzJWQ1BT6LodLJlFskuFzLcuIlS3cWXKc9MEpEPsmB+8TDacqsaZBCjo
 B4Sg==
X-Gm-Message-State: AOAM5327Yhh+BQ8ITLMDpICzzNO+Gzr8NhMJk1i5gHr82p0x6bSeTh3f
 Fw1/lc0bqPlq7k3+LLzz7HIz0g==
X-Google-Smtp-Source: ABdhPJwiU1iz9dGMmeH2SkpHjq951CirdwGa0NEoXjpkdbU7c5JjTnCgL90lsIndPAL+xlmyQN94eg==
X-Received: by 2002:a17:907:8693:: with SMTP id
 qa19mr2224090ejc.95.1629982275725; 
 Thu, 26 Aug 2021 05:51:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id gz22sm1462270ejb.15.2021.08.26.05.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 05:51:15 -0700 (PDT)
Date: Thu, 26 Aug 2021 14:51:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v8 1/7] drm: fix null ptr dereference in
 drm_master_release
Message-ID: <YSeOQMxytJ/i3tEe@phenom.ffwll.local>
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
 <YSdkjvWN9RAijZJy@phenom.ffwll.local>
 <05f4d472-7a76-598a-e792-a847a3e8516a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05f4d472-7a76-598a-e792-a847a3e8516a@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: airlied@linux.ie, joonas.lahtinen@linux.intel.com, jose.souza@intel.com,
 chris@chris-wilson.co.uk, sumit.semwal@linaro.org,
 ville.syrjala@linux.intel.com, linux-graphics-maintainer@vmware.com,
 matthew.auld@intel.com, airlied@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 aditya.swarup@intel.com, lucas.demarchi@intel.com, mripard@kernel.org,
 linaro-mm-sig@lists.linaro.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, andrescj@chromium.org, matthew.d.roper@intel.com,
 tvrtko.ursulin@intel.com, dri-devel@lists.freedesktop.org,
 karthik.b.s@intel.com, linux-kernel@vger.kernel.org, manasi.d.navare@intel.com,
 tzimmermann@suse.de, christian.koenig@amd.com, zackr@vmware.com
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

On Thu, Aug 26, 2021 at 07:53:58PM +0800, Desmond Cheong Zhi Xi wrote:
> On 26/8/21 5:53 pm, Daniel Vetter wrote:
> > On Thu, Aug 26, 2021 at 10:01:16AM +0800, Desmond Cheong Zhi Xi wrote:
> > > drm_master_release can be called on a drm_file without a master, which
> > > results in a null ptr dereference of file_priv->master->magic_map. The
> > > three cases are:
> > > 
> > > 1. Error path in drm_open_helper
> > >    drm_open():
> > >      drm_open_helper():
> > >        drm_master_open():
> > >          drm_new_set_master(); <--- returns -ENOMEM,
> > >                                     drm_file.master not set
> > >        drm_file_free():
> > >          drm_master_release(); <--- NULL ptr dereference
> > >                                     (file_priv->master->magic_map)
> > > 
> > > 2. Error path in mock_drm_getfile
> > >    mock_drm_getfile():
> > >      anon_inode_getfile(); <--- returns error, drm_file.master not set
> > >      drm_file_free():
> > >        drm_master_release(); <--- NULL ptr dereference
> > >                                   (file_priv->master->magic_map)
> > > 
> > > 3. In drm_client_close, as drm_client_open doesn't set up a master
> > > 
> > > drm_file.master is set up in drm_open_helper through the call to
> > > drm_master_open, so we mirror it with a call to drm_master_release in
> > > drm_close_helper, and remove drm_master_release from drm_file_free to
> > > avoid the null ptr dereference.
> > > 
> > > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > I guess we should also have a cc: stable on this one? I think this bug
> > existed since pretty much forever, but maybe more prominent with the
> > drm_client stuff added a while ago.
> > -Daniel
> > 
> 
> Thanks for the reviews, Daniel.
> 
> Took a closer look. I think if we cc: stable, this fix should accompany
> commit 7eeaeb90a6a5 ("drm/file: Don't set master on in-kernel clients")
> which moves the drm_master_open out from drm_file_alloc into
> drm_open_helper.

Ah right, please reference that commit with a Fixes: line.
-Daniel

> 
> > > ---
> > >   drivers/gpu/drm/drm_file.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > > index ed25168619fc..90b62f360da1 100644
> > > --- a/drivers/gpu/drm/drm_file.c
> > > +++ b/drivers/gpu/drm/drm_file.c
> > > @@ -282,9 +282,6 @@ void drm_file_free(struct drm_file *file)
> > >   	drm_legacy_ctxbitmap_flush(dev, file);
> > > -	if (drm_is_primary_client(file))
> > > -		drm_master_release(file);
> > > -
> > >   	if (dev->driver->postclose)
> > >   		dev->driver->postclose(dev, file);
> > > @@ -305,6 +302,9 @@ static void drm_close_helper(struct file *filp)
> > >   	list_del(&file_priv->lhead);
> > >   	mutex_unlock(&dev->filelist_mutex);
> > > +	if (drm_is_primary_client(file_priv))
> > > +		drm_master_release(file_priv);
> > > +
> > >   	drm_file_free(file_priv);
> > >   }
> > > -- 
> > > 2.25.1
> > > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
