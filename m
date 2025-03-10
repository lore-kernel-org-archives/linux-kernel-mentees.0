Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF8521E0AE
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741607069; cv=none; b=fl4K9AfFJ4A0PRpdaxabm0V8qazzJNUjeCT0deB4CQxiUH7Yqv6iVgc7jSoGVtTaa1k2wlAWA05KJa4Sk0NnHL6IBwu2Q3a7KCbiPqoYvN8PgUnkDHA7VQzQPTvgktS0x90bseUYx5VLeeYqvVmh0Vm310dVM4IAHyLo7n7ueIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741607069; c=relaxed/simple;
	bh=0IrI9FdaopGtKLOIXX1VUbBx9Fs7ebXPM1YkORinNVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLe5oO4IU3mQreVQ5BCsIyjEOSLu+26HGbDYXfwshdMHw2JvTAUfXNASH/o2ik65njUxPwJhiwCX9XiDSJyOM+najvu5F2HzOCAtJGCXC9OAaw/pVf83A+M7i7bxgn1Fxg1yqalz2QiLCoOR+RnSPx+rblETnRYFhtMGzUtoq04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xiCtHKsE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xiCtHKsE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so23556545e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741607065; x=1742211865; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IrI9FdaopGtKLOIXX1VUbBx9Fs7ebXPM1YkORinNVg=;
        b=xiCtHKsEM8dBlczfZiT6JkqmQZ4uvpmFst7Yr44qzJkdE7jtcvuB+DoeAtnEAmfSwl
         9oRMM7VYLVY1H1WNckvNAWlMqaOfGXiBbkJp8UROS9mgH3/WPLRkMk4s1goHNKRnplzq
         6iWZOi6cWcFjPKbWCZZUE7cV7vLEoLsPYtRfnlqJhXdto6pqXrUhU4ttZVeM+p33pR34
         C2+ld92m1H5Jvi2Pxs7mnA9UjDPJtLHG9WncK679OKrpm0G4GsFgD/czNI7mOZGc8nPH
         ygm+61RsDjEl+72vRg+n4hA5UPQtR+zVrxNXTc4BU77ovFtqaF7zRUS9Y9/r46v6Y80h
         b9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741607065; x=1742211865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IrI9FdaopGtKLOIXX1VUbBx9Fs7ebXPM1YkORinNVg=;
        b=eMArxXPRZxwF6i5ikg22ZepvocWIoiaAF2PxU4/XYK81aWbi4Orqb7mb0nEVmFQo2p
         odsXdjTAEbBkip95+qclqHoZq/9PzsrDwhsH3FDHGjpaqEhgnpOeF3An5ps/zJAoL3B6
         459TMfw6iOKmE0o1wzDNcaEeTITqDXFr23HC/AzHCxzp/ljYSvMvI6jfr91d5IdCxGRV
         IYyBLiw90F8fDGyZtEmgVMjLMDs6SZ3bPAgPbbMu9diiI4K5GwfAmICvWaAw+mEmD9ha
         H0vIaIxXgfGW3iUvoQmTKgYRVylCT0enlygqqZvGABfBmSCGhdB/sAriBBUeeIpvhzxx
         7L5g==
X-Forwarded-Encrypted: i=1; AJvYcCXjr0+bSxpCr3fuyJD1ln/lTeehp4pTFjP7Vu+D0j+OT1+6+y3PhrstXwvyq/kAW1iQNjYSGR28vMcYtMvz1KvPwZE5ig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6gin5UEO8c0MKmioab2T0Sy4ppCnt/DOZEUqkDJEJ2DWnP1MY
	NWl4aOemN0nLlc8ltrjDgqCykwTm719Tj8FOi91P+c8TbXteg3LFmbj03g6ciaxzL4X9e89jD9+
	IUxaDCW2giixpASUUNjWTWH5xtg7E/dNIDHkE
X-Gm-Gg: ASbGnctKKgiuH8IlhIDT8IoF5wdGKpg5MoGC3uDK/M9Vyn3qpy0xdiTcVau68Bvvqfd
	pjQuVWULK20vI2YsgupYxneU+q1Ho6lht7mwRtEbz6m2FSiFxD1NurNBxWUPS8bNjyDKuAq9sTp
	VV6yXCL8Ys539hYlksJQRb4a7LaAZRDeCj5sMW1tR7OikRJDvnUcJ2Wg==
X-Google-Smtp-Source: AGHT+IE7B1UYHeaXlm+Rs1PUlDtw0KdbyXU2RKfDQAGpxGR6ZJC6Lkc9/sArkb3lz0K5BFbuAd57jS8ndRkY2yPVbGI=
X-Received: by 2002:a05:6000:1849:b0:391:3fd2:610f with SMTP id
 ffacd0b85a97d-3913fd26306mr4676571f8f.13.1741607064635; Mon, 10 Mar 2025
 04:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250310073040.423383-1-richard120310@gmail.com>
 <20250310073040.423383-2-richard120310@gmail.com> <Z860iWGtaEFMD2hj@google.com>
 <Z87JpNJU5gxN0YgS@vaxr-BM6660-BM6360>
In-Reply-To: <Z87JpNJU5gxN0YgS@vaxr-BM6660-BM6360>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 10 Mar 2025 12:44:12 +0100
X-Gm-Features: AQ5f1JpNF9ypxpEOLJQP_OHzmzJH77QM5OOCwzuX8EZKFBAaIB9z1lOqXLa0UJA
Message-ID: <CAH5fLgiUj7R4SvKYT3HGxqSDnjs4T6EKB91bX1JFe-a9a=fHsg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] rust: list: Implement normal initializer for ListLinks
To: I Hsin Cheng <richard120310@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 12:14=E2=80=AFPM I Hsin Cheng <richard120310@gmail.=
com> wrote:
>
> On Mon, Mar 10, 2025 at 09:44:41AM +0000, Alice Ryhl wrote:
> > On Mon, Mar 10, 2025 at 03:30:39PM +0800, I Hsin Cheng wrote:
> > > Currently ListLinks only supports to create an initializer through
> > > "new()", which will need further initialization because the return ty=
pe
> > > of "new()" is "impl Pininit<Self>". Not even "ListLinksSlefPtr" use t=
he
> > > method to create a new instance of "ListLinks".
> > >
> > > Implement a normal method to create a new instance of type "ListLinks=
".
> > > This may be redundant as long as there exist a convenient and proper =
way
> > > to deal with "ListLinks::new()".
> > >
> > > For now it's introduce for the simplicity of examples in the followin=
g
> > > patches.
> > >
> > > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> >
> > This change is not good. The ListLinks type has an invariant about when
> > the pointers are null. The existing constructor argues that the
> > invariant is satisfied because pin-init initializers can't be used in a=
n
> > existing Arc. Why is that satisfied here?
> >
> > Alice
>
> Hi Alice,
>
> Thanks for your kindly review. Indeed , I was trying to find a way to
> cope with "ListLinks::new()", wondering if there's any macros like
> "ListLinks::try_pin_init!()" to help us deal with "impl PinInit", so I
> try to send a RFC patch for it.
>
> Sorry I overlooked "commit 52ae96f"[1], it demonstrate a good way to
> handle the basic structure for "List", I'll fix the patch and send a v2
> as soon as possible.
>
> Still I would love to ask why don't we provide "ListLinks::pin_init" or
> "ListLinks::try_pin_init" to support for the pin-init initializer
> returned by "ListLink::new()" ? Maybe there're special reasons behind
> the pin-init initializer here ? I would love to learn if that's
> possible.
>
> I tried "Kbox::pint_init" but it
> wouldn't give variable of type "ListLinks".

Please see the examples from:
https://lore.kernel.org/rust-for-linux/20250210-cursor-between-v7-2-36f0215=
181ed@google.com/

Alice
