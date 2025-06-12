Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92636298CC7
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742404; cv=none; b=QtJK4cCEQqHvX+b7JKwVtViNHN2fkdJZHs3nRBT9SB7geUPZ9AXWbj6X3JyJn41eD3yKeZcOd+yuprM4npEEAIo2jzpitY4O5F2lHGUyUAjLcyR93MDNYWnQpr5bU/VE5gOUQO1V9bZbg0Oveljr1+PJ7J9W4BYmG/UNnTmVVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742404; c=relaxed/simple;
	bh=6YnmEXOKL6PbXyUgipPtC7A4s4uacsXT4XYQ9+iz6Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8iKAbDoqtwC2Vd/IpxuwUCU/V2PYIpssicFh4DcEatuZ1Lu0dXe/hVpmynx0zVhnMh7ZyGy3TqJqIRLpS4UUIdq1gaNANLh5tTkxomLXOMdc4fNW6Ut8lCzjrghParxLFKP8YZ84sT3TeXn2iu5qhGPHFcNvg9EEkrDIAfotRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mETkkVK1; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mETkkVK1"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3134c67a173so1320518a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749742402; x=1750347202; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MGxDFg/HmJoySIMD4YNK40OWrOvflDMI9dS116JdMxc=;
        b=mETkkVK1Xl+ejn/pPTkNtEIdKR6nHKMhICcfaWvhv15+3lrxyU+oE0K+5xAPJyjhdO
         6shJ6yuSQ5czeUEATMsOF+AeMe+MuFnks0+qoOr072zVT8cHQWzlLlYWzjJLRMvYCtWh
         zyOjbORM/iqTw9rQLTM2FhOl8ujYYckjj/+A6rEIbMt15RMXE0vKN49qcyLyCInSt3lq
         tGEAIBOpFSTZdSEiwNjSqgjAlwA3/9AMxT669kDjvlcXBIB/RHyM008lMyqXSQrvC+kf
         sOLq9COgFKCiS+jgJqBEsxbcrD4Y3oVqf27kpjRQaij2iE8xNbfsjvTFe/tIF9p1kfaU
         rDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742402; x=1750347202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGxDFg/HmJoySIMD4YNK40OWrOvflDMI9dS116JdMxc=;
        b=Ndovhml3c2gOnA/44pE4N3Ur0Kp7kwZERp/0xKXxLGo3IPc36k2wLoyrEWE4P1wGdT
         O4ikinjkbrNpqEODT7Mur5pyDqqN1FnjbPUGMI87UuChPe2OfASJda6y08Wv3+5c1f9T
         TEtIIYTPizBn5/24ijsKGtS1RTJ40yrvflutIzQXaiOl/dBAZIiVEL+wjjQZ5uxke9yk
         eS//PA6bIyohjV8A9ezh5BdH+rolqy/6JtYeigiG0eqdLKs3zKKI2Z91z1t+NwO5C6w+
         btk3kpDT/k5NfBUi3GPhivqy12n5fAU1vIJA2XBsPebUOm5E/m5XWR0+vPGVU+1SNYYb
         Ax6g==
X-Forwarded-Encrypted: i=1; AJvYcCVoSZqa3LAVOgx9W2fmjri8FoCrIkUmRbQerqs+/pNsblWsax5oKR2hPSJWW3mdwDvbtO7i3KS1eSg6k3YxyfyWsgfWUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5knlE0GKd6IX6c+x3HynjBT5DOnlF8OSysiRl5cGre8oJcNHF
	PF+i0ie6Zf3+EgH5cUbEJhhj0foK8LN3C+kg9AWPKgz+R4wgtIXKTd9i
X-Gm-Gg: ASbGnctc8+nYkCm7DdZBLi81WaH6loz+++TE1wXqy/5qKSyAQaE6CFsl0nKv94jVR7U
	e7EPBTaCVAllU/kgMudZtBQbqk7ZQDYH88P8Fx9cz4SLbkq4gqcnTAQEVQVd7RSx/I2nde5R9+K
	Nozr0kfSHf98BKv2C+R4wQ4KdxwGhPNAD9CIowB+ZMVjCwy9nLTrrs0AMKpHrjXXV/gSN3D+B/m
	3/yFJY9f88XB7UaLReQQCWeEOEBxWLmZp0AWJSUQ40gI16kCwaqValS5+CqEQpNIBlhj0LO0jko
	AdNZJOdpqCNEe8SSF1w78G+hOdqrpSoHD56I47/RiDEAZLtGOsD3OMgnbWGTew==
X-Google-Smtp-Source: AGHT+IGXJWSFfYqIeIxyvNC99OFsIj/yUoYuwJDQRxxBbsMN9frrVX8Wp6lDlwJUxZwUhjyJaX/Nyg==
X-Received: by 2002:a17:90b:134f:b0:311:baa0:89ce with SMTP id 98e67ed59e1d1-313bfbb3a42mr7061210a91.12.1749742401747;
        Thu, 12 Jun 2025 08:33:21 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e6fa30bsm15442535ad.176.2025.06.12.08.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:33:21 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:33:18 -0400
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: John Stultz <jstultz@google.com>, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aErzPhCYGLqOdlTe@yury>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
 <aEnTSuVy2Aq8jRk8@yury>
 <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>

On Thu, Jun 12, 2025 at 03:45:36PM +0800, I Hsin Cheng wrote:
> On Wed, Jun 11, 2025 at 03:04:42PM -0400, Yury Norov wrote:
> > On Wed, Jun 11, 2025 at 11:35:13AM -0700, John Stultz wrote:
> > > On Wed, Jun 11, 2025 at 3:45 AM I Hsin Cheng <richard120310@gmail.com> wrote:
> > > >
> > > > Simplify the procedure of CPU random selection under
> > > > "clocksource_verify_choose_cpus()" with "cpumask_next_wrap()". The
> > > > logic is still the same but with this change it can shrink the code size
> > > > by 18 bytes and increase readability.
> > > >
> > > > $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> > > > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-18 (-18)
> > > > Function                                     old     new   delta
> > > > clocksource_verify_percpu                   1064    1046     -18
> > > >
> > > > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > > > ---
> > > >  kernel/time/clocksource.c | 4 +---
> > > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > >
> > > > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > > > index bb48498ebb5a..ab580873408b 100644
> > > > --- a/kernel/time/clocksource.c
> > > > +++ b/kernel/time/clocksource.c
> > > > @@ -343,9 +343,7 @@ static void clocksource_verify_choose_cpus(void)
> > > >          */
> > > >         for (i = 1; i < n; i++) {
> > > >                 cpu = get_random_u32_below(nr_cpu_ids);
> > > > -               cpu = cpumask_next(cpu - 1, cpu_online_mask);
> > > > -               if (cpu >= nr_cpu_ids)
> > > > -                       cpu = cpumask_first(cpu_online_mask);
> > > > +               cpu = cpumask_next_wrap(cpu - 1, cpu_online_mask);
> > > >                 if (!WARN_ON_ONCE(cpu >= nr_cpu_ids))
> > > >                         cpumask_set_cpu(cpu, &cpus_chosen);
> > > >         }
> > > 
> > > I think Yury submitted the same change here recently:
> > >   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> > > 
> > > Though, I think he has another iteration needed as Thomas had feedback
> > > on the subject line.
> > > 
> > > The bloat-o-meter data is a nice inclusion here!
> > > 
> > > Yury: Would you be open to adapting I Hsin Cheng's commit message into
> > > yours and adding them as co-author via the Co-developed-by: tag?
> > > (Assuming I Hsin Cheng agrees - See
> > > Documentation/process/submitting-patches.rst for how to do this
> > > properly).
> > 
> > Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
> > I Hsin, do you agree?
> 
> Sure thing, so do I need to apply the tag myself or we'll follow Yury's
> patch work?

I'll send v2 and include your results.
