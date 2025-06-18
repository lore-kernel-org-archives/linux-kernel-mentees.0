Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892231E0E14
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Jun 2025 06:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228364; cv=none; b=abFI3xF7D/9TrvFZjr5uxaLT+1x952i9veBSTEsQF01SZAKUnT4T6AfLwr2F2bjvLNkrpv9LTldKEdOtlRbG+yqWhotarA0CRFVvFrlGkG7x8mze1thG6cKi+9FeBvjJop5TvJ3YskEU9wgqCoUNwBc9XAcSumXABDt9uGHVWIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228364; c=relaxed/simple;
	bh=Q6R9VpJK+yebI8V2UHdLDoGLpV7IjX7AVke6WGXxh3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGg1jBeekZRv23KfiNYED5YHbaqeliOgzYIe/bmMYjtF8h2HUWCNIAArIec4FYm7s42LmxX2dzg7UPsm1x8YQhCz3NR0JLSfptpi9rvDLKXRjKkaUKe52Pyng5sdy/pYsl7p52VUxgVfvkdthB1Y6uq0VHVdwRafxV+ZH6MU5Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqsIpqw6; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqsIpqw6"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553c31542b1so3087870e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 23:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750228361; x=1750833161; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bwqo1Tn/UI5NB53KqrvduG70MhvCcVKMdoEFHbfpgfk=;
        b=iqsIpqw6uL8zp74H3mBIZBDAhtw+NUbEyIGwX8iOltqmyjvziExRT+vmHP/Qq//MrH
         36RyxwE0obMpR+5QER57ijd1zElDQ88fz+AwNlD6psjkAmLoapIgTnGnG0pBeL7pNfa9
         VilzW2fg/JXZxczVKZV8ZP3OMe1A2siHpMW3ZAg9Gb00oHZ5sbXZ0xdppKKDnmk53f3C
         BKipMQozDCzuWBhBCdYLM34yYWYAs8L7CdHBAEc5xg8pJkEyAqN7heypUO8hLPuH4uyg
         RfU//eIQUM/zTVC9iMIDBF/ZNv7DPz2YbwT7mHPS0qis4LqmdMH8nvNDd7f239SYRiMK
         JKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750228361; x=1750833161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bwqo1Tn/UI5NB53KqrvduG70MhvCcVKMdoEFHbfpgfk=;
        b=jzsP0T4M9oAKYB1arIqZDWMYKaIlCyU2MHPThtb2tvvZAAnoZzLTZOLwhlW8Tb56hI
         3LgZggiH/bzsP3vJelWnuphxufo0ul41i87+SnR1h57fDy3SfEUfXDG4jbhj4bKApcMf
         LZzOqcmyMbXaFUY0biCXqgk6rg2wWSAW+s3Hx4eULm2P/pwQpbq8X4CPgJneorH4n58T
         blWUdkKf2yjYK6I8hnXZMb0bWgim3cbRLr5ma1Z9dj5hTGxkUKWk9Wzh1XD2gqxIN76R
         /7aPYfxd4MtrabGhotkv7cw4zUTUY/M1PQReYcKuwRydqMPtalBnoq7qsy4Cgi4diRxP
         1tKg==
X-Forwarded-Encrypted: i=1; AJvYcCWy6AxZ/WrzpOTYpd1hsh2g/CZ1MU0JNsEtgIAoQyzea6kKT4IaLOoyxkpDk/i4DeefDp0+kbZVoBt8HY/HAreb2UNSCw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy57TmWtQHsr0cyyrr+ryaVaZ4cwWyZynO0E3ocmb69NkSWguLX
	oGlDZ/ShKXS1AHw84oBSPuE0dTL6pu4ACXgEXuxXr0SidLJ+F92StAnc4+CN0+kjdCdi+qEblfy
	DaUqD15TXwrSnkSGAX6ipIrk+X1OQcUI=
X-Gm-Gg: ASbGnct0CJRwAXqqUh8SCqnd0TUEVEaWp/7MEfL/QVyKBH2CtAu+p6gdQSkJ2Z1YDqO
	lYHXXjVB9XkFIO7JOkNpCQLoCPRy2skmuPa17aGZrdYpYcECqEroxxhC62yL5r/v6tAeQj6rwix
	pCB/fW97kAGOwis0kpgG6PcMbZVzcaWBHPrT4axfxlLw3kLdL2U6yyqbfeUAfLx8YIubvOep3tr
	hY7Hg==
X-Google-Smtp-Source: AGHT+IE9/lVOC9RD5dqHWaSWa1j5VajQRRLgW6hA855xIJmZ/spd0YvrkdXm0ZHnMiUmLACFqGFrlt0hesE7QYoVWtc=
X-Received: by 2002:a05:6512:304d:b0:553:3172:1c23 with SMTP id
 2adb3069b0e04-553b6e75482mr5205429e87.17.1750228360458; Tue, 17 Jun 2025
 23:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250607134114.21899-1-pranav.tyagi03@gmail.com> <20250617130431.50f761dc@pumpkin>
In-Reply-To: <20250617130431.50f761dc@pumpkin>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 18 Jun 2025 12:02:28 +0530
X-Gm-Features: Ac12FXw1swBMxxqP7uL84LhUXsvU1fv-TbWZJqVqxFBuKmhpQqAXjySO2_KEEhg
Message-ID: <CAH4c4j+BEJqMqECPDgOF5vq4hg7_yBRrLBPSuTKnA+CO658SOQ@mail.gmail.com>
Subject: Re: [PATCH] tty: replace capable() with file_ns_capable()
To: David Laight <david.laight.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, kees@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 5:34=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sat,  7 Jun 2025 19:11:14 +0530
> Pranav Tyagi <pranav.tyagi03@gmail.com> wrote:
>
> > The TIOCCONS ioctl currently uses capable(CAP_SYS_ADMIN) to check for
> > privileges, which validates the current task's credentials. Since this
> > ioctl acts on an open file descriptor, the check should instead use the
> > file opener's credentials.
>
> Is that right?
> A terminal will have been opened before the login sequence changed the us=
er id.
>
> The 'best practise' might be to check both!
>
>         David

Hi,

You're right =E2=80=94 I hadn=E2=80=99t fully considered that the terminal =
is typically
opened before the user ID changes during login. Checking only the file
opener's credentials may miss important security context.

Best practice would indeed be to validate both: ensure that the current
task has sufficient privileges and that the file was opened by an
authorized user.

Thanks for pointing this out =E2=80=94 I=E2=80=99ll revise the patch accord=
ingly.

Regards
Pranav Tyagi


>
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
> >               return -EPERM;
> >       if (file->f_op->write_iter =3D=3D redirected_tty_write) {
> >               struct file *f;
>
