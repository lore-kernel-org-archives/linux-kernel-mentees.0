Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F7D1D47AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Nov 2024 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882056; cv=none; b=nY/XKMAH8pdjW+2jOvjyxzqtt/uasDE8bQK/gjPcz/CrwTbAIEVmvfAlIHylLEZFKNL9s9F51fMblCIr43YTfzE0OK6G6e3vSOvjsZNac4LVQx+C5rSDcNmrTyJ+Dm3ILVINzdAhAKXOeSFkB37Yf7o2+vW+f7HNWrr9YAl4/90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882056; c=relaxed/simple;
	bh=Mm/jrbaJfFT6wDcI/e6esy2x+HxqFXxXHXIzM9YG/g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBxW2lKWHWt2QZsmP/VDlMmzY5QGN71qqijiHbX9f+9lpoRLFKBMVHhKEK4q4yhAnDzJC13dm9Us9HKPvBq3E1E3IQ1/W+PlonkzFEliPbiVps+F69/+12GB7085ygZcbunGhkWK30xBjCHl8/7/ivY8oOumB9dVrHoVzrPAzAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0884C40A53
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Nov 2024 08:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3qouEQ--_vm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Nov 2024 08:34:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.173; helo=mail-yw1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0369040A37
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0369040A37
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0369040A37
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Nov 2024 08:34:12 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e3c3da5bcdso58935767b3.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 00:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730882051; x=1731486851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orR+7ztJ0V4Vm2BaNkmu0xSje1Ay3zhhqlE0AJSTZ6E=;
        b=Clg12+tXb5QBKR0nFfKg7o+QL+oBAQvuNYmyZCrKP6FYCodjTkDOECuyNxPjQpO7cU
         +btSCV+FrBgFBGHRAW1OoZXCp9u1IK7WaocS7VilsqNbSKiui0BURV19pDI7jhUDlW+4
         cJgoUTP2CXb+03lzQs/sRKCbHfdYahiRe/AWpPDhK5wcxlajRRFfxLPJ2ZdMp4yllvuW
         jZlvJQ+mYCog2wQA78axjlrqJWLzMBNVUaWs2Izg6kjBSKu4tzL1n1oT02b7usR0LaDx
         TqvSWU9PoDbf4+MvIlDCjs0kzuMqJMELfUCGmnoCqFFR/hiSb6G0yKGfwZVKK58mLaCU
         U+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3wUxbz0YWDHi4CqCT1LbFi9MvuU6ebrTCtabzuz4whGDONKMD4OnVAzWo8JbMz/tu5iFueOEk6jYlsrkxhTnEvZNRfA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw4AlGwS5foj0BjNYv0GBLh7UWLNbigGegaKT5cibQpCzw0+GB7
	bTmSo412SrQI4Jn3mWXNa/Dbq8/lE6xg3Rd0M1oEl11uKA6xWakd01Q3Z3M+
X-Google-Smtp-Source: AGHT+IGNV+Y8UPbSppxV383AlpsMn30NFRiHshUkoPpf1HGPrJ1rYcW6fHI4SSOnVhckAmN0PTbAQQ==
X-Received: by 2002:a05:690c:4b8b:b0:6ea:8109:9d16 with SMTP id 00721157ae682-6ea81099e5cmr137757927b3.7.1730882049443;
        Wed, 06 Nov 2024 00:34:09 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c85760sm26364107b3.123.2024.11.06.00.34.07
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 00:34:07 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e9ba45d67fso59540597b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 00:34:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWH15qfomZOc/Y3otkKUCzNqcN4/00k5mSkWrS7KG+XpVmJVcU0WJSqa2DOKLzbx1g8yxsUasvX1OCkuwcsCJJbuW9HSg==@lists.linuxfoundation.org
X-Received: by 2002:a05:690c:4b8b:b0:6ea:8109:9d16 with SMTP id
 00721157ae682-6ea81099e5cmr137757237b3.7.1730882047612; Wed, 06 Nov 2024
 00:34:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011072509.3068328-2-davidgow@google.com> <20241011072509.3068328-3-davidgow@google.com>
 <CAMuHMdUdotDYAgSDDrWi-TOj2o=5a53n452DydhD-Q0fjiGhew@mail.gmail.com>
In-Reply-To: <CAMuHMdUdotDYAgSDDrWi-TOj2o=5a53n452DydhD-Q0fjiGhew@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 09:33:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQ-Fmnti80_HoX1+6L8wNUghpuJzqpT_g0SJQG-oq6RQ@mail.gmail.com>
Message-ID: <CAMuHMdVQ-Fmnti80_HoX1+6L8wNUghpuJzqpT_g0SJQG-oq6RQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] lib: math: Move kunit tests into tests/ subdir
To: David Gow <davidgow@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins <brendanhiggins@google.com>, 
	Rae Moar <rmoar@google.com>, Kees Cook <kees@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Luis Felipe Hernandez <luis.hernandez093@gmail.com>, 
	quic_jjohnson@quicinc.com, macro@orcam.me.uk, tpiepho@gmail.com, 
	ricardo@marliere.net, linux-kernel-mentees@lists.linuxfoundation.org, 
	Nicolas Pitre <npitre@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, Oct 11, 2024 at 10:59=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Oct 11, 2024 at 9:31=E2=80=AFAM David Gow <davidgow@google.com> w=
rote:
> > From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> >
> > This patch is a follow-up task from a discussion stemming from point 3
> > in a recent patch introducing the int_pow kunit test [1] and
> > documentation regarding kunit test style and nomenclature [2].
> >
> > Colocate all kunit test suites in lib/math/tests/ and
> > follow recommended naming convention for files <suite>_kunit.c
> > and kconfig entries CONFIG_<name>_KUNIT_TEST.
> >
> > Link: https://lore.kernel.org/all/CABVgOS=3D-vh5TqHFCq_jo=3Dffq8v_nGgr6=
JsPnOZag3e6+19ysxQ@mail.gmail.com/ [1]
> > Link: https://docs.kernel.org/dev-tools/kunit/style.html [2]
> >
> > Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> > Acked-by: Nicolas Pitre <npitre@baylibre.com>
> > [Rebased on top of mm-nonmm-unstable.]
> > Signed-off-by: David Gow <davidgow@google.com>

> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2296,7 +2296,7 @@ config TEST_SORT
> >
> >           If unsure, say N.
> >
> > -config TEST_DIV64
> > +config DIV64_KUNIT_TEST
> >         tristate "64bit/32bit division and modulo test"
> >         depends on DEBUG_KERNEL || m
> >         help
> > @@ -2306,7 +2306,7 @@ config TEST_DIV64
> >
> >           If unsure, say N.
> >
> > -config TEST_MULDIV64
> > +config MULDIV64_KUNIT_TEST
> >         tristate "mul_u64_u64_div_u64() test"
> >         depends on DEBUG_KERNEL || m
> >         help
>
> This conflicts with "[PATCH] m68k: defconfig: Update defconfigs for
> v6.12-rc1"[1].  Of course the proper way forward would be to add
> "default KUNIT_ALL_TESTS" to all tests that still lack it, so I can
> just never queue that patch ;-)

What's the status of this series? I am asking because I am wondering if
I should queue [1] for v6.13, or just drop it, and send a patch to add
"default KUNIT_ALL_TESTS" instead.

I saw the email from Andrew stating he applied it to his tree[2],
but that seems to have been dropped silently, and never made it into
linux-next?

Thanks!

> > @@ -2993,7 +2993,7 @@ config TEST_OBJPOOL
> >
> >           If unsure, say N.
> >
> > -config INT_POW_TEST
> > +config INT_POW_KUNIT_TEST
> >         tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_=
TESTS
> >         depends on KUNIT
> >         default KUNIT_ALL_TESTS
>
> [1] https://lore.kernel.org/all/4092672cb64b86ec3f300b4cf0ea0c2db2b52e2e.=
1727699197.git.geert@linux-m68k.org/

[2] https://lore.kernel.org/all/20241015001409.C4A33C4CEC7@smtp.kernel.org/

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
