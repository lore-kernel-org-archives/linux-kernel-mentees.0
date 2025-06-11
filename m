Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F95265608
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651494; cv=none; b=k/VxOJCZsnkvsLtMliXWO2oTjpogqb0FzTWYg+HgyXODow6sjPog5HV6afhqSFfuzErH0YmuwV7cw1UtB5UGoF9RiGynb/exORVi9WDj6ICQbYJkF3sAAIum0v9vkK9xse6TzULDOfj88iFgWVIHT39gR2G/qwXyfddS/LT74wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651494; c=relaxed/simple;
	bh=lQ5H38hc2yWWodWSuje7NKKY2ujQtmIDJ1T3piilQ3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3Z1MGHdDGUQDpy9Ah4tJdi819c+5HUD6P8GbaBBVSF2nsv33eT8m79g0folw3s6Tqz7kwPVKsGKzyx9KMCOhhz1rFUJpYBy5ccjSBxViyMcugv9VWHt3uff5QUobtbpOt5K6Z4/U0QTGQC0nV1Sejg97gpX2EsuQd7hht32jXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STtleKLa; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STtleKLa"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32a658c4cc4so56585761fa.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749651491; x=1750256291; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JHyDDVL96PT69+HIUFTlQwzyTVvaxPDQBDHlKvb0lw=;
        b=STtleKLa971DLozEAEcxWPiMP4gwAaIln/8vKTGCsq2vI6TgS9Y5AGQ7ghl6JBnIG7
         JHVvTCue+DJTNdkQ3ExZu6bnZAHs8WST09PPvhc95roULGm+DazkrE7INyoz3V5egHKd
         fEuxStxQum5TpYyagPz2bTo91lyeWF/ntXWKW+rViK1ax++qfC4xwIaeAv/MA6Q6lAWW
         6qf67p6t8TYoAt1ohiJPHcVwxZsoVxLqa15A8TMsqUnBTStwKssQ05UJ/FF6yJcaHZ/i
         5aOzNuv8nXd4i5MvNsPjBxUVZGFSMGTtyVBymWy3vSvJUPzBGlp6HyubK0t3JL9YVxvg
         Y98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651491; x=1750256291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JHyDDVL96PT69+HIUFTlQwzyTVvaxPDQBDHlKvb0lw=;
        b=GiStk737kENosEcDxKuYo8ioqdbyaPZdqS5OtxBXGclbcYv/QWMA8OpNJnho2iL/kT
         KFPbfrbejWTpm0bP+1vK7eSB/Ea/+gLNamRch4pRqwMypJPNIU4F5KLl1drWe4yd4DOK
         TBOiUHS1At1EgGLX1Vp6GSU7vxMyJ24hz0deooJCdVT6PfYNl3Fc7XizII9NEWPU5IPS
         /SO6Ks8nevVaT+qamIpq8MPYSPJEECtc32a02vj0gZ+wd//g+NuWbPisNk0kDaulEYt8
         7ZkD82EPIQjh9NsM1yoPAfXv+dMmASrwaGbk7k8JkOSwwZsVwMwgxfc354Nhrv41+vMj
         vrSA==
X-Forwarded-Encrypted: i=1; AJvYcCUD/nEAXf40wOD4F7M1jguIaupFmuy7Ww+vcxOdYa2d+tirOnTtJw1EcjuaeHk/w9ra6wWuzrXbKeu8lNhsEol5F3NwWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJsphJB4vT4MrUH+lziGAnKrQAC1Q7HV2n8qrl5nCbVOvM0Twa
	XELZAQlkITJyOxR5atY5mxPHknSA3N62uyGKD3PBPjLKZH9kmZUumf3aj7P5iPjbsm23YY7yJM+
	Ew6bbmq8KjtuXTKgqZdSKgPk3tuQEkUw=
X-Gm-Gg: ASbGncs54dv4SP/K+CPETwGZDn+RxMCIJZT4zK4d54WE9DlJR+ZqzG+gp0rAAYkIuex
	OLu/2MkUhAApOr9juf46dmoylTUinpXqCVrK02FBD/m2qNoSkEtLctIs0esTcuxZJQWGHs824a7
	BBGOO7NtDyJHLLHrchqr4daz723a6rux9lShQJYx7n6yj4nuTAjSmtj6W7RuEGlccZQQvYVdaQf
	Yc5Rw==
X-Google-Smtp-Source: AGHT+IEw99JZ3Ni2MxwdgIFYpOqtbrPsWWAib83ZR7Rw9sZS3Aa6YYdAkawHMQmcsqGznXxBoTb+QwWK6QtF+QGgKHM=
X-Received: by 2002:a05:651c:221f:b0:32a:74db:fe73 with SMTP id
 38308e7fff4ca-32b21de3f22mr11802421fa.28.1749651490434; Wed, 11 Jun 2025
 07:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250607082844.8779-1-pranav.tyagi03@gmail.com>
 <202506092053.827AD89DC5@keescook> <decv7f4drznbeoyjjm7ixlsgmu7ust4fltwwlnbltdjcvmhtbk@5qreij76z7jn>
In-Reply-To: <decv7f4drznbeoyjjm7ixlsgmu7ust4fltwwlnbltdjcvmhtbk@5qreij76z7jn>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 11 Jun 2025 19:47:58 +0530
X-Gm-Features: AX0GCFu4sDFJ8r-fSsh6QpnCWFxzSyxmgew_3nZ6MvQ-4CtPA9tGvltGmTDudag
Message-ID: <CAH4c4jKD1TdpyfUXxvz1F_-ONTbKC=4z2V0iH4rGCBgYv0-Kxg@mail.gmail.com>
Subject: Re: [PATCH] binfmt_elf: use check_mul_overflow() for size calc
To: Jan Kara <jack@suse.cz>
Cc: Kees Cook <kees@kernel.org>, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 1:29=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> On Mon 09-06-25 21:04:36, Kees Cook wrote:
> > On Sat, Jun 07, 2025 at 01:58:44PM +0530, Pranav Tyagi wrote:
> > > Use check_mul_overflow() to safely compute the total size of ELF prog=
ram
> > > headers instead of relying on direct multiplication.
> > >
> > > Directly multiplying sizeof(struct elf_phdr) with e_phnum risks integ=
er
> > > overflow, especially on 32-bit systems or with malformed ELF binaries
> > > crafted to trigger wrap-around. If an overflow occurs, kmalloc() coul=
d
> > > allocate insufficient memory, potentially leading to out-of-bound
> > > accesses, memory corruption or security vulnerabilities.
> > >
> > > Using check_mul_overflow() ensures the multiplication is performed
> > > safely and detects overflows before memory allocation. This change ma=
kes
> > > the function more robust when handling untrusted or corrupted binarie=
s.
> > >
> > > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > > Link: https://github.com/KSPP/linux/issues/92
> > > ---
> > >  fs/binfmt_elf.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> > > index a43363d593e5..774e705798b8 100644
> > > --- a/fs/binfmt_elf.c
> > > +++ b/fs/binfmt_elf.c
> > > @@ -518,7 +518,10 @@ static struct elf_phdr *load_elf_phdrs(const str=
uct elfhdr *elf_ex,
> > >
> > >     /* Sanity check the number of program headers... */
> > >     /* ...and their total size. */
> > > -   size =3D sizeof(struct elf_phdr) * elf_ex->e_phnum;
> >
> > size is unsigned int, which has a maximum value of 4,294,967,295.
> >
> > elf_ex->e_phnum is a u16 (2 bytes) and will not be changing:
> >
> > $ pahole -C elf64_hdr */fs/binfmt_elf.o
> > struct elf64_hdr {
> >       ...
> >         Elf64_Half                 e_phnum;              /*    56     2=
 */
> >       ...
>
> Ah, what confused me was that I somehow thought Elf64_Half is u32 without
> checking it's definition which clearly shows its actually u16. Thanks for
> checking it! You're right that the patch is pointless then.
>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

Hi,

I understand that the patch is actually pointless. I am still
new to kernel dev and learnt a lot from your comments. I will keep
this in mind while sending patches in the future.

Regards

Pranav Tyagi
