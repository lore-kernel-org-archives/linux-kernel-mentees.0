Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DE3FB39
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m3uzU04/"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D614041E77
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 15:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D614041E77
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m3uzU04/
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sAt47n9lJdDC
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Dec 2023 15:17:48 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9457341E6F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  6 Dec 2023 15:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9457341E6F
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ca0715f0faso47238201fa.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Dec 2023 07:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701875864; x=1702480664; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZJM1Env+eEXFazDQzwu0LsFevasaND9E0B7qCoSTyU=;
        b=m3uzU04/FRhaQ8SnzKQRrOOciywfQNaZBMmp1hrLJFouPgHoXYe5dTHj6rHVpHMbys
         9Wg9OHpW7Tksmoos9Pg3NOCvTXOw3+RvGWDSW96AkTemiVjBlioE8e9a4jB65CL2zgIj
         2qVRWQLPgGBCYXRqqHdcqzFQCeb9WFAluEY28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701875864; x=1702480664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZJM1Env+eEXFazDQzwu0LsFevasaND9E0B7qCoSTyU=;
        b=nyXwmnDKVeSFVwNh+CeD+CpZJ4sHgkmZTDbmgdlAeNvO11mVtNSvY0nBwr848Sjwv9
         uIZCu5jg2Q7sctiGtzSt4iGB88kyBnpMUMuPZJwacgrDM9rR7pnb7ZSgg+P0ZD42/usl
         nyrWV7LbQ2GXmGlYpRu3i/TgI1lc3ApzD/+v7C+LLBmxe1svFzvbHvqpBOP/tLn2cuDg
         OvTMT96llppxrt+chEAk8B+xwmjKDeE1mFEMLYJPqL3G1+Yabucgs5bjMTwWzKn64Abv
         UFIMGaGiwX71ic2bzMQWwSF0WIKtZZum5sHfYk5RayfWfpTCGz6D7OZTPm7J9lG3ii3v
         tZew==
X-Gm-Message-State: AOJu0YwooZSo3lxjbRjLhaSebwEg96BZkMn4rTorKl7GJhyiQ/6Guju/
	bY8ODRfryfAninkdLEXSY9Ob/6Nl0YKhxv3ExJRH8eIg
X-Google-Smtp-Source: AGHT+IFnk5o7zGDxG/kMVEGLYe4jvwvsuamylhlhQeqx3p9mG+XAZSOzQeXwJU5jtfgw27gL6unBBA==
X-Received: by 2002:a2e:998c:0:b0:2ca:a19:f21e with SMTP id w12-20020a2e998c000000b002ca0a19f21emr715994lji.80.1701875863557;
        Wed, 06 Dec 2023 07:17:43 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id mp25-20020a1709071b1900b00a1d32dfacb9sm51538ejc.38.2023.12.06.07.17.43
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 07:17:43 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40b51e26a7aso62315e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Dec 2023 07:17:43 -0800 (PST)
X-Received: by 2002:a05:600c:3b22:b0:40b:4355:a04b with SMTP id
 m34-20020a05600c3b2200b0040b4355a04bmr89811wms.6.1701875862555; Wed, 06 Dec
 2023 07:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <GV1PR10MB6563DC208657E86715361E94E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=XpK0T-oPi2Q6-9jELFseSsvgkFtRuXP1LXK6PbV_MwCg@mail.gmail.com> <20231206113753.GB81045@aspen.lan>
In-Reply-To: <20231206113753.GB81045@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Dec 2023 07:17:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W7K5d8Dg+W5qaB_Kg8LuzMdMFEKZ2FfFC3qp2xAPMfKA@mail.gmail.com>
Message-ID: <CAD=FV=W7K5d8Dg+W5qaB_Kg8LuzMdMFEKZ2FfFC3qp2xAPMfKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] trace: kdb: Replace simple_strtoul with kstrtoul in kdb_ftdump
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Yuran Pereira <yuran.pereira@hotmail.com>, kgdb-bugreport@lists.sourceforge.net, 
	linux-trace-kernel@vger.kernel.org, jason.wessel@windriver.com, 
	rostedt@goodmis.org, mhiramat@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 6, 2023 at 3:38=E2=80=AFAM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Dec 05, 2023 at 01:41:57PM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Sun, Nov 19, 2023 at 4:10=E2=80=AFPM Yuran Pereira <yuran.pereira@ho=
tmail.com> wrote:
> > >
> > > The function simple_strtoul performs no error checking in scenarios
> > > where the input value overflows the intended output variable.
> > > This results in this function successfully returning, even when the
> > > output does not match the input string (aka the function returns
> > > successfully even when the result is wrong).
> > >
> > > Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
> > > simple_strtoul(), and simple_strtoull() functions explicitly ignore
> > > overflows, which may lead to unexpected results in callers."
> > > Hence, the use of those functions is discouraged.
> > >
> > > This patch replaces all uses of the simple_strtoul with the safer
> > > alternatives kstrtoint and kstrtol.
> > >
> > > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#si=
mple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
> > >
> > > Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> > > ---
> > >  kernel/trace/trace_kdb.c | 14 ++++++--------
> > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
> > > index 59857a1ee44c..3891f885e4a6 100644
> > > --- a/kernel/trace/trace_kdb.c
> > > +++ b/kernel/trace/trace_kdb.c
> > > @@ -96,23 +96,21 @@ static int kdb_ftdump(int argc, const char **argv=
)
> > >  {
> > >         int skip_entries =3D 0;
> > >         long cpu_file;
> > > -       char *cp;
> > > +       int err;
> > >         int cnt;
> > >         int cpu;
> > >
> > >         if (argc > 2)
> > >                 return KDB_ARGCOUNT;
> > >
> > > -       if (argc) {
> > > -               skip_entries =3D simple_strtol(argv[1], &cp, 0);
> > > -               if (*cp)
> > > +       if (argc)
> > > +               if (kstrtoint(argv[1], 0, &skip_entries))
> > >                         skip_entries =3D 0;
> > > -       }
> >
> > Similar nit about braces as in patch #1. tl;dr is change the above to:
> >
> > if (argc && kstrtoint(argv[1], 0, &skip_entries))
> >   skip_entries =3D 0;
>
> Surely that should be:
>
> if (...)
>         return KDB_BADINT;
>
> There seems little point switching to a "safer" API if we just ignore the
> errors it provides us.

Ah, sure. I have no objections to that. Note that would have also been
possible with the old code, which did still do awkward error checking,
so I assumed that it was a conscious decision. ...but I'm definitely
happier with the error being reported instead of glossed over.

-Doug
