Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906572686B9
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 19:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668688; cv=none; b=HzdgmxP19d6jkjQCSv+Lj5lPaPOJcp/oMEAIk1kX2hRB3hZtG/ZC9rW3dJJk3sBI4kces80GteFQFuATJDu07EezL74N26vsxj0UHqXhao0yOf86hNryYLMCinDXUp2u6Y1MVHwIQ8btjMls1ygmAdgoDlUwsyEqx/Nw4okoOpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668688; c=relaxed/simple;
	bh=+t8ACet9xqwRNJy9b8899wiD25b/003UaXpKZdUYUJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiAxdG+f5bzkENHvOvUwf6pQpOZkUX/wG6BUoxqcnD9RNM0pRlgEScHhlw7E1+4QbrC5gWc11+A7hCG9R+MdQZ9xaRJFqfvqnO+AD41ObgakF9HRMErT7rN70aHV81did2M5bPVxE9atgoYYhSfWQ0DNalEiL2UPfTwPc/b+Q1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eno+0Z3n; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eno+0Z3n"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af51596da56so91558a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749668686; x=1750273486; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yu2PImzFHGaLiTWdxu2ihmwRTn972j20R7GA0tijYc4=;
        b=eno+0Z3nGG/bX4RsPhDjSH47crIvgTBG+LAI6ZYW7FPPUUBb3JFG1Dv4Z+j08p4NBQ
         xYqPOJny294dFTkEYlekf/gtntVYhuIbuMPEnvm+JyeZue08AVLGrDyBQxgNFNCBxGCy
         Kpl6jcrSFNwt6whkPxa+hley+rOn8yqxkCLQ7qjBqoIoOTzYeksnCJRB/y2HuZxyHz1H
         MS1UAlRzXyVtUjmqpz1a6IS1dPEIT9AYGyjN5XFOXXkNZu3oNbNEO7VYIjgYMWuQ7D3E
         0H1+itNfQcYS79fX1LdXcjF0x0S9BXlFUT+ZWRWRc5u1waekqD86EjOhLpPCuTNAzJO0
         Yo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749668686; x=1750273486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yu2PImzFHGaLiTWdxu2ihmwRTn972j20R7GA0tijYc4=;
        b=YFAmZ6RK5j3nVKDJ1s90WkPtMsjhfbh7ygzN5OJt8r/Nf25HO8PurUXlfHboRazt+H
         piyhPmLryTkXzqLnaZmi8RMFtL+Zg/PPPgh8lvcmrg/MUhKd7QRFWvcDlccW1X4Vd9wN
         rVnv73RfahjcrgBYiLKdsDjEXH5NvyFxczJXo/YBqtcFtEf1mJTc/qfvYwNABKNMudTE
         cz/RtqU1YyrdqCN7LgZ8YOzuSDkDfRcyklGY/1Xj2WZs1JNsgivGMl5bqDfzSXHGuy+4
         H8pZht2D8+mDvPONxKoCIHv5IKmfRndqBws6omHHWdAIQ0sVZdQ10kt44S+1+ejZhr8B
         29Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWm5FxjhtXDUtbaFa/LkKJFmJZiRQQXpGfbXbgwfKrPpvOXacgbSTCspB7KvO2Zv9dYb2mWrfkhHqAgDJOBv+iBxtwR3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEfC2somavpE8ykradjwbWvyYxU6N+111/Wftxni0MGkZWDXhU
	cCjywYOzizhWpRawBzU3eDyXcrZvogy4Sc7ScWJ6XCF2L7Wjl7pJM6fMFN0Tkg==
X-Gm-Gg: ASbGncutXoMgiIEwgPby5wmO+a1W2UrjlzweTY/qVPdQ4cWcccZWF2tx3gcevbFQ1hM
	wA2WcC6oxsVzQ6KVpO8wCRXi1ixbhdwfPnm+/ezCU4sxzEVA6yjE3MJZo4azOO51n8zVoktW5ok
	PmI4SGLP83BUAEVrCK85DH/EMcfsI63nh8dNn9KJacQzRmCxvjx09ZxlpzsWTvPIFCkmAmceg7r
	IhhI9haq6fTSdCEOXPUDFLbz2dTIMCOSb+Doilcth6YdaeyXOzhIA2OVUBHXmCZGlmt/3gQZFfD
	jk3bYLpTQ8cEd2Aa3FVybSmKtEEfOYq/lp6uDgbSjGXwGjRJNAYtPtNm1eJ1XA==
X-Google-Smtp-Source: AGHT+IHlKwUHlG5l5OkH/T5Emuq4G3wP5gvRvJQ20dNe+S3Lsa4RrQlO5tlqWQU83u4ZPK3w8pteOw==
X-Received: by 2002:a17:90b:520f:b0:311:fc8b:31b5 with SMTP id 98e67ed59e1d1-313c069ede0mr408927a91.14.1749668685680;
        Wed, 11 Jun 2025 12:04:45 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b20112d4sm1859375a91.20.2025.06.11.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:04:44 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:04:42 -0400
From: Yury Norov <yury.norov@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: I Hsin Cheng <richard120310@gmail.com>, tglx@linutronix.de,
	sboyd@kernel.org, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aEnTSuVy2Aq8jRk8@yury>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>

On Wed, Jun 11, 2025 at 11:35:13AM -0700, John Stultz wrote:
> On Wed, Jun 11, 2025 at 3:45 AM I Hsin Cheng <richard120310@gmail.com> wrote:
> >
> > Simplify the procedure of CPU random selection under
> > "clocksource_verify_choose_cpus()" with "cpumask_next_wrap()". The
> > logic is still the same but with this change it can shrink the code size
> > by 18 bytes and increase readability.
> >
> > $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-18 (-18)
> > Function                                     old     new   delta
> > clocksource_verify_percpu                   1064    1046     -18
> >
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >  kernel/time/clocksource.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > index bb48498ebb5a..ab580873408b 100644
> > --- a/kernel/time/clocksource.c
> > +++ b/kernel/time/clocksource.c
> > @@ -343,9 +343,7 @@ static void clocksource_verify_choose_cpus(void)
> >          */
> >         for (i = 1; i < n; i++) {
> >                 cpu = get_random_u32_below(nr_cpu_ids);
> > -               cpu = cpumask_next(cpu - 1, cpu_online_mask);
> > -               if (cpu >= nr_cpu_ids)
> > -                       cpu = cpumask_first(cpu_online_mask);
> > +               cpu = cpumask_next_wrap(cpu - 1, cpu_online_mask);
> >                 if (!WARN_ON_ONCE(cpu >= nr_cpu_ids))
> >                         cpumask_set_cpu(cpu, &cpus_chosen);
> >         }
> 
> I think Yury submitted the same change here recently:
>   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> 
> Though, I think he has another iteration needed as Thomas had feedback
> on the subject line.
> 
> The bloat-o-meter data is a nice inclusion here!
> 
> Yury: Would you be open to adapting I Hsin Cheng's commit message into
> yours and adding them as co-author via the Co-developed-by: tag?
> (Assuming I Hsin Cheng agrees - See
> Documentation/process/submitting-patches.rst for how to do this
> properly).

Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
I Hsin, do you agree?
