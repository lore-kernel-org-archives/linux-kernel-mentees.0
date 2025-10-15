Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881033375CD
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547130; cv=none; b=e38/yG1LW1PThbB9/Z1ghW+aIBxy7wx8U/LChX75mby3mtNib3J1S4SLGF/C8Wubysf45ot3/Dvbg59Pr8UmmUdXjOA1Pd8tRfHUJ+DUsdjO2kJ9O6ODdTPoriwCm8Pan8wxP7zedmeD38nnHJgJSVInoEbrU+4Jjj0DhH1w2U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547130; c=relaxed/simple;
	bh=wbxUTvPZYOO+jnUBOwHP6vqN2Y8d3Evx6zjpDRrIqFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O73kkyPFbk4ESR0JBArx7ZUnvWUnnwYaL6wR/bWY2WkUhFraj9AowVOI7Ly1UHyCUajNBbBTwdVc2yiNVtr7+dnZ5YRLYIcSdDIlx8/PH9nbJGE4lpzzboBhgNMHK32vBH7tgSF6FT/Z9QHIMkhyskZkky/kDaQcmD6FXYYnyNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwjjvtIV; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwjjvtIV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b463f986f80so498381166b.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Oct 2025 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760547126; x=1761151926; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=neLd0+dDQvDA5L4vv0sP7kK28bvW/poi2lRWCeQYViM=;
        b=JwjjvtIVqJBtUcRv0m2c8Cyw4eeG8KlNwIhyu+n3nJPd1Ec5xzzXH8HKWrIU7CkaiP
         /+UI7Uht3GGKB3qd/oZsOzCT2XJ9+BIQJfM8q+bZ7NdnM4rpdreAw9cVr8Brl7Aeb1jn
         iAVNJMJe25Qpg46mKL7zYXYaXPey3/FZXgczgEm8SRpWz8kv16du3ft7lcFzmqwEuvhA
         zL367RzJxaOMOYl7HmaN0Z8ec4vXftjqAV52vEXRApLCHpcsvX3PV8JvYgeSIRoGAjtX
         fnb9pdQMkxAjeV7bQkl1k+HRM2cfLvnEAHoUEJ1OPBZ/uw9/tAddhwPskgk0/BBBx7ft
         02GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760547126; x=1761151926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neLd0+dDQvDA5L4vv0sP7kK28bvW/poi2lRWCeQYViM=;
        b=VM8bo5ITuWnKdplTk/BiMzaPNE+P77hkPPr7wNBfXM/czewXuRKueIjNut1OIew56G
         uNVb/KBS2RYlM3nVxB+3yjktBvSY2cRbX2WmeTvhWe7rHpPTREuuLIeET9BYcFOFVgKc
         uddOaaidfRC5tI08IJV2g0109NO4F5M9HX5ZX5y4IkKtPFMYtB/rkDTa8zoRRvOQbA8X
         wpkCBGumkHb4qltMJLWjxf2PnyVlLTcgBNsIIK9ams/rwmqw/x1xAUnbXcEctGVUsst2
         JvijuQWz3M1o9N8eiMjzOSFsvTM5DALZXGLsN+uL3NiMexGGl8w7xdmRUHW5S2j8gLTt
         nEzg==
X-Forwarded-Encrypted: i=1; AJvYcCWiWXYkXV+b23KvgkPppOxNKC/M1IQ25o0/KBh+njkDicyz17h+MI1KuH65xlzWdEHd0Nk3lPqI83/kGUnRwG83RG+gSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFv8S6zN05qNDrDV5Yx/UqP+hKNoawwSV8Z3oLSYFUbzSukVHr
	Qx29A7jGwivcI9ZusDmG3QAmasK9BGWiqdaNMmia5QQ9+KYCQA00jFR+Sk1Y0Dyg5vxfNVpW+C0
	Vx2CA+rgb3cU8Qm8MvP6lB0qBk7BiG0lNaLtw
X-Gm-Gg: ASbGnctZSakGvuQPEnwgv/HOdDvXNTtltZ/M6JrCMDN4diQJ6Q0YWZxxAWHynsW+JUK
	7iUHy46ZLNI7qQ7Suxp2kz2aD65OecpY15zcTa273/dY6/rc5aOB+EYKoAfblJAYbHKDmfAk/bC
	ehWY5pyNC1+kAgXhL06uEA6V/al79D3fuTqyuqws5OGYP6dyj+9tHqakxicXpIuc5h4hGl9nlTU
	gs4J+9aDz91NjgEmvG85Uc1gN79+FyPdqde8bi6c4JTu9A2qZasyzCJ9pd1/7El6b+lXWTe61kF
	t1Djbl9x7g==
X-Google-Smtp-Source: AGHT+IGsOnSPE3hz5ZfYzWJNVjtUVgW/EHP33IR6zBRV5g9gSsqBcciCEwgcZlf2wmO5rhi1e9vsERWWoOP5SCZzdpg=
X-Received: by 2002:a17:907:7f13:b0:b45:e09c:7e66 with SMTP id
 a640c23a62f3a-b50aa8a5bfdmr2998830266b.28.1760547125501; Wed, 15 Oct 2025
 09:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013181648.35153-1-viswanathiyyappan@gmail.com> <1adfe818-c74f-4eb1-b9f4-1271c6451786@kernel.org>
In-Reply-To: <1adfe818-c74f-4eb1-b9f4-1271c6451786@kernel.org>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Wed, 15 Oct 2025 22:21:53 +0530
X-Gm-Features: AS18NWA4RJCcpLPYd5taRLYmabL4v7fT9byYpjgnUo14PKi00TibSEE5yn4bNKs
Message-ID: <CAPrAcgPs48t731neW4iLq3d+HXEQAezHj5Ad9KR8EK+TNu5wbg@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: lan78xx: fix use of improperly
 initialized dev->chipid in lan78xx_reset
To: Khalid Aziz <khalid@kernel.org>
Cc: Thangaraj.S@microchip.com, Rengarajan.S@microchip.com, 
	UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Oct 2025 at 21:25, Khalid Aziz <khalid@kernel.org> wrote:

> How did you determine this is the commit that introduced this bug?
>
>  From what I can see, commit a0db7d10b76e does not touch lan78xx_reset()
> function. This bug was introduced when devid was replaced by chipid
> (commit 87177ba6e47e "lan78xx: replace devid to chipid & chiprev") or
> even earlier when the order of calls to lan78xx_init_mac_address() and
> lan78xx_read_reg() was introduced in lan78xx_reset() depending upon if
> lan78xx_init_mac_address() at that time used devid in its call sequence
> at the time.

The commit a0db7d10b76e introduced the dependency on devid to
lan78xx_read_raw_eeprom() and
lan78xx_read_eeprom() and ultimately lan78xx_init_mac_address() and
lan78xx_reset()

In lan78xx_init_mac_address()

Only lan78xx_read_eeprom() depends on devid as

lan78xx_read_reg() and lan78xx_write_reg() do not use devid

lan78xx_read_otp() depends on lan78xx_read_raw_otp() which depends
only on lan78xx_write_reg() and lan78xx_read_reg()
and hence doesn't use devid either

is_valid_ether_addr(), random_ether_addr() and ether_addr_copy() are
net core functions and do not care about driver specific data

The devid read exists in this commit (was added in ce85e13ad6ef4)

a0db7d10b76e was supposed to move the devid read before the
lan78xx_init_mac_address() because of the newly added
dependency but it was a tricky detail that the author failed to see

Thanks,
I Viswanath
