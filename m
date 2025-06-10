Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42FD28F3
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 00:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749515541; cv=none; b=pNiJaNpHk4qtedqQucYMn74G0qe4QrrdCrIdieVs+ymStOdl9fcf8vmmcepzQ+efK4GJwBdbOrGdO6Cf6dUZHiuw0KXzlvx9wFNDireq4fTNPod1Mx8tBupiIOhuGK1/EVvbpxq8H2QeHtAF3RNDCbEPQ+7wudSXPkvW7qo6ivg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749515541; c=relaxed/simple;
	bh=TRTa5tgGNKgNZ4KTEE4nVgJEed7wNVNgn+tUpuW+2sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucUZeDP6wN6wqiDHuiO+i53JzSmxkQNYrO/Gr5ruDGvX2iSOxUhTPo0b2C7c7TfW9KNWuGzZ48sWiI0sOoFMacNUq4gqEuwut0B6Sh/Myu3OwkuudxuEWKa5s2F15/8WeTGIVUMnjUSQIS8++dMN5RUzl48XQ7BRHShiXspDOek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sYPX/f6m; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sYPX/f6m"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-552206ac67aso5905782e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 09 Jun 2025 17:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749515538; x=1750120338; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkR7kz71cYbWF63G7HL4ImwDStD1UZsWCxUigkYuYL8=;
        b=sYPX/f6mVHHqRC2AoB3MTFcK/vu//dkiJS6/761sCuyPSay/UU8OAgprqZBTcXzhV6
         Blpxuo+zHj8wcf/FWK+p0OCY5Xoa0Koq/le7zbH6IjQ2F5x/pSXVx5ZEYQ60MnCCNcCY
         xujwdaen1WD1d2pUwbhgOeJXerXNEZ26euA9KxkNW0CPPgQQ1+XIlVMw2V2OCsvhWEpg
         N2n2leYp1I7/xaSY2bRFblUmYkVvHB6FroeSf63uMKneZ8p2+ErUrfLgHq/C8LTChvRa
         dWHjVAPPh/+O1b5n+kxWIAPnZyN5Xhw3qgqQj+J+4pu5nAfW3ZNYfGvHheXVVl6cagcb
         KQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749515538; x=1750120338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkR7kz71cYbWF63G7HL4ImwDStD1UZsWCxUigkYuYL8=;
        b=klLCFWI6/LA43pnWYhWZ7w5NDws/mgnej45Aidj+h4M8dB59MrQolzqe9aDo21KETa
         Fv3QCFfhr54F3ucfxX0P1uDfRpG2jXD0z8dpggRYXgASivb3OTe6vjBgPlhTtCgyMTSr
         q3+S3omNdx6kQFjl8+vBSJfX6ttSIS8loAniRwj/ocFVwp1Uu01QR4kwBaAKBSM6WQcu
         HG4u7mJysq4Br68Vi2xADvlG61Rz1jNXL7ly25Qs4nssF1w5CT+EXqZE9UItF46Q/C5D
         5/GmW6X5ZWB0lEVfj2jrSJV3b2jWabWafsfDIyyDyHjcr/JvYnt9mJturOq3d6ipK72f
         jp4w==
X-Forwarded-Encrypted: i=1; AJvYcCUTSVHPoSZvKSk4ZT/AyHuhQsCQyJdTn6dl8Vu+smF7XxmbkNJAmhBKBoBU5km02FL6CMBKXZFiv1H2Ahcy34IBNIMoug==@lists.linux.dev
X-Gm-Message-State: AOJu0YxV+OvZXZwDNgw85P64GZBz3E9fod+eh71iOi2wmqhTzsDjLT69
	e3ybcjvhPD5VQVn53Re8Xu97waQhb5x/qtUBrscuaL0/WxG19Qa1cuI13mZippX63bg8+4z5cSK
	4u6pIYgd7BTYG2us/xQBL61dZbrFJbD7ZtZ2iS44=
X-Gm-Gg: ASbGncu+nhn5RZ0yVHy4Bc49XfRS5p2EN9HUD7BL6CbkHqBBaN4yVJWNp3+UvE4o6b7
	G4/tlp7dYo4c5xocie/3xPsBtm52KCwrXBEwwBP/fYoiq00VAVmNAu8yT50ZO1IRBIN2bOgnM3C
	GoVBZ1oIgm2WQ2WxFZv+uSdhiNakl+KF3Df9EPDHXjRZ1ZXO1642NHCG0doeYzSDoXc/1LcTzeG
	KBcHaqOpA==
X-Google-Smtp-Source: AGHT+IE+QOoB+4EYkwNJ33qqgp/tdWSsvGDCg0LnlaKl1vhEEW7aFXBIZWj+I+z8posJeAu8MG6ZSGa46ECVfUTLj48=
X-Received: by 2002:ac2:5d30:0:b0:553:653f:1b21 with SMTP id
 2adb3069b0e04-55366c359fbmr3006474e87.37.1749515537762; Mon, 09 Jun 2025
 17:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609194611.690678-1-richard120310@gmail.com>
In-Reply-To: <20250609194611.690678-1-richard120310@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 9 Jun 2025 17:32:05 -0700
X-Gm-Features: AX0GCFstX1Bjaf1o8eI-RH5fmIWj5yx6wc9FKIaHmt8_ONMOjbW0Gb6B3l5whhY
Message-ID: <CANDhNCrVtK9Tv+d1=z1yrh4OxiS+neENQejD5pCi+R=Cwra9Xg@mail.gmail.com>
Subject: Re: [RFC PATCH] clocksource: Enhancement for clocks_calc_mult_shift()
To: I Hsin Cheng <richard120310@gmail.com>
Cc: sboyd@kernel.org, tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks so much for sending this optimization in! It looks promising,
but a few comments below:

On Mon, Jun 9, 2025 at 12:46=E2=80=AFPM I Hsin Cheng <richard120310@gmail.c=
om> wrote:
>
> Previously, counting the value of "sftacc" within
> "clocks_calc_mult_shift()" use a while loop to determine the amount of
> decrement operation for "sftacc".

This is just a direct translation of the code into english, without
any context or explanation as to *why* the code is doing what it is
doing.

It might be better to explain first *why* the calculation is being
done, and then get into the limitations of the current implementation.

> It's equivalent to the position of MSB of "tmp", for which we can
> derive from (32 - __builtin_clz(tmp)). Use 32 instead of 31 here because
> 1UL should be treat as an amount of 1, not the index 0, and even though
> "tmp" is of type u64, since it's already shifted right by 32, only the
> lowest 32 bits will be possible to have non-zero value.

I was having a bit of a hard time parsing this paragraph, so it
probably needs some more work.

On first skim, this also was a bit confusing as __builtin_clz(u64)
*seems* like it could return greater than 32 (but that would be
__builtin_clzll).  So the (32 - clz(u64)) bit might confuse folks, as
It's pretty subtle that __builtin_clz() only works on the bottom
32bits.  The code should definitely get clear a comment on this.

And thinking more, would using ffs() be more straightforward here for
what is wanted?

> This change is tested against a test script [1].
> Result shown that it can save a significant amount of execution overhead
> for this function, which is invoked often, the whole system would likely
> benefit from it.
>
> -----------------------------
> | old version | new version |
> -----------------------------
> |  11500.6 ns |       44 ns |
> -----------------------------
>
> The execution time is reduced around 99.7%

That is impressive, but should probably be contextualized around how
often one might expect clocks_calc_mult_shift() to be called.
It still looks like a good optimization, but we shouldn't over-sell it
unless there's a concrete impact to users.

Thanks again for sending this along! I'd just take another pass at the
commit message and the comments and see if this can be made easier to
understand when someone 5 years from now is looking at the code.

thanks
-john
