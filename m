Return-Path: <SRS0=S3mN=MW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576B2C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 09:48:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A3060F12
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 09:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1A3060F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C086D4067C;
	Fri, 30 Jul 2021 09:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhElcgjF2d5T; Fri, 30 Jul 2021 09:48:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E948E40650;
	Fri, 30 Jul 2021 09:48:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEA70C001A;
	Fri, 30 Jul 2021 09:48:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22CE6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 09:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1E3183A77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 09:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHGiVHuzV60U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 09:48:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCE36838C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 09:48:44 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id h18so8781513ilc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 02:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/dHQgNBIhi4HkTxU3CwTUDPWzDD5PbqhD37IQU0N6H0=;
 b=PCyiKhrtP+4bA2hNBY9xB73NTn4teEkICoCNu5nT/QCwpVOrtM7l1yIlmGKdsrKJt4
 ljr0DJcOINJT+ha+bh4TManrgpsElkrCFaDTxE/JPu3lTQ/ki/aUOz+ZpwSd22qRkyVD
 QoyNfxh4BzyR7whcuWIW20o/iRgMSViXwu0zQO72RmeHqnGU0oD+pvhcxujHjRlo9BW/
 Y4xA5d7YRLcjOftxMgsgQyq1BvYF5rgorcHDH0dIWq/ZApTnaJji6wcAqLKMqZ5tOEsD
 Syb+C+7VXW5GOtz556zV3XXYRXwN+WFn8H82S8PsKLfrAvK/BDxs1chmuNVEcFJ9ZxLY
 NcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/dHQgNBIhi4HkTxU3CwTUDPWzDD5PbqhD37IQU0N6H0=;
 b=peryd88mUWWKw0HE+nybZdYdGQ43Yct/cIGij0Y6lAqf4n0SifViUKEDs/hcox2bBX
 DpLO0Wi9m6v15bTe7B8UfRJgCXdT35cPI8XjXwQ+xlyFcru8Fs3w2ABS9PxNh3GItcKK
 msYYIIr+wePM/G5ZOfj785kFqruwNu8k5YmLmJsNMousdPqoVmN2kpAB3C+6X87wurRd
 tXsUmsq99tLgL22gJi6lm23vSI15F9zsyz7FCXbnxZYlplozubxx7l4XZZDfUQwT9qPO
 B2yKiukYDxXb2brnGVGnOOqVFrErB8Y+2VkdxyyKEu4ha2DZJ1+CYv/WD6Sr/sHhEB/9
 FeIw==
X-Gm-Message-State: AOAM531JuCvNOd1WtuI0fcaAgN0DizsRAr3yEP4WZFsOSXPwxiuP/+Qb
 gs8s+ECVFjElqVWcMxC/PX4=
X-Google-Smtp-Source: ABdhPJxgmmMdDZOoGx56IPSJxwzZXhR4Xvhtmib4YqV6Npt1VDzjIiJYxCogffB9awxvQrNQyPGjOQ==
X-Received: by 2002:a92:6d07:: with SMTP id i7mr1304876ilc.104.1627638523996; 
 Fri, 30 Jul 2021 02:48:43 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id h24sm798321ioj.32.2021.07.30.02.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 02:48:43 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailauth.nyi.internal (Postfix) with ESMTP id 97DF027C005B;
 Fri, 30 Jul 2021 05:48:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 30 Jul 2021 05:48:42 -0400
X-ME-Sender: <xms:98oDYfw4AIGZbkS-15cy227JnO3H-m6lbq6sXeZza_9OXFO16dM7Uw>
 <xme:98oDYXTHkHiKDEEwMOxRPwCBZHz2q64175IadKG0h4ZWmgDDo8dS2Br6r9Gbd0zSM
 Hsw70UoclqQaWCm_w>
X-ME-Received: <xmr:98oDYZV8J9c4xAT4ACTVFtzlN9WawQW2kiHbgf_4bt14T7MnMZL8ZBnv7lQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheehgdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhm
 rghilhdrtghomheqnecuggftrfgrthhtvghrnhepvdelieegudfggeevjefhjeevueevie
 etjeeikedvgfejfeduheefhffggedvgeejnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsoh
 hnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhg
 peepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:98oDYZhV_Wnjolu2Qy95wo79oqSS5lE3XQTM8Ol2m8bMVaqOts9Z8A>
 <xmx:98oDYRDGJ7Cum_44BwPjI6WevrZxs0rqIRNbEkt3BJJZT0leahDYuA>
 <xmx:98oDYSJRiLRSNPa1TkG5WLMkG_GQfkbsW3Sdq89uTtppJ3QC-JqxVg>
 <xmx:-coDYZZHDQ2qHuklUAYcrdl0qGUPXzbafW6xSCHzefYmpGT8u95JXTlgOCQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jul 2021 05:48:39 -0400 (EDT)
Date: Fri, 30 Jul 2021 17:48:14 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 2/2] drm: add lockdep assert to
 drm_is_current_master_locked
Message-ID: <YQPK3jMU69WMsCjT@boqun-archlinux>
References: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
 <20210730041515.1430237-3-desmondcheongzx@gmail.com>
 <YQOXTW8kSHdNjhiY@boqun-archlinux>
 <35518f4b-5e4a-b284-1f86-5cba64941211@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35518f4b-5e4a-b284-1f86-5cba64941211@gmail.com>
Cc: tzimmermann@suse.de, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, peterz@infradead.org,
 mingo@redhat.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 longman@redhat.com, will@kernel.org,
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

On Fri, Jul 30, 2021 at 04:06:44PM +0800, Desmond Cheong Zhi Xi wrote:
> On 30/7/21 2:08 pm, Boqun Feng wrote:
> > On Fri, Jul 30, 2021 at 12:15:15PM +0800, Desmond Cheong Zhi Xi wrote:
> > > In drm_is_current_master_locked, accessing drm_file.master should be
> > > protected by either drm_file.master_lookup_lock or
> > > drm_device.master_mutex. This was previously awkward to assert with
> > > lockdep.
> > > 
> > > Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
> > > helpers"), this assertion is now convenient so we add it in.
> > > 
> > > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > > ---
> > >   drivers/gpu/drm/drm_auth.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > index 9c24b8cc8e36..6f4d7ff23c80 100644
> > > --- a/drivers/gpu/drm/drm_auth.c
> > > +++ b/drivers/gpu/drm/drm_auth.c
> > > @@ -63,9 +63,9 @@
> > >   static bool drm_is_current_master_locked(struct drm_file *fpriv)
> > >   {
> > > -	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> > > -	 * should be held here.
> > > -	 */
> > > +	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
> > > +			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
> > > +
> > 
> > I think it's better to also add the lockdep_assert() of & (i.e. both
> > held) in the updater side, and have comments pointing to each other.
> > 
> > Is it convenient to do in this patchset? If the updater side doesn't
> > need to put the lockdep_assert() (maybe the lock acquire code and the
> > update code are in the same function), it's still better to add some
> 
> Thanks for the feedback, Boqun.
> 
> Yeah, I think the updater side maybe doesn't need new lockdep_assert()
> because what currently happens is either
> 
> 	lockdep_assert_held_once(&dev->master_mutex);
> 	/* 6 lines of prep */
> 	spin_lock(&fpriv->master_lookup_lock);
> 	fpriv->master = new_value;
> or
> 	mutex_lock(&dev->master_mutex);
> 	/* 3 lines of checks */
> 		spin_lock(&file_priv->master_lookup_lock);
> 		file_priv->master = new_value;
> 
> > comments like:
> > 
> > 	/*
> > 	 * To update drm_file.master, both drm_file.master_lookup_lock
> > 	 * and drm_device.master_mutex are needed, therefore holding
> > 	 * either of them is safe and enough for the read side.
> > 	 */
> > 
> > Just feel it's better to explain the lock design either in the
> > lockdep_assert() or comments.
> > 
> 
> But clarifying the lock design in the documentation sounds like a really
> good idea.
> 
> Probably a good place for this would be in the kerneldoc where we also
> explain the lifetime rules and usage of the pointer outside drm_auth.c:
> 
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 726cfe0ff5f5..a3acb7ac3550 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -233,6 +233,10 @@ struct drm_file {
>  	 * this only matches &drm_device.master if the master is the currently
>  	 * active one.
>  	 *
> +	 * To update @master, both &drm_device.master_mutex and
> +	 * @master_lookup_lock need to be held, therefore holding either of
> +	 * them is safe and enough for the read side.
> +	 *
>  	 * When dereferencing this pointer, either hold struct
>  	 * &drm_device.master_mutex for the duration of the pointer's use, or
>  	 * use drm_file_get_master() if struct &drm_device.master_mutex is not

Works for me ;-)

For the whole series, feel free to add:

Acked-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> 
> Best wishes,
> Desmond
> 
> > Regards,
> > Boqun
> > 
> > >   	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> > >   }
> > > -- 
> > > 2.25.1
> > > 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
