Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5627B50C
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 12 Jan 2026 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213641; cv=none; b=c3z5D/EKKqBFXUC+AJBSyYkvfjxuAX0kt/4icA6aKHTwaAk3Zo/R2nov1vTvnrmmRq43K+LIV59IxsfKXYHWn57tpCeD7uiEx2JLO3mBSsworn1YAws/8nAWdA0j3xBOOpyeO6uExq9U9OZbQ0hFPqCEr/k0u949XOM8OGeWR8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213641; c=relaxed/simple;
	bh=/OcnzYIs+nvQRD5T/arHhLd77GZB9o83jwScrQb6p9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rPgPF9k3R3Sveh0mJQrDpP3vzwJ/Js3BinUpeJBJ2TnXIKvBCgBCjn5fFIllrd7GtgeYO1fjWCgJNkWCSWI14IdC4Xhr+yrXZcDpVVekBTFUceAou0bwRTt7SwLX8YJaq+7eLUmF4km2KcvArUFBQKKhu4FNYHq4ZpswAsM8TrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kL2mPT3F; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kL2mPT3F"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b7fe37056e1so610576366b.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 12 Jan 2026 02:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768213637; x=1768818437; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/OcnzYIs+nvQRD5T/arHhLd77GZB9o83jwScrQb6p9I=;
        b=kL2mPT3FzmIGQjl2j9rL7hYJErtz4vDFqr9SMhj3qQlY9uESwjiI0ZlMkYpdNVUUb2
         P+ZSD7XwAiZ2dkBjdHeYblMe8lL6UupeEWvUOkOVW7u37SmbePviCZnpOU8Qq1otgJFA
         vegoWGVtZT97NLlDIoyfmA9nO4LEvGdZ5iM7Uhjy1onFGeqXc/A5wvfwgX+SxtXWM+rJ
         UJEoKSpyCEgwFL1b/D4l8Ym2kEZg8VTCIQwSk3xEAnMZpD+DaXaC8NFFqdrWTv0k5m+6
         juqI3KIQX8GATl31UAhhkgBcPdalG5roUNKu2vmax6/xWyIY13LGi+BW9U+CkFNrrKav
         08SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213637; x=1768818437;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OcnzYIs+nvQRD5T/arHhLd77GZB9o83jwScrQb6p9I=;
        b=leUe63H02r54k4lnPJMMJwI6cx5+WE0tzl3uCdVCYtg4PDRCgqjLgBdv9t24CKbPQp
         lAwQwDUETrg8SNlBFdb/+3COQiq4wH094uxUkukxrJUKa2fT5hMKrE0cF9qlgs3P4iYj
         cGSKoo/VNyQLUX48hafB9osRPGOxmGsBp0ynzA0C3SYb6Dn1JE8BhketfikTHlonr6fF
         XXznxKJ9QoCbzDG7GUO+eIMHkudWOPXgejQEVNH3wMU8GuLHBsaLautQvLoeoNWQxEQN
         sFMMGFYfcZZPLyfO6s10Xlb+XykF4EaZ0r0nywcM6bKee8mPEAO+n6dmR5RJgipvFvP6
         xHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUawvvgqr+BNYcEUSMgg3xEOL18HYwTif2yAwJsSHFftJErk3lQEo4C2mh3kLfbSb0WrYtCBguQ5GiBnZqsv8wcFs6BdA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/634KpVUbtXDxGeo1LnIhS1/MfAI3Y3QoJMsjNFv8yjEfiBDP
	ILT3lNzuXGO6gn06uINIw4InTgjAJGP15a4Emey6cVNrWUjrl7SiH8EixH6l0QJsUFf+ohxjCNy
	Ajhum+PYJmz23xg==
X-Google-Smtp-Source: AGHT+IHZcTUd9JtBkbA4Ff21KbsCNwcOB4RCa/TipWmxjc2/LKdAT08tD9PvaWOaoTJ16cAK8lSFKQIasyVrww==
X-Received: from ejcre13.prod.google.com ([2002:a17:907:a2cd:b0:b87:1820:251d])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d25:b0:b87:1839:2601 with SMTP id a640c23a62f3a-b87183929d6mr333880666b.40.1768213636875;
 Mon, 12 Jan 2026 02:27:16 -0800 (PST)
Date: Mon, 12 Jan 2026 10:27:15 +0000
In-Reply-To: <20251022062948.162852-1-reddybalavignesh9979@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com>
 <20251022062948.162852-1-reddybalavignesh9979@gmail.com>
X-Mailer: aerc 0.21.0
Message-ID: <DFMJF68KIIHN.3Y2YF3EXRJ53@google.com>
Subject: Re: [PATCH] selftests/x86: Add selftests include path for kselftest.h
 after centralization
From: Brendan Jackman <jackmanb@google.com>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, <naresh.kamboju@linaro.org>, 
	<broonie@kernel.org>, <bp@alien8.de>, <shuah@kernel.org>
Cc: <anders.roxell@linaro.org>, <arnd@arndb.de>, 
	<benjamin.copeland@linaro.org>, <bp@alien8.de>, <dan.carpenter@linaro.org>, 
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, 
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	<lkft-triage@lists.linaro.org>, <mingo@redhat.com>, 
	<regressions@lists.linux.dev>, <richard.weiyang@gmail.com>, 
	<shuah@kernel.org>, <surenb@google.com>, <tglx@linutronix.de>, 
	<x86@kernel.org>, <linux-kernel-mentees@lists.linux.dev>, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed Oct 22, 2025 at 6:29 AM UTC, Bala-Vignesh-Reddy wrote:
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

Thanks, this fixes the issue I reported here:

https://lore.kernel.org/lkml/DFHI984SEFV3.2JL88CLHNT2SO@google.com/

Tested-by: Brendan Jackman <jackmanb@google.com>

Shuah, does this go via the kselftests tree? If not, Boris can you take
it via x86?
