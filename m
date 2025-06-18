Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5FC1E3769
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Jun 2025 06:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750227646; cv=none; b=dJ76L0LJNEknixkKy7Oi5IuVp79xsFVeSjLlw37optw/8WwfggsTV139SCeGydukbQlCYGqD8edeNU6CQlXryG12Kn4wkH+8HbyO/3AfYrxMeH+qaklzwwNAXQFZbBxRMIB5AlUzwoyab9sQ+z9h3xd4Xxj/NSri46i2BQ0o+gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750227646; c=relaxed/simple;
	bh=r2P/jqnlG8ER5T2kcyLzbg88KxQ1hQIle5v/J/VH4RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvDBeWtZ/dReytx42cvFxpbLRWyxjRTM2FKkJkk0Vp1KBxQFdz7OLC4YQicSllILkVA0rfzZfBMPZGztHL+sCLtLgbR3Xyo+GdLr6GrGsOzwwnjYBr/5sPFvxNRTwJoMRTcZGxKT0ZMmaSvwZqz2Rn2PJvyEXIWBnUljGxuSdLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzHlfV3l; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzHlfV3l"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b10594812so6736983e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 23:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750227643; x=1750832443; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIX0DhlfHWBvvUubwltKbzItPX4eDrBzSY0SuHSHILE=;
        b=kzHlfV3l+TpqX93ZNGQZ6cv9ISD0hJTNt2u31ntDbAk3wguI7H/wkfan1R+qAls3pA
         W4CrplNY5nStV5y1/GIufa4sRf0i5owyUdkY9zWYH0uTWz5Zz6e9LPijiJespt3uMXp/
         7RUevL2Sw0oeJNEwy6nQPVQIzaTqvFUtCAK4gAL1r4nZk7RaCbm3KtwVYiNx4qWyBYft
         KKCpmBXra1UfaLgNJF+VRRmw4drZv90y6AoqkhO+2/RVJWEW0ZLbhf0En+5RS+/7EVN2
         zCY9xqi8Evuh7icXRQa2M2nqx2TP2B2FHn1PLmevPoIYRH+YvEvgLCQzySK7UcB2W9i+
         4zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750227643; x=1750832443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIX0DhlfHWBvvUubwltKbzItPX4eDrBzSY0SuHSHILE=;
        b=wF3EorgvhRujzBHBOkEp1VX4zYhRpoTTV+O5GK/rqwUMLCsWkT/dqjG5FgjI5qlHMk
         IYKh+wYV2C20RKhru9drX96fz0VJYiigOtyRLN3Iv1Oj3/FDIOVo8ZeBHjM030UYnC58
         pvrYvGRSQR4MVNX2bAk+EKV2qeupwXkjVRZx+PL+Ui6hoW3X5ztAxojcGJ/G0p8GF0rU
         RLb7Po5nnOAzt5MncMYwhv8RHa4kcTF9re/lfJTAwOFjpE3mvVkAxr4h3aHQuayU5Fkc
         YD5lT1QWT5xodWvR0674sxlUriXlw48V+wYWZWjkLCoWooT/m8nRJloohniSMfpSNVED
         vTSw==
X-Forwarded-Encrypted: i=1; AJvYcCUI6K7FpSpg+P3huRnYKVft/YQ209S5mWmQkQko9w32Vl2AetaggxQn9G26pWB/l+TmMwwFCkFviYk6ivewmSEbYTFqVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI6m/0In0deryl3po0L7G7bI8fPgY4MFEJE6WjOtYRBQ1MoSfz
	EBh25vCVyxt461nXl+7Ruuxrqm4gitNOXBM1i7P0QuOUaasLTzXqhUdxBpEE8DyjDSST1yOPZpu
	LGfqWF6UYOwqct3dRaR6XNf31ZX+p7lk=
X-Gm-Gg: ASbGncvDzhVjbPfWqgtIoPreO/5gnepuhOL+7lNr/h1CmeqqNHuCjvgpZSh3HuE8nb/
	lJFolQFLp+iMk18OuT9v+lsAy6w742APbSaHfmn5IKR66zYAu39nCZr2yBDvji4Cc3mWUxNrzCL
	fFLPQB53+Zsh/1cuzEJjvdM4SFR+atNA4eM1wZH/RZjPpzIfbFJobmxwfkQYH5Pkp23TxbrbhZ9
	MmAjw==
X-Google-Smtp-Source: AGHT+IFDwTlSZDjQACLoP7ljsYhRuDW1C2uoKdnb91cZZMLXrn21OYVXh8RXGHMFWPKcrLuKWobe5N+eLwVuZQ+7gLA=
X-Received: by 2002:a05:6512:31c9:b0:553:28a6:4384 with SMTP id
 2adb3069b0e04-553b6e68a2cmr4807234e87.10.1750227642416; Tue, 17 Jun 2025
 23:20:42 -0700 (PDT)
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
Date: Wed, 18 Jun 2025 11:50:31 +0530
X-Gm-Features: Ac12FXxjciqKI82M-DbqXPNhkQ3tfmpyi86Fx9VXoSkenBP_2KlF1yVqsqV4iO0
Message-ID: <CAH4c4j+P2MJWZWv6M2s+wOdfCF6q6Wyq3=VsB=uNCtEH1LMp-g@mail.gmail.com>
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

"The racy access allows a malicious observer to exploit a window during
which ptrace_may_access() passes before a target process transitions to
a privileged state via exec(). For example, consider a non-privileged
task T that is about to execute a setuid-root binary. An attacker task A
calls get_robust_list(T) while T is still unprivileged. Since
ptrace_may_access() checks permissions based on current credentials, it
succeeds.

However, if T begins its exec() immediately afterward, it becomes
privileged and may change its memory mappings. Because get_robust_list()
proceeds to access T->robust_list without synchronizing with exec(), it
may read user-space pointers from a now-privileged process. This
violates the intended post-exec access restrictions and could expose
sensitive memory addresses or be used as a primitive in a larger exploit
chain.

Thus, the race can lead to unauthorized disclosure of information across
privilege boundaries and poses a potential security risk. Taking a read
lock on exec_update_lock ensures that the target task's exec state
remains stable during both the permission check and the access,
preventing this inconsistent and potentially unsafe access."

I hope this explains the consequences of the race condition. If it is fine,
I'll add it to changelog when I resubmit with the helper function.

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
> Thanks,
>
>         tglx
