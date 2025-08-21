Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD8129B214
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 21:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755811050; cv=none; b=muT1UuaUq0gGzIN3JeGPOP0Za/4M8rHULsBXpsnjUiROyMLCVS2aA9q6MwNp46CU3XbrYk+ziiVrWnzXvkSBl1z72Sf/a44BChXo/1+FAd/ZOi8CtcK5PG5mWvgbGRLdQDnwWIsKzowunAYCEqz/T948geKfJ2U43kOpVmLG6fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755811050; c=relaxed/simple;
	bh=wIvWJcJ2qicBpEyhg+T9O62WoWdENAS0bcC5e9CSn1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKEbOdd52s8IGBvEvUCtaXq4gvFunfdxU+yyI34kN/POD6e0uoTHp//ZmcQ+lBdztLzb7UBhrx2P187rlJP8ftNYkH5Rs9110kKEn467N+xcvbkIZcXjMLAo7mE7XjBcgmjnA7OFkrJgzC3LvzpUyhnvKsXAT+9ISQN8f3GR6do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWHGm7TQ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWHGm7TQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A98D5847CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 21:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvsH_1KGT-Q2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 21:17:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0142E847C8
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0142E847C8
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RWHGm7TQ
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0142E847C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 21:17:27 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-71d60110772so13436277b3.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 14:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755811047; x=1756415847; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M0A+kRlT2FglN/8Bz1t/135C//i0Oe25IbMxPqDCh20=;
        b=RWHGm7TQiaBzGtJ+uS3gwQGzTEAroL4042dL2ihInFkkdKcQ8+a6xPVQ+7j2J/LNtv
         Qu9EcbufJYmoQNKZBkWU5bQWeNUAYsVWyHePQRFohcCOhY/5bs4DpqQjhQQwFgP3plAJ
         YTNIDLTq1jS+06+MtpeWesJNzluZPAOJ5jLc7kzOpSunJbofiEj7QpR1KGWBkGNMyU4W
         bpM3EjtnLdkgnNA6pKbhFXZ/VbxOP7/nNC/eMsxQtdoaADtOq8l8HxsX1iWVhCkYCglD
         Cc+3idmFh0bmXtBIH6Y9qBxw96Jxh6LOvbhiNHShxObISWLlRDS8giesQRLSfFpEFGD8
         2R8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755811047; x=1756415847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0A+kRlT2FglN/8Bz1t/135C//i0Oe25IbMxPqDCh20=;
        b=a/nsfJWCypGBnJHb+qXbLwHvQulPltgvPU3EFgSKbORAQHZ0P/ksxjCS+qUu2jlLi4
         EoulcI3Z8a42sM0vXOExQkguM5vHjYPFOpo2qGqDfHn9rsuH4UUgs/RLiFIfkDY+XJZ1
         48G2mPuIsEQx9tmUutoOKJeBAFt7KixDiABijrAxvW1wCRnpFNCMwHD95TwTC2AdwNZo
         RLUzjyJz7lGwAFW8pe/hoF032WaVt51wSsy+EWPjHrKUizHOovJN44XNUPygk83CXbc3
         2+BAXPlqdi2uClyaitpR9O+rKF4F6slKjDpMNoXmCmhAFQMOdyeBcUz66Iy91Ii54ttq
         EEAw==
X-Forwarded-Encrypted: i=1; AJvYcCUqqPccCpq8CJE84Gkyn7Jcq8JsCMM5ScrAuDEW2wHxYAiwj06CFqDKVOPTUkQi+opCZnQ5Rf892KYCndipo4zq9Jnb8A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz91idfYk/rhsF5kdBKw8GgiQuAKzbhPAs16NnMJKAq6GVyILEQ
	TfRVF5P2xf1IEB2ZaASmlBFYFxG6K2tNxufpH22//FqODnsFUOM7yFincVOtypNa55daZk6rJxR
	JgSFtip7klXkOgFTQMPCRwSac8e1kT0A=
X-Gm-Gg: ASbGnctvz3nX+j3fFhxAqHNZcf6VNjuhWsdJJeAM0JitOGKgOAaVGtBcWp4EVqxj9mw
	Eln1mf4GN74d9xU8VNLZa7ruz0QOc4Ntlgm3ADNHMcEjcQCKvnaJmC+m4MO8Sbox2AsDu6a/KEY
	+DUwK8k3yAV+lKrfxahu1Rup6kDCIB1mALZolZKOcal5A+c/faQvqHaTj4lkiQ4CTgoR5HmOuht
	SAqa3VhirDbetlMkBuwjXqyYyOyAvWFAZU6yARybpsTFh3STsBiVQdbMCU=
X-Google-Smtp-Source: AGHT+IG6//TXCd7HWmIFgh2CoCFbe0b7gysAa1lfgSeo97MehCuFJS9JIpTBAgiJE6ZQ+0LnbnlXHEBegv61Kx3lmJQ=
X-Received: by 2002:a05:690c:4c05:b0:71d:bc04:a615 with SMTP id
 00721157ae682-71fdc307ab4mr7570467b3.15.1755811046697; Thu, 21 Aug 2025
 14:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821200132.1218850-1-zlatistiv@gmail.com> <9c310ab7-0f0b-412f-8df7-71730a2d2caa@sirena.org.uk>
In-Reply-To: <9c310ab7-0f0b-412f-8df7-71730a2d2caa@sirena.org.uk>
From: Nikola Ivanov <zlatistiv@gmail.com>
Date: Fri, 22 Aug 2025 00:17:14 +0300
X-Gm-Features: Ac12FXyzv06cBuZ62BErId8wrKWN93hUseTYhtMGTtt1blvR1AUlAbdCKMTekFc
Message-ID: <CAHjv_as7m7UbSLAPU6hX_=tAvLZYR_7Q=1n+Xq-nW-6OJ237PA@mail.gmail.com>
Subject: Re: [PATCH] selftests/alsa: remove 0/NULL global variable assignment
To: Mark Brown <broonie@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, shuah@kernel.org, 
	linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 21, 2025 at 09:49:29PM +0100, Mark Brown wrote:
> On Thu, Aug 21, 2025 at 11:01:32PM +0300, Nikola Z. Ivanov wrote:
> > Remove 0/NULL global variable assignment in mixer-test.c and pcm-test.c
>
> Why?
>
> > --- a/tools/testing/selftests/alsa/mixer-test.c
> > +++ b/tools/testing/selftests/alsa/mixer-test.c
> > @@ -53,10 +53,10 @@ struct ctl_data {
> >     struct ctl_data *next;
> >  };
> >
> > -int num_cards = 0;
> > -int num_controls = 0;
> > -struct card_data *card_list = NULL;
> > -struct ctl_data *ctl_list = NULL;
> > +int num_cards;
> > +int num_controls;
> > +struct card_data *card_list;
> > +struct ctl_data *ctl_list;
>
> Nothing now sets initial values for these variables so they all have
> undefined values which is buggy.  The code is relying on the default
> values.

Checkpatch reports it as an error, it looks to be part of the C
standard that all compilers must initialize globals to 0.
Though I suppose it helps with readability to see
the num_ counters assigned 0.
