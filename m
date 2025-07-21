Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC792DECC5
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112846; cv=none; b=VcZ4JuJOcHnSPigsZU1S6R4SqfSF+1GxJkvc7m61TqTJn88mNeEsS7IELgDX2WRmxp4xsU80A4TMG7MyqGhdtVqmeYlsiC/IcERQUZvu9BnawKYO8CFcs3dIc12WrNNHWrPxluiMOCW3HQOM4DGNM1hQTbsqHSQMqU//U7SaFzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112846; c=relaxed/simple;
	bh=JGN33wEJGPqudqX5w145Jh0yXvNgU9KTiqxmC8hFPY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IourQC/KEWiGJ93Mu0x+8Xkpz9y4a+sWbfxLLjI38a7adRYNxLw4/BhVoEaqPY/wlih2i7+tp9JxoGxKyDTQcbOv/r7KvKcPY9OsqoWW4foQnMEyoPKKC17nTq8+jImvjdM4VESsUrGJtSjXxMa4uXV/njt7ksLMC9GYa4a7MRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e++SXlWX; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e++SXlWX"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747e41d5469so4826770b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 08:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753112839; x=1753717639; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGN33wEJGPqudqX5w145Jh0yXvNgU9KTiqxmC8hFPY8=;
        b=e++SXlWX9C3Ea4JfZV5DKlHgQROJAfYpxfPOA3SDQkO5cO2Mr8RZlTf/JZw3XEcDhU
         j63DQWR2UCTIhEPrjiO4zvWwiqLUONC/01Yw1B9Kqw3kV7Rlc5vr3GpbkJnr/UnvYmcC
         TKonjS6bBDWyEXT+yqVw8o9n6Vllwoh8hCeWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753112839; x=1753717639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGN33wEJGPqudqX5w145Jh0yXvNgU9KTiqxmC8hFPY8=;
        b=MJUAB5s5O57JsTfAbJHNYLiLb+C9LlIQssLXL8fIEHL8Yqy2V//WpF/5tkxC8Gfpio
         DDRYhrpTNf7od4A2qBja/72rTHzLdPO8r1g+8tgu0B3qW78/qmcX/Q/j2c1WDZbTdhC1
         OvsAwWT4g5/TLuwbF7bNKJDYQOhujvQnlFAOHA/Kn9OTimIkTkxoiWLDAjj6UyO9UK7K
         SkjYkXVtgjIeOrIAru1ZusfdlqqJaRw6JLw/myFJ9NuPYY4PK1MLFe4260e+MUeYnn3i
         +tK929ZcBeJs8iaoAl2fFLFBhpGKWiXfEbjwnTzIXXGjui3rjQWMQLT2ja06SAYn0AgR
         5jFg==
X-Forwarded-Encrypted: i=1; AJvYcCWHFzBmBo5HyBwxh5m2UmaRgnIcwlTYz5+V4PqBec6GeFzaX+4q+q7jVidCPyhlbq41RIJ27OQf5PzG7w0+0T/p6Zr/6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YziPbdmamFUsVXCanNnBVptAvYzkkkB4oeIfXwWsPw2Qfd/u7OT
	DELMly9H3d0i3rLLHMpLFBAzwyEPyOz/JoFTPfARO7umCnkSAIsqGFvO+7YpsIfY/uqY9GO34R+
	JGYg=
X-Gm-Gg: ASbGncvENSf/qVZvWMQH8uhzJGOE+psfIlBEuGS9n4kxsjsb1wjuIbTMKzNgaUCur6r
	ALf/uwZHdN2dafLF+EUQ0rfQeInblwb2EvY08prCKiVYlKJ1XkDjJICbnxJyhdlpttimrRgOBWD
	0StROuYmTR4PiyBEFLvH/RuPpcwAHjo2GjkG/ibxuTOhedZ/EMla9/NJDwOSyzx10neeBSCWsQq
	rKUVMrDsIKPsYjf5H6sMXF+CjP2chqMIdQKMPD3VHMsACySDI/tbhV/VLjGPz2vYOB+HwPdz4jQ
	DmdfAD9ltr4Fxdwo1YPgESHNjDWJmEOCyqoSCS7T4/aCE2W85S9f+g9E3rz8+WaAHcinW0NS5uj
	zYnRveyNG2sjBXgbejkF3kWCATaATKZJiEXalYKYlO1atZAD7Z9SqKpCgQxXJ+gpxsA==
X-Google-Smtp-Source: AGHT+IHlqjLZ5F1xqAIVmXTyhFBRxyPhkfb3dYuqX1rS4MB3Ofd/CTz+emgpD0PWhxf98XPDu6vGJg==
X-Received: by 2002:a05:6a00:1acb:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-7572357ee82mr28687898b3a.6.1753112838811;
        Mon, 21 Jul 2025 08:47:18 -0700 (PDT)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-75e17d2526esm1271685b3a.81.2025.07.21.08.47.13
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 08:47:16 -0700 (PDT)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso4671697a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 08:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF3UuQnC1rX7/rLRUiFB//M1A4EQID4kLlzRqN6jvfMGVbO+ekj8AUehSPRsz9c980aFpUf5BfTBGL0+8BsU7OCsx77A==@lists.linux.dev
X-Received: by 2002:a17:90b:224c:b0:313:1769:eb49 with SMTP id
 98e67ed59e1d1-31c9f3c570emr31120725a91.8.1753112832610; Mon, 21 Jul 2025
 08:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-3-me@brighamcampbell.com> <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
 <f0d300fc-0141-4eab-a888-d1d32778f5de@tecnico.ulisboa.pt> <DBGPVFN5DTGU.5UTP35ALYS2Q@brighamcampbell.com>
 <73686985-27c4-4a4f-8b75-18df112367a7@tecnico.ulisboa.pt>
In-Reply-To: <73686985-27c4-4a4f-8b75-18df112367a7@tecnico.ulisboa.pt>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Jul 2025 08:46:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xbijn6j9Oxc88k3iq+wSF9bV76X6uw4ADWWxwR+q=o0w@mail.gmail.com>
X-Gm-Features: Ac12FXwZOEsXzYGcRcET3f78cuk2K33ah-CaSaDSzBavG_qBk9uaa3AvVsHX2XQ
Message-ID: <CAD=FV=Xbijn6j9Oxc88k3iq+wSF9bV76X6uw4ADWWxwR+q=o0w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Brigham Campbell <me@brighamcampbell.com>, tejasvipin76@gmail.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jul 20, 2025 at 4:19=E2=80=AFAM Diogo Ivo <diogo.ivo@tecnico.ulisbo=
a.pt> wrote:
>
> On 7/20/25 8:50 AM, Brigham Campbell wrote:
> > On Sat Jul 19, 2025 at 11:10 AM MDT, Diogo Ivo wrote:
> >>> nit: can just be this:
> >>>
> >>> struct mipi_dsi_multi_context dsi_ctx =3D {};
> >>
> >> I am not an expert here but I was under the impression that this is on=
ly
> >> valid with C23 while the kernel is written in C11. Is there something =
I
> >> am missing?
> >>
> >> Diogo
> >
> > You're right, C23 was the first standard to bless the usage of the empt=
y
> > initializer, ` =3D {};`, but if I'm right, it's been a GNU extension lo=
ng
> > before C11. At risk of being pedantic, I'll draw attention to line 580
> > of the kernel's root Makefile:
> >
> > KBUILD_CFLAGS +=3D -std=3Dgnu11
> >
> > The kernel is technically written in the GNU variant of C11, extensions
> > and all. In fact, the first patch of this series uses optional variadic
> > macro arguments, which aren't a part of any official C standard as far
> > as I'm aware.
> >
> > In any case, a simple grep for some forms of the empty initializer show=
s
> > usages all over the drm subsystem.
> >
> > That said, I don't know if GNU extensions are formally documented or
> > where one would look for that information. Importantly, I am by far the
> > junior as far as kernel coding is concerned. I yield to your experience
> > and I'm happy to change this initialization in v6 if that's best.
>
> I found the documentation here [1], and it does state regarding designate=
d
> initializers that "Omitted fields are implicitly initialized the same as =
for
> objects that have static storage duration." so I take it that no v6 is
> needed :)
>
> Diogo
>
> [1]:
> https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html#Designated-Inits

Right. I think the key here is (as Brigham said) `git grep '=3D {}'`
shows countless hits in the kernel. :-) ...so we're not introducing
any new compiler requirement here with your patch. ;-)

-Doug
