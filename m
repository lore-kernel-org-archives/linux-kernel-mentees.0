Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D607F265CD0
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 21:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529610; cv=none; b=IrLIVztQhNSCn5RalxKgzwX39S7vlB850JX3dEdvYyB7WC+3bFnxbOAa6G4h4+tSp68hb+9gWySwVkGaG3P8egQycfIGbfLcwfAl56IpqJtfoBvmM7p0FWlsU8kXy0VQ3vXYfJGOK8Tzs+JHVZ2HgoYCsg2w7ifmVkkNWr/0Qcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529610; c=relaxed/simple;
	bh=SsTayAz/zyih+6HafJMOO48aeh1nB7R+B7s9JLkxcNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keBPhbEi06KuRsR5MRPP1E11WRUh9PYWi6N5yMnmlBk9V47E4uKXOoJmEiLlDJlTWGHMyq3qt3Cg5wQ+VJakNxs0AxFL35x9tWVrsVMiiYkZWspQwTboofxR6bj7BUeGzqRqpzV+xSTDLr4Rn4vE08+oUD7UJ/rIoJN2zgwAx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YasTt0D7; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YasTt0D7"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so3838377a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 14:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752529603; x=1753134403; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf6x+HhC3zd0NIuTq8d9fQYj/uBrB2VbMZ8az8HSz24=;
        b=YasTt0D73rQ4VDgvz4LhegO6DgOrpYsKCCyU0HCOe3szNk5B7nUOi12/e+yJx0NpAJ
         iJ5oUtzRZDQdDai3bUzjBgPjvkbXyysloub9d8cFarzOP1QYmYkhUoc5kpP7t3qREoWW
         vkBJ95cCEnOaWsp0yMBaCgTyo9pV6cGtZ8ZZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752529603; x=1753134403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nf6x+HhC3zd0NIuTq8d9fQYj/uBrB2VbMZ8az8HSz24=;
        b=soJM0FLAueTnhEO+dBfCqk4RmyvvjozrCVr5+pF+3kfBuYGthuIrApUwRIJ6J3iyRR
         7xaNcMDBcpvhDNAwXCrnifuE+Go01Av9j3a+KLU8GYBfpPPrT/i88oZ3o3OwfEOlTiyR
         QE2RzBR1k5Kz5Of1zk7xEUs549flbwZmFL8ZGXFr1cjqKCO0cMn7R1dX82jnrnjPAnaL
         IX5C2URzZohdKgZq6jNZnise+f2pLqBXeGkw/OM/cg6JCkfwM6UlKLq/ndKgkrAACug9
         ij5Ex6AQ/z67OtxMxnJWnVPM+yssTGf0mH5ZHypsTLF8+pzEKecUiTU9IQTJ61rr0VCO
         4sig==
X-Forwarded-Encrypted: i=1; AJvYcCV2PWbfitgbhxB4jKCi2wYcQBcJzoLAf5x36c+MFUq2Uxwfqg/Td50+kmEoww5SCV8POgScNih0h9AA2l8cvWDJlGxHYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAKzu8zlXWRYtyxv7RMktSTo70dJjrw+sYA89Zdt3PUlSnCE82
	o5WV4tW1zaS2QE8hX8M7zmRe+05rSRkU3n+JyfEcZqGFf73jwd/gimfYCrjw1mMAaHH0jGjfsVo
	AleI=
X-Gm-Gg: ASbGncuuaW5vTkDclMyT8lC3GgFRyV/mnR1ZdSE9D1/63QfXMhcoDklTUsUa9xL2R11
	c72seR61c39iGxycyk8Oo3HDGIsVD8jUEEKh0fnmmb1An66UBM2P8XLOuvICnY9IrVg+kQVW1Zt
	LCtoSzfWXyqHnW3h2EWSF19OHmYzbJ4AceXt6ijOz5+bd5tMiLSnlnT6040UxWT3FNGKmY398Kn
	6vC3RK8C0l6OMKCBIqMkmjHYkAzQOvGGgS22MiAu4UScUWf047X9rE0l1xSsW1pG3ZDcHwi8a5j
	7SOykOqeCa3/3/4FhOv+qKV59DotB/Nyo5xB/QA0TEOolVtcGScW+KZWvDpeTiSr04mY9zU02rD
	zwiw/l+6JpA5CqoJpQKFh18RKwLWMBTbRbcEty/UiDikdZu48r3A56dru+4O+8Q==
X-Google-Smtp-Source: AGHT+IE6DwzaQ711R478OWRq+zTbOBsHU9/l4iRDVhzElzCp2Byz+XvEMnZrs9rcWLYwY6XagpIXPg==
X-Received: by 2002:a17:90a:e18e:b0:312:1ae9:1529 with SMTP id 98e67ed59e1d1-31c4cd8b792mr24606525a91.27.1752529602769;
        Mon, 14 Jul 2025 14:46:42 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3017cc3bsm14280640a91.24.2025.07.14.14.46.41
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 14:46:41 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so3838330a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 14 Jul 2025 14:46:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZqoOV/73/J1d2u2RhsgoZ9hTcZKOtyxGAuKs0w6DofTAZfc6MbCj0oDZwqAUQdSvwKa6sL9cn2W7ieAuo9ZvPoXnAsg==@lists.linux.dev
X-Received: by 2002:a17:90b:5844:b0:311:a314:c2dc with SMTP id
 98e67ed59e1d1-31c4ccceb76mr25097897a91.14.1752529600346; Mon, 14 Jul 2025
 14:46:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250708073901.90027-1-me@brighamcampbell.com> <20250708073901.90027-2-me@brighamcampbell.com>
In-Reply-To: <20250708073901.90027-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 14:46:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>
X-Gm-Features: Ac12FXwEXFjZNLsblVCVjjFbPn_m7MCfT9M3S1y3Xdmbs1FX9LqidIJ3hvlhjnw
Message-ID: <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: jdi-lpm102a188a: Update deprecated MIPI
 function calls
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Update jdi-lpm102a188a panel driver to use the "multi" variant of MIPI
> functions in order to facilitate improved error handling and remove the
> panel's dependency on deprecated MIPI functions.
>
> This patch's usage of the mipi_dsi_multi_context struct is not
> idiomatic. Rightfully, the struct wasn't designed to cater to the needs
> of panels with multiple MIPI DSI interfaces. This panel is an oddity
> which requires swapping the dsi pointer between MIPI function calls in
> order to preserve the exact behavior implemented using the non-multi
> variant of the macro.

Right. We dealt with this before with "novatek-nt36523"...


> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 160 +++++++-----------
>  1 file changed, 59 insertions(+), 101 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/=
drm/panel/panel-jdi-lpm102a188a.c
> index 5b5082efb282..5001bea1798f 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> @@ -81,25 +81,20 @@ static int jdi_panel_disable(struct drm_panel *panel)
>  static int jdi_panel_unprepare(struct drm_panel *panel)
>  {
>         struct jdi_panel *jdi =3D to_panel_jdi(panel);
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx;
>
> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link1);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to set display off: %d\n", re=
t);
> -
> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link2);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to set display off: %d\n", re=
t);
> +       dsi_ctx.dsi =3D jdi->link1;
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       dsi_ctx.dsi =3D jdi->link2;
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>
>         /* Specified by JDI @ 50ms, subject to change */
>         msleep(50);

Needs to be mipi_dsi_msleep() to avoid the sleep in case the above
commands caused an error.


> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n", r=
et);
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n", r=
et);
> +       dsi_ctx.dsi =3D jdi->link1;
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       dsi_ctx.dsi =3D jdi->link2;
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);

I think you need this here:

if (dsi_ctx.accum_err)
  return dsi_ctx.accum_err;

...otherwise the code will do the sleeps, GPIO calls, and regulator
calls even in the case of an error. You don't want that. Then at the
end of the function you'd just have "return 0;"


>  static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
>                                        struct mipi_dsi_device *right,
>                                        const struct drm_display_mode *mod=
e)
>  {
> -       int err;
> +       struct mipi_dsi_multi_context dsi_ctx;

I think you should actually pass in the "dsi_ctx" to this function
since the caller already has one. Then you can change it to a "void"
function...


>  static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
>  {

I think you want to pass the context into this function too and make
it "void". Then the caller doesn't need to check for the error before
calling it...

Then the "msleep(150)" after calling this function can change to a
`mipi_dsi_msleep()` and you don't need to check the error until right
before the LPM flag is cleared...


> +       struct mipi_dsi_multi_context dsi_ctx;
> +
>         /* Clear the manufacturer command access protection */
> -       mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
> +       dsi_ctx.dsi =3D jdi->link1;
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>                                    MCS_CMD_ACS_PROT_OFF);
> -       mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
> +       dsi_ctx.dsi =3D jdi->link2;
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>                                    MCS_CMD_ACS_PROT_OFF);

All the duplication is annoying. In "novatek-nt36523" I guess we only
needed to send _some_ of the commands to both panels and so we ended
up with a macro in just that C file just for
mipi_dsi_dual_dcs_write_seq_multi(). ...but here you seem to be
needing it for lots of functions.

Maybe the solution is to add something like this to "drm_mipi_dsi.h":

#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, _args...) \
  do { \
    (_ctx)->dsi =3D (_dsi1); \
    (_func)((_ctx), _args); \
    (_ctx)->dsi =3D (_dsi2); \
    (_func)((_ctx), _args); \
  } while (0)

Then you could have statements like:

mipi_dsi_dual(mipi_dsi_generic_write_seq_multi, jdi->link1,
jdi->link2, &dsi_ctx, ...);

I _think_ that will work? I at least prototyped it up with some simple
test code and it seemed to work... What do others think of that?

-Doug
