Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA6221E097
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201373; cv=none; b=Ibq8kP9Q263L9repgiLsZG/mmnwhK/egyj6UNdUWY/0rO266hSz71Eae4v5XFT14ts+Ff2i7OlQeala8SpYID4Fh4n5L0/mCsUQv7RPnT9MzyFZErbLX7Eas/VpuWg/jRb1ns+jV5AR1VfJ31CqDYO0GTJFSUF3gc9xWmI4hvXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201373; c=relaxed/simple;
	bh=0I/bNUuFobxytL160W+kJ+iaUFZ+hUI/bFGemXe6FPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8AAY2aijEeNGoN0R7TOP0QdxCoIeqmD1L8RWQJ1rzvYZC7BVN6JAtac/p8aDYGQc/+/uBHNojZ4wLS4C28jliMn3BNgqplnbhpJWxDdBhulBtc8E+umf2ZH3aoCoik9jV7erM33J4F84Ajh7Rwunp59SrIId5LPVaQTJ1cpras=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bisifTeR; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bisifTeR"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-75b5be236deso2394080b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753201369; x=1753806169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEXUdZr0ohXXfzmWQ2dHHBxRJSqO63DOp1ZvGK6vo/c=;
        b=bisifTeRANXPsy3AGqMr44krIubtIAy2AeCOCPfcZzhodul2brOjbt38CFkn1ivu+B
         dNLSiQ5DD3xonaBs9oLuPBL4MNEv5NFRhDsMwjClcQm4Oqju0XhJooiUtb13AkmHTAx2
         bktLlLvaR9AaHZXtRCSApXgA8icAUDrwwID5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201369; x=1753806169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEXUdZr0ohXXfzmWQ2dHHBxRJSqO63DOp1ZvGK6vo/c=;
        b=J/Cuw0+So8pd5dQcCkvU0pI5/O+AFpPu2nb8HrZQwj5H7Tj5Nt8nH4qbxmNgNfEHA0
         mPn9kcImFMjwDb0Pk/XHDPvc/M900wQhvWSWgX3TB6cQAipSq6Z4cP10Na2P7ZXJswyR
         2XTJ9rKm9oxrwD0DMBGC56n/1L5mEt0M1BNRmNkFSi77oBv2hBxngpR81NCNY4QPRpFu
         VG+RSYOXWOW0Gy7WKaZTsQmwR4aXhkGnVArHTrYhUVxzu2ZeqkDxtsxEpJkpsD7D+DSR
         Soj8FO7itM1XrieOFvaTTqVp04MuhuZauj6ycA/izbncfABAYhHlilLW7w70GbuXWMh2
         a3lg==
X-Forwarded-Encrypted: i=1; AJvYcCVM6bXPRBoEHXaVhlY+dzjI5ojFxQH4h0etdGxCKFc7E5FXhrQ2z+/B1gVpSoJYA3yHERAjY587gU+u9Etuez5a3O1Nlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcaJYyjAZhQyaSVjVc0ftHxAX6OrXQwBQQNZggZaXf8JLzmim/
	hhK0uPl4Vor6TU3xeV8QVMMUWLPsmMenotZ8Op21FbkGMQlaxsXK+tVZ2vvYjJLmSB/PedzPgpZ
	v66I=
X-Gm-Gg: ASbGnct56NE9vj+fDGjf5HFgkp0njec2ag0o2RGXOMnF+QJuXtxS12QnVcDqVUd7B57
	D9mJgUFbruMFaH2J+5TpBc2JVd78/ISVihzmeHq2I/NaEAT0g3UH6Jr2a8nAn6PljiikTMXMYzK
	ikfAIpC/rNqejxUCJZsFRA899iyJwxfekSBSIujFX4OUozSya23aUzviWgKvxdkeBhAY40dNihL
	TczoY3QihyHwLMOCKJ877PcpbLfpmXnxKWWIsjOfuFN3ZwE2qyAqBZ/GeVzv/3cHtrejrEbPgIX
	pITODMk5Nf6jNQFpyGVHsOiIPqXLmwY0fmyPNMuoMnmJne05rlGxoHkZImeZEfTXVj0/+nZ1exM
	6QXdEjNS7docYrV8EYDcqv56yLtb1lNHlZrXskCIf+MyX7E+YGowu0Ar6Xn0WkA==
X-Google-Smtp-Source: AGHT+IGU1IUlu/pb12jN3AV0QAac8PtHPn5nzj/OP4VUGh4TKk9e3litEjhGVK1pKuAwfa2C6b5J2g==
X-Received: by 2002:a05:6a00:88c:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-75724d80b01mr35181598b3a.21.1753201368650;
        Tue, 22 Jul 2025 09:22:48 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8dd22sm7293874a12.30.2025.07.22.09.22.45
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 09:22:45 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3134c67a173so5793852a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 09:22:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjC375XXiEtOuY+B2DU899KAnF03u6+Baat/wFCJizU6LVV6nk1pP1AEyPckC7wGUSgD1VO3KasOVszYBpWLMwAau8SA==@lists.linux.dev
X-Received: by 2002:a17:90b:4f49:b0:311:c970:c9c0 with SMTP id
 98e67ed59e1d1-31c9f45e26cmr31413464a91.22.1753201365336; Tue, 22 Jul 2025
 09:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250719082639.307545-1-me@brighamcampbell.com>
 <20250719082639.307545-2-me@brighamcampbell.com> <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
 <DBI61MARVMJA.1DDSNK4TZE5TG@brighamcampbell.com>
In-Reply-To: <DBI61MARVMJA.1DDSNK4TZE5TG@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 09:22:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7rAhChkJgOXW09z6O0ad2n478oRXpeT5p9EzYTAr3mA@mail.gmail.com>
X-Gm-Features: Ac12FXwxEcBNTtJQox66nAzXomf74eWKkhHW-9gxqeg5dTLC3EZLkMZuuh1RwxM
Message-ID: <CAD=FV=U7rAhChkJgOXW09z6O0ad2n478oRXpeT5p9EzYTAr3mA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
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

On Mon, Jul 21, 2025 at 5:43=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> On Mon Jul 21, 2025 at 10:30 AM MDT, Doug Anderson wrote:
> >> +void mpi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
> >
> > BUG: above should be "mipi", not "mpi"
> >
> >> +                                     struct mipi_dsi_device *dsi2,
> >> +                                     struct mipi_dsi_multi_context *c=
tx,
> >> +                                     const void *payload, size_t size=
)
> >> +{
> >> +       ctx->dsi =3D dsi1;
> >> +       mipi_dsi_generic_write_multi(ctx, data, len);
> >
> > BUG: "data" and "len" are not valid local variables...
> >
> >> + * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
> >
> > It could be worth also pointing people to
> > mipi_dsi_dual_generic_write_seq_multi() and
> > mipi_dsi_dual_dcs_write_seq_multi() below?
> >
> >> + * @_func: MIPI DSI function or macro to pass context and arguments i=
nto
> >
> > nit: remove "or macro".
> >
> >> +               struct mipi_dsi_multi_context *_ctxcpy =3D (_ctx); \
> >> +               (_ctxcpy)->dsi =3D (_dsi1);                        \
> >
> > nit: now that "_ctxcpy" is a local variable you no longer need the
> > extra parenthesis around it.
> >
> >> +               mipi_dsi_dual_generic_write_multi(_dsi1, _dsi2, _ctx, =
d,        \
> >> +                                                        ARRAY_SIZE(d)=
);        \
> >
> > nit: the indentation of ARRAY_SIZE() is slightly off.
> >
> >> +#define mipi_dsi_dual_dcs_write_seq_multi(_dsi1, _dsi2, _ctx, _cmd, _=
seq)   \
> >
> > BUG: doesn't "_seq" need to be "_seq..." ?
> >
> > BUG: You need to remove the definition of this macro from
> > `panel-novatek-nt36523.c` or else it won't compile anymore since the
> > name of your macro is the exact same as theirs and they include this
> > header file. It would be OK w/ me if you squashed that into the same
> > patch since otherwise rejiggering things would just be churn...
>
> Sorry to have sent out such a poor quality patch, Doug! I always compile
> changed files and test my changes when I can, but I think I must have
> compiled just the lpm102a188a panel C source file itself by mistake when
> I sent out this series revision. From now on, I'll simply enable the
> relevant kernel config options and rebuild the entire kernel.
>
> I'll address each of these items in v6.

Don't worry too much about it. While it's good to make sure you test
your patches, everyone makes mistakes! :-)


> > I guess we also chose different argument orders than they did (that's
> > probably my fault, sorry!). They had the "ctx" still first and this
> > patch consistently has "dsi1" and "dsi2" first. I don't think it
> > really matters, but we should be consistent which means either
> > adjusting your patch or theirs. It's probably worth confirming that
> > the novatek driver at least compiles before you submit v6.
>
> No, this was my fault. You had suggested the correct order. When I
> implemented the change, I preferred to put `ctx` after `dsi1` and `dsi2`
> because that's what I had done when I implemented the mipi_dsi_dual
> macro. I'll swap up the order, remove the function definition from the
> novatek driver, and compile both lpm102a188a and the novatek driver
> before sending out v6.
>
> By the way, we can discuss this further when I've sent out v6, but the
> novatek driver appears to pass a mipi_dsi_context struct into the
> write_seq_multi macro directly instead of a mipi_dsi_context struct
> pointer. We opted to use a pointer in this patch series so that it can
> be passed to a function in order to reduce the compiled size of drivers.
> For now, I'll plan to solve this by changing calls to write_seq_multi in
> the novatek driver to pass a pointer. I hope that the churn that this
> will cause in the novatek driver isn't unacceptable.

Looks fine. It probably should have been a pointer in the novatek
driver to begin with, but when it was a macro it didn't really matter.

-Doug
