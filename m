Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA6834DCEE
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Oct 2025 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145335; cv=none; b=ospUhzqvNgd8UzfPNVRxjUNgaa0TSN0tOuot7Wf/pmws3p3frxcGxgOGTw1LtKfN4dEVepSMeO+6/C1ro7B2Xahy7Hp9Lfv4x4BsAdannyjHplvFd4tUzvdpuQ8tWd/rFshY8yvj+yeiRCd0k2TuxnXiX/xYxGYv3evQo1wMfF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145335; c=relaxed/simple;
	bh=hdYfR8VgCU1ZspHH5xOZyDRebDxd3yGnO9egZSHcGHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bP3Fpf0cZdBOlfkTXsxlbBqY2ZJFKvzVcrOgbPP4N9KxwssoI6vlhQO9lg8BltcPVuDla1P7eTAk0YCk1Y34dqFGXkb3+KTNiZTOFLIgh91MQ8IPvYfgA2s7RkGMCAexqxaZHQASGInfF0soozCwSSPUVhx9yuESHLJNSF53fg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IAwr8EYg; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAwr8EYg"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-7ec4b18b349so1738626d6.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Oct 2025 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761145333; x=1761750133; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BnIAOSj9hN5H1aKf2wyJor6fNQ1bM8Ks2ytqG7kDK1w=;
        b=IAwr8EYgu8Tgh1Kj5g7NyVFKyyY6ZgFxbqUzfGTVJxof/dNHjrG1C+ZEMt6OdZWjpv
         c7KbJ4rc/uEHb9YF8RbNNi7C2DkJ3piMLyXMWt8f2sH15cLDLZsC6lAxSspYI92HZ7y+
         Y9cwHuRVZVlp+T9dvh1jpkDzh9DV26uoE8fA8q5qlBg+H0jMAAWltBNaiHgsAdQ7Blaz
         h+7QsDFDzfQsDvydtAHbdV2auIj6Tg7uBv3erH0XXJJXq7nkdZ+eFJxJuM3VLoK3+u2K
         8plggmJHknZuBBLVjyVN81YTJApnJrThIQSrAKdqSvyb0eXYyTdHn03hrQbhwHoYrkiO
         Nq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145333; x=1761750133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnIAOSj9hN5H1aKf2wyJor6fNQ1bM8Ks2ytqG7kDK1w=;
        b=duWnuNLR12G9B9KPTbPkjpcXxwdSslibgN+3xqiSJal8LLtAdkHiXifny/eTL9CilU
         Jr63AI3KwofaJd5bJvLorHvsff1Hs0Qo9Tale4PbRLqX1vU65a7G3mdr2YsJsyH6++Tm
         ugPkz0BzBcJr09GAZ6wUcatgtmjwOcfnQq2CVmwR0T81IPXDvv5VKYUtw23VUZWVj0OC
         fGB4WMOmKgII9mlLgg+anOsCsigygcdTou4amEtiF/8DuKYDvbZn8Zr6MfESi4UUZ/pw
         cGEInlFihQZZoR6Elkhv6fXAmFZDeb9TMM5scv5yAknPXEofffq1aDV7GPfK05VoJj5o
         BuYg==
X-Forwarded-Encrypted: i=1; AJvYcCVdgd90uNVWtDmRcTvl3d8kdgr9TQx2DC4adb4OOxOBxMyvmfgVkZ42qSxB7cFL29/O/G5lDrKB6xPZPSFLCY/6wAhMvA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8vFxt+8spHJa5RKzrg6V9KpT+TjVMCklHPZfdGYcWgZD62MaD
	EZR71KhUIojyQTYCyvm+4YagKX6HFXu1YP7HEOWAhB/bmrMhP17lF4vPVrep7ZsxlcuTjiZTWta
	1MCeICY+ljmCsSGPLNV6CYidDj6lLFPv5AG+Y41g/TQ==
X-Gm-Gg: ASbGncsd6a4Dv9XWzdfzrF8p+AskMWuLc3paZh0tDbrhYJFWbSULatMEgky8bvTSeCl
	wH5YM7+8ehUE3vzzQucMB2jRB3Ke4gZYnVa8zkOSgKlI9q0eCwuQodJPkbqhsd0ZxviDYDHWx9Q
	7/s6cq5oobD48Z3mwSGJMaYHy9QtAQEVeI0UjWwIKxCB7tu8WI8MjGXRiRdmJ3jBJFJV07fi173
	BY2m+4Es9EIln57aw4e/YknZ4luThwl47L/yBoSCvVJIiKSkRNuhki1z94GmlFiSGTs0g==
X-Google-Smtp-Source: AGHT+IHDNBWFGq/lO9UqX3OiuCVmV8mj/OamM0dXHm9H8/TY++90uwy4eHmeOOO7ME2KeAOXQVNRoq9F5JuwtjkDp/g=
X-Received: by 2002:a05:6214:19c6:b0:87d:f8d3:2456 with SMTP id
 6a1803df08f44-87df8d324a4mr21664096d6.2.1761145331914; Wed, 22 Oct 2025
 08:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com>
 <20251022062948.162852-1-reddybalavignesh9979@gmail.com>
In-Reply-To: <20251022062948.162852-1-reddybalavignesh9979@gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Wed, 22 Oct 2025 17:02:00 +0200
X-Gm-Features: AS18NWDwE4wLtG7BZRqK8s-_yLrQzlCdiI_YRXplah4qDB6dhd-o_z_6gw0x-cw
Message-ID: <CADYN=9KxQaQMWNbwDSftj7kcBYHjAQPacE+z7AVRZwxPTpexYQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/x86: Add selftests include path for kselftest.h
 after centralization
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: naresh.kamboju@linaro.org, broonie@kernel.org, arnd@arndb.de, 
	benjamin.copeland@linaro.org, bp@alien8.de, dan.carpenter@linaro.org, 
	dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, lkft-triage@lists.linaro.org, 
	mingo@redhat.com, regressions@lists.linux.dev, richard.weiyang@gmail.com, 
	shuah@kernel.org, surenb@google.com, tglx@linutronix.de, x86@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Oct 2025 at 08:29, Bala-Vignesh-Reddy
<reddybalavignesh9979@gmail.com> wrote:
>
> The previous change centralizing kselftest.h include path in lib.mk
> caused x86 selftests to fail, as x86 Makefile overwrites CFLAGS using
> ":=", dropping the include path added in lib.mk. Therefore, helpers.h
> could not find kselftest.h during compilation.
>
> Fix this by adding the tools/testing/sefltest to CFLAGS in x86 Makefile.
>
> Fixes: 4d89827dfb27 ("selftests: complete kselftest include centralization")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/lkml/CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com/T/#m83fd330231287fc9d6c921155bee16c591db7360
>
> Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>

Yes, works.

Tested-by: Anders Roxell <anders.roxell@linaro.org>


Cheers,
Anders

> ---
>  tools/testing/selftests/x86/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
> index 83148875a12c..434065215d12 100644
> --- a/tools/testing/selftests/x86/Makefile
> +++ b/tools/testing/selftests/x86/Makefile
> @@ -36,6 +36,7 @@ BINARIES_32 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_32))
>  BINARIES_64 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_64))
>
>  CFLAGS := -O2 -g -std=gnu99 -pthread -Wall $(KHDR_INCLUDES)
> +CFLAGS += -I $(top_srcdir)/tools/testing/selftests/
>
>  # call32_from_64 in thunks.S uses absolute addresses.
>  ifeq ($(CAN_BUILD_WITH_NOPIE),1)
> --
> 2.43.0
>
