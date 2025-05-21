Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30033155A25
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840338; cv=none; b=HuiQrjjEmbysvgVQI6yo1y0stvI0IO7mfxfiSXuKZqt/6wwesa5JJh/M0/tHDZLzqVsuF4vfv46FOvt+IhKD3B9YmPYP6Qi3zC0KSWbOrsK4pYsgqBrIWIzSOT7UvLyKxxMOf5GkempdLwUG6rRr4ZEBB44QLmoThiRDkIVcD6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840338; c=relaxed/simple;
	bh=lBxYD/sxdLohBQL8cWaUPlf5GpBoIKjD4XqJjlAAIHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8QhN2Z+AtJxKIIwX21R+9czU2G/jg2J5PvBT9mLJrPesaAfneNZWchnaJKOHd3/BrLZ2VnoSO0Z9Z4Opmpuzhmd2TWGTjNyEJ7witJdOdOA/WptruvwKgFnHYzEp/hD18QlaOJnVPdAthKgLuR/lF2YhkXCbNI+bNB4YoQ09Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kViYhNg9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kViYhNg9"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-551f0072119so4292507e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747840334; x=1748445134; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78yUaku+TH3kluaZNv1nUHa1ojNV1Bp7GzsWKhmIOkM=;
        b=kViYhNg9IsR7uaykJ5BzEtIXSRocdroLF0bgA4QGWj+eT+sSvnWD3+UlIn4smzHlPL
         xoM+v9JEE4PM7CMDzt+G4VYq7XyL0sJT8TAmThzZ7z9FTJZOxdY6zOoL3L6T4ULdnCNR
         26beaDjvODY1/PoMQUwnGl7Z7lpEWOhsCaE/cxS+J6i5seeZBLJb7WyEoFG6g9Dnjl95
         OUm5Pt3Sp3zdnZrTA4P2/Xk4roKMCK4fRoheyH/6xl3e4mS9fABd0QEmNE4hnsiVfDUz
         ghUvMmBPbzACC/KbSFg4MKz6xcJd9IHn01/InWVa8dE3DjbHxaPE8owWzu71Q1k9P1WP
         lMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747840334; x=1748445134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78yUaku+TH3kluaZNv1nUHa1ojNV1Bp7GzsWKhmIOkM=;
        b=LrjLYwAjHvhDMQBAUsbQD25EWm+bDnwlRXpgPMj8lhcicvIIfwMOgMJXXI73/6c2DC
         TbFX4D5GmNfpsSNU5kCVAoSI3+4N+0PCipavH/YB2ni6HTY/ozeivIJFrJrYxSdj9yRK
         JQDaVbVev6Eq+gPUwU5NpbCxf/Tz6O3N8zrIvN+rJdtqRGhjj4SyBJEJ2cAjC39PpOcr
         SckfUtIF+Huv6Xgnj2AIdt2fe3lcqYdu2IRUxTEMbHNcssGoNYXuRrXhEI02r1BeaVTw
         Ru/MtAI94OW84zpdiqyxpamvv2uyC/oG52vX691x1t4qKrFzUNnTYkEpIewwDt2ZOquT
         wxZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtUORMCL5dQ0/BNF4atQCi/+RICkQ+NfO+x4vo0xoJ/vQHt7Ns6qcvPC/DVILWG70PbfYl8ritV25zp3VYR3NsJNejxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3BZKIb/Qe3QRJp4Q4jAdQXyKCGl3l8oN71qajTwdm2B8q9b8M
	uScrK75YlH4bsDJ+TRyVEB29w8iiHmppdw+F3O/DcxQ6WNSa0AS0FK8I
X-Gm-Gg: ASbGncvQOPaAlDECR/xijNw0qusBiX0vqODNdB1hCKI0K3mCf9OPcD9A2sRMwMZvRD2
	16gZKdTD2grvT1sMO9w/XNaEAzAQEKywFHui78TL9TyVW2qRPBXaiM1QF7meCrLpSarqt8IWZxV
	tuETKoDK//ZVVa/DxaCKSa19MmJweMU5UitxC3UqgdCVV+YFl2se8gzuBIaqd3Y0DeHGX0TxRwW
	M+GDYoz9rplozJDjra9Q2R2ckIXOIZiIMQThj+BgXA/VVdAzShNK8j9F6/e47F58DqE5/+UgqYq
	Jy4HGQ4YoMeEKlOZJ+8QTjBUZ27lcvHtbMQob9Pds1m9TXSDmhlMhSFqHewjBygb8Vzc70esATC
	4QJ3oJtJFOYNcWAxJI0Tiaq6E6zpGC2ODqx+JF7Bvf2sTmGW6Omtjot3LyOASkdSLmdaZmSMGZ2
	XiSuIm888AETXB
X-Google-Smtp-Source: AGHT+IE9nd0GLoOgLFJQSLE1qR86a3SC8JADuKGwq7KtdwEH8Z7iFSIf3vIA5YyerQWwhQK4eZ1fzQ==
X-Received: by 2002:a05:6512:2251:b0:54f:bc96:72dc with SMTP id 2adb3069b0e04-550e752d995mr7692943e87.26.1747840333818;
        Wed, 21 May 2025 08:12:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:53:1500:e8f4:97c2:d311:5b15? (2001-14ba-53-1500-e8f4-97c2-d311-5b15.rev.dnainternet.fi. [2001:14ba:53:1500:e8f4:97c2:d311:5b15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7018123sm2871400e87.140.2025.05.21.08.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:12:13 -0700 (PDT)
Message-ID: <2099f0bf-fee7-4037-9e49-2b4bd8e507c8@gmail.com>
Date: Wed, 21 May 2025 18:12:11 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] docs: Improve grammar, formatting in Video4Linux
To: Jonathan Corbet <corbet@lwn.net>, mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, hljunggr@cisco.com,
 dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-2-hannelotta@gmail.com>
 <871psml4t7.fsf@trenco.lwn.net>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <871psml4t7.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 5/18/25 11:08, Jonathan Corbet wrote:
> Thanks for working to improve our documentation!
> 
> Hanne-Lotta Mäenpää <hannelotta@gmail.com> writes:
> 
>> Fix typos, punctuation and improve grammar and formatting
>> in documentation for Video4Linux (V4L).
>>
>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
>> ---
>>   .../userspace-api/media/v4l/biblio.rst        |  8 ++---
>>   .../media/v4l/dev-sliced-vbi.rst              |  4 +--
>>   .../media/v4l/ext-ctrls-fm-rx.rst             | 15 ++++------
>>   .../media/v4l/ext-ctrls-fm-tx.rst             | 29 +++++++------------
>>   .../media/v4l/pixfmt-srggb12p.rst             |  4 +--
>>   .../media/v4l/pixfmt-srggb14p.rst             |  2 +-
>>   6 files changed, 25 insertions(+), 37 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
>> index 35674eeae20d..c3f7c466e287 100644
>> --- a/Documentation/userspace-api/media/v4l/biblio.rst
>> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
>> @@ -53,7 +53,7 @@ ISO 13818-1
>>   
>>   :title:     ITU-T Rec. H.222.0 | ISO/IEC 13818-1 "Information technology --- Generic coding of moving pictures and associated audio information: Systems"
>>   
>> -:author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
>> +:author:    International Telecommunication Union (http://www.itu.ch), International Organization for Standardization (http://www.iso.ch)
> 
> Please do not "fix" the use of either British or American spellings;
> both are explicitly just fine for kernel docs.

Okay, good to know. The ISO name is spelled in two different ways on 
this documentation page:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/biblio.html

Making them consistent with the official English spelling, which is 
mentioned on ISO's website, was my reason to change this.

At any rate, I can leave this change out of the patch.

> 
>>   .. _mpeg2part2:
>>   
>> @@ -63,7 +63,7 @@ ISO 13818-2
>>   
>>   :title:     ITU-T Rec. H.262 | ISO/IEC 13818-2 "Information technology --- Generic coding of moving pictures and associated audio information: Video"
>>   
>> -:author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
>> +:author:    International Telecommunication Union (http://www.itu.ch), International Organization for Standardization (http://www.iso.ch)
>>   
>>   .. _itu470:
>>   
>> @@ -131,7 +131,7 @@ ITU H.265/HEVC
>>   
>>   :title:     ITU-T Rec. H.265 | ISO/IEC 23008-2 "High Efficiency Video Coding"
>>   
>> -:author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
>> +:author:    International Telecommunication Union (http://www.itu.ch), International Organization for Standardization (http://www.iso.ch)
>>   
>>   .. _jfif:
>>   
>> @@ -150,7 +150,7 @@ ITU-T.81
>>   ========
>>   
>>   
>> -:title:     ITU-T Recommendation T.81 "Information Technology --- Digital Compression and Coding of Continous-Tone Still Images --- Requirements and Guidelines"
>> +:title:     ITU-T Recommendation T.81 "Information Technology --- Digital Compression and Coding of Continuous-Tone Still Images --- Requirements and Guidelines"
>>   
>>   :author:    International Telecommunication Union (http://www.itu.int)
>>   
>> diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
>> index 42cdb0a9f786..96e0e85a822c 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
>> @@ -48,7 +48,7 @@ capabilities, and they may support :ref:`control` ioctls.
>>   The :ref:`video standard <standard>` ioctls provide information vital
>>   to program a sliced VBI device, therefore must be supported.
>>   
>> -.. _sliced-vbi-format-negotitation:
>> +.. _sliced-vbi-format-negotiation:
>>   
>>   Sliced VBI Format Negotiation
>>   =============================
>> @@ -377,7 +377,7 @@ Sliced VBI Data in MPEG Streams
>>   
>>   If a device can produce an MPEG output stream, it may be capable of
>>   providing
>> -:ref:`negotiated sliced VBI services <sliced-vbi-format-negotitation>`
>> +:ref:`negotiated sliced VBI services <sliced-vbi-format-negotiation>`
>>   as data embedded in the MPEG stream. Users or applications control this
>>   sliced VBI data insertion with the
>>   :ref:`V4L2_CID_MPEG_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
>> index b6cfc0e823d2..565157709911 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
>> @@ -35,7 +35,7 @@ FM_RX Control IDs
>>       description of the correct character encoding for Programme Service
>>       name strings. Also from RDS specification, PS is usually a single
>>       eight character text. However, it is also possible to find receivers
>> -    which can scroll strings sized as 8 x N characters. So, this control
>> +    which can scroll strings sized as 8 x N characters. Therefore this control
> 
> This kind of change just seems like churn that isn't really improving
> the content?

The content is good already. Here, it is a bit more formal to use the 
word therefore, since this is technical documentation, and the word so
is considered more appropriate for informal contexts.

I can leave this change out of the patch series.

> 
>>       must be configured with steps of 8 characters. The result is it must
>>       always contain a string with size multiple of 8.
>>   
>> @@ -49,7 +49,7 @@ FM_RX Control IDs
>>       Radio Text strings depends on which RDS Block is being used to
>>       transmit it, either 32 (2A block) or 64 (2B block). However, it is
>>       also possible to find receivers which can scroll strings sized as 32
>> -    x N or 64 x N characters. So, this control must be configured with
>> +    x N or 64 x N characters. Therefore this control must be configured with
>>       steps of 32 or 64 characters. The result is it must always contain a
>>       string with size multiple of 32 or 64.
>>   
>> @@ -64,17 +64,12 @@ FM_RX Control IDs
>>       broadcasts speech. If the transmitter doesn't make this distinction,
>>       then it will be set.
>>   
>> -``V4L2_CID_TUNE_DEEMPHASIS``
>> -    (enum)
>> -
>> -enum v4l2_deemphasis -
>> +``V4L2_CID_TUNE_DEEMPHASIS (enum)``
>>       Configures the de-emphasis value for reception. A de-emphasis filter
>>       is applied to the broadcast to accentuate the high audio
>>       frequencies. Depending on the region, a time constant of either 50
>> -    or 75 useconds is used. The enum v4l2_deemphasis defines possible
>> -    values for de-emphasis. Here they are:
>> -
>> -
>> +    or 75 microseconds is used. The enum v4l2_deemphasis defines possible
>> +    values for de-emphasis. They are:
>>   
>>   .. flat-table::
>>       :header-rows:  0
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
>> index 04c997c9a4c3..aa509039bd27 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
>> @@ -41,7 +41,7 @@ FM_TX Control IDs
>>       description of the correct character encoding for Programme Service
>>       name strings. Also from RDS specification, PS is usually a single
>>       eight character text. However, it is also possible to find receivers
>> -    which can scroll strings sized as 8 x N characters. So, this control
>> +    which can scroll strings sized as 8 x N characters. Therefore this control
>>       must be configured with steps of 8 characters. The result is it must
>>       always contain a string with size multiple of 8.
>>   
>> @@ -55,7 +55,7 @@ FM_TX Control IDs
>>       E of :ref:`iec62106`. The length of Radio Text strings depends on
>>       which RDS Block is being used to transmit it, either 32 (2A block)
>>       or 64 (2B block). However, it is also possible to find receivers
>> -    which can scroll strings sized as 32 x N or 64 x N characters. So,
>> +    which can scroll strings sized as 32 x N or 64 x N characters. Therefore
>>       this control must be configured with steps of 32 or 64 characters.
>>       The result is it must always contain a string with size multiple of
>>       32 or 64.
>> @@ -94,8 +94,8 @@ FM_TX Control IDs
>>   
>>   ``V4L2_CID_RDS_TX_ALT_FREQS (__u32 array)``
>>       The alternate frequencies in kHz units. The RDS standard allows for
>> -    up to 25 frequencies to be defined. Drivers may support fewer
>> -    frequencies so check the array size.
>> +    up to 25 frequencies to be defined. Because drivers may support fewer
>> +    frequencies, check the array size.
> 
> Here too, I'm not sure I see the value in this kind of change.

Similar reason here regarding formal wording.

Again, I can send in a version 2 without this change.

> 
> Thanks,
> 
> jon

Thank you for reviewing so quickly!

Best regards,

Hanne-Lotta Mäenpää

