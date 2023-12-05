Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A6D6D1D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  5 Dec 2023 21:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QAUL9it/"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4C861413
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  5 Dec 2023 21:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA4C861413
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QAUL9it/
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0QDIXuUrx3Y
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Dec 2023 21:42:14 +0000 (UTC)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A877D61411
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  5 Dec 2023 21:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A877D61411
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-67aa9a99915so26432386d6.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 05 Dec 2023 13:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701812531; x=1702417331; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6YS5yNlvl+FKFyGS3DIWxbNX8VWKvkEW8slTswnooc=;
        b=QAUL9it/hSY1WxGrRqGHigf8A1t18ZZ41wnXAupIbZClIpzLigApc3b9g9K5lngeSC
         PeX0K5LumAYek72unTq7EO0hWiOX4d3W1UZfH32crRe3O9y0pI4IY9LxuS5mVqQ1ia1j
         kT3VcIidsWS2qBGcyN0Ur1ICShnv7dtAiGLKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701812531; x=1702417331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6YS5yNlvl+FKFyGS3DIWxbNX8VWKvkEW8slTswnooc=;
        b=qqYRaGNkTi0pPdbosAIc+tKjGnzSt/Ocuf1a6sK7SLgEqhLO6WU4eav5pG+g+EPCA+
         /f+3OiqtlRd3xMP4vwh6YpNKpZ37U0gVlQVuWbyMgGl17SuNEZLbcZfNG/HtT9rBYDN5
         ZfKljs0BzCWz8sg5Ivgmw0kOAiJNQi4UgE91mXI7gnoAkHTcPThvdiwdPM4kTV3JJcLz
         V9+whIdf4eKnDDpXZdJy8hMNJf70EKydColHloPQ7FC/wHEQ0FRmUt0mJWEI73vjjP3O
         B4Wm1jYPo6uIO6gtA8nsUKc7bwlDfIwCh30k/qFv/0yrrkXSs6nT3IoEcEyv1AntIdhD
         nsew==
X-Gm-Message-State: AOJu0Yx/ItBabYn1EodAd8why6vErwrUoYuZZegfYT6SU6PzWXgA4RsX
	+mlwjVH9dHiBkK1x59er/A2Se107shbfMAmEwU1uoxti
X-Google-Smtp-Source: AGHT+IFMHtDJAHPvWcGFrCSc45R4Iwq+j4ov5b/jzXxNcPR3NpXC7A/eii8z37u0y/tl5Dq0xMCVbQ==
X-Received: by 2002:a05:6214:1082:b0:67a:a721:d772 with SMTP id o2-20020a056214108200b0067aa721d772mr2027154qvr.88.1701812531528;
        Tue, 05 Dec 2023 13:42:11 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id e6-20020a0caa46000000b0067a581b5a4dsm3253502qvb.86.2023.12.05.13.42.10
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 13:42:10 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4255cc2bcdaso30001cf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 05 Dec 2023 13:42:10 -0800 (PST)
X-Received: by 2002:a05:622a:4ce:b0:425:4823:f9a3 with SMTP id
 q14-20020a05622a04ce00b004254823f9a3mr60587qtx.2.1701812530294; Tue, 05 Dec
 2023 13:42:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <GV1PR10MB6563DC208657E86715361E94E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <GV1PR10MB6563DC208657E86715361E94E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 13:41:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XpK0T-oPi2Q6-9jELFseSsvgkFtRuXP1LXK6PbV_MwCg@mail.gmail.com>
Message-ID: <CAD=FV=XpK0T-oPi2Q6-9jELFseSsvgkFtRuXP1LXK6PbV_MwCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] trace: kdb: Replace simple_strtoul with kstrtoul in kdb_ftdump
To: Yuran Pereira <yuran.pereira@hotmail.com>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-trace-kernel@vger.kernel.org, 
	jason.wessel@windriver.com, daniel.thompson@linaro.org, rostedt@goodmis.org, 
	mhiramat@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 19, 2023 at 4:10=E2=80=AFPM Yuran Pereira <yuran.pereira@hotmai=
l.com> wrote:
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
> ---
>  kernel/trace/trace_kdb.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
> index 59857a1ee44c..3891f885e4a6 100644
> --- a/kernel/trace/trace_kdb.c
> +++ b/kernel/trace/trace_kdb.c
> @@ -96,23 +96,21 @@ static int kdb_ftdump(int argc, const char **argv)
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
> +       if (argc)
> +               if (kstrtoint(argv[1], 0, &skip_entries))
>                         skip_entries =3D 0;
> -       }

Similar nit about braces as in patch #1. tl;dr is change the above to:

if (argc && kstrtoint(argv[1], 0, &skip_entries))
  skip_entries =3D 0;


>
>         if (argc =3D=3D 2) {
> -               cpu_file =3D simple_strtol(argv[2], &cp, 0);
> -               if (*cp || cpu_file >=3D NR_CPUS || cpu_file < 0 ||
> -                   !cpu_online(cpu_file))
> +               err =3D kstrtol(argv[2], 0, &cpu_file);
> +               if (err || cpu_file >=3D NR_CPUS || cpu_file < 0 ||
> +                               !cpu_online(cpu_file))

nit: why did you change the indentation for "!cpu_online(cpu_file))"?
It seemed better before.

With nits fixed:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
