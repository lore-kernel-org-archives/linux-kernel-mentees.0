Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA3528B419
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Jul 2025 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620831; cv=none; b=YmFlE3aJ/PeC3algS9w5WLyLVk+wSr/GQLMQd2jnGSV5qqz3R0Y39QLdYLnYgcrdq828pCV1qGqU+Wt3kd1HK9Uf4ibcPWfjAMLa0GTM4uEK15rYfjPeaBqnMK+33YzrXc5kvjPmqQlKnTqxtyS1549+hlOxtqJgLljEl8X6sVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620831; c=relaxed/simple;
	bh=M4kyxHF27eymEVDJwIeVmNTutyHMh9udlF6lQLdU9Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SLFxrjL7yptDv2PMp9pDXp1rGcgwt+/TKuP9vXbHFlajHdmPDikSdKNBPPXfeXSnMkb45a3KGXnKwuYJBGY9jg348ve6MMzp4+6f6tr0NWUozQdgRWWpFVod4i4GUwI43h5IjXvkSfkaxqeL1ZCPBBmYdAnYNTZcmInS369qXxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ9k6tlq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ9k6tlq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1200813f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 04 Jul 2025 02:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620828; x=1752225628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+Ik9FB2BHF2LFVVV6mpBekWZ6EW7mXHVXys5mfnlr0=;
        b=XQ9k6tlqAttVQ5qfTGODwUENVXNN78lpClaTdC2WGGJ+C4mGbeO6Vp5A6JImtabjGz
         YDx7wyYSdSgQDY9yEBWnOhNCtxmVQGpYNB/PqH1rpYOJuzEUWMbcitLfGZUSPysvnMXO
         6/f33UdviEXRbtuNW5hXl7ZzWB1EY7/tLTnkEwiAHbpbWCZ1AZI8CPSMpQW/MCRIgyXD
         AJE0viu7tGlGLwVw+9awHjSM1YEbPl/u+5CRGQOCeNPhnzIjYdqCcBWUSobKFyTKt9K/
         8dSE6icagwfqTZxrOL9GxwVZ8WLqXFHlhTr9KxQfMDNPz8bFrepWTFJtEyMWDAslcFX0
         Af6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620828; x=1752225628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+Ik9FB2BHF2LFVVV6mpBekWZ6EW7mXHVXys5mfnlr0=;
        b=jyQc0isBbXyXgQgHrgALpyUuRkduGQZzk0Nuxr6jQSc9SqmpD/6kcBgGdAr8l+AAgG
         Q4/Vl28nel2r/+bXLJLcx9JgXdhDIDZ9v491etikidAQlspLUC0H0p6y7m7ChV9iK78q
         M+BDVY05uWyqZD8g1Msi3RUd1n4tVdQhMcaWrYUAucGcvs91AN5NVeNueGzuUz4tgNPz
         xEXylZVeu7j7Uryexw5vyU5J23GBvYqRTPT/lT/06hUpl/oFMcVlWFq6UahRGuvxboim
         Ah6H0Ite5XrBe20NNhfXBKL52U1jqGUDLIOCM8Ow+9CWCezVAeTQZjJXyA0YKotOo06+
         e1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Zq3anCrjCLg4+cpp8bgotPmcACbRzAFj9hyARJccoikdMQykgzDPOrreIAlxKHXEdDvQVlzVT73Mz/6Kbz8YrtsutA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1BDnFygHax4Wtqt18iixn4ygkc66144721jU+UUJV1OH23vyt
	re1HjdEbcyNsX0237tEVCcCNNqw0K1M6bIYrtyj7/gItQHIAvic182AX
X-Gm-Gg: ASbGncuZqcid19GiGTaPJDJZJ0Y5IYoMjlUUHJbvJSzYwUbXgnNFNyGvEXm0E90HITP
	osyJZbXW5RUQAJupaeacRpCl9jDC6bWuaX/q0mAjaO2kNTNPoLIEtBNXXGSvhisq4t+VluW6ToV
	kedypBF0Oay8dBBCtU7J40+f2PiTPhFHTX+F51D0lxpUYHa9hFPrX5nSafY5mQvwxx7+PAUm8ZL
	bVTUmEuC+FVjZlCuUpoASwtltk+FJtUiu8FOTWXOfPL+oI7NkSc2Fkm3YhHJ9jS35NhvFA/qCUK
	t2QmTvFPiByMlKAezdyUGjbYr4tkkSHJAPEkRnltE+90Z72+0VsrLY2twoorWVKIbZEuwEC6M8f
	0lGFsQwVtnHDY7A+ZoQ==
X-Google-Smtp-Source: AGHT+IFrlNc7sZqyAZg5GPKF/fl2jdn72qDl3Dccv12xQ9nx91zaIVbtMctI2uw/u5xVcuxpGQSwcw==
X-Received: by 2002:a05:6000:4601:b0:3a3:64b9:773 with SMTP id ffacd0b85a97d-3b495b9442fmr1765994f8f.10.1751620827681;
        Fri, 04 Jul 2025 02:20:27 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c4f9sm1945049f8f.88.2025.07.04.02.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:20:27 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:20:07 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Usman Akinyemi <usmanakinyemi202@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com, james.clark@linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] perf/x86: Replace strncpy() with memcpy() for vendor
 string
Message-ID: <20250704102007.6354ce9f@pumpkin>
In-Reply-To: <20250618215843.109941-1-usmanakinyemi202@gmail.com>
References: <20250618215843.109941-1-usmanakinyemi202@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Jun 2025 03:28:43 +0530
Usman Akinyemi <usmanakinyemi202@gmail.com> wrote:

> strncpy() is unsafe for fixed-size binary data as
> it may not NUL-terminate and is deprecated for such
> usage. Since we're copying raw CPUID register values,
> memcpy() is the correct and safe choice.
> 
> Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
> ---
>  tools/perf/arch/x86/util/header.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/arch/x86/util/header.c b/tools/perf/arch/x86/util/header.c
> index 412977f8aa83..43ba55627817 100644
> --- a/tools/perf/arch/x86/util/header.c
> +++ b/tools/perf/arch/x86/util/header.c
> @@ -16,9 +16,9 @@ void get_cpuid_0(char *vendor, unsigned int *lvl)
>  	unsigned int b, c, d;
>  
>  	cpuid(0, 0, lvl, &b, &c, &d);
> -	strncpy(&vendor[0], (char *)(&b), 4);
> -	strncpy(&vendor[4], (char *)(&d), 4);
> -	strncpy(&vendor[8], (char *)(&c), 4);
> +	memcpy(&vendor[0], (char *)(&b), 4);
> +	memcpy(&vendor[4], (char *)(&d), 4);
> +	memcpy(&vendor[8], (char *)(&c), 4);

Why not:
	cpuid(0, 0, lvl, (void *)vendor, (void *)(vendor + 8), (void *)(vendor + 4));


>  	vendor[12] = '\0';
>  }
>  

