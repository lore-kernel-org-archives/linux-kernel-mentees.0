Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B29C2765D1
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 18:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755714479; cv=none; b=hMsrypPCoG3GFF9B4BHsWo1l7WYhS72aW/I+YsVpA46gtviFRAdyHl0hF8o9atVi5UHiOpNrPXoVHJKR1Wk6tMYQPnOnXMJMbGhEnFp/rS5FvVOaOgva+mYiolIF6OEw+lQjCJscWfHT3HT3E+k/fUB9GtDpTMWQKbhrkv3gSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755714479; c=relaxed/simple;
	bh=epICB6jVv4l91QaSUZCtYLQ+aCm+xHSlUTQPeCzhx+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUiyN0zZ7ZwPHSKBN9D40uh47NW92lnMVoW8fLeLBLk59hHVWP+Es6EGHQ+Rk26gLXfNGQm+/YsiMxmBRZ+3ZxwIqD2U0q090mIov/K0B9n3ttEIKghaMKtzhNguYkuqO0ztmD9oreDwsL2Unm8L+v9G1edZBLx64hlb5QWHHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=LFpuNqvM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="LFpuNqvM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so1187145e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 11:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755714475; x=1756319275; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NPVQBMSrrf3jhmLLcgVMSadSNRoC9cJI1+fcHorCmY=;
        b=LFpuNqvMen2Z5LRxGFJhk0eMb4L8oADsIZqFb+2m3FHtBrbda96CU5QmdbSdKNAaOU
         HnQWIxK88ftO3PpjBacOxDLXvosy/zLmzsAuQYo4jJZYULAROhLmc5StewhLbYx8LnXp
         7Jn3fBMioL3FVc8wP7MqtgeybUbX6S0XMp4U2LZMy82hQCZFJwbAVSF+40zgPgSHYXmn
         Rr3eNDZMsm898/gMM4jU19lXmOA33ccbdc+hEZdhA0EdW3zq6f/5Ve4Ioq3Kk5InR8xI
         Gx4YOCyAK5qjUku6lvw2vgLCt2MMWp39qaXISQZDXjH9OwpZ91O+PXXhNFbamehAWgT2
         71Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755714475; x=1756319275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NPVQBMSrrf3jhmLLcgVMSadSNRoC9cJI1+fcHorCmY=;
        b=QX0sGhFDo96k6Dc0UQd1UM3JojtNIXAaqSKkxqWuJX0S4mCj3sE/CTJwnZonLHF3v9
         0XIYQx4u11UTJIwE+yQ2dGxk1+i9KkNL1pqXpaTHRzSkiyHAIPuC1+LfclxbUYccxmn3
         11Nd0CjUdoiKLOY26En5ltM2A+8xNTb2VUcvy4EmJYRL882ePSjbEj8qDcpPXArRp1vh
         Ae5+fD04S8eKNi4g26ATw39QVPHfQKygrbtCuMiuAIvJ2xWf6fwS+TyaLSsdhlYlgNIE
         Db+/jjfjtS8QFCdowwfli3Al02ATorsrQzxCScuQBzitNtDi9L7RfH6NCkArh0rCM8U1
         v8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWup0TfeUpsC6qUcXNRJUZVzOSFIwJXZU96ub9lfOtuPSM8VaxUvERklgJScTBxnUrPC34HgqqXkoNWofoZE12ULjMp0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKfWjiv9m4XV5jrrp1JAJOOHxKxofOa1TVtQhr+Bz3l2KcHZfX
	+BmdYBdUcpcoAneuL5qrbi9UixDEt1IHSmtNwZngANTYO4DIoN8CtKow/ixFb1wxH64=
X-Gm-Gg: ASbGncvdB2S7N+I+T21jYOvhNIKUx09E090PgRB8CfjWyeXT7QJKHXOm2uMXlOdrg+8
	8ntFP7pjbNVCAAACf0xrNJecpnDx8+JxTjTEcRdQ+QtGBS9B6l+YozC7olQgPSNSlFPInzS/YlD
	NSY6yIE7koYsSNYdSNXxaXCSWEjVUI5AXLkTCDfYhv+mV7yyXDQCF/5Nark53VEdslcE/sapJjc
	JKSG+YO3o3No52gyaZC5Lr+0NKXVvYMC7SzxUihXJy0dEXvszCffTlm3OYqFphzVxMq7FX5Ff8V
	0iBDS092q/vU7E6uJmLc4yoEftJtIpy80SpOcJwALQYFVLD7naST/M0AflRCIUnpRQlV0gV8fMA
	P6bJl75HTCnstD3Q1BVPArec+FOa93zsUumCrJlfjWssAjIJ8Vf7acWWkLikkbobOjb11eBr1an
	31GGUmkktefyfs1e5K9bKptKw=
X-Google-Smtp-Source: AGHT+IGQKS3XqM+4Wd++Np9yalKPfzEFkK54upvYWtNTNYRTddwvhBFV5n3bYbpZpN+GCnzAAC724g==
X-Received: by 2002:a05:600c:4a06:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-45b47ab2420mr21491235e9.8.1755714475079;
        Wed, 20 Aug 2025 11:27:55 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:7e73:cf38:ddee:2b1d? ([2a02:1807:2a00:3400:7e73:cf38:ddee:2b1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c310efsm46093025e9.7.2025.08.20.11.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 11:27:54 -0700 (PDT)
Message-ID: <1a4a25d2-25a1-4d06-bba6-50f51cfbb619@hammernet.be>
Date: Wed, 20 Aug 2025 20:27:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: add UART resets for Soc K1
To: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, elder@riscstar.com
References: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On 8/7/25 21:18, Hendrik Hamerlinck wrote:
> Add reset control entries for all UARTs in the SpaceMIT K1 SoC Device Tree.
> UART0 was functional as it did not need a reset. But the other UARTs were
> unable to access their registers without the reset being applied.
>
> Although perhaps not needed I did add the reset for UART0 as well,
> to ensure consistency across all UARTs. With the current-speed set to
> 112500 baud rate, it matches the factory U-Boot settings.
> This should not give issues with early console usage. But perhaps it could
> be a good idea to let somebody else confirm this as well.
I have tested this version for a while and no longer see the need for
additional confirmation.

>
> Tested this locally on both Orange Pi RV2 and Banana Pi BPI-F3 boards. 
> I enabled the UART9 and was able to use it successfully.
>
Just a gentle reminder about this patch.

All UARTs are listed in the K1 device tree and probed by the 8250_of driver,
but without reset lines most of them are non-functional. Adding the resets
makes them usable when mapped to devices.

This patch is limited to DTS reset handling, so UARTs are usable in the
current state. I’m aware Alex Elder is assigned to the UART peripheral on
the wiki and will likely handle the broader driver improvements (DMA,
clock updates, full baud-rate support), so this should not interfere with
that work.

Thanks for taking a look!

Kind regards,
Hendrik

