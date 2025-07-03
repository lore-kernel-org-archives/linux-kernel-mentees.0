Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE1B2D3729
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545887; cv=none; b=qdh8jG+tNJ5FKDCp1zZjjt9tPGSWbddPTj8w3E4/hnQpYMIPs0FoH8G3inMGrad7G+9m3OvpjrZhANEIOy7lMkOE6yvSBN7F8KdBXDXPRgUgR83T42eF3xY0XZNHfStxFGqIQsEXgWbUycAoymJJRUnRqwgvgMgESgq3ABLFRvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545887; c=relaxed/simple;
	bh=wHZMwGeMu6Gz0/oJi7Mjhcaw0i0kH9KL/sFnw9COLd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpYOlwc1rZ6JR44JIlA+9QDKHzSSzHRkYJVV03NZ4myDkcykCodmKkuFleB/q0GuDFqpzXag9GbbCMrAvouqTBggS7lTQzQsZpOKRWJVLshM8Wbx8IFf0Or15oqobkxqJDQ+5uxH/fd9BUjFTPr2L/yvhMP8Hg+PLs4JfLYP/Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EClkvrVE; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EClkvrVE"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B01CF40F8B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 12:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtoeORGawpVU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jul 2025 12:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=dlechner@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A1A4440F3D
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1A4440F3D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=EClkvrVE
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A1A4440F3D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 12:31:23 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-73afbe1494fso3159092a34.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 03 Jul 2025 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751545882; x=1752150682; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipYIW9G7F5Zd0SdovUCWb1HtdZX8BUKUwoIo3O9WcdI=;
        b=EClkvrVEmET45MgtmNPm9lLzFlpTJAv4JMf21i8mPredA4bAI8URU0WDFOqxJX6AaP
         z/ZpdtOwoWUCZynTr7CONyQD1mT0KHnxxuo0M2qlVhXIBxY27SJUQzEN4lCcEf3KIbDZ
         yHhwpSGOciEEWAWvh6v8lsPRhl0V22qyEd05x8T6QVZXZgc/T0kA0ss3CEhUh3+F3kC9
         gpHbQJUxOtCqNSl89p+dyG80VIavoB9i010UyPtFTb1IMeNMQBln5xj2nlf+VLLDukMh
         Q//RXgULJPx6x0dEJ7QsU4b+ghEFihj+LBgfY5zym7bmH0mYbrh/ktAn4mbPLU8885y6
         5GuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545882; x=1752150682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipYIW9G7F5Zd0SdovUCWb1HtdZX8BUKUwoIo3O9WcdI=;
        b=Y6nI3RDdtE2eG82IA4oFYX4KDXxjNm7i4gnP3d2Wf+ireRAjSohqGlcsqK/ToBr3jL
         IRlEjJmQPlJWq2YcAaXobkoW0AEay1VWaricbqb3txZSiF1MCzV/an9+7I6q9QnsXp6S
         VG1l2j+m54NoRVEWFCw1Plkl7RvXU7PMPI8qQi2ac5c21ybMeMk9GEnJknS0mIXug/NL
         tViWJXveNP0JUlDu1NvPq9Y+0+YHNSdm0WsMc6x5Mf79NtuIWomQpb9D5CAI2iPtQKzM
         a7xSvuc3UOb9+7I3tFiglAYAp24QAPIFfx+MCDROhRqC0RofVtVO4k+byFZqZC3uBJ6h
         +5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWu0fL5sOYpOZXzql2tZl+Y6sZ9GOo3A9K/M1g7cUtlUGQLioAzK7Bzp1irBiIj36vxD+jp+ZpbohB50H4c+3qr5eOqfw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxcyxKWa3bEso4mZBz4jMzTTY77zGzHFzCs8sgR3/w9DOaNFcND
	ygPb6Ydch5NO09vdYVNW0/1k0kkmSLPPOc7GK1uobUE8aBCGfgmijTwknFj7bZczLZE=
X-Gm-Gg: ASbGnctJwEIlr6kM6NaRBoDJKOgF5xJErypAu5tDR6YHgtUfM4Zks17xfJ2UrLYZ9aN
	SXKg70gILl3zhEsYGsjSfkMqjdimQ6M06RYPvm2e/iSbWmLuIgQen44irniTo5jZv8ZBArv0KOn
	Dbtr/gvN3Q00ZzyzHkKPIx4UCZUH+c6svJ0UZ4b35dAMi/BCQuE2KLMma98JPCdxPuyoNhNE1rU
	rHsi0WZq9bwCxzO50Rsbg88pfqLsPCdBbODv70KfNhbnFwyOWV/S9Iev72R1REbYUHYaXM7U7pO
	iyfv4SdkPZux5g8zHtiZMvszdSCE0lLGpI5Jig9Y5UJEDzahyxf6hnm9fR5KlJiGA5h2Xkrz3tG
	BqCaRzBqhmpKZk0bOtJ6BUTlpRmIZLg3GT/0wVLrxv88mcLxDrA==
X-Google-Smtp-Source: AGHT+IGAV+iR0RWrusJP0JVuvfH1MLIdhFsUGmJ0+FB8CDbzG398OjLBHoNJniF6BAI2mKMnhGKgvA==
X-Received: by 2002:a05:6808:4893:b0:40b:91f9:7d03 with SMTP id 5614622812f47-40b91f9950dmr3962528b6e.31.1751545882015;
        Thu, 03 Jul 2025 05:31:22 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32289870sm2947065b6e.8.2025.07.03.05.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:31:20 -0700 (PDT)
Message-ID: <5a8d944d-a6db-4513-a282-e574d228f9c3@baylibre.com>
Date: Thu, 3 Jul 2025 07:31:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
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
 <3361875b-712e-423f-88ed-baf41af5ad22@baylibre.com>
 <aGZHyr5zSRLp1m2p@surfacebook.localdomain>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aGZHyr5zSRLp1m2p@surfacebook.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/3/25 4:05 AM, Andy Shevchenko wrote:
> Wed, Jul 02, 2025 at 10:53:31AM -0500, David Lechner kirjoitti:
>> On 7/2/25 10:33 AM, Jonathan Cameron wrote:
>>> On Wed, 2 Jul 2025 10:04:23 -0500
>>> David Lechner <dlechner@baylibre.com> wrote:
>>>> On 7/2/25 9:55 AM, Andy Shevchenko wrote:
>>>>> On Wed, Jul 02, 2025 at 09:16:51AM -0500, David Lechner wrote:  
>>>>>> On 7/2/25 8:58 AM, Akshay Bansod wrote:  
> 
> ...
> 
>>>>>>> +		len += sysfs_emit_at(buf, len, "%d.%03d ",
>>>>>>>  				 odr_table->odr_avl[i].milli_hz / 1000,
>>>>>>>  				 odr_table->odr_avl[i].milli_hz % 1000);  
>>>>>>
>>>>>> Let's keep checkpatch happy and change the indent of the wrapped lines to
>>>>>> line up with ( since the ( moved.  
>>>>>
>>>>> While I see the point, wouldn't be better to have 1000 replaced with MILLI
>>>>> at the same time?
>>>>
>>>> For anything with 3 zeros, I don't consider MILLI better (or worse).
>>>> Science shows that the average human can easily see 3 or 4 things
>>>> without having to count them [1]. So it is only when we start getting
>>>> more 0s than that is when I think we should be picky about using macros
>>>> instead.
>>>>
>>>> And in this particular case, we are converting milli to micro so `1000`
>>>> should be replaced by `(MICRO / MILLI)` if we are going to do that.
>>> No we aren't.
>>>
>>> This one is converting from milli_hz to hz + sticking to milli for the decimal
>>> part.
>>>
>>> Lots of other IIO cases where you would have been right, but I think not here.
>>
>> Oops. The %03d instead of %06d should have given it away!
> 
> I'm not sure I got your comment. The '3' vs. '6' will just define
> the minimum amount of printed digits, it does *not* limit the upper
> numbers anyhow (it's limited by the 'd', which is (INT_MIN .. INT_MAX).

It is after the decimal point in the printed string, so 3 digits
after a decimal point is going to be MILLI units. And the % 1000
ensures that we would never get more than 3 digits there.

> 
> 
>>>> [1]: https://www.scientificamerican.com/article/your-brain-finds-it-easy-to-size-up-four-objects-but-not-five-heres-why/
> 

