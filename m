Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1E327A12B
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Sep 2025 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756971623; cv=none; b=iu9UIztntfMB7tMDXeDTrcM3e3elBLz4vA58OiQCV4YfqnzAPKbDMCLxFB8SNYzi3yr4ul3goGu6XgkdWMKqHrQpMS929ZjNES0cviodOfKOulhYWb8hE0j24aT4I5vludlWqyqF34GDEXvL32CvvgMd03U5Uswaa1GA7Dqw5xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756971623; c=relaxed/simple;
	bh=eIrVK0Ias59Ag2uJFqdtEy6fMXL6YCiM1AsRPYnGXT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMVD30Kvd//5D4h1bEi83d3JLQGGXcVu8eAZ/cGjWQBi62B3o7jQcindH2C1uCiLHH5VXf9zQvGgKWcRns2zejcWSjF5GaT+3IIa8HaqE3FC/gZsD4vCHJ+aUImVlDiAh1GjbbDL171OaD+HkvNaqdMqICwEWmuQ5/tdfIPLwvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQVWPnh/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQVWPnh/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5608bfae95eso725671e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 04 Sep 2025 00:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756971619; x=1757576419; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gc4Uqem+8ZkBxn4yFNp/DFtrvsE3WtaNmDYF+RPTg2U=;
        b=FQVWPnh/1570pNPlva00UXtNSzhL6YphDN0njbKHIrDar6Ift5nuZbkW2mIzYzFsmq
         0rEY9x0/9eBOp+CCVmbPejz2dfcLD3jxwqWbhwIxDInuO5fFmqxVPGxWkCh1hChYEgdK
         zNeTsNqI9d9/seJnfSn/BXMSP8iAZ9gkT5DbFz1bMZWqbejdPID9mLThM4urzPB0gc6J
         UHTuR48DE4I6EhICw0aGaxtJrZYLrAEWfNLsc1TF0LFTconbuviNLCJe0kVpftIjfymb
         KFiflYsC2QMSAlyb9gTPKOIhzM/1N4pB5xQ8h4C+9mWyFvgM1ktvpL3vatvUL5p39iD4
         /r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756971619; x=1757576419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gc4Uqem+8ZkBxn4yFNp/DFtrvsE3WtaNmDYF+RPTg2U=;
        b=YitiecX28tp1JxF3J2UqKtFi/6b+HQaFUSYtkT2O+CCXu0l3Voj9RkcjwdoeRl7V22
         TBXFOxyV2luYQu/ZkgEABl2/9Wws3hMkXMOxJeNTChale0ln5Lqf//RMoP6m7YYi530n
         WiyfyGoaKmTKDmRqPuJa2vZUO6w+g6y0hqlCFDaxLBwiwZjAMPaTVRSwLP3YYSQofesz
         O+F1+FJ6aNo6qh+ePEnx7TIlaUCN3cWS7myUsPE8PwXZ7gZg3qoi5qOzpcNvd8yKUlKP
         J4sSvRzSJ6E6048MaOQBFQKhm+D8l2+mW4B7+NXIzBRhpu/b1vui5cdbC5WO3MD4ZCsJ
         hYLw==
X-Forwarded-Encrypted: i=1; AJvYcCXpVJHv9o9DmYpFO2WyM+8vb8GwDWtm81kiz5pisuJWg5UBDvQXl9Wb+WELdIAA6DP45We9z7UoflZmSqbtDmY1HqEkVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnMCQJQDm2FVbSqLS0M+fZ8EBvtDTySwVIhtZ8eriipRoSB26w
	lZAWsuOuUsqQBPwO2AMfnHE8acGL88al04PbUbmTLdvWxhdR0RKteyhSB4mTVJGGFO+Y5tAeh+p
	zzSFh/OMFiHjbMKAxNcpmcr5gqMCjIxg=
X-Gm-Gg: ASbGncuOwR2PCnxdK+rsXGOHGSY6mEAeW+rrvoCOd1U2nWkqSND1Co5tIntGd3myhk0
	PkKAbOr3HVm85gKDRlu05kt7904TQ37hfoq5LXt5iAyu6Rzcuo2SEnvoB9e2G4Z9TNiQ9T3FCyv
	rZFonSpJdWUM1Fv2Ydc/QHmRfPyhUa9jKe+lB6fMDdNJVLNuGJGju0OpvP5mQNj3PhcxOoHr/j+
	jrtCJj66S22AF7H+Q==
X-Google-Smtp-Source: AGHT+IFtKLMUsLlir53WfPNlbjKgCEI3v/cBnmaMPUS1x4ZY1q62JCePqOMT8TCsGgjP/1nER3lDVi/ovnSdN9S9Tmc=
X-Received: by 2002:a05:6512:32cb:b0:55a:c9f0:a019 with SMTP id
 2adb3069b0e04-55f708bff09mr5606251e87.23.1756971618983; Thu, 04 Sep 2025
 00:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250813074201.6253-1-pranav.tyagi03@gmail.com>
In-Reply-To: <20250813074201.6253-1-pranav.tyagi03@gmail.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 4 Sep 2025 13:10:11 +0530
X-Gm-Features: Ac12FXw6nDps7DJxYy_LzV6LDUJK7V4swqmVewZj6bbPCr9Vj57XurgMlvy4sAs
Message-ID: <CAH4c4jJ1AO6Eovw9xBmKeBG7W8ueWy+7q_g20hDN4YmWTHdpdA@mail.gmail.com>
Subject: Re: [PATCH v4] futex: don't leak robust_list pointer on exec race
To: tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, 
	dvhart@infradead.org, dave@stgolabs.net, andrealmeid@igalia.com, 
	linux-kernel@vger.kernel.org
Cc: jann@thejh.net, keescook@chromium.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 1:12=E2=80=AFPM Pranav Tyagi <pranav.tyagi03@gmail.=
com> wrote:
>
> sys_get_robust_list() and compat_get_robust_list() use
> ptrace_may_access() to check if the calling task is allowed to access
> another task's robust_list pointer. This check is racy against a
> concurrent exec() in the target process.
>
> During exec(), a task may transition from a non-privileged binary to a
> privileged one (e.g., setuid binary) and its credentials/memory mappings
> may change. If get_robust_list() performs ptrace_may_access() before
> this transition, it may erroneously allow access to sensitive information
> after the target becomes privileged.
>
> A racy access allows an attacker to exploit a window
> during which ptrace_may_access() passes before a target process
> transitions to a privileged state via exec().
>
> For example, consider a non-privileged task T that is about to execute a
> setuid-root binary. An attacker task A calls get_robust_list(T) while T
> is still unprivileged. Since ptrace_may_access() checks permissions
> based on current credentials, it succeeds. However, if T begins exec
> immediately afterwards, it becomes privileged and may change its memory
> mappings. Because get_robust_list() proceeds to access T->robust_list
> without synchronizing with exec() it may read user-space pointers from a
> now-privileged process.
>
> This violates the intended post-exec access restrictions and could
> expose sensitive memory addresses or be used as a primitive in a larger
> exploit chain. Consequently, the race can lead to unauthorized
> disclosure of information across privilege boundaries and poses a
> potential security risk.
>
> Take a read lock on signal->exec_update_lock prior to invoking
> ptrace_may_access() and accessing the robust_list/compat_robust_list.
> This ensures that the target task's exec state remains stable during the
> check, allowing for consistent and synchronized validation of
> credentials.
>
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> Suggested-by: Jann Horn <jann@thejh.net>
> Link: https://lore.kernel.org/linux-fsdevel/1477863998-3298-5-git-send-em=
ail-jann@thejh.net/
> Link: https://github.com/KSPP/linux/issues/119
> ---
> changed in v4:
> - added task_robust_list() function
> changed in v3:
> - replaced RCU with scoped_guard(rcu)
> - corrected error return type cast
> - added IS_ENABLED(CONFIG_COMPAT) for ensuring compatability
> - removed stray newlines and unnecessary line breaks
> changed in v2:
> - improved changelog
> - helper function for common part of compat and native syscalls
>
>  kernel/futex/syscalls.c | 108 +++++++++++++++++++++-------------------
>  1 file changed, 58 insertions(+), 50 deletions(-)
>
> diff --git a/kernel/futex/syscalls.c b/kernel/futex/syscalls.c
> index 4b6da9116aa6..0da33abc2f17 100644
> --- a/kernel/futex/syscalls.c
> +++ b/kernel/futex/syscalls.c
> @@ -39,6 +39,58 @@ SYSCALL_DEFINE2(set_robust_list, struct robust_list_he=
ad __user *, head,
>         return 0;
>  }
>
> +static inline void __user *task_robust_list(struct task_struct *p, bool =
compat)
> +{
> +#ifdef CONFIG_COMPAT
> +       if (compat)
> +               return p->compat_robust_list;
> +#endif
> +       return p->robust_list;
> +}
> +
> +static void __user *get_robust_list_common(int pid, bool compat)
> +{
> +       struct task_struct *p;
> +       void __user *head;
> +       unsigned long ret;
> +
> +       p =3D current;
> +
> +       scoped_guard(rcu) {
> +               if (pid) {
> +                       p =3D find_task_by_vpid(pid);
> +                       if (!p)
> +                               return (void __user *)ERR_PTR(-ESRCH);
> +               }
> +               get_task_struct(p);
> +       }
> +
> +       /*
> +        * Hold exec_update_lock to serialize with concurrent exec()
> +        * so ptrace_may_access() is checked against stable credentials
> +        */
> +       ret =3D down_read_killable(&p->signal->exec_update_lock);
> +       if (ret)
> +               goto err_put;
> +
> +       ret =3D -EPERM;
> +       if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
> +               goto err_unlock;
> +
> +       head =3D task_robust_list(p, compat);
> +
> +       up_read(&p->signal->exec_update_lock);
> +       put_task_struct(p);
> +
> +       return head;
> +
> +err_unlock:
> +       up_read(&p->signal->exec_update_lock);
> +err_put:
> +       put_task_struct(p);
> +       return (void __user *)ERR_PTR(ret);
> +}
> +
>  /**
>   * sys_get_robust_list() - Get the robust-futex list head of a task
>   * @pid:       pid of the process [zero for current task]
> @@ -49,36 +101,14 @@ SYSCALL_DEFINE3(get_robust_list, int, pid,
>                 struct robust_list_head __user * __user *, head_ptr,
>                 size_t __user *, len_ptr)
>  {
> -       struct robust_list_head __user *head;
> -       unsigned long ret;
> -       struct task_struct *p;
> -
> -       rcu_read_lock();
> -
> -       ret =3D -ESRCH;
> -       if (!pid)
> -               p =3D current;
> -       else {
> -               p =3D find_task_by_vpid(pid);
> -               if (!p)
> -                       goto err_unlock;
> -       }
> +       struct robust_list_head __user *head =3D get_robust_list_common(p=
id, false);
>
> -       ret =3D -EPERM;
> -       if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
> -               goto err_unlock;
> -
> -       head =3D p->robust_list;
> -       rcu_read_unlock();
> +       if (IS_ERR(head))
> +               return PTR_ERR(head);
>
>         if (put_user(sizeof(*head), len_ptr))
>                 return -EFAULT;
>         return put_user(head, head_ptr);
> -
> -err_unlock:
> -       rcu_read_unlock();
> -
> -       return ret;
>  }
>
>  long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t *timeout,
> @@ -455,36 +485,14 @@ COMPAT_SYSCALL_DEFINE3(get_robust_list, int, pid,
>                         compat_uptr_t __user *, head_ptr,
>                         compat_size_t __user *, len_ptr)
>  {
> -       struct compat_robust_list_head __user *head;
> -       unsigned long ret;
> -       struct task_struct *p;
> -
> -       rcu_read_lock();
> -
> -       ret =3D -ESRCH;
> -       if (!pid)
> -               p =3D current;
> -       else {
> -               p =3D find_task_by_vpid(pid);
> -               if (!p)
> -                       goto err_unlock;
> -       }
> -
> -       ret =3D -EPERM;
> -       if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
> -               goto err_unlock;
> +       struct compat_robust_list_head __user *head =3D get_robust_list_c=
ommon(pid, true);
>
> -       head =3D p->compat_robust_list;
> -       rcu_read_unlock();
> +       if (IS_ERR(head))
> +               return PTR_ERR(head);
>
>         if (put_user(sizeof(*head), len_ptr))
>                 return -EFAULT;
>         return put_user(ptr_to_compat(head), head_ptr);
> -
> -err_unlock:
> -       rcu_read_unlock();
> -
> -       return ret;
>  }
>  #endif /* CONFIG_COMPAT */
>
> --
> 2.49.0
>

Hi,

Gentle ping. I am looking forward to any suggestions on this patch and
would be more than happy to make any necessary changes.

Regards
Pranav Tyagi
