Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4528F19C54B
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822810; cv=none; b=PJDtjt6Et+EkcXu4w5c0lHZdsegdjjx8X3hI9Sw8biAQ/ZGo7oXhYBL/W7XsYuxk74tntWy7JfWBc1Z718lD3Ee0cmcoRm03yshtC5VO8UV1F4fOKAULZS/cWrlWyFR1vPolOOeQtCJviMjmCJrJ1cCcSlxmTPDNkaXbMmVtog8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822810; c=relaxed/simple;
	bh=KUZfzfZsPE24PRLfx/DqXRXx6K0jTqrrFaXznX8oEdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kutt72tMspojQUbvmjBCjtnKxlg9dy/3FKFO1gra2yS3PijpUQRQ97Ty3ezDxSTQ2rh3w5qZ4yrX5FFVbEhgjz1HqHgDC/QWDSt67Jj4qG/MzN/LPHmszrWzgeaJRClnhizxflPmz8dxTF5WD6vt4/GQKdM9NMWu0Wx6FsT9dkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4kffyXt; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4kffyXt"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553543ddfc7so2165916e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749822805; x=1750427605; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujtinyWtMOPXsq5wXbPCOHOmFoKO1rUWjgdXnoqJksw=;
        b=E4kffyXtXhQ63I4tIirO8tiisKLHneOUS0PsgcA9ODm0+0avgfxmIVxSyjPaYyWzri
         HQMc3vBEhzKWnSh/f7r2LxZ+sELsl6KIxEH4dRpi/sqVqi2yhjbut6OXy3SFD+vjknOK
         6zHPpVnHdF1neQgi9+s2VFCf/XatW6P9lADD4pMjlRzicXIiMQaZXh7mAGFZTsuhbbGU
         wksmNpY0i5/yIxY0RKdlaPa3ZMIHzpWujPK0OpwQibdvE6GwAJzPK4smzfjyn+C/t9s3
         bRZXEr58+JPyq6fi9b2kngwAx1LyfD0yjPKa6B53i7srGKT49gIAZGtwx85kiTvZox+r
         tHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822805; x=1750427605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujtinyWtMOPXsq5wXbPCOHOmFoKO1rUWjgdXnoqJksw=;
        b=osjzfK5oWBaBSS6O3Vq1k8mM/wODzSCIDvKsUhk9A9Zfiy1BXBtxR5hvRSXF+9La3F
         w/kLpryw4qSY84OzLsQCanRaXX6EuAB2XrJpVNeW7bnYVtQTv7XWIcf7r6r5xMf4jHIk
         p/FxoWJF1j+SgaXQt+CR8ZBrNAYyWcSuDatDYtyZjGCnDeY7zgOMBl/tVc3q0ZhoL/Jx
         2EQ8HWYgWpWUt3CNcS7qQ0nUcXn1d1yPUd+zvtpmxgs18MZ+mWc0zSE9UJ4i3AXv6+zW
         XUswmYDjDeCH8z+Wb6gLglSxjJYenamJ1SEPKq1kFkoNOLPUA2cN6Ft4MSnZNjDPpVcw
         WZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4X+qR8N2EDgKFG/jRMTOjt03iXUdohRGDiWnmQOdhgJk59VAuX/a2mMH8WheqAftRi8JeTuQyMw72ZaAIUH7BeEwcNA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yybu72wQxFD2sXF3HdXaOrEqCwH8MO4TKIQsPl0nzKxZ1r0Tg3F
	YLgzH1HbCKGkKGLkNdKqqkDLVOlpL+nK9ahYir3Ss+W28j+hKjK/pO6eXFZnWnciEai0mj6DIAi
	ksTbGwWomKThGGCNAormLlHCpvkdvP4Q=
X-Gm-Gg: ASbGnctzm1CQ54ZHSbzD3qYVt/qK9AwcybVIGhygHTn3GcqJGmBZ9zkv67TtlRHJZA2
	m9d3xozynb00nuWgS7/QcHESJweSP212XNzOPzCPUoycAajT6R46ICergv/5Agcz2r1GSn5PApz
	d1KV7qId3jfffeI3VWbaJCh84OYb/j3OYyFr/hLyad44rqhkiviFSRcHm2V8QCugjFIP5IcsBuL
	wZwAOZ6c1XnxLGH
X-Google-Smtp-Source: AGHT+IEl9qUXSspxpoaRt1cWqMw9LrrkgkBou8E8RGmOH7wcmz4yJUesGfCY+Lzvcz6mFzDt9o/Pi/NbzEKE8A2bXvU=
X-Received: by 2002:a05:6512:3ba3:b0:553:3654:3319 with SMTP id
 2adb3069b0e04-553af96da66mr960902e87.43.1749822805033; Fri, 13 Jun 2025
 06:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250607134114.21899-1-pranav.tyagi03@gmail.com> <2025060848-exact-sasquatch-a899@gregkh>
In-Reply-To: <2025060848-exact-sasquatch-a899@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Fri, 13 Jun 2025 19:23:13 +0530
X-Gm-Features: AX0GCFuGnNvyr6p72H6rynUnhfvQazx12X4BcJBVJRGB_9dMoCuBvt4-i8OKev4
Message-ID: <CAH4c4jLRcjceC2tynp5h9zFv9ev+usUrKO2Titnup1SPe_aNBg@mail.gmail.com>
Subject: Re: [PATCH] tty: replace capable() with file_ns_capable()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jirislaby@kernel.org, kees@kernel.org, skhan@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 3:55=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Sat, Jun 07, 2025 at 07:11:14PM +0530, Pranav Tyagi wrote:
> > The TIOCCONS ioctl currently uses capable(CAP_SYS_ADMIN) to check for
> > privileges, which validates the current task's credentials. Since this
> > ioctl acts on an open file descriptor, the check should instead use the
> > file opener's credentials.
> >
> > Replace capable() with file_ns_capable() to ensure the capability is
> > checked against file->f_cred in the correct user namespace. This
> > prevents unintended privilege escalation and aligns with best practices
> > for secure ioctl implementations.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > Link: https://github.com/KSPP/linux/issues/156
> > ---
> >  drivers/tty/tty_io.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> > index e2d92cf70eb7..ee0df35d65c3 100644
> > --- a/drivers/tty/tty_io.c
> > +++ b/drivers/tty/tty_io.c
> > @@ -102,6 +102,9 @@
> >  #include <linux/uaccess.h>
> >  #include <linux/termios_internal.h>
> >  #include <linux/fs.h>
> > +#include <linux/cred.h>
> > +#include <linux/user_namespace.h>
> > +#include <linux/capability.h>
> >
> >  #include <linux/kbd_kern.h>
> >  #include <linux/vt_kern.h>
> > @@ -2379,7 +2382,7 @@ static int tiocswinsz(struct tty_struct *tty, str=
uct winsize __user *arg)
> >   */
> >  static int tioccons(struct file *file)
> >  {
> > -     if (!capable(CAP_SYS_ADMIN))
> > +     if (!file_ns_capable(file, file->f_cred->user_ns, CAP_SYS_ADMIN))
>
> As you now are affecting the user/kernel api here, how was this tested
> and are you _SURE_ this is the correct thing to be doing?  Did you audit
> all userspace users of this ioctl that you can find (i.e. a Debian code
> search) to verify that they can handle this change in behaviour?
>
> I need a lot of assurances before being able to take a change like this,
> for obvious reasons.
>
> thanks,
>
> greg k-h

Hi,

Thank you for the feedback.

I could not find any existing selftests specifically targeting
TIOCCONS. If there are any related ones, I=E2=80=99d appreciate it if you
could point me in the right direction.

Given that, I had to write a standalone functional test to exercise
this ioctl and validate the permission behavior with the proposed
change. I=E2=80=99ll share the test code and output shortly.

I'm also in the process of auditing userspace tools that use
TIOCCONS, using Debian Code Search as suggested. That is taking a
bit of time, but I=E2=80=99ll include the findings in my next update.

In addition, I plan to run integration tests with a few known tools
that rely on TIOCCONS and will report those results as well.

I=E2=80=99d appreciate a bit more time to complete this work and ensure all
bases are covered before resubmitting.

Regards
Pranav Tyagi
