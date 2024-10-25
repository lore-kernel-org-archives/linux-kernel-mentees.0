Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D1D214406
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 22:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729895522; cv=none; b=dg4UW45iCS/SnSEyGlYFQ/S4+SUutFhPGo3P/vl7j52zV5fDKUok1FQgjSc5JgYJ2mAtCbcWQL5cC55juDJgo72gll9XOnfBBnN5ouQ0stfAG+CtsPrkL5jmEt6lmaYxG0dMREvsjUUmXHn14BBufKusG5iPyrLYIyikZtwlf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729895522; c=relaxed/simple;
	bh=Pmgxmkz/+mibX3Vvf+b416HY3mbxrWVnMpirkRa95Xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pibuHfN8z56cuhVwrGJMKkcD5rkjhoAZqDit8cgvIvxdmXu0GNbKKGQmRaCUbTWtNhVlNVAd0q5PTsPdnECun8Tes9MLirBrIZYHUku4w3Soc+gxQ/tJspaiiuZOV71NUuXmKfIdbtxEn6T8QiAsGwXOgnEPu9vnSvlqY7BeRFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cd1uTYZh; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cd1uTYZh"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FB0660AF6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 22:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1HrUaXyz54Z for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Oct 2024 22:31:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D9B760623
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=chromium.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D9B760623
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cd1uTYZh
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2D9B760623
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 22:31:56 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539e690479cso2623041e87.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 15:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729895513; x=1730500313; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+pu9+IFniI0vxwrFMTIumDSK37smBdwK2XEoZEbtTA=;
        b=cd1uTYZhAMZ4q+W9OGTUli4EP3xIGELh8hACL4YRUmkVTmMWaVps/R//Dc+A0HNGYU
         woFeLxvMSWKo13oK7RkERGxlR4qgddH7QiWLwr1IozYNzyM7S/RQ1WURnUI80cncdi8q
         sQLSkIWxKf4vDFLP27CK78b9XcT1zoXsRCBlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729895513; x=1730500313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+pu9+IFniI0vxwrFMTIumDSK37smBdwK2XEoZEbtTA=;
        b=vyQ4c1qLR+wCtB8JSFrPldosUtthhZxlkjZaD6zUlj5NiQPpTHcegr64pq8B8FJQl3
         s+eqTbFDOcw6fR7NOySVIfo4OkRzVdMvpXHxisWxMTrDuF+1r1yhPli+n7MP+KcyoU+6
         scHHe/GDwcKXbc8MtpkzHe5I8RYqGHYbEGEOzsOfgNUJUVW5CK9DUku/t96nqomXrDHN
         fqiHTp4CeJF75jRXU7nPat+AU8znsJc3i4EKL+v7TLMa6WxVnKv4LSVzgksnTCF0e36S
         GSNl7XB42nYKylQZDd5HvwhRdu64b47seXhXXr6AI2KmIzk6CrXSJgIQ8ry7neO7xGC5
         8ehg==
X-Forwarded-Encrypted: i=1; AJvYcCX/ec8bcjbNlqAHf1ftxPhWjjGWwXkcc5QCkUV4KZLUGo1zNvVwcof0Na0sT+QSnlwckkLl6Lkh6SqfDRIDEDJSxbOv2g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwTE8D2nGfVvnJHUvwMoHeasikELpaOnzlUvzb3Bc4PFOPboHnL
	zJR/Uu5ftqXagG6XFjpTK7auFufJJ+VwOVTNb+6lNpPXpXYqvVlqT4jiigp6w9vLQo1ecE4opZH
	CRw==
X-Google-Smtp-Source: AGHT+IFqd76WIFb9SZlld/NBscNyKDh5PAEWNmtDNwl6TtoZeacF/MbZAAIIm3ue6Nf4sao1VcPhjg==
X-Received: by 2002:a05:6512:118e:b0:536:a533:c03a with SMTP id 2adb3069b0e04-53b348cf91amr374700e87.17.1729895513156;
        Fri, 25 Oct 2024 15:31:53 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a36esm331287e87.16.2024.10.25.15.31.51
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 15:31:52 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso26025331fa.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 15:31:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOEzav1GMTMch8VizIc2gJH3rGrCKKTGRd51RofGzd4QiZgNVMyWGbHSwhFsefNYbXJ8rO9C/oQzKbu3CeF4268wunIQ==@lists.linuxfoundation.org
X-Received: by 2002:a2e:612:0:b0:2fa:d4ef:f222 with SMTP id
 38308e7fff4ca-2fcbe0a8fa2mr2908991fa.38.1729895511516; Fri, 25 Oct 2024
 15:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241021211724.GC835676@lichtman.org>
In-Reply-To: <20241021211724.GC835676@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Oct 2024 15:31:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+sGVF91WFDpB9cdXboCnL1NX6nZ4z2qE_ctYqZ0sNkw@mail.gmail.com>
Message-ID: <CAD=FV=X+sGVF91WFDpB9cdXboCnL1NX6nZ4z2qE_ctYqZ0sNkw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] trace: kdb: Replace simple_strtoul with kstrtoul
 in kdb_ftdump
To: Nir Lichtman <nir@lichtman.org>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-trace-kernel@vger.kernel.org, 
	yuran.pereira@hotmail.com, jason.wessel@windriver.com, 
	daniel.thompson@linaro.org, rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 21, 2024 at 2:17=E2=80=AFPM Nir Lichtman <nir@lichtman.org> wro=
te:
>
> The function simple_strtoul performs no error checking in scenarios
> where the input value overflows the intended output variable.
> This results in this function successfully returning, even when the
> output does not match the input string (aka the function returns
> successfully even when the result is wrong).
>
> Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
> simple_strtoul(), and simple_strtoull() functions explicitly ignore
> overflows, which may lead to unexpected results in callers."
> Hence, the use of those functions is discouraged.
>
> This patch replaces all uses of the simple_strtoul with the safer
> alternatives kstrtoint and kstrtol.
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple=
-strtol-simple-strtoll-simple-strtoul-simple-strtoull
>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> Signed-off-by: Nir Lichtman <nir@lichtman.org>

I have the same comments as patch #1 about authorship and noting what
you changed.


> ---
>  kernel/trace/trace_kdb.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
> index 59857a1ee44c..eadda6e05526 100644
> --- a/kernel/trace/trace_kdb.c
> +++ b/kernel/trace/trace_kdb.c
> @@ -96,23 +96,20 @@ static int kdb_ftdump(int argc, const char **argv)
>  {
>         int skip_entries =3D 0;
>         long cpu_file;
> -       char *cp;
> +       int err;
>         int cnt;
>         int cpu;
>
>         if (argc > 2)
>                 return KDB_ARGCOUNT;
>
> -       if (argc) {
> -               skip_entries =3D simple_strtol(argv[1], &cp, 0);
> -               if (*cp)
> -                       skip_entries =3D 0;
> -       }
> +       if (argc && kstrtoint(argv[1], 0, &skip_entries))
> +               return KDB_BADINT;
>
>         if (argc =3D=3D 2) {
> -               cpu_file =3D simple_strtol(argv[2], &cp, 0);
> -               if (*cp || cpu_file >=3D NR_CPUS || cpu_file < 0 ||
> -                   !cpu_online(cpu_file))
> +               err =3D kstrtol(argv[2], 0, &cpu_file);
> +               if (err || cpu_file >=3D NR_CPUS || cpu_file < 0 ||
> +                       !cpu_online(cpu_file))

FWIW, this is still changing the indentation of the second line in a
way that makes it worse list like v1 did [1]. :-P The "!" in "!cpu_"
should line up right under the "e" in "err".

That's a pretty tiny nit, so I'm OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

When sending v3 you'd want to keep Masami's Acked-by tag and my
Reviewed-by tag. They should go just above your Signed-off-by tag.
