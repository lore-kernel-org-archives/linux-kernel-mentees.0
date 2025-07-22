Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E721CCB40
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753156391; cv=none; b=IQhVvMPvIWA2GxPxm71MvMh6ahbunBm1LejfqMBka7fTWIIiZRXzC1A2yTXFAoZeQFDpsIeuRd2XWCqra3FSy0iTfX/KB9ucc4b1JU6GmMhmUkHXI7OVPhiD9eRZmUn7cNkqmKyTaMD8+Z3QilJgeleDoL54xHxeXcT3WnTpS04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753156391; c=relaxed/simple;
	bh=ad6zVFEWTXoS7B5hRyZw1sZ6+Wc2KApbQaX938jAh54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjNpdevcuvwguf8lhd59nrpYaH3wTTD6SobIhWKPu/dPjZdcF4Z0YKVDppwRYT2T8Ux9f5GBJiV9ioCoI0KJB7elsOKTlNaok2yJ32Yr0oFfyN6RNyeg7KrrVK11UQjKhRYGFIZ21svoML3awI7EZjPV+5/HPEnv50PPpq2tVEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCTy9gmV; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCTy9gmV"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-710bbd7a9e2so47441467b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 20:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753156389; x=1753761189; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+4A4Wcwmx0vcAwCCnC1T75w7LAAjengjw+UcaUHyos=;
        b=YCTy9gmV76glGtWvmGMr2hw7UKQ8O1FKC0t4TlWrMLbtCHY22zVkXaOyof1eWat2st
         bFDw5kitKTpykzfgWhQtJwOLQao2OUHy+aKHvgcS+R57PRoZ7PMfH9FUomitugg1InHr
         SlRYJ92Ma3AC+Svdop+1pQyAD62FS3JPF2rJpnPNaqtuCgnOVHia48kmRhCl8rVGfCuy
         PZ4oOEof3t2E8j0IO3ftoAJHHer4FfJcHUTus8mGvy9zCPwC5DP+vJFOGMy8RQmPR6XP
         h+lrhA2fkXc2Ek0Rn7QrcBLD79OAgkxBdi6gT+653DKO+HGnMl7wSzbXBm0azgpuLLKQ
         P0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753156389; x=1753761189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+4A4Wcwmx0vcAwCCnC1T75w7LAAjengjw+UcaUHyos=;
        b=ledy6EX/rx2cTIjl7ejlf9EbZGPOw4yniRkldWbEiyVKKNzLQ4Etf/JX/S9EMOrkIg
         VX0LThbfqxdkqHOe104Te97Xq6v96jobTsAlrw2mOLTQT0Ow4yrRcXq+ySHEoZ5YVEMh
         3moi6dc/doRxLWjHFJQM+vPdsuHSPu1a33kNhyjpNoNK9s4uUbC2p3o/YyGGeTS/UQhB
         lcIv6/dADBI0oXs8m1jYkleW5PvdGDnZR2HtJZA3y/PMtetCcvlPbirOj/wQnMlHxu6F
         enK/ZZhJ4h2+FD3OQDAyM/bHiILUZSgE5qJTgW8OZX3lpW8h/63csjb0inOYCA8TW1l7
         ouKA==
X-Forwarded-Encrypted: i=1; AJvYcCXf4AxnrT7Y3hpaADjDnEyzKk/BrzIaI18wPEWPIIChgLgrPWPuwQTzim7YQtFvgHm1kGVlOEvGnu93sef4CifwQqPIrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YykFDL4VZPtmo6RcJGcdEu++uMNWavxj70Sp2Wmtb9BTEWNqehG
	GObRMR3rztgpB4Uu/qrks90Xq15vY5BnazpVe0ec/WWW0oBkRDvPTwQB+76u82MkaOzAYHMPeJ0
	6We29sFaQGlR8oSTu0clU3YvAFQ5Qs8M=
X-Gm-Gg: ASbGncsTs41hjJz3yqNCGA5o7ipTA0eWPtvHp+qHPLG0GmZZH3JTA7K18zKB856DvJe
	y9nY3RV0VcOJrTmOSV7ggr3aTjkkNljyJGbGYm879k9IGJgQl3k+Odb3t2bGeVVCsxYd87/Vnmb
	lAo+z+YxRE7Ex/OfJP1LcIRIJtNIhxYlyliPwdmsOkb20SBQR37RqMxWyjS6W9nkIsM8dmw6jL/
	cqrAH/HgFkdveiFpQ==
X-Google-Smtp-Source: AGHT+IE2FkHxdrwRPSB7f1DXPrRY4tIYyDgF/3RU5l1sRBiDems9bE84T4ajYrT80tKcsAE4Nmrz8g+X4HTBOTPFxGA=
X-Received: by 2002:a05:690c:48c4:b0:70e:2d17:84b3 with SMTP id
 00721157ae682-71837547df4mr306229807b3.37.1753156388642; Mon, 21 Jul 2025
 20:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aGjUpI1yNjEhSiAq@brak3rDesk> <CAG+54DZQC+-6E-P3D4BUtVujNegL1qKpcB5SGh28+rX5hrHFiw@mail.gmail.com>
 <2025071801-driveway-curly-698c@gregkh>
In-Reply-To: <2025071801-driveway-curly-698c@gregkh>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Tue, 22 Jul 2025 09:22:57 +0530
X-Gm-Features: Ac12FXyMU8t_OUOIvb1DtwpsQJHRb5Os8gf_VjBQVLO8HO3XkJ8g8JphfHbx7A8
Message-ID: <CAG+54DZS36Lp3Wc2nh+uSR14GPOWK+LJePp-jW1oB13uGtiSHw@mail.gmail.com>
Subject: Re: [PATCH] arc:kernel:perf_event.c : replaced sprintf with sysfs_emit()
To: Greg KH <greg@kroah.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, vgupta@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2025 at 5:18=E2=80=AFPM Greg KH <greg@kroah.com> wrote:
>
> On Fri, Jul 18, 2025 at 03:57:20PM +0530, Rujra Bhatt wrote:
> > Hi,
> >
> > On Sat, Jul 5, 2025 at 1:00=E2=80=AFPM Rujra Bhatt <braker.noob.kernel@=
gmail.com> wrote:
> > >
> > > Replaced sprintf() with sysfs_emit() in sysfs*_show() function in
> > > perf_event.c file to follow the kernel's guidelines from
> > > documentation/filesystems/sysfs.rst
> > > This will improve consistency, safety, and makes it easier to maintai=
n
> > > and update in future.
> > >
> > > Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> > > ---
> > >  arch/arc/kernel/perf_event.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_even=
t.c
> > > index ed6d4f0cd621..424ec072c441 100644
> > > --- a/arch/arc/kernel/perf_event.c
> > > +++ b/arch/arc/kernel/perf_event.c
> > > @@ -648,7 +648,7 @@ static ssize_t arc_pmu_events_sysfs_show(struct d=
evice *dev,
> > >         struct perf_pmu_events_attr *pmu_attr;
> > >
> > >         pmu_attr =3D container_of(attr, struct perf_pmu_events_attr, =
attr);
> > > -       return sprintf(page, "event=3D0x%04llx\n", pmu_attr->id);
> > > +       return sysfs_emit(page, "event=3D0x%04llx\n", pmu_attr->id);
> > >  }
> > >
> > >  /*
> > > --
> > > 2.43.0
> > >
> >
> > Gentle reminder for the replacement of sprintf() with the sysfs_emit(),=
 kindly
> > review it.
>
> Why is this required?  There is no bug in the current code, so no need
> to change it at all.  Please just use sysfs_emit() for new sysfs files,
> no need to churn the tree and change all existing entries, otherwise we
> would have done this a long time ago when we introduced these functions.
>

Hi Greg,
I appreciate your feedback.

I wanted to bring the formatting in line with the
latest guidance, especially since sysfs_emit() has become the recommended
method for sysfs output. I see now, though, that I should restrict myself t=
o
using that helper only in the context of genuine bug fixes or in the course
of adding features.
I'll make sure to only use sysfs_emit() for new sysfs entries or when
modifying existing files for actual bugs or feature changes,
as per your guidance.

Thank you so much for pointing this out.

regards,
Rujra Bhatt
