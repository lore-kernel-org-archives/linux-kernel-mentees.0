Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911DB23B60B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 30 Jun 2025 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274378; cv=none; b=EscYz/fqsv2qvmJeZTW3GVxMRrAwfFPXDQ9n3zKrq2QDxNQrpeh3NU1FkN/pYrJYp1UGKCQylp9hoDsmFpQ77k9hNzNyUN/QAoXYfeM1PY3eDj/nGF2Od3a66gLWbQ58XdIOEjJGbzD+V5KNt8kFpCkIr9840/tERI/F+O/2yVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274378; c=relaxed/simple;
	bh=5gHgaJRDbCKSv2ytqimG2JxpO3g5IlQOq1sbnXKKmVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taJZjxbePNQv0VSf8J6hWt79KAMlXxtVrXSNSwpYW3CuxitosU9phu8PKDv0bD8mRLSFAuhVB9ldMZ0eyi1d3Tu/41rG1nwwIzNe/Fs2efFDvtWUC9uqsnczeDU+i20T7sqnGjjJQ/Xwe1TpnLj0Tzy9XECFQZTzA/MPtFVmSs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGm9bMJD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGm9bMJD"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so9302690a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 30 Jun 2025 02:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751274375; x=1751879175; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkB7mEEipMdqVFva/up+3uvXTv0EJjxJagKL7Ep/rFs=;
        b=DGm9bMJDemyW6ZgUtxWwFGduZwTM0yCVTAczUWg3xaEaBfK1BKKOeMKJs3yHIpyseG
         9Y8ySgGIVhNAQkYvFQN6BjjHwdeL1DDZG1ZDwQ78gfg9QVpNoeYG1968WP+h2+KoB7N3
         ifsm1LLoTmyhLQwcojSZ73s7JPEGrl8zkpYZisldjAf8RITn9oBNpEvfH16CQKRiKJOV
         Ipyyj+ChrK+aRt3akEW3Y9NYqVRLw8sSehZqLutPPZjxxxnudcf/Z8nTQMa+A/KZ/OpG
         mlXooPsYHeqIYIUqasPeQPalPUHsAPFW8uLjp1RBt2yaLR8XcAd/FV+a403oTZAe+PqO
         XqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274375; x=1751879175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkB7mEEipMdqVFva/up+3uvXTv0EJjxJagKL7Ep/rFs=;
        b=YV7NpsJX520y3GpJHelJZUYwW8tbMYnODGLeewnxfmub+NLdgcGJds30yHEhN6RwnJ
         r8ygW5rUifx55sPviKbusPOwtN4elyG98t36k3C3OoNcvaAxCkq7bmKAng1zU8RJCNt4
         zq5iiGCkbYSjUkeEkpS8MaS7NZFlbINg56KwcKcIgTE4aZFwSbzFMLWWGQIUYODoxJ6b
         IeJZ4Nv8ObeMAZpEOql3CywdvYiovNiABjLKz8kwx0W0TBZ0paJHuN/Qiz7WYhQpY6nY
         9LHV8nlH0jQhnmdkATL9nW259uFRogxSz8v1AgQ5oMZJa+YbmtN3gYNDKi7TY7dNk96W
         MZFA==
X-Forwarded-Encrypted: i=1; AJvYcCWKgNJPDlZsG/wBUC8G1YwPKQoRYa/4fQX5osasw+mgkesKjamgVnjfusxaOuh2HuX98ktxnr30ujkHjQEc0CwFR7QZkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYHMvfbGpJLvaSuHLh44qJwf+TKiXgL8Yit815w3ATItqneQL2
	QGNNqwa+F9TM5Y0Q9ulkr7ixbEP+U9mBgb8vGYX32uyWyDKc1nhUb1ITOrLEPmdahKKBHKCGJ9Y
	eqBqQpGT8uDEQx+HY3azeDNSCIPGq+uU=
X-Gm-Gg: ASbGncsNcwY5R7Lg2g+mrwQkFz7/G03T5dnNBWHEeJ29efooyLBsRTlItyHmV4viJXR
	dGuKyeReq2EujkGwEE+bKL9zRWrFuCUs3PnUuLjOpsk0arzBekTmyOLSTzO30wXAoy/zUo6BTST
	pQHcFOtS36GA0vXwRcnUSCbQzRIAQBPXP34eDa4TqimfksThglYAIRs1oJZRo5X2Ek6sXrZRc7+
	PYH8jiof2ytpaI=
X-Google-Smtp-Source: AGHT+IFwTxcyTIa8fzprZ+ugwGCzJpImOkoMGnG2ENcUx+MwC8Um4xsbA+LiwKFmDE08uC5QoYs1DEPe5zA4p/Q2t8I=
X-Received: by 2002:a05:6402:254a:b0:60c:3b63:d026 with SMTP id
 4fb4d7f45d1cf-60c88e59f4amr11089474a12.26.1751274374529; Mon, 30 Jun 2025
 02:06:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BgUaxdxshFCssVdvh_jiOf_C2IyUDDKB9gNz_bt5pLaC8fFmFa0E_Cvq6s9eXOGe8M0fvBUFYG3bqVQAsCyz3w==@protonmail.internalid>
 <20250617124546.24102-1-pranav.tyagi03@gmail.com> <qlogdnggv2y4nbzzt62oq4yguitq4ytkqavdwele3xrqi6gwfo@aj45rl7f3eik>
In-Reply-To: <qlogdnggv2y4nbzzt62oq4yguitq4ytkqavdwele3xrqi6gwfo@aj45rl7f3eik>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Mon, 30 Jun 2025 14:36:01 +0530
X-Gm-Features: Ac12FXyJJULHsrmqDZ-6EY8YAD-MmRxLrWdoQ4FALL0Aw5V02Zuh37C80PEcs1c
Message-ID: <CAH4c4jLjiBEqVxgRG0GH37RELDp=Py3EoY6bcJhzA+ydfV=Q1A@mail.gmail.com>
Subject: Re: [PATCH] fs/xfs: replace strncpy with strscpy
To: Carlos Maiolino <cem@kernel.org>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:09=E2=80=AFPM Carlos Maiolino <cem@kernel.org> wr=
ote:
>
> On Tue, Jun 17, 2025 at 06:15:46PM +0530, Pranav Tyagi wrote:
> > Replace the deprecated strncpy() with strscpy() as the destination
> > buffer should be NUL-terminated and does not require any trailing
> > NUL-padding. Also, since NUL-termination is guaranteed,
>
> NUL-termination is only guaranteed if you copy into the buffer one less
> byte than the label requires, i.e XFSLABEL_MAX.
>
> > use sizeof(label) in place of XFSLABEL_MAX as the size
> > parameter.
>
> This is wrong, see below why.
>
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  fs/xfs/xfs_ioctl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> > index d250f7f74e3b..9f4d68c5b5ab 100644
> > --- a/fs/xfs/xfs_ioctl.c
> > +++ b/fs/xfs/xfs_ioctl.c
> > @@ -992,7 +992,7 @@ xfs_ioc_getlabel(
> >       /* 1 larger than sb_fname, so this ensures a trailing NUL char */
> >       memset(label, 0, sizeof(label));
> >       spin_lock(&mp->m_sb_lock);
> > -     strncpy(label, sbp->sb_fname, XFSLABEL_MAX);
> > +     strscpy(label, sbp->sb_fname, sizeof(label));
>
> This is broken and you created a buffer overrun here.
>
> XFSLABEL_MAX is set to 12 bytes. The current label size is 13 bytes:
>
> char                    label[XFSLABEL_MAX + 1];
>
> This ensures the label will always have a null termination character as
> long as you copy XFSLABEL_MAX bytes into the label.
>
> - strncpy(label, sbp->sb_fname, XFSLABEL_MAX);
>
> Copies 12 bytes from sb_fname into label. This ensures we always have a
> trailing \0 at the last byte.
>
> Your version:
>
> strscpy(label, sbp->sb_fname, sizeof(label));
>
> Copies 13 bytes from sb_fname into the label buffer.
>
> This not only could have copied a non-null byte to the last byte in the
> label buffer, but also But sbp->sb_fname size is XFSLABEL_MAX, so you
> are reading beyond the source buffer size, causing a buffer overrun as yo=
u
> can see on the kernel test robot report.
>
> Carlos
>
> >       spin_unlock(&mp->m_sb_lock);
> >
> >       if (copy_to_user(user_label, label, sizeof(label)))
> > --
> > 2.49.0
> >

Hi,

Thank you for the feedback. I understand that my patch is incorrect and
it causes a buffer overrun. The destination buffer is indeed, already, null
terminated. Would you like me to send a corrected patch which uses
strscpy() (as strncpy() is deprecated)?

Regret the inconvenience.

Regards
Pranav Tyagi
