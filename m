Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5171A238C
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  9 Jun 2025 22:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509122; cv=none; b=R+GfVMW8CnHpHZ3vaAVBr3FTfC/JhLvyCbJMvlVE8gDHJKUJyj5/Xv2oNgf3bU/XKAu8HJdEWgyDtvyDvNGLXGh1Zue4CQOwTzihHj7//NYoUwD9xINohWatFL7CfVO9Loz1bMJOXDO2fDzeB5/mnBnnXs8pF1WgLbxJdhPT/lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509122; c=relaxed/simple;
	bh=Iq0x5q2nwlvRMcB2qn2pumIsm+x63752VXEgXOhaJCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shkRws8GswQLx7Y1YoBh+jxRlbSCtHmRf9+61QikmYVYuskphFobmgFem0iWAHVbXaGRABkHr5Ugsp5x9Ou6pE7hGApMf0HMEakUEGkfSaJTv3Cg77sNgv2cDqi2PV0U5RBxBQmoUoI2Tdr/y6c0affOUr9j2qap9JYRAeI8lnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bfCTCuD6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bfCTCuD6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235e1d710d8so58659045ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 09 Jun 2025 15:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749509117; x=1750113917; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/LCGkPSUi11y6YDbtw03gAAN8X0aMlNFtkYip4Smws=;
        b=bfCTCuD6IPHuVc7Hu8OzWaVh/XydfHBDpzSawsobvb9hEvrniJ0WxszDoaUsHB9bir
         h0zwe5vo0z9d4Lt0tWImUzrLTRXpeGnftUqalX8ag0bVib7BsGoVGCOKGLUGahT1FFRd
         UgXyuIjQmdLTgCtVEJZFbzsxnTpdPJu4ddx3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509117; x=1750113917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/LCGkPSUi11y6YDbtw03gAAN8X0aMlNFtkYip4Smws=;
        b=l9Co/A/vPK9V9HKp8jp49MCW4Uus4LPX688qYsKHkXe31Z/MXUKweMpNlrMwRWcnCN
         RDwfx7rwACR4xQ9fbI2bQo8k/U7BVXdyh8tlZULvknXETlITB4cVHgncMMC502VBUqH6
         Cjl9fcuDnXzvf4Kl0udnvtvUM87wDxb+rW9HgSYjDoDdqUaqIwn+lmLsi+91LaLWVYmg
         DsqUzZ0MveiOHwAKu3Q3FS/f3ljmuSEt2VZQxT2W1Io9IMBGbACT85E1tXGFDmy4NzKe
         fVw+IrWEs+OmsKN1yEn/BNErcNux1Uimvp8Vjbnq7IUvywX3Qrl1gdl5rRs/6ljmUqP0
         LGbw==
X-Forwarded-Encrypted: i=1; AJvYcCUmmKlEbheIqD6OgQtR+1LwIm+HzliU1OT515/BLeBOMPGpYGKJmTuCxU39DcYLwE0Lz6PVU62T9kfb23Fk3LhIReBMkA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4CcxBMT5LsI4fnAIDRBjHVI0XV5864izQW3TcioQ/Jd/HEUVW
	cbQqTi2LcFSYHXHrZXbpRoEKxPwSus5g3uvdiV/K2UwR1mk011xhx4IUUKe9STF9qzmiFrWmaPd
	wNkYN3A==
X-Gm-Gg: ASbGncsFpX5pdIG1ISz7FKDkzkW2W0HNQOzjb2MfO/IuhtHZKH3q3RvZDfwaQhgUYNQ
	OjNqE5jBna78lZqUdMDKy6GMYWhsUqOP6fsDIAJVpwYIWkc3OHdIVI8DSP0PpWHTGFX3htNGngW
	N6RypLhEtq82nWoBqr8M7BjttNjKOm0zmgKHljyNLQZWD6UhlBZgMMJf8odqK0a/FO1I33TX28R
	yOPplRBqMsz4yad4DtXwLIpi3PKy4QfSvyicZTWgGdeI+JZfV/0PnDInAjXJMdpLeEwoy9X93XU
	jwHNgwijdaDmz7I1IRdqvAJSLQla1ZFxzptFFENMWNxISiTxgUB426p48I9mOyUf9KEXwE77J/z
	bJB/RsM0lz4rVDz/7OpFsxwXdSw==
X-Google-Smtp-Source: AGHT+IF+NPZ5SrK6ywPCRbPnJ8sEYwpnvb7IHLwKoSaKyMYg8YXEQ6xmtZIwMXso5YlGMegVt6q8rQ==
X-Received: by 2002:a17:903:2f04:b0:234:8c3d:2912 with SMTP id d9443c01a7336-2363818a33dmr4574705ad.11.1749509117251;
        Mon, 09 Jun 2025 15:45:17 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078936sm58864025ad.21.2025.06.09.15.45.15
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 15:45:15 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3109f106867so5841128a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 09 Jun 2025 15:45:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVr6I8Q+dwHYHbhEAc2Z6BN2Vm1ZS8BeXum2T86c9uFlQcpeQVIcM5G1p3a9FmYG6gL64dWXFVMeeitMhjEHDBN5kMnew==@lists.linux.dev
X-Received: by 2002:a17:90b:6c7:b0:313:1a8c:c2c6 with SMTP id
 98e67ed59e1d1-313a1695527mr399198a91.16.1749509115055; Mon, 09 Jun 2025
 15:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250506125133.108786-1-nicolescu.roxana@protonmail.com> <20250506125133.108786-3-nicolescu.roxana@protonmail.com>
In-Reply-To: <20250506125133.108786-3-nicolescu.roxana@protonmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 15:45:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2PSoakXH0_nKx1MkjPGXrHkFbPyMR=om9efW7LPn-dw@mail.gmail.com>
X-Gm-Features: AX0GCFvms_bTeu1m1tYJFabPtpRa0hg1AcW21wJUDi4AC8ourQTRpSPGDqEtFkQ
Message-ID: <CAD=FV=V2PSoakXH0_nKx1MkjPGXrHkFbPyMR=om9efW7LPn-dw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] serial: kgdboc: convert to use faux_device
To: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	jason.wessel@windriver.com, danielt@kernel.org, jirislaby@kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 6, 2025 at 5:51=E2=80=AFAM Roxana Nicolescu
<nicolescu.roxana@protonmail.com> wrote:
>
> The kgdboc uses a "fake" platform device to handle tty drivers showing
> up late. In case the tty device is not detected during probe, it will
> return EPROBE_DEFER which means the probe will be called later when the
> tty device might be there. Before this, the kgdboc driver
> would be initialized early in the process (useful for early boot
> debugging) but then the tty device wouldn't be there, and retry wouldn't =
be
> done later. For a better explanation, see commit
> '68e55f61c138: ("kgdboc: Use a platform device to handle tty drivers
> showing up late")'.
>
> This replaces the platform_device usage with faux_device which was
> introduced recently for scenarios like this, where there is not real
> platform device needed. Moreover, it makes the code cleaner than before.
>
> Signed-off-by: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
> ---
>  drivers/tty/serial/kgdboc.c | 50 +++++++++++--------------------------
>  1 file changed, 14 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 85f6c5a76e0f..d1ffe6186685 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -21,7 +21,7 @@
>  #include <linux/input.h>
>  #include <linux/irq_work.h>
>  #include <linux/module.h>
> -#include <linux/platform_device.h>
> +#include <linux/device/faux.h>
>  #include <linux/serial_core.h>
>
>  #define MAX_CONFIG_LEN         40
> @@ -42,7 +42,7 @@ static int kgdboc_use_kms;  /* 1 if we use kernel mode =
switching */
>  static struct tty_driver       *kgdb_tty_driver;
>  static int                     kgdb_tty_line;
>
> -static struct platform_device *kgdboc_pdev;
> +static struct faux_device *kgdboc_fdev;
>
>  #if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
>  static struct kgdb_io          kgdboc_earlycon_io_ops;
> @@ -259,7 +259,7 @@ static int configure_kgdboc(void)
>         return err;
>  }
>
> -static int kgdboc_probe(struct platform_device *pdev)
> +static int kgdboc_probe(struct faux_device *fdev)
>  {
>         int ret =3D 0;
>
> @@ -276,47 +276,26 @@ static int kgdboc_probe(struct platform_device *pde=
v)
>         return ret;
>  }
>
> -static struct platform_driver kgdboc_platform_driver =3D {
> +struct faux_device_ops kgdboc_driver =3D {

nit: s/kgdboc_driver/kgdboc_faux_ops/ ?

Other than that, this seems reasonable to me. I guess I'd assume that
Greg would chime in at some point since patch #1 in this series would
need to go through him.

-Doug
