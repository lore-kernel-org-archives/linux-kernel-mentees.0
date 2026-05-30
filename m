Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A73A1A21
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 12:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780144442; cv=pass; b=FEtAts9Ywp6UmXizkYu5tQmUcZr+Yz2ovzlLy1tvd+Vo2BytVphvfCp2eTABxkexWU8TK4AIsd4gNRikSVnDVwfO2Zcnzgx4cCZN0zMZGWc8Bl3Begh/7HYMppzUsk+TuYtBh5gAwF3Ej5NGym7DY6eqBJ4gHnyvcRMS+vre7cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780144442; c=relaxed/simple;
	bh=36c0unO8MWXWDDeFqNc9onABqLKdLE9E+dwU2fyUxqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SfEiAxJaDMiE1O/zbHRsdIYu6VYlL8TFgIFy/Vr4wlJOb8mcqnD3gsvi4neClEY7qPnkaM7cj7fndaYT8bvsyJk6uvn0Z4Z0EP2930ym+Guj1I7L8vqHD59ureL6alduDQ/gkFeJbl5xdb9ZrcQkKRBwrhtENP/BeSzBK6lTFgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQ1HzViI; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQ1HzViI"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68ad1e513d3so4335115a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 05:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780144439; cv=none;
        d=google.com; s=arc-20240605;
        b=jokzDO7Nc8Dc/4iVaRX3WivmWYAn3Zob3F9C1KQ/Hq8yA1dydoUPyZOvTgvN4bznHr
         gejnw5sf5z6o6V9mYKWxuK7IgBZFkYlO4tMZB0ssl7icF8EeRLI90cuN9lYc2KAZr6Bn
         7CJu5EkOihEihQOwfY5uZwknM6hq7dSCXgFxAUJu5fqSTu7B3q3vifFAiA8QtJkJ/tJf
         MiX8TuKHolsVqWRM5e2uJ2IyqojFeL9RWSVlSCWLIOvMJ0I34V+rCpGD9EWhAOU3UMcp
         dadTcKF9A+mDPQZXQxnZdVBy0JtX3Vv1GzoNLg/T9o/hMH+g1POErk8YgRCaBL0mFnZc
         GC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KObSDdJKT2yp6ibtTOcEqVNzY8XcmkFwEYsFtuWz+/g=;
        fh=EYy2gjxlMNS7hXq7tEUWs7vT4YFn16FtfTPJ0+AAgOE=;
        b=Hh/vVrzBNB2adbj4ivv4x85yRB9BZdOh6tlA83+DypprJeaVNtcTAu/2DBlJ9AkPVw
         YgxnldSvcSq68m1Ccajl1kKCPU+Ff0Sz9z1V5GNSgvKQT4JION8185ZMe3VZ81N+nukI
         ltdmG6Ixz6H4krMyjqKoqj0SwfgJzNQRpYAp+Tp2BxecDKlee3jlOl1QOF6DlL+crl1H
         t8FcG3Es3Y/n4jOZiBck5od17noEjGBvj50AtvUd4zFoODHNRAHt85K1c/cyhxwFDz7e
         3vyWlKIIjCny/Wa7jgX155QVDbNsW2k3v39BYTQ7jRzdrG5XLEEYA8y6kCzzd7nK8tg8
         bfYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780144439; x=1780749239; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KObSDdJKT2yp6ibtTOcEqVNzY8XcmkFwEYsFtuWz+/g=;
        b=kQ1HzViICeNLZaVUjsyypE57Ivkkb8CLuNgzjAFZndzQ4ZvSa+3ATy9+gQLS9/8Whq
         Qrp8fgJ7wTm0h5uRtft0JXoUDbKoRlptcHnEXC3lp8hrJvhxnFbt1/Q2WC/TOeNM2jZd
         i3opSVo3o2FCwrjmgiEsRWyfyiXOlT3R2y9BrUWG/cM1XViYx26nRhx92bGQdnXlZsj9
         XOa9Z2DGz78RayjeZAy9zpYV20+PyVjwZZydFA+fsSM53oB9PorbV/WqnH2VKsZwVgYW
         AiAZvmhE6QYNDa+H7sXRJyfBhcBxnllpaNfnsBbBIpd5Xr3Iwc7Fv408a1/YDq4miCMm
         5dZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780144439; x=1780749239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KObSDdJKT2yp6ibtTOcEqVNzY8XcmkFwEYsFtuWz+/g=;
        b=SOWJUqt/HTYBj8ex6CrMO1taY3BYa2K23x4Wf4mw5UFFCqpho8e5n2FPdAdYqePTuy
         Vd3YBOEjxDUsNlrpF1wr0KIQNhUONdr5mCDPy1M+L6fYBZ7rUorwZhF7Evr+993ZoSi7
         kAfgvRfRBHrLHg0FRUmG7GXOpmnmVGFPCcXW/lvI9+Xf4ZDC9akhBmpcTDqC2rQ6q9AV
         R40wDestFF8hjYofpe8S+Ku0wjojjZ2f8uJ0DvsZjJWga9TGSi0cIc7tTMPR7YZk8DlI
         2+LE8uu5dldEr8jz8UIx8r2H8B3LKiexMNZPFT54YWvsrKu8Z4iNJiDB1GoDVEf8ovJQ
         TylQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Cx+huZ/+873CxbBnnognnGUNry4tnYHRBECUwZoT0Cxqj/iVZpC0V62Nb8fTWCWLo4tJRfG9R44kMOtyqvWy5AY70Fg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo2SxzKV+JCj2QQtxtW0hlY1EAy/iECEGGqwM0EGDwTH5Jn3hN
	uaSyYpfEDcojpmKe7AENH6mJ8A0V5g9W3HhXy6E3pgmvp1scCk3brDcx0AXxa4TW/JsqTEdQ4o+
	44E1Z3H/et/i9Pynn1r1LzCMc+ag/fRs=
X-Gm-Gg: Acq92OELuzdnQ4TNH7kYGeHUJY2KdBgo4IiVP9shI8HttoaXZIX0YSQOVKtJgnCqnoV
	neFpSDV0pHzwnNLo1gaIQ/NDaGNXVkDroRI0JOQFdOmg3blCWpsvISseX7WtG0NPVbil2EDzgJv
	Cng9qF8+lkO4MawIY5VORiQE3yjH2Fv0KynLpb20pfUt0zwKp/Ir1EzIkYnHlNVlVIPgIlOmRGs
	ToUUc1ldsoFqx8qFYBKd6UhEsgeSybGmJy+lpz5VBZisW2cediNwvMkQndNxNieLPAAhL9uggyd
	pVuL+unPv7JWzXpF+eDRQG8nVlOQSOgPhLd8gBxeNJ35K9EscNsOJ/jPyfK+ZzIbvlBp+2Y+719
	py+SmwrkDEQ+wAFDsYOtKcJnMo/T+SIN6dEUdYbjCYnbBlZzM7srFNzvshZQRRjlul3oH+kbHVu
	CL1MUC
X-Received: by 2002:a17:906:4792:b0:be2:36d7:573b with SMTP id
 a640c23a62f3a-beab541eb92mr174787166b.12.1780144438732; Sat, 30 May 2026
 05:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530113938.171540-1-suunj1331@gmail.com> <20260530113938.171540-3-suunj1331@gmail.com>
In-Reply-To: <20260530113938.171540-3-suunj1331@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 May 2026 14:33:22 +0200
X-Gm-Features: AVHnY4Kn8G5KgjwULApCtLI6GYlsgGkapsmKD9_9XVVCstRmaIWeH1kuDVXFiv8
Message-ID: <CAHp75VeeAOnUj018z_JdSKZagXP7yYaw7okm0jdT8BBp_DM6iQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] iio: pressure: mpl3115: clean up interrupt handling
 and locking
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, apokusinski01@gmail.com, 
	me@brighamcampbell.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 1:40=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> Return IRQ_NONE instead of IRQ_HANDLED when reading
> INT_SOURCE fails.
>
> On shared interrupt lines, returning IRQ_HANDLED after a
> failed register read may prevent other handlers from being
> invoked.

> Switch the trigger handler from explicit mutex_lock/unlock
> to scoped_guard() for consistency with the locking style
> used elsewhere in the driver.

Split these two. Moving to scoped_guard() is a separate refactoring.

> Move mpl3115_config_interrupt() above the interrupt handler
> in preparation for the FIFO support added in a subsequent
> patch.

> No functional change intended.

But this is a lie. The change is a (big enough) functional change and
actually it feels and sounds like it deserves a Fixes tag.

...

> +reg1_cleanup:
> +       i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> +                                 data->ctrl_reg1);

And if this fails?.. (Okay, this is not this patch issue, it's an
original code.)

> +       return ret;
> +}

...

> -static int mpl3115_config_interrupt(struct mpl3115_data *data,
> -                                   u8 ctrl_reg1, u8 ctrl_reg4)
> -{
> -       int ret;
> -
> -       ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1=
,
> -                                       ctrl_reg1);
> -       if (ret < 0)
> -               return ret;
> -
> -       ret =3D i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG4=
,
> -                                       ctrl_reg4);
> -       if (ret < 0)
> -               goto reg1_cleanup;
> -
> -       data->ctrl_reg1 =3D ctrl_reg1;
> -       data->ctrl_reg4 =3D ctrl_reg4;
> -
> -       return 0;
> -
> -reg1_cleanup:
> -       i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
> -                                 data->ctrl_reg1);
> -       return ret;
> -}

If you need to move it up, split this move to a separate patch.

--=20
With Best Regards,
Andy Shevchenko
