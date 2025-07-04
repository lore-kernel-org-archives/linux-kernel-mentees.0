Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B302F3635
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Jul 2025 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625094; cv=none; b=cIDcffhT6VkzjBY7FAbZiNuWw2k/xPRzlIg1m3Hv/APW4S+OmkscLveT19YK6M6WeInt7BAsdikgGlLP5OaZwpdqe2FXU6Yo781tXbGnidmNoE3CrPMSD7V7RZZdNejw+aZOwy1J+z+CV/24kT3vknZKc17OLbSuNFwy5zjIxFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625094; c=relaxed/simple;
	bh=wP9Qj0PzhkA69kKg43kptmGrDAjSerq7qh9RYRvlzyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYURvIo6yR0fHXEt0d/an5Sq4Ef1TSow6Y8T0ZGEDtfGycq/SJnmj94i/zbiNQ4oo32rEif0uY66NMfmcVMNGls83ONmpgcYIM9ZGaA2vYpcyq51h9Dpq4uP9PQse7U06/ExYOJqSWowwAu2Yj5HG7wv599F5ptv5Dut9wpcBL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkPFbyMB; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkPFbyMB"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87f2aed4092so189532241.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 04 Jul 2025 03:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751625092; x=1752229892; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/xQKlBOT6P4mp+UtjZoqvRrQDEQeBJnUbiMyYywOQc=;
        b=RkPFbyMB7xCj0Dm5iD3xIwu1k/ug7jvqAVjhpi2tHXqX58WGvdyAW7oGs2v27A8juA
         czWu79biBddUn567z8OnUiYGxLLSbR6SR28aUe+6vHafQZDTWFgWrgD+k0iy5snDER0n
         hSTlzIMuwlrZ1wRrn1l315eFXBFshXZb/xUhhCTmBtiQpZ/VhdWlKHqxitt8L3KG4NQ2
         c2hThG3DeYcJFk/SDFK0IDGVq8oXrrOaDDiJQHVXo/VG9cjvCU9l1EX8yyKkCVrDbM76
         HETAGn+k1Lp+EbR3TfFm/DjaA8ByMd8rUmtd+qe3/xcg+161xbwHlLx/RbehBt7/X0yY
         whug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751625092; x=1752229892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/xQKlBOT6P4mp+UtjZoqvRrQDEQeBJnUbiMyYywOQc=;
        b=VE3BiRV0Hn9WaA5E8l0IQski+4PFcz10wALsjLe7Z2XmvK0/alcRkoaJgfO+wj2s0I
         hy7Gf4wEkehNi/PXrFgDg34cRcYO3IEBZB4oSRXQpYEwpk0RkcukCEFN2CxWdqXySCMR
         0tzWcA2g0D2eu7OpNjqqeuZNOT5hPIt4Lj5C0jS14huuWLLL3Y9yQgQStjBl5ggub8u9
         hJ70Ob7rbjUbde50x5D9BjOJ3rfuglkWsuetcQBZIy3JDPtgse9UJsKBMSwihpUDP9QH
         RuEHS5TrGx7UGSN4ajaEpLOuks6DXlc1fOfF1uGBwjGsZ2KNI2/2BunXg+Uaq4D5TFnM
         xSVw==
X-Forwarded-Encrypted: i=1; AJvYcCUWvynutW9xCGpJpykK7UXp5XsmlgVFnjrmwPRdhKP/H73xMzpbcNpHazsV8sEXILWcOU/U+Q/bMrqzdeq5P3BYAmayuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJCkc+TuCrB9+ZyDZmkNNwDDCqZ9c/IJI6kh3vEwbkxy+ORmYG
	wWqTxZQj2hdijSaEMs2fb2Q5Wn2NRS9UnMKjo2Zy8QJtf4uAwbKYRTLvhhXjss/V7TTAoBpOEh0
	VYX0e3YaeSXIUmRhMm3ArfI7eqeBQJQk=
X-Gm-Gg: ASbGncvqH3cozvUCJVk3teCm6wna2EIYHYYdfJn9y9ZFPZXSsDirkpeF6/CKp6Rl6fr
	0wrZ72dZ1vz5koNWHSSSc0NJ82WwqqMn0TEj6yEFk+89ZUJcemZaxV3QJ3zzmwq/CcIyWxtwc0J
	8gJt9LsJRBsX/We0BWe+VPbGWVkA1MifpZwk1xl038H5c=
X-Google-Smtp-Source: AGHT+IHlGXvGOQ2VphguWOiSSKOQc0Bs6jXMtNMB761owKR/vtv710GFY0N2XIuOKvtR5oMroxYEWMNrPRtQek1SGN8=
X-Received: by 2002:a05:6102:5a8b:b0:4e7:e5b2:f651 with SMTP id
 ada2fe7eead31-4f2f15acda9mr725020137.0.1751625092019; Fri, 04 Jul 2025
 03:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618215843.109941-1-usmanakinyemi202@gmail.com> <20250704102007.6354ce9f@pumpkin>
In-Reply-To: <20250704102007.6354ce9f@pumpkin>
From: Usman Akinyemi <usmanakinyemi202@gmail.com>
Date: Fri, 4 Jul 2025 16:01:21 +0530
X-Gm-Features: Ac12FXw73ZOhyBKhSbbf_4Qj4dulDh8DBNftU6kNO6qEo_c_P5vHGtCLcAhkE8k
Message-ID: <CAPSxiM_X8Ykz-kbBuFmT1vt_V3G4AkA3tE4wwbUniE-edoyJyw@mail.gmail.com>
Subject: Re: [PATCH] perf/x86: Replace strncpy() with memcpy() for vendor string
To: David Laight <david.laight.linux@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 2:50=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 19 Jun 2025 03:28:43 +0530
> Usman Akinyemi <usmanakinyemi202@gmail.com> wrote:
>
> > strncpy() is unsafe for fixed-size binary data as
> > it may not NUL-terminate and is deprecated for such
> > usage. Since we're copying raw CPUID register values,
> > memcpy() is the correct and safe choice.
> >
> > Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
> > ---
> >  tools/perf/arch/x86/util/header.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/perf/arch/x86/util/header.c b/tools/perf/arch/x86/ut=
il/header.c
> > index 412977f8aa83..43ba55627817 100644
> > --- a/tools/perf/arch/x86/util/header.c
> > +++ b/tools/perf/arch/x86/util/header.c
> > @@ -16,9 +16,9 @@ void get_cpuid_0(char *vendor, unsigned int *lvl)
> >       unsigned int b, c, d;
> >
> >       cpuid(0, 0, lvl, &b, &c, &d);
> > -     strncpy(&vendor[0], (char *)(&b), 4);
> > -     strncpy(&vendor[4], (char *)(&d), 4);
> > -     strncpy(&vendor[8], (char *)(&c), 4);
> > +     memcpy(&vendor[0], (char *)(&b), 4);
> > +     memcpy(&vendor[4], (char *)(&d), 4);
> > +     memcpy(&vendor[8], (char *)(&c), 4);
>
> Why not:
>         cpuid(0, 0, lvl, (void *)vendor, (void *)(vendor + 8), (void *)(v=
endor + 4));
Hello David,

This also works well. But, I think the "memcpy" is more clean and
explanatory . I can change it to this if it is prefered.

What do you think ?

Thank you.
>
>
> >       vendor[12] =3D '\0';
> >  }
> >
>
