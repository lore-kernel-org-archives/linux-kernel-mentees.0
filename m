Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5C122576E
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  7 Sep 2025 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757240815; cv=none; b=Yk1WdmI+VOKv8qf7wBLpWBK+9ckolUCmfvPMWjdzKYgdRjAMEIaAoNZAg0//YgM/Lk/bP5AavFyUM8HXonvcaqWhF2wXyfcxl66f8Dl5TaZTRNw0vztf/BHGVKOvCgbhojNtpodElIVhun8+hIxZF1PIl961+0vAYc8FMq4+jGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757240815; c=relaxed/simple;
	bh=U4o+1kgm58FgueMgya/dzhJDiCXmmZt3TUbA69suYo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUwt/U2mxJY+jfSHm7iFBwyMQSyZTeLK7bxXkUmub8ibOjNmhrW9bqWCFHPRySGQ7AGS3r8GNIeO+TbfOk6Kj7K9hP6cUJJMJaLI2i+4JsyLLFJ6x1ODvK3WwK0xS6b+iwFwkCdjZUtYMHfwVW1tuizT9Ma56NUtmN6t6AbRXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnY6fqi+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnY6fqi+"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f720ffe34so4579171e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 07 Sep 2025 03:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757240809; x=1757845609; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Djck81ZHPeC/TYbTh7nXfmIIlc9M+rZyku/8UYrEA8I=;
        b=NnY6fqi+EftEAziQEAiaUZJgva7pHtZfon4jKKvM4lO9RMGhXsz0JEtgX9sQqS4FKz
         iPru9BgXRgdhBJGNJFbM7NqjhdpKyXYy6M+lAeU1HO+Y4GjLzz/WUp9Ekj2QBAYYArWL
         WRtVZLrFoAP3PbmoK7pPrHT/uTrC9gIBsw7mmyj3TBRBFyul3ZZgI6qb9YdD24zYC7+H
         i0wLcgvWMEyw26zWkDeeZIvao4Uzpqz8lz69NI6AasL0z9psZAjTinO7xSrMUr/hZRc9
         iGjLy0tNblE8uWrF75WDVeV2WfVLQC94uO1TaGQQFkYHXpXEb0g/ogvI5nLWar9Fdab5
         4vNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757240809; x=1757845609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Djck81ZHPeC/TYbTh7nXfmIIlc9M+rZyku/8UYrEA8I=;
        b=nlf2pg3ZGJCkSZ+YtSswLGCxOn9VrKoLuF29Fvr4PLY2Xo801S1UVReVQTpFIspOBK
         es0zRo8VOxAwJOEzgXqK4WipwjYk0V5AqX9TSSVqlEPsX+Cei024dCPspFPFnVGlIRsq
         0Oip2Mf+Ftr7eznI+9V2SVnEIMMwMsww6U3nWUJsH+S6jfjl5NEb6XISPYuarB2R0BJs
         FiMukEhtpW6xDKlt4PwZX5krbWXUOUfwnj9MN77Wj8W5Ct9mqznDmAqRQQ5/PkjcZHNm
         wNP+09vCgHnL+6WM7GwmdnQw96ho3zbep2dsrC+7Vuf9zvVKlL05JABX8N3mfFVGDbwS
         U62w==
X-Forwarded-Encrypted: i=1; AJvYcCWLLlbPF4vzNh1eqeqPHVgKqlKdGRGi9z1DOAbi8Qu2wBGfGQvDpMaaNutRHLYNdpl0RP6P6LuZCoykA6Jl5D51pVyX/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzga/OCuteaxYwlD79LR5YZzd06Z3NN/55bNNj8TPo1gO6qFZia
	WNWESS/oUn2B6UA/QUElXhe3u5bSGqUgeU9KNVMFXS0fL6ePI/B6IzjTLsQ8n/isNjH2hujw88F
	s21adJ3b97dbQdWR7Dihx1UaCQ1qSi9Y=
X-Gm-Gg: ASbGnctD+q72R2hHXakpuDOqWuqrtInFEs5gZ7pGehQ/sFO2z7qwl+HG6zq3QGNPyNT
	YgPXupfQ4jv4WFHcELeOZBfOer7NBsVtCDIUWs632u5+OJz6EJYE9vuHdnBuoKkJLwKglUqyHRd
	bkWN4SAcVHQUSfNotmQQQoSG17S5il4OqkAVQphA7zw6YuvY1Q7ZjBWycxT7TzyR6cRw7jEk12H
	0xgHirDAJnjsWRJ9qF0WSFcTKVxo6+Ozr6Skn6AuaK9353qpZtd
X-Google-Smtp-Source: AGHT+IH3QyH3JPirF7YY1Fxych8WDM1JG2MgxwmZHIV+4KErAgiezY+cwo0iGAM3UUR43pVZSDORyW3Mgj89pa8EykQ=
X-Received: by 2002:a05:6512:6d5:b0:55f:3ae4:fe57 with SMTP id
 2adb3069b0e04-562758dd55cmr1154512e87.20.1757240808574; Sun, 07 Sep 2025
 03:26:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250813074201.6253-1-pranav.tyagi03@gmail.com> <e3e00ba8-1516-4632-b987-4c0d1bb303d5@igalia.com>
In-Reply-To: <e3e00ba8-1516-4632-b987-4c0d1bb303d5@igalia.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Sun, 7 Sep 2025 15:56:36 +0530
X-Gm-Features: AS18NWCEses5eql09XCpd3YvNS0TicXHLm0lxUZLKYpo8ifY23bSlvzcMwL3kG4
Message-ID: <CAH4c4jLGrThaZdhpu0jYFqj-Bp8Q39Oz0sWWJsVCHMjG4rg9qQ@mail.gmail.com>
Subject: Re: [PATCH v4] futex: don't leak robust_list pointer on exec race
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: jann@thejh.net, keescook@chromium.org, linux-kernel@vger.kernel.org, 
	dvhart@infradead.org, peterz@infradead.org, mingo@redhat.com, 
	tglx@linutronix.de, skhan@linuxfoundation.org, dave@stgolabs.net, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 1:22=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Hi Pranav,
>
> Thanks for your patch! Some feedback bellow.
>
> Em 13/08/2025 04:42, Pranav Tyagi escreveu:
> > sys_get_robust_list() and compat_get_robust_list() use
> > ptrace_may_access() to check if the calling task is allowed to access
> > another task's robust_list pointer. This check is racy against a
> > concurrent exec() in the target process.
> >
> > During exec(), a task may transition from a non-privileged binary to a
> > privileged one (e.g., setuid binary) and its credentials/memory mapping=
s
> > may change. If get_robust_list() performs ptrace_may_access() before
> > this transition, it may erroneously allow access to sensitive informati=
on
> > after the target becomes privileged.
> >
> > A racy access allows an attacker to exploit a window
> > during which ptrace_may_access() passes before a target process
> > transitions to a privileged state via exec().
> >
> > For example, consider a non-privileged task T that is about to execute =
a
> > setuid-root binary. An attacker task A calls get_robust_list(T) while T
> > is still unprivileged. Since ptrace_may_access() checks permissions
> > based on current credentials, it succeeds. However, if T begins exec
> > immediately afterwards, it becomes privileged and may change its memory
> > mappings. Because get_robust_list() proceeds to access T->robust_list
> > without synchronizing with exec() it may read user-space pointers from =
a
> > now-privileged process.
> >
> > This violates the intended post-exec access restrictions and could
> > expose sensitive memory addresses or be used as a primitive in a larger
> > exploit chain. Consequently, the race can lead to unauthorized
> > disclosure of information across privilege boundaries and poses a
> > potential security risk.
> >
> > Take a read lock on signal->exec_update_lock prior to invoking
> > ptrace_may_access() and accessing the robust_list/compat_robust_list.
> > This ensures that the target task's exec state remains stable during th=
e
> > check, allowing for consistent and synchronized validation of
> > credentials.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > Suggested-by: Jann Horn <jann@thejh.net>
> > Link: https://lore.kernel.org/linux-fsdevel/1477863998-3298-5-git-send-=
email-jann@thejh.net/
> > Link: https://github.com/KSPP/linux/issues/119
> > ---
> > changed in v4:
> > - added task_robust_list() function
> > changed in v3:
> > - replaced RCU with scoped_guard(rcu)
> > - corrected error return type cast
> > - added IS_ENABLED(CONFIG_COMPAT) for ensuring compatability
> > - removed stray newlines and unnecessary line breaks
> > changed in v2:
> > - improved changelog
> > - helper function for common part of compat and native syscalls
> >
> >   kernel/futex/syscalls.c | 108 +++++++++++++++++++++------------------=
-
> >   1 file changed, 58 insertions(+), 50 deletions(-)
> >
> > diff --git a/kernel/futex/syscalls.c b/kernel/futex/syscalls.c
> > index 4b6da9116aa6..0da33abc2f17 100644
> > --- a/kernel/futex/syscalls.c
> > +++ b/kernel/futex/syscalls.c
> > @@ -39,6 +39,58 @@ SYSCALL_DEFINE2(set_robust_list, struct robust_list_=
head __user *, head,
> >       return 0;
> >   }
> >
> > +static inline void __user *task_robust_list(struct task_struct *p, boo=
l compat)
>
> Function names inside of kernel/futex/ have the futex_ prefix
>
> > +{
> > +#ifdef CONFIG_COMPAT
> > +     if (compat)
> > +             return p->compat_robust_list;
> > +#endif
> > +     return p->robust_list;
> > +}
> > +
> > +static void __user *get_robust_list_common(int pid, bool compat)
>
> Same here
>
> > +{
> > +     struct task_struct *p;
> > +     void __user *head;
> > +     unsigned long ret;
>
> down_read_killable() returns a int, but you are storing the return value
> in an unsigned long.
>
> > +
> > +     p =3D current;
>
> Could this be initialized in the declaration?
>
> > +
> > +     scoped_guard(rcu) {
> > +             if (pid) {
> > +                     p =3D find_task_by_vpid(pid);
> > +                     if (!p)
> > +                             return (void __user *)ERR_PTR(-ESRCH);
> > +             }
> > +             get_task_struct(p);
> > +     }
> > +
> > +     /*
> > +      * Hold exec_update_lock to serialize with concurrent exec()
> > +      * so ptrace_may_access() is checked against stable credentials
> > +      */
> > +     ret =3D down_read_killable(&p->signal->exec_update_lock);
> > +     if (ret)
> > +             goto err_put;
> > +
> > +     ret =3D -EPERM;
> > +     if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
> > +             goto err_unlock;
> > +
> > +     head =3D task_robust_list(p, compat);
> > +
> > +     up_read(&p->signal->exec_update_lock);
> > +     put_task_struct(p);
> > +
> > +     return head;
> > +
> > +err_unlock:
> > +     up_read(&p->signal->exec_update_lock);
> > +err_put:
> > +     put_task_struct(p);
> > +     return (void __user *)ERR_PTR(ret);
> > +}
> > +
> >   /**
> >    * sys_get_robust_list() - Get the robust-futex list head of a task
> >    * @pid:    pid of the process [zero for current task]
> > @@ -49,36 +101,14 @@ SYSCALL_DEFINE3(get_robust_list, int, pid,
> >               struct robust_list_head __user * __user *, head_ptr,
> >               size_t __user *, len_ptr)
> >   {
> > -     struct robust_list_head __user *head;
> > -     unsigned long ret;
> > -     struct task_struct *p;
> > -
> > -     rcu_read_lock();
> > -
> > -     ret =3D -ESRCH;
> > -     if (!pid)
> > -             p =3D current;
> > -     else {
> > -             p =3D find_task_by_vpid(pid);
> > -             if (!p)
> > -                     goto err_unlock;
> > -     }
> > +     struct robust_list_head __user *head =3D get_robust_list_common(p=
id, false);
> >
> > -     ret =3D -EPERM;
> > -     if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
> > -             goto err_unlock;
> > -
> > -     head =3D p->robust_list;
> > -     rcu_read_unlock();
> > +     if (IS_ERR(head))
> > +             return PTR_ERR(head);
> >
> >       if (put_user(sizeof(*head), len_ptr))
> >               return -EFAULT;
> >       return put_user(head, head_ptr);
> > -
> > -err_unlock:
> > -     rcu_read_unlock();
> > -
> > -     return ret;
> >   }
> >
> >   long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t *timeout,
> > @@ -455,36 +485,14 @@ COMPAT_SYSCALL_DEFINE3(get_robust_list, int, pid,
> >                       compat_uptr_t __user *, head_ptr,
> >                       compat_size_t __user *, len_ptr)
> >   {
> > -     struct compat_robust_list_head __user *head;
> > -     unsigned long ret;
> > -     struct task_struct *p;
> > -
> > -     rcu_read_lock();
> > -
> > -     ret =3D -ESRCH;
> > -     if (!pid)
> > -             p =3D current;
> > -     else {
> > -             p =3D find_task_by_vpid(pid);
> > -             if (!p)
> > -                     goto err_unlock;
> > -     }
> > -
> > -     ret =3D -EPERM;
> > -     if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
> > -             goto err_unlock;
> > +     struct compat_robust_list_head __user *head =3D get_robust_list_c=
ommon(pid, true);
> >
> > -     head =3D p->compat_robust_list;
> > -     rcu_read_unlock();
> > +     if (IS_ERR(head))
> > +             return PTR_ERR(head);
> >
> >       if (put_user(sizeof(*head), len_ptr))
> >               return -EFAULT;
> >       return put_user(ptr_to_compat(head), head_ptr);
> > -
> > -err_unlock:
> > -     rcu_read_unlock();
> > -
> > -     return ret;
> >   }
> >   #endif /* CONFIG_COMPAT */
> >
>

Hi Andr=C3=A9,

Thanks for the feedback. I will make all the changes as per your observatio=
ns
and send a v5.

Regards
Pranav Tyagi
