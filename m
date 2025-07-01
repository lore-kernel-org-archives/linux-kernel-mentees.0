Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BCC279359
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  1 Jul 2025 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384543; cv=none; b=qa9iQLJIG/a1CFaHNB4gVvlo47JRvF4j47GC5yKZ8tE+++OT23/Ed15ydiKb8M2WS2pLCjU30sFYeWWFNhT8e7raW4Dr4O+u5yXDuRrI3kYzEL4Gy9BOmVJrDE3eEJwtgpPciNFKeHQB4JOJbMjO/MxeyMDgqMoUrrlI+R8GAfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384543; c=relaxed/simple;
	bh=sF+03HSIwOXlAgwN7PqRptlDGeBLCm7jygWo/KrfNno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCpWsxXPqdE9M34DEbhHieIQmPm92tq87CqnkdBpVFwN/RouIUQg4AhbssZzqFE4yIvzCa0awayWN/Pf+FNSA9tSzesCUOQ0CI5WRhVuCNVeCdWnLGgsZ4bBA+lHXm6dBt5T3TNYoP7DCb8vn3uSmRdDKkpfD0wMfrqu9EjaFIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X10mYXMl; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X10mYXMl"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so2091773e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Jul 2025 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751384539; x=1751989339; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBlCZ1mA0p0uhuNGCxCL9ZQiCr3I3i6VKn9TZEgMOuw=;
        b=X10mYXMl84MVjXc/aCpa+h0HLkgz7DVtwhurHk61FbtuWyGQcuxJVS5H2gIxyFufAo
         04unMJhtGLVsjcbiHFPbWWf2FjrDnKeR42NDT2nHa1D+EXVTBhrIyAW8BJIOt2lrFcwN
         pFFGzgMI/rUC1yPX8J5B7FidXHUaBSgCp/aiKS3zh5BJBF4TG2VwccNRwwL8aWVtbx01
         wiLj21mzAPJl1zKnrpYc/hUOcjwCj7EccLTsy9ajsguVzIPE/258aR6DcugVNtVsGnr8
         7wr6OyovSQMyxYKu1kpZEC3ga51ZRgwNkpt8KTyhTlSk5syD6tibzkcEwEerZo0m8MYJ
         6CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384539; x=1751989339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBlCZ1mA0p0uhuNGCxCL9ZQiCr3I3i6VKn9TZEgMOuw=;
        b=E3cZYZv58Qie5JJ0C4hEejqyNCyyJ/WzfqHG1gb7dzmCI/vPeVaSQ+gEw+0D4v3SJk
         kBW4KyQG7vAAfPg3X0StPN8uc6t6caSi+XxIRKTLQ+lipGWxQTZLptoCJmESYrSRUnb8
         yfz7NXw/cZ2RvAZYjd600pL6MLkWCRgSimXmZYveqeCG24zhsmlnLboP9dKOCKna/AX/
         dVgEfDbBTThpjLX+DzOZDEoaUwYoQ6O4PAOScT0KJ75NqagUiZm7WYNjlDWG4GSispZt
         4lvbXWech2xHrLWRg1Wiv128bf3PIG/2lM7hO+/gl6Wyz1wZMqx/UOlq3qvYp2Nbe8y1
         Shxg==
X-Forwarded-Encrypted: i=1; AJvYcCWHGsHShWrIL1PAUUoU39qqG2WE2c24yhLdWU4A6PQ7dLN+eJGsormSsCfDJG2qDFkugjogqCK/MK0zYdh+L0wVMiEMbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yws7rlXmyIBr68LmHtQtKnfT3ImedY78ZnEC9vaoiwecnbGfqmJ
	fMOcjqeB8wBkPVIDXTR5sccNg1/GPiWQMkTJa3zInobkU1t7rnqBGLLKwEoS7JIdMQkFDzG4/TC
	hxFO4Tgse2+8sH3xz+jwMjQNKcCCvnj+OGDNPCSSHs9zb
X-Gm-Gg: ASbGncuVdvFJmaPvMwhJWhjB06EsD+Krb83RvmtsnNUZQc58V6CftJP0HRGUmcmviIE
	BbE+zymMoW7LDJiOW+XzrdGcZBqy9NauWRA8HHqnS3Qbew9UgbROjgaxwslkIBKJXd/lurbKfTn
	W9VzQDsfv4/5ZHZ1hCu2qGDEBuAqOIyPkJj+99uxPc9NRt4SXYxUm0PK921GyUaa6QFvYMVXVUD
	pKdu966xHdFlsk=
X-Google-Smtp-Source: AGHT+IFKyvLywVbvPp4+IAYsLJGN1A/FzeH/GkeWu1Ic03hmzkh8su5WzJzIbXEv994J37Qscka0Vjyh57qSWmJkoZs=
X-Received: by 2002:a05:6512:3b2c:b0:553:3892:5ec3 with SMTP id
 2adb3069b0e04-5550b8d861bmr5647623e87.46.1751384538989; Tue, 01 Jul 2025
 08:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BgUaxdxshFCssVdvh_jiOf_C2IyUDDKB9gNz_bt5pLaC8fFmFa0E_Cvq6s9eXOGe8M0fvBUFYG3bqVQAsCyz3w==@protonmail.internalid>
 <20250617124546.24102-1-pranav.tyagi03@gmail.com> <qlogdnggv2y4nbzzt62oq4yguitq4ytkqavdwele3xrqi6gwfo@aj45rl7f3eik>
 <CAH4c4jLjiBEqVxgRG0GH37RELDp=Py3EoY6bcJhzA+ydfV=Q1A@mail.gmail.com>
 <ldak3a3zmqlkv67mjproobt4g7pe6ii7pkqzzohd5o5kyv64xw@r63jjlqzafzp>
 <CAH4c4jJcyA+=x5y3BrW7dQkWOM3bVTepH0W16cm+_CLqHr4hfw@mail.gmail.com> <20250701145736.GE10009@frogsfrogsfrogs>
In-Reply-To: <20250701145736.GE10009@frogsfrogsfrogs>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 1 Jul 2025 21:12:07 +0530
X-Gm-Features: Ac12FXz-FW-denQLRxG_NjlT4YvYBBzn0GPsDDvTMYDJxmt6df0KudTNSR6YHqY
Message-ID: <CAH4c4j+N0OrdmeeEUALKE+fQpVZjWNHegFMPTq2DmotSmBtsdw@mail.gmail.com>
Subject: Re: [PATCH] fs/xfs: replace strncpy with strscpy
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Brahmajit Das <listout@listout.xyz>, Carlos Maiolino <cem@kernel.org>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 8:27=E2=80=AFPM Darrick J. Wong <djwong@kernel.org> =
wrote:
>
> On Tue, Jul 01, 2025 at 02:18:12PM +0530, Pranav Tyagi wrote:
> > On Mon, Jun 30, 2025 at 7:48=E2=80=AFPM Brahmajit Das <listout@listout.=
xyz> wrote:
> > >
> > > On 30.06.2025 14:36, Pranav Tyagi wrote:
> > > ... snip ...
> > > > > >       spin_unlock(&mp->m_sb_lock);
> > > > > >
> > > > > >       if (copy_to_user(user_label, label, sizeof(label)))
> > > > > > --
> > > > > > 2.49.0
> > > > > >
> > > >
> > > > Hi,
> > > >
> > > > Thank you for the feedback. I understand that my patch is incorrect=
 and
> > > > it causes a buffer overrun. The destination buffer is indeed, alrea=
dy, null
> > > > terminated. Would you like me to send a corrected patch which uses
> > > > strscpy() (as strncpy() is deprecated)?
> > > >
> > > If the destination buffer is already NUL terminated, you can use eith=
er
> > > strtomem or strtomem_pad [0].
> > >
> > > [0]: https://docs.kernel.org/core-api/kernel-api.html#c.strncpy
> > > (Description)
> >
> > Thank you for the suggestion. On going through [0], I see that,
> > both, strtomem and strscpy require the src to be null
> > terminated. As far as I know, sb_fname buffer has a size of
> > XFSLABEL_MAX (12 bytes). This means no terminating NULL
> > for the src. So shouldn't memcpy() be the right function to use here?
>
> memtostr_pad?
>
> --D
>

Thanks for the suggestion. memtostr_pad fits perfectly for this use case.
It takes care of null termination as well as avoids the need for separate
zeroing. I'll update the patch accordingly and resend it.

Regards
Pranav Tyagi

> > > > Regret the inconvenience.
> > > >
> > > > Regards
> > > > Pranav Tyagi
> > > >
> > >
> > > --
> > > Regards,
> > > listout
> >
