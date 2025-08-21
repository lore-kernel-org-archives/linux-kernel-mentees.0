Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D95C1C701F
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755776889; cv=none; b=tOom0ugu+KIi6RdpNK3UiV8uv01q8UTlwR6oT1EA/PXg7zHwrjOyZtHOPcZmcRGWA8PBARySodeNYJTd3lVTBRrzh73qeae4Q0uLZzBdj+hRIwp1R+eLCW+91Bpbj8SEon8IsyeMRfALKfJ5D77rHi4gntx3RcxK5NEnkZaooXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755776889; c=relaxed/simple;
	bh=xKbvWwKbcZWaJQHIgEza0/GnYU9xwg6q/b9NTBU8WVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfA79FZYVzzp8LqYfQcMm1VUT7yJxt6yhyqfJETmuTWxYcHPvW6xxQQ7/+bX+gnud0aptFCItEGicKqdnzGqAU5JyKk+dGlVkG39T1RkN5PhBbG1SplXe9pmVITlnFqg3F4iAAkk8z4jBqjA8ZNgGkKBY2KnluL83Sr53YcTTJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1enbd2b; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1enbd2b"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-333f8d387d6so7504071fa.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755776886; x=1756381686; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVn6yHViqofsnebAXzQeno5didziZHpYLqIREvbjhLA=;
        b=R1enbd2boN/5Rb9ulHkHTn2ghRd6TjAjoHUSExBKo091HCBvC+iGMhrCoRPc8PJIpl
         NO5LEQ53ak6K8AkZIC94i2sAUplNJCjoO9EbqzL705LeyVkhgWGhCakTmA3yKBPSzkfc
         vdeScTdWNbzc/PqzUGpFf+/22WeVhCyhWknO1XNuhpkhi9+Ok42yExmLfOgyS0Ot0kDU
         G/NqFUzP/BObf8YLkN+UaD5q6krzSEAt9iTlx2A0BPmxCrqIHWNM3bZyPUOs+3Zs4lOz
         3itAujUUrpPexgr9g6R2fhtNfdbs2q3A7JIYfuNE5Hiujkns5fI18b0aNtbuenfiXr3Q
         I2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755776886; x=1756381686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVn6yHViqofsnebAXzQeno5didziZHpYLqIREvbjhLA=;
        b=EEPaldI/Bt7/qgBuVmlmASB5gSpEXqvrc/8AhElXIu6TVDWgJzIlGHCZ6a5ISF9P6t
         t1FY7N1NRhr64vuQT8NKJ1cai623M6+jASkiTZvLSnN2K+yvprqnpQKyt2fakWZ0Vbjo
         roB/mOJZUpeXvLjSrw1X341Z7JFv7MW2X9BQpUcMiaBC2Sdd8jfgZC9pk3zkIyvHfW9R
         HIxWHS2C8yTwPKJ6j23hGXayZ2vj4G9SbhGavgOGAyI8DB9U36Jz13+zbcluD1fcF8dK
         iANsjURz4OK9TGHuz2HGCtK2wlL/BinDbzJlYcXjvToVFhFFZr7eXKvLnITJRwl9Q2IL
         SuWw==
X-Forwarded-Encrypted: i=1; AJvYcCUuz5+v4jPAkdqmvtVYLxi+B+LMzzu7EayovhfY6mlDh1TceETmD6jVb1TYC/VkK82Lv4Bv03/G+sTJj9iBCdPpY7z3vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjVoMbCboLaeFHaNAcV+bSWfGyq2P6CZDUtSk+swdr5JdZ9JX3
	S0k39XeMhDRniUHdrghUI0ZdhPUo7tYAVVnHbHuSHnO26fgysn2gaPDIBH277vr0J1PbJj5Uhg8
	acmufHqV6jziFh+OkJb1jKbkOWdTmok8=
X-Gm-Gg: ASbGncs6DicH/IfIfdm3Olto05glchWEB5WgA0NV1FKGq1otyGytfFEOW7EcB7q0CAw
	aRAQvEvCMeE1YQ4tzyfXZOfOmxN419QhKSMmPTLHTcrl4ISle7xIWQP0pImcgAgoDpG9o+MN/VT
	rUZRyDZ3c5GC0nJA+r+C20HEEYVeitRy/4/K8HlkUCcbBzS2nkhELWuZ953BCszP7Xc5XYu5tuy
	4AkIC4gnkkJx9Xq0vb/pBHkYcOxxuaP7+3524bUeM9L7etOkPfr
X-Google-Smtp-Source: AGHT+IF85vZ2002hxM55gh6BA+f5b4GlTLelhMuP8NmcH/nZOCmmKzZQce3hznqKYlk6R+jnyqhE6Dfj0hy84/C1NCA=
X-Received: by 2002:a2e:beaa:0:b0:32c:abf4:d486 with SMTP id
 38308e7fff4ca-33549e7d464mr6908951fa.14.1755776885248; Thu, 21 Aug 2025
 04:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250813074201.6253-1-pranav.tyagi03@gmail.com>
In-Reply-To: <20250813074201.6253-1-pranav.tyagi03@gmail.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 21 Aug 2025 17:17:53 +0530
X-Gm-Features: Ac12FXxjbjvJOBMZ4ibG5yQxSfbMm5Bq3eDS1TXF9aRKeJ4RBZQemk4sO_lF5yk
Message-ID: <CAH4c4jLuhe-S+2BtKyn0+uQzzAwvVXoCSkQKZ-tqv5Ww9xU5sw@mail.gmail.com>
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

This is a gentle follow-up on this patch. Please let me know if any further
changes are required.

Regards
Pranav Tyagi
