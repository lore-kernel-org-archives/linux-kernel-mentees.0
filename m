Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25445C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 07:00:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEDA761058
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 07:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEDA761058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6999B40507;
	Thu, 29 Jul 2021 07:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6uQOtxFbAKE; Thu, 29 Jul 2021 07:00:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 614AC404F0;
	Thu, 29 Jul 2021 07:00:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E177C001A;
	Thu, 29 Jul 2021 07:00:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6ABDC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 07:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84FCF400EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 07:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNyhiKAGGgam
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 07:00:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0BE1400E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 07:00:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z4so5507005wrv.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 00:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=D42htALMiwE4ICut41D5vsBQfBCeDEae3tqYpmKv8jk=;
 b=OBAlPYmFEMjLIsQidQskf+lnTNHx3ViYTxgqKf4O8loi2k8YlK8JK+7lqEWNj9D4Zs
 O3x76HK/w4TARBfEoxJg2AmDqouGm0u8e8Ku8kv5Hvn3ObYAuDRJ9gr69zqlVTFsA8V8
 BMRfvga/i5W6OVagzBgzYq+FLZYXeor9ILVh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=D42htALMiwE4ICut41D5vsBQfBCeDEae3tqYpmKv8jk=;
 b=ZUbGPlrah3FTY3KcEWWTGbwcmIWe1T3YE57oK0PuE3HbE3Yen6EfbvoJQEDaX3OAOF
 KVxvxAsSkPKii8QnsNqxovPqsSKcidQ/9VXppcY/dDY4woATjoOLsTZJqBQj71VH3m55
 ORuv25x/SpSH5w1u3Z7NtkzMBHavLu4FqJoutCVkD0R5ci7XEWMXjd0L1cN/7q8wDxt/
 odrMMV8UCTZITWEnKkfKzwT2KwzuKkEkQh+9QKIvF8DRWHGmH/sP9uxiabTzkg8ku1sn
 qw8ikRscU9Q5lunsNIcU9CsVfUJhqlGgCh/S7KQwezPN+ho27mvjqIiTq3vg7kOzMVvd
 6mHw==
X-Gm-Message-State: AOAM533shTFF8vMSRlx0/M3PtnacgpTrLmLVEsVJKjdMmwacMYKqSC7h
 m7KlPP3Jte0EkF+WnJUfsJtzEQ==
X-Google-Smtp-Source: ABdhPJwsaDiG7vN34aTOe+72G4Pb7gWtL4ldUYgv5ToL6oF5GwhKKiRbM5Gn5XQbuB0yAdNhhwKvlg==
X-Received: by 2002:adf:ef4b:: with SMTP id c11mr3047231wrp.35.1627542037754; 
 Thu, 29 Jul 2021 00:00:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g138sm2707357wmg.32.2021.07.29.00.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:00:37 -0700 (PDT)
Date: Thu, 29 Jul 2021 09:00:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
Message-ID: <YQJSE3TMRydDNhqT@phenom.ffwll.local>
Mail-Followup-To: Peter Zijlstra <peterz@infradead.org>,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-2-desmondcheongzx@gmail.com>
 <YPlKkvelm/mcnCj0@phenom.ffwll.local>
 <YQAaIrNUXa6i2gxD@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQAaIrNUXa6i2gxD@hirez.programming.kicks-ass.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: airlied@linux.ie, Boqun Feng <boqun.feng@gmail.com>,
 maarten.lankhorst@linux.intel.com, LKML <linux-kernel@vger.kernel.org>,
 mripard@kernel.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, zackr@vmware.com
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

On Tue, Jul 27, 2021 at 04:37:22PM +0200, Peter Zijlstra wrote:
> On Thu, Jul 22, 2021 at 12:38:10PM +0200, Daniel Vetter wrote:
> > On Thu, Jul 22, 2021 at 05:29:27PM +0800, Desmond Cheong Zhi Xi wrote:
> > > Inside drm_is_current_master, using the outer drm_device.master_mutex
> > > to protect reads of drm_file.master makes the function prone to creating
> > > lock hierarchy inversions. Instead, we can use the
> > > drm_file.master_lookup_lock that sits at the bottom of the lock
> > > hierarchy.
> > > 
> > > Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_auth.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > index f00354bec3fb..9c24b8cc8e36 100644
> > > --- a/drivers/gpu/drm/drm_auth.c
> > > +++ b/drivers/gpu/drm/drm_auth.c
> > > @@ -63,8 +63,9 @@
> > >  
> > >  static bool drm_is_current_master_locked(struct drm_file *fpriv)
> > >  {
> > > -	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
> > > -
> > > +	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> > > +	 * should be held here.
> > > +	 */
> > 
> > Disappointing that lockdep can't check or conditions for us, a
> > lockdep_assert_held_either would be really neat in some cases.
> > 
> > Adding lockdep folks, maybe they have ideas.
> 
> #ifdef CONFIG_LOCKDEP
> 	WARN_ON_ONCE(debug_locks && !(lockdep_is_held(&drm_device.master_mutex) ||
> 				      lockdep_is_held(&drm_file.master_lookup_lock)));
> #endif
> 
> doesn't exactly roll off the tongue, but should do as you want I
> suppose.
> 
> Would something like:
> 
> #define lockdep_assert(cond)	WARN_ON_ONCE(debug_locks && !(cond))
> 
> Such that we can write:
> 
> 	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
> 		       lockdep_is_held(&drm_file.master_lookup_lock));
> 
> make it better ?

Yeah I think that's pretty tidy and flexible.

Desmond, can you pls give this a shot with Peter's patch below?
-Daniel
> 
> ---
> Subject: locking/lockdep: Provide lockdep_assert{,_once}() helpers
> 
> Extract lockdep_assert{,_once}() helpers to more easily write composite
> assertions like, for example:
> 
> 	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
> 		       lockdep_is_held(&drm_file.master_lookup_lock));
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> index 5cf387813754..0da67341c1fb 100644
> --- a/include/linux/lockdep.h
> +++ b/include/linux/lockdep.h
> @@ -306,31 +306,29 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
>  
>  #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
>  
> -#define lockdep_assert_held(l)	do {					\
> -		WARN_ON(debug_locks &&					\
> -			lockdep_is_held(l) == LOCK_STATE_NOT_HELD);	\
> -	} while (0)
> +#define lockdep_assert(cond)		\
> +	do { WARN_ON(debug_locks && !(cond)); } while (0)
>  
> -#define lockdep_assert_not_held(l)	do {				\
> -		WARN_ON(debug_locks &&					\
> -			lockdep_is_held(l) == LOCK_STATE_HELD);		\
> -	} while (0)
> +#define lockdep_assert_once(cond)	\
> +	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
>  
> -#define lockdep_assert_held_write(l)	do {			\
> -		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
> -	} while (0)
> +#define lockdep_assert_held(l)		\
> +	lockdep_assert(lockdep_is_held(l) != LOCK_STAT_NOT_HELD)
>  
> -#define lockdep_assert_held_read(l)	do {				\
> -		WARN_ON(debug_locks && !lockdep_is_held_type(l, 1));	\
> -	} while (0)
> +#define lockdep_assert_not_held(l)	\
> +	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
>  
> -#define lockdep_assert_held_once(l)	do {				\
> -		WARN_ON_ONCE(debug_locks && !lockdep_is_held(l));	\
> -	} while (0)
> +#define lockdep_assert_held_write(l)	\
> +	lockdep_assert(lockdep_is_held_type(l, 0))
>  
> -#define lockdep_assert_none_held_once()	do {				\
> -		WARN_ON_ONCE(debug_locks && current->lockdep_depth);	\
> -	} while (0)
> +#define lockdep_assert_held_read(l)	\
> +	lockdep_assert(lockdep_is_held_type(l, 1))
> +
> +#define lockdep_assert_held_once(l)		\
> +	lockdep_assert_once(lockdep_is_held(l) != LOCK_STAT_NOT_HELD)
> +
> +#define lockdep_assert_none_held_once()		\
> +	lockdep_assert_once(!current->lockdep_depth)
>  
>  #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
>  
> @@ -407,6 +405,9 @@ extern int lock_is_held(const void *);
>  extern int lockdep_is_held(const void *);
>  #define lockdep_is_held_type(l, r)		(1)
>  
> +#define lockdep_assert(c)			do { } while (0)
> +#define lockdep_assert_once(c)			do { } while (0)
> +
>  #define lockdep_assert_held(l)			do { (void)(l); } while (0)
>  #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
>  #define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
