Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7F47082A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 05:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793278; cv=none; b=S8XCZNAUukN02fkCbLnICQjtvHGX7Q8r+TR4nJmSMaFHMtr7y8sxm9He5guCghvgdgaqFRn+NHx346NvmgDISbLVh6+QqNXqa6T9If3XrzcgwyO0vHseVOUl/QTDGvd51retxev9I3zjPZ4SDlVXOz427JaeiOu+qXCpU8/wVxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793278; c=relaxed/simple;
	bh=elnnXuAj0XGkyMJVG379w1xklEvpv3cMHLtwruxp92w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Em8oc4lHlwbpjadpza08Jm3S3TneOYrFv8r9DgegDue3TvWs1iK2S3UooYJmeFR6slQi4WsO6E2e/JJosUjdK4mqvj5Y22sGwnFEUQf+/7hw7TnjPZoG2Sr7dz5jMJigUWXbEJaoOoeKNlCSrw+Dom+aaCHZXS/leT8+Yh7wxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4FbR0j8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4FbR0j8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313154270bbso1888523a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 22:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749793276; x=1750398076; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s95Ebzl7WwrATICP+8xPyOJ+NiYPwE1zBeo3hMOEKwY=;
        b=E4FbR0j8oD9UvDqJihhq4a0JwtoxLgjjVOL+2n5TT1mD1hUhiVDUGkuE/ylwwySU9i
         6yiwpvjZbkbYtJ+/v5l/Gq6Z6K3tW1tpy9EiV6HsJYlX0KgcSsm7zw41fwxW/pReascN
         mCzENJAwskXylJkdgXCiQ6jv6LE1jwOFqL9ivQXq17qlSzADPQ63OnAkIWkMN//L3Dtq
         36xrblI8F4BeLBJFbs5SXr4LCeB32CVrm78xHdeVosF0u7lYIXVyykIdMje2iFD2WNXu
         Yh9Q8l8qbuthiBMP0lJoXz3nZ6QMP+nfjczPIy1UfXUd19GAs/IHw//PLCYfbuA47ZU+
         6suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793276; x=1750398076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s95Ebzl7WwrATICP+8xPyOJ+NiYPwE1zBeo3hMOEKwY=;
        b=l3jyBPVw7RPIZxrEBOSl6hBPpa9FjqCJVFMMEu0/f1V0eWeqbC/d2aFGqERMpfJO2d
         XnqUiCqt10iexcMyxi3drJ/3Y5lYD6irElTo/d9age2hfVmUPTWh1/007zJahkqWTfgc
         +IVHXclQZNnHR+EBxJmnA73xvwCfYa/S4k9aRI30sHJjP7F2egCHHhCLEypj9I0WqFkO
         Ivf9C9RPSTLKVtZkYc8zG9IbSsZYg+cpoZyh5sVMU3hLs8tMR/PvqA5JL/XKWIjwJFHX
         gKgYGMImvGbIu769I+TGULnmTjDQrwJsuY9MHBafzjZwDZ/YpTqfOKSEQ+Cc/IatFWIQ
         nK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQBrqkfCBBqa2t+u53ovC3y5pusc2VpBfmjXtmS23sKYUUrvRkw6UD+jgCebn+HK3OX1LBIn+OVwNrksGiVkv4jRnkmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdNDGyNd9oz6Z4wHisM6Ap4jmCI0lbNvsmb5DycN/u7jRxskZK
	ECH6S/yugKtj0ecdRb7HRsughXMmYX1GyQjX+heIfpzb97PcRY0ksWD6
X-Gm-Gg: ASbGnct6tPgJSxMt1qrPQ8NJaQxalziu5l06DbT6+QGjZMy8HH7DxK22sUwEVjWHm/V
	8ltYR5pZXImc2HW+BiEkzAmQD09JAMDeRnt77g75O6CBXO4il2F/jmryNwWC78D2X6cz/gtbWxk
	orI/zSqWWkjZkgD4FHfxH9RGd8jllXRPMW3WqAOYhymlW/c81r/4QBaUFmkcOKByKMgNKgnh/aT
	iKBszLp2fTVOTZHYQ1Y2bN/NJHk6TkcYaIR4/VR1//jWhSsGSp5VXEI/y/sMbGbuPsVdcFnFUoo
	TOoGSwkNgG3oQDZ9+OBRnV+3pEQqE/5Do7Rf8ZMiCNFsJAjzM3Tb8J2RTbDv4/1kgdNC44AAa/N
	Ddnw=
X-Google-Smtp-Source: AGHT+IGc5/VkIHmVAMn6qOt2NgCnTvEvqk6JyPzsOIT9JCgTBKP9QdT03QtpkvciVfY7VJGhm10yQA==
X-Received: by 2002:a17:90b:3842:b0:313:2adc:b4ca with SMTP id 98e67ed59e1d1-313d9e926d0mr2987296a91.18.1749793275975;
        Thu, 12 Jun 2025 22:41:15 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f20f:da05:7371:bb5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bcbb62sm2515633a91.4.2025.06.12.22.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:41:15 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:41:08 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, tglx@linutronix.de,
	sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aEu59BVKFoKXXpp4@vaxr-BM6660-BM6360>
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
> NAKed-by: Yury Norov <yury.norov@gmail.com>
> 
> Thanks,
> Yury
>

Hello Yury,

Sorry again, just like I mentioned in another thread, I didn't check the
patch 1 of your patch series, I'm really sorry for that and causing your
trouble.

I really have no offense on that, the motivation of this patch was just
like I mentioned earlier, anyway sorry for not be careful enough and 
interrupt your work.
Hope you can forgive me this time.

Best regards,
I Hsin Cheng

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
