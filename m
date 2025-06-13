Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F3153BE8
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832187; cv=none; b=uJKNPStj9C7d5ewmiHnuaKkDR8Dnm2KskecgU79GsXITfT+AfIIZdo8nyN1Gl1xmCwr9CtJsOX0u2Xo2DQWlpbyM0j2miKLLNSIxp0Kq1PcxqwIVwR4JSu87mkVgFd+AZdT4cArg+VVrStg+UWD+aYx46j188HcdZ0ZB2SYyXUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832187; c=relaxed/simple;
	bh=xlPuueSQaXyTx+4IzMqTdEWHdFgIskksxZhypIg+SOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2RLJ69yuCUB3FbPsxg3JScBTKILTIQ7XzkqqiLdkF7QFwmMRvjvo5SVwZDULdWVlJSouIaJcpOITcKNYxXDQWttqiQ0H3B5SsUOuwCSy6HtWLXKN4SOwUXBKRwJjNuB954pUt2ElXvAe2frm+zMQmzmXhqlfJho+JVuPS2J6Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXr0YEat; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXr0YEat"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2352e3db62cso21740995ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749832185; x=1750436985; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/ypjyt/NbZiloplOW749e3kAa0t1FCbJIVyOgIwQ5Q=;
        b=QXr0YEatR93TSNSf4RqKrhZPFwp6pGVn3LLhtW/M8Y/PGD41K6hT+xeT0X4T3jpuUE
         8SdpMIza94npsbnPCOJ/fHEvS21iR2XZZJ2xohe19xMKn8t8VK6/pgYLJ2dbsjpMBKdy
         qz6ohHzuzIO55/BAQ1bDaZQndiuzxDWFc2cObumy0vOhUy4khm55Cn/bK9jztLn40Qid
         +NBeoYvMKVXrE/920W9uaMEz9GJZfBy4VMJW5isiovVmCZFOhmPiq2iI5N5LrUmtQ1ZK
         UPEYv5famoEdPrVKwJJXwMtXY3hsGJ4x3YP9WOgVAc0fBoAm0kgqJj3FknZYE5qcVWH0
         F+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832185; x=1750436985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/ypjyt/NbZiloplOW749e3kAa0t1FCbJIVyOgIwQ5Q=;
        b=rXKxuwkuthVI3ffJgu/eU8EK79Xf9/OvAekIx4QWnduRPgUa4ALszDO8mKm5DBeZjY
         aGkacoRUIcB6a7ioADMDRivTXuYqz0Z6w703LlKG1OiKDlyfBTPZphUFN0Uv5k0lw89z
         KqiYXqsnk+4llDDuryPSTalPUr4KmOPl344WdeZnsLJpTSkk+7KKYBB+ZD7plpjSv2Sw
         1OT+howFvcy+hmcMUABDZgw/MbOT8Fh70IEQyffvq+vQyfahnzPl1TfOvskBsR4zWwLR
         AYha8063iVgj1Ybe4wTgZJgyf4h/kbHv6dPvzxCTG6YP7nyG7nniqAD7MHzqKyOX+rak
         LczA==
X-Forwarded-Encrypted: i=1; AJvYcCVEnPP7ir4WWjbL5AtWMkKkdA2qNjFy6Rw0GSb6TjGuWx2kICA/1z6xw6ssB+aPeOsxC04BsFYcLephOepimIh1ijCpQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSvw5FOADtXaIUIS4OB4zdLqYRqx9kmqewXPtiYxaexU7j71EE
	DPAjq7J57AhuJ+ZzK0wgyEiueBL67Q0Ey+a43aNhg85LJQd3WrVpChD0
X-Gm-Gg: ASbGncv248jyTyFgYW0ZfJTiLYWWFF4skE0zs3F0UYUiTfTf5Hv0cDRm7DWUtxAGepx
	GW2/JgfhVdbnVjtqRkH4CS5N9Qw1DBYh5SbddhUIwcKhEq/6hMeUkHrvn9UOeRq7Ihuei1/h20E
	FJq9WhGNEVwmDsYZCGyBE00zjCrIiicwdjTKqZInOFEciy0zd5Y6qKo22I3FNadyEf2imAF5nwR
	bcJN9lqZJGd7Qv8MR0nWZuRAhRHrztEHR+CDb4TBd7h2BJ2ckwQwXQqO1nkvLXEL9BmOW6Y5Un7
	L385oyfrTnAH42v00YBbUp9XGN5ZMiMa2TH8VUQ45N6UB3ejqBgWOKqFYqViGw==
X-Google-Smtp-Source: AGHT+IH2Q6jNPlcyooCkJYo0Fcu02BJRlAAzKKPUGHXL14Rupr4ubntd70CKpZu4F+L3qRNas6M5nw==
X-Received: by 2002:a17:903:3c25:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-2366b137c14mr2651695ad.37.1749832184720;
        Fri, 13 Jun 2025 09:29:44 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c0besm16529615ad.42.2025.06.13.09.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:29:44 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:29:41 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: I Hsin Cheng <richard120310@gmail.com>, linux@rasmusvillemoes.dk,
	jstultz@google.com, sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aExR9fLgCNHOaBMS@yury>
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

No, there is. It looks like a pure plagiarism - a sort of fraud.

You see, in the other email in this thread Kuan-Wei Chiu complains
about the lack of credit, as well.
 
> It's sufficient to point him to your series and tell him that it's
> already been dealt with.

He'd been pointed at least once. Obviously, it's not sufficient in
this case.

> I deal with redundant and conflicting patches every other day. That's part
> of how open source development works and it's trivial enough to either
> pick one of the patches or ask the involved parties to sort the
> conflicts out.

It's not about conflicts. I know how conflicts look and how to manage
them. Check this example from the last merge window:

        791a9b25ce2e6ecbe404ee32eed8a96a17e52896

I work on kernel for over 15 years, and contribute regularly for at least
a decade, and such thing happens to me for the first time. If it's indeed
a normal workflow, can you please share a couple recent examples where
people submit someone else's patchsets in whole with different commit
messages and with absolutely no credit, despite being warned? I'll then
consider to adjust my tolerance level to such things.

Nevertheless.

At this point it looks more like a lack of professionalism rather than
an evil will, and I hope he'll do better next time.

This doesn't mean that I revoke my NAK, or willing to give him any
credit for this work. But I will review and take his patches in case
he'll send something valuable to me; with reasonable precautions.

Thanks,
Yury
