Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B97620A5E5
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 20:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752870766; cv=none; b=nmEm2vUJpsev3wYfJsReMiyrntdGNgdkWE3M6Kh0Gkl8B1fPfzcoKHKjSyijkgF46dQ7wL00M4wChntf9WXaVMOGK9erzeZIwMEnpqHbNtq+iKo1rRu5UAjt6W2hY8VLDe9qLvrw/gK3GCnIbA59UcnzFwtIzAP53ykyd+xJGtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752870766; c=relaxed/simple;
	bh=VYLFPInX5wYDsdSBLHlW5bQbgZ8bMLX6OLJt3sa/vVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvJbioF2fZcoRlbaGYf0TJFKVBqLSnRhAI27/5y/U+79XrhQOd36ttajBByrlgVwIIWbhh9/gvkXc5sEYffcaKMwypLcdfjZfVWzgpnZKGS+0hJ1PKSy1CgMexMalQpWq3cbJcOB642ULLBqRSiE33SdUSOz4h74Gg+3i32P/Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iUCEJZNS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iUCEJZNS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23c8a505177so23728715ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 13:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752870761; x=1753475561; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKZtbK4lVu+Fa2vzfgm/vl63kukiWlzYzbXwLbRXVPM=;
        b=iUCEJZNS/kP0K86kruSn+rnD6XV+L9dQLuodeV4usYiYAO2h5oDTEqL6i4MefLdOYq
         QUdu6ndw2fqUVawO3Y33/pnbYJvrUpdo0uW2+1gRDOxWf71tVDldnsRpv/kGzZg6z18j
         BLlBNuT1/oWuxZf57RzGIX/3D/keXJakDF9R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752870761; x=1753475561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKZtbK4lVu+Fa2vzfgm/vl63kukiWlzYzbXwLbRXVPM=;
        b=oEwkLEChsNYBYLcsfrt4O1CWiSxEk0HmWerbWy5WKRob/nlPxcU8JJ5VsbeBZRn4FL
         lGtsu5nfs0jchLKKKiok0X3jxNLSZ2PMb0cwHZHQdKhIWVfLe1s0qtAksBRPEiqw0Qt/
         R9Qxtv2yBeBcpXUF6FWP8fq4RrCNye84Y6dyyey5Mi3XuXb08iREIJWGKBDX3mNHqk4J
         N5uiU/8mQq75YSZv+KPTSUdX5DHEPyF5kh3WIWmQbvFynXSOKbQ8zik6jIp/hYy4KCV3
         GMR7YW6CAjWIlXuYmVwAdyTxfKHjWRI2EVBliRY38oDldusaPIWCsQR/h6a9nPa/R1/D
         idQw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ypE4SOB55r4X02RWHx+QX5dxnPXowAwJhbD+XviBEU8JcLnL/k9zDk+FAZ/J3xHn3fVnsROsgJwm4rQt00O1Soco1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxMaukwwUPa40JgB6jxZx21b8cuNBkLioIlL2QhaRYk/OEBXho
	k1hpHQ4NdwTc5GG1EY7aPERSouU/xZGeL1ha3IKPInLXxelPGOwwpWNBEaBB9P3DmaZ0M5h8QHY
	MSF8=
X-Gm-Gg: ASbGncsJe2SQSWgLkr25pRKozysnSwvih1J3vq7GEb6y4iEyJH89kmBcuGIORb157dM
	R120oiQRAtB6g6FL5uwYEvNZlIhAz9bDPNOTHw/W6V7KGB62u7vN3kGaXFiQrkLATMLqcbtOSBf
	ZPtp8BOv6+6H6BEFyX/AIkimivD3sjauoKaXqcuyvM99izlBCLDkKkqWEPwaE60HGRhCNe+B4Og
	oTo7Ho4X2vA5/9+2+Z5LaLL86pn1M8q/uRik/p1SIKUQT//4hizNmuzFWxBXt3EagVL1IoIauwI
	BLd8trOU9rKRUCUWzzWrOJJ7pdnJu2YC08FitjTru1CCwzy4yPqN023jDB0AUKN725F0rqb3UKT
	zNlLWu76tsiUug4NPcNIx9iqcZ3ZCamQO339kjyhMwnz5/3vR2Trl4Go83BCvL6ZDmQ==
X-Google-Smtp-Source: AGHT+IE0DFUG3bUzjggIJ3TS0rJ8py5z4sf+9fN72nPYNLbndDs+gBIi/W895amG+itE+g6nPwlaiA==
X-Received: by 2002:a17:902:db09:b0:22f:c19c:810c with SMTP id d9443c01a7336-23e3b899af7mr48701365ad.51.1752870761430;
        Fri, 18 Jul 2025 13:32:41 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4b2bsm17666875ad.119.2025.07.18.13.32.39
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 13:32:40 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234f17910d8so23301995ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 13:32:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjplitSRD0PHktL/6cskfFC9CObnDK/44DX3EX3gn0fmYnMPxaeDiO0lbI0Ia9uFiYOGBe9ZqC76ibs/TXFhrFwaPmLA==@lists.linux.dev
X-Received: by 2002:a17:90b:2e06:b0:312:e49b:c972 with SMTP id
 98e67ed59e1d1-31cc256fb86mr7355028a91.15.1752870759183; Fri, 18 Jul 2025
 13:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-2-me@brighamcampbell.com> <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
 <DBFCOJFGI5HB.1RNJBDPNTEL2U@brighamcampbell.com>
In-Reply-To: <DBFCOJFGI5HB.1RNJBDPNTEL2U@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 13:32:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZUr=cwAQyPFWVDXg4pRavLWChpR4dOOyUywQN4GdE-w@mail.gmail.com>
X-Gm-Features: Ac12FXzSqdFPsH4TrONq3wFHu-HzqqxZ5pwzD4g92X8kRwKlib7OsOrk_7f6tnM
Message-ID: <CAD=FV=VZUr=cwAQyPFWVDXg4pRavLWChpR4dOOyUywQN4GdE-w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 18, 2025 at 10:17=E2=80=AFAM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> On Fri Jul 18, 2025 at 10:10 AM MDT, Doug Anderson wrote:
> >> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
> >> +       _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
> >> +
> >> +#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
> >> +       do {                                           \
> >> +               (_ctx)->dsi =3D (_dsi1);                 \
> >> +               _func((_ctx), ##__VA_ARGS__);          \
> >
> > nit: shouldn't func be in parenthesis for safety? It's unlikely to
> > really matter, but just in case it's somehow a calculated value that
> > would make it safe from an order-of-operations point of view.
>
> My assumption is that wrapping _func in parenthesis would cause a
> compilation error in the case of _func being a macro (more on that
> later...). I'll test that later today.

Huh, OK. If that's the case then no need to do it.


> >> +               (_ctx)->dsi =3D (_dsi2);                 \
> >> +               _func((_ctx), ##__VA_ARGS__);          \
> >> +       } while (0)
> >
> > Can you explain why you need the extra level of indirection here (in
> > other words, why do you need to define _mipi_dsi_dual() and then use
> > it in mipi_dsi_dual())? I don't see it buying anything, but maybe it's
> > performing some magic trick I'm not aware of?
>
> I mentioned this in v3 after the changelog and prompty forgot to include
> that information in v4: The extra indirection between mipi_dsi_dual()
> and _mipi_dsi_dual() is to allow for the expansion of _func in the case
> that _func is also a macro (as is the case with
> mipi_dsi_generic_write_seq_multi, i believe). Compilation fails after
> removing the indirection.
>
> There may very well be a better solution to this problem. I'd appreciate
> your thoughts.

Wow, crazy. I think the C preprocessor is one step away from magic.
While I know there are rules for it, I often find the way that it
behaves to be counter-intuitive. I can't say I've followed exactly how
your solution is working, but if it works and is needed then it's OK
w/ me. It might be worth promoting the note to be in the commit
message itself (or even a code comment?) so future people trying to
understand the code will have some chance of stumbling across it...

You might hate this, but one possible other solution would be to make
a custom `mipi_dsi_dual_dcs_write_seq_multi` (lifting it out of the
novatek driver) and then say that the "_func" parameter can't be a
macro. If you did it correctly, it would be a pretty big space savings
too. Unlike how we did it in the novatek driver, I think a proper way
to do it that would save the most space would be:

#define mipi_dsi_dual_dcs_write_seq_multi(ctx, dsi0, dsi1, cmd, seq...) \
  do { \
  static const u8 d[] =3D { cmd, seq }; \
  mipi_dsi_dual_dcs_write_buffer_multi(ctx, dsi0, dsi1, \
                             d, ARRAY_SIZE(d)); \
  } while (0)

...and then mipi_dsi_dual_dcs_write_buffer_multi() would be
implemented in drm_mipi_dsi.c.

With the above implementation, you only have one "static const" buffer
(maybe the compiler is smart enough to combine w/ the novatek code,
but  it might not be) and also only have a single function call taking
up space in the panel driver. You'd only have the "custom" dual
implementation for the "write_seq" stuff since that appears to be the
most common. All the other DSI calls could use the normal
mipi_dsi_dual() macro...

I was thinking of suggesting that as an optional followup to your
series anyway (for the space savings), but it could also solve some of
the preprocessor woes. :-P

I'm certainly not dead-set on this, so if you want to just keep
something like your current solution that's OK w/ me too.


> > Reading this with a fresh set of eyes, I also realize that this macro
> > is probably vulnerable to issues where arguments have side effects
> > since we have to repeat them. I don't think there's a way around this
> > and I think the macro is still worthwhile, but something to go into
> > with open eyes. Possibly worth noting in the macro description? We
> > could probably at least eliminate the need to reference "_ctx" more
> > than once by assigning it to a local variable. I think referencing
> > "_func" and "__VA_ARGS__" more than once is unavoidable...
>
> I'm using _func, _ctx, and __VA_ARGS__ more than once in this macro and
> I don't expect the indirection to fix the potential issue of unintended
> side effects. I believe we can use GNU extensions to eliminate side
> effects to _ctx,

I wasn't thinking of any GNU extensions. Just using a scope-defined
local variable...

#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
  do { \
    struct mipi_dsi_multi_context *__ctx =3D (_ctx); \
    __ctx->dsi =3D (_dsi1); \
    ...

> but especially since _func can be a macro, I don't
> think there's much to be done about it. Not sure about __VA_ARGS__.
>
> I fear my inexperience is made sorely manifest here.

I think it's a rare person who fully understands the dirty corners of
the C preprocessor and I wouldn't count myself as one of them. I can
sometimes make it do what I want, but I think we're up against my
limits too...

-Doug
