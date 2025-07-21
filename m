Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E442E06D2
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115452; cv=none; b=afdaVoVwWFuh9Jt4LL9fQwcxIDBHN8NQVRmay8Nn07XORPNaeQb9u0C4lUvcFs/HTn58QvVijRG16ReiKTna3bTXug70vn1dIFh9Jtm8OeTL1Nj8pDkK3KWDe7fpN2cWcKm/xu/33Il4Ol6hPJmJfj32MKAXoZJYcm6UPvC5S2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115452; c=relaxed/simple;
	bh=LcK4LIDhkpmNmzFtUfX5BsXG1e79f98fn51x8mcpMnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0vGfTbvdvg/AiXG8Xx5b1tBXUKCzcaiXfMhLcOezPUtFWP8pDalsxHQWtkTnzEDjHJZtc2zuQixlG+qcZpF57lII3ydjB5vqJCr3ZuEnkZCbYe3S1lNwBV4kTFV896cr4zk643SxoIrzfWDtRoE7daEBiy3mjRNpycIrdyH7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hnb4cCYP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hnb4cCYP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7494999de5cso3071761b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753115446; x=1753720246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1OthpiQLo0yn+Ex+1T1Nl8yMpcQVCC1Su5Bulvu4QQ=;
        b=Hnb4cCYPAKn8WV6Qs8PJHmW211fRxkzP6MVscOrj/p4rrUXEw3jux4rGVm1uSOe4X+
         HNqSaekBaUgCd5TwfcfkZ8uqTtGr118wpM9OsTQ4GM6QR/QGiIqkdqbOxGHT/S6KCWB5
         EKIkRQfqwQzjhNvx6NJKW+UaaWdcLIPjp0q/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753115446; x=1753720246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1OthpiQLo0yn+Ex+1T1Nl8yMpcQVCC1Su5Bulvu4QQ=;
        b=jCLZssWoVtCH43kx628g3VGGeiFOBewN54AbHs15J0PBncO/QUpSdtpRYPkCDWWyvO
         JOA6heRk/dxij1CedkNVDdJFllDjBGmRxwVW8G8zMVHAgDnGPOGUEB7lM/iN2b+B4lRK
         Upz8Mryzxq8qEkYucj/bm7ixWYpUHrwclZ+XiHAWyGM0+oy1HPSf9xYdK596YFBKp/Fx
         Njxv6ihMn9ubn2LgBfJaTWYMbUBL25qtDoaylBm4X+n5jO7qIkcALnTWUqOp/A566kgy
         oa32qYbqsfRAdFzEc4GWhOqPmr5KmMqMKKOWYA8Wk9tNTYwA9Ax2n+KWqx8yPW2DygKp
         A/CA==
X-Forwarded-Encrypted: i=1; AJvYcCWkTpCu4+7dMHySWqqzYhIUUka4y2aR7agLf9lVGhkzSztC6HhNDvb5iqBBMp5HJVUOEkT9axF+CoYZLW1t0kmnff156g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx5vvAtuxrOmUpIbhELdLv4TpiMOw8Czwlff3ZbBH2bJSxOzf6
	kB1teLaWVEno33h9iW0QvgrZ1nlkDUMRQANFagwh1jUyDqdtoGpZtSA977DgvYtWpvw4qD4WEZN
	UX3s=
X-Gm-Gg: ASbGncsDEDxccwo1lnkPBKYkQLtkQNzQIyijlJHrz7S87RJkE0OXkrEgwXaiZ65kWL5
	6mQK/A51x0F98Qa39ZJlUKcoI7OPhPqLGe+75XLNE66dYnyUs/OREThRyjO72TihsaswKgivY60
	Jmkd6RTaORtf5isVrEe+K7f2igCWwEUC0nrk02FJXohgDV8loYX2cm6vk0T/jE7wPN0oy/ydqPQ
	SoU5mqFOKv4E/VoSlzLSRLZ8d7urRFFkwC9HpsuDoeFWVvcDRtS5AbYWjhgNfmbgg9PdTKir8PS
	6en39jdlUC5f0UpTPF3EdIBe0R1EdQnSBpAD0CVWIIS4PNoGVq0v2rhy2B08+GThY2x32bxgx4c
	jVuiXm3TetUYnX9ygkgxKfTUt48yTlmqcWf57pO4fUxOqAeNx80HlebsLpBigAWbKXA==
X-Google-Smtp-Source: AGHT+IEW7lFjjMN8I9LluIpVIjNtIKTmuQd9VL+N6R57kFgpWXLcwLJANMmfwexzYASXvFERTIBqFQ==
X-Received: by 2002:a05:6a00:9298:b0:73e:2dc5:a93c with SMTP id d2e1a72fcca58-756ea1ddca4mr32935319b3a.11.1753115445951;
        Mon, 21 Jul 2025 09:30:45 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-75e17d2526esm1316343b3a.81.2025.07.21.09.30.44
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 09:30:44 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23694cec0feso42147825ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 09:30:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdXw7h16xi1Wpv6tMO4l9aUBLv9y0s4TgpJI5xG41+ZOQAuldJamBfxx3m33XTkxVkQm8YoAz9gE/VjLQwKfszhV9I7w==@lists.linux.dev
X-Received: by 2002:a17:903:3bcc:b0:235:f298:cbbe with SMTP id
 d9443c01a7336-23e24edc278mr357296245ad.12.1753115443448; Mon, 21 Jul 2025
 09:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250719082639.307545-1-me@brighamcampbell.com> <20250719082639.307545-2-me@brighamcampbell.com>
In-Reply-To: <20250719082639.307545-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Jul 2025 09:30:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
X-Gm-Features: Ac12FXy9MlSRxUz0cgfvqURcfFQN33HCDR1ifsxTc8_3lTfiq4MM633TTSdKa88
Message-ID: <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
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

On Sat, Jul 19, 2025 at 1:27=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> @@ -827,6 +827,30 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_mu=
lti_context *ctx,
>  }
>  EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
>
> +/**
> + * mipi_dsi_dual_generic_write_multi() - mipi_dsi_generic_write_multi() =
for
> + * two dsi channels, one after the other
> + * @dsi1: First dsi channel to write buffer to
> + * @dsi2: Second dsi channel to write buffer to
> + * @ctx: Context for multiple DSI transactions
> + * @payload: Buffer containing the payload
> + * @size: Size of payload buffer
> + *
> + * A wrapper around mipi_dsi_generic_write_multi() that allows the user =
to
> + * conveniently write to two dsi channels, one after the other.
> + */
> +void mpi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,

BUG: above should be "mipi", not "mpi"


> +                                     struct mipi_dsi_device *dsi2,
> +                                     struct mipi_dsi_multi_context *ctx,
> +                                     const void *payload, size_t size)
> +{
> +       ctx->dsi =3D dsi1;
> +       mipi_dsi_generic_write_multi(ctx, data, len);

BUG: "data" and "len" are not valid local variables...


> @@ -431,6 +439,87 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi=
_multi_context *ctx);
>                 mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
>         } while (0)
>
> +/**
> + * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
> + *
> + * This macro will send the specified MIPI DSI command twice, once per e=
ach of
> + * the two interfaces supplied. This is useful for reducing duplication =
of code
> + * in panel drivers which use two parallel serial interfaces.
> + *
> + * WARNING: This macro reuses the _func argument and the optional traili=
ng
> + * arguments twice each, which may cause unintended side effects. For ex=
ample,
> + * adding the postfix increment ++ operator to one of the arguments to b=
e
> + * passed to _func will cause the variable to be incremented twice inste=
ad of
> + * once and the variable will be its original value + 1 when sent to _ds=
i2.

It could be worth also pointing people to
mipi_dsi_dual_generic_write_seq_multi() and
mipi_dsi_dual_dcs_write_seq_multi() below?


> + *
> + * @_func: MIPI DSI function or macro to pass context and arguments into

nit: remove "or macro".


> + * @_dsi1: First DSI interface to act as recipient of the MIPI DSI comma=
nd
> + * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI comm=
and
> + * @_ctx: Context for multiple DSI transactions
> + * @...: Arguments to pass to MIPI DSI function or macro
> + */
> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
> +       do {                                                     \
> +               struct mipi_dsi_multi_context *_ctxcpy =3D (_ctx); \
> +               (_ctxcpy)->dsi =3D (_dsi1);                        \

nit: now that "_ctxcpy" is a local variable you no longer need the
extra parenthesis around it.


> +               (_func)((_ctxcpy), ##__VA_ARGS__);               \
> +               (_ctxcpy)->dsi =3D (_dsi2);                        \
> +               (_func)((_ctxcpy), ##__VA_ARGS__);               \
> +       } while (0)
> +
> +/**
> + * mipi_dsi_dual_generic_write_seq_multi - transmit data using a generic=
 write
> + * packet to two dsi interfaces, one after the other
> + *
> + * This macro will send the specified generic packet twice, once per eac=
h of
> + * the two interfaces supplied. This is useful for reducing duplication =
of code
> + * in panel drivers which use two parallel serial interfaces.
> + *
> + * Note that if an error occurs while transmitting the packet to the fir=
st DSI
> + * interface, the packet will not be sent to the second DSI interface.
> + *
> + * This macro will print errors for you and error handling is optimized =
for
> + * callers that call this multiple times in a row.
> + *
> + * @_dsi1: First DSI interface to act as recipient of packet
> + * @_dsi2: Second DSI interface to act as recipient of packet
> + * @_ctx: Context for multiple DSI transactions
> + * @_seq: buffer containing the payload
> + */
> +#define mipi_dsi_dual_generic_write_seq_multi(_dsi1, _dsi2, _ctx, _seq..=
.)     \
> +       do {                                                             =
       \
> +               static const u8 d[] =3D { _seq };                        =
         \
> +               mipi_dsi_dual_generic_write_multi(_dsi1, _dsi2, _ctx, d, =
       \
> +                                                        ARRAY_SIZE(d)); =
       \

nit: the indentation of ARRAY_SIZE() is slightly off.


> +       } while (0)
> +
> +/**
> + * mipi_dsi_dual_dcs_write_seq_multi - transmit a DCS command with paylo=
ad to
> + * two dsi interfaces, one after the other
> + *
> + * This macro will send the specified DCS command with payload twice, on=
ce per
> + * each of the two interfaces supplied. This is useful for reducing dupl=
ication
> + * of code in panel drivers which use two parallel serial interfaces.
> + *
> + * Note that if an error occurs while transmitting the payload to the fi=
rst DSI
> + * interface, the payload will not be sent to the second DSI interface.
> + *
> + * This macro will print errors for you and error handling is optimized =
for
> + * callers that call this multiple times in a row.
> + *
> + * @_dsi1: First DSI interface to act as recipient of packet
> + * @_dsi2: Second DSI interface to act as recipient of packet
> + * @_ctx: Context for multiple DSI transactions
> + * @_cmd: Command
> + * @_seq: buffer containing the payload
> + */
> +#define mipi_dsi_dual_dcs_write_seq_multi(_dsi1, _dsi2, _ctx, _cmd, _seq=
)   \

BUG: doesn't "_seq" need to be "_seq..." ?

BUG: You need to remove the definition of this macro from
`panel-novatek-nt36523.c` or else it won't compile anymore since the
name of your macro is the exact same as theirs and they include this
header file. It would be OK w/ me if you squashed that into the same
patch since otherwise rejiggering things would just be churn...

I guess we also chose different argument orders than they did (that's
probably my fault, sorry!). They had the "ctx" still first and this
patch consistently has "dsi1" and "dsi2" first. I don't think it
really matters, but we should be consistent which means either
adjusting your patch or theirs. It's probably worth confirming that
the novatek driver at least compiles before you submit v6.


-Doug
