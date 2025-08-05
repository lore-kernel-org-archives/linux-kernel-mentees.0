Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCFF275847
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  5 Aug 2025 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754402253; cv=none; b=Eof3SCfb/QGy6cAPXxU93HBbxuJWDPpiRzN1h5nH/gYEz0pWvvvTk9Agb7wCXHeE9pgc0oi3NcF2LGFAyRu0AXyZ3xeFwjFn4H/6+4Krh+gb+xOTIAEiwVne5KoFeo0Kly6ZSo7dlaG4q7SZjy9J3eKU57ANgIIu17h3NWijTPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754402253; c=relaxed/simple;
	bh=7mZLLojTaTNmZeT9QnUtEiyTdad0TC/+kp78K+eo16A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqFqruLJi+jwyKQIttpmn6lDNn32floMo4aEKgQ+3nYGUlXLZrBK5ORxRYudr+8Ww0w3Nl/OTwAiBOTwtJkvBt8N78YttvAw2lcWTlC3KCUJTeLB31FZsNJaFwWCKvzg0AB1C6JswjzXnv1EFT/xPLClA2987HwF6RrV0ta7UKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fmo+KxMO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fmo+KxMO"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55b975b459aso4130384e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 05 Aug 2025 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754402250; x=1755007050; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8x1ZaMc+KsTk7oJAjVa/yFvyS0e8ToozTSSDn94vgA=;
        b=Fmo+KxMOQXdOs06BDr6xKmKURU74JvaZLg/f8l0S7gw7EGdPqaEASg0xYur6bM63Pj
         2zdQXe4kosQk0p2kfE0nbj6zwEAQOuf0PJbB2jNwtQ1KL0nvBz8yRuQan9hX9p6mALxu
         O4fsrgQZTkDkZmzap0a0jHXVxVlln30RNYb6tlwzisvdXTDr8xwv6zrrc/rOY2exZFGa
         XAZBjkKnEU8H+o69xQS02FhN9Twmh7fm2bxUtRsf8bZiRKPKr3bMRiaYrxGNww0LmaiX
         3CQxY2Lkq/42aGcUbw1Xcs5rM0v0fYgFc7hkhnzhR588lwTh9tE5Ynuk38WiddODJhq7
         5M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402250; x=1755007050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8x1ZaMc+KsTk7oJAjVa/yFvyS0e8ToozTSSDn94vgA=;
        b=L7enSpacUZryRNLDbrxfIocS/KcSdZK/HSE5/hMe8jfuZjN6JRUAqEa2xzcQLLDXob
         8+Aa30pKdbcIIzP44cf9hS45OK9RePW8ACTFvPl5+QM2JI55YT8ToXFv3WL2wGH6Camn
         tmb2xDKwDaNyZOAtdfSA8ZiMWG2MGZQOIPPiP9T7OoLyYEvLEpgqxlpbzrYAGJSQ8BS5
         66AZHIitSkf1oTE1n2l9n3/Uasxn9RjyXnV1qRyCjDtE4XX1COm66n1vlLdjVLivDglH
         1rEVWuETTFr1JI721iOBrnSsFP3vxuXqCGXGupuKJcNgZgVm9bnWzZK5v5aMrK3zsH09
         Gn4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS2nneeS0SIf8MXmjpDTKsgPiyP5cM9vbuLwjp0HoW2QSrlMYVW2OhXkH5WnHSx9zaxlVrEmbGvUFkASsINLHbRFpPsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYQOBIXpvHOajSLrrGoMViG4dbuskKNogamip6q9JcwJATavOY
	TCoT/ewaqlSPRbmx9+zGGUa2QAPwWaTTaiq0LzmjWCLzNGgSKw+S3MG3xBXkuy/UYYh1Ts8L840
	rsgfqJj1eQ4GCmY3W4DNnxCdJt+zgdJU=
X-Gm-Gg: ASbGnctKXU1DxRwjCjzQ+2A2Ln9lELCuDQDivKVVYbM7GQYytEmTtyz83ZX91WQShBe
	obftA6HndNf3hZ9aXj/K4Y07eB4O9CUTDXJLUtISPhOPYiv61xeuU3Xnmh/5cU0Nn4mYQGtkW8Z
	Sow40hovDHKTtpHsLdOfDDoydXCaPog9VQBGZo9Qac0KQ79nDoRI60YTZZGdI6kteY5//Qs211h
	Z9HU44t4ZoNOgELO9h48NVA30Sz3FbIlUE2x/Ntp795DAbxSnkXOTV7glwKCtc=
X-Google-Smtp-Source: AGHT+IE6hEDmJq97vpjlOL7UQIlkvgomWNXiN58b4EEyHBWTB5an1DnMBan/ZHnhZYH9hPkt/AfkwC6jtltvzzDUwIo=
X-Received: by 2002:a05:6512:31c8:b0:55b:81c4:5f22 with SMTP id
 2adb3069b0e04-55b97b7b1ffmr3758549e87.47.1754402249525; Tue, 05 Aug 2025
 06:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804115533.14186-1-pranav.tyagi03@gmail.com> <871ppqgoz0.ffs@tglx>
In-Reply-To: <871ppqgoz0.ffs@tglx>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 5 Aug 2025 19:27:17 +0530
X-Gm-Features: Ac12FXzUzyRhwEIq9Mhys6GbNbXUuuGnNJZmpU_M14C8D3LU-CT0y5PbmBOLJJQ
Message-ID: <CAH4c4j+1dG3523MGL5qdV2dC8OkqGN7QOn00HR0nuwQBaAz8iw@mail.gmail.com>
Subject: Re: [PATCH v2] futex: don't leak robust_list pointer on exec race
To: Thomas Gleixner <tglx@linutronix.de>
Cc: mingo@redhat.com, peterz@infradead.org, dvhart@infradead.org, 
	dave@stgolabs.net, andrealmeid@igalia.com, linux-kernel@vger.kernel.org, 
	jann@thejh.net, keescook@chromium.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 1:49=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Mon, Aug 04 2025 at 17:25, Pranav Tyagi wrote:
> > Take a read lock on signal->exec_update_lock prior to invoking
> > ptrace_may_access() and accessing the robust_list/compat_robust_list.
> > This ensures that the target task's exec state remains stable during th=
e
> > check, allowing for consistent and synchronized validation of
> > credentials.
> >
> > changed in v2:
> > - improved changelog
> > - helper function for common part of the compat and native syscalls
>
> Please put version log below the --- line. That's not part of the change =
log.
>
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > Suggested-by: Jann Horn <jann@thejh.net>
> > Link: https://lore.kernel.org/linux-fsdevel/1477863998-3298-5-git-send-=
email-jann@thejh.net/
> > Link: https://github.com/KSPP/linux/issues/119
> > ---
> >  kernel/futex/syscalls.c | 110 ++++++++++++++++++++++------------------
> >  1 file changed, 62 insertions(+), 48 deletions(-)
> >
> > diff --git a/kernel/futex/syscalls.c b/kernel/futex/syscalls.c
> > index 4b6da9116aa6..3278d91d95ce 100644
> > --- a/kernel/futex/syscalls.c
> > +++ b/kernel/futex/syscalls.c
> > @@ -39,46 +39,81 @@ SYSCALL_DEFINE2(set_robust_list, struct robust_list=
_head __user *, head,
> >       return 0;
> >  }
> >
> > -/**
> > - * sys_get_robust_list() - Get the robust-futex list head of a task
> > - * @pid:     pid of the process [zero for current task]
> > - * @head_ptr:        pointer to a list-head pointer, the kernel fills =
it in
> > - * @len_ptr: pointer to a length field, the kernel fills in the header=
 size
> > - */
> > -SYSCALL_DEFINE3(get_robust_list, int, pid,
> > -             struct robust_list_head __user * __user *, head_ptr,
> > -             size_t __user *, len_ptr)
> > +static void __user *get_robust_list_common(int pid,
> > +             bool compat)
>
> What is this random line break for?
>
> >  {
> > -     struct robust_list_head __user *head;
> > +     void __user *head;
> >       unsigned long ret;
> > -     struct task_struct *p;
> >
>
> Stray new line and please use reverse fir tree ordering of variables:
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variab=
le-declarations
>
> > -     rcu_read_lock();
> > +     struct task_struct *p;
> >
> > -     ret =3D -ESRCH;
> > -     if (!pid)
> > +     if (!pid) {
> >               p =3D current;
> > -     else {
> > +             get_task_struct(p);
> > +     } else {
> > +             rcu_read_lock();
> >               p =3D find_task_by_vpid(pid);
> > +             /*
> > +              * pin the task to permit dropping the RCU read lock befo=
re
> > +              * acquiring the semaphore
> > +              */
> > +             if (p)
> > +                     get_task_struct(p);
> > +             rcu_read_unlock();
> >               if (!p)
> > -                     goto err_unlock;
> > +                     return ERR_PTR(-ESRCH);
>
>                 scoped_guard(rcu) {
>                      p =3D find_task_by_vpid(pid);
>                      if (!p)
>                         return (void __user *)ERR_PTR(-ESRCH);
>                      get_task_struct(p);
>                 }
>
> No need for a comment about pinning the task. This is obvious and a
> common pattern all over the place. And note the type case on the error
> return.
>
> But you can simplify this whole thing even further:
>
>         struct task_struct *p =3D current;
>
>         scoped_guard(rcu) {
>                 if (pid) {
>                      p =3D find_task_by_vpid(pid);
>                      if (!p)
>                         return (void __user *)ERR_PTR(-ESRCH);
>                 }
>                 get_task_struct(p);
>         }
>
> Yes, RCU is not required for the !pid case, but this is not a hot path.
>
> >
> > +     /*
> > +      * Hold exec_update_lock to serialize with concurrent exec()
> > +      * so ptrace_may_access() is checked against stable credentials
> > +      */
> > +
>
> Stray newline.
>
> > +     ret =3D down_read_killable(&p->signal->exec_update_lock);
> > +     if (ret)
> > +             goto err_put;
> > +
> >       ret =3D -EPERM;
> >       if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
> >               goto err_unlock;
> >
> > -     head =3D p->robust_list;
> > -     rcu_read_unlock();
> > +     if (compat)
> > +             head =3D p->compat_robust_list;
> > +     else
> > +             head =3D p->robust_list;
>
> Brain compiler complains about a build fail with CONFIG_COMPAT=3Dn
>
> static inline void __user *task_robust_list(struct task_struct *p, bool c=
ompat)
> {
> #ifdef COMPAT
>         if (compat)
>                 return p->compat_robust_list;
> #endif
>         return p->robust_list;
> }
>
> So you don't have the #ifdef ugly in this function..
>
> > -     if (put_user(sizeof(*head), len_ptr))
> > -             return -EFAULT;
> > -     return put_user(head, head_ptr);
> > +     up_read(&p->signal->exec_update_lock);
> > +     put_task_struct(p);
> > +
> > +     return head;
> >
> >  err_unlock:
> > -     rcu_read_unlock();
> > +     up_read(&p->signal->exec_update_lock);
> > +err_put:
> > +     put_task_struct(p);
> > +     return ERR_PTR(ret);
> > +}
> >
> > -     return ret;
> > +
> > +/**
> > + * sys_get_robust_list() - Get the robust-futex list head of a task
> > + * @pid:     pid of the process [zero for current task]
> > + * @head_ptr:        pointer to a list-head pointer, the kernel fills =
it in
> > + * @len_ptr: pointer to a length field, the kernel fills in the header=
 size
> > + */
> > +SYSCALL_DEFINE3(get_robust_list, int, pid,
> > +             struct robust_list_head __user * __user *, head_ptr,
> > +             size_t __user *, len_ptr)
> > +{
> > +     struct robust_list_head __user *head =3D
> > +             get_robust_list_common(pid, false);
>
> No line break required.
>
> > +     if (IS_ERR(head))
> > +             return PTR_ERR(head);
> > +
> > +     if (put_user(sizeof(*head), len_ptr))
> > +             return -EFAULT;
> > +     return put_user(head, head_ptr);
> >  }
> >
> >  long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t *timeout,
> > @@ -455,36 +490,15 @@ COMPAT_SYSCALL_DEFINE3(get_robust_list, int, pid,
> >                       compat_uptr_t __user *, head_ptr,
> >                       compat_size_t __user *, len_ptr)
> >  {
> > -     struct compat_robust_list_head __user *head;
> > -     unsigned long ret;
> > -     struct task_struct *p;
> > +     struct compat_robust_list_head __user *head =3D
> > +             get_robust_list_common(pid, true);
>
> Ditto
>
> Thanks,
>
>         tglx

Hi,

Thanks for pointing out the shortcomings in my patch. I will
resend a v3 for the same shortly.

Regards
Pranav Tyagi
