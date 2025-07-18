Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEC02E7F25
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Jul 2025 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752865854; cv=none; b=WrBoq3KD7H8Soe9SdvKvJFXLJR/2evH/bz3JGPvkeS24RyN8Ywk399A1z3aMTiafnagNn9CyxsIwS+5Nhx9gtlrBV3Ini6T+7EVokNKdvHj89tV69sHPPbPzW/YqLi3TBzyCWVeszD0ugmsUhAZlox+rqQRTW1j0WURTi0RvAyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752865854; c=relaxed/simple;
	bh=NBeZpzm7GJCFLtcVOkWgo1+H9JM9w028NRbEWcA1PWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFue9V4HbxwdPP8kaSu5xr/7Xm3XOBa90G3oGg9Spsc9KyJUIjfcGg564Gdey1eS6AG23E4ss6DmSBG0i920qbn4noevsq/9F8J83BRZwVx8doPcYRmtBC/QVmsuUDpWnZlHA7b60hGbBmnce3EsRnVdjTAC+blg00QDgpI4cnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XN9yYkiT; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XN9yYkiT"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 077BC839CD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Jul 2025 19:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKuSz9jHETGZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jul 2025 19:10:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66D7283976
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66D7283976
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XN9yYkiT
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 66D7283976
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Jul 2025 19:10:52 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-615a80bb75cso713353eaf.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Jul 2025 12:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752865851; x=1753470651; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBeZpzm7GJCFLtcVOkWgo1+H9JM9w028NRbEWcA1PWU=;
        b=XN9yYkiTwqEbWbWtA+qQERuJV09KvmsHYlLJPV+/WXpHPX7UQYbjc8angFyrda1rJp
         6f0Hdyp568ZTaMLCj7ifTgdMaPFKbi2yF54ioLTHFiVmeJBXuT0LCzqLzX0roexXBtey
         I81iVb1oojm5l8i8JCZPJAYvtpPxeE5zxcNPdSwFG7kUuXBUrEMPZk/sSUu0iPhi4Bkw
         0ZsbOYLMWN7wmrGEdRtfte3wlTsLxaXmJisPSV5N/42UJ2OiwyOB//jBBmfIbNWsphgA
         Xrf6P/ye+pWkL08WcZ01Ym1d2CH8p3PnUw6skOHHe+KSW9Vop7PyLo1w/6nj0QYwN6Ce
         iBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752865851; x=1753470651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBeZpzm7GJCFLtcVOkWgo1+H9JM9w028NRbEWcA1PWU=;
        b=NwQq2tuWR+h236NXACxMpoCPug4kKEoncqLu7NTty94ZbIYKcdIrqcXBmKrH1YtndU
         Jvdd/3RnN9V/6AZAdmNLNPsumWj+/vNtENV7Z62JaVAmXCCvqq+kE/xRngPPEKcBFR4h
         LhKoZOfGnlxI2nXBdqhGP3aRe1JpTX77ZZT9YKL4mnky3h4A9XhnJdYEP1r3JdQJgjZw
         pzebmCKRPxPX5qs2HRmFFTp0CuEQaBi25DnblxA/tx9TGYlKRgnsV2yPb0+MVoVAcqTN
         b5AHykiwBAI0rxBKaM2qmPBXi2cCv6fTYNq/2mv78eg521+Ir8mO8ORWrM+AV0uUI3af
         xUfg==
X-Forwarded-Encrypted: i=1; AJvYcCUWQv/NM2NQfwL+Y5y7MzDKFVaSJIBMKCiMKlCyymg7jP2bJBzLVRFW5acVRCkeXVFpLFNoWSsqFDE4q3cei/SQ5h/69w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzA8dVGGvEUYUkgdPAUllO54yMloYIFOGJWH+zqS5QYndfUhOdE
	qswXJcACHTaASdAIJ2/nSmFuRYWN3f0b9v+m4Xzazv1IBr2WbDy/QfZ8sa2Y14Ra4mfOYELAhHv
	QjgTPu+IgHwyRgCyBvTSyiqbgbIcs63M=
X-Gm-Gg: ASbGncsfLdYbpPIl1iy11I8SFQRSvcTuV9aS07GRw9ZrXgcHVDpOyhtPzTRzT3A7tPZ
	CeRGcQCnUiTJYHZMgmfOi0e4/pFGjbvyF3nPQ8eepOUFhXZKdiUW+O/va1fuHH9hu/4UePC0dxQ
	XdUzF3oozOvqw9TzRKp3gi1yEmo8a9fe5OgiL+xEq0rcXReYgsKc6yPaNlV6ejAv/jnKMDsF+N6
	Lpk5tA1eVj5XSFtd9o=
X-Google-Smtp-Source: AGHT+IFvT9uZeX9R+yE8NA4HuE9JOuCVycgp4n4KGotR19hAge+18sehg3O/ostkpGjx7rtjx/On6spc1kzGGj+W8SM=
X-Received: by 2002:a05:6820:1b0a:b0:613:cd27:2fe0 with SMTP id
 006d021491bc7-615bbb1d011mr2697179eaf.1.1752865851181; Fri, 18 Jul 2025
 12:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716182220.203631-1-marcelomoreira1905@gmail.com>
 <aHg7JOY5UrOck9ck@dread.disaster.area> <CAPZ3m_gL-K1d2r1YSZhFXmy4v3xHs5uigGOmC2TdsAAoZx+Tyg@mail.gmail.com>
 <aHos-A3d0T6qcL0o@dread.disaster.area>
In-Reply-To: <aHos-A3d0T6qcL0o@dread.disaster.area>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Fri, 18 Jul 2025 16:10:39 -0300
X-Gm-Features: Ac12FXyZ6w5FS6LO45cJmpbQwjoFWm7SdiNSX09zxUTjp_5jnU0jujAIHAJKXV0
Message-ID: <CAPZ3m_iwS6EOogN0gN51JcweYH0zuHmrgVvD7yTXTi1AoDA7hQ@mail.gmail.com>
Subject: Re: [PATCH] xfs: Replace strncpy with strscpy
To: Dave Chinner <david@fromorbit.com>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 18 de jul. de 2025 =C3=A0s 08:16, Dave Chinner
<david@fromorbit.com> escreveu:
>
> On Thu, Jul 17, 2025 at 02:34:25PM -0300, Marcelo Moreira wrote:
> > Given that the original `strncpy()` is safe and correctly implemented
> > for this context, and understanding that `memcpy()` would be the
> > correct replacement if a change were deemed necessary for
> > non-NUL-terminated raw data, I have a question:
> >
> > Do you still think a replacement is necessary here, or would you
> > prefer to keep the existing `strncpy()` given its correct and safe
> > usage in this context? If a replacement is preferred, I will resubmit
> > a V2 using `memcpy()` instead.
>
> IMO: if it isn't broken, don't try to fix it. Hence I -personally-
> wouldn't change it.
>
> However, modernisation and cleaning up of the code base to be
> consistent is a useful endeavour. So from this perspective replacing
> strncpy with memcpy() would be something I'd consider an acceptible
> change.
>
> Largely it is up to the maintainer to decide.....

Hmm ok, thanks for the teaching :)

So, I'll prepare v2 replacing `strncpy` with `memcpy` aiming for that
modernization and cleanup you mentioned, but it's clear that the
intention is to focus on changes that cause real bugs.
Thanks!

--=20
Cheers,
Marcelo Moreira
