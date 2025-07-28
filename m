Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F68EEC3
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753678129; cv=none; b=c6fEA0iy6WdG0nm+E64ppP/JAFra0LZkj0roqE9D2yaX1/t/9/Q877E14sA+IuNcHQH1DFhbOKmJrefK5qSGVv49NUIWruY2pHNDbEF+HnUEzt6OqTJd/I7yEHlHoC2P/rN3K6N9MEYx+qhvt7S+8JsKO6nsZ20d+mNKN/dgKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753678129; c=relaxed/simple;
	bh=gUKMXU17IwJOI7LCLH6V8bkBVbIZTvkpLS/KBg8tk4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K093InnFYLydNONtgGhRlqOPRr2pbX1hwFZri3MxnLm2xE4jKYfurCD8C9Fh0+p6N8IwWG5OtESr7pe721z3vR6ylNB/Kc11pg4XoE+Xo0B+lwJgDNPG+TowEiiUKaGiEVpT6rOSo/GjgYTshKl+s4bVD3GoCT3JJKeJORrH4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TY9xdygk; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TY9xdygk"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-306db05b292so1366763fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 21:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753678126; x=1754282926; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQMLoqWQhQ5MNTIX9+9V8B8tt15mA7M1bW5OJ2Q/PHA=;
        b=TY9xdygkhVzc+v1tK7pibfr1jByTQWYHcNyEoya9pa/D0z42OhrypwW3u5ITINiqfg
         v3lYzmuWtMsX4Yy4b0oXavu5tt8UsLTax5ht/Zs+lu/yrDNnKVzKjkUEHv21u1s4LK4d
         hrh06l2+al5C2frZU9C4uv0VgFsuTnxPA9XtFaGKK4V3/Th63hvGq5nUY7l+EjjnkaoC
         8LUCLhl13WQve3Rh6QhV57v0m+NvxRIBRY4FBjH12aPjGNue6um9LgPmpT0e4ljJnK29
         QV7Fui4CIp4n/iszbASU+OkStvaQOCZ9HW7grH8jyPn3T+yrvBlswRE/RJwI2f7Ba2um
         dxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753678126; x=1754282926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQMLoqWQhQ5MNTIX9+9V8B8tt15mA7M1bW5OJ2Q/PHA=;
        b=BRAbFconGgg6Rbx0cjCqBDC7tO1WG0Z39bGENpHjPckH772KqR3lGGX6h/pLw8V6YG
         YMJPeBdX1x8t0iI+QX1iwhkEAS3iaSLuP2Q3RNP8fQKq/viN/c5/H0alk7tdwDQcQvQ9
         5nPhVJPLZ1aQLT/fQTmYolE7WsJs80Cf6eX94i4D+z0H+YTANsqKfsPuXxSaEY3vPJs9
         FuznGi6NBg0xPclolNhAt8Yc/bSHeRAIreV0DZZ5V0ZXTh6oqkm2ejCEuh4DkJswlTkZ
         jNN/2AYkiuN9Vran9LPgXl81Dv7x+VuJD5Sq5PNeDSXxyhAE8kpGM921TOQl1Hhgiskx
         xONQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF7XtB9jYvKVZPOrxnlP0zmw90o+ZmpVM0NJp2sBXpNLlo2S5L4BLw9H55hR5M8LIuPtc0iq712dcCgkZ2Qf8QzsaC0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YymVriYoFVIqRtd+/xy5Q2P1/T8bKyVaShXQYAPwrKmiMb/76k/
	gFBwc3oURv7oiwsaePg0qgNkN4j+Cri4fj1x4LDNqMkYi3mvJGDEXKcXEVWhSTYOl7sAW5XvJCS
	3PSSb57ukwWJ1FPtmOPGmrDat//enQNs0LRtR7IhBFdl+
X-Gm-Gg: ASbGncsJc2GfqC4qz68xVhhA0A2OmWuxAYEXXaWAHNiF/ZikRM7RlwN5EJkbz0sRwat
	ioL209zh993Kc1wCSJQX2xI/GzBbOlfq3eaXBMe9ZBCXmdoT6fIX48H95Bi1EbpQet7Sfuu0j6f
	GIPpVmjXFlEQ80m3gWWC90KudzZJCX7ygWhqUJFOp3f4aZbnol4rkuebqgkVxuG07npsXQMdscu
	R1Z9BhZ
X-Google-Smtp-Source: AGHT+IGSxCyhnHvN6/28pvM0FDfrpKnpP/wq1q/RwfMrs5WaSpldSMS8SGI4S1gQDkicnIvjlu/EJ3PcXpZug29E4Ss=
X-Received: by 2002:a05:6870:440c:b0:2d5:1232:b081 with SMTP id
 586e51a60fabf-30702030ca5mr6854179fac.29.1753678126581; Sun, 27 Jul 2025
 21:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com> <2025072842-require-smokeless-f98f@gregkh>
In-Reply-To: <2025072842-require-smokeless-f98f@gregkh>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Mon, 28 Jul 2025 10:18:35 +0530
X-Gm-Features: Ac12FXw-f8gcLikleOTRRqdRgl4oefUVUcPHLUw7NrAA789EqirUTXN736CWEE0
Message-ID: <CAO9wTFjuSch0Cc0yXV=PR9vkk+66i_4PSanrPqKYyXXhWjO-QA@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: masahiroy@kernel.org, nicolas.schier@linux.dev, 
	linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 09:59, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Jul 27, 2025 at 10:14:33PM +0530, Suchit Karunakaran wrote:
> > strcpy() performs no bounds checking and can lead to buffer overflows if
> > the input string exceeds the destination buffer size. This patch replaces
> > it with strncpy(), and null terminates the input string.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
> > index 3c6e24b20f5b..5e4a131724f2 100644
> > --- a/scripts/kconfig/lxdialog/inputbox.c
> > +++ b/scripts/kconfig/lxdialog/inputbox.c
> > @@ -39,8 +39,10 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
> >
> >       if (!init)
> >               instr[0] = '\0';
> > -     else
> > -             strcpy(instr, init);
> > +     else {
> > +             strncpy(instr, init, sizeof(dialog_input_result) - 1);
> > +             instr[sizeof(dialog_input_result) - 1] = '\0';
>
> As this is a userspace tool, why is this change needed at all?  How can
> this overflow and if it does, what happens?
>

Hi Greg. The primary motivation for this patch was the deprecation of
strcpy(). Additionally, I believed there was a possibility of a buffer
overflow if the initial string accidentally exceeded the length of
instr, although the chances might be low.
