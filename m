Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58F3252288
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 05:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749792605; cv=none; b=f2mzMN0ZLMkl2t9wU2ASB/cSbvT+9HC5cblMZsGX8Nb3ZcDMsxcd52aAfLw/nc8dF3WsOutMOtiqOERoLpgaYEyOMZWmDRC5POOeJ+HnVWNGQq2NFx8Q5LGN6ZkFhVmMP1+C0UNAkl4+zZD9lbCG4lIOqFAJg+OSZfIjh312wsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749792605; c=relaxed/simple;
	bh=r8KkCIzp3kZhD0+P5UH7KpYcldzXs6eKA4TYAOYpdXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2SsQ84uH7J6n0lgIOWr175evlr2RMmcwL9PV19PRrbZmC0HogRDe1nAFEOUUP8CXwjeTo1t5mrOEb+Bbsj1Wf1NHfejZFPsC7hjnslv0vrEBvG0pjEp8b7BNSyi7sawnlMD49nW2zUrZkGPv3EC01m8Dhlo+uBsD1Nr2QLJNfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JprurCHv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JprurCHv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234d366e5f2so22810735ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 22:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792603; x=1750397403; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2XqHKaLrCKRBJT6r7hR1Zy3ct+ewEN8z4Ys2ijGiySc=;
        b=JprurCHvoSmrH0pb5ykwk92YrxmwecJw8yTQSfWUhHQRfASr3TqHZOReP2Kwks3EZ2
         sUEhvlyrYKOUsGR7SqXxRbfyabBEKY38kmsLhTR7Na9tmjTeWFFm7r/4hUScXxwSGlte
         uNZEatvcZYdO95R+pJy2RHgvz72zkjvmLgHxnLMFaVCJGztrazyn/ooyvbiCTequPY2E
         GHJ3dnzDN3kNwRlC3U+EXeiKx0wh/dLly5qEJB1xiIbE5fqqeES1iD63rEDFE+wI/wQS
         bSo8f2VBqktQhkz/8agsOhxsdj0PZ7QCVAGgB2ipj7BysW1risLuPo6VrWsk37yvHHGW
         UVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792603; x=1750397403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XqHKaLrCKRBJT6r7hR1Zy3ct+ewEN8z4Ys2ijGiySc=;
        b=kdQ9qddIUSMKL14HgtpV3m4Rc9SLlyrMH8xxwsWcVfJff5bN8jULrqmFOwtBCqflkC
         CcF0HL92vIPMlW7J4Bh1/ANWKzMAiEfx/FhQU45FgKmGcT9q7u4vEw46omw8ucgE9AIX
         FHyrIjSLts0iVHnJmiK9GgCCBFYrZ4GW5+nMKCsiXng2Ui2OC4B7EVpH6Rp+Kkwi4loH
         DKod4stGAW6uXjD5NeTLAvuoOp6UimoGTY0+qPcPG3JVUf5lkYCdhBh5WanW/vqlqrYl
         NdO6I0gGWSs6zVfRn7Nx8OiPwtxawxerhBncdOfOaOEbm6Ca9ijtR/4sv+irGDj5HvCg
         DpJg==
X-Forwarded-Encrypted: i=1; AJvYcCWxJ8ZV4r2LzmOeV/bGOlI0cj0klO2uW7e38nDbWsRsL+NqlPeDyZId3vRapRPLM9DZ9aNsFAeiV5FH04qZk9aTkF44jQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YymAF9l5vYRYJMhxsON/vEqjcCYKgW6nKYI4woFO0Sj58uGuMk2
	nm0gO/1gRdH27BvqF6JvZyGmPjqCa8ponChP1TZBTh+Py+SKMmX+MDp85oktCBYv
X-Gm-Gg: ASbGncsj+pqit8iISOyqVpf5uMRXx6MNq0kpeZzdZy5OUDWDfVywend558tJNNtp7oR
	uG6r3AfXLmCqqQRJzVWahtrkty7g1UCWCxpzo5DUt0YQrmVYCFZ9CMbYYP05WcKWvGLyTbgIO+j
	ZMyeMfeKqgdCQm9rI06XF+l9DIMSeq4WZCR8MUAVZmmVEhInWlQt41Y4+ploSkG6WpVHlTO2UkR
	ftK0Wj1YPwoHi61K4nH4gTgexxkgsZtQL+3A6JBNdbHymed5qH8FoVhoFLq4AtHqESDy7Z9YEXO
	JVyvkVsIwuPuxay5eG8hHUhDGfv1t3kdk5eiKRK6HIorHqG3TB8f26XWHV3BFAFRRr5zRFSXN2F
	APoSTlbG5tfug7A==
X-Google-Smtp-Source: AGHT+IFHOSSAJAZGuPgsa5iDt1Zmp2oipKJCsF5x1PgfeiiEARa0h75+2pn3EaISP8w0hQLTmsav1w==
X-Received: by 2002:a17:903:1aae:b0:235:e96b:191c with SMTP id d9443c01a7336-2365db04d2emr27032315ad.29.1749792589559;
        Thu, 12 Jun 2025 22:29:49 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f20f:da05:7371:bb5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea903dsm6299335ad.158.2025.06.12.22.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:29:48 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:29:45 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: John Stultz <jstultz@google.com>, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aEu3SRt3l2zaV6A8@vaxr-BM6660-BM6360>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
 <aEnTSuVy2Aq8jRk8@yury>
 <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>
 <aErzPhCYGLqOdlTe@yury>
 <aEuzgmClrimyc0RY@yury>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEuzgmClrimyc0RY@yury>

On Fri, Jun 13, 2025 at 01:13:38AM -0400, Yury Norov wrote:
> > > > > I think Yury submitted the same change here recently:
> > > > >   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> > > > > 
> > > > > Though, I think he has another iteration needed as Thomas had feedback
> > > > > on the subject line.
> > > > > 
> > > > > The bloat-o-meter data is a nice inclusion here!
> > > > > 
> > > > > Yury: Would you be open to adapting I Hsin Cheng's commit message into
> > > > > yours and adding them as co-author via the Co-developed-by: tag?
> > > > > (Assuming I Hsin Cheng agrees - See
> > > > > Documentation/process/submitting-patches.rst for how to do this
> > > > > properly).
> > > > 
> > > > Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
> > > > I Hsin, do you agree?
> > > 
> > > Sure thing, so do I need to apply the tag myself or we'll follow Yury's
> > > patch work?
> > 
> > I'll send v2 and include your results.
> 
> John, FYI.
> 
> I Hsing submitted another patch that duplicates this series. You're in
> CC, but just in case:
> 
> https://lore.kernel.org/all/20250613033447.3531709-1-richard120310@gmail.com/
> 
> I think it's pretty disgusting. I will not make him co-author, and
> will not give any credit for this work.
> 
> Thanks,
> Yury

I just realized your patch series already does that, I didn't check on
other patches, I'm sorry, I should've been more careful on that, not
just looking at the only patch in the link.

Hope you can forgive me, I really have no offense on that and didn't
mean to do it.

Best regards,
I Hsin Cheng

