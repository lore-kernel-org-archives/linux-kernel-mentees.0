Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919BB20C48B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 08:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637177; cv=none; b=XolhDLnwaBKiwvj+OAnXVr1kq3o0UsYKnrqGuKRONpJKXJbwbRxDidPF4bSnSS055qC1i04MhFX/l+x3LUpPLmKttACX3LIU9g6PCypMZcPkA5qBqg3CaNN0yI/VTsR+VtVAHwgdANqypc5P8NjtmLKTQI6LHoj9CAjGdqO2kNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637177; c=relaxed/simple;
	bh=nc6A17rnILQmIKKtpPcrAfjXVsbFKsUmfKWuYF0xYVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZApXojP+HswtSAxNT/gAPPitoMRko4SXXw/mIyHLOOAzrDsNFeA+KZhMwlffGAEwBqzzsEjAz8VMObvgQISf1/gIlNuUii9QY+SrdBbH0HexwRm5JZib3HxGbEeSs+XbLo6k0FRgz6cDYgi/5+Vtub0/e89dSRXq46b9nE/W0kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 246A241554
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 08:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IbAoQS_t_cy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 08:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.179; helo=mail-yw1-f179.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10E3C4052D
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10E3C4052D
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 10E3C4052D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 08:59:32 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e22f10cc11so14331097b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 01:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728637170; x=1729241970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykzu39AKcXejuBpU5m8IW6q6EkpIRw0KjmH9pDXGNvg=;
        b=Q23A0A7j+VtXKZXphaT0Y4poVAGMemVKM13qrn0DeX54jvK5dUPR54mxxzb9r6CWPX
         pGgLGnmc69qXOIqM0EswTVwN1heUEnt+CBzn6Luz30T7O5kLSX0o8G9cRckNbIWsV7kY
         OicWhtv2OWmVj8WR5J4Hun8AtJQ5Dm6zIzgRbe3Qu39SDMCvEwLqXFrgjQF2tq17MFbm
         0LTqkDb5lLIn9/Za+YfQPU3oWWl1Lk396TVHFgn3BonXeukx9vg+Y0QJxe+z1LU0Tn1w
         xGfxEd7/Gbvh6M9dYYnfwS3w5/QTxEul6gAdFyociXNR+G3FxwjrMc/eqhghCFNWMl3f
         Ha2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHm4AYto8l2KAA8OUsEMA2YQjbYJn9FM0epBe+bz8VdrQ6/Pj0orOS4UtJy5U/oOvLGZoAg9vp/sIQSI1IynNrsy07uw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzKE9SlVL1kjAF3L5Ry0VE4rWd3cRiMYn5+FcTgiQwP+qtNv3ce
	vrFRlrLXSfZawJufFYXuJC8ufkSxsf4Ty3UK/M4zmT/q18Rr0vGV3ICs2q4RP1w=
X-Google-Smtp-Source: AGHT+IFkLn3mTYQ3YWwgwXoF+M2Y4pjf7bqWmSofUVxmZ8m7whr9fe13yEl1K2QleaFHKSA57UD5PQ==
X-Received: by 2002:a05:690c:dc5:b0:6e3:19ad:969b with SMTP id 00721157ae682-6e3477b95efmr13690367b3.4.1728637169965;
        Fri, 11 Oct 2024 01:59:29 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332bae5f0sm5143347b3.71.2024.10.11.01.59.28
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 01:59:29 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e22f10cc11so14330837b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 01:59:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPupmAYAuDc0sdXBYx8DSp5gNsfN/Samg2H5QE2wHJAjvj0marZHQU9uaUi2NMXxQoexBBO/0X0HATAcbukxeBLin82w==@lists.linuxfoundation.org
X-Received: by 2002:a05:690c:397:b0:6e2:e22:12d9 with SMTP id
 00721157ae682-6e347b520d5mr11901267b3.35.1728637168527; Fri, 11 Oct 2024
 01:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011072509.3068328-2-davidgow@google.com> <20241011072509.3068328-3-davidgow@google.com>
In-Reply-To: <20241011072509.3068328-3-davidgow@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2024 10:59:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdotDYAgSDDrWi-TOj2o=5a53n452DydhD-Q0fjiGhew@mail.gmail.com>
Message-ID: <CAMuHMdUdotDYAgSDDrWi-TOj2o=5a53n452DydhD-Q0fjiGhew@mail.gmail.com>
Subject: Re: [PATCH 1/6] lib: math: Move kunit tests into tests/ subdir
To: David Gow <davidgow@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Brendan Higgins <brendanhiggins@google.com>, Rae Moar <rmoar@google.com>, 
	Kees Cook <kees@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Luis Felipe Hernandez <luis.hernandez093@gmail.com>, 
	quic_jjohnson@quicinc.com, macro@orcam.me.uk, tpiepho@gmail.com, 
	ricardo@marliere.net, linux-kernel-mentees@lists.linuxfoundation.org, 
	Nicolas Pitre <npitre@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Oct 11, 2024 at 9:31=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
> From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
>
> This patch is a follow-up task from a discussion stemming from point 3
> in a recent patch introducing the int_pow kunit test [1] and
> documentation regarding kunit test style and nomenclature [2].
>
> Colocate all kunit test suites in lib/math/tests/ and
> follow recommended naming convention for files <suite>_kunit.c
> and kconfig entries CONFIG_<name>_KUNIT_TEST.
>
> Link: https://lore.kernel.org/all/CABVgOS=3D-vh5TqHFCq_jo=3Dffq8v_nGgr6Js=
PnOZag3e6+19ysxQ@mail.gmail.com/ [1]
> Link: https://docs.kernel.org/dev-tools/kunit/style.html [2]
>
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> Acked-by: Nicolas Pitre <npitre@baylibre.com>
> [Rebased on top of mm-nonmm-unstable.]
> Signed-off-by: David Gow <davidgow@google.com>

Thanks for your patch!

> --- a/arch/m68k/configs/amiga_defconfig
> +++ b/arch/m68k/configs/amiga_defconfig
> @@ -619,7 +619,7 @@ CONFIG_KUNIT=3Dm
>  CONFIG_KUNIT_ALL_TESTS=3Dm
>  CONFIG_TEST_DHRY=3Dm
>  CONFIG_TEST_MIN_HEAP=3Dm
> -CONFIG_TEST_DIV64=3Dm
> +CONFIG_DIV64_KUNIT_TEST=3Dm
>  CONFIG_REED_SOLOMON_TEST=3Dm
>  CONFIG_ATOMIC64_SELFTEST=3Dm
>  CONFIG_ASYNC_RAID6_TEST=3Dm

[...]

> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2296,7 +2296,7 @@ config TEST_SORT
>
>           If unsure, say N.
>
> -config TEST_DIV64
> +config DIV64_KUNIT_TEST
>         tristate "64bit/32bit division and modulo test"
>         depends on DEBUG_KERNEL || m
>         help
> @@ -2306,7 +2306,7 @@ config TEST_DIV64
>
>           If unsure, say N.
>
> -config TEST_MULDIV64
> +config MULDIV64_KUNIT_TEST
>         tristate "mul_u64_u64_div_u64() test"
>         depends on DEBUG_KERNEL || m
>         help

This conflicts with "[PATCH] m68k: defconfig: Update defconfigs for
v6.12-rc1"[1].  Of course the proper way forward would be to add
"default KUNIT_ALL_TESTS" to all tests that still lack it, so I can
just never queue that patch ;-)

> @@ -2993,7 +2993,7 @@ config TEST_OBJPOOL
>
>           If unsure, say N.
>
> -config INT_POW_TEST
> +config INT_POW_KUNIT_TEST
>         tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TE=
STS
>         depends on KUNIT
>         default KUNIT_ALL_TESTS

[1] https://lore.kernel.org/all/4092672cb64b86ec3f300b4cf0ea0c2db2b52e2e.17=
27699197.git.geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
