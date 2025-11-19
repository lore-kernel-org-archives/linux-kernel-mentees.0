Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A02366567
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569744; cv=none; b=aNtWHnxMIlLveStqMCNAdsSWgwRh8AwT/ePyrL45kO21bSSky8zOAqJfiiaV9KdaE2OCHnyqP5z4/0OS97wk42f0gli0vyg3pcszaDJ3XXpTH2UbM32b4cyU+Hp9i6lXUd15w0WnC6vJRj0OmSa3XZ/DsfFYQAYTCRUSNBDR+P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569744; c=relaxed/simple;
	bh=krS2zwvB1cIXdBUbAHpfiUxU/dm8qFPfJ2HQV4/oXFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jgTit3IFy01e2odXG9+53pT+TPABLIRuRK7VffzmgrxL0kKZ/ivhMgmK2OAyesAOIZTazVerQOptdyDaLUuyyokpBbLDu0GlBBOllvlzYXdv6YKQi3DT5dxE2C9BeBY9Tp0TRLiQ+cDfYA0uPgjW1O5UAhwcKBqT6RJ2NiF0L/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKinB3jr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKinB3jr"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297e982506fso84893935ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763569742; x=1764174542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yltoxSOQjw0YgiVe7Fz9jUncJdJ3xjf8RjpjTmk2pmA=;
        b=mKinB3jrbtrhtwQxcBS969e6lNkTNjMUXpSFg1blOtsjdPaZVQHNnYRSHeqf5UoZM/
         fBJ05u+oFPqkgc7BRnNFb9o++ljsa/sWXhph8Ttrq4qkJGSugTcWxivTVScfmWU5lQL0
         5DOtmjTrX/cXqVMZdbD2NjwwMMOvJFsd9ym/hfoujUYFRTEN1itIWtHvFDkYOef8IMbI
         yC2VNUF6EkLUTnMk3y+6wBi7TRFRjLgK5mMdag7mcPrFKd58mFTBBmzSb92XN2Njvqhb
         NdWEMzTYI08y4nKQEsoGFIFDkGjdDqlLl7scoth6bF06lk69WLchecGRBMcsdLw36GDe
         xfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569742; x=1764174542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yltoxSOQjw0YgiVe7Fz9jUncJdJ3xjf8RjpjTmk2pmA=;
        b=lQ2g9p7+gFYfbzOvFofv2wtcKkEaPcs3TiQj7JzoJ2TIJ/PZQg9L/8QCwq8Bcs+cAm
         nGu/V0tUpBjBG2d6tJXG90d1DFfulzTkpRG0JyIJN4O06A/W7v7yJc0H9ZNuh4eXj3kD
         gA4UtBG5ZvSBxZhm4pjv+TafDqDUBvdmXaXdOwTxkxUEXT8KQJYhQWT17fTdo9fz3hQK
         yIppCRa7HaVg2ABNfkPiZ6URwW30hlC9/+zkPIh5ha1OTpNmsAAcvFvQsjITD3lEIyjU
         7G6/6HE51DD9QYRu+IGnwZOzkL5LTaDFTfT6PQ/KZQ6MA4wIsxDsHWwPqNi0tuQbZwJ0
         MYMw==
X-Forwarded-Encrypted: i=1; AJvYcCV6Yhyxy0e5MS7cb9HcHY7YieLO5lQVSxyfOzrEB/l4qsPEBWXARWDzqDk8awErZvxI3mwTBKCh+qQt/D0GN3q2emybJg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg5A06UShFMrXd4XstyPaUf4TPJgDX264Xao2c0dCclNkGrAe9
	cByuh585Ul/c4xAohdgVF2eJzz1Im6hNC+M8/XRBUCUPZWh70PHV5RC8
X-Gm-Gg: ASbGncvKaa59X8RGJb/iW5p8p136Dl1pz78mwGyiGapP8MtO/ykp7bhVl/3qI57n8xi
	8QU4B0kr5aVC0nXETHL/k0JssUqGeg8wXOnWsBYeDgyl4oBnhoUrEqkEl45QXuej1XeSmGpYsyx
	3oERC0Lkq3hVS1dxJ+iAt9wiDYMfdmxmk394RkmDBYjViQqrKarUu3B5HUSj7HMJ2fr4D1wbDbF
	x7555trRP3VTpW/TqAVjW8PrpfvBceLinPloFGWChe/KTpjNj1kN9ySOZSqvA3lyjNXDf2D3LvT
	CuhWILkHt6ajZ5nOle9Izp81zKZhDs4P4nDA25+dO5pNYrJHL43oB08wi/sW+cbQGrzZoC8yIkt
	MYu9o0kcAK068nYzVnlkKLG7aV5w4J0P78ucs2JNZab4Zk1cpJAQsCoezCVnU54UJ+UoidIJDap
	8N2FkTI0BkJK9MInI=
X-Google-Smtp-Source: AGHT+IG1i3hJLHO5OeVzps6Exdjnn+jfSV4c3Xs21CET6+hpDpTaetyCzLXja69p1aS0APrPFCpnOA==
X-Received: by 2002:a17:903:1786:b0:295:24c3:8b49 with SMTP id d9443c01a7336-2986a75676emr227289905ad.46.1763569741995;
        Wed, 19 Nov 2025 08:29:01 -0800 (PST)
Received: from rakuram-MSI ([2405:201:d027:f05b:837:386d:4d64:c2a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2345e3sm209890515ad.1.2025.11.19.08.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:29:01 -0800 (PST)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: u.kleine-koenig@baylibre.com
Cc: chenhuacai@kernel.org,
	dan.carpenter@linaro.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	lkp@intel.com,
	rakuram.e96@gmail.com,
	skhan@linuxfoundation.org,
	ulf.hansson@linaro.org,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH v3] mmc: pxamci: Simplify pxamci_probe() error handling using devm APIs
Date: Wed, 19 Nov 2025 21:58:49 +0530
Message-ID: <20251119162854.6890-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: gp4ju4m3ypaijxnll4e5246e6qu2zk7towstua3exfazdvqj5n@5zorhuwucugk
References: <gp4ju4m3ypaijxnll4e5246e6qu2zk7towstua3exfazdvqj5n@5zorhuwucugk>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Tue, 18 Nov 2025 at 21:44, Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
>
> Hello Rakuram,
>
> On Tue, Nov 18, 2025 at 07:53:11PM +0530, Rakuram Eswaran wrote:
> > Shall I start to send the patch to remove the redundant if condition
> > check from pxamic_remove() function?
> > [...]
> > I can pull Uffe fixes branch to send the above patch? Any inputs will be
> > really helpful to start working on this.
>
> It's sensible to build on top of your previous patch, yes. If you do
> that by using next as development tree once Ulf's commit made it into
> there, or if you apply it yourself (and then use `git format-patch
> --base` correctly) doesn't matter much.
>

Ok, Uwe. Previous patch is already made it to linux-next branch. I will send the
patch for this on top of next. 

I will make sure to run this command `git format-patch --base` before sending.

> > Another point, I would like to ask is about the below discussion. You have
> > mentioned about WIP suggestion for clk_get_rate().
> >
> > Link to that discussion:
> > https://lore.kernel.org/linux-mmc/20251020183209.11040-1-rakuram.e96@gmail.com/
> >
> > Was my understanding is correct?
>
> I think so. In my understanding clk_get_rate() must only called for an
> enabled clock. (Though the wording in include/linux/clk.h is a bit
> ambigous. It says: "[the returned clock rate] is only valid once the
> clock source has been enabled." That can mean "The return value doesn't
> mean anything when called for a disabled clock." or "The returned rate
> is the real one once the clock is enabled." Some time ago I tried to
> improve the wording, but IIRC I didn't get relevant feedback on my
> patch. Assuming the former semantic is safe for sure.
>

On this one, I'll look into other implementation on how they handled it in
sometime. 

Best Regards,
Rakuram
