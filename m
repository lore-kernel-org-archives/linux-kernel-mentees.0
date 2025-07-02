Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587992E7BAA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471617; cv=none; b=nx2VBMjFxekIaXRRDrCck2lv17OTU5MO2uEWqHJLvQelNLeiWovMFN1c/xktWGI3ah/l3wyYbjEbPoXeBWr7uhMvKGJXn5IW3yhOQdYikIYQPov7OUXZ7ZXW07298Gnq199wd+92a6w/9J0LhLT9LxK1zCM4KGAsQih7mc5Fx4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471617; c=relaxed/simple;
	bh=SnlgmvXX9oBJ2pQVKACQLITc0HfSCd9SV1QSCI/mbkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWeQJfT6dLEQ0/x0HrS8x2cjIvURY7jjbzbaJaOqw/Xj6c1igrSFIC4oT3zr2vLO+16CXS8/EKobqIIX6a53w5HDvrAjdmfzIL+fF2ofNin0ogJekEOzM151pmrATAsrrxyuOzt1py+81HP6oL+9kca+k409+bYXR56VTReAvoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BfPFNvYs; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BfPFNvYs"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB3CC80FD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 15:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PfNqTUHxIqS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jul 2025 15:53:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com; envelope-from=dlechner@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C2AE811FB
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C2AE811FB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=BfPFNvYs
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4C2AE811FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Jul 2025 15:53:33 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2e9071e3706so2914942fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 02 Jul 2025 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751471613; x=1752076413; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Kino+XqZYEqgWvIyTiqrJSAa+M+qswg1+WCL0GmDq8=;
        b=BfPFNvYsqeZ1qZAGJE6ZezEDW5e6PEJuLj7tlevG6/VA7ma+WdvIDjvllOjd+64Y2/
         j47c09kcrjJTtnU3uoPeSgyQsNZypEua5bGENiDEAaaw685a4U88qAFWJbz57HksEaJ5
         Q5xZRYaoKl8j6ix1x9ro3n2aLOEkNMjuDs7GDzDwgg9snoAmyPQ2K03EpsvVEnTcL4cs
         R33N7pxSh8I+1Q4Qphfjbk/XQDrZi43cfp1OR1A/cTIqMsKj8ZWbPElnMBgIlYgIVPmI
         xk5rgRMb1jqH4Jr6F/RVcwYoW7WZ1BQVdLtkQJkljYV94bfxInOxzm01fMJf8WLFp2oT
         ZfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471613; x=1752076413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Kino+XqZYEqgWvIyTiqrJSAa+M+qswg1+WCL0GmDq8=;
        b=WS6EIEmo9zhCtiVmeoibBHflVCCLrDQ+udnX/4xC9rrot+uA0FkjxqRTt8v8+/Bx77
         5JagAjx1YYgQzW1NNkMQOOVVKBgQIkr+5gOy+gn4CTq/5YXVvaB3wymeYioBuyECFryK
         vG0QzmOCZ4ThCRSVWeBnvOWTaQ8kyKW1F95Dst1KJ/1uOh9JDI7JncYYUqoOuCv+5wRV
         SmteUF9Mtl00K2qHhaxw2jwBlCuQyqFIpAN3tdJlZSwdWlaf4dBLVbwn7kAm0zPhXYQ1
         HSBilgn5f8exCXv+GAXjGRXGpwQxLro2V+5ZsWpcaRTOiszPm/ZDggkus5fnyNfP+2i2
         4P8g==
X-Forwarded-Encrypted: i=1; AJvYcCUos+GwU2hDw9PzFMD2gxmF5VFK0DX3/hoyUs0Oxmg1vxzN/2lF9UShDeaMu9NX0ItJ1YBfU7BI0YhXp2JxCEiMlCbbFg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy04jdG7UGypS+vVlM8NAawxUnWOrimXMK3IN9mz8tsZ35CM8CE
	aeHe7QL9Is1xmpuZSRFbUgJF45lsCJArJCTz6WZIsjR5Xjio/fl5G1zDd1cLOOZuKKE=
X-Gm-Gg: ASbGncu5A6mK7YDoHQLxr/kRQ8KazQw3pk9dPTKqS2tRtqevnVG6YyR/NrjA1O/+t83
	PaQO8JandgVqFn3js0UYLI85IHSzAo+lYzFz1dKnTpg9btsSkjxU3kJo21qzcrzF6HuXz1yxIHY
	r+ufaeCu4c21P9YhwRCmrBw3NkrNJ4CIBZ7V9d4q8fC6FnWfxwbDFpGpVAXf/dB0pGFlA684b+o
	wXlpcpzJYQGN2QGOazicUKiUxJdGUMtj7nYnu7ahlAsYhKjjJkwZ0nqWthFb8BtOGj4YSBJ4eCq
	Ug5HO/XxGxnRUpTS005hEkTTlNcGlwb2cQf7IvjsFy4JEGgfDycVfDMsuNFaDotuEU8Lh2FKINX
	+C+1Y8dAHt9/kBrnRCITU2afnLG8guCJ9I2VHfzICeMaczYuWRw==
X-Google-Smtp-Source: AGHT+IHqyqv4bHA7mWxBx95w1LJXjzoruqsxFeBP7aW/iw0Ov87EOi4MTilwG8uSt/H50TBf7IQPGg==
X-Received: by 2002:a05:6870:944c:b0:2d6:667c:511f with SMTP id 586e51a60fabf-2f5a89fd32dmr2992756fac.9.1751471612809;
        Wed, 02 Jul 2025 08:53:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4eab4e3sm3980916fac.4.2025.07.02.08.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:53:32 -0700 (PDT)
Message-ID: <3361875b-712e-423f-88ed-baf41af5ad22@baylibre.com>
Date: Wed, 2 Jul 2025 10:53:31 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Akshay Bansod <akbansd@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702135855.59955-1-akbansd@gmail.com>
 <f96b68a5-d750-45f0-8cdd-9761b5daca1d@baylibre.com>
 <aGVIcBLgXZj_YR7B@smile.fi.intel.com>
 <e474db53-1b52-48b0-9253-2f62a3861bb4@baylibre.com>
 <20250702163342.00003c66@huawei.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250702163342.00003c66@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 10:33 AM, Jonathan Cameron wrote:
> On Wed, 2 Jul 2025 10:04:23 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 7/2/25 9:55 AM, Andy Shevchenko wrote:
>>> On Wed, Jul 02, 2025 at 09:16:51AM -0500, David Lechner wrote:  
>>>> On 7/2/25 8:58 AM, Akshay Bansod wrote:  
>>>>> Update the sysfs interface for sampling frequency and scale attributes.
>>>>> Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
>>>>> and recommended for use in sysfs.  
>>>
>>> ...
>>>   
>>>>> +		len += sysfs_emit_at(buf, len, "%d.%03d ",
>>>>>  				 odr_table->odr_avl[i].milli_hz / 1000,
>>>>>  				 odr_table->odr_avl[i].milli_hz % 1000);  
>>>>
>>>> Let's keep checkpatch happy and change the indent of the wrapped lines to
>>>> line up with ( since the ( moved.  
>>>
>>> While I see the point, wouldn't be better to have 1000 replaced with MILLI
>>> at the same time?
>>>   
>>
>> For anything with 3 zeros, I don't consider MILLI better (or worse).
>> Science shows that the average human can easily see 3 or 4 things
>> without having to count them [1]. So it is only when we start getting
>> more 0s than that is when I think we should be picky about using macros
>> instead.
>>
>> And in this particular case, we are converting milli to micro so `1000`
>> should be replaced by `(MICRO / MILLI)` if we are going to do that.
> No we aren't.
> 
> This one is converting from milli_hz to hz + sticking to milli for the decimal
> part.
> 
> Lots of other IIO cases where you would have been right, but I think not here.

Oops. The %03d instead of %06d should have given it away!

>>
>> [1]: https://www.scientificamerican.com/article/your-brain-finds-it-easy-to-size-up-four-objects-but-not-five-heres-why/
>>
>>
> 

