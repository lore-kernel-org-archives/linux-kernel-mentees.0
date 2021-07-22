Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9572C6377D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 15:05:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530F96128C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 15:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 530F96128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1798E40140;
	Thu, 22 Jul 2021 15:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29uxEeFsQAip; Thu, 22 Jul 2021 15:05:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2BB2E4010C;
	Thu, 22 Jul 2021 15:05:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11ACDC0010;
	Thu, 22 Jul 2021 15:05:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3FDDC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 15:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 957F040323
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 15:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9PvOKpHxd-Uf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 15:04:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54477405C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 15:04:58 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id b6so5601663iln.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pdY6rhVpt2cvtRD9X+6uRamQHWbNgW9tGd+/rf6LByw=;
 b=LfsodAg1o0ijTbK+UfgG4wZc2ri4Sy1nUrT/7gxYKMSxuvQ+PZJee8lZ8iU8iY7YFF
 hYuYP7CWfASDCME7zXCXWrJMHrwbwEOoVAC6enIZFmZGsym+ZslNIazL0Yu3CiGMFDQm
 JLmWMtUrUa4HuratO6FsGooWyNX1Mna9Y0z7CHCNCJTkrW7QD+1CEu5sJMGbVjPKGoks
 JWXLdZ4HwnDvYbBD+1ckhsYvFxWiEFEs3T+198xWlTn0EU+Vrm4lspa2q6TFX+UWSY5+
 0+GQHEm1qB+1uQyzFvO+k3OEIay5gz6KO2ZU7U1MSd44k0v3GKixXoOry47KjWPS3mTC
 i4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pdY6rhVpt2cvtRD9X+6uRamQHWbNgW9tGd+/rf6LByw=;
 b=C68FeCygHM9uvOVOGIML0zTpTI3bifL22wSmLb7nnJ6OWVTOjkBHRa/96W916O2FPt
 waKy9FBvr1tThmhmLyDtRgcxsW3IXij0921/FfVjMemlfss8NYUw5CPTS1s05Ysx2BVZ
 78qmto6YLsBmPOxcVDQkVnjZn78i/hzZDd0g+52aYT/r/G28lgCiX9yTWGK9/+3j3dvg
 1nz8R5ZHR3HjW8y6qAsIbDVwnwAK9y3gkwuQGjJxkrFR8ureowmyyF+me+8v+cJgXrnl
 0l4OsCk8gPF+hNy/u3IzzgOyksRX3bAC3Am8ldP/Hk5fhozOmX0SHbfzltyOwylWz5tl
 FKkg==
X-Gm-Message-State: AOAM530EWVtl5hS7Nl9FLWbka1OiObY9VXhjd127qAEhB0f88be4hs1t
 +0evCn1cjbMTogHYo6FKCU8=
X-Google-Smtp-Source: ABdhPJx/iCOEfKNx6SSZefLw/rcSZSwYcTvNl8FtSu3/Q1+/ix8XCODVcVTLTL+UhF83S6mF8+E0Ow==
X-Received: by 2002:a92:c8c3:: with SMTP id c3mr193016ilq.153.1626966297417;
 Thu, 22 Jul 2021 08:04:57 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228])
 by smtp.gmail.com with ESMTPSA id d9sm7011761ilv.62.2021.07.22.08.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:04:56 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id DE65C27C0054;
 Thu, 22 Jul 2021 11:04:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 22 Jul 2021 11:04:54 -0400
X-ME-Sender: <xms:FYn5YAWD-wPR-RVw-WwgbE4Lz_ycSmb-gkti1iUf_GKPSuyM0GECsg>
 <xme:FYn5YEljXxBbC0VSh0ebQokzBVcIcnrl0abPWqqHKUFaXSoDB_y7md7LMg0moircI
 GhFOubvfNfPTQZQIg>
X-ME-Received: <xmr:FYn5YEY0fXjO9nL8oqKGhmiVbxt2vJDbd4VVLFFaXI-DVT7NzWLz3N0GbW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeigdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
 hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
 gvrhhnpeegudegfedtjedtffdvleelteefuddvkefgheejuedujeehfeelkeetjeegtdef
 gfenucffohhmrghinhepfhhffihllhdrtghhnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
 ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
 hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:FYn5YPWRsfO9ylx6MZT3WvV8V59fPf49rtUcHHSIj61yPQL1vpqR9g>
 <xmx:FYn5YKkH3YsWLAzswxzjeD3_KE1Ukrxn1L_fk7uLNJDu7P8Ge3LPSQ>
 <xmx:FYn5YEe1sEA8kHDMSNFZHjhtJ2AG0Ygx4w6cqst97KBNYafBlF2JCw>
 <xmx:Fon5YAl3nQwOwvJ0QPtpedI0pnNG0cRa7eC3mLZlyOQFW5BfYWOtepdQhhk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 11:04:52 -0400 (EDT)
Date: Thu, 22 Jul 2021 23:04:49 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
Message-ID: <YPmJEYrnB0j17cZV@boqun-archlinux>
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-2-desmondcheongzx@gmail.com>
 <YPlKkvelm/mcnCj0@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPlKkvelm/mcnCj0@phenom.ffwll.local>
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

On Thu, Jul 22, 2021 at 12:38:10PM +0200, Daniel Vetter wrote:
> On Thu, Jul 22, 2021 at 05:29:27PM +0800, Desmond Cheong Zhi Xi wrote:
> > Inside drm_is_current_master, using the outer drm_device.master_mutex
> > to protect reads of drm_file.master makes the function prone to creating
> > lock hierarchy inversions. Instead, we can use the
> > drm_file.master_lookup_lock that sits at the bottom of the lock
> > hierarchy.
> > 
> > Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_auth.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > index f00354bec3fb..9c24b8cc8e36 100644
> > --- a/drivers/gpu/drm/drm_auth.c
> > +++ b/drivers/gpu/drm/drm_auth.c
> > @@ -63,8 +63,9 @@
> >  
> >  static bool drm_is_current_master_locked(struct drm_file *fpriv)
> >  {
> > -	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
> > -
> > +	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> > +	 * should be held here.
> > +	 */
> 
> Disappointing that lockdep can't check or conditions for us, a
> lockdep_assert_held_either would be really neat in some cases.
> 

The implementation is not hard but I don't understand the usage, for
example, if we have a global variable x, and two locks L1 and L2, and
the function

	void do_something_to_x(void)
	{
		lockdep_assert_held_either(L1, L2);
		x++;
	}

and two call sites:

	void f(void)
	{
		lock(L1);
		do_something_to_x();
		unlock(L1);
	}

	void g(void)
	{
		lock(L2);
		do_something_to_x();
		unlock(L2);
	}

, wouldn't it be racy if f() and g() called by two threads at the same
time? Usually I would expect there exists a third synchronazition
mechanism (say M), which synchronizes the calls to f() and g(), and we
put M in the lockdep_assert_held() check inside do_something_to_x()
like:

	void do_something_to_x(void)
	{
		lockdep_assert_held_once(M);
		x++;
	}

But of course, M may not be a lock, so we cannot put the assert there.

My cscope failed to find ->master_lookup_lock in -rc2 and seems it's not
introduced in the patchset either, could you point me the branch this
patchset is based on, so that I could understand this better, and maybe
come up with a solution? Thanks ;-)

Regards,
Boqun

> Adding lockdep folks, maybe they have ideas.
> 
> On the patch:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> >  	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> >  }
> >  
> > @@ -82,9 +83,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
> >  {
> >  	bool ret;
> >  
> > -	mutex_lock(&fpriv->minor->dev->master_mutex);
> > +	spin_lock(&fpriv->master_lookup_lock);
> >  	ret = drm_is_current_master_locked(fpriv);
> > -	mutex_unlock(&fpriv->minor->dev->master_mutex);
> > +	spin_unlock(&fpriv->master_lookup_lock);
> >  
> >  	return ret;
> >  }
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
