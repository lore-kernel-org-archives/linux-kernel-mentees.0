Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13471664C6
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 04:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753849825; cv=none; b=GJ2JKnR0cMfOA5H0c6YgL4X1McRMeuA7G47bL3RTefOMHvranI7nRT3ZSzuzzuoSdEG03qFQ2q6878e6kXskqcAHLvKy3460aWK5+PzyWz/6KMZL/AM3fwIbo1DeyGTqkerZFgxJeyPbgCwikjSOeCvYi/Jsi3UawG5vH/m+2PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753849825; c=relaxed/simple;
	bh=HMp2CKNGnViSc+r9MfUxOE7NXI/wqzOvo8qYr3MLSGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aonlJ7RMLJSuPYiGsoig+MAnSpePwATpFUfotFew3W5rxJbLJwnrcusZ5y1sdquSCy9UZpFd8sZbJIfC11NKhCeC+3rd4FWopAHE5gRnjyc+kXSRdNDS0GZxnGCQShTkx70WlYDzdGPUcYY8Zqaftu2ba9K9VZVEgLjiaMKYz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7lthFus; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7lthFus"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2ea34731c5dso4698578fac.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 21:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753849823; x=1754454623; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2CvVUg7UlxR06MNM+bpdN0xAEBcFMMoZOjG6hEB23g=;
        b=A7lthFusHoOrSCL4Z/0BY3RSr6i48v+yVtxy98aitQ/0DEu5FlMR9aC60xF+ThTqiD
         YZLA1IMy7QDCgOyvbhgDNQcFzJUfwIs53iws+7/GPnWsfLrilWex0EF4qEVhgOuWiyRE
         Vg42UmfQRYcJY9ZqNeNjpJk6jx7tbC86lOv+e3qU4lcihqPudsDJOoJznHaWqBQSTqBA
         PnAyg5lGAMrY473QXfx8RiBSHaUSQ+jAc/5hmK9SBrThoZ2V7Y6B9AYytEWHUwsKevyr
         +Ka21rN9QnPq+EJ8UM5vc9vIWXOZvM/YSYc2Qjtj2TUL9GTpQsgVro9d93Nu1dLbSFcc
         xtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753849823; x=1754454623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2CvVUg7UlxR06MNM+bpdN0xAEBcFMMoZOjG6hEB23g=;
        b=JxyyXx2jOcOdb4DHMso5aBZUwf0d2PI3t3ArSkODDBxeC0oXzOhPG8/pM7wwK0+5Mi
         ND1eyt58uux+J8wEdOwZhfBN8HH4qSoaqSks9VEJSX+4/OxxxcOt7rVLMA6EJj4E/s5R
         j3Cs53GNh4TWS7hjFiyT8kRixh5ZMQUol7Ezd0SowSd7q+B+YU2GTBHCK1S/7ZLW8yQu
         4afVhfrPDAGJPT7v6mLFDhnBwTDbpyIWKYDwtmywPj/8wGuAsMsuMyhR+2URwpyzd8Mv
         L4rq7NgTlHiUHfx2vkl7b+qE6WR/ph5WvCmvjm6Hv9wGK+WG1R0f6HJLO0Iqb5Y6AhWF
         xhjA==
X-Forwarded-Encrypted: i=1; AJvYcCX3yHOwtdSkqEkMxBKtyTXdP6tTdmN+pPoBY9YuElQY9kRWE9sfBaGI1UcBzcUald8uO5ZnYFgKBPB3t7xmrYtLbacU5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1HFaxOnzkPDLa9Zc9t3u3iabIgf7i6WeUnWZo3hjh6y+tQ8LC
	RKmVzk9BTbSYgn5hHgrxTAWXfdO5d7DOXRGsO/umkWjlk1qvbgVA1LpB+UeSZDKNh8O/G8Mp/0p
	ODycP8l4hu92DP8vmZOTvqi7kDMdT5f0=
X-Gm-Gg: ASbGnctvYg1KRKEeLUZ3x7ISYGuklqmY5NgG7oNDfcJNuhdJrQQi/gaiE7a/dxy/VWv
	stjkYfmIXgy2jhZkIGfqsQ/qrpNxXbogR+rMTBcIxjyocakJH8XqXSiKJcRjFhDFuQucX3bVBNB
	Bf+06wMQJopKAh2MEgh5NN1TxRsx2qiApaul1EFrsEkHwq5OlpzxvsMEqCINjLCl9CY+pjT+YCs
	4YAbRJU
X-Google-Smtp-Source: AGHT+IF787ik2qzT2D+nRo5/5UNOd9UVCJkB7Jl9qjVV5oS2oJbxwMLYJIpraq/VuVyMpjP9Fl8ACnvF2rWBTojz2PU=
X-Received: by 2002:a05:6871:ac0b:b0:302:5dba:5ae0 with SMTP id
 586e51a60fabf-30785bb217amr1081081fac.20.1753849823172; Tue, 29 Jul 2025
 21:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729042621.6403-1-suchitkarunakaran@gmail.com> <2d30ee37-8069-4443-8a80-5233b3b23f66@intel.com>
In-Reply-To: <2d30ee37-8069-4443-8a80-5233b3b23f66@intel.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Wed, 30 Jul 2025 10:00:11 +0530
X-Gm-Features: Ac12FXyj4GOgaeK_kpw9TvOD7fMYxzphMMdpcX3yL9OmsAq_Ysak0jlC3UqItIE
Message-ID: <CAO9wTFgB_5tiVj5boPpgWtYd2O+49oyUemdcWVP9+vpZri=Nmw@mail.gmail.com>
Subject: Re: [PATCH v2] x86/intel: Fix always false range check in x86_vfm
 model matching
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, darwi@linutronix.de, 
	peterz@infradead.org, ravi.bangoria@amd.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Jul 2025 at 00:20, Sohil Mehta <sohil.mehta@intel.com> wrote:
>
> Though the title is correct, it is better to make it more precise.
> Something like:
>
> x86/cpu/intel: Fix the constant_tsc model check for Pentium 4s
>
> On 7/28/2025 9:26 PM, Suchit Karunakaran wrote:
> > Fix a logic bug in early_init_intel() where a conditional range check:
> > (c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_vfm <=3D INTEL_P4_WILLAMET=
TE)
> > was always false due to (PRESCOTT) being numerically greater than the
> > upper bound (WILLAMETTE). This triggers:-Werror=3Dlogical-op:
> > logical =E2=80=98and=E2=80=99 of mutually exclusive tests is always fal=
se
>
> We can focus on the why instead of how this error was found. How about
> wording it as below?
>
> The logic to synthesize constant_tsc for Pentium 4s (Family 15) is
> wrong. Since INTEL_P4_PRESCOTT is numerically greater than
> INTEL_P4_WILLAMETTE, the logic always results in false and never sets
> X86_FEATURE_CONSTANT_TSC for any Pentium 4 model.
>
> The error was introduced while replacing the x86_model check with a VFM
> one. The original check was as follows:
>
>         if ((c->x86 =3D=3D 0xf && c->x86_model >=3D 0x03) ||
>                 (c->x86 =3D=3D 0x6 && c->x86_model >=3D 0x0e))
>                 set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
>
> Fix the logic to cover all Pentium 4 models from Prescott (model 3) to
> Cedarmill (model 6) which is the last model released in Family 15.
>
> > The fix corrects the constant ordering to ensure the range is valid:
> > (c->x86_vfm >=3D  INTEL_P4_PRESCOTT && c->x86_vfm <=3D INTEL_P4_CEDARMI=
LL)
> >
>
> This line is unnecessary. Changes that are easily observable in the diff
> below don't need to be described in the commit message.
>
> > Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural
> > constant_tsc model checks")
> >
>
> The "Fixes:" line doesn't need to be broken down into multiple lines.
> All of it can be on the same line.
>
> For patches being reviewed for upstream, adding a stable Cc (Option 1 in
> the stable documentation) is the easiest and preferred way to
> automatically trigger submissions for stable.
>
> In this case, include the below Cc: line after the Fixes: line.
>
> Cc: <stable@vger.kernel.org> # v6.15
>
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> >
> > Changes since v1:
> > - Fix incorrect logic
>
> Patch-to-patch changes should be below the --- line. That way they will
> get ignored when the patch is applied to the maintainer's tree.
>
> > ---
> >  arch/x86/kernel/cpu/intel.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
> > index 076eaa41b8c8..6f5bd5dbc249 100644
> > --- a/arch/x86/kernel/cpu/intel.c
> > +++ b/arch/x86/kernel/cpu/intel.c
> > @@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo_x86 *c)
> >       if (c->x86_power & (1 << 8)) {
> >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >               set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
> > -     } else if ((c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_vfm <=3D =
INTEL_P4_WILLAMETTE) ||
> > +     } else if ((c->x86_vfm >=3D  INTEL_P4_PRESCOTT && c->x86_vfm <=3D=
 INTEL_P4_CEDARMILL) ||
> >                  (c->x86_vfm >=3D INTEL_CORE_YONAH  && c->x86_vfm <=3D =
INTEL_IVYBRIDGE)) {
> >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >       }
>

Hi Sohil,
Thank you very much for your valuable feedback. I have incorporated
all the suggested changes and sent out the v3 patch. Could you please
review it?

Thanks,
Suchit
