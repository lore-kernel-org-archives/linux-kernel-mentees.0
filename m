Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6835275B04
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753779297; cv=none; b=JnUWURDwLedBcEcjusn4kbbxwvUadwNd17kWATZv41OVWxPYPLl5/CVN2O8F39DycjILUnT6OoNr90aNQAJTq0eaKF+KXfx/KHU2HUr2ldvOzv+1+qSKPU0QDJYfx9LxFaWVUvRCw/J4ND1MhCoeWn1u6V1ivLah5u1O62W9LEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753779297; c=relaxed/simple;
	bh=T3zyoANKYAJ4AvVpw72Tq73mKPpbJLuoebt+YaG1elQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGgG/iBsNsmI/S1eZISvQdLGNevgpTuiEuTGKW553z7F+LRmUTB1bXkEHet7rLYLLAWd5T8qv8EmNCBWC1mEfXcYxlFtaWbVpQHSlHBF7z4n72p3uMtzmMD7wLbEEF6NVqWI2shmOZHSMWuiHTfH/6WA3Psdeb+y4Ywac71UJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPn3dBS7; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPn3dBS7"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-615df2e8c27so2841276eaf.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 01:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753779295; x=1754384095; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfbsxkFJQf8cWQTKmEBs/1hRt5cWB9+/Q3iqwitKzTg=;
        b=jPn3dBS7odtziMrkF0nh43y11xl0bXYJdhG0QCXtlB8J3gaGl22Co2avt1N/4RJa/t
         wUXQ0u8PD09uD/i4XoxWn+ZAvXVulYdOKQCMih7vjwuVWejjf1252ZfivHXSGR7Qqig1
         042CwR1/QnTvtiGslXJRCkErRtPTT4H+hF8P0WPrZGXizVno2eMQsu4x0VSWtZ1fkiuj
         OhyzYd3p8qT9vRVqy7qivNgquJMA2YKxUc8rsR19zng4DVJ4qZuaQnSxK82TPYy2yjy0
         WLQcxCzj2QB7C9nuA7Akzlrrv/KwejM0GOy4KxZB++ITA+oauNdjFjJiD6OiKU8B2S3e
         Ecow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753779295; x=1754384095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfbsxkFJQf8cWQTKmEBs/1hRt5cWB9+/Q3iqwitKzTg=;
        b=Y+pYtMCzuBJe8VKBR/K3OaQ0yORbg/HM3kOw/nfCQjZfO20rt5kkOA1h5K/PTRbbr1
         8GhoSSQrFmdEdK4ABSEc3kClnYnCZ5BfqcM03DPVP5FJiFIas7sW1cuil0gQ/63bo6sp
         qkGOvFTeOyJhkdSQ9N9ehTjhIzpPlJNrbLI7K4NXOLSvmMS75chzxV4QsXkxGZhuJBte
         8wXzz/neIFg5Cqq0dkouHWf/of8dnUCJUuEoXTsREecYIv9FkdBQs7x7bVb1A8xlH6G0
         kPlGHm3WeudePaw5wrFLd0g4YPiTXYm3gLhpePDxVFXsXG+MvJ/cVymFAyxga+BS4utl
         Wn4A==
X-Forwarded-Encrypted: i=1; AJvYcCWYv68h2fvfVRQWbAYO11OLPsL2tj8XQFBv2+ilLtzJDptsyfoUt2XWeNbpLccc1OVwBla6gJuWziPq5pRyFosNBowVYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YygyNgUh9ah/b3Jfql0jn1Oqe1G66JeicE66nfl519h0riM+9/y
	VmBwFa88BdNldkQsEX+PPeCC3/XoYl+M+O8DB96X0pA0HtWdMde8oJlNbvGU8+NdkCBqj9/5ldz
	fo4V1ZkpfLtzVi1ymJLvQ+K2yWg7Y+7g=
X-Gm-Gg: ASbGnctvJI0FmW5j+15g+vPWdmoUl4PmV4UpLJpI3TTJLY/rT/PpOf/xePYlXmRh9BC
	VsU5twJ+jDtrO/EK37+q3bU6XDRN3CP+ms0T2hdGC+jdM//q9KqnXaEbLeOHrXvFUTmeJ2Wh/lF
	MGDnBBFyoxBjZtuC8ZUt3YU6oSzwGf/k076NbQvqoZrPW0IVO32YLCDFks0U/EaaizrmNQBK1BI
	2W+evjA
X-Google-Smtp-Source: AGHT+IGTcd9NOa90kmOr1VvjB20fRDPHUxTkmJDOv2L7UxY1nAmAc0lKtrGG4k+Ud+Hduw4Tdeh+owTgWq3fUeeUddQ=
X-Received: by 2002:a05:6870:390f:b0:2d5:b914:fe40 with SMTP id
 586e51a60fabf-30701ace60dmr8965460fac.20.1753779294625; Tue, 29 Jul 2025
 01:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729042621.6403-1-suchitkarunakaran@gmail.com>
 <2025072925-lint-agreement-77e8@gregkh> <CAO9wTFg_jCUZ+DxXVDM11_715r6ALJ=HyRXkcBxhGrBUo4iVUg@mail.gmail.com>
 <2025072931-recount-stifling-73e8@gregkh>
In-Reply-To: <2025072931-recount-stifling-73e8@gregkh>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 29 Jul 2025 14:24:43 +0530
X-Gm-Features: Ac12FXyqLsqk5XOEKlKg-Vrv5qDx8UbUsXGBmuVo13r_qFb-1txgM8c-57KVn1s
Message-ID: <CAO9wTFj1qCkhNG24hAWDfZqoJy4mhPFf6mKp=jg7GnaLmHix-w@mail.gmail.com>
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

On Tue, 29 Jul 2025 at 13:26, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 29, 2025 at 12:23:27PM +0530, Suchit Karunakaran wrote:
> > On Tue, 29 Jul 2025 at 10:58, Greg KH <gregkh@linuxfoundation.org> wrot=
e:
> > >
> > > On Tue, Jul 29, 2025 at 09:56:21AM +0530, Suchit Karunakaran wrote:
> > > > Fix a logic bug in early_init_intel() where a conditional range che=
ck:
> > > > (c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_vfm <=3D INTEL_P4_WILL=
AMETTE)
> > > > was always false due to (PRESCOTT) being numerically greater than t=
he
> > > > upper bound (WILLAMETTE). This triggers:-Werror=3Dlogical-op:
> > > > logical =E2=80=98and=E2=80=99 of mutually exclusive tests is always=
 false
> > > > The fix corrects the constant ordering to ensure the range is valid=
:
> > > > (c->x86_vfm >=3D  INTEL_P4_PRESCOTT && c->x86_vfm <=3D INTEL_P4_CED=
ARMILL)
> > > >
> > > > Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectural
> > > > constant_tsc model checks")
> > > >
> > > > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > > >
> > > > Changes since v1:
> > > > - Fix incorrect logic
> > > > ---
> > > >  arch/x86/kernel/cpu/intel.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/inte=
l.c
> > > > index 076eaa41b8c8..6f5bd5dbc249 100644
> > > > --- a/arch/x86/kernel/cpu/intel.c
> > > > +++ b/arch/x86/kernel/cpu/intel.c
> > > > @@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo_x86=
 *c)
> > > >       if (c->x86_power & (1 << 8)) {
> > > >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> > > >               set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
> > > > -     } else if ((c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_vfm <=
=3D INTEL_P4_WILLAMETTE) ||
> > > > +     } else if ((c->x86_vfm >=3D  INTEL_P4_PRESCOTT && c->x86_vfm =
<=3D INTEL_P4_CEDARMILL) ||
> > > >                  (c->x86_vfm >=3D INTEL_CORE_YONAH  && c->x86_vfm <=
=3D INTEL_IVYBRIDGE)) {
> > > >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> > > >       }
> > > > --
> > > > 2.50.1
> > > >
> > > >
> > >
> > > Hi,
> > >
> > > This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent =
him
> > > a patch that has triggered this response.  He used to manually respon=
d
> > > to these common problems, but in order to save his sanity (he kept
> > > writing the same thing over and over, yet to different people), I was
> > > created.  Hopefully you will not take offence and will fix the proble=
m
> > > in your patch and resubmit it so that it can be accepted into the Lin=
ux
> > > kernel tree.
> > >
> > > You are receiving this message because of the following common error(=
s)
> > > as indicated below:
> > >
> > > - You have marked a patch with a "Fixes:" tag for a commit that is in=
 an
> > >   older released kernel, yet you do not have a cc: stable line in the
> > >   signed-off-by area at all, which means that the patch will not be
> > >   applied to any older kernel releases.  To properly fix this, please
> > >   follow the documented rules in the
> > >   Documentation/process/stable-kernel-rules.rst file for how to resol=
ve
> > >   this.
> > >
> > > If you wish to discuss this problem further, or you have questions ab=
out
> > > how to resolve this issue, please feel free to respond to this email =
and
> > > Greg will reply once he has dug out from the pending patches received
> > > from other developers.
> > >
> > > thanks,
> > >
> > > greg k-h's patch email bot
> >
> > Hi Greg,
> > I've a question regarding backporting this fix. Can this fix be
> > backported to stable kernel version 6.15.8? Also, should I send the
> > backport patch only after the initial patch has been merged in
> > mainline or linux-next?
>
> Did you read the document that my bot linked to above?  It should answer
> those questions :)
>
> thanks,
>
> greg k-h

Hi Greg,
I did go through the document you linked. I just wanted to clarify
about the backporting process, especially since the merge window has
already started and it might take some time for this to be merged into
mainline. Regardless, I'll send the backport patch after the initial
one has been merged.
Thanks again, and I apologize for any inconvenience.
