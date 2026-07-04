Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88C62046BA
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Jul 2026 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783180777; cv=none; b=dMBZOKiTMDsqLBxdmvrUMvAcU9W0j9Rz7B6ABvbwKgY7vj14IvLPQjFtR6Cr9zBvaRakshrSUDdCJnjFpQ6HLtw703LTZ+YELbD42XAl3ptH0azdnbNRj+rrRFOjUWasKMuf3j/a+qmvWoeNpPoRC9fHmb525VszlTb15TQKFqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783180777; c=relaxed/simple;
	bh=DgeCyG9V/F2uuR/5s1Kpam2KfbmeHLYlAfBPjUJLmw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBLAaxqflOQUFy3ePf8jrU+aEaxA9zE4ZFz0R1byxxm0/MGY+5N+PuW4mc30cvawkKP01sltbp62HXu9Tprbrkc0DdHrpVkyKE9qhiUubCUopnZVhOk+zo23PyMgq0HFRgaMITU8pE+i2MR4v5pT/+TkjJLmqsWVcW0R0NLy3pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bzwjs+WC; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bzwjs+WC"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-96723c7151eso536489241.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 04 Jul 2026 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783180774; x=1783785574; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1R3rt/4wDSz6ky8/jCAaXyakWl+HrmHiLRPTOSMmGs=;
        b=bzwjs+WCE8BuyscVPLvCHtmFmHvFytcepk4eXge/K06NyrwuPw33vcmmhVIQm68XBx
         y/QyUAqlR6ezRuvlx1ZAXJFaA4kbkdsDG6JSRiR6ixCjG+YR8++TU56ZZGkbWPjTfFpd
         olukQptDDfqas1JcDVfv5OiwFkNvR6mVJ8DmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783180774; x=1783785574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N1R3rt/4wDSz6ky8/jCAaXyakWl+HrmHiLRPTOSMmGs=;
        b=DsBBg6XhqWUKOzZy5OMugL+54jEHDVrlo2NgNquzppPMQj+9TgF3YunIfJFVv0Rvx8
         LhfLVAkC2sj4q6uZ6Z5cXncSudX2c/WVoPz7uXf01yc5B0PFkc65upmhJ5/DEvFgLEoX
         yiqH0Oyu/7PC8uc5caBO8M/bJoT23BpXnXp2KxDNs0+MJm85PRvxKdChNZvRr5jLRj1k
         5PMnftZ8KE/bQRs3WeOrb8YCEVtE4bXl9aQwwNS1jjrsHx5gPYi+Lvy7mH7Pu8d6Neuv
         dvq28vfVMLKiTmYeEsrReWnsFh1Z4k6whFX/KbmFUubu1YfRckkKODF8pylTm2uXAKjl
         klHA==
X-Forwarded-Encrypted: i=1; AHgh+Rrz4a4b/pYbd7bj1bgAFOgi6E64gaIuvDSWvbctaCdO9l1DpJxQCJeAtvSWkUbNM8Yqx2mfxOjWSzCft1ItYJ6EHw9xkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzS21JyhHAfK+JXcGArHusFFl9xe63XmfsXQQvDV6nX6nbeW+wE
	dNDFbFXyDB6E/0x5ZvD7WYN2rzvqvGz8nSbU27VLJlFVY5TzDXSrCKo6m1o7LSQgPCjtkU9TLhY
	VH+4=
X-Gm-Gg: AfdE7clX7vlLRe/gRqCzHdGud8xCqDLAETiscd+nJ2jZOh/EslIFromOOOvW9nTtRWv
	Zd/Fp9dSmBFIii2DgB4cYb15F9XMAjtWaI1UaRIAOTJiaCf/p53KUYmt16vPGRfM8zRt53Gstl3
	MDjBO6aGV3+ODGyhpJdXMjw4TXH8lQbpAiJ1qVrpeeA0le0HsmiDzqhsHS8GhrLHB7VAb1/3qk/
	vVVzpqakkrie7rS1d3eLikfTe/8DVjsjcgGOM6sfbliuKDkJQZGj69mxjFroH9bAyJxkNQwZBcB
	ZDC6gX+I9gE9Zn87r58dLGusPjfWcwWFTe/GOKxT8L9ZrXGn2YTD+qBsOqcoPZKejllcTECbGtG
	fz5hh7Fyy0bexiYnGe8lREK8D7/w6+AtJnakjeO3eOsfMMIOw5BVcSJmgiK4Pq4tIgGqK3oCKBH
	DBVb5sRbOg2OQoJBLEaZFzNrYJ11pWaP3LFknA8e4tuWTxbzwI4no=
X-Received: by 2002:a05:6102:1484:b0:73e:8694:c6de with SMTP id ada2fe7eead31-7427e2d7595mr1216527137.23.1783180774464;
        Sat, 04 Jul 2026 08:59:34 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96983898f81sm3421917241.2.2026.07.04.08.59.32
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 08:59:32 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-96723c7151eso536482241.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 04 Jul 2026 08:59:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpdIgxrSXxDeC8+0fQ8LSsRfO0oLZL4lLVa/TVVmw44QpI8caMCz/HScwxdsx6iq6JTJV7OeSEvmXh7tqY2ea4p39RGkA==@lists.linux.dev
X-Received: by 2002:a05:6102:f11:b0:737:e354:4092 with SMTP id
 ada2fe7eead31-7427c5b06bemr1234835137.11.1783180771360; Sat, 04 Jul 2026
 08:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701125624.199786-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260701125624.199786-1-nico.antinori.7@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 4 Jul 2026 08:59:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VKKb1Xy2Y7D1Lv8DXhaG1_zHZqTk2Q74oT-YKGd5CCiQ@mail.gmail.com>
X-Gm-Features: AVVi8CfBBMKu3dPyXgaGhFyCaXc25ycyy4xGhUFDgvYjFsxPnZhgmorMhD1_OrA
Message-ID: <CAD=FV=VKKb1Xy2Y7D1Lv8DXhaG1_zHZqTk2Q74oT-YKGd5CCiQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: novatek-nt37801: Use mipi_dsi_*_multi() functions
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 1, 2026 at 5:56=E2=80=AFAM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> Replace mipi_dsi_* functions with their non-deprecated mipi_dsi_*_multi
> counterparts. This change reduces error-checking boilerplate and improves
> readability.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> ---
> Note: I Compile-tested this patch since I don't own the panel to test it.
>
>  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/=
drm/panel/panel-novatek-nt37801.c
> index d6a37d7e0cc6..daa356bbc182 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> @@ -128,7 +128,8 @@ static int novatek_nt37801_off(struct novatek_nt37801=
 *ctx)
>  static int novatek_nt37801_prepare(struct drm_panel *panel)
>  {
>         struct novatek_nt37801 *ctx =3D to_novatek_nt37801(panel);
> -       struct device *dev =3D &ctx->dsi->dev;
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>         struct drm_dsc_picture_parameter_set pps;
>         int ret;
>
> @@ -145,15 +146,10 @@ static int novatek_nt37801_prepare(struct drm_panel=
 *panel)
>
>         drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
>
> -       ret =3D mipi_dsi_picture_parameter_set(ctx->dsi, &pps);
> -       if (ret < 0) {
> -               dev_err(panel->dev, "failed to transmit PPS: %d\n", ret);
> -               goto err;
> -       }
> -
> -       ret =3D mipi_dsi_compression_mode(ctx->dsi, true);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to enable compression mode: %d\n", r=
et);
> +       mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
> +       mipi_dsi_compression_mode_multi(&dsi_ctx, true);
> +       if (dsi_ctx.accum_err) {
> +               ret =3D dsi_ctx.accum_err;
>                 goto err;
>         }

Sure, this looks pretty good.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

For bonus points, I think you could change novatek_nt37801_on() to
return "void" and take a "struct mipi_dsi_multi_context". Since
drm_dsc_pps_payload_pack() is harmless, the function can now just be:

  novatek_nt37801_on(&dsi_ctx);
  drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
  mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
  mipi_dsi_compression_mode_multi(&dsi_ctx, true);
  if (dsi_ctx.accum_err) {
    ...
  }
