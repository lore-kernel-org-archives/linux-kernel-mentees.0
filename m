Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5793122318
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 04:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749616326; cv=none; b=pe9fhqQEj1c9205x587ewhAvnGkuKEz2E7L3LiJDZZN7s3ySlFh6C8DG/evZJkmdkdWcTtcD131Qm2eTWe6UvjtKEGnL8lIx96hZGXI5RJG2kdOq0Td4VlSeFtGOVNJNRZlL2eT7pn853aeU8oH49oaYMhtupmWXxOyZcpKRPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749616326; c=relaxed/simple;
	bh=KD5tne7NfH27RUmHoUlUhEKf8zXcOCsLOGsfjG0lwuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVahaLPmVNk7R2JvmQGMkTT8i11ZlVeehdlOVAA3tkUX1QvEeNDkvcE912MjoZ35nysl4N2ukGyGjgUsQ3BRBcMRFdJoE9AhRlvE9bk3Jm3TYwLVbtF0Da6O2QN2mjREiO9En71IIwY6LgNr1QF4HavJaY6I6WKrB4zqZmKXYG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tiKM8p4j; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tiKM8p4j"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55342bca34eso6006984e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 21:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749616322; x=1750221122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL9LfPR1UDsljUu3ap7T7gEzE8IHpvCaq32ca1jGWQE=;
        b=tiKM8p4jFXEhcULY4aM3yw18ZtN6kdAnnQLuc0qYnY6SoVSQjhBTBy412lQmAktFBk
         H4Rsi9m5uHeuPIF8/rZchAG0bB7KMGjw1wrAnHbUV9FIxCUKOZk2mfHdcy1R2V5SXQUi
         /AHrHoniSsfVfD7VxEEsr2fXft9A250keh9S5yBfthOrmgPeeCH7oJ6noCQvBqn76zhz
         bPn7WhvLx0YACPfFwMYd6i28gwdMsCpSRmLY2vfQxdIr01xiEo8upZRif2jsnahmp4oe
         r5nQJ1zzib8QULvTsLsSFhnIVIGj6TQm9DVwKAeWm/Ab3jlQoholfJaYeWEK5VqrsKDx
         gzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749616322; x=1750221122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL9LfPR1UDsljUu3ap7T7gEzE8IHpvCaq32ca1jGWQE=;
        b=HPLORjcPZ7Zgi9Wguu+PLy/RJiOBWZqKOoUgBnON6AYWf6UtXxVL67EReC9xo5Otu9
         E0nVMIXJ6LBnICIJCgDwP49jWGodMNr61l1C/jsgWdzL/7U9VFuRjnYuyB4JjbMViKoM
         oXRbZ+v43nX/0VJvKqRU2tEXLdGomTjbDVGZOn2nGy4wvlWk7qgYcHGGxTVcmAxzeK7m
         QB10RbPC7ri7gMFblEi/eABAkb5lviO5KYZa5LGaEYGjMuWlR2Rpr6eeQ2ECaH8t6vk+
         hHoclc6gwmQliZtr81O8PkYfo2AzldhxFyen5hUxmzn3f4VkHuYk+4E50lVFZ/l9xPdp
         X0HA==
X-Forwarded-Encrypted: i=1; AJvYcCUKl9jLQZNtcGoStnX5xTP2OTFEXUl8jx8XohRG5eADxryp041JYMVcDq0lpr3lSI/p9ilXVvCPs9RiJs8xEr0ehYB6zQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwvW7rYjUiq1gOk4GDAxtfXu2X0PgRj+czN6lkOCEtE+tblBsJ
	keMdidu1XBgnm55bcSTbgsGpp8jPmwo19RXgXeXxI2vCbjXjYzg4rYMmtqXGZqSzYqMl3M97U6k
	bHNEh+cTIjRAb4wY8i94GbCoX6P+qOmjL7qgQ/4A=
X-Gm-Gg: ASbGncvKVe1rZpID7BnM39OxSonCrJqhOVNaHTgEi+SFm41ltg6mwQG1+H6lNeZAtxK
	DUDbZD15cNE57a3o/cHbcHLaktO24nmq2/q/pTGEpWO7ysmaveb8U9r0qnPqHbPEbwVaujisMZb
	sN14Ne+izM6KsK0xdmT6cX1xdD03rFDhbSlQoWDitXFKo/LGj2py06DkBcfe+ZlZE5my09sg4=
X-Google-Smtp-Source: AGHT+IF+eLURjL34b9LhdlVm1yiGreUeEEyPMLatR1DuHmNuUUlwHZReRsJ0XFguafsYyfYFcfAg21oieATnDGo9XRM=
X-Received: by 2002:a05:6512:1051:b0:553:3892:5ead with SMTP id
 2adb3069b0e04-5539c101c28mr480149e87.2.1749616321924; Tue, 10 Jun 2025
 21:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611033001.707396-1-richard120310@gmail.com>
In-Reply-To: <20250611033001.707396-1-richard120310@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 10 Jun 2025 21:31:49 -0700
X-Gm-Features: AX0GCFtwEX66J1E61TWrXB0nz4An5KF7EsQT8UufoLkQ82o1t7Byl1mU41rLhAA
Message-ID: <CANDhNCrez0=fKoH=1Kg6SG08yPmZ3q3N7rD+Dm3e8=-hHoj_6w@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource: Replace loop within clocks_calc_mult_shift()
 with clz-based calculation for sftacc
To: I Hsin Cheng <richard120310@gmail.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 8:30=E2=80=AFPM I Hsin Cheng <richard120310@gmail.c=
om> wrote:
>
> v1 -> v2:
>         - Refine commit message to explain more about "why"
>         - Check the frequency of "clocks_calc_mult_shift()" get called,
>           it's not in hotpath on my machine, refine the commit message
>       to avoid overselling it
>         - Add comments for the code to explain the implementation in
>           more detail
>         - Handle case for "tmp =3D=3D 0" to avoid undefined behavior
>     - Experiment using ffs() but it's used for finding the LSB of
>       a number, which isn't MSB as we want. It would still need
>       looping when intended to use ffs() in this scenario

Oh, apologies for mixing that up and leading you astray!


> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index 2a7802ec480c..59145d762f1e 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -66,10 +66,20 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 fro=
m, u32 to, u32 maxsec)
>          * range:
>          */
>         tmp =3D ((u64)maxsec * from) >> 32;
> -       while (tmp) {
> -               tmp >>=3D1;
> -               sftacc--;
> -       }
> +
> +       /*
> +        * Decrement "sftacc" by the number of bits needed to represent "=
tmp".
> +        * Using (32 - __builtin_clz(tmp)) to ge the bit width:
> +        * - __builtin_clz(tmp) returns the count of leading zero bits
> +        * - (32 - __builtin_clz(tmp)) gives us the number of significant=
 bits
> +        *
> +        * Note: It use 32 instead of 31 because we want bit width (0-ind=
ex MSB
> +        * position + 1), not just the MSB position itself.
> +        *
> +        * Handle tmp =3D=3D 0 separately since __builtin_clz(0) has unde=
fined behavior.
> +        */
> +       if (tmp)
> +               sftacc -=3D (32 - __builtin_clz(tmp));

Still think the detail that __builtin_clz only works on the bottom
32bits is good to highlight in the comment.
Though maybe, would explicitly casting tmp to a u32 help it be more clear h=
ere?

thanks
-john
