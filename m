Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD8292B53
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 15:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468670; cv=none; b=PicW10B2CLOqAog4Mw6XV+m7ky8jkCZTlLMtab+x48VCQ52nno70Qce9SYjRYPILqQ4lpcK8nsga1DGfQLJoSvVsfjliFg+nIBdgDcZwbqeP5sgrI3A9d5+MD/twZqBU9BQINMD/BIQPwV8o+Hdab1adnJhFitZGQT47lBaO9Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468670; c=relaxed/simple;
	bh=+1Y6ZNOjjbezKMVrD98UVg4jqhd2A4KkLJqkx9x2Baw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQtttyEEpaWXZ4nSb3KdAir93soRYjjMRO1aR38bMX3vGWiGGnttmARFUxH3pSxkjiMIoo1Xs96Yox2qfhwLVRuI0XTYAnbu4V/jFoHNsI0muP2bjOwoUxCxmVY1zsIdFpFmTQnAVM72MIrShDrrfqQSybkA2YsklfWV3KDDuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KBISDKb8; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KBISDKb8"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EDB584230
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 15:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTJeZBfrxZhK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jul 2025 15:04:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com; envelope-from=dlechner@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C63A58418C
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C63A58418C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=KBISDKb8
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C63A58418C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 15:04:26 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2ea65f5a0easo3950377fac.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 02 Jul 2025 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751468665; x=1752073465; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpSkZNRj+KNJmdYaS5yXC0vQwBvPJpgN8lcF/7GiAl8=;
        b=KBISDKb8dGYKwJa+YLi8qw7sN0Hbt3NCNBWSTEdR3miSpFDjt6wjRJ5tI1CqzjQLq0
         n1lPDVKtLD/BwIWnYZlOjGU3Yrwy7wAloDTNBxxbK3AZKLLZZ2pHSneEr9QXmSQ31XYE
         qq9SLSm7YMKrWHdDvXxvw2py/o0zA+rrpZasZvwvz7a2TEA/maE9lWURcWMhkNTHANAp
         XnXygr8Cik2nUHmhbVZeKXra1j266UBO8APId7GHeQnn6tvjh1qHuhMQz0iCAl9hdDvh
         OOQJgF/b8+GyP4L5OLpKes1BVzD9T1nAmVETldffzPBDq0tWUZyZmNFNXM8iMbICkMCz
         FshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468665; x=1752073465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpSkZNRj+KNJmdYaS5yXC0vQwBvPJpgN8lcF/7GiAl8=;
        b=vkDK2S2+LdfNhH8yC3X7pLAgHPkvqlOkjURTtDEeNELhLcUq1RmXtM5BddzPO5qp85
         MYV/RN4zyNJqIfK3hh3+vAGrykRGS9kCULhmCeXGJJdVKUOC8oeGJz/RaFY2s5akEQMe
         5lGnNXn/3ej8IKwCChZVNAncMBbd6D/sIaXZoYsZFzj/8dyCkFn7broosOhdXhi2Ab0U
         QU8+tjxT4Q/uE5kQrdRisUHoO1vwgEf62xyZnLm8HbDkqvw0AnV4s4fH9hzSVJ3eupSZ
         +GZeqnS3lMx7bK38wfINPfAUPFrimE4FpmKE4KtCVehnAiFZTjzrOuFE+YvrXN19sfhx
         FAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5oHWILIQDL6AovX06DclCzM+Rm9Q7azLlSL/SH98I0vlX/BZYWbMrRPZwhneWJtOcMOZFa8oV71/Ne5B68Hpq06kjNg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz48BiMhEA4QoWkSWe2pa5Q0nGud3pA1615xTgQ/l0tYsjggpYC
	Rp9gejlyC8J8eh2jmLF/8pXMEGWf3DFHGWMl7z732AolQVzvpUk9OS080Jg+kXHocHQ=
X-Gm-Gg: ASbGncv32D+/yztFE7NmqmMf7pJGgdgOZROgFplceCnzhBodffVbhalamrD7dhyWHXN
	ZHE3w3/8xIvjqizTHqUVNy27rHFKqCGuZaHN3uYqFVpqve0B3MsIhEMU+BOKQYf89x6SM4RGRda
	mcEbsqUiKpvPQfLizjN7HEaboqHBQPEiUZjoehlbO9mhUeU9axP6MYG9tUR0GedSVqcblw99YJj
	+is1urbyuew7qimKQiFqwHq5vl4DyggLsAbU/paNGikag7Lkg+DG3j+SPHANMsueVadPFj6V4AO
	AkZlYZbsBdp4APCoUdGgOShgyxLLOl9XJ2oJbgJzvfchetNNn+8LImKFk/foZulj6v/7THrltI2
	4M2pmbbC/UXiK0Uerjjml0w0//5TRKikglmMj7+hN6MJ1sxFnFg==
X-Google-Smtp-Source: AGHT+IFce9C5ghIoSx3a2rGe/4a+oNnev+bEZ9sPLErCFoyKvHyn2elLjaO6JeBMAX7wGFfiUCYBRw==
X-Received: by 2002:a05:6871:796:b0:2d4:dc79:b92 with SMTP id 586e51a60fabf-2f6472a600cmr2079285fac.6.1751468664770;
        Wed, 02 Jul 2025 08:04:24 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb124960sm2543365a34.66.2025.07.02.08.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:04:24 -0700 (PDT)
Message-ID: <e474db53-1b52-48b0-9253-2f62a3861bb4@baylibre.com>
Date: Wed, 2 Jul 2025 10:04:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Akshay Bansod <akbansd@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702135855.59955-1-akbansd@gmail.com>
 <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
 <aGVIcBLgXZj_YR7B@smile.fi.intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aGVIcBLgXZj_YR7B@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 9:55 AM, Andy Shevchenko wrote:
> On Wed, Jul 02, 2025 at 09:16:51AM -0500, David Lechner wrote:
>> On 7/2/25 8:58 AM, Akshay Bansod wrote:
>>> Update the sysfs interface for sampling frequency and scale attributes.
>>> Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
>>> and recommended for use in sysfs.
> 
> ...
> 
>>> +		len += sysfs_emit_at(buf, len, "%d.%03d ",
>>>  				 odr_table->odr_avl[i].milli_hz / 1000,
>>>  				 odr_table->odr_avl[i].milli_hz % 1000);
>>
>> Let's keep checkpatch happy and change the indent of the wrapped lines to
>> line up with ( since the ( moved.
> 
> While I see the point, wouldn't be better to have 1000 replaced with MILLI
> at the same time?
> 

For anything with 3 zeros, I don't consider MILLI better (or worse).
Science shows that the average human can easily see 3 or 4 things
without having to count them [1]. So it is only when we start getting
more 0s than that is when I think we should be picky about using macros
instead.

And in this particular case, we are converting milli to micro so `1000`
should be replaced by `(MICRO / MILLI)` if we are going to do that.

[1]: https://www.scientificamerican.com/article/your-brain-finds-it-easy-to-size-up-four-objects-but-not-five-heres-why/
