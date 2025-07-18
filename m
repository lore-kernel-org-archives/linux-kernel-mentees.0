Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9642E6118
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855039; cv=none; b=kI2P0XnOIgCvicCcOn6Wp+BCTO4jgzkpzsOhd8mDypRbUcQl8GhTZ+gJMRaniv7uyQYoKHPWRt3AVgnl80Ta1V6bVLl56TMvtOJaNonxBUwyyO5MYbVdwaaq47C/vqg9Jb9PpE5vW8zp7jXbtFVnAa3UpxDqEZss6VD+TXSQQko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855039; c=relaxed/simple;
	bh=kGsCAEDUAs7PcvVTlXcxhCu1WLo8mCBe+P9DDCN74Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+jqZJYY24ONlbKHffUu8poSQsMsrsNzukRO5WDFwEPPERaCtoZ0/TBVr7UQhzYrgWfPb5hYT1meNUo5KXHBoNV80O9cci597NUKu/Jrin0pFtSiVKjLMaifZjjlrrt+NxyUJy1grCXpgRT7Qj/9EiE6ryXxdyvxW75SQtJA9xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nht1g0Yq; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nht1g0Yq"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso2291199a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752855036; x=1753459836; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjMu1e4Z2kPIqjvwczTBgX85r3dXx3nHkHeoGheSPn8=;
        b=Nht1g0Yq00poCaFu8vZVe4np+98G6bqzOiFB+sqOzFIIYmocqqFnZ69ByE1FlLlaS2
         NiZdA/yQGrzCKydMPXzeTCRdOx7yvUKof/bcSAWrBgojMr0j+Upv2s/Gawvtt/XDi+Ys
         gKfxhZZE8AcOvJmdhzh3NJY6pLGBlt6oBImms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855036; x=1753459836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjMu1e4Z2kPIqjvwczTBgX85r3dXx3nHkHeoGheSPn8=;
        b=LMii6JyKykf3Bw8LtPlDm7Y+yDMZxy0AQcmWHjAW9kr5vwjmtbW8Gze9fd8KiXPV1P
         uZpTmef6DdTRosjk6qULj6slV7Pv+zWM9BYE/8JasiqfHDAH8nx9SLyDBMw1mX8LuyPf
         9AkdzgAPPJ+hOJWTd9M1bkVDbAwf9kRSfNPVCNGOQzPPtEceOQtXOVyh/mzh6jpmcYID
         3ruz1a+wiFTwOfXd/9nedWBPjOYoMPp/TgrZS635qUE9bMyfYb8a//pauTdgsI+LfNx4
         MsSlnalgOreDvAc0fx82TNnM/fFmPsyzs9MN60lBDGp4EHTj5pSE/0tq+QpgiCJi6egJ
         HEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRjQBSfVNr8BGWbNfuyYv2DnS2UMAAIFr54Kej1Aw+aqCAyb/9XqdliAmPA1JtAaaWpSaGAatCenvHrVozOvqHJtAWng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz77je2zxbEadBSmWlqML5zXYkJBdcEcS++pTP6tuIw1hPiDBrg
	vT0Exlg6pUAsUx45+c662sfhvs1WCAWVNenf+6QcKa18OBWTsSQuNNQhDq7MZoX9Q9Mp1kE4Kmy
	Wu3w=
X-Gm-Gg: ASbGnct0MTtDeynLu0cm0Doe1JnxeJCohfSNFBSns6+H11rH2GgiL2NXX+0Kg3TvoX+
	RJk7oURd6H2b3DiUB450KqWVNzrNKDnQH1HrKU2fXNLeKdKjenczS9yOfcmTfMHGMmgHA/ZzL8S
	Ui2OkUPcwxleHbpHl9SOixD8ufTAJFxJjjkW7lHb6xEYzoSmclPPWZe9M1WV+gHWePB81FbIPJ4
	Ok9qtWyZTbbdSWQQ6/6hkVkAhG0xmhzlM6spCejA6Sq5XawNooeJmUBqZD6tuquEuyHOUlWxkhi
	q1p6/9zoFKm+Kp5sokcUj7+vNgtScvLwuI4NMA8Lc3j3F+TiO5aX9X6SwDiVzXtGZtaKzvbin2A
	TFOyq2hwadvvRrntsBRLcld25auMZAd8ULS4zkCULYjmiuTtxoM3jPEfYogV8sp7rng==
X-Google-Smtp-Source: AGHT+IFgHCNgQQbq6gMYwYODoZpjvTvu/arnfagZtk2M8Oq4KAq1Ok8iggzmZ5iOkvpYT3f3+fPzwQ==
X-Received: by 2002:a17:902:d4d2:b0:235:15f5:cc30 with SMTP id d9443c01a7336-23e256cd096mr147037445ad.16.1752855035793;
        Fri, 18 Jul 2025 09:10:35 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4c76sm15338525ad.116.2025.07.18.09.10.33
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:10:34 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b3220c39cffso2203965a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 09:10:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOzXplgGLHTqTR9XSvwtdESWr+3eqxUpxwbIkvEot9aSYwonAfNU1zrps7zKR/JSthYUMvDCX3rzmtreaRkiMvtN+LBA==@lists.linux.dev
X-Received: by 2002:a17:90b:2b4c:b0:311:eb85:96ea with SMTP id
 98e67ed59e1d1-31c9f3c5719mr16511405a91.9.1752855033213; Fri, 18 Jul 2025
 09:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com> <20250717164053.284969-2-me@brighamcampbell.com>
In-Reply-To: <20250717164053.284969-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 09:10:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
X-Gm-Features: Ac12FXz_prqGT_YDn81ubqDHwEClWFafCp94o67Bin1GS3o7VQCq9ZD3Qej-Cnw
Message-ID: <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
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

On Thu, Jul 17, 2025 at 9:41=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Create mipi_dsi_dual macro for panels which are driven by two parallel
> serial interfaces. This allows for the reduction of code duplication in
> drivers for these panels.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  include/drm/drm_mipi_dsi.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 369b0d8830c3..03199c966ea5 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -431,6 +431,30 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi=
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
> + * @_func: MIPI DSI function or macro to pass context and arguments into
> + * @_dsi1: First DSI interface to act as recipient of the MIPI DSI comma=
nd
> + * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI comm=
and
> + * @_ctx: Context for multiple DSI transactions
> + * @...: Arguments to pass to MIPI DSI function or macro
> + */
> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
> +       _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
> +
> +#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
> +       do {                                           \
> +               (_ctx)->dsi =3D (_dsi1);                 \
> +               _func((_ctx), ##__VA_ARGS__);          \

nit: shouldn't func be in parenthesis for safety? It's unlikely to
really matter, but just in case it's somehow a calculated value that
would make it safe from an order-of-operations point of view.


> +               (_ctx)->dsi =3D (_dsi2);                 \
> +               _func((_ctx), ##__VA_ARGS__);          \
> +       } while (0)

Can you explain why you need the extra level of indirection here (in
other words, why do you need to define _mipi_dsi_dual() and then use
it in mipi_dsi_dual())? I don't see it buying anything, but maybe it's
performing some magic trick I'm not aware of?

Reading this with a fresh set of eyes, I also realize that this macro
is probably vulnerable to issues where arguments have side effects
since we have to repeat them. I don't think there's a way around this
and I think the macro is still worthwhile, but something to go into
with open eyes. Possibly worth noting in the macro description? We
could probably at least eliminate the need to reference "_ctx" more
than once by assigning it to a local variable. I think referencing
"_func" and "__VA_ARGS__" more than once is unavoidable...

Maybe this is what you were trying to solve with the extra level of
indirection, but (at least with my knowledge of the C preprocessor), I
don't think it does.


-Doug
