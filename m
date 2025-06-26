Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8952E6D12
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950505; cv=none; b=BZd7gRPqSiyQ9vbgKdwYwqS1APSh2XYeKZbieqNcSgwNIullG/jv9Qs4RCE/1cN0KheMfIKGPE52aqJAsJu3GW2KAxOC5MXzS/iRqzfeqYfcqLJIQd2H7lJn6pCoL5w5f8GT6BJ1hBOs/z8WY0ognYBjpQP8+iu/LOsPqnw7ZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950505; c=relaxed/simple;
	bh=Ha+edyNTGZ8ndXkb5lo/UV54gtYkiA8WRmrab3d+X4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnzjNKsqhE7cKHzCay6K6H0ahFp4I4dCWPkLBVvZM+I7DQ+mas5V2/p1Lf/0lRHZdqTwfVy3YZI6VUgDWddbJczmOFJeadrF2O93mACBqyeUs0/TeRfFp98NjdF3Y144VteBN+vcVFwaAXcqw6GXIq6G8u3hiC9BVCQbwVNepSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsbXSwLP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsbXSwLP"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b7123edb9so10222091fa.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750950502; x=1751555302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFuEEDOzNJYie2aS6VWkJQnYh/biJhh/VjmDxkcdYnA=;
        b=AsbXSwLPm5fnxhtXkBi+YdYdaVq4wHiv7okyCyWS4IzRBF+liIgAgaaP/e4zUQURZS
         TcTeK1aOVrkKOq/9/kG/NXBxd4KtzFn6vzC4h/PjD5WcrT3NvUBAJwYUeHxbj3DyUUWP
         EdbroC+evXJHc5AiJ1gv6y88wOSBQE+E+DAsXXULBMew+/IxAt/alty05QWsgGRNklOB
         bWRJgzOBjHmxqCU9K6Vcox3ivI+SgmKTWN3h9FLG0BB9u9RBXeWWgmz8i77eH62Xu1t+
         rTk53Rv+9QVYUFVt+CRsnAUXsaAfWFqZlkw9k+p7qZLcYTiQdDzcj/nDXrcsHRF232ru
         eSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950502; x=1751555302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFuEEDOzNJYie2aS6VWkJQnYh/biJhh/VjmDxkcdYnA=;
        b=BkIzGMPi4pXXeMlfVpq9N8y2ceKJi2qZ12ZRhCMj0SRJZI6AewNF/8wAZkh96uDX07
         lIbgR5BhcClPWmMsKHy+05kL/aAJXBLm1mVDYRxnRnXMzRpKiZnyJdZPXoWSgN72XxzG
         xMxOG2+9jALcQTcT3w/peyq5u/3OCb+x9+ecZI5UKxQcbMuUTI2N7iL3lUD+6CNqvIoL
         ApKiZR6reH1XHxQt9ZI+2PeSpwglLC8Xe2A4LTLOFy9p5EBMcv1iRSMZtZkG4Qyrd53c
         pzTYd2QFsWQ7NN7O2qqUlC8lpfoFCTXtT5Z11DddT4gh4zjDA/g1/FnyuGzZwZa212K5
         LKdg==
X-Forwarded-Encrypted: i=1; AJvYcCWMohEUeYeP/fZzxqKlgg4by72WLRo2klCZSuTMA6cTYlGttXEYoWV6XOLzw2dgCXswXAKUEPw8CKZYgOJsGMpDFg4GDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ3gI9PPYSFLdPu5ncfte8vQonyqNVNQHkwrhAkAjXy/bEXGoI
	mxCTnMfT8aDCflp3J6Z8/K4hiM+AmDb/QWAO4wW8EeWqkMXxNgMtATG3oWaioj4rhujYR/0iXiM
	btyyxPwrCYN2f5UKjvSJeBpqXmHpMrns=
X-Gm-Gg: ASbGncv1+NseMYbyD7dh49Mhyb0elE1xqnnhSm2jsY1w1u5wxWTfUr69JRxhmCyfMTR
	Cr6s2W/GPlG8dHQrsegZ5R7GQc3Jdnw4n57kNGWQBR/awptZIlJMfBIg5HHCYOoOh1hKfcvQ4KK
	L34c9oL14W1c54VAbgZGQ7CoJz1KfJzi8jP3Nq34FuVW/SAd+moeMRyMtam0jzNDje0Nx6IjKhe
	B93eA==
X-Google-Smtp-Source: AGHT+IGrpoccZpE7gCl7xfdKVG914W+wx7VH7Dsg1ZCo+rhw6h3VHHsoRSKoF6qysZJ9WGyQege+2T82Jbrty12yIA0=
X-Received: by 2002:a2e:a011:0:b0:32b:59d1:7ef3 with SMTP id
 38308e7fff4ca-32cc65b7b0cmr18432591fa.35.1750950500472; Thu, 26 Jun 2025
 08:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626142243.19071-1-pranav.tyagi03@gmail.com> <2025062607-hardener-splotchy-1e70@gregkh>
In-Reply-To: <2025062607-hardener-splotchy-1e70@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 26 Jun 2025 20:38:09 +0530
X-Gm-Features: Ac12FXz90vVDsL3CpnJRMV-o2H8K_6Vief1VnLAmxr4fTIuJkeSDNsKRMhYHXKg
Message-ID: <CAH4c4jJqX6C4+xvHKqC2fmN7HRhKPgD2XcjnwO2MR0xtMyEhRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the
 atomic commit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, hamohammed.sa@gmail.com, 
	daniel@ffwll.ch, airlied@linux.ie, mcanal@igalia.com, arthurgrillo@riseup.net, 
	mairacanal@riseup.net, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org, 
	sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 8:27=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jun 26, 2025 at 07:52:43PM +0530, Pranav Tyagi wrote:
> > From: Ma=C3=ADra Canal <mcanal@igalia.com>
> >
> > [ Upstream commit a0e6a017ab56936c0405fe914a793b241ed25ee0 ]
> >
> > Currently, it is possible for the composer to be set as enabled and the=
n
> > as disabled without a proper call for the vkms_vblank_simulate(). This
> > is problematic, because the driver would skip one CRC output, causing C=
RC
> > tests to fail. Therefore, we need to make sure that, for each time the
> > composer is set as enabled, a composer job is added to the queue.
> >
> > In order to provide this guarantee, add a mutex that will lock before
> > the composer is set as enabled and will unlock only after the composer
> > job is added to the queue. This way, we can have a guarantee that the
> > driver won't skip a CRC entry.
> >
> > This race-condition is affecting the IGT test "writeback-check-output",
> > making the test fail and also, leaking writeback framebuffers, as the
> > writeback job is queued, but it is not signaled. This patch avoids both
> > problems.
> >
> > [v2]:
> >     * Create a new mutex and keep the spinlock across the atomic commit=
 in
> >       order to avoid interrupts that could result in deadlocks.
> >
> > [ Backport to 5.15: context cleanly applied with no semantic changes.
> > Build-tested. ]
>
> Did you forget about 6.1.y?
>
> confused,
>
> greg k-h

Apologies for the oversight.

Regards
Pranav Tyagi
