Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033D725E478
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 06:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749536882; cv=none; b=hlGEAbMhYUGEoGDZ/YrrjRfi7xCTEZiOTknUXwcNp44PlUiSAccuodsdC+/tLR3ZGgKLSz4zsujj70G5g+CmIYKhgU80RgfC361U8tHTMZF2UDQtqbsbFXrXDRxVaCD4XOXFdtjgJKBFWq1hQNJlhCSSML7z4mNac053dvFkADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749536882; c=relaxed/simple;
	bh=3RySZmq6aFNeYlomSwoo4Yh12T77gmiZ464JOIGhQJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNbEr8SurACAnS2qEAOLuOErhRjjMBtQjca+wZCLXX6tit5kwESv7iN09XZVG5PrauSTkjtkjuKGb0mV+fxZVAYVE53tDVLIPcEiG338LG1L0DucRrQ1pGEJIppLRtTCwG7fUTc6/Vk09+lEVLVMKDZhd1wOvCDT9dLwGwDTy9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlksF7+O; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlksF7+O"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-745fe311741so5601321b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 09 Jun 2025 23:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749536879; x=1750141679; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QSUw9NQ3m9yaoFUqCLQXfy1ZhQ4O+VqBpSj2IkfjqDU=;
        b=YlksF7+OWzJjaVRawr28XfWgp4ay8kEavkpv/DO5HC5HcXI7t5Q/RujjtvoxLrQmcg
         aQS4xDxmRziarMDVn4B2pk02tXUSZh3r8ngtglrrwf1RdF+GqfJ+FZMpUaZMPJvzqWL3
         /qXYV5uPd6Ki/7B+GmQ4a2IhrNBEBjOkC62ebv+5Pcyc+TlDMUSP5HtgecuDrZz418Yy
         /L9Pyh2mhaP2ebsr3ksmtF64EWtWuJVzVDBfDz37Gct0EPY+JQnyzg4flgG+X4DNwD4V
         sX97+iowPQRrkyJ9RVv6CjNgC4AxAq3Abq8w9UOBoamK4+EpIs96Egd00sPkaScIfX3F
         4VXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749536879; x=1750141679;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSUw9NQ3m9yaoFUqCLQXfy1ZhQ4O+VqBpSj2IkfjqDU=;
        b=QGEntPm4PhZGCgmtCqG0uJx3H/ksBOEkC5CWaMnGKhDN+WJ6TVT4qxvYL66CPAYHXh
         e22bU2P+1q2nzT0Up41Lu1RhqWCx+/r3Prx/oklRm+DZx2z1IV98VdPFqIiZive1R3gK
         9LfFkxiVj0yGr8+cvOMS2LQ2ztrqjHH4fQICUYMXKv0jXWNmuhT5WrA3lIhySpctoIgb
         0sBmtI29wUPylUsWMQTKdO7sptcwk+8gatkbLNrGoUQaBCpTz7hToJyZIVxPgBuYn3RD
         P4Y7xJKlBvPxKFwswAyByOxltYXWMxYTybeIUkLbOcT/q3O5DyVJHMMXaVasqy0fdm64
         Xuzw==
X-Forwarded-Encrypted: i=1; AJvYcCWiWmT9PR5E2l7QVsLa5gjM63G9Gpwv4kRGKy6OBJUK2nZnIFyAlhf4x98ZFG2yG9i+bweHKHVV+CXS0Tu+wscEsVVDGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm1xbGHAOHywW7esvNq02mMkyav/L6PVmUF17FupYJtmzY9PwB
	PZku3Uh5bI4TisXo7czJl3VfhzCcx6El5guERyjiRfWQADv3nzP++Ur0
X-Gm-Gg: ASbGncs0b/wS1XPD2XvMAeoyG8zRkIfNl+kHLuXs/C5oYUM4DAyGU1gHvVEkUaEXimV
	6V/CNnLG1Gb9H2z80PtMfwTEpNHZ7QoVSyf4BkEyPDqAYQI9GYr987BJcLcnKFeBKVW5IU3RebP
	Ivko5vwA8MH2LW6SUzBAPCexf+P/8fpc7iiHtPDERKEIXSewAZrD2YF0hFmBvbsU/jZfsAbpz08
	A/tKh/vLaPw1VqjC9DZXVHd1kO9qtqhrc5Es3WR4dJKyI6kvk4Oayu/L8vRQrow5L4ijDyflu2w
	7cySie8YxlYK3q63vKUBogA0AAWzfAtRet/6ois2gYhtxyww19cfxQ2iZ45NKE3LlkeNG0lf/eA
	TR08hV3dQlim0xA==
X-Google-Smtp-Source: AGHT+IGjpd5+nTkCN6vJhxOxRFSA253lWZbpZIbQsFwQfvVoj7VZCSp9o7UK71MHIR/U2kEbcPexrA==
X-Received: by 2002:a05:6a00:c8a:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-748618bdb31mr2172258b3a.19.1749536879296;
        Mon, 09 Jun 2025 23:27:59 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:92fa:651f:9075:3817])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e8163sm6988042b3a.145.2025.06.09.23.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:27:58 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:27:54 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: sboyd@kernel.org, tglx@linutronix.de, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [RFC PATCH] clocksource: Enhancement for clocks_calc_mult_shift()
Message-ID: <aEfQauoqhEs2DkiG@vaxr-BM6660-BM6360>
References: <20250609194611.690678-1-richard120310@gmail.com>
 <CANDhNCrVtK9Tv+d1=z1yrh4OxiS+neENQejD5pCi+R=Cwra9Xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCrVtK9Tv+d1=z1yrh4OxiS+neENQejD5pCi+R=Cwra9Xg@mail.gmail.com>

On Mon, Jun 09, 2025 at 05:32:05PM -0700, John Stultz wrote:
> Thanks so much for sending this optimization in! It looks promising,
> but a few comments below:
> 
> On Mon, Jun 9, 2025 at 12:46 PM I Hsin Cheng <richard120310@gmail.com> wrote:
> >
> > Previously, counting the value of "sftacc" within
> > "clocks_calc_mult_shift()" use a while loop to determine the amount of
> > decrement operation for "sftacc".
> 
> This is just a direct translation of the code into english, without
> any context or explanation as to *why* the code is doing what it is
> doing.
> 
> It might be better to explain first *why* the calculation is being
> done, and then get into the limitations of the current implementation.
>

Sure thing, I'll change this part.

> > It's equivalent to the position of MSB of "tmp", for which we can
> > derive from (32 - __builtin_clz(tmp)). Use 32 instead of 31 here because
> > 1UL should be treat as an amount of 1, not the index 0, and even though
> > "tmp" is of type u64, since it's already shifted right by 32, only the
> > lowest 32 bits will be possible to have non-zero value.
> 
> I was having a bit of a hard time parsing this paragraph, so it
> probably needs some more work.
> 
> On first skim, this also was a bit confusing as __builtin_clz(u64)
> *seems* like it could return greater than 32 (but that would be
> __builtin_clzll).  So the (32 - clz(u64)) bit might confuse folks, as
> It's pretty subtle that __builtin_clz() only works on the bottom
> 32bits.  The code should definitely get clear a comment on this.
> 
> And thinking more, would using ffs() be more straightforward here for
> what is wanted?
> 

This is a nice head up, thanks so much ! I'll switch to ffs() and see
how it goes.

> > This change is tested against a test script [1].
> > Result shown that it can save a significant amount of execution overhead
> > for this function, which is invoked often, the whole system would likely
> > benefit from it.
> >
> > -----------------------------
> > | old version | new version |
> > -----------------------------
> > |  11500.6 ns |       44 ns |
> > -----------------------------
> >
> > The execution time is reduced around 99.7%
> 
> That is impressive, but should probably be contextualized around how
> often one might expect clocks_calc_mult_shift() to be called.
> It still looks like a good optimization, but we shouldn't over-sell it
> unless there's a concrete impact to users.
> 

No problem, I'll try to use bpf or some debug prints approach to test
the invoked frequency of this function, what do you think ? maybe
there're better and more elegant approach to do such profiling ?

Btw I ran each test for 10 times and take the average of them, I should
amend this in the commit message.

> Thanks again for sending this along! I'd just take another pass at the
> commit message and the comments and see if this can be made easier to
> understand when someone 5 years from now is looking at the code.
> 
> thanks
> -john

Hi John,

Thanks for your review and these suggestions !
I'll refine the commit message and do more test ( e.g. use ffs() ) to
see if it can be better, I agree the commit message might be too
confusing, I'll work on that more, thanks for your time!

Best regards,
I Hsin Cheng


