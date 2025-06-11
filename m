Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911A32D613
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 05:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620826; cv=none; b=bS/l/TCdy9USvaLaTnlcdit/AyX09q78PgeV7VkoEECNtUjVegdjDOFuPqwq6pxqcFIQIyl660ECnSQ2mZCZ8wO7O2v+xiP1Q3TtQQ2Kj1sdU5Cf0gdg9eIZOZl9KAYhaYryHTJEYGHrT1PrbO8lYBrFGCBOYHYZuyTtlcp9qKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620826; c=relaxed/simple;
	bh=K4YpENB7iNEnnpJGzBtoAAXxiexPDlVW+dNKiACP+N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlnDpggFsUsRFrfH3CTMANBhjVzaq+jQAZ3HnFSt/h/jP0i1fTn2bf0qg0jZ+6+/M/kPsMsdVkgeWnX/F9/siBPKX5sOalr+Q/mDbXRxI7CE0cAIbo33wNcu7y2LQMAD3UD7bAQ8/BT5HIXJJk1TL2CH4IHbAOhVLh9EeEPV9TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtFDM1jB; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtFDM1jB"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af51596da56so4425298a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 22:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749620824; x=1750225624; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+TU59eKRSCrO5cELvPyG4AtCwG0gwydsdZ1KPBC29Bc=;
        b=OtFDM1jB1Y0bSwttZtiDGiDa4I2UjcAdzboyL1+NBGNJof3CRAJYhaOlc2u+CRR0/f
         4mGFKog+qVlH+aX9Mtaq8cL63FKpd5wZUK1oBudZcHw+bG0SjzjKc2YBphTnA28688V+
         1w8qsNndpcWrsuK502HJ6+/BCCEe75ExyluPZTsHfpxKKcT7XEWhRrWPYT5wez5B2xhQ
         plA3T2FX1pdBwuWHhgSq1rdDw/MFLOsfpG9OE5UZBl+NSP0K/egKTkZIFhhV1Y2UKrIC
         Of/Wln4snB58Ci2eQq0i6IUz8UQ7PS3G3DyIqY+QtdSRJ9Om8w3qzBakYvcsBrol6GlR
         wfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749620824; x=1750225624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TU59eKRSCrO5cELvPyG4AtCwG0gwydsdZ1KPBC29Bc=;
        b=P/lmRlt3OAH/rDpN2WF8LEq3Q33cclMmQfrdb8K+/9596e2iUiskxs8rCieqrirhBm
         2SgWdpwTLnREKVnbYXU3UAIfDGPjgMVNX3FhN3YPfs4fA4Tn8VelxGTovHqHo612yx9J
         ydehK1T0ychjrkSR5DaOB/LLhiqaF572xzcLkUF3cL/PBPefc+ikc7wOxh49+GvxcnQ3
         A63PiIMHYFnciIn6tLOsWljl1qZLmgZssCaxgIN2ckuHFIiO5oGYnWDHMuO1vfJOMq8V
         Im+FIgZAfkJ0iBx2rMaJKJgLVO6nW24CBggzj8oiAyv4NHLSJH8rEdMadKJvb8fmo06u
         WoMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEttwmnXw5VX2TRhv02j5KbjMr9hWCtMkpOFDhg3zX2AvKiTyLDJU9MOj3zr/ZC8ZKQr698zFnojxniC8z/bq7/rEF4A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7Wp+NW84vDlg8DRLayMUIG5MMgWYgBmC94//xsebr9Zb1RLo0
	yL5ggZ5SyfRwGoVa1vJVF+uFdstrDKvPxDVERQ+6PCXQygHOhKyevEdY
X-Gm-Gg: ASbGnctVUXj3RLNSB4OAYCeK9LcU69B+0DXbKL6kO1cwjCso4wSwcEq/FwhOTZLPqjN
	6YfxkA12/7M2YULD/4nvql7saJq/MqUp+ia3cAnQeDKGnTPKYiH7Npgm5hiFQqQ/vlkoYEF/tRv
	OrR1S157Co8WE/97qZA+7hgJqwss23U3TUaMnZipaIbtcjtFbGTvlpMFNuLwp9xYubkkTxQRpx4
	viRd6D/efkdgeP2kkKNI5OHCgJCOpTilEy4jF6wCNmi+dxsspQFZLG7NZOYbAOGzLnPWG7VsiB5
	vfw1+mXKE3EiK6xrBgcQcZqceGuZxi5+CjEfmnidihqqUUj5JzDlMj3IgeEvVjefv5EKrqH3q6M
	=
X-Google-Smtp-Source: AGHT+IF2uAUARXMreM1pRjUHzUOuPeAwpmuQxMZLWN1mBJvLCmBcqtagsD+JLZcC907KxwQEmum+nQ==
X-Received: by 2002:a17:90b:3902:b0:311:df4b:4b8a with SMTP id 98e67ed59e1d1-313af0dd7e0mr2849783a91.3.1749620823736;
        Tue, 10 Jun 2025 22:47:03 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:1:3903:b29e:43c0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b201a6d0sm520831a91.21.2025.06.10.22.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 22:47:03 -0700 (PDT)
Date: Wed, 11 Jun 2025 13:46:54 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH v2] clocksource: Replace loop within
 clocks_calc_mult_shift() with clz-based calculation for sftacc
Message-ID: <aEkYTq5JdwGwWcCF@vaxr-BM6660-BM6360>
References: <20250611033001.707396-1-richard120310@gmail.com>
 <CANDhNCrez0=fKoH=1Kg6SG08yPmZ3q3N7rD+Dm3e8=-hHoj_6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCrez0=fKoH=1Kg6SG08yPmZ3q3N7rD+Dm3e8=-hHoj_6w@mail.gmail.com>

On Tue, Jun 10, 2025 at 09:31:49PM -0700, John Stultz wrote:
> On Tue, Jun 10, 2025 at 8:30 PM I Hsin Cheng <richard120310@gmail.com> wrote:
> >
> > v1 -> v2:
> >         - Refine commit message to explain more about "why"
> >         - Check the frequency of "clocks_calc_mult_shift()" get called,
> >           it's not in hotpath on my machine, refine the commit message
> >       to avoid overselling it
> >         - Add comments for the code to explain the implementation in
> >           more detail
> >         - Handle case for "tmp == 0" to avoid undefined behavior
> >     - Experiment using ffs() but it's used for finding the LSB of
> >       a number, which isn't MSB as we want. It would still need
> >       looping when intended to use ffs() in this scenario
> 
> Oh, apologies for mixing that up and leading you astray!
> 
> 
> > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > index 2a7802ec480c..59145d762f1e 100644
> > --- a/kernel/time/clocksource.c
> > +++ b/kernel/time/clocksource.c
> > @@ -66,10 +66,20 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
> >          * range:
> >          */
> >         tmp = ((u64)maxsec * from) >> 32;
> > -       while (tmp) {
> > -               tmp >>=1;
> > -               sftacc--;
> > -       }
> > +
> > +       /*
> > +        * Decrement "sftacc" by the number of bits needed to represent "tmp".
> > +        * Using (32 - __builtin_clz(tmp)) to ge the bit width:
> > +        * - __builtin_clz(tmp) returns the count of leading zero bits
> > +        * - (32 - __builtin_clz(tmp)) gives us the number of significant bits
> > +        *
> > +        * Note: It use 32 instead of 31 because we want bit width (0-index MSB
> > +        * position + 1), not just the MSB position itself.
> > +        *
> > +        * Handle tmp == 0 separately since __builtin_clz(0) has undefined behavior.
> > +        */
> > +       if (tmp)
> > +               sftacc -= (32 - __builtin_clz(tmp));
> 
> Still think the detail that __builtin_clz only works on the bottom
> 32bits is good to highlight in the comment.
> Though maybe, would explicitly casting tmp to a u32 help it be more clear here?
> 
> thanks
> -john
>

Hi John,

Sure thing, sorry I missed the part to mention it onlys works on the
lower 32 bits of "tmp". I'll amend that ASAP.

Btw I just realized it's more appropriate to use "find_last_bit()"
instead of __builtin_clz(). Most of the in-tree use cases utilize
find_last_bit() as it support more optimization. I'll cc to bitmap's
maintainer in the next version and see what suggestion he gives so we
can make sure we consider everything as much as possible.

Thanks !

Best regards,
I Hsin Cheng
