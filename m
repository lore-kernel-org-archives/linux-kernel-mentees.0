Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1EB2E36E6
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 04:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753762634; cv=none; b=tgv31+BDNxb/jwhO/9ikUgm9S0Fj5eIUjCYHbEgJKab9srP1vVNIvAxlLktLWm2645F4g2GS0ejPET80dhtUTzOueMpCmLp26tlFu2irs4WPDAvcR90G/LwGaouu13/E3zqrVQ/AHTpqTNXfpTTO3FEghdZ6/wXXCmMxTMWddgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753762634; c=relaxed/simple;
	bh=WCgqgD4fKpyBS97qlpo7ocaqmNNlLUD/cRFaClGGi/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAploArGUMvaz+3UxJYao2MJepHprXa+moEKOBItvDJHtJilEk1DYGXUPuxObPEedifKGgYWNjRIMLBJagu6/p/mSrfkgB0f/GJC6hQuFCnz3cxHrsVT3Unefa19vmfhVlJ+rSp9qyYTmUGZYwJr0ephVfRMAcRBLHclSoK7Lb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I91ErIDy; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I91ErIDy"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-41baecbdd36so1980059b6e.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 21:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753762632; x=1754367432; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNLbOHqgEt1SbO6Tjq1iIaZdqSSy0ent5yRbkUG/EBc=;
        b=I91ErIDycPOFHa8wEzJU0AxCf9yhZUkqUpP3s7csYxJwQWJ+scYwjAEHfB0crOPo1C
         Ss/iOgeQrX9RTFPbE1NtdxfshaOM8PxVUwCexIrRkjkPXfzbPnfO2vACTNEkkREl/Fgn
         kT1eOd8l1o8szngYyueCAWkgNODrbCBYzf6X8sE+xzXOxWtSxXe+/U2qTS2etOPhzVRm
         BqGSlvoq4+SkSAsW8vZV4amd1jUW4ad6X4vObYpf2Uo3yM0K1qZ/OqUjHA9p6vfPBke3
         PZihW5PoQv9gFP7+dtnkBVBxoe3mibqISacuq9IVuPbnRQlA9Mlj+gWEG+17Asm/UvFQ
         sQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753762632; x=1754367432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNLbOHqgEt1SbO6Tjq1iIaZdqSSy0ent5yRbkUG/EBc=;
        b=j6uvl25U4eoT5Dpj5JfjvrlDiDELZgR5RMe+Tkft6J+2Onxw4ug0MLwNPuETm7JsYo
         FA6+qBhcu5vWdRNEYaiyhLA+dqcMu/uw9gBKoZ3azR3+BwIfXCuRIvRies9ONmSqr1/R
         LUqKmF13k94c0tHT81O0GOmmP2Lp19kQnuRGRikPWJMWeZ5OrqaEMiaSHTor0u8RxxFV
         aiuQd4wohivtcywN+iew4Pq7ffuZDKUS+n7HLBsgRO76cu741CvrJTTEkvjo0UbsZJvh
         oB9vQuXyd7z0KYmpU4gKJ9Ilc91Itniod+aErG+vE3F7QixIKU0uVgbnPlaliBIgTcVH
         1Ugg==
X-Forwarded-Encrypted: i=1; AJvYcCWr2hbqXTcMpDDMvjcfN7kzbydTNeZc2BuAKM+CrMAfExZL+PPkMsoF5FiVhQyCG1JDOccQppeyi7LerwpKB+zxSp8xmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyayF2CsU/y7urlCTVt4C6vUJxjXrd/okXrII0t3MeO9DBdkQcT
	MAbbSLB8hjbI1Y/dJQs+kAP736d4LAbm3trWQTsfJtCA1a+hVGA6ZzU8YRrkRhuGhEmhihcWEkF
	87C9+jpO8LtPtABsQ5tYQJ3ozeGpTRKo=
X-Gm-Gg: ASbGncuxNSIAclO4sWCPq5ybact/mNL4ZWvFjagsjn3ou53tW5p9JekLhkw20+YmOS5
	63s4xP5bVD1rqP0+lM97BtkCgIpIdSN3Pkk8/E97KK0dNtc+QZLfGBZ4AzWJgxNB0nPRYOOCTm6
	5cLd5GUChGvtjkoMjnyzIvIgyV4TilwSmASIgkjUdGiQ0bn/vkigqim1lN5r9txsP+7zggFzHSx
	k8ubT19
X-Google-Smtp-Source: AGHT+IE2iVhvoVUI4WD9TksZUQ8mafderIzzAthb51jW9QtuLXEvyBFidwc4tkovmHWyLA1RdE/oPNRuQPMitpyVh6I=
X-Received: by 2002:a05:6808:144c:b0:40c:f680:89e5 with SMTP id
 5614622812f47-42bb9d09e16mr8456399b6e.28.1753762631693; Mon, 28 Jul 2025
 21:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250728180923.160966-1-suchitkarunakaran@gmail.com> <a1044e00-8e61-4de5-b22a-3878920e471a@intel.com>
In-Reply-To: <a1044e00-8e61-4de5-b22a-3878920e471a@intel.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 29 Jul 2025 09:47:00 +0530
X-Gm-Features: Ac12FXx1vkiz3k3XgXRqkUXmwBzeIKtVeNFaRenjX1eppnpJO5KQoyJva_c_W8M
Message-ID: <CAO9wTFiQLLTFcTew+ymC85m8dNLu_KcJOYj9vu2ke0fcUYW-Cw@mail.gmail.com>
Subject: Re: [PATCH] x86/intel: Fix always false range check in x86_vfm model matching
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, darwi@linutronix.de, 
	peterz@infradead.org, ravi.bangoria@amd.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Jul 2025 at 00:26, Sohil Mehta <sohil.mehta@intel.com> wrote:
>
> On 7/28/2025 11:09 AM, Suchit Karunakaran wrote:
> > Fix a logic bug in early_init_intel() where a conditional range check:
> >     (c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_vfm <=3D INTEL_P4_WILL=
AMETTE)
> > was always false due to (PRESCOTT) being numerically greater than the
> > upper bound (WILLAMETTE). This triggers: -Werror=3Dlogical-op:
> > logical =E2=80=98and=E2=80=99 of mutually exclusive tests is always fal=
se
> > The fix corrects the constant ordering to ensure the range is valid:
> >     (c->x86_vfm >=3D INTEL_P4_WILLAMETTE && c->x86_vfm <=3D INTEL_P4_PR=
ESCOTT)
> >
>
> Thank you for reporting this issue!
>
> This is indeed a bug, but the resolution proposed here seems incorrect.
>
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  arch/x86/kernel/cpu/intel.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
> > index 076eaa41b8c8..3ec1555cbdc3 100644
> > --- a/arch/x86/kernel/cpu/intel.c
> > +++ b/arch/x86/kernel/cpu/intel.c
> > @@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo_x86 *c)
> >       if (c->x86_power & (1 << 8)) {
> >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >               set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
> > -     } else if ((c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_vfm <=3D =
INTEL_P4_WILLAMETTE) ||
> > +     } else if ((c->x86_vfm >=3D INTEL_P4_WILLAMETTE && c->x86_vfm <=
=3D INTEL_P4_PRESCOTT) ||
> >                  (c->x86_vfm >=3D INTEL_CORE_YONAH  && c->x86_vfm <=3D =
INTEL_IVYBRIDGE)) {
> >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >       }
>
> See commit fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural
> constant_tsc model checks")
>
> The original check that this replaced is:
>
>         if ((c->x86 =3D=3D 0xf && c->x86_model >=3D 0x03) ||
>                 (c->x86 =3D=3D 0x6 && c->x86_model >=3D 0x0e))
>                 set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
>
> The first check is supposed to cover all P4 models starting with model 3
> (INTEL_P4_PRESCOTT). In order to set an upper bound for Family 15, the
> check should cover all models until model 6 (INTEL_P4_CEDARMILL) which
> is the last model released in that family.
>
> The error that I made was to use an incorrect upper bound. The actual
> fix should be this:
>
> s/INTEL_P4_WILLAMETTE/INTEL_P4_CEDARMILL
>
> > @@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo_x86 *c)
> >         if (c->x86_power & (1 << 8)) {
> >                 set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >                 set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
> > -       } else if ((c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_vfm <=
=3D INTEL_P4_WILLAMETTE) ||
> > +       } else if ((c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_vfm <=
=3D INTEL_P4_CEDARMILL) ||
> >                    (c->x86_vfm >=3D INTEL_CORE_YONAH  && c->x86_vfm <=
=3D INTEL_IVYBRIDGE)) {
> >                 set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> >         }
>
> Also, please add a
> Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural
> constant_tsc model checks")
>

Thanks for reviewing. I'll send a v2 patch with the suggested changes.
