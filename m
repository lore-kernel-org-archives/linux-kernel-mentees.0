Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2D36404E
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786471108; cv=none; b=lOsantdZ+E0UmnJXZuWeOFNk/i2S+vU+SB950OowuQKqWm+ikuR50UQXKUEf+9rXG+mKWUcXYzu/oT3xUW3wz6mDi0pcNaDHf9wKnbOiyvXErpTb9LyKfOsySS9mbHgtpLi2yid7dlut4rx07yVGFoN2S1tIBYk/JpsLiy9WOn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786471108; c=relaxed/simple;
	bh=iLaLXHKEjkATRvr5OTjKneeWZjXZ0fAn/Owi4lWXZhk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=W9uVcmQ3Walq6qv2f7EOAfll3r2GoLJA7+21R23TV44TpCB+bQMU8Qx5LOjckhcYaf3QRD4aMMRDKfIJs+ScNcpL3ibUYFuvwXaXCwMf80XRL/4DHQgkEV9iOEq0zCVcdQGftEC9iaPPLgvP6L1a/0Ngp/+r4xl2fUPPUTtI/10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nxp6raxA; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nxp6raxA"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6680ae2031fso182644d50.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786471106; x=1787075906; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iLaLXHKEjkATRvr5OTjKneeWZjXZ0fAn/Owi4lWXZhk=;
        b=Nxp6raxA6rFCv9zNSGiHDT4nFX8HkXy7FAvpXh6uFZndfpK9q1OrV5Mb9lh+nNcEsj
         UL5rfPTwMde+Mopiz4kF3Fo3ZDw+/gSpk09TUecj7YNmGev3ABiHZ4OrSlTF+zfDVA1b
         0F0+5T0scsaDyu0RiSqkJbPDBGyHh5teJEYh+qulsIGrFdsHLqQyY/JpI1q8lfjPBmDy
         ZmUB36IlrSDT2dBzn+oNgifHQlUWJz14fnMeOtFb5OgGM/5tZ5ndg1deEdfguRMrbLyR
         MB7k1FfJ1nETAlnDYKcQ0Pyaj/zWd5fCyE4jSVqEKNcko88l5EHUNZkBvySZscP//yUB
         BlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786471106; x=1787075906;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLaLXHKEjkATRvr5OTjKneeWZjXZ0fAn/Owi4lWXZhk=;
        b=VfOFi74CJ6IWDveAIFk2yuKrlfLPWKRIfwplpvxD3LuuhvbZEei1HnLwDQmEeHgCfs
         gBzXLdSW1iUQh4ie/dHziEQmhHsgXkQH7P8BDbK0p0oBwGS23dWmsUoWIOCaKzgy7KI7
         5a698qDKk7DB+es4xe+mvjOzCDaDZNhAsYxqPLp83hUxwZ/0bxtOM3DJVSG4GSHKqgum
         7EISw1Ru+D2zfZw1jBDB3/ufkhaYja72lH6Bqd2iwoHH+emu1CaWA4UiKJyoMCaMKgAT
         hMeCPNexMb3ulNMqmgIEp5DCJVVGj9jl867+5ZFyv0HjUixqqztecXvjH0T97Bte36ak
         F/8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpfC+2Ex5+Z5Auv7ar17fgcKbV8YiVm8INacFGaP72XyHrf8IfrLxp0RUjwndzidOe6Jj0CygoU1Wd+9pHgl9CIyImfvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ6WU/CLOoV8zv0wcZjb44gWnxGdz6PhxtxsDmZyGBfLDwH8ii
	eycZ5rpiUkbAHabInj33obdRrLVIrELk7x1obPZQlERaJJOEWtf21wQ=
X-Gm-Gg: AR+sD129PP8i3il/IPRt89wTq9Hg4LqsoY2vSyRarnLRYJSr1HqoKMe7gN9/+9Ngky+
	HJIC4W7xgSiJblCYFzzhDLqT5DpQ/9Vska2FGhxiGDfwMnhy+eIDnaOB7vdTxe4DVyRd99aHO5G
	g/e487mceivv5XrkwU6//ZtuJMqToJXiY4+oMPx4JQbmUjCZAUFuNpTVCNr7L7oNRdLVhqQ1E8T
	lC7yKGoNSU9A8TPuejw8e5B3Wt+CyTrQNO9W2bIME9kQlM9IK+8ePICLbX5HsBHXDG4deWFpXZ5
	y9cjE9PzuMxOoXdiZAze1n3LfFJSbmaDA99buZFj2ZBiF45PcXUFftCfZDuK2VCRHpcN8n+CjFU
	iqQbGod/ZViJYzZ2yvFUKJnQH6GgWhXVudvG+9Ebg1sZsEu/dYSN9BLtipCbMle9D5/KY4zIHdk
	1LW7oGK9dDZijNENcM1G0uw2RDJUNjiRU4Q2I3AzjhdeUk1wunWr8SLHKYzUY8/3sR30bDo5a5i
	ZFrkzSxrcVVl7mvxsEorWFzbAjK0zFjrkIRoluAnOt5lUU=
X-Received: by 2002:a53:e015:0:b0:668:112d:d49c with SMTP id 956f58d0204a3-66b22eed4eamr2609810d50.38.1786471105735;
        Tue, 11 Aug 2026 10:58:25 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66b1f2843edsm1547011d50.18.2026.08.11.10.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 10:58:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 14:58:19 -0300
Message-Id: <DKMB5HGIEQCW.3EKGVS7GLRBOF@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Andy Shevchenko"
 <andy@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Jori
 Koolstra" <jkoolstra@xs4all.nl>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH v2] iio: humidity: am2315: add am2320 to i2c_device_id
 table
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, "Marcelo Schmitt"
 <marcelo.schmitt1@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260810183337.451812-1-nico.antinori.7@gmail.com>
 <anqKwJOkl_cxzCT6@debian-BULLSEYE-live-builder-AMD64>
 <anrRkty6ugdJUGmE@ashevche-desk.local>
 <DKM7MV8J10HS.2OIM1TDHB9VHQ@gmail.com>
 <2d7dcced-47f9-4fcf-9668-30acb9e8c9b1@baylibre.com>
In-Reply-To: <2d7dcced-47f9-4fcf-9668-30acb9e8c9b1@baylibre.com>

On Tue Aug 11, 2026 at 12:49 PM -03, David Lechner wrote:
> On 8/11/26 10:12 AM, Nicol=C3=A1s Antinori wrote:
>> On Mon Aug 10, 2026 at 4:28 PM -03, David Lechner wrote:
>>> On 8/10/26 1:32 PM, Nicol=C3=A1s Antinori wrote:
>>>> The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
>>>> communication protocol and measurement conversions.
>>>>
>>>> Add the "am2320" entry to the i2c_device_id table.
>>>
>>> Interesting. No devicetree bindings for this one? What kind of
>>> system is it on?
>>>
>>=20
>> I am testing this on a Raspberry Pi 3b mounted on a protoboard.
>
> How do you tell the RPi to bind the driver?
>
> Since Raspberry Pi is ARM-based, usually we would use devicetree
> overlay to do this, which would mean that we should write a
> dt-bindings .yaml file for these chips.

I do it manually.

I use that RPi for development, at the moment the kernel I am using is=20
7.2.0-rc6-v8+ with CONFIG_AM2315=3Dm. When I need to use the AM2320 I
modprobe it with:

$ sudo modprobe am2315

And then=20

$ sudo bash -c "echo am2315 0x5c > /sys/bus/i2c/devices/i2c-1/new_device"

(With the modifications I made ... echo am2320 ... works as well)
The pins for i2c I am using are GPIO 2 (SDA) and GPIO 3 (SCL).

If a dt-binding yaml is needed I can send another patch with it!


