Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66312874EB
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651176; cv=none; b=Su3rPqfAgNj2oHNmAkZ7Zm+E9UGS0GRcxtJZa7x2rVll8ll4tipHXYWOkF4H+qpTcUYuLd8PYRh/Dawux0y0EXwunheo8UWljB4EOSoY5leVtXo/pe0IQZ6qhwQel4eEENV3psqaY98BgOM8qwcMH1lM3bUN6DizZzdn/alfn+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651176; c=relaxed/simple;
	bh=AiOkcrQXv5dBfuU+br0+1pqKGEfPTV809EosE5nl+x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiHSKQrHNBaEbeWi0aNj3nVp4MHbk8noDStWpQR2oEvO5HhqP1SWrrNZo4iQ3pW1iWzUSsuPoUFpsT7LrtLT2W26ZU0M+sWuZR9n+TFgJGFwgwRb3PUGY9+rFDpwkVAHZarnEbslLmcK/l2LBGwe7VZRU2C/1f51E8TMzX3/t6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYlCb4g9; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYlCb4g9"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32a64f8480eso9891471fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749651173; x=1750255973; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiHg7SNH+pSMtOhNSqpQ2vUspKGZ2spdd3OjZnoxU8Q=;
        b=eYlCb4g9/6CiQZwkOyKTCoLNVTbSWdKZ5CeNALD/g3Yv6ZbognU/I3rl19IyNneeO2
         FJSqe5bshy3kKJksLkk/pX5Q2pP5vwrjww60qfifOp2w4nfRUFay8vMq5d0NvekMCdsr
         sV77A8+/KNbZo9RUsaw6EO2Qa/zyKiHDudnprLFu8wmx1cqHHXZBrDPLp+y9DfxuhLQ9
         gVg1R4Fvw4+VpU+7JHm0Rb2LPNUOLkcZW8CdigfbBr/VWXBfAgayvXh0LrZc8A689tgH
         XmrJ2B1glysSHobBqgay/9jG8nGEvb08BpTnq/CBslFMeA2jt1pHZ5dJMiZgyh+ar0ya
         tjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651173; x=1750255973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiHg7SNH+pSMtOhNSqpQ2vUspKGZ2spdd3OjZnoxU8Q=;
        b=olrDM6G01RwGy3fX6gYQeZXJgvmsvj8L7dAQ3x6tManyIdCmS/FP4YJfxoCZMraE/s
         g3JGWlCBKYhn/3INWh6UgfEqfDS39qWAmSvC5GwATNFYilgeQ9wF5yjWYd1aPDKlV7mE
         Q2EogK7knnnukTGiA8kEJSD02PPnxailCkIOQ7W3p7T4HcvVbWtVwcuqpoXIP0T7j7n1
         URPrtJ/GusVWFv6s5Dcz6QomCqbzX8UPI/21r3Pbnc1f6vBTuzvcgKOqE47WYoJv6cGo
         HEVw5tX7ax23EO+RQ5+yUQLT11YzsGWN0Sa2Mtq6uVm2H/j/j9qgim8zpK2odZtGyGhW
         dXgg==
X-Forwarded-Encrypted: i=1; AJvYcCVlm9Cs7DtEtcW2XXYnIb1Vf1YhfkF7ug0YqFdD1aBQQFHFmEr2hCcuVnbaTm7yMsl9t1XB5r2+oQNlkMVivOSjZybY3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBrWJVbFW4gPEdCOaog5uf5PrURYQw9m+kmCtpkLqgtzpTcULD
	zFJ1R9WlL2EXjXTZr1D3k6P142qScsz5RHs4mQwq17nEi/oFba72xtNN0GSlbNWIzfkaAzlNRNp
	HPFPRP8wBMwxKBIEhWSAWDw8mSC2veuw=
X-Gm-Gg: ASbGnctFWOTjEDI72C9ST74pfzy4vuk/o+qbzNW8U4ZFYYODC6UZ4lyowz7N65ph3Qc
	TRwQXBrjwF5Z9/tAGosQ7fTH5UGcEKU1iUhayePDbVPOVK//UFQYWfTmubny5CN0DuMnj+3j1Fc
	FlMOnX4xu6P/4LIrUCmyIOZGBZyf1xR3ro4m0rsd5d0cpU0BDu3G6DxV2hcc6A8P0/zRhH9I+CS
	aUT5w==
X-Google-Smtp-Source: AGHT+IEAValel8liDMEYhfCrnmQ5CestXZtWv84livqk4j/ymswdWR+PpAD0W4JSr184M5y7GQRG879SrHISz7W20Eg=
X-Received: by 2002:a05:651c:4ca:b0:328:d50:d7cc with SMTP id
 38308e7fff4ca-32b21269b9dmr10951451fa.20.1749651172599; Wed, 11 Jun 2025
 07:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250607152830.26597-1-pranav.tyagi03@gmail.com> <20250607164200.GC197663@horms.kernel.org>
In-Reply-To: <20250607164200.GC197663@horms.kernel.org>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 11 Jun 2025 19:42:41 +0530
X-Gm-Features: AX0GCFvcXQG5H4Lymw6YWunRZt95liFnErGnHf7Tk2DyxYxDDx34gA1WdzNq0ac
Message-ID: <CAH4c4jKcnmquBJ1fXo0ENRf+D3xuogF+Cu4iGVsR18FZfggqqw@mail.gmail.com>
Subject: Re: [PATCH] net: ipconfig: replace strncpy with strscpy
To: Simon Horman <horms@kernel.org>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, skhan@linuxfoundation.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 10:12=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Sat, Jun 07, 2025 at 08:58:30PM +0530, Pranav Tyagi wrote:
> > Replace the deprecated strncpy() with strscpy() as the destination
> > buffer is NUL-terminated and does not require any
> > trailing NUL-padding. Also increase the length to 252
> > as NUL-termination is guaranteed.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
>
> Hi Pranav,
>
> As a non-bug fix for Networking code this should be targeted
> at net-next. And it's helpful to do so explicitly in the patch subject,
> like this:
>
>         [PATCH v2 net-next] ...
>
> Also, unfortunately the timing of this patch is not good
> as net-next is currently closed for the merge window.
>
> You can find more information about the above,
> and other aspects of the workflow for the Networking subsystem
> in https://docs.kernel.org/process/maintainer-netdev.html
>
>
> ## Form letter - net-next-closed
>
> The merge window for v6.16 has begun and therefore net-next is closed
> for new drivers, features, code refactoring and optimizations. We are
> currently accepting bug fixes only.
>
> Please repost when net-next reopens after June 8th.
>
> RFC patches sent for review only are obviously welcome at any time.
>
> --
> pw-bot: defer

Hi,

Thanks for pointing out the shortcomings in the patch.
The doc will help a lot. I will correct the patch accordingly and
send the v2 as the merge window has reopened.

Regards

Pranav Tyagi
