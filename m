Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34BA15A8
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780254; cv=none; b=twUVd1FMMI/lRymhHdELecq3ZDYshVJkNr5U/lWNNqU/s/J1PaMCttYJcxT/4Mdvdpe8d/CTBJ6Tu7PUSL/0NRoc88Fi3mQntZsigZks28Q4hWEyYLmioF7cAFbH9wyUrgFafSQcoi9s+E8nHmPC5DLxNwo9EEjkm3q8FckieYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780254; c=relaxed/simple;
	bh=wk5XZ9Xoesnwv7BpUoCcwRfupjsCE7OBDZgYxGgI/rQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKhglrtm9GVj583sPZCOle/lCt9zANA2vsZTv2dNDxTUDx0hzqbOlJLM2/Ql+NWfQqoaUfQY9ibIF3z/vrNi7duGkINWWpyNP8LZ2YQXxaP9JOc9lSL2QdV0KHRLDkAtL6LhAnDXtQI6Y/Djq50fgsXqL0Xvhnt3kYCs6Jiel30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bm+LR4ki; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bm+LR4ki"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-73e810dc01aso2952733a34.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753780252; x=1754385052; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVgUoy1pfAxiiccKL1EGeyDQmYYL5g4stylxxDaAc4I=;
        b=bm+LR4kiOmWa8jLf3Wk8QG9DYLmMCjADAv5tFNhqPwAqnk+cEJAHaz76ETIiilWzbc
         AE5ndI56wrRDJ+LA/KuqHdv3YIMtAgacQD5YGsSPKtgU/GBT7KPgukt441Y37ho4QvYy
         5Kyb4MedvGyQ+FEvBnXCj5UGDXik/bPKoYMP7A5P8WIpZp1AhLjkevcZerzQwtmHUFLL
         cLFEDEji5uJYYNwHWllh2R/v7CIcfMAvng/d58Zll1H14TQGw5QdNMv/CNRWt+yMgByW
         qZDZVjUzy4fC+kI9mfXao5UXBeWz2X8gaJ8eyMgpp8e34C5JDGTIs1LFvM18uwOopKIf
         tncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780252; x=1754385052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVgUoy1pfAxiiccKL1EGeyDQmYYL5g4stylxxDaAc4I=;
        b=ghgC44zXPXynQqlRGhBDF/WUSm+d7pWoDIry0UoBj/Yt13hnJSmfbRi1ea5z4Q1/MA
         3bkiNYuEcLSERRyxOPPQmIOmfsJG8V8A+xzVyn2R9miRzrirHxFG2GqE08tNr+flcOQq
         BYMjCXmPFtIK21Bg76rcfPyjDbDbG7ruXklSGwqlk0LQJecWmTJYoG9E2+ufzPiT5ifO
         rhY2KbaHT5dg7Igkf+0TETGDyj3fSQitGxb0aeJ16f+OtxGEj7VFvdrn3hUhpEJoahtW
         HqtQG4EWxta0cJEe1PfOzwXpVOFsb8xJB6p62sw26pCsO3/Gu9928e24syAAdNlE0Ria
         AFxA==
X-Forwarded-Encrypted: i=1; AJvYcCX4PQPo0I/+LpQOi8Qpe2qpkSPKGzjiyWgdHTTCIqTVJHMZj5BarWa/KCpW2dVTKKNPFAGVj0mci/dgl5jzAR/POUBqDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxmJnq3rPudWkIca+2VFgtLlyADBpLVf2j7gcAPsSjDxqBOABF
	PWodSAK610WwkGP7NioPV8adWoRC7J44kbD2I/WYMI39vcQJFioLOLSZsni8rmZdKFkZTtDfplC
	6Qo5tp0fTuM7ebYGnuvyTbmc5+OK6GLc=
X-Gm-Gg: ASbGncspNwR+ONXmGvERrs52EVi2FPJv0iIOwW2b3fqtuT13m4dE9PrrXI70d0C5sdw
	48TKjf+apqeylpmLGBZYGOeAprmo2KD15E93F3ZSvC2XTf3YpXZ8rZT63L0Im54nhid4XKrmMr3
	5LlQ76D3yUfGHmiR0O9xnpqhJWKFf/prhJkLXiakWywDlbmEE32fNWAaKShsuWFBi2SqXYa0Ih0
	2biJU0s
X-Google-Smtp-Source: AGHT+IHrd6bOJN9L9i0wLAqStU6H0dOMIJiEcqH+r6EB0PtjIexDMQjYqPbwW8PCSfB99TZ/+c2XmdSCGs73XLWqcKw=
X-Received: by 2002:a05:6871:ea86:b0:2ff:92c6:51f6 with SMTP id
 586e51a60fabf-30701ffd2admr8099650fac.15.1753780251834; Tue, 29 Jul 2025
 02:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729042621.6403-1-suchitkarunakaran@gmail.com>
 <2025072925-lint-agreement-77e8@gregkh> <CAO9wTFg_jCUZ+DxXVDM11_715r6ALJ=HyRXkcBxhGrBUo4iVUg@mail.gmail.com>
 <2025072931-recount-stifling-73e8@gregkh> <CAO9wTFj1qCkhNG24hAWDfZqoJy4mhPFf6mKp=jg7GnaLmHix-w@mail.gmail.com>
 <2025072947-laziness-unlikable-e0f3@gregkh>
In-Reply-To: <2025072947-laziness-unlikable-e0f3@gregkh>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 29 Jul 2025 14:40:40 +0530
X-Gm-Features: Ac12FXwzdH2V2A5JwFiJLqVmS_WZQ4xv5WIo5FkdR20FIcyNONhvA_yMIZUZjG0
Message-ID: <CAO9wTFixNE8F23-29WCHB_b+WadyU+J_rcA-=Od5TOJg2+hGOQ@mail.gmail.com>
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

On Tue, 29 Jul 2025 at 14:31, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 29, 2025 at 02:24:43PM +0530, Suchit Karunakaran wrote:
> > On Tue, 29 Jul 2025 at 13:26, Greg KH <gregkh@linuxfoundation.org> wrot=
e:
> > >
> > > On Tue, Jul 29, 2025 at 12:23:27PM +0530, Suchit Karunakaran wrote:
> > > > On Tue, 29 Jul 2025 at 10:58, Greg KH <gregkh@linuxfoundation.org> =
wrote:
> > > > >
> > > > > On Tue, Jul 29, 2025 at 09:56:21AM +0530, Suchit Karunakaran wrot=
e:
> > > > > > Fix a logic bug in early_init_intel() where a conditional range=
 check:
> > > > > > (c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_vfm <=3D INTEL_P4_=
WILLAMETTE)
> > > > > > was always false due to (PRESCOTT) being numerically greater th=
an the
> > > > > > upper bound (WILLAMETTE). This triggers:-Werror=3Dlogical-op:
> > > > > > logical =E2=80=98and=E2=80=99 of mutually exclusive tests is al=
ways false
> > > > > > The fix corrects the constant ordering to ensure the range is v=
alid:
> > > > > > (c->x86_vfm >=3D  INTEL_P4_PRESCOTT && c->x86_vfm <=3D INTEL_P4=
_CEDARMILL)
> > > > > >
> > > > > > Fixes: fadb6f569b10 ("x86/cpu/intel: Limit the non-architectura=
l
> > > > > > constant_tsc model checks")
> > > > > >
> > > > > > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > > > > >
> > > > > > Changes since v1:
> > > > > > - Fix incorrect logic
> > > > > > ---
> > > > > >  arch/x86/kernel/cpu/intel.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/=
intel.c
> > > > > > index 076eaa41b8c8..6f5bd5dbc249 100644
> > > > > > --- a/arch/x86/kernel/cpu/intel.c
> > > > > > +++ b/arch/x86/kernel/cpu/intel.c
> > > > > > @@ -262,7 +262,7 @@ static void early_init_intel(struct cpuinfo=
_x86 *c)
> > > > > >       if (c->x86_power & (1 << 8)) {
> > > > > >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> > > > > >               set_cpu_cap(c, X86_FEATURE_NONSTOP_TSC);
> > > > > > -     } else if ((c->x86_vfm >=3D INTEL_P4_PRESCOTT && c->x86_v=
fm <=3D INTEL_P4_WILLAMETTE) ||
> > > > > > +     } else if ((c->x86_vfm >=3D  INTEL_P4_PRESCOTT && c->x86_=
vfm <=3D INTEL_P4_CEDARMILL) ||
> > > > > >                  (c->x86_vfm >=3D INTEL_CORE_YONAH  && c->x86_v=
fm <=3D INTEL_IVYBRIDGE)) {
> > > > > >               set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
> > > > > >       }
> > > > > > --
> > > > > > 2.50.1
> > > > > >
> > > > > >
> > > > >
> > > > > Hi,
> > > > >
> > > > > This is the friendly patch-bot of Greg Kroah-Hartman.  You have s=
ent him
> > > > > a patch that has triggered this response.  He used to manually re=
spond
> > > > > to these common problems, but in order to save his sanity (he kep=
t
> > > > > writing the same thing over and over, yet to different people), I=
 was
> > > > > created.  Hopefully you will not take offence and will fix the pr=
oblem
> > > > > in your patch and resubmit it so that it can be accepted into the=
 Linux
> > > > > kernel tree.
> > > > >
> > > > > You are receiving this message because of the following common er=
ror(s)
> > > > > as indicated below:
> > > > >
> > > > > - You have marked a patch with a "Fixes:" tag for a commit that i=
s in an
> > > > >   older released kernel, yet you do not have a cc: stable line in=
 the
> > > > >   signed-off-by area at all, which means that the patch will not =
be
> > > > >   applied to any older kernel releases.  To properly fix this, pl=
ease
> > > > >   follow the documented rules in the
> > > > >   Documentation/process/stable-kernel-rules.rst file for how to r=
esolve
> > > > >   this.
> > > > >
> > > > > If you wish to discuss this problem further, or you have question=
s about
> > > > > how to resolve this issue, please feel free to respond to this em=
ail and
> > > > > Greg will reply once he has dug out from the pending patches rece=
ived
> > > > > from other developers.
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h's patch email bot
> > > >
> > > > Hi Greg,
> > > > I've a question regarding backporting this fix. Can this fix be
> > > > backported to stable kernel version 6.15.8? Also, should I send the
> > > > backport patch only after the initial patch has been merged in
> > > > mainline or linux-next?
> > >
> > > Did you read the document that my bot linked to above?  It should ans=
wer
> > > those questions :)
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi Greg,
> > I did go through the document you linked. I just wanted to clarify
> > about the backporting process, especially since the merge window has
> > already started and it might take some time for this to be merged into
> > mainline. Regardless, I'll send the backport patch after the initial
> > one has been merged.
>
> As the document states, a commit must be in Linus's tree first, before
> we can consider it for any stable release.
>
> thanks,
>
> greg k-h

Hi Greg,
Thank you for the clarification. I now understand that a commit must
be in Linus's tree before it can be considered for any stable release.
I apologize for the repeated questions and any inconvenience.

Thanks,
Suchit
