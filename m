Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71936998C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786471617; cv=none; b=DFLoEuVAA0G8Twgy5v4YoN2ylLHwi3c++bj0UNPVtPv1GN7CVcMZYw0PDgrW5HpwD0gWvQvtsY77MRluSzcEM2ihBVRzYFcKaJhGrESEekku2sdFiDyaI8a0YphuTYneuLFj5jJUnNZIs78o5tS4NnxKwX2PJksWJtF/FA+GKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786471617; c=relaxed/simple;
	bh=h/kU+0khOs2mbueaGLEuF1Wzrn64yqgGdJQhL77jvF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncz8A4/AB3YbdgaT5cxQj5a85YLZExa6CG0YOedmWH1E/dRJiCpVGFoekCVHWS5l+1jyd+zUdVLRKKuXDTa1UGt201Wjckw6y4uz+zLeKP1Ad/xygEG3ZqDBHTSWEy9nC6Sd1Sa2V9q9YSypCnzhaPh2M8F4k2bBZmSmIMYrEgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Shdop1pS; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Shdop1pS"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6acbf97e9a1so92406eaf.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786471612; x=1787076412; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPLjvPRzdcvXjvZulrX1VDW95Qi2CQ4uYFgXPT7AZFI=;
        b=Shdop1pSlv3A2gp0pQnqa7F4MuG4J/gQE4I4390PEXC4O75dcl5Cde25Yo94rrUbKG
         B8tAxGPwJ6rhHsem2nEcbuzC0aPyM1175KISVeHvbozhDbLBTHrLIdfONDGLd54r5hbo
         MqbuaVdicDBiHw1CkYe040rHBRTPM3HE1HD5XCxP+CLt0UbOhUyWX+Ux5ISReiaTeCQ5
         SoiySrAik4rKJjSgWsxfDEs0yLC40jJN/1oNj4sq5aCfG3F4mddvcDKZjyexFHkzv9Ok
         AjsrlnRUjA8ZJBtP5/RIHKVk8EBc278j1LmXEe96zsxXqlGhXgDCuQneuhLKOAx/4WAD
         N8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786471612; x=1787076412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPLjvPRzdcvXjvZulrX1VDW95Qi2CQ4uYFgXPT7AZFI=;
        b=V3dpuHaZD/L4CuN96WFWrNAMYyJkZFrWLv5uCkq0J0kzfVu6xLTXwlIj2UOtiJe4nc
         YPl/zQTeARc3A/xh7E6X7e0K3sv7bv/AgWIGC/JIs2+66es+/sVJdHrjIBZsH3bgl70J
         5JaNzZu38IZ2BuuF1YtNZ9+Dyw8a1z7go1Fc7ezkLsV+A1gWLdhEdk1gjhUWMMSoN9+m
         TGYBfGy+OKB5anMex7JOOhAGaK5LRiH9moSD8nvZ/pLiey1mjRihm3vJSLti967Gn0Ko
         dERk0LXBVsl//xAG3M61z2vYIK7xFa3SB69Gyr8cO7i5XROKkwIsrvFcBecDdwMXjUnA
         p6ig==
X-Forwarded-Encrypted: i=1; AHgh+RrpMae8poXITiQHEISkRO0m7F+X3gg5jdUxDfUIPxzoCPhPLGPi6+Pv5rA+8lSBu5rpILtaOOkXeMc6Xp1TVB5RlTUToQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdhHXnoAYd8Y1ymcLQ22SXA9N6DyeooOYqh46dsweULZ7Xje2R
	oTiOTOnQVu+oa6HHlplU7CQOAF7uTIfFDXpFTfkb+2e2n0ulB142zUyFlG0aOu5XXj0=
X-Gm-Gg: AR+sD11VbritIFRDcOA1lyn9UbBD1d9U24zM7omjQkzCti0D5jo+AiCG/Jigo9SRG9w
	RlIz8vX4/uLT9NRjglQcZ2LEmc1htay8ZG6FaPWrjxXYfYduU0du7XVfIWek2vetjIsCu693wqZ
	zSxu7jcnETCviQ+tATplAm0/qcDa8nPbw0qmKY4Rzs4O45Dc7kNV5vm1SyoZZtaYgDgMjymRA0c
	U/5MfYfecgEGSajRUtJcdvIEK1Gf9Z3IAtUXnDnxoU9wiX0P7M1VB1RCs/nJARWwg3YA05ahjot
	5Mw7amnkJtTZLV0H03pk6xMawr8n4G62Fd5I6iHh+aHVtx9g74jgMWywHeEb477XEFQcEpWc9OO
	WxJSLP+tpyhMXn/r+ENuJrgf/7hxcTDIS0/l9AxoIOGjKsNPUzzuzGYIUSmyklm47046GYP9GVk
	3rJKByjaq1H3zwdC+mzfIooexXbUd8gIgXJdhl7Obt1mFEMNF4ItmHge2Tk6jz40KW//UOnQr2s
	MXMoaJoVbkjzG67fvgMT0Ya7ITO4PZS0AZb
X-Received: by 2002:a05:6820:560f:b0:6b0:abaa:bd3 with SMTP id 006d021491bc7-6b0abaa0e22mr1275805eaf.9.1786471611847;
        Tue, 11 Aug 2026 11:06:51 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7060:91df:60e9:76b? ([2600:8803:e7e4:500:7060:91df:60e9:76b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0ad500d37sm382701eaf.7.2026.08.11.11.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 11:06:51 -0700 (PDT)
Message-ID: <125ac6a1-a089-4ce8-9b20-c3448b6b5208@baylibre.com>
Date: Tue, 11 Aug 2026 13:06:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: humidity: am2315: add am2320 to i2c_device_id
 table
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Brigham Campbell <me@brighamcampbell.com>,
 Jori Koolstra <jkoolstra@xs4all.nl>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260810183337.451812-1-nico.antinori.7@gmail.com>
 <anqKwJOkl_cxzCT6@debian-BULLSEYE-live-builder-AMD64>
 <anrRkty6ugdJUGmE@ashevche-desk.local> <DKM7MV8J10HS.2OIM1TDHB9VHQ@gmail.com>
 <2d7dcced-47f9-4fcf-9668-30acb9e8c9b1@baylibre.com>
 <DKMB5HGIEQCW.3EKGVS7GLRBOF@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DKMB5HGIEQCW.3EKGVS7GLRBOF@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/11/26 12:58 PM, Nicolás Antinori wrote:
> On Tue Aug 11, 2026 at 12:49 PM -03, David Lechner wrote:
>> On 8/11/26 10:12 AM, Nicolás Antinori wrote:
>>> On Mon Aug 10, 2026 at 4:28 PM -03, David Lechner wrote:
>>>> On 8/10/26 1:32 PM, Nicolás Antinori wrote:
>>>>> The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
>>>>> communication protocol and measurement conversions.
>>>>>
>>>>> Add the "am2320" entry to the i2c_device_id table.
>>>>
>>>> Interesting. No devicetree bindings for this one? What kind of
>>>> system is it on?
>>>>
>>>
>>> I am testing this on a Raspberry Pi 3b mounted on a protoboard.
>>
>> How do you tell the RPi to bind the driver?
>>
>> Since Raspberry Pi is ARM-based, usually we would use devicetree
>> overlay to do this, which would mean that we should write a
>> dt-bindings .yaml file for these chips.
> 
> I do it manually.
> 
> I use that RPi for development, at the moment the kernel I am using is 
> 7.2.0-rc6-v8+ with CONFIG_AM2315=m. When I need to use the AM2320 I
> modprobe it with:
> 
> $ sudo modprobe am2315
> 
> And then 
> 
> $ sudo bash -c "echo am2315 0x5c > /sys/bus/i2c/devices/i2c-1/new_device"
> 
> (With the modifications I made ... echo am2320 ... works as well)
> The pins for i2c I am using are GPIO 2 (SDA) and GPIO 3 (SCL).
> 
> If a dt-binding yaml is needed I can send another patch with it!
> 
> 

Yes please. It will make it easier for others to use as well.

