Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DA9EC5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  6 Oct 2024 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728220697; cv=none; b=sOVR0PsoXrW9aOSgRIEL1h27fawCTuNEq/EasoijHleHPgeLwbXtWlD8E3o3hXa83lzN6vZh5EXDEAPQRWiLnIxvP/BeMrRngTGQqm0nf+X3u2ZwuD9LbSo6BfgqjgrCkjegN5+E0iZ8AEnSXyp/HdADPZ5ijxcdmMR6hNb3Wy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728220697; c=relaxed/simple;
	bh=Hp4/99Nug2oU1/XkcYrBQYH1XahWruSKp2vh6ow9FPk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tRk/4eZaJk0F5Hf59YI4heb29OTSN4omxmaIDw6dclmKpN3BNo4uEOAgOAE+u90qMG4vJLhQ+TSJ2gatZkQ2QlIyPm2hHAHyd5eW22WHfprjtOuZ3BlH/9oDLzauYsH7eJwusNK/lojMr/gevrRVZsWCqgeJNB0il1E1MiBeYZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sCag3bwK; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sCag3bwK"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADED06060B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  6 Oct 2024 13:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NG_BZpNisE3B for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Oct 2024 13:18:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=npitre@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27E4060609
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27E4060609
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sCag3bwK
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 27E4060609
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  6 Oct 2024 13:18:10 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6cb2e5d0104so26217006d6.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 06 Oct 2024 06:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728220689; x=1728825489; darn=lists.linuxfoundation.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4B6iwwlt1XcfrAu2uR5h4j7IP3dNe1xODabG6PfX40=;
        b=sCag3bwKv4EFoOtP/kzZE5ExkHq+Jl35Ar0zaCB0M/Iosj7Bpkg6BXRptaGzI8pKFf
         FkGtA8JYXO8nUA57JSHxSnD2GbbGf8IUV+ZH1+zIThGYeApSGrd1QYu6JAeYsnF0lh2F
         v9jchisTr73ry8yG8c2BmqW1LUETBY/S0KiETCUYsJL9lKyfQGnXa2DsOptKt8TZaKXH
         ULUrwVGbd4ivliix2zMExqTPAeaMAWgjVejToOB8nuOqlk2UB6US3V4oeCmXGJNrG4VJ
         rN721uAg5F8s91C0O8yniCt9ApVkf4MwmmYGDD03gjOshiy7AJQWhhRpwoNtdI7M74pZ
         clnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728220689; x=1728825489;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4B6iwwlt1XcfrAu2uR5h4j7IP3dNe1xODabG6PfX40=;
        b=dec48s29uSVPhgucbt3r6qO5C0DaurdUYn9yMXLAhBCkPb8xioPfr8paFsrWqzmddZ
         vLbmXDtSQ6jL+aSNYK+m2HCMzfDvtJLY69UqPwQWAXKkce7MABxS3qOizOD+4UQzz7Cb
         uc44UFK2hs/ORSahVzqUM6NA0EaIacbIp64v6LlAx3opjfyrFGwWWCaH2pKupEXsZ7s0
         fPhZkniEmelneMKVBTZx8HQBa4zk9QDGCoj5/XjLjTPQr+1aM4qixCwzF/e9A8K8Tdq5
         oPXT6p1DD/9PvCPMvzHyjF6EIlcEer+/IJGQ4t2TuOS1FgzXeK/hM26izbHxYooTlB74
         RZrg==
X-Forwarded-Encrypted: i=1; AJvYcCVdd4jnq42vqDWWtyH99jxrILEupX2wcjLIGai6jv/yFP3T2LFvjG2yJfeDGngVp/KONUMnAodwpgKqvUTLK7ywlk2vGw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz/Yzzu1Zg/+L+jZAypm/md1dH3AsRENE2iyvlNmq9SmAtKpfRm
	z1FRG47BH+/80zDFOA4yxawLLVTAE6EStE3gRoqPsdiLHWEPV8LrX6abaYAXThQ=
X-Google-Smtp-Source: AGHT+IFM4dIYBNQf4JurGGagqRKaLYl/JFqkWOrQ+J3zx2IbxbisDwaY6BCs2hFxIrq/bKrbFWZykw==
X-Received: by 2002:a05:6214:440c:b0:6cb:27e6:393f with SMTP id 6a1803df08f44-6cb9a4ea384mr120414406d6.36.1728220688872;
        Sun, 06 Oct 2024 06:18:08 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46cced5sm16756606d6.7.2024.10.06.06.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 06:18:07 -0700 (PDT)
Date: Sun, 6 Oct 2024 09:18:05 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
cc: brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com, 
    quic_jjohnson@quicinc.com, macro@orcam.me.uk, tpiepho@gmail.com, 
    linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
    skhan@linuxfoundation.org, ricardo@marliere.net, 
    linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3] lib: math: Move kunit tests into tests/ subdir
In-Reply-To: <20241005222446.10471-1-luis.hernandez093@gmail.com>
Message-ID: <97324415-r1q5-04op-3364-rnr2q3618oo1@onlyvoer.pbz>
References: <20241005222446.10471-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Oct 2024, Luis Felipe Hernandez wrote:

> This patch is a follow-up task from a discussion stemming from point 3
> in a recent patch introducing the int_pow kunit test [1] and
> documentation regarding kunit test style and nomenclature [2].
> 
> Colocate all kunit test suites in lib/math/tests/ and
> follow recommended naming convention for files <suite>_kunit.c
> and kconfig entries CONFIG_<name>_KUNIT_TEST.
> 
> Link: https://lore.kernel.org/all/CABVgOS=-vh5TqHFCq_jo=ffq8v_nGgr6JsPnOZag3e6+19ysxQ@mail.gmail.com/ [1]
> Link: https://docs.kernel.org/dev-tools/kunit/style.html [2]
> 
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>

For the mul_u64_u64_div_u64 part:

Acked-by: Nicolas Pitre <npitre@baylibre.com>

> ---
> Changes in v2: Fix cc recipient list inclusion in cover letter
> Changes in v3: Update mul_u64_u64_div_u64_kunit.c path in comment describing shell script
> ---
>  arch/m68k/configs/amiga_defconfig                           | 2 +-
>  arch/m68k/configs/apollo_defconfig                          | 2 +-
>  arch/m68k/configs/atari_defconfig                           | 2 +-
>  arch/m68k/configs/bvme6000_defconfig                        | 2 +-
>  arch/m68k/configs/hp300_defconfig                           | 2 +-
>  arch/m68k/configs/mac_defconfig                             | 2 +-
>  arch/m68k/configs/multi_defconfig                           | 2 +-
>  arch/m68k/configs/mvme147_defconfig                         | 2 +-
>  arch/m68k/configs/mvme16x_defconfig                         | 2 +-
>  arch/m68k/configs/q40_defconfig                             | 2 +-
>  arch/m68k/configs/sun3_defconfig                            | 2 +-
>  arch/m68k/configs/sun3x_defconfig                           | 2 +-
>  arch/powerpc/configs/ppc64_defconfig                        | 2 +-
>  lib/Kconfig.debug                                           | 6 +++---
>  lib/math/Makefile                                           | 5 +----
>  lib/math/tests/Makefile                                     | 5 ++++-
>  lib/math/{test_div64.c => tests/div64_kunit.c}              | 0
>  .../mul_u64_u64_div_u64_kunit.c}                            | 2 +-
>  lib/math/{rational-test.c => tests/rational_kunit.c}        | 0
>  19 files changed, 22 insertions(+), 22 deletions(-)
>  rename lib/math/{test_div64.c => tests/div64_kunit.c} (100%)
>  rename lib/math/{test_mul_u64_u64_div_u64.c => tests/mul_u64_u64_div_u64_kunit.c} (98%)
>  rename lib/math/{rational-test.c => tests/rational_kunit.c} (100%)
> 
> diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
> index d01dc47d52ea..7ba9311c084c 100644
> --- a/arch/m68k/configs/amiga_defconfig
> +++ b/arch/m68k/configs/amiga_defconfig
> @@ -619,7 +619,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
> index 46808e581d7b..273fe4032b85 100644
> --- a/arch/m68k/configs/apollo_defconfig
> +++ b/arch/m68k/configs/apollo_defconfig
> @@ -576,7 +576,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
> index 4469a7839c9d..9976cda99fc1 100644
> --- a/arch/m68k/configs/atari_defconfig
> +++ b/arch/m68k/configs/atari_defconfig
> @@ -596,7 +596,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
> index c0719322c028..f59082c8fe06 100644
> --- a/arch/m68k/configs/bvme6000_defconfig
> +++ b/arch/m68k/configs/bvme6000_defconfig
> @@ -568,7 +568,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
> index 8d429e63f8f2..6db3556da9ac 100644
> --- a/arch/m68k/configs/hp300_defconfig
> +++ b/arch/m68k/configs/hp300_defconfig
> @@ -578,7 +578,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
> index bafd33da27c1..25c06b5c83ee 100644
> --- a/arch/m68k/configs/mac_defconfig
> +++ b/arch/m68k/configs/mac_defconfig
> @@ -595,7 +595,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
> index 6f5ca3f85ea1..35e57e0ee139 100644
> --- a/arch/m68k/configs/multi_defconfig
> +++ b/arch/m68k/configs/multi_defconfig
> @@ -681,7 +681,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
> index d16b328c7136..d253b686119a 100644
> --- a/arch/m68k/configs/mvme147_defconfig
> +++ b/arch/m68k/configs/mvme147_defconfig
> @@ -567,7 +567,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
> index 80f6c15a5ed5..62bc6ad63783 100644
> --- a/arch/m68k/configs/mvme16x_defconfig
> +++ b/arch/m68k/configs/mvme16x_defconfig
> @@ -568,7 +568,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
> index 0e81589f0ee2..caba39c61bac 100644
> --- a/arch/m68k/configs/q40_defconfig
> +++ b/arch/m68k/configs/q40_defconfig
> @@ -585,7 +585,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
> index 8cd785290339..a348f645ed55 100644
> --- a/arch/m68k/configs/sun3_defconfig
> +++ b/arch/m68k/configs/sun3_defconfig
> @@ -565,7 +565,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
> index 78035369f60f..f8b3cfc3275b 100644
> --- a/arch/m68k/configs/sun3x_defconfig
> +++ b/arch/m68k/configs/sun3x_defconfig
> @@ -566,7 +566,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_TEST_DHRY=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_REED_SOLOMON_TEST=m
>  CONFIG_ATOMIC64_SELFTEST=m
>  CONFIG_ASYNC_RAID6_TEST=m
> diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
> index a5e3e7f97f4d..f1f21765c0c1 100644
> --- a/arch/powerpc/configs/ppc64_defconfig
> +++ b/arch/powerpc/configs/ppc64_defconfig
> @@ -435,7 +435,7 @@ CONFIG_KUNIT=m
>  CONFIG_KUNIT_ALL_TESTS=m
>  CONFIG_LKDTM=m
>  CONFIG_TEST_MIN_HEAP=m
> -CONFIG_TEST_DIV64=m
> +CONFIG_DIV64_KUNIT_TEST=m
>  CONFIG_BACKTRACE_SELF_TEST=m
>  CONFIG_TEST_REF_TRACKER=m
>  CONFIG_RBTREE_TEST=m
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 7315f643817a..0d6c979f0bfd 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2296,7 +2296,7 @@ config TEST_SORT
>  
>  	  If unsure, say N.
>  
> -config TEST_DIV64
> +config DIV64_KUNIT_TEST
>  	tristate "64bit/32bit division and modulo test"
>  	depends on DEBUG_KERNEL || m
>  	help
> @@ -2306,7 +2306,7 @@ config TEST_DIV64
>  
>  	  If unsure, say N.
>  
> -config TEST_MULDIV64
> +config MULDIV64_KUNIT_TEST
>  	tristate "mul_u64_u64_div_u64() test"
>  	depends on DEBUG_KERNEL || m
>  	help
> @@ -3089,7 +3089,7 @@ endmenu # "Rust"
>  
>  endmenu # Kernel hacking
>  
> -config INT_POW_TEST
> +config INT_POW_KUNIT_TEST
>  	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
>  	default KUNIT_ALL_TESTS
> diff --git a/lib/math/Makefile b/lib/math/Makefile
> index 3ef11305f8d2..1c489501ff57 100644
> --- a/lib/math/Makefile
> +++ b/lib/math/Makefile
> @@ -5,7 +5,4 @@ obj-$(CONFIG_CORDIC)		+= cordic.o
>  obj-$(CONFIG_PRIME_NUMBERS)	+= prime_numbers.o
>  obj-$(CONFIG_RATIONAL)		+= rational.o
>  
> -obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
> -obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
> -obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
> -obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
> +obj-y  += tests/
> diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
> index 6a169123320a..f9a0a0e6b73a 100644
> --- a/lib/math/tests/Makefile
> +++ b/lib/math/tests/Makefile
> @@ -1,3 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -obj-$(CONFIG_INT_POW_TEST) += int_pow_kunit.o
> +obj-$(CONFIG_DIV64_KUNIT_TEST)    += div64_kunit.o
> +obj-$(CONFIG_INT_POW_KUNIT_TEST)  += int_pow_kunit.o
> +obj-$(CONFIG_MULDIV64_KUNIT_TEST) += mul_u64_u64_div_u64_kunit.o
> +obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational_kunit.o
> diff --git a/lib/math/test_div64.c b/lib/math/tests/div64_kunit.c
> similarity index 100%
> rename from lib/math/test_div64.c
> rename to lib/math/tests/div64_kunit.c
> diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/tests/mul_u64_u64_div_u64_kunit.c
> similarity index 98%
> rename from lib/math/test_mul_u64_u64_div_u64.c
> rename to lib/math/tests/mul_u64_u64_div_u64_kunit.c
> index 58d058de4e73..f61f571a0a2e 100644
> --- a/lib/math/test_mul_u64_u64_div_u64.c
> +++ b/lib/math/tests/mul_u64_u64_div_u64_kunit.c
> @@ -49,7 +49,7 @@ static test_params test_values[] = {
>   *
>   * #!/bin/sh
>   * sed -ne 's/^{ \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\) },$/\1 \2 \3 \4/p' \
> - *     lib/math/test_mul_u64_u64_div_u64.c |
> + *     lib/math/tests/mul_u64_u64_div_u64_kunit.c |
>   * while read a b c r; do
>   *   expected=$( printf "obase=16; ibase=16; %X * %X / %X\n" $a $b $c | bc )
>   *   given=$( printf "%X\n" $r )
> diff --git a/lib/math/rational-test.c b/lib/math/tests/rational_kunit.c
> similarity index 100%
> rename from lib/math/rational-test.c
> rename to lib/math/tests/rational_kunit.c
> -- 
> 2.46.2
> 
> 
