Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C43D6E5AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  5 Dec 2023 21:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G/kE90A3"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C71FA61414
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  5 Dec 2023 21:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C71FA61414
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G/kE90A3
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOMN7-P8kSqe
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Dec 2023 21:42:05 +0000 (UTC)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	by smtp3.osuosl.org (Postfix) with ESMTPS id ADF45613E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  5 Dec 2023 21:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF45613E7
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-67a8a745c43so2010476d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 05 Dec 2023 13:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701812522; x=1702417322; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUoV3c5EcqzGgFazFRODspx6X9OPb/ruYMRTuRufHkE=;
        b=G/kE90A3i7wkmZktvK6eHDSAdtaL6y3z3i5QOPFKKXJ2qSrEIAGgp1AXqRtR+6Hsvo
         EWV2egt13ISAgRjSQyXIL0c9i9hJaH9ZvHfCW3tCUoFManAZak1528uBG5QC3rXirkzx
         Igdx7u+t1mhmTiIX817LGgz/hM1b3ZtUkbPtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701812522; x=1702417322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUoV3c5EcqzGgFazFRODspx6X9OPb/ruYMRTuRufHkE=;
        b=pmXzjLzU+FajJ15wX8w6/uci5QfLOmsSYzOQ0zmUsgDVUjWITKz4utntQPCmP+K8Wo
         f+YzEna/6lANaE2mCwL+mbQOxGzmTXGQ7wQZYZ3+CvVM3gJiCasq+qDHrY6Uwkt94hBt
         lqcC92zRUg1hZJ+tZIOT2d4KLQanjlCtDgQTb6d7wg/zYN746ooyDJIftJlzQQ3NFeZY
         AyLqMOQ1gD7bKocHeL1KWyqlLB8uNs7+J4w7FhxmoTD52hC2WNEZ1kVutqdI+9m1wJ22
         Ayt2fMfQQuMjZYPK7tZiVxAgQ5wujkys4q3WuomLYgxitK6jN2ohfqeMXJ32J0NNlYua
         czng==
X-Gm-Message-State: AOJu0YwFI2VqjY8jbsRZj3/QZXt4yI1bu0N1cvSIui60Bmw7Gjr3RL4u
	wT9Wq4j4+3JB6+y+aAi/SyOmXIE1x4ggu2sNvuqIIpGF
X-Google-Smtp-Source: AGHT+IEHMLKqLSGKMhPjdif9fyYJ0GUeAj7n/zS9YVNRlkod62aqeMk70GBXeXU26nN5YM4uSAiuVw==
X-Received: by 2002:ad4:5d67:0:b0:67a:a72d:fbb7 with SMTP id fn7-20020ad45d67000000b0067aa72dfbb7mr3042550qvb.53.1701812521824;
        Tue, 05 Dec 2023 13:42:01 -0800 (PST)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id ay11-20020a05620a178b00b0077dbdc40458sm5412294qkb.1.2023.12.05.13.42.00
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 13:42:01 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-423f28ae2d0so30111cf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 05 Dec 2023 13:42:00 -0800 (PST)
X-Received: by 2002:a05:622a:247:b0:423:babe:75f1 with SMTP id
 c7-20020a05622a024700b00423babe75f1mr7180qtx.17.1701812520401; Tue, 05 Dec
 2023 13:42:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <GV1PR10MB6563E0F8DB2D335BD9CFE4D3E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <GV1PR10MB6563E0F8DB2D335BD9CFE4D3E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 13:41:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VZ61XFb1Ks79BHr1jL1jwf_36wYXryy0ZXOz1xTQ9zOg@mail.gmail.com>
Message-ID: <CAD=FV=VZ61XFb1Ks79BHr1jL1jwf_36wYXryy0ZXOz1xTQ9zOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kdb: Replace the use of simple_strto with safer
 kstrto in kdb_main
To: Yuran Pereira <yuran.pereira@hotmail.com>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-trace-kernel@vger.kernel.org, 
	jason.wessel@windriver.com, daniel.thompson@linaro.org, rostedt@goodmis.org, 
	mhiramat@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 19, 2023 at 4:07=E2=80=AFPM Yuran Pereira <yuran.pereira@hotmai=
l.com> wrote:
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
> ---
>  kernel/debug/kdb/kdb_main.c | 70 +++++++++++--------------------------
>  1 file changed, 21 insertions(+), 49 deletions(-)

Sorry for taking so long to review this--it arrived in my inbox at a
bad time. A few minor nits below that I think should be fixed before
landing but overall I think it's a nice cleanup. Thanks!


> @@ -412,42 +412,21 @@ static void kdb_printenv(void)
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
> -               val =3D simple_strtoul(arg, &endp, 16);
> -               if (endp =3D=3D arg)
> +       /*
> +        * If the first fails, also try base 16, for us
> +        * folks too lazy to type the leading 0x...
> +        */
> +       if (kstrtoul(arg, 0, value))
> +               if (kstrtoul(arg, 16, value))

Not new to your patch, but the above seems like a terrible idea to me.
What that means is that:

kdbgetularg("18", &value) =3D> value is 18
kdbgetularg("19", &value) =3D> value is 19
kdbgetularg("1a", &value) =3D> value is 26

Bleh! If someone wants hex then they should put the 0x first.

I'd suggest a followup patch that removes the fallback for the lazy
folks. Here and in the next function...


> @@ -2095,15 +2074,11 @@ static int kdb_dmesg(int argc, const char **argv)
>         if (argc > 2)
>                 return KDB_ARGCOUNT;
>         if (argc) {
> -               char *cp;
> -               lines =3D simple_strtol(argv[1], &cp, 0);
> -               if (*cp)
> +               if (kstrtoint(argv[1], 0, &lines))
>                         lines =3D 0;
> -               if (argc > 1) {
> -                       adjust =3D simple_strtoul(argv[2], &cp, 0);
> -                       if (*cp || adjust < 0)
> +               if (argc > 1)
> +                       if (kstrtouint(argv[2], 0, &adjust) || adjust < 0=
)

My gut reaction is that some sort of build bot is going to come and
yell at you about the above line. Even if it doesn't, it's a bit
confusing. You're passing a pointer to an int into a function that
expects a pointer to an unsigned int. Most things don't really care
about signed/unsigned, but I could swear that some compilers get mad
when you start working with pointers to those types...

In any case, I think everything would work fine if you just change it
to kstrtoint(), right? I guess the other option would be to change the
variable to unsigned, but I guess that doesn't make sense since it's a
modifier to "lines" which is an int.

Side note: I didn't even know about the "adjust" argument, since it's
not in the help text in the command table below. I guess that could be
fixed in a separate patch.

nit: IMO if you have nested "if" statements then the outer one should
have braces. AKA:

if (a) {
  if (b)
    blah();
}

instead of:

if (a)
  if (b)
    blah();

...or you could do better and just change it to:

if (a && b)
  blah();
