Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DB2194A65
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 06:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753772021; cv=none; b=WQDVYRrWe//cfQdNc1w8FSBJHmEMVOZRc4MrX4ORqkBZipeLKT3cyY0UUvjn/wjoP72HgIW2XK7UWZNoXzGUGfuz4fe//XGXJvvPF1COS9FR0oDcr2xlMHnUDWcv83MhRInFqlFlmWUrnPJcoiXdAHZMq5pDeR3RtjEHebMwXyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753772021; c=relaxed/simple;
	bh=Qa2k+O9ONUtNQzfvM2ddzB+jWkO6eF9y9dLtD8Rhk2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2LzDzmv5XzKav7hiN4YAX7ruu2xa/V3FIqG3NICKdGX7/KfhhZLZ9A+h8jdSoN1JWWBI0+PLemvqlaPAIAZYlAg3Fui8MFjWl61MO5mtsA7BKNYzNofnRejFgiT+40VrT1hqzaqnDUKFSEFy4v5nrYX4yk+qxyras0LVNcBAqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNmW4L83; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNmW4L83"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-41eaf6805ebso2280075b6e.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 23:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753772018; x=1754376818; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8oMrM2DG3wTSCvEAhReTE879IMPRgtKQTc5AFpwecg=;
        b=WNmW4L83mPdWRbJNKm0VpWzw0dHldQX7VcsYwWpzZOkWwPemJo66pIZkv/tL9J865O
         0BiWo2Zr3kvrAXxlllH9ygHTVDCCYykn7PQr1sd89xCphRneqTIV55LZiAKK2F8/sXkn
         xVK1c5YXAIKdoPNS0zkDtzoTvKPCQcFdW8+AkBBn6TOUVBQh/pyeu8Vj8jk7qj/DW+FJ
         iVvzLrI6q+vvvonhsQXdUrNfI+6z1pFR2nOu0IuHt4W1KO5ecJwei4qfTZ94wcBjHYUe
         71tbigXL5D6nfoAH2CfI/L9XrauieRgm5OX8HHVdAkwC31Sra4hdkkWYk02isbRg6tYq
         uKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753772018; x=1754376818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8oMrM2DG3wTSCvEAhReTE879IMPRgtKQTc5AFpwecg=;
        b=R03A+aMrvWH75LcDW2ZSQBbOBv+cB3cwbkTdtEZKcGGo2Gz3/WTOUH32irPP1LckvX
         qPTWxHsFQSmwHx2JrvZmWnM6GKR8oHgRhQSjKhnJMFaJY6q0PsGIOpAv8IRYzM/igrhs
         aGNk+9AQ2RYjloCV+c430OkQEAo9A6EdJmUJTdqXDrYU8itxkuyfRVvnnyeBXGtlDTAX
         SarkFEQqC0FMiS2gFwPmh2kd6zgLsecgXRp1FTz6v5RsGQV/LPiZnazv/LqFGv6ek5Fk
         aq3Zlkjq4enh92snBEijHuOMScRcD4X0Om/4T4omlCnOyumve8N6uiPZZ9ObOO//7rnl
         Nz7w==
X-Forwarded-Encrypted: i=1; AJvYcCUQCLP/z+YW8zvTIVpKfiVyj1p1Olpaz4wJD/IhbviX5e0wB/mYpNpNnqv+B38Mb0Wmvj2myvWm0KR08riexzPTXBbgWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfIsnsPmMQvQWylI4tvPj3F26SG0oPxyoskn+3Sd4AjDlsp0z3
	VVkh5QGI+HeS7kMKxkh+U0Mf9X1hGrfD48yj91/wB0l7dEpngPDda0h0mMH0fan+0gLpvX1XyiQ
	O78S0v8oMIqxdng6/V6CiGZTnDbzIkVw=
X-Gm-Gg: ASbGncubasxbRtq8I0391pL3We6lhederZLDN46LnwyZHjuRbfGJ+FUcE+4EhWx69na
	Mifjo1k++eBp6uCku6gMMokBiULI7wHq7Yp0Jaz+YzbebKawwGxyXOX07XrNy1w+AXEsaqUeO2B
	1PVkYOWqnWXXAbcvJi4vaWXiPHt+Y0zBMPrHqezluCJIrKGTES7evBbzivczR6JBczZ85vj2cp7
	mJ095YC
X-Google-Smtp-Source: AGHT+IGpPmfapoSxVAuAEpnGB+WPjA19xRC2eF1iMa0CxM6Qnw9RztltPYTcQ4+gK81dBl74lXZzWiMoA5skvxn3Mqk=
X-Received: by 2002:a05:6808:1304:b0:41e:9fd0:bd1e with SMTP id
 5614622812f47-42bb8c69cf8mr8317190b6e.22.1753772018360; Mon, 28 Jul 2025
 23:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729042621.6403-1-suchitkarunakaran@gmail.com> <2025072925-lint-agreement-77e8@gregkh>
In-Reply-To: <2025072925-lint-agreement-77e8@gregkh>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 29 Jul 2025 12:23:27 +0530
X-Gm-Features: Ac12FXysbuF8b_kl530HuA_WHikHLLxsbsoDwW8DimDPMjY2drtLGHEAmCj7-XA
Message-ID: <CAO9wTFg_jCUZ+DxXVDM11_715r6ALJ=HyRXkcBxhGrBUo4iVUg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/intel: Fix always false range check in x86_vfm
 model matching
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, darwi@linutronix.de, 
	sohil.mehta@intel.com, peterz@infradead.org, ravi.bangoria@amd.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Jul 2025 at 10:58, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 29, 2025 at 09:56:21AM +0530, Suchit Karunakaran wrote:
> > Fix a logic bug in early_init_intel() where a conditional range check:
> > (c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_vfm <=3D INTEL_P4_WILLAMET=
TE)
> > was always false due to (PRESCOTT) being numerically greater than the
> > upper bound (WILLAMETTE). This triggers:-Werror=3Dlogical-op:
> > logical =E2=80=98and=E2=80=99 of mutually exclusive tests is always fal=
se
> > The fix corrects the constant ordering to ensure the range is valid:
> > (c->x86_vfm >=3D  INTEL_P4_PRESCOTT && c->x86_vfm <=3D INTEL_P4_CEDARMI=
LL)
> >
> > Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural
> > constant_tsc model checks")
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> >
> > Changes since v1:
> > - Fix incorrect logic
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
> > --
> > 2.50.1
> >
> >
>
> Hi,
>
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
>
> You are receiving this message because of the following common error(s)
> as indicated below:
>
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.
>
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
>
> thanks,
>
> greg k-h's patch email bot

Hi Greg,
I've a question regarding backporting this fix. Can this fix be
backported to stable kernel version 6.15.8? Also, should I send the
backport patch only after the initial patch has been merged in
mainline or linux-next?
