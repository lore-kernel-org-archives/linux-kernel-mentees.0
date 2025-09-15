Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D838031D740
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Sep 2025 14:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946422; cv=none; b=DRBs0kJZmiR6cnkH/wsNtX+YvkQjsruOM0CLTIumDB+ktSzPelt0v3SP+UwwMgNRwfN5hC3aiaWkhXArTnS5PFBeWZ+8q2LnIgSuCqU4iuWoWaYzqNPkcQQ5ZwU5vJkJQWrdvD+uof2YmfFeD93XLJO8gBE/LVhASxopsLGVypc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946422; c=relaxed/simple;
	bh=B9iBG3o70JLtS2vZWkvI2+9FPF/4l8skzLqAxOuWZ18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mr0WicXxP3yfq+Wtdqk5m0vyLvWhenvt7dh/MQ0Ei++5n4cHnskV2t1LiHf9Lf5O+JLtykUBTpABZINKd0V8o2Yvx8bzrpZzhTxwLcNgt21PQFH9uAIjqSjzLtp50j1G/2FUfrBLWxK3vzalcTZU8CsDct2TR6/abFtcbZm63RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=oH+JVF6t; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="oH+JVF6t"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e92ce28278so1355928f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Sep 2025 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1757946417; x=1758551217; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v5icuTPC0s/pPOE2ESDNXoDhKzwTzNxmTUDIIwZXJok=;
        b=oH+JVF6tl2dAlpE0EZGzfMIeBQPairkxrsCXOmK1FwZkM7EHKYw6feGIcrTqb+MUrt
         zTgow8gV+ZbD1bBJr9xxby32Cx4fAfmq0KXWknemOXRoq0zGedHYq/2PhyKnw/S7bC3w
         J0KfG2WoJtd4hpNvQsswtW2p/2/I3VgboxdFMTO7bh29b1SzJPWNxyiiUFesfj5ri24+
         sCDWLFsYmTWVOCDfp+SEVkHPN361KO8jgtO9Ny2lGd+urNk+kVCqmg1f1VknQ+X147da
         365PitQuSJcjcR9FeR2QZ7ro94083IzweWe1sI1wBqLpziA/rqpw4arnYY80OMKNOHBv
         SESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946417; x=1758551217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5icuTPC0s/pPOE2ESDNXoDhKzwTzNxmTUDIIwZXJok=;
        b=ZEUjjxkp6msZIasEEVU2WLyUUBZhZFt//YsQyXlam8Vsc7KwYk28t/4seuCgqV9Bc3
         cvbM9d+1O4lOVd8qMtSlcmvbj0fPDW8YQTyNV5m1E+FMacLdUVNPVPX8vvhCFzrQiRYL
         Gg3gyTo6e1SX8gl4SAaquvRVZF8T3SmIFqzzWfiuzPwvWeOpxupvo8P/hx4Sp2wpV6hn
         Qrf+4p5+x2TSCRHXqCpyclj3JlCmuRx4CzOxP1Ijk5JnBerzqkouR2WOvXqW7Ndn0NLv
         xJnLlcBKUzkH+gotiBPa9AjX5pbW4qJrfFswaMkkVWz2AyYdbR2pYxgsZM7VTJbEW2AM
         RxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTcGxCQURn7Y25DVtKal22nAbc0pr3CeWO8ifGpzf8pK8GKpYpyHuCX6EIijE5myu4U4IpYvbvQCFoV3f9J4iRGVWBJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrlGM3vD3FxfX3rA778VT+q5ICilNVmPCnnvP2KmlKKV10foph
	eKiF2y68SYDY4KnzMPwoIGRzkk31uIEkKLiUxADphyyJBHoliJ3FG9ZTZ0v4ur7F+9M=
X-Gm-Gg: ASbGncsbcgIKG+6YbcsaCZ7G4JNQ94cvf9jz7sGopT8M47ARqE7EqDzBlu+g/zkAzQh
	q1BmEEsawmU5dC4zYj/n1qmxkQqoFdSn8rii3rua6lvZIgDcqzB7SZ4tSftIYmkloLy8Mf9Qeli
	KLnOaGwSYHhmzEbtwHE73Hckt6mjaHSumcbdZBWTcLPvA/x4UPFDjG7gMK0CZ13o7FfbGW6sE7E
	igwZbQmrmqfnarApSQRt9U/FCtODjwaWzWASlci9oXVmJ3kEUrw8ny/2/lyzJBJ36xmEkR/qa/B
	zunQsih5fu6kNQ2WuNohyVwsy7mN86xxzeMmfoHvxIjg/uyqzOhBUR82pKWqYipVQAfvaE8jqsX
	7yY27MpDgNDwZMw6Rwi+VsU1+KBo1XqfDZFRp88od4kiu6YwJr/kuxrfd5zdS4JaY3thPvKNK3W
	fdfqEFWyKwSrwablPDgbCaY88XaNfyLcpp
X-Google-Smtp-Source: AGHT+IFs0mXefHor0OfcKtJiaLRNa2umUlSV0hyShyz1KhSiw3PD6NcKqHt+Ht1UUfx+184BUZwpHw==
X-Received: by 2002:a05:6000:1841:b0:3ea:6680:8f97 with SMTP id ffacd0b85a97d-3ea6680924dmr3500151f8f.2.1757946416790;
        Mon, 15 Sep 2025 07:26:56 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:8a33:a6aa:d0e:30e9? ([2a02:1807:2a00:3400:8a33:a6aa:d0e:30e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01baa70dsm187561225e9.15.2025.09.15.07.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 07:26:56 -0700 (PDT)
Message-ID: <aff80932-861c-4527-93a1-9fc2c1eb8d8c@hammernet.be>
Date: Mon, 15 Sep 2025 16:26:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: dts: spacemit: add UART pinctrl combinations
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250915112845.58134-1-hendrik.hamerlinck@hammernet.be>
 <20250915120031-GYA1251948@gentoo.org>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250915120031-GYA1251948@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Yixun,

Thank you for the quick review.

On 9/15/25 14:00, Yixun Lan wrote:
> Hi Hendrik,
>
> On 13:28 Mon 15 Sep     , Hendrik Hamerlinck wrote:
>> Add UART pinctrl configurations based on the SoC datasheet and the
>> downstream Bianbu Linux tree. The drive strength values were taken from
>> the downstream implementation, which uses medium drive strength.
>> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
>> hardware flow control conditionally.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> ---
>> Changes in v2:
>> - Split cts/rts into separate pinctrl configs as suggested
>> - Removed options from board DTS files to keep them cleaner
>> ---
>>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 389 ++++++++++++++++++-
>>  1 file changed, 386 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index 381055737422..8f87f8baaf77 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -11,12 +11,395 @@
>>  #define K1_GPIO(x)	(x / 32) (x % 32)
>>  
>>  &pinctrl {
> Generally I'm good with this version, only have one minor comment
>
> How about adding a "/omit-if-no-ref/" before each pin cfg?
> This will shrink the final blob size if no referece to the node
That sounds like a good idea.
I will send a next version with the change.
>
>> +	uart0_0_cfg: uart0-0-cfg {
>> +		uart0-0-pins {
>> +			pinmux = <K1_PADCONF(104, 3)>,	/* uart0_txd */
>> +				 <K1_PADCONF(105, 3)>;	/* uart0_rxd */
>> +			power-source = <3300>;
>> +			bias-pull-up;
>> +			drive-strength = <19>;
>> +		};
>> +	};
...
>> -- 
>> 2.43.0
>>

Kind regards,
Hendrik
