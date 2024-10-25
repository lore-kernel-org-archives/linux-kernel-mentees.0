Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB6E1D2B03
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 22:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729895509; cv=none; b=dxgWaqYTzRtuUw9y0J/eN0NmQku0eHaEV6t0S2qpeV8VebbrdA7chjJjluKvq+vOWbYqtsE9mJapduYpwwWRuwS2sDevhCNr376J/6cJWuyYUtMR793dhak92VVZ2cc7ZMe6VqCaavlnT7HaMSwiSacHk9G8QZsK8osN+hHxkEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729895509; c=relaxed/simple;
	bh=NkHx6XgJkMV6CszYdB/P297/hMHuzzGQvrdB5FeGWxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O46my8devpA65AidncBMNfgIrHIukQs3g9o7IT8D7jqAZV5oQbXUbHjrwVu5mgtqqR4Enbnf418hJBfYiM1+xrhPmgWGwH5WFOoRhN0UYdKmkqZvNB/FFWEW2Btvm72x+FmkVHU4NOG4K05UVk79B5FdlTDo7z3op2iNE/ChsCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T6aa8w6e; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T6aa8w6e"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BF8F80B0C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 22:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWegvcnrmn7A for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Oct 2024 22:31:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D208680AFB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=chromium.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D208680AFB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=T6aa8w6e
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D208680AFB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 22:31:45 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53a007743e7so3139640e87.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 15:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729895503; x=1730500303; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFr8zCuXx7Qa1HYksDWyqy8DL1qhBnHCzBZwSDddfWM=;
        b=T6aa8w6eyRqxTMYqbomAgKes5x2dTHr+ww1h5YSIoNa6sa3T1GLFFQ6iTExw8wnkXj
         pnWyVJd+T7uzHyoE1aQwjDb8buvY0Bn4Xa6gLNYS2BN5BgoiQFj3lkQL76JX95ihG3Zc
         fEhAW1YdihiK+bF3nDcQAO/32WBk+TuQyXYKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729895503; x=1730500303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFr8zCuXx7Qa1HYksDWyqy8DL1qhBnHCzBZwSDddfWM=;
        b=bYhWtKzYXC0C8qtJ0JHfNJTOEKlR2CXEO8aC+eddntfSjWu8Y6/0j6BpkRqJU7LZYZ
         Q5ifA68itG/LpKseXgrNv+tGz3K1K+YVzVzgkgsA+ukxGi1wTsiyh5mTkHC9uQO02u7q
         orZ0b5wl04qf4AM3FZyyKX7TP6VEWFnKwPcLWc0XybozCDc/TttpTXFlkv3jfif4Xny/
         MM6yfMsvCz3V9Jk6//k5JR8gG0qaQV7ST4EgbuhudkilLOVDUhNETF7seZv9lAbyqPo8
         BqUviK88sTFcXkmoKDP3BB6PCvzKz073k1A4EtII9f2AWlKIuaDUdkR5c3lah+hZBT+y
         LrSw==
X-Forwarded-Encrypted: i=1; AJvYcCVbxsoLhBx/ZDG+dX2gngC8fUHRwsriWaEkB8Qihm2bEWGOX36M2y8lLZXKn6oB3cWO1u5oJWd6UWg0GR+CEFTzpmxyGg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxUqrKlYmkozrHqQUztcsYyj2ZKLu6hU69Z6cS3QhMVVDbzb6jG
	RIjI3mUyP2zf1+devo8OFN+GImkEnQya3BMYQld9y7OAzl3ouZFj7/wsBjNjh7GARHVMRiFLlrF
	cOQ==
X-Google-Smtp-Source: AGHT+IHp6TkqWCSLSn9n7/GoQmcLLyIO11AjoDKmGsIh7goFFVGbWr/XkzIW6jEH9XtKz9UUBHekEw==
X-Received: by 2002:a05:6512:3f07:b0:535:6a4d:ed74 with SMTP id 2adb3069b0e04-53b34b370d4mr395051e87.51.1729895502914;
        Fri, 25 Oct 2024 15:31:42 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a630sm327731e87.53.2024.10.25.15.31.42
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 15:31:42 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so21587251fa.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 15:31:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU30wkSnxZ16War62PjGBxHgKfxUTsiyaEbSvIFgiPD417esmJUhHonrusOSELcSWcpB0Atpk2unNgNJm4jm9Jqc2/fsA==@lists.linuxfoundation.org
X-Received: by 2002:a05:651c:b09:b0:2fa:d604:e525 with SMTP id
 38308e7fff4ca-2fcbe077e48mr4065661fa.28.1729895501542; Fri, 25 Oct 2024
 15:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241021211451.GB835676@lichtman.org>
In-Reply-To: <20241021211451.GB835676@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Oct 2024 15:31:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJsUZ1+v5Rd+Pcx+3tO18ivgax4i8XfRg2BZJ_OEEu+A@mail.gmail.com>
Message-ID: <CAD=FV=WJsUZ1+v5Rd+Pcx+3tO18ivgax4i8XfRg2BZJ_OEEu+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kdb: Replace the use of simple_strto with safer
 kstrto in kdb_main
To: Nir Lichtman <nir@lichtman.org>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-trace-kernel@vger.kernel.org, 
	yuran.pereira@hotmail.com, jason.wessel@windriver.com, 
	daniel.thompson@linaro.org, rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 21, 2024 at 2:14=E2=80=AFPM Nir Lichtman <nir@lichtman.org> wro=
te:
>
> The simple_str* family of functions perform no error checking in
> scenarios where the input value overflows the intended output variable.
> This results in these functions successfully returning even when the
> output does not match the input string.
>
> Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
> simple_strtoul(), and simple_strtoull() functions explicitly ignore
> overflows, which may lead to unexpected results in callers."
> Hence, the use of those functions is discouraged.
>
> This patch replaces all uses of the simple_strto* series of functions
> with their safer kstrto* alternatives.
>
> Side effects of this patch:
> - Every string to long or long long conversion using kstrto* is now
>   checked for failure.
> - kstrto* errors are handled with appropriate `KDB_BADINT` wherever
>   applicable.
> - A good side effect is that we end up saving a few lines of code
>   since unlike in simple_strto* functions, kstrto functions do not
>   need an additional "end pointer" variable, and the return values
>   of the latter can be directly checked in an "if" statement without
>   the need to define additional `ret` or `err` variables.
>   This, of course, results in cleaner, yet still easy to understand
>   code.
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple=
-strtol-simple-strtoll-simple-strtoul-simple-strtoull
>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>

Since this was Yuran's patch originally and is still substantially the
same, keeping their sign-off first was good. ...but:

* You should have kept Yuran as the "author". This should have
happened automatically in your local "git" repo when you picked
Yuran's patch and then made changes. If it didn't you could manually
set the author with "git commit --amend --author=3Dblah". Even if it's
right in your local repository, though, it won't be right when someone
applies your patch. This is because when someone else is the author
the first line of the commit message is supposed to be "From: Original
Author <their-email@address>". Your message doesn't have that so when
I grab it it looks like it came from you. If you use a tool like
"patman" or "b4" to post your patches (or even git-send-email) this is
handled for you.

* When you take someone else's patch and make a small change it's nice
to mention what you changed in the commit message.

If you want to see an example of where I took someone else's patch and
posted it, you can see:

http://lore.kernel.org/r/20241004171340.v2.1.I938c91d10e454e841fdf5d64499a8=
ae8514dc004@changeid

...though maybe ignore the fact that I managed to accidentally add a
Signed-off-by for both of my email addresses--oops. You can see that
it has a "From: " line that patman/git-send-email added for me and you
can also see my mention of what I did:

[dianders: rebased to modern kernels]


> @@ -402,42 +402,15 @@ static void kdb_printenv(void)
>   */
>  int kdbgetularg(const char *arg, unsigned long *value)
>  {
> -       char *endp;
> -       unsigned long val;
> -
> -       val =3D simple_strtoul(arg, &endp, 0);
> -
> -       if (endp =3D=3D arg) {
> -               /*
> -                * Also try base 16, for us folks too lazy to type the
> -                * leading 0x...
> -                */

In my original response [1] I suggested that the removal of the base
16 fallback should probably have been done in a separate patch (in
other words change this from a 2-patch series to a 3-patch series).
That keeps the "cleanup" patch separate from the one that's changing
functionality. It's not a huge deal but it would be nice if you could
split it out.

If, for some reason, you didn't split it out then you'd certainly have
wanted to mention it in the commit message of the patch since it's a
change in functionality.

[1] https://lore.kernel.org/r/CAD=3DFV=3DVZ61XFb1Ks79BHr1jL1jwf_36wYXryy0ZX=
Oz1xTQ9zOg@mail.gmail.com/
