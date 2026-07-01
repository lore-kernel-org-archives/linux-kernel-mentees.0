Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76294481A9B
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  1 Jul 2026 12:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910762; cv=pass; b=BvBHsgQEv2k8ARW+d/B70xeZJhEoY5U4VxgzSf2XhbgO++/MOrCbCRf9xPV0X0KENqYBgPN/6ZmxH7mBTbzcD2VjbBEcXggmc1sHZhwQp9cMOWEjdLdOAlkPir1LR+Y7h8ppnTRQNdw0LwWEo/G2RfO9zoA3kmSb8yNuAUyGVQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910762; c=relaxed/simple;
	bh=w7T4l3H+ZghFEqzqhnUEQ7w1i+tAgsSes+v6k/i/RAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fuoid9OssPDvcJlOCMLxhBRqSyIZYYbeGVuiTElEfkHcNu6D/vNK6JzvVZsG7bDnmORXqkUX9JqzrGZZVQoRKR6cVrYob6f2CQqtlk59CFunYKxnUf0x0adYo+VyrOzBJ6mYSEvVH02rPDqY0nRa8aV6hEK8uUkcZeO5O3ObM7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8F1U6Jr; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8F1U6Jr"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f24f290af5so4868806d6.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 01 Jul 2026 05:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782910760; cv=none;
        d=google.com; s=arc-20260327;
        b=ohEN2eCfTSJAd4FQt+fIR3qORKj4MzNohANmOpPzAdjQw9deEnpENr7EODfraicfl7
         BKOuaZI4RRf9h96U8QTHd6FUm4IOvoAAT+25VMyx/Jj/gpYpWZg41B3cpObRE7wTPFHp
         PjGcYMyzgSxwRHNxuvVpNNJgBtmuoFyeaV2Mtr6RZhEPE5Dooyqe6aE5PgxL2nnOxH/q
         aF2m9+t9JLj64f/l3twH/no5O7cpZdS/xsO9ZqIToenEt9PozUcuE0N7F0Gjc2BM7VxI
         QSOmq6BkKm+9aS1iSbgtXbHLv+rPDXqsB+9jmolVVY1mGiKPqnHNMz/DoC/h+l3WiMJ6
         /5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I12u05M04GIJMyEzopRm5q+ddLjVLgxkEu9AiNHFTQ4=;
        fh=wRZa+z3WOGLq/BzrUqcQ/b3sp2fWdL+UWSuLe2ZH1VY=;
        b=Aku63D/cXdGmA05P+evRROILFZP/D0d2VuBl7pAKO598xXxPIyg40vSlzgRh3Gze1V
         kseBBn77VJb5xnP2Ex/WJY5CZiIZgGAYVmU0aLuuAQZQrgk2glevDZIapWAqZfzE4UW2
         c0E8BEcCOR6GnL6FDCMxLep/T9RCzrNcMo/pRWs/XdL2GhYNFL1RmpSkWEVwUukTVpSq
         4vDV7mqEZ/mvS7vbCUKQrWi8LXMryeCtAgI14sxeDzOJOPO9BudRinjgpPN55VweNbad
         P9EeHifOoL2WZOQMG6VtvySuicjRjTSiASVxKLIzjvabKrqjZ6fSCy1Hh2ChdQjNiCOl
         jEWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910760; x=1783515560; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I12u05M04GIJMyEzopRm5q+ddLjVLgxkEu9AiNHFTQ4=;
        b=U8F1U6JrRyyLYWv6sUBAS1y7WrAbqqVwjCJb4pK4Epatvjdm6wPP+vUj84TM61UoyB
         ff2GwLGlwQlw7+/LouplQ4aaLqm0it/aJeCtJ5dOWwmP5XupHmdo6w5+HrLVje1+cjIo
         W1n3jF01hO3zVhGS1myn0+1KCqh6ZeHCdvo/I1F2ukA1iAucaqq8iBM4ipHbGlKVQVNF
         wecxMWqBsivc5G9cvVgy84LdMEZC9EbzznYsjP6hxzzx0Ts/DNCmwFtb/S3u7aRLD7Iq
         LPhAczOw4+sAEgJU3V8FSSwrNlfMK5g9xPFqO7iJibY4AdXEKbid8KvOJdJX9QlvDKWO
         MEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910760; x=1783515560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I12u05M04GIJMyEzopRm5q+ddLjVLgxkEu9AiNHFTQ4=;
        b=Q5HXpWPYxamREy4sLfmffVWmtaYKDVMApCeJDiZKzUGy6Lu3P33bL0vkVYZaeI0iIw
         nHBHnxUhTrsGTmjnZKP4rSp6zy8jmb52QFZ3Uv0crzD3r8k68mvGPlSRUFekd9bVeG3e
         j8Stq8awrfcAM/5Kgk6GD4yiYCNjxJe8kGqlddq52wv2ofAplwvKBqmX/V9kTfSD2KhV
         ogb9HqpWR2H/yBoLRVW/CNYaHxmmpCnpTy8DxD/0WRoX+Amd5IxlsovLFc5UdPggkJhL
         j5Z46ZVvn+0UDPLCu9KMurFW+bLl9IvvzoT+VoyBMqTnRZMf81N89KftW4TFbbTpdkPG
         UYEg==
X-Forwarded-Encrypted: i=1; AFNElJ+pZrOeCgR6/R4AUjlCkQohY61RD6NTJIhHaPKX5j8b1ECuzLe81SqOR+lc57eoTXGYSVyq6NTHtFmK/XFUX4zscO3vfg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+4CUd0GBpHKTwAPg+/40VpH2uvCa2S+ilv2uG3P0vEH8Hd4Ku
	DyvsnjE3Qt6WMGt7iUOiyPktasVgw1hKGvds+fCuBc3XrsB+ICPMdxA27zmsB3TjYmTb1pSideO
	Kw9M35+JuMVLf8Orc86oLHAb/mUemuco=
X-Gm-Gg: AfdE7cmghLoI8x5k9XjDofiub6lLQ2u0QC8ysdno058+eH079xHJu7mFcMkI0s2cIx3
	iBTItuvp/9fdz5VJ9GN6GyuDnbXojZmgcIIYBFe/fGfns5fcZo4IPmdfDoQaMeqtwdybK163cAb
	3M3YCe/yq3rjErfMTkkX0F4A3qMsettQIMPE6LszZkRKwgRRuYn3oUO1C1SEh6+u9cZqrY6uBUo
	DkKsqf4/aYv55J4mM7gR/p3VYSd7fHhKiUdlxP3/yczvesbfSZiByVUkZKd8QxjIMmhtYfjhS2h
	Iee2oS8uirANYd37TvQV8Dc7sx71xkVTeTxPGpazY56zVRdohj1/pU3qJWTrWHo=
X-Received: by 2002:a05:620a:d89:b0:92b:6805:91b4 with SMTP id
 af79cd13be357-92e78502506mr218279285a.60.1782910760182; Wed, 01 Jul 2026
 05:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625160228.59672-1-tharitt97@gmail.com> <178246824177.1799417.1678746966574660598@freya>
 <CACak8wPuBaGCBbBrpoPQ5ftQRtqwijvN_VJoRGs7FzYBGck-iA@mail.gmail.com> <178288879026.1799417.14880182647984884282@freya>
In-Reply-To: <178288879026.1799417.14880182647984884282@freya>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Wed, 1 Jul 2026 19:59:08 +0700
X-Gm-Features: AVVi8CefPUI_1MZTpUYM1EfQ4-7Zg3GwL1pgE8KRzv8SKnVNIdtoEvFAF9edydc
Message-ID: <CACak8wPrxewpdvcqX2eCPPAaA_WaTfqtGshrZ7qTDcqpbdmX=g@mail.gmail.com>
Subject: Re: [PATCH] media: imx219: fix test pattern ordering and add patterns
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Yes please do so.

Thank you. I have sent the v3.

Best,
Tharit


On Wed, Jul 1, 2026 at 1:53=E2=80=AFPM Jai Luthra <jai.luthra@ideasonboard.=
com> wrote:
>
> Hi Tharit,
>
> Quoting Tharit Tangkijwanichakul (2026-06-26 18:08:20)
> > Hi Jai,
> >
> > Thanks for the review
> >
> > > Do you have a strong reason to switch this to the datasheet values?
> >
> > I must say there is no strong reason. I'm totally new here and come fro=
m
> > the perspective of someone studying how to write a camera sensor driver=
.
> > The datasheet says that writing 0x1 to reg 0x0601 will set the mode to =
solid
> > color test pattern. So it is "natural" to expect that I should set
> > test_pattern=3D1 to do so via v4l2-ctl.
> >
> > > I ask because this might break what userspace applications expect
> > > (libcamera) and also automated capture tests (that compare md5sums of=
 the
> > > test pattern) in vendor board-farms.
> >
> > This was totally oblivious to me when I made the change.
> > I agree with you on this point. Breaking userspace does not sound like
> > a good idea.
> >
> > I'm open to making a v3 patch and only introduce new test patterns to
> > the driver.
> >
>
> Yes please do so.
>
> Thanks,
>     Jai
>
> > Best,
> > Tharit
