Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E733220F47
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 05:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791623; cv=none; b=KmjjMzNI+Z/3r2uU3R5sYNX4usA8q/yNSQFTE2Hk4znlpKj6HmhK+bNSuaa03RJp+8IV0wF2+nZZ7NEbI3Gv3/KE+rlEBo5S6i+K/HMbeee1Q7u3MBx7/kyhL8axKkneBlPERWtAYsKaCs5Q+M1MJ3rS9aAjwh3LQPwbD/z/zL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791623; c=relaxed/simple;
	bh=G08/pOykYg7g+o5uKwDII0lrW6v1oU2ghmCj1yDk/Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4YtafHfzVGYSnANAehL3olmLKiNKrwgIDWjqaHU7Addvg1fnL52+OJkzukRQ1buFFxrG65oGpde4ZQ8thsK5/GSnRM9mM6CAnSNUQ1JwsoIC+z5grL8uBXTo37QMB/ZXJ1bfI6agx087bny6hsqVE1uvg67Q47zDBETpSd4lQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpOxRFtn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpOxRFtn"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-236377f00a1so16363275ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 22:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749791621; x=1750396421; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7J7ogaBI7CcQcq/qXPbtxb7m8fBt7tl+AACNdp4HFs=;
        b=EpOxRFtnzYgjD77MRSlnU3ONRpyuo2acukmZiei7f0Ws9tkw4QjJ15TMhm0wjefuCs
         qwsKibx1kHNZG1h6YhEGKQprV9TGeh0jrKVJLxIaamXeIys/IfuKa2CsWVywpJGXae9W
         ur2M2MYpNQo51T+dp3xx00Ew+oeEX/PbvjqzppH0rJGEFKbMzcpJNr5o+X9irkZPVczJ
         Fz/I9v+fSWTZIPqZyYkZB4njfLMJ104dN1GNBCpgEL4I+j68JnUiPr7gP05fZUck2nhO
         J3vMynQlYlLfRzhriZ164gh1Mtpw5XQCO1MsdUGNySPVoQzj7jnOYl9Tb57O3XD1cALS
         3JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749791621; x=1750396421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7J7ogaBI7CcQcq/qXPbtxb7m8fBt7tl+AACNdp4HFs=;
        b=tOuOyI6iMHJ/jJPZO9l+JzD95+iZDLPZLrxwOwSIq7qkRe7BvGSr0bfScU0vUGcgvl
         HnC6medW0yLpBIImHxQ12YYjyKt8yayZTZq74ibD2+b2gTNV7j6SmpQKAxpF6eWpZG1W
         eEpoF33pP+pZTM/DxacUHkOOreft4AMjZDmmsBvIxdgoSoddIj+1Aw2yRKZAiZZ2U/ui
         CmFBCnE2Y7RLhUHbg0R2hnNxV4eTRHUiQ2n0y+X9PF0RF7Il5ohCLWrZlsrF2uJ3vGrx
         hqOi0yOqzH73pnhvR8FQUl08lz27ET8A6kMoIE0dF/TsWLP33Ldr0DTo9iGjkzYIRLx/
         /30g==
X-Forwarded-Encrypted: i=1; AJvYcCVktdFFDm6BZM9ZHivtR0SvRwpIk4VqecUil6HWq7DsotHt36IpKuO3DEGQJNJnGdPtA4rmnvAOpM8u3c7h6m7uaPqjJA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw56CirZQLJGLpaVgB8BowQolF5qLhVapBFuWyssK75HuJ0tP1j
	PWuFFpANFR5dp3FF23KjJfaAiXT1sW86majjAOPDcKKs6yC+Qd6zULUa
X-Gm-Gg: ASbGncvrJUJt5isP1RQXpfBmi4XhvIEUR70D9IfPBKczzKBGRwTFr4OYDgCeLN0YZRa
	prWZUfjPA8hxlGzN7WYKRjFGB2lhMRAgTeyeJWXJ/PFJIHTrwRq1xa+UT4H7b0vf2W+ZK7vIlt0
	SiySavWuCufGSpCrK+q/mNmhMo9d0lk/zt6YHmOuPTni+IBo6e9JhI1VJuDKWbcFaFUNEJPFU0x
	sqk/9+E/rRJxo6YvBZr9VLx3ADGxpJ05wO/RWFhJe2Ia9QUG/1ABXjg/K2O8ac/x9SqOqvZM9eB
	b1Upd5thhWyR0BPY3cCSPIoJMKq/5udcxgrQEAjFr7nLUXXJIBuLkS9oYMFtxg==
X-Google-Smtp-Source: AGHT+IEaUFlrRu0V3wU6FVfbzQxdLX/0v+xsOpRp/MD80VV8ZklYnFrbWKdpIt54AKbXffMKADjvbw==
X-Received: by 2002:a17:902:db0d:b0:234:11f9:a72b with SMTP id d9443c01a7336-2365de400efmr22727345ad.50.1749791621346;
        Thu, 12 Jun 2025 22:13:41 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b8139sm2490755a91.1.2025.06.12.22.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:13:40 -0700 (PDT)
Date: Fri, 13 Jun 2025 01:13:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: John Stultz <jstultz@google.com>, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aEuzgmClrimyc0RY@yury>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
 <aEnTSuVy2Aq8jRk8@yury>
 <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>
 <aErzPhCYGLqOdlTe@yury>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aErzPhCYGLqOdlTe@yury>

> > > > I think Yury submitted the same change here recently:
> > > >   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> > > > 
> > > > Though, I think he has another iteration needed as Thomas had feedback
> > > > on the subject line.
> > > > 
> > > > The bloat-o-meter data is a nice inclusion here!
> > > > 
> > > > Yury: Would you be open to adapting I Hsin Cheng's commit message into
> > > > yours and adding them as co-author via the Co-developed-by: tag?
> > > > (Assuming I Hsin Cheng agrees - See
> > > > Documentation/process/submitting-patches.rst for how to do this
> > > > properly).
> > > 
> > > Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
> > > I Hsin, do you agree?
> > 
> > Sure thing, so do I need to apply the tag myself or we'll follow Yury's
> > patch work?
> 
> I'll send v2 and include your results.

John, FYI.

I Hsing submitted another patch that duplicates this series. You're in
CC, but just in case:

https://lore.kernel.org/all/20250613033447.3531709-1-richard120310@gmail.com/

I think it's pretty disgusting. I will not make him co-author, and
will not give any credit for this work.

Thanks,
Yury
