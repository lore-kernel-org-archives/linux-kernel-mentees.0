Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEB617C211
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756225416; cv=none; b=farRywFSmr7+L6u5xMnSFvnYJ65j7I4sby0l3MSNPIyheiOE0vA27Zrbm7UBW1FvRZUA1Xk0wPovOCMC/Tuz4iqBIJ3tuo56TvIM4bqvEaNrVIQWiQ2pQAGOw7BaSMLiJpIc1pYCPlhLx1/JLz7sqUb3CsfnmTNj/gIuvt9mcC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756225416; c=relaxed/simple;
	bh=Z/fHLdraDHvbPNoiSuB2MHL7U8X5376cBP4TN8AruJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9YL46eTf74uQIfaCR/8b9smXjRf8NVA+aeFdnE+0VSj4zsfLl02NLFyRyUvpo/CdYRjv8+CE/t4aWvqm4y+5GGxomNCWhbXngQgbm7YcgQC2D6g33T3OX0e99yV81yCe37vMc08MuUCUKXwQgPbaf+VyS5hd7qlMEQDDreFC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYI6d4Yn; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYI6d4Yn"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3366de457a5so20939151fa.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 09:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756225413; x=1756830213; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aYFk7sq5CM2dSodTk0DRa46bB7zw/9j1RzjFIhceTA=;
        b=fYI6d4YnKIx75nTCnt++b8j5Ft865E5f2BFNmbt8hc9rG9n1zwi5EjdHjFN6DJbvEo
         ViFrYccr2lbORAtGv2jU4nxjvmMZ8o9CmEYWWfrsOs4BmbX/b8DWhOxQyOlquR8FqEW1
         zpRnes/tWr0AmWW2D6Klsi3QNafW0WjlU53l2aE9WTMdwJduMNxj8gcEHn8JC6rbT7QW
         rkkdEz5oDw7An2u4MN5hYzQCWQHHE/gg70JkdaG53vFxbMAbmtc+hqRZf7f/FIVR9ggh
         98vEIXDDRBXECT4ZJ8+r3UWsYE9ONJVot2EirRYo5r3JEU7I7TTQkv5D7+YWAHhXdUqE
         tITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756225413; x=1756830213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aYFk7sq5CM2dSodTk0DRa46bB7zw/9j1RzjFIhceTA=;
        b=uiFu1KMwlfv7LthENbud+SIOnrwwj88o66r2Dy5CoBJM9+KJ090De8CROvBS3lT3o6
         LJXytbdbEDoP+xaqWd2/p7AXUuuqb3iWc7B3BMYii3uocxFmiwPeDVzYiPQyWyxviJcs
         cwZ95q67YDBv38qPQL2bmVuJBuK50f1c8RVVga8HWDeJ94s6LFy4756jFZ3TdutMCgYd
         UqqRewEkX98vNJuaCl4sVvL/fuj/fH2EZYZNmPJWb7muSfuCHMvA2Lcwu3VLXn2galr5
         DeTF3kJuR5ve/4qDmkVnASejuLYD8yqYroYw/MdVaF6o/Sqkax4R0HvwAHrJBZYPnPBM
         DA0w==
X-Forwarded-Encrypted: i=1; AJvYcCVF4urm+MoQ2uxA4967Y4UWNswSK+Jr6LRVNpw/SGj4R2gQp/eE3kiAhSp+0nTohj7io4WDdlmMN/WgahU2ze7R644TbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWzOOWZhn+elGrBhRzEqTdxGjQZPvlaplnkGt8duQ206M9iLG2
	lJG9RX+5TRfbS5nxG7vY2jBCKwXSQcRxGk9cHmgiVGLAr2AQq+HtTGQoxK/k7/cZH8ZQSKDurMu
	yJVNMruC3AFtJE4T1ldlKtsFMJ2msaso=
X-Gm-Gg: ASbGncsl6soj/KIProuD2dEGMhGMlMQ7J/wVZAe1g9QnhNF5j+4vAzueVkeATwQrZxA
	jWCabi4DWDsdQS7XhS+WhUsON3cQC6yhFC4JPwlWsSj7guju1qIcjGopcucvaK0P0SHKDbm6ffu
	xZ9JsD44Tvkw5VzpFADRfRXDj2RWJEByVj8cEMBDRwxgzCAmH9Zd8w6WhFlIBvgl/FcALtSdI+n
	zpEwGGEUFtHtqfiMwkCgZPFzYTOnSz1ygIFSfI2Og==
X-Google-Smtp-Source: AGHT+IFY8gu/RrCyr3edgcmpVM4R2w44fG9KMd2O0YJMqKVLqnlWjuRIpRapn1ch7o9iKR+T1hVRKcHiM4nMmDW1D0I=
X-Received: by 2002:a2e:a54a:0:b0:336:89dd:41ba with SMTP id
 38308e7fff4ca-33689dd43ebmr8627441fa.9.1756225412701; Tue, 26 Aug 2025
 09:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730142301.6754-1-pranav.tyagi03@gmail.com>
 <CAH4c4jJ8VywRUfn2z8HnA73vNxviZ53DZttcR3JaPULF3JFkQA@mail.gmail.com> <aJOG-IAmYhjoYVf-@x1.local>
In-Reply-To: <aJOG-IAmYhjoYVf-@x1.local>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 26 Aug 2025 21:53:20 +0530
X-Gm-Features: Ac12FXxDQE7gyOdZYAnPp3w1u4iY3ylCUDIqHFUVWVKzr1Z2KPlM4NdLcQSO8Lw
Message-ID: <CAH4c4jLsFNzBEhCQVSCT43tZjbf5wp88xU_5BXnN+4t5CxU52A@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: use __auto_type in swap() macro
To: Peter Xu <peterx@redhat.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 10:16=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Aug 06, 2025 at 09:15:50PM +0530, Pranav Tyagi wrote:
> > On Wed, Jul 30, 2025 at 7:53=E2=80=AFPM Pranav Tyagi <pranav.tyagi03@gm=
ail.com> wrote:
> > >
> > > Replace typeof() with __auto_type in the swap() macro in uffd-stress.=
c.
> > > __auto_type was introduced in GCC 4.9 and reduces the compile time fo=
r
> > > all compilers. No functional changes intended.
> > >
> > > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > > ---
> > >  tools/testing/selftests/mm/uffd-stress.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing=
/selftests/mm/uffd-stress.c
> > > index 40af7f67c407..c0f64df5085c 100644
> > > --- a/tools/testing/selftests/mm/uffd-stress.c
> > > +++ b/tools/testing/selftests/mm/uffd-stress.c
> > > @@ -51,7 +51,7 @@ static char *zeropage;
> > >  pthread_attr_t attr;
> > >
> > >  #define swap(a, b) \
> > > -       do { typeof(a) __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; } w=
hile (0)
> > > +       do { __auto_type __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; }=
 while (0)
> > >
> > >  const char *examples =3D
> > >         "# Run anonymous memory test on 100MiB region with 99999 boun=
ces:\n"
> > > --
> > > 2.49.0
> > >
> >
> > Hi,
> >
> > Just a gentle follow-up on this cleanup patch. From what I could find,
> > this is the only use of
> > typeof() left in the mm selftests, so this should be the only instance
> > needing this change.
> >
> > Thanks for considering!
>
> Hi,
>
> Andrew should have queued this one in branch akpm/mm-nonmm-unstable (even
> though I'm not familiar with the branch).
>
> Said that, I'm also not familiar with __auto_type.  Looks like it's more
> efficiently processed by the compiler in some special use cases, however
> it's also new so maybe some tools (sparse?) may not recognize it.
>
> Is it the plan that the whole Linux kernel is moving towards __auto_type?
> I still see quite a few of typeof() usages (not "a few", but 2966 instanc=
es).
>
> Thanks,
>
> --
> Peter Xu
>

Hi Peter,

Thank you for the feedback and I sincerely apologize for the delayed
response.

You=E2=80=99re right =E2=80=94 this patch was initially queued under akpm/m=
m-nonmm-unstable
and it now lives in the mm-unstable branch.

The motivation behind switching to __auto_type is twofold: it reduces compi=
le
time across compilers and improves readability. Support for __auto_type has
been available in GCC since 4.9 (quite some time back) and in sparse since
v0.6.2 (2020). To the best of my knowledge, it has since been widely adopte=
d
by toolchains.

That said, I acknowledge there are still many uses of typeof() in the kerne=
l,
as you pointed out. My intent with this patch (and a few related ones I=E2=
=80=99ve
submitted) is to encourage more consistent use of __auto_type, starting wit=
h
selftests where it is already in use in several places.

Thanks again for your review and for pointing out the current branch status=
.

Regards
Pranav Tyagi
