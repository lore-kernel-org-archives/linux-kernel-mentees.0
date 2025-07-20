Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41137149C41
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 20 Jul 2025 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753050273; cv=none; b=OmQmDehvipeqqu37Y9S0wRZZfSv0PzZs2YPZM4U65IEaGHh6ZbVBlrzviz7VYGvpcwETDZe5vy/H5mWBuqFWLAc764oKsItEjDjIM0kzDpLWDSwOPed8VE7Ppn/J6ZrEoR4aR8EDF9dKLExRPmmHmXyIMKqvjRvtgDoi/FEUV+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753050273; c=relaxed/simple;
	bh=y5LC0CbSuFl9NodbMROjJOIBUBjEQ6RAAWf2BUXgy1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JyPUCy+PRla3v3nEDLnmcwN4rAiTlo1+AQ3+fCMphtOVXFgdpufeZ8p25ra5pkwJTownvfgdpxXhNsKw4dRrNhTnPOdktyAvweW2u6LhRdOjyBsEaBe1hbo4rx8vjIkS6X0cagk4L3xmAcRbH7o4pD5h9+KXGMtFvbVKsKA3F6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcDFnfFl; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcDFnfFl"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF6A8162E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 20 Jul 2025 22:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWiUN75vHFKo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jul 2025 22:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3133B814C8
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3133B814C8
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NcDFnfFl
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3133B814C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 20 Jul 2025 22:24:31 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-60d6303a11eso1623343eaf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 20 Jul 2025 15:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753050270; x=1753655070; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5LC0CbSuFl9NodbMROjJOIBUBjEQ6RAAWf2BUXgy1g=;
        b=NcDFnfFllWUf0LoXm0DQHxpKViwXIVKRmLKWy01SfFF0i7gsTTojOREp+/XyXpkGDW
         XpxzoQqtpY4Yr9jEN0L279wRroDxOVFVofQ52TmoKc92yMaTGgj2+5IMKFkkDnDZz10j
         IuS+tYIaJK6V0zXrQs0WlNfZg24pmZoAm4h6aYhYnk2ac08LkjYdmFHOEADEDeuvv96H
         gC5g8Tur9gLw11dHNdOosasxxDODN1ApJQ2+FEpU1FhkCSnT6NgoXq5/pMv9ZaAwXOZq
         Z5iUxI0Yvz3MEGJNymbWWz9MRR4Q6r1tt7BOB+dy07yNNWWsZzBAoAi7zUZh3jCOHueO
         2ZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753050270; x=1753655070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5LC0CbSuFl9NodbMROjJOIBUBjEQ6RAAWf2BUXgy1g=;
        b=GYUcHef31BC0bITIYCcYirwCqmGTUwqncufQF4qnpDGAGpYRHJZc86Q/IYEMdqJENA
         KAsO/ANczwbkj4sPMdv9a2Oy/jE+HKQhNAnSk5luqmwVrbR7+bfyGuvXVKDtYkm6jx2N
         s+R/AGWt1PjQY6eapXZZ2ciUg0+oxoBqMGaM5M1tHc0SYhrFbqmCvLyNl38zv//KWxMt
         srs3PteXeCBP78mM5PXXg086zOe0wH/sFygrqeqk8v11Ry+Vvm2xmL+/QgFW/ZFsa5+G
         lTivnhJZxsNFj0nKMTJZS7KGn0D2fffSIoy4cSU/zZhdhwWSnOhNqcPOuEs8MuiHNuxK
         mMNw==
X-Forwarded-Encrypted: i=1; AJvYcCVZW8Cd7EjJ/t9tylejGnGhgujA4Kqb0/g5VPrklMKrZB3ZlETnGR9YBAMt8imECftDih2s4WQDQQ7pmERhCnsVqrPOhg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz/yj+LkULVaKAJ5HA0166YcCBSkKxsANDNm4okBx6NGiqPhTOs
	2hZi1ZY/8aedVQcv6oNMYiLud3QO2thmhv0DeaO4rZ0DYAhv5Z/q9m4g9McQ/VTLZQHTE8bWKFy
	2UJgCDx7npFwpSnZQpGNF8cdiceXbfWc=
X-Gm-Gg: ASbGncu9dLwsgN2i/9o0VnLCohGGL/3gZr0x3b4nRlBGOfNpgqPpHgx9fMbSJw2ZHIF
	rIwO1y8osEMF4f1srqU/795qcNDLT3nq5KbiTlIzk+91m7iJFoDl9dN9m4MgJ3ZJmpzRNCtYsfL
	QEQotl8VcMf+KeiB+Tzo8qhG86nR2RJjgIRvCEghXKV/2UYn2AodomU+hL3Hu8xA/tABnq7X6U7
	O/iUAzFYZnPVIxd+V4=
X-Google-Smtp-Source: AGHT+IEu+Tyy3FXrvYGcFIgMlqQYp3QRC3L8qXq57cmPH0GQIpPVuedeeNR9BNNjTO8mDFmQ468D3yWuUk+Bt0j5n54=
X-Received: by 2002:a05:6808:11ca:b0:404:dad4:f971 with SMTP id
 5614622812f47-41cf06d2173mr12335744b6e.33.1753050269971; Sun, 20 Jul 2025
 15:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716182220.203631-1-marcelomoreira1905@gmail.com>
 <aHg7JOY5UrOck9ck@dread.disaster.area> <CAPZ3m_gL-K1d2r1YSZhFXmy4v3xHs5uigGOmC2TdsAAoZx+Tyg@mail.gmail.com>
 <aHos-A3d0T6qcL0o@dread.disaster.area> <trCbtX-saKueJEbdl8AzWARJReyojMKsRC0LGW1Wb72CJsztLYdHNDFrGndVe0KMtU82iSTw2zcsZi4OZhZOlA==@protonmail.internalid>
 <CAPZ3m_iwS6EOogN0gN51JcweYH0zuHmrgVvD7yTXTi1AoDA7hQ@mail.gmail.com> <w5zac6jzwncscbhnihlfonbp7ac4jsf7d4ge7uo4fpsqcloeil@ylxill2zypfn>
In-Reply-To: <w5zac6jzwncscbhnihlfonbp7ac4jsf7d4ge7uo4fpsqcloeil@ylxill2zypfn>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sun, 20 Jul 2025 19:24:18 -0300
X-Gm-Features: Ac12FXz69GwbXld9XQpO0U3jThNU9FWgKF0MZf-FZqTtSuOTgWkXnWulPEr1LFw
Message-ID: <CAPZ3m_gFwBr1eWH_g6j8H8hBgeDM+KN0HGO-KzRTT1dMFx1RYw@mail.gmail.com>
Subject: Re: [PATCH] xfs: Replace strncpy with strscpy
To: Carlos Maiolino <cem@kernel.org>
Cc: Dave Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 20 de jul. de 2025 =C3=A0s 10:35, Carlos Maiolino <cem@kernel.org>=
 escreveu:
>
> On Fri, Jul 18, 2025 at 04:10:39PM -0300, Marcelo Moreira wrote:
> > Em sex., 18 de jul. de 2025 =C3=A0s 08:16, Dave Chinner
> > <david@fromorbit.com> escreveu:
> > >
> > > On Thu, Jul 17, 2025 at 02:34:25PM -0300, Marcelo Moreira wrote:
> > > > Given that the original `strncpy()` is safe and correctly implement=
ed
> > > > for this context, and understanding that `memcpy()` would be the
> > > > correct replacement if a change were deemed necessary for
> > > > non-NUL-terminated raw data, I have a question:
> > > >
> > > > Do you still think a replacement is necessary here, or would you
> > > > prefer to keep the existing `strncpy()` given its correct and safe
> > > > usage in this context? If a replacement is preferred, I will resubm=
it
> > > > a V2 using `memcpy()` instead.
> > >
> > > IMO: if it isn't broken, don't try to fix it. Hence I -personally-
> > > wouldn't change it.
> > >
> > > However, modernisation and cleaning up of the code base to be
> > > consistent is a useful endeavour. So from this perspective replacing
> > > strncpy with memcpy() would be something I'd consider an acceptible
> > > change.
> > >
> > > Largely it is up to the maintainer to decide.....
> >
> > Hmm ok, thanks for the teaching :)
> >
> > So, I'll prepare v2 replacing `strncpy` with `memcpy` aiming for that
> > modernization and cleanup you mentioned, but it's clear that the
> > intention is to focus on changes that cause real bugs.
> > Thanks!
> >
>
> I'm ok with cleanups, code refactoring, etc, when they are
> aiming to improve something.
>
> I'm not against the strncpy -> memcpy change itself, but my biggest
> concern is that I'm almost sure you are not testing it. I really do
> wish to be wrong here though, so...
> Did you test this patch before sending?
>
> I'm not talking about build and boot. Even for a 'small' change like
> this, you should at least be running xfstests and ensure no tests are
> failing because of this change, otherwise you are essentially sending
> to the list an untested patch.
>
> Even experienced developers falls into the "I'm sure this patch is
> correct", just to get caught by some testing system - just to emphasize
> how important it's to test the patches you craft.


I actually only tested build and boot, sorry. I wasn't aware of
xfstests, thanks for letting me know. I'll research how to use
xfstests. Thanks, Carlos :)

--=20
Cheers,
Marcelo Moreira
