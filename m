Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6BD1F4CB6
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 21:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753478257; cv=none; b=mJNSEXGkk7WHs+39PaGN84qSvYH/8BwgZkJ8B1ZsvIxlBW7s7vytE/vuuvKZL4YlTuq95oGjVKyQQiJhcgFS0+IjHZ5lMprckHL5LHbZ3p/wB/65gwVqfB7qtHdKt10iEpPb0OsEqUZRvSeYAKrxWNz1cgCiEFtQkpAQFFA/jws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753478257; c=relaxed/simple;
	bh=uXxw+R+ilKGWicH2CC2/+5/2TTT9NhJPrj/PQUPiaXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5BHzSnaVRaiNwNasOM1zgRJot3wT5celIJuATl6MdrYdSIuju8K4HQ8gOvFbLQAjp4/D4+pKWWcw4K9ARSGTSG8YMbYA5y9vJ/1YO8OK2GtcFx/DLM6fHi+HRS+jmtjhl9V0ZMrML2zRBOWVAX7XKpiomfyeScS9W9FBx4/M/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MbugXiEt; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MbugXiEt"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23694cec0feso24566665ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 14:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753478253; x=1754083053; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT9DhCI4omelHQCSbq0zx+balg3BlkNvSkZNZzTd3hw=;
        b=MbugXiEt4bNHNUr3skPlXOxAaIcSYid7PC3wlkTSj7Fonkao3O294zoRJv76JM445f
         3oMqM8UPyKkbmMoo7tARQfHGfskitgsmq5k1xNJRaEinTPqf6E3177x5Bcnhhu+ZLLdP
         N7776ypb1ddVXsAHTZVxZH7Qd8pptm5Vs2QKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753478253; x=1754083053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dT9DhCI4omelHQCSbq0zx+balg3BlkNvSkZNZzTd3hw=;
        b=CR+FsVRFUKRC740VghXn671HFI4jFhO+IuJMHh4Mev4pMzEc7VfRCZPNeYave77/QF
         vvtXiR3XIuDbLWvzJj7zZH+eqrWffsVeu9bPrp42Bby6aspMClq47337kgRwpPu38Hr/
         NmyzyPyju4ZobEGf5j3N8RmKPSSPJZd2frrSMS8gPaKTqNSnPGELu+Ke0H+w4v4Xajeo
         dCtHeq7WNPyuF5VRge9RCDwXWb3jFBcQnvNRNuuIzH2llrtBRJQQ+G3F68esQgDWpELo
         WCds+As67o/3vh81xIU4EZi0iAoBSKYoPz4FoKL0MuWNXgKG2SGSCPbsoas5HC90XD6Y
         fwSw==
X-Forwarded-Encrypted: i=1; AJvYcCXn6uPZ88FMThFYpvYsQekEPdnubszQJIYi0U333Aji/rvOS1XrFv6nWVWbhmYhFURLUFqvNCJc+TCTnpnh2ypq+uAf9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxriHiBN5ajM1KiEODp6EFSQZGkLlAIWp1vAZx3E3/J47avohE4
	5VHFQYjdNXI760zPSarKhrhG8i8zOl3dWG6aK+YPH9vKTiVxR47pN5TgT8d8hpL/rHZkMUkFzKq
	yx10=
X-Gm-Gg: ASbGnctviK3q2OP4TJvJSoFHY/l3ExJ+5EOFn+Z1v866z6DH59gPU/QZdqIb2omL0Fo
	Hco6chwqVjtYZ0ZcqscCMn9LQGk+McVr3glvWlysr/hbpTjQHba1kyB9XW/woteLKu2DORTYrya
	oc/HY8lSY8Q7DNG/S+6afuaa14XamHYttU/7JN9mcV7AIzCIC+s1zjUgTxYdKmK6s4FEGds/vMN
	wse5Smxx0qtGx2U1/o9+sv2NxAcnnZygNm30XwIVe9tfKDUCOJnFI/ovlap+NWyedPCyGxWlmgs
	+7q+kxb6GIFdq5iVJNcYw9vVJTp82f/UXCjBdN6zgtjjZCysZiqGpASnK29S0/2COmgbz8l6FAV
	VJ8149WqPxuR2GBpkSRIDP/P9YMeyFW3F9/yoCf2qYoNnpur+VxcDeEpLZGmD5Q==
X-Google-Smtp-Source: AGHT+IHRCzVhY7onvUBLxGgNYeXateKaGoTDYCb2Rv8FU20rHTctZU7czx0b/jHZIeOyESFjPk5pZQ==
X-Received: by 2002:a17:903:289:b0:234:a44c:18d with SMTP id d9443c01a7336-23fb304fb2bmr56514675ad.22.1753478252849;
        Fri, 25 Jul 2025 14:17:32 -0700 (PDT)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe5150f3sm4018115ad.145.2025.07.25.14.17.27
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 14:17:27 -0700 (PDT)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so2181859a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 14:17:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVC7Z/bYKBKVhVumKVbcSV1sLr9gGIxGfHNFNp0geZcAw0Fzftexu6eVzI9/mb1oFJhx4cBf9iQ0aOWa/se47dXeCyQQA==@lists.linux.dev
X-Received: by 2002:a17:90b:350b:b0:312:29e:9ed5 with SMTP id
 98e67ed59e1d1-31e77a124ecmr4350962a91.23.1753478246765; Fri, 25 Jul 2025
 14:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724202338.648499-1-me@brighamcampbell.com> <20250724202338.648499-3-me@brighamcampbell.com>
In-Reply-To: <20250724202338.648499-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Jul 2025 14:17:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGNN68Fu4kJQQ8jO+fYP4qVJYmL0quxa_=Y5GEtS-jMQ@mail.gmail.com>
X-Gm-Features: Ac12FXxs1ZuIHE7bbVyrgXeO1Q1pzMxPpg9wpyIoG3cbGGcu5JyXqQ0FaT82pVk
Message-ID: <CAD=FV=UGNN68Fu4kJQQ8jO+fYP4qVJYmL0quxa_=Y5GEtS-jMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: novatek-nt35560: Fix bug and clean up
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 24, 2025 at 1:23=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Fix bug in nt35560_set_brightness() which causes the function to
> erroneously report an error. mipi_dsi_dcs_write() returns either a
> negative value when an error occurred or a positive number of bytes
> written when no error occurred. The buggy code reports and error under
> either condition.

My personal preference would be to code up the fix itself (without the
multi transition) as patch #1. That will make everyone's lives easier
with stable backports. You'll touch the same code twice in your
series, but it will keep it cleaner...


> Update driver to use the "multi" variants of MIPI functions which
> facilitate improved error handling and cleaner driver code.
>
> Fixes: 7835ed6a9e86 ("drm/panel-sony-acx424akp: Modernize backlight handl=
ing")
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>
> The usage of the u8 array, mipi_buf_out, in nt35560_set_brightness() may
> be a little curious. It's useful here because pwm_ratio and pwm_div
> aren't constant, therefore we must store them in a buffer at runtime.
>
> Using mipi_dsi_dcs_write_{seq,buffer}_multi() in place of
> mipi_dsi_dcs_write() gives the added benefit that kmalloc() isn't used
> to write mipi commands.

Ah, this makes sense. We've seen this before, but I keep forgetting
about it. Thanks for mentioning it. I wonder if it makes sense to have
variants of mipi_dsi_generic_write_seq_multi() and
mipi_dsi_dcs_write_seq_multi() that take non-const data. The only
difference would be that the array they declare on the stack would be
a "const" array instead of a "static const" array...


> The jdi-lpm102a188a driver's unprepare() function will ignore errors
> reported by mipi_dsi_dcs_{set_display_off,enter_sleep_mode}. This
> driver, however, will fail to unprepare the panel if either function
> returns an error. The behavior of the jdi-lpm102a188a panel makes more
> sense to me, but I strongly prefer not to change the behavior of this
> driver without personally having access to hardware to test.

Makes sense to me.


> @@ -176,62 +173,28 @@ static int nt35560_set_brightness(struct backlight_=
device *bl)
>
>         /* Set up PWM dutycycle ONE byte (differs from the standard) */
>         dev_dbg(nt->dev, "calculated duty cycle %02x\n", pwm_ratio);
> -       ret =3D mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> -                                &pwm_ratio, 1);
> -       if (ret < 0) {
> -               dev_err(nt->dev, "failed to set display PWM ratio (%d)\n"=
, ret);
> -               return ret;
> -       }
>
> -       /*
> -        * Sequence to write PWMDIV:
> -        *      address         data
> -        *      0xF3            0xAA   CMD2 Unlock
> -        *      0x00            0x01   Enter CMD2 page 0
> -        *      0X7D            0x01   No reload MTP of CMD2 P1
> -        *      0x22            PWMDIV
> -        *      0x7F            0xAA   CMD2 page 1 lock
> -        */

The above comment was useful. Can you keep it?


> @@ -278,16 +232,18 @@ static int nt35560_read_id(struct nt35560 *nt)
>         case DISPLAY_SONY_ACX424AKP_ID2:
>         case DISPLAY_SONY_ACX424AKP_ID3:
>         case DISPLAY_SONY_ACX424AKP_ID4:
> -               dev_info(nt->dev, "MTP vendor: %02x, version: %02x, panel=
: %02x\n",
> +               dev_info(&dev,
> +                        "MTP vendor: %02x, version: %02x, panel: %02x\n"=
,
>                          vendor, version, panel);
>                 break;
>         default:
> -               dev_info(nt->dev, "unknown vendor: %02x, version: %02x, p=
anel: %02x\n",
> +               dev_info(&dev,
> +                        "unknown vendor: %02x, version: %02x, panel: %02=
x\n",
>                          vendor, version, panel);
>                 break;
>         }
>
> -       return 0;
> +       return;
>  }

nit: no need for explicit return here, right?


> @@ -322,92 +278,56 @@ static void nt35560_power_off(struct nt35560 *nt)
>  static int nt35560_prepare(struct drm_panel *panel)
>  {
>         struct nt35560 *nt =3D panel_to_nt35560(panel);
> -       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(nt->dev);
> -       const u8 mddi =3D 3;
> +       struct mipi_dsi_multi_context dsi_ctx =3D {
> +               .dsi =3D to_mipi_dsi_device(nt->dev)
> +       };
>         int ret;
>
>         ret =3D nt35560_power_on(nt);
>         if (ret)
>                 return ret;
>
> -       ret =3D nt35560_read_id(nt);
> -       if (ret) {
> -               dev_err(nt->dev, "failed to read panel ID (%d)\n", ret);
> -               goto err_power_off;
> -       }
> +       nt35560_read_id(&dsi_ctx);
>
> -       /* Enabe tearing mode: send TE (tearing effect) at VBLANK */
> -       ret =3D mipi_dsi_dcs_set_tear_on(dsi,
> +       /* Enable tearing mode: send TE (tearing effect) at VBLANK */
> +       mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx,
>                                        MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -       if (ret) {
> -               dev_err(nt->dev, "failed to enable vblank TE (%d)\n", ret=
);
> -               goto err_power_off;
> -       }
>
>         /*
>          * Set MDDI
>          *
>          * This presumably deactivates the Qualcomm MDDI interface and
>          * selects DSI, similar code is found in other drivers such as th=
e
> -        * Sharp LS043T1LE01 which makes us suspect that this panel may b=
e
> -        * using a Novatek NT35565 or similar display driver chip that sh=
ares
> -        * this command. Due to the lack of documentation we cannot know =
for
> -        * sure.
> +        * Sharp LS043T1LE01

Ah, this is the obsolete comment that you removed and talked about
"after the cut". You could probably include that info in the commit
message itself since someone looking at the commit later would
otherwise not know why this info was removed.

Also, nit: you should end your sentence with a period. :-)


Overall this looks like a nicely done cleanup. Thanks! ...just a few
small nits...


-Doug
