Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A565C2D5C78
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 11:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814666; cv=none; b=RD2QZ0G2tnn2WcSeRVfYM+Q97jufHKbTERUqvHWoc9f8nOKudXtIVbWeFvSshPds8uly1MJcvwB04zoEQo4VBSM2q9EgGwRMLhGUeMEh6cv7u4Zp2l8HtH4ChXmgBOqNsxwfdVPKc1ffF46g6z8liDektTJvC1d9CQ1M9nPeJ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814666; c=relaxed/simple;
	bh=9nOSWkmKXGxZeCKeJfHc4BTvtEPmtKmuPEyXTrCEXE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYRaEKKNJpQ4+g0UwwVf+Et/URnl/89XVHm08C9rAcG/VtxYCLH+L7UGDJ4uuefPbGbOwXHQpIQOTj1RsbSLeiIkV634oKq8FEpKsmj2y4jXC8Qvb5ghBDUlQq6y6Ha1rhKgBUnFrZAImY3c4e2orLi3HoTyyDF2bgK3nMBHjRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOpyrFtD; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOpyrFtD"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so1871201a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749814664; x=1750419464; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jKGg0bB1/QQAEHL8cmKXw80iv4zUBwrxD0VPEgJGB1c=;
        b=OOpyrFtDvygOqrompHSuw3xp2DyhtqRZ2RmvKqOe6PGdBZ016pAygAND5M02Rk8SzN
         dpUGgrmSpiCa4VRcTCpimFN4hNRif6/hzP72ksDRoBYAigqWaiJTbpZwseG+NEPbpDvn
         lrOuF1+tAC2opP9adWi0FJ4Y/UeuuNtby5sKfgnm+y0zPcWv1lBBi48Q3E7EFDppergj
         VDS+pcKhH9OtpxPrW+C40Vgj5ylt8T+bXzlcVGFfZox1qltA7x1xcQOkvjgrpXDui9yK
         clRTpDkHiFGR0Dpktt/stDK8vwydRFEQtxghI2AqXdibgehXoXJpbTztehYIMzF76k93
         2vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814664; x=1750419464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKGg0bB1/QQAEHL8cmKXw80iv4zUBwrxD0VPEgJGB1c=;
        b=RBReTMDSaHI53WCUuygOo3UfJNVM4ED+bvObscAvm7LWqsUTYDwxMfEq2OFJmOQd1T
         k4+uApPM2MQ95MxbiYLtHpeetHnLAEUGdPfmdqKBAUC7mcw31SMSDV5NB/LYdpqHUa8A
         13HtRnaYGta6dD6ZXFaMSIAsadjfUKf/jWqQaHtBH5uAmzFWtFtT+EiJQCjLWu+D0hAX
         Trc4HHyMgiIr3nEJyBSQYbUhOUj1D2TCbx3slHQcoy0tfBJOSUgYAPYRC8LylFk9wW7X
         QxeuEsfOIDs0SzRLEiwlxP7oz6rgVDq91CcFn90zfqUC4TPoXgb1pLKOoefxzpMuIcBD
         C3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU46mdYoqV2fGBU/wNtbLwXn18nNAebgs3+yt+19Dn9Ao7QppFJoOVLChd6cwo4ZejrkOKWfbobKUChzQiTSesk1khlLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhtKXKOBCgYnNrKssSl8Pyt7rRwUN5In34KK6R2btR02tyOy2h
	fcGePoPZHrUhtV3cOoed0k/E/Twl78QEjeCJp4t5jVqUSEZimaM3xDMW
X-Gm-Gg: ASbGncu1k+/3wgCuK3xllPdS2c0TSE3FqvEIKe6GavVdQzSXaRlfXHORakCK3gmNy/M
	Gkezdup/YptaQCJgKErCSafvcpxrSVfE7DP/cKNR7PbM4JwfI04SzniAuOJbAB8h8emm5BZNyPq
	1z88YugV1WON3GWJKFzWgVjIZgmOJqO7HIKbV0udKiQE1WdCcstiKZuVPuBqWnSWynoce1QSHBV
	MbQu7/IjPTM2qZFdkHkrTSJS75K6fik6J4Fq4pS05Yo1zfNgRKqm/gql+l6v5vg7un9cHjHfKQe
	Yr5x1mPNBLSGwYhKFQ9Y6Bm5uMbAqxvSjQbS9zGCgd41NtYJnOYlSaobRHjKdMkXvOltWEW/Q06
	Vv0Y=
X-Google-Smtp-Source: AGHT+IEtO7AJctbwySDiG4IYWUnqbCXmYhViiO2826Yp+/7UzXYJWcG/B84cs6yfhKmrpN1By8fMng==
X-Received: by 2002:a17:90b:4b41:b0:312:18e:d930 with SMTP id 98e67ed59e1d1-313d9eaec51mr3970567a91.19.1749814663686;
        Fri, 13 Jun 2025 04:37:43 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:10a9:4163:7b48:3809])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf4csm12097125ad.218.2025.06.13.04.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:37:43 -0700 (PDT)
Date: Fri, 13 Jun 2025 19:37:39 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Yury Norov <yury.norov@gmail.com>, linux@rasmusvillemoes.dk,
	jstultz@google.com, sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aEwNg-chMazUvS6-@vaxr-BM6660-BM6360>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com>
 <aEuw7ls9hieUv_Ox@yury>
 <87ldpvsyr8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldpvsyr8.ffs@tglx>

On Fri, Jun 13, 2025 at 12:48:43PM +0200, Thomas Gleixner wrote:
> Yury!
> 
> On Fri, Jun 13 2025 at 01:02, Yury Norov wrote:
> > This exact change has already been submitted by me and is under review.
> >
> > https://lore.kernel.org/all/20250604232550.40491-2-yury.norov@gmail.com/
> >
> > I don't understand why are you undercutting my work, and moreover do it 
> > for the second time.
> >
> > For the first time you submitted something that duplicates my another
> > patch from the exact same series. John Stultz has pointed that, so you're
> > surely aware.
> >
> > https://lore.kernel.org/all/CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com/
> >
> > Kernel development process implies that one makes sure that his work
> > is unique and doesn't break someone else's development, at one's best
> > knowledge.
> >
> > What you're doing not only breaks this rule. You're in fact trying to
> > get credit for the work that is done by someone else. This is the
> > definition of fraud.
> >
> > I cannot make sure that any other patches from you are unique and
> > written by actually you. Therefore, I will not take your work anymore.
> >
> > I encourage everyone else to be careful working with I Hsing Cheng
> > and check his patches for uniqueness, at minimum.  
> 
> There is absolutely no justification for accusing Hsin of fraud or other
> nasty intentions.
> 
> It's sufficient to point him to your series and tell him that it's
> already been dealt with.
> 
> I deal with redundant and conflicting patches every other day. That's part
> of how open source development works and it's trivial enough to either
> pick one of the patches or ask the involved parties to sort the
> conflicts out.
> 
> Thanks,
> 
>         tglx

Hello Thomas,

Thanks for your word, really appreciate it.
Though I can understand abit why Yury was annoyed for this patch, at the
patch [1] I sent earlier, it already collide with Yury's patch, he did
paste the link of his patch for me, but I only take a look at the patch
in the link, not the whole patch series.
And then I send this patch, again collide with his work, if it were me, I
might feel the same like alittle bit of offended.

I send this patch because after I send this patch [2] , I think of
Kuan-Wei's patch [3] months ago and see there might be a use case here,
so I ask Kuan-Wei whether I can pick up his work.

I admit I wasn't paying attention to detail enough when looking at other's
work, neither did I subscribe the mailing list cuz I don't want my mail
box to be exploded with mails that aren't sent to me.

My workflow for patches was making sure it works as expected, and then
use scripts to check patch format, get maintainers, and then send it. I
know there's always room for improvments or something I might've done
inappropriately, that's why I always send the first patch with RFC tag.

That's the whole story, I am sorry to Yury, but again I think the
accusation is too over, like I said earlier, if I mean to steal
someone's work, why would I send it directly to the author ?

Still, I respect Yury and his professions, months ago he gave me many
suggesetions and help in another patch.

That's why I send my patch [2] to him to asked him for some comments
even though he's not in the maintainers list of that file.
I would never want to offend someone I respect, I hope he can
understand.

[1]: https://lore.kernel.org/lkml/20250611104506.2270561-1-richard120310@gmail.com/
[2]: https://lore.kernel.org/lkml/20250609194611.690678-1-richard120310@gmail.com/
[3]: https://lore.kernel.org/lkml/20250117142658.297325-1-visitorckw@gmail.com/

Best regards,
I Hsin Cheng


