Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487428000C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033335; cv=none; b=anN+riPxliCL9DH7BQrABjlPOFYcEINfeOki8mXuUePZoyOI2/PEhAgXE0+x9Sl/MJrdMTG5xW4AdPPhLb3NqQ1b03sGTeT1bX0dil4fcH3qevYii4/1By19UJDzj7IZ+WVR2C3tYqqwPhetJpZFQWzyt9CEjvj4Mr6LV3okKMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033335; c=relaxed/simple;
	bh=CGRUDgLWjS0TmZAu53/lKB2uFT14B1wVJwssuRZuUZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ng5M6ocASzjh3UXXn0sFwFcJZRXlLYABf8IFGqHhozy10yM+wBPzEdBdIdR7yXksjiz9pQMlD047SurV/EQtIZ9QBvYlvYrStJy2ALuZm7PZeMqrmH79M5wrEzXAkOMHH+baA5tv/ENIjltgHbSfQ3AAQIIAo/ulRKO9MU+8AxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiwIQ+38; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiwIQ+38"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4278180DDF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYkfK0aoh7AX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 07:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 518A580DD4
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 518A580DD4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SiwIQ+38
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 518A580DD4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:55:33 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3c76f3703cso90959066b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 00:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761033331; x=1761638131; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UDT2YCTKVhWQzLZXmbHmhx5CBJhVxoIzObMnL9LgsZQ=;
        b=SiwIQ+38iH9IG2JQLo6NcyO0UdifvouvFZgqyCKHr+5gExW3FjTlFei4DhOVcsAGbf
         homZbUKyZzvsCHjOHgF39zMgKwjYes76PpBz51ZVyS/Ku9OevMnD37xloQd3QflqgHxw
         MIOVGVVvdxA6V3jnkh5i78wwo9bKiTSNoSXuwt8/f4gZZCr6B9IRlzB7idHlz+F3WAsN
         pRkG/w/bIkSjHs3z8scYDRj5YQjMX7zQrvNleHw26fsN0zOCwJJJkadwGVFJ2aKcu95M
         XHU4AOa3RpSNwpYAVvP3C8E0Y1InIQUVwVlNr2ysaC+lwMqjWEE/hgBGhlH53hBa5TUK
         zaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033331; x=1761638131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UDT2YCTKVhWQzLZXmbHmhx5CBJhVxoIzObMnL9LgsZQ=;
        b=rEkccD/ZRCrtckGTbPoI94nxGHBPiHBXNwS3vTVAAhRs1SyA5GvxUQx+rv4BF3O1dH
         spoCCe15i4f8Gin7cCMFGJo513H4Ec/tbxtozUp7X6UQtetlokKve1IzHLWCTCCzXqLS
         MpUYh3ES8RSldWNwteRLgEpv8IhQQ+ERcYmJsvsgY39Zcw3Ky6kivd1NWYxgE9WmwxXT
         sfgPwL/gIWrSsX5052c2932vJC8le2Yy6PAg1bMR+OF99anKgQ97K+v0nME1ebGC8EYX
         oygHlDRCI1UzYpkILJAaNMs8ddgBPrZDs2BfYbD9BH2eTXKCHlBk0NjJ6+qbHbwNWBtS
         awOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvh1EbgKVZnbPyApX3LC9P9pWx84HyR9ITTzwasuMLeYuDtdyT96E0kZFldaqhqLUuiya0zRmk4ZeIPnf81EzvmH31iA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyZMC7Fw3zm+eTXkAFj1SjaXuHPbWxHYAFxENCZftOhjIyXr6wm
	UDAfu29qd7JLU9h+DTi6TigCp5i5ZpLZj5s/jrHsUcsoJcAqcayGwq8Q
X-Gm-Gg: ASbGncujVKBlvnJuK7gH1CT0KQC9dva2X+YvO4JeCDgbam0n80Sg0n2CtaAi8hh5OV3
	4OhcTjM6p0hOZVwoyRYGygxBLR2r1tYux74O5oeWM+Oj204rnnLu2El7iOG0CaEBXWF/2LcuW5r
	JUl85rKgz3FOqaAT+Ct2K7bg+B22a9KTiuMt6FF1NATMw+JCKG80cO6bmkR3Mlj6vpQYSXa0Fk+
	hMUeUtwSCEHh6Ie45ydBocCZ+47CkcYe6iUsn7Fv3dwDErmlH1noVDS3zp0IOKVbC110t159UMi
	bDKH36aOIPLII+oFpLgKRYztcLOB4ioB1bV8vYL5TYDpcpKLT1XntCXxxjEwPvkEbDOp+HRszlm
	dKpaKFnq5adLKs+FQ0mpC6ie0LH1VlZtxlGIMQTYQsd1TmoG1azK/dsCeKiR6Ua/RS1QiSnElHe
	0osJbYMNA/fVLALZd/Yg==
X-Google-Smtp-Source: AGHT+IFXWmYLO1Aa5Kw3gLn2Us5/ulNstPgt+twYj6ayh+e2XP/zbYFG3ArVGNoGv4PQDRU/BmkoIg==
X-Received: by 2002:a05:6402:1d4f:b0:634:4e0:8377 with SMTP id 4fb4d7f45d1cf-63d16aedfe1mr1304424a12.2.1761033331200;
        Tue, 21 Oct 2025 00:55:31 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4945f1ffsm8869668a12.31.2025.10.21.00.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:55:30 -0700 (PDT)
Message-ID: <71bb9475-07ba-48a9-9fa4-76e18a310b3a@gmail.com>
Date: Tue, 21 Oct 2025 09:55:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
To: Javier Martinez Canillas <javierm@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
 <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
 <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
 <3f523293-8a8d-4136-b4bc-4ad0d4a50c59@linuxfoundation.org>
 <8dc12a18-58ee-4df6-a9f3-12d8c05a0954@gmail.com>
 <878qh4ae1i.fsf@ocarina.mail-host-address-is-not-set>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <878qh4ae1i.fsf@ocarina.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/25 8:51 AM, Javier Martinez Canillas wrote:
> Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> writes:
> 
> Hello Mehdi,
> 
>> On 10/20/25 9:56 PM, Shuah Khan wrote:
> 
> [...]
> 
>>>> I have a raspberrypi zero 2 wh that i'm using in combination with the
>>>> ssd1306 OLED panel via I2C to test it's rendering and it's working
>>>> properly by using modetest and seeing no regressions or warnings in
>>>> dmesg.
>>>>
>>>
>>> Send v2 with all these details and why this change is needed
>>> in the first place.
>>>
>> Okay, I will do that as soon as possible.> When and how does this
>> potential problem trigger? Is this a
>>> theoretical or does this happen in this code path and how?
>>> Next time include all of these details people understand the
>>> problem better.
>>>
>> We'll do in the next iteration.Thanks
>>
> 
> A similar patch was posted by another developer a couple of weeks
> ago and is now queued already in the drm-misc-next branch:
> 
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=940dd88c5f5bdb1f3e19873a856a677ebada63a9
> 
Hello javier,

Thanks for the heads up. I will abort working on the patch.

Best Regards,
Mehdi Ben Hadj Khelifa
