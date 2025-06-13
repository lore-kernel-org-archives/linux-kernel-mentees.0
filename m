Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2541722157F
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 06:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749794422; cv=none; b=XhCVlkwpnPo9mhILaC3GVzI1a0YgvRk52yWrN2pfsrw3TmJgHUqDT6GnaqtGYV//fK9bTIeDq7OH8qyambeMFVWd/SWfe5zxVl8b5uVlLBfiWWounjIPg+gVYADwCqeFoRibWabHys8Q8T/+djEaDdQEA3cF3j/jQyvlushK3UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749794422; c=relaxed/simple;
	bh=xd1WRXZnGRWv5xuw3jkYhCV6TD5I7gKQG1iZyIzTtW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cb7rlOaUVVlIm/UmqKEoEDm8cAGMivAVL/0n1jofK6e0UQzckwimLlPXuMWuVWHmc/OLXjCV64k3+jqw12BJAgbV2LN9PF01mDEINLmpqHF/OSJiLBGcvBsyzvxn/DpRGUKYfy+TehSOaB2ky+rCwGDMQxoemzC9KkBaVQAV5qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVPa+Uou; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVPa+Uou"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23602481460so17082395ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 23:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749794419; x=1750399219; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OtrexJiJV5KfOryr4wLb9tk9+YgUksl5+oYnNcUBE8E=;
        b=gVPa+UourDX6l/xN490QYL8m8TLTFx1JO90KN6SknAR9aY4XqOiAOx5NnRCVnOQPY7
         c5PscE9F6cUk6vsGbIlRNud5o7tlOWv7rHyEK5jkGL+Asec+Vv68EgHT1mOO0vE2MFD4
         NIks1GSEVaR1z94xRbvgSskQrDCozm24oGyFksBi6bzjuxL2Z1N9/xo1jGKWY3YbVUCO
         3O93oMnsyK8nrTV1VZ8mtXZLtMnNWcx8sau6HtncMIqu9LfqXmgTlVBkq/RK3PDDTxjS
         nhaM8ft99Q37o9Ns5OntzlA/cc8lOy6H0mEz0moYqThyc3hQ69yLMjevo4qBgie/uatI
         DArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749794419; x=1750399219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtrexJiJV5KfOryr4wLb9tk9+YgUksl5+oYnNcUBE8E=;
        b=ENb8ieqo8S/dvVHxtyRNyeb2RNZB2ftnGbNFVbebUOMd6xd1RzDc0T4l0ZNhyTuZpR
         0Hluy4krV83DEIBvhWO7Uq0Z6j/iRVgscIBJljHZdTHC7PFfGf4nqpPDNQuJs19e4EvW
         hpxqj0vZySU+JBZEf8DMQUqhfadHgLVNsgUbgTLjhI6JKKP5R+xUIvWqzFhHkTl4OwEX
         dMvQv2VV8GjdP8kPFiNSAqA8YwrK28D0+xzgXfTPgAboQKNe7in3Piw60JJTHb50JGoz
         Hs1Xo/or7QbRdKAwNV/rolEH8gcBZ6NGxCGanYlpiKqP3NFp5JOFPYc7Ibb/E50nPges
         uEMw==
X-Forwarded-Encrypted: i=1; AJvYcCVXJL6cL+eXvZtwDb9iVB/7vxN0aP3XPT1Oosx+EN02tjpmzo87aFR+yjN/PsZ7ktrDRj20ROOt4goZVPsUV4KK1IIimQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRtaQFobhJV4t4BVIh+r1ViXTd0zpyONS8Ad2gvIjjS0syN1NL
	PBMinEvheHxSD6wBXLXA5CzcseADYI2vdVnLy+Y/Zm3KKv4BeUHR+uZk
X-Gm-Gg: ASbGncuV03mLYs/BT7b7LGH43Csnl4MKzvx5fYwEKFEp6MXWXuiffYWScZxyKTeKPcb
	Pxa9Vc5qVdNgFwmiUUbpNyzkFdzXxKiL4TyPCBrFaPiURbh+F+CU5M23rFHl82wFySWlvb4txOH
	kl2qbizQ6eiPnkWuNZ8FhRSvOczFS6DQyfL3ym0zA0D/gg5fNh805opPfYOHQ8gk/8+IZ+iiQh+
	Y5d81/O9kYfj8imu4YDNNUBAUkgDVN2Uxedt2he00anTFqiUEiQ8ve7rLmKfOzFjacm9P0xE2Pd
	RAOpiEaPBQhuobGOCclQMl7igMy/96GbkNkoIJOxlDoQ/G7012iCl4KKOIFED47ZLDDysWAUcrl
	oh0U=
X-Google-Smtp-Source: AGHT+IGix+knDYS2gFoFAgSKx7bKYJyo2ywZZMBvpzsSJ3FNml7Po3zm1Vvh1p/2+tiIlaSFsk13FA==
X-Received: by 2002:a17:903:46c8:b0:234:c8cf:a0e6 with SMTP id d9443c01a7336-2365db08eaamr31433705ad.24.1749794419371;
        Thu, 12 Jun 2025 23:00:19 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f20f:da05:7371:bb5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b8183sm2555743a91.4.2025.06.12.23.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:00:18 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:00:15 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, tglx@linutronix.de,
	sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aEu-b9IkdDrFRFTS@vaxr-BM6660-BM6360>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com>
 <aEuw7ls9hieUv_Ox@yury>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEuw7ls9hieUv_Ox@yury>

On Fri, Jun 13, 2025 at 01:02:38AM -0400, Yury Norov wrote:
> I Hsin,
> 
> This exact change has already been submitted by me and is under review.
> 
> https://lore.kernel.org/all/20250604232550.40491-2-yury.norov@gmail.com/
> 
> I don't understand why are you undercutting my work, and moreover do it 
> for the second time.
> 
> For the first time you submitted something that duplicates my another
> patch from the exact same series. John Stultz has pointed that, so you're
> surely aware.
> 
> https://lore.kernel.org/all/CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com/
> 
> Kernel development process implies that one makes sure that his work
> is unique and doesn't break someone else's development, at one's best
> knowledge.
> 
> What you're doing not only breaks this rule. You're in fact trying to
> get credit for the work that is done by someone else. This is the
> definition of fraud.
> 
> I cannot make sure that any other patches from you are unique and
> written by actually you. Therefore, I will not take your work anymore.
> 
> I encourage everyone else to be careful working with I Hsing Cheng
> and check his patches for uniqueness, at minimum.  
>

However, I have to defend myself while I'm sincerely sorry for causing
your trouble. I think the statement here is an excessive accusation, if
I mean to stole other's patch, why would I send the patch to the author?

I hope you can understand this, I was not careful enough and made this
trouble, I should've browse through your patch series thoroughly and
thus made this trouble, I'm sorry, but the accusation here is too over
for me.

Thanks,
I Hsin Cheng


> NAKed-by: Yury Norov <yury.norov@gmail.com>
> 
> Thanks,
> Yury
> 
> On Fri, Jun 13, 2025 at 11:34:47AM +0800, I Hsin Cheng wrote:
> > Utilize cpumask_first_but() helper instead of first using
> > cpumask_first() and then cpumask_next(). The logic is the same here,
> > using the new helper will make it more conscious.
> > 
> > Use bloat-o-meter to check the impact on code size, the result is the
> > same, does not have positive impact nor negative impact.
> > 
> > $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> > add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> > Function                                     old     new   delta
> > Total: Before=22590709, After=22590709, chg +0.00%
> > 
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> > Generally speaking, I think this is just a small tweak on the code,
> > making it more readable. However, no benefit in code size or performance
> > as the implementation behind the helper is in fact the same as the one
> > used here.
> > 
> > Maybe more tests should be done to ensure the change is solid, I hope to
> > seek some suggestions from everyone who has any ideas, or this is enough
> > then it's good.
> > 
> > Best regards,
> > I Hsin Cheng
> > ---
> >  kernel/time/clocksource.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > index bb48498ebb5a..12ff0c048570 100644
> > --- a/kernel/time/clocksource.c
> > +++ b/kernel/time/clocksource.c
> > @@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
> >  		return;
> >  
> >  	/* Make sure to select at least one CPU other than the current CPU. */
> > -	cpu = cpumask_first(cpu_online_mask);
> > -	if (cpu == smp_processor_id())
> > -		cpu = cpumask_next(cpu, cpu_online_mask);
> > +	cpu = cpumask_first_but(cpu_online_mask, smp_processor_id());
> >  	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> >  		return;
> >  	cpumask_set_cpu(cpu, &cpus_chosen);
> > -- 
> > 2.43.0
