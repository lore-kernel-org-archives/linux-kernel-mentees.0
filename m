Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDCF1C5D57
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753887097; cv=none; b=eQlRcGDXADckk9xovM61lZFiOYM/zp4v0YVvlDk1BioeCvg4RxIk0dEfZSgbhsTxlbTvEvPzMroRYK8LxFt0crypSYJfj8/QmBUmXPSCULLF5PMYNid19BGMBLec7YpwHUTeCJkOIs8iwapbARzgAb3TYxdNVzX5bPdeM74afmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753887097; c=relaxed/simple;
	bh=AvX6DV9MZeEEGnxMTsiMzU9R6U+GhYhri4HxSIUZVcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ij6fDWpOjyvVeOgG3yzK9MfR7IWAZjnFmmPceLqk6CzV0iKXZ2NYzPi7e8eN5tmDN1NmEAqhKuf5aI2OXwCYsAkRYpYEhdHXN5NSXZmVrVDSDcUoLhRSEhH9sh2OZAY4nUSx2TjgXXmy5lXG16l3yzPIAOvse/FaU0K/KDyBzCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BObtVazA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BObtVazA"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55b73f4ead1so2315122e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753887094; x=1754491894; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7NiWxPTKOFYM9uonseM4vMrBQ8wN02nGWedXjPFtiw=;
        b=BObtVazAQCtF21+DnlhrmdcADVs3mnREzt4GN4qnX9by65sXZDjqItBeZ7lfLs5KfJ
         +a5MVNaFHJkxkJ7vJTpY1BBQjOPO7ToUHsK+ejjOIW8vgz2A7zhAWhtzTLdlaii8hoxT
         26J5uejTiETu/gsdAQiK+UI1/ZUe1VE+ADb4tcdhcVxzxKG1uyZxdMXZS//KH1Yf2F4S
         LmPyBwREQL8kcRJ/OMIxiLOqK2VLAinQzl15R/icXSqGjq5hRacfV0MDS1AutpFeYLoH
         GVV9Boset+g0oYdf40fRavijC2D/1BQpMhYXu8aCOItjp4yQqluLVpJ0PTyDEe/wbbe6
         waxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753887094; x=1754491894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7NiWxPTKOFYM9uonseM4vMrBQ8wN02nGWedXjPFtiw=;
        b=kJdqv8k0yN2RmKXDroW0wW/0mfJM9qmbrdYZymuCw8WYggp/GSlLWuexNrAzVrqxuq
         cgdv1xKxXb70JMPWURW7FxjDl+GCHKQ6WRlCJ165i+fJu7b2HMAvEVTsaC39L7x5au9v
         PFULQ63OSu/9m8zwm1sGmaKosa1DfOPKl8MDOyYfRqsKYF90fn5A5XiGe77H+mDxMAwN
         9D5Sx4p730o4bqiCKJFcBMBZdG7Jc+STUOkSZM+FUSVKlOVO9OFY+BaTxQiDFP0v8yKE
         tJRnfV1S0bxugIGgu6AH16Q7eQLDXQeDOa4C875HNdt9ktbJVgMyhGvWM2OUkNKhOjJo
         bbLg==
X-Forwarded-Encrypted: i=1; AJvYcCXxv0aEGESofZ6diJUwDTFKPz5w4gQ8SjrCFQKh0MDiPWf950gl1siBStq9CVu4MK4FkfamDMzG06ulp//jQMRsFI6Qhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAPLYb/XTQZCgHNHRBmWrvBL3KmHv0BkpMFnvPmdRoM+i5nTin
	MAAAWMhr1poMbZfxerYJXRgPYKpnWbfaDOxXgh4Ir3l03gt8h1EXluRly9F6fIZccWRZKl7uVTH
	dKzJVzT4u3MHQ9EcRrkG/0NnWiw+9vZg=
X-Gm-Gg: ASbGnctJGBiVKKcVMhBJjE2+59Yr20fJBzO4WCWLpaPYyEaxckURNsV9UTdRco1xasq
	kAHjoX5KJ+X+tnIsPwqyIxD/p8z5jgnFKGCBP0/jrKKpwb/Aw43Abos1iJ/pwNBQDuYiGM1za7J
	Yk3ASZdOkMM1kY/5ItLMxQ0oPAVCAaXJzGoHpsb1d8p6RY6vhKC7g3h2IKThzVcv5jOM9ztz3uH
	295jFekgJsHoowLaLLRR4sPUeC0OUnTB2hwQiFOBg==
X-Google-Smtp-Source: AGHT+IEgEmq4syI9+uAid95y/R35+yJJ48ObJP6+pf2CLRAl6znW8QzofACTPgJiAcWHclppjwRXGeQ3u9SrRiIwgDk=
X-Received: by 2002:a05:6512:39c4:b0:553:adf2:38bb with SMTP id
 2adb3069b0e04-55b7c0986ddmr1271842e87.46.1753887093209; Wed, 30 Jul 2025
 07:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250607064444.4310-1-pranav.tyagi03@gmail.com>
 <87cybdp7to.ffs@tglx> <CAH4c4jLjSBxbd3bqkdgcCSWqXURratANgnbq9negrSU283xHpg@mail.gmail.com>
 <87frg3ss9s.ffs@tglx>
In-Reply-To: <87frg3ss9s.ffs@tglx>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 30 Jul 2025 20:21:21 +0530
X-Gm-Features: Ac12FXySoXDJCYsfTOJ1c18ryEETA_OYD0DDbNocu3gc910feNbr76AnTiqvAps
Message-ID: <CAH4c4jKmj2gwmW2LS8CuGyw6phtiN+=_Bef8_pSEzjnbsqPOeg@mail.gmail.com>
Subject: Re: [PATCH] futex: don't leak robust_list pointer on exec race
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	linux-kernel@vger.kernel.org, jann@thejh.net, keescook@chromium.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 6:38=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Wed, Jun 11 2025 at 19:33, Pranav Tyagi wrote:
> > On Mon, Jun 9, 2025 at 3:15=E2=80=AFPM Thomas Gleixner <tglx@linutronix=
.de> wrote:
> > Does the revised version below address the concerns more effectively
> > or does it still need a bit more seasoning?
> >
> > "Currently, sys_get_robust_list() and compat_get_robust_list() perform =
a
> > ptrace_may_access() check to verify if the calling task is allowed to
> > query another task=E2=80=99s robust_list pointer. However, this check i=
s racy
> > against a concurrent exec() in the target process.
> >
> > During exec(), a task's credentials and memory mappings can change, and
> > the task may transition from a non-privileged binary to a privileged on=
e
> > (e.g., a setuid binary). If get_robust_list() performs ptrace_may_acces=
s()
> > before this transition, it may wrongly allow access to sensitive
> > information after the target becomes privileged.
> >
> > To address this, a read lock is taken on signal->exec_update_lock prior
> > to invoking ptrace_may_access() and accessing the robust_list. This
> > ensures that the target task's exec state remains stable during the
> > check, allowing for consistent and synchronized validation of
> > credentials."
>
> That's way better, but it still does not explain what the consequences
> of the racy access are.
> >>
> >> You really did not have a better idea than copying all of that logic
> >> into the compat code?
> >
> > As I=E2=80=99m still learning, I wasn=E2=80=99t quite sure how to avoid
> > duplication there. Would factoring out the common logic into a helper f=
unction
> > be the right direction? I=E2=80=99d be grateful for your suggestion.
>
> Exactly.
>
Hi,

I face a small issue while refactoring the common code in a helper.

The main obstacle to a full refactor is that the native and compat
syscalls use different user-visible types (size_t vs compat_size_t,
struct robust_list_head * vs compat_uptr_t). Because put_user() is
type-checked at compile-time, I can=E2=80=99t unify both into one function
without either unsafe casting or weakening type safety (this is as far
as I understand).

The best I can do is refactor the common task lookup/permission
logic into a helper, and leave ABI-specific put_user() calls in thin wrappe=
rs.

I=E2=80=99d be grateful for your suggestion.

Regards
Pranav Tyagi

> Thanks,
>
>         tglx
