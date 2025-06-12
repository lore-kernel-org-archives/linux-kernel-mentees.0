Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544001F3D56
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714343; cv=none; b=YqD+8hn4nXB+9vbtgpjKT9EI7O7bu2Vutz60LRZjRgdHFZtjH7fOg82ylMk0+vwjOpYYmZ8ZYJPLORoCjK7KCiIrLbCPMqRiwKB0nYmDWusdKNskKiPLGafkYg7hDXidTme2EQzYaed2VXDONWkKQZ6hB1622wbLuofvk/KVKkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714343; c=relaxed/simple;
	bh=IPP4978znnBT+7XdoT2b281Vaw9mm1eJSch43ipMupU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJq6oOtJdcMVutnqqEfHg6HpqusGp2+GdgJUdU16hLg7XdT9uTdRpoFQ3ZGx/6VnTqThf83zHwHdLe439Yj5Oe61PMwCwa8/2RBSMNk2tICm+p9/cG1ZarEr5iMxEbVgi/TJia+Le4aSd34ovoHCemqhmogwYqMs47Pl9MoQcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QD9RlTQc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QD9RlTQc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2363e973db1so14786115ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 00:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749714341; x=1750319141; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x/r4HaILg277b3MgONbz0YWOe53JlF7XtF3YrZR19cU=;
        b=QD9RlTQciAe0WDc4wcTvN+4qS38ayU5nzz2N6Wt6ZQxUHYnfD2J4B/74D5zvdyOISm
         TxLR2R8D2hmximmD7hU/yCSSpjbbLwggtjoTlIrci4cX8dpyT1Se/NEYp4OrSlsg1FvE
         Mo+Qhk0a4C62jKYCIklJxLwmmfgK70yMUVPSXU2rh+B4p3cNjkPZqTp3twhVh487jtFb
         V0vM00MazOUo4ZrfsBv/VxwaKTSXWhoURqC0XlMmiSwTjwKdFe0KLmavcBFxfKY4FlAT
         HfBxKKAiMNeGodzOMe4DDyM1lEYG0+Zl3wOxqwHXb99/Cbnnq9y1fCs2oB699Rf+BmNc
         SHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714341; x=1750319141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/r4HaILg277b3MgONbz0YWOe53JlF7XtF3YrZR19cU=;
        b=pFTRCqePWvuW9/cKXh5Z5O2cXn3IcvdDy+IW2QKNn2945iVULfUyRLdy1OB8sBhVNt
         SrhXHM3gVe7r93JwT34c1OnvXK1ybWFCtL4r4qDeLyMEjj9/lVoPO4V5MElI4/S7yJan
         /GHKWTfu6A3h0wkDFp+Zw7kn1BhyKhmOLUkTLgvM6OWDAkVJK3an6+b4NKIDERzAppX1
         mzL9D6H9pyerKLIqzNoAGXNMRDdALGYoJUcwp+Q5u6l3qJ2qUjTvMmZVqX1na4S+fh/X
         0k4kKv4SYjgO0YKNx5K8sO7ik95NUfbmUhU2OkmTb3gpiX6xbdz0wJmwocvhr0PTMOfS
         F/iA==
X-Forwarded-Encrypted: i=1; AJvYcCUQeD9hFyCOTzLjGzr2l0v6a66orFA+C2FoTBFgE9ZftY0qAP2+7PvdZLYtYhc1/PTrBaC06cmBVx/sqVWIWRvbffjYTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCoV75PyHQZ6E01bYZI3BGjIVQyYgRsPq2u/2QrwH/H8D+AJl7
	yEkgbga9fnVPrUPQrITV4GFPSfRWqWl+kUkuNrIkMRFyuo1LdkdgkxiO
X-Gm-Gg: ASbGncv+UW8VaNB7zYjZnAIDaDKIyrQx1ffwHrunWVU0q0Gdz6ACmT3XeLOn42jDTB4
	tvU9/HnioUKViHjlGcRrHLKi+1CK5uRK4wAHn1KGsYHOXmtahMKpMrrHIJOxDZbjn8r6M7ORDG2
	Khpk/RVcwaUGREwwNo4e4yO44gbNI2iP9QPMhfgS01bOdn9EY6VM8wjaxI04j4o5e+4LPf5mMBl
	8d+6ROmeRm69IG4L6MeLXSVenMbkeqTH5D/thaL8LfzuNAuKPpJWeBqYQCRRheAZaESI7vVOmYZ
	hS5JxTe2fNprLgCYvnxk9reFTCykeOrglkxZ6B/uyactLJUR+ptPxKDE8avf9V294wo6ZA7gVLn
	7pQ==
X-Google-Smtp-Source: AGHT+IEkos/uNROJz/Zz+MX/GOvxBe9ubiY46UzkUMeDb5+z/xXrsj6/fN5COhHTycOGbND/qHF87A==
X-Received: by 2002:a17:903:3204:b0:235:efbb:9537 with SMTP id d9443c01a7336-2364cd01898mr36636945ad.3.1749714341403;
        Thu, 12 Jun 2025 00:45:41 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:2c7d:4ae3:493:2da6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e7031efsm7687285ad.188.2025.06.12.00.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:45:40 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:45:36 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: John Stultz <jstultz@google.com>, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
 <aEnTSuVy2Aq8jRk8@yury>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEnTSuVy2Aq8jRk8@yury>

On Wed, Jun 11, 2025 at 03:04:42PM -0400, Yury Norov wrote:
> On Wed, Jun 11, 2025 at 11:35:13AM -0700, John Stultz wrote:
> > On Wed, Jun 11, 2025 at 3:45 AM I Hsin Cheng <richard120310@gmail.com> wrote:
> > >
> > > Simplify the procedure of CPU random selection under
> > > "clocksource_verify_choose_cpus()" with "cpumask_next_wrap()". The
> > > logic is still the same but with this change it can shrink the code size
> > > by 18 bytes and increase readability.
> > >
> > > $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> > > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-18 (-18)
> > > Function                                     old     new   delta
> > > clocksource_verify_percpu                   1064    1046     -18
> > >
> > > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > > ---
> > >  kernel/time/clocksource.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > > index bb48498ebb5a..ab580873408b 100644
> > > --- a/kernel/time/clocksource.c
> > > +++ b/kernel/time/clocksource.c
> > > @@ -343,9 +343,7 @@ static void clocksource_verify_choose_cpus(void)
> > >          */
> > >         for (i = 1; i < n; i++) {
> > >                 cpu = get_random_u32_below(nr_cpu_ids);
> > > -               cpu = cpumask_next(cpu - 1, cpu_online_mask);
> > > -               if (cpu >= nr_cpu_ids)
> > > -                       cpu = cpumask_first(cpu_online_mask);
> > > +               cpu = cpumask_next_wrap(cpu - 1, cpu_online_mask);
> > >                 if (!WARN_ON_ONCE(cpu >= nr_cpu_ids))
> > >                         cpumask_set_cpu(cpu, &cpus_chosen);
> > >         }
> > 
> > I think Yury submitted the same change here recently:
> >   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> > 
> > Though, I think he has another iteration needed as Thomas had feedback
> > on the subject line.
> > 
> > The bloat-o-meter data is a nice inclusion here!
> > 
> > Yury: Would you be open to adapting I Hsin Cheng's commit message into
> > yours and adding them as co-author via the Co-developed-by: tag?
> > (Assuming I Hsin Cheng agrees - See
> > Documentation/process/submitting-patches.rst for how to do this
> > properly).
> 
> Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
> I Hsin, do you agree?

Sure thing, so do I need to apply the tag myself or we'll follow Yury's
patch work?

Best regards,
I Hsin Cheng

