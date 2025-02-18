Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD021E8320
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 19:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905973; cv=none; b=r7IiO17tnZOClb4Q1A6g+CfDgyE0fBt8SmVKjfMFQvBxYFmJFBfE2xuN6pVtgy8LPdjHYCZ4SoLvTnCYHR5qC8RwJCwlYwu7AyD75iCFnAveejNtIyObVkQnPvFjp8T/nc9FyUc7vPpR0sDljsyIIungU6RXzid5j8R5Pbwg8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905973; c=relaxed/simple;
	bh=WoUKh5c/vDRm4FlNeCNrkzPuHxYE4Y4scX3UMvAd5O4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AWL1F3Rg383RMkyV6Rwo7afve8iOjHkmzkKAT0nTR20wNYYvj8tqAGQZFpDBjgKpu2Q+/rk/h3E1+wPYRxLIfYJdM+BnisMisTkG9zbBxWB0pG9VE4XHNE0VmkALK13jG2SxB4mfA/C9/v5Pr9Qa0DOdY+dP0q++IMo9E2aOAwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTp60o17; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTp60o17"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f3f8906c45so1155913b6e.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 11:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739905970; x=1740510770; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oF3IZ5dNlMyYD63Wzfa4O0wknfeiB+PfksPMCxVRCig=;
        b=hTp60o17MnpC9/scVy5SdX++Ag/6sAzAA90hxWDfFWD9MVYoQpCjm0ELE/xGDXtpiK
         Y8Mxzl7EbC4BSB7jc67VFCj9POFlIoMroco2Id3LEMAe0fcridl7IaxZE8igQXa/wcsZ
         v5j2IDtBa+zR9LYndbQFK2wIrasJ7sqGLuFWEtu0F4tkPnoIfZGHrJKF2zdkwJOA9n3N
         JH7b0knfk4deJ5x+1tVyPnmGR26/gKM8OlJunVtbZg9VV+peHMmTtB+FOY7PliMMf7sc
         uGdAOkRqC3GkSvLSpzLIj/VAZ2zq1A0nGQ3N87EWjjbAzGah8alZ1zxH/rWYWSH4MCQM
         VKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905970; x=1740510770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oF3IZ5dNlMyYD63Wzfa4O0wknfeiB+PfksPMCxVRCig=;
        b=Af8q1GFn3vLMvFfuaobSfOpZe3NoK6Iox5R+n4gxeHIFa5P1pen0Q8Y/h6Dz9jBZ6O
         DicDxrzzEzmca2yfSE3s27qQMWgcgCK2D+p1xfr1DMZD57FYjBA5hd9TE60UL2YESuTp
         0mlyzAfc9TifqzKpLKZ3WPJHve96ZpYjbPGWsixAZANjtJ/ub1jWDcKnysQ9XfDQHJYx
         2/4gu/LQE5c2603TjHlBqKx97z+MvEwdjkml6rqRE/XOFBr7RIxyvfnTANJ0fqRx7U1u
         q8Xd44h4KSVQTE8JzUsCfB90LvmZL4nRF9Rq8CJLZwpVBMGM6Qju0WG0dbA8CtphdnoQ
         hi8A==
X-Forwarded-Encrypted: i=1; AJvYcCUMpPry2JpL92Bgtxs2+Ma2WluZM579sg3ANVFpSSmQjgBoLpCptfA5wahzf2I1wDFRsH8o1UDFNvT+pUgu+YrcY1nsDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyywKvaRlvb7IRTaE69TS+1caldBdzvMbz/KmiTj9uV55XCcPek
	hdyaasL5C4+KxzsaSkxURY4TvrTPes5xw4k6uqbrxSuKV31Y0kNXa7mmqCboxnHz4tx4O+Q/b8k
	Pb8J9uLvK4s+A5yCsPxw++h/uQfk=
X-Gm-Gg: ASbGncuvftWFiPG41KOsFZBg2tDgMacNRETXjTv5IY32jVTqfg13v6M9quBKLi11uhj
	CF4CADz9pUf6WSv/LzzC02jTicuJiVJ9SjmZ9mKdq7M6g098aqM+4q1k3IGsZNSjWnOGvuEGOxt
	Yse9fPD8oDnZ67TQ==
X-Google-Smtp-Source: AGHT+IFb4knJMi3AOcDr6zaVeojXvLaFJxcBcDyvpUv4oVbjmkI7Mm6ZZOndeOhxjCi1+zyZXOxXG+rYjRuy9gA1yt0=
X-Received: by 2002:a05:6808:181e:b0:3f3:d742:c2bd with SMTP id
 5614622812f47-3f40f1e5799mr776743b6e.13.1739905969652; Tue, 18 Feb 2025
 11:12:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218165923.20740-1-suchitkarunakaran@gmail.com> <d194435e-88bf-49f6-bb6f-b52f77248965@kernel.org>
In-Reply-To: <d194435e-88bf-49f6-bb6f-b52f77248965@kernel.org>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Wed, 19 Feb 2025 00:42:38 +0530
X-Gm-Features: AWEUYZkoRmcxpgXd1SyCu20aEGPfydJydoqEvXvTkpjbLGDJXP09KIF_zfs0pMk
Message-ID: <CAO9wTFhVx9nCPyMzHKCTnuBfrTmvA2QADg8La0z6KcYWpsxnEg@mail.gmail.com>
Subject: Re: [PATCH REPOST] selftests: net: Fix minor typos in MPTCP and psock tests
To: Matthieu Baerts <matttbe@kernel.org>
Cc: netdev@vger.kernel.org, kuba@kernel.org, horms@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the feedback!

On Wed, 19 Feb 2025 at 00:12, Matthieu Baerts <matttbe@kernel.org> wrote:
>
> Hi Suchit,
>
> On 18/02/2025 17:59, Suchit K wrote:
> > From: Suchit <suchitkarunakaran@gmail.com>
> >
> > Fixes minor spelling errors:
> > - `simult_flows.sh`: "al testcases" -> "all testcases"
> > - `psock_tpacket.c`: "accross" -> "across"
>
> Thank you, the patch is no longer corrupted.
>
> Reviewed-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
>
> This patch can be directly applied in net-next.
>
> Note: please next time don't repost your patches within one 24h period,
> and use the [PATCH net-next] prefix, see:
>
>   https://docs.kernel.org/process/maintainer-netdev.html
>
> Cheers,
> Matt
> --
> Sponsored by the NGI0 Core fund.
>
