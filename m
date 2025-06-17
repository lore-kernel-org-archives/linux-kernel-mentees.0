Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836582E7177
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166619; cv=none; b=cyMa0nzJ1DnheUcvgYh5RgmyADh0mghpnQvPZFtKrS7cDwGNSqV9uyiF2HDWqbpB4tOsxnR42vb10dvYXUgQ6IzdXHzV2/xT5wtXSm/qWOKScg9ZDZR9rhK7T3Ty9PjFZX4UJ5W0i4E3TCnqPQhFQhGGiWmNXuTEbOnoFXqIu6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166619; c=relaxed/simple;
	bh=aq+jLmLEZueUREtaCloPI8dNoT19sceodfbAKjhjFCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIdSW7XlExN9Sl1X9V4CWRMq2ivcf8mtwdiDNwMhi4fbbvHtdeKCLdXiB736iPupOjDyHcN4OuUBteuLKWUU96gzKO2yY5Dxq/MrP0Q+tt05b+WmLifYEwyltAgwyw/h559jOWZbSyC/ZAbu9dgELE++ZpZNznMNyQqPQPamv7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSuu4gOv; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSuu4gOv"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo11081812a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 06:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750166616; x=1750771416; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da7GngsMQn+NCqkD4TvMnzofO+IHiaf6PmzIm2w+GkQ=;
        b=WSuu4gOvXD8eh98ZYIPKL49TUYiRvPlkmxVr2JVDxSLPQUDqnvtMweVgBoqIEjGTKw
         XHiQ6oLRrKS8gyKSvyRaHsIVQkWOcqH2bPU+nnYOaMJfsXxSh7JPijOYRE5oUL4XfJ+5
         VKEoUqzZN8nXgg9QODuD2AZZ00yhuF21lNLKkU2KxH8fp+NV/mS5IAzDVwKvwNoBoc9j
         cz3EUDEkoxtQJuefVQdWqu89gmezqMg41uAm0jlJJ3ve3ruEZnswumDPotxQGGNxK1aV
         WLmzmmlpiCYRVHFLPt6/2R291H41T//N6Nwo9ZH1WXSdkgceLda7ZBF8i12Bnwnn8Mld
         O/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750166616; x=1750771416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Da7GngsMQn+NCqkD4TvMnzofO+IHiaf6PmzIm2w+GkQ=;
        b=hc91+Vat2CVUY67b0hDa93UgQIfWjG1QpdEIfueg6NOtsm0xAotP+3So+ed1jnkfFt
         4hxE0/kSm3KBrECLNPBmQK3WSVb4B43PewfC2WyCE0klU0qENjyX+pPAngDhdNyebcOe
         Q+X9TWuDbEUDsrZ4Jn9ZPVTAP15bO+oxv8rW0K0QRDeb+K/CpbKEIOh2GEUWF598+pm6
         U85lLr1gP9l6TV1uOohw5ZYoCsbw23OmGc6B9k5oZ8BXzM/TlALxRfmFx473d/bfQ06/
         UxE0HYx7H6SkJj2GXBweWRoTriNaRX+xpz39rg4ixKOcq5cmZk2mtBrfvmjP3ng20b/s
         oiSg==
X-Forwarded-Encrypted: i=1; AJvYcCXE14WWHc1W3/MQgVB8u4sGNJxanQH8PHWb140bxqvh4HIPIW46YUgN6RXQfiUat+Mz9PUrWunPdQrM2LpCSCsCXyYuug==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHwrgJ8DAqyw2nTfuP45RueI1uO9xAjziRXY7ndrrh0r9409rp
	qKAeEa8NQenDIfqerX6QuTiyxUYqL4QyaaS7UfWt7Ib952XT7AlUuwuxfHQLtvTCi45cBZV6+X9
	YEAQQVaCiM3IetGOmqKYNizbja7CcYO4=
X-Gm-Gg: ASbGncs4On/t/MGmxbFaJjR+SkbKzI4f13BetTEUXpofcITIwgTlq58C84uqFenCbzX
	5OOTy9FcviCI1ijre5aJiYyf1maocdJBv5tkY+VIdPFT0Gi+zDIe5YJnK33m8s7CBOgiCwayi7k
	TI63jHSsUooW5WSoHsdaGl6ZBtPEfn7+ez5DF7nqtJ501nbuA1ch6BCXewcVRGvclizS4HzY95U
	OCE2t1w/QY1kCsA
X-Google-Smtp-Source: AGHT+IF35zRDouRKgsl23iu8Ip8Af2QD0L6RBLQ4Z6LxvD9CFO2X76jNFfDTlSdWniAE8FphyNnG7TzaPsay7oaHoT4=
X-Received: by 2002:a05:6402:510c:b0:602:3e3:dada with SMTP id
 4fb4d7f45d1cf-608d0977a42mr11931446a12.25.1750166615605; Tue, 17 Jun 2025
 06:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250616110313.372314-1-pranav.tyagi03@gmail.com> <2025061610-basics-attendee-cd02@gregkh>
In-Reply-To: <2025061610-basics-attendee-cd02@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 17 Jun 2025 18:53:23 +0530
X-Gm-Features: AX0GCFvpbJIGp1gRUpPgvLsO-IJEhIBlsBKcgaCSHrIHCpbktmH_xOFexTbviFw
Message-ID: <CAH4c4jLn78OYPqqEESh6vRhxfD8s=J8a-cX0WzVE1bEPKVAHEg@mail.gmail.com>
Subject: Re: [PATCH] fs/xfs: use scnprintf() in show functions
To: Greg KH <gregkh@linuxfoundation.org>
Cc: cem@kernel.org, skhan@linuxfoundation.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 7:50=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Jun 16, 2025 at 04:33:13PM +0530, Pranav Tyagi wrote:
> > Replace all snprintf() instances with scnprintf(). snprintf() returns
> > the number of bytes that would have been written had there been enough
> > space. For sysfs attributes, snprintf() should not be used for the
> > show() method. Instead use scnprintf() which returns the number of byte=
s
> > actually written.
>
> No, please use sysfs_emit() if you really want to change this.
>
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  fs/xfs/xfs_sysfs.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/xfs/xfs_sysfs.c b/fs/xfs/xfs_sysfs.c
> > index 7a5c5ef2db92..f7206e3edea2 100644
> > --- a/fs/xfs/xfs_sysfs.c
> > +++ b/fs/xfs/xfs_sysfs.c
> > @@ -257,7 +257,7 @@ larp_show(
> >       struct kobject  *kobject,
> >       char            *buf)
> >  {
> > -     return snprintf(buf, PAGE_SIZE, "%d\n", xfs_globals.larp);
>
> There is nothing wrong with the original code here, you could use
> sprintf() and it too is ok.  So this type of change is not needed.  But
> again, if you really want to, use sysfs_emit() instead.
>
> Same for all the other show() callback changes you just made.
>
> thanks,
>
> greg k-h

Hi,

Thanks for the feedback. I understand the original code is
perfectly fine. All these show callback changes were intended as
cleanups. I'll drop these patches. And will use sysfs_emit() if
I ever have to.

Regards
Pranav Tyagi
