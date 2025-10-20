Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC76E2DBF69
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990778; cv=none; b=bgzd4tirMP/MyAaEup3VhN8CrhSQ8H6EaIlLKxQWBIDV+7F9kB0CmewY8PSJiBE0XqGXG60rcTuiFo4GRbubOROOqkWL/8BRxUA1g2swAFigK+UFWV4CIqAHqVXSbMYFtgxQYLVcq4p9ROUq/p/VAOgEnclD0AdFwnA/kZntv08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990778; c=relaxed/simple;
	bh=M14WERNoISUKDIASjp/njJi/I2QySI4GEZLp1C64AYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpGfdk7EyD0U1gbGUBVkSTt6ZVxWkQXXocuVg+2WOrSbrynYhsReLVaN48/n2iacqwc19dqXtBaamcVIROc8K+5b5rEITMSBbyXpqkH0a9ZhVVK2HeWV69THPtsaRsMsnVsVI9y+E4uMmYYqCaBsvtBrTPgr2xdTNq077414zL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J3bvDLf0; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J3bvDLf0"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D05D084684
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1Uzz567HNMO for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 20:06:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E10FC83CCC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E10FC83CCC
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=J3bvDLf0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E10FC83CCC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:06:14 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-430b621ec08so40936895ab.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760990774; x=1761595574; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQkO3IuJguHVhXAT8cFCDHDyIOMJuLnuozCyzaC9Aqs=;
        b=J3bvDLf04deodZOzM4LJGq0tlPWZe+P+YW7sUIFHhRQLyrR8/Jx+0OoRJwwm4bMJHq
         DPQigIyCrzA/kUDzZOz4/kQijsnL/8TtPTYUrfsWXSD4UpctHZXiP/FMreDQe0w+WTGc
         tkA/CZ4Ap3qSX3gNsUUyvDIFBjWBvG0xH3Obo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990774; x=1761595574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQkO3IuJguHVhXAT8cFCDHDyIOMJuLnuozCyzaC9Aqs=;
        b=aZLYtqg32z3o6x1Co/Q1Dj6xx1lYyoInR25k+etQ/V64B64MdfVic0Qh795FNWWOdm
         KP2y3IiioNsFC/XEwl6SOuQBM/qYmc8ImolIRW/MlD/mUR1Ri7s16VqQWdUBYD51BS6R
         ftzJs/ZMBdidx2Pk+7PLZiWi00YZ21Y7fGDxMj1iHCi0+7cSm7YY6rTp88KjZUBXHxMK
         +syRQlIqWFIUQRby74Gw4iZYYvCGmek5WAgeIpTBRMHjpygJVDD+r1Vh7tnfIheYaPLb
         sfPPU5JvII0E6bwfIS/JRlBg5Lg/CRmACSkZ0um/3EFi1YvXSNS6vI4gXtZxc70W8e4V
         rvcw==
X-Forwarded-Encrypted: i=1; AJvYcCX31XVUkUtWUT2FGBKZS5yO1DOi/yPRoCdsl+mG/dHJiPm3g3vIsoXodzfPHIkxJ+FMlOTM2mx1/Lkex5MT74V/88SsHw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwWRlXuyBDra4ARTkN0BN/FDghWfVTdyMn4YiHyxV+rWnEX4liU
	GUctGCZneRgTjwL7/hWBAW/KuZCrtpC4sKS8P16/6I3bVXHuUzeXM7tiVSW1g9iWkFvFtA==
X-Gm-Gg: ASbGnctlIZAYLrmA8X/eYZNW0IQsFk8J0VitOc9eBRAJ3O+X0gUcy/0hqyd3iCwxxH2
	u1kn9JJXWJxEEM7l6jA/1l6UI+sJNYBek9870g9dxL/susukjRgGl3ruhDT5vIoHFNdz3istlCU
	IyszAHksvH/xuZkenEzxW/FtHa7u+7zH7181nBz1D5QJ8LTRqS8jG0lug9q2uxu5Ws2UaAchVx/
	MjGYSkjJBP+6Jf/lEuQqskL9HJD9zRiKqSrphnS4ctU3P4CEH4HZbMsoDoZOePmy2XgIO0K0WB5
	gQxRzt1cZ93J2zni9r5TnC9dS3SHRXvA90eQSpSoKoYtDxx1xY2cY7HoKaOX7BGNWv1quDa3b6G
	QjHNkPF/S6PbCbPuHb8CmwdhnRmF+jIa8JY+l8ZM6l12ye086U232xZA/c5an69foSY01Lm7Vro
	PCuIcUzV7twC37wWxDBdSEk5I=
X-Google-Smtp-Source: AGHT+IEtvgICWGX8/WbpnP2nVW91/2+QpAoQcberNM3IS3yjxMJRNE6F6lyTYjc+DI/ShO5QUQj4jA==
X-Received: by 2002:a05:6e02:4506:20b0:430:c8ad:81d3 with SMTP id e9e14a558f8ab-430c8ad8410mr170043265ab.30.1760990773634;
        Mon, 20 Oct 2025 13:06:13 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d06f9ff0sm33307335ab.3.2025.10.20.13.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:06:12 -0700 (PDT)
Message-ID: <ea12faad-1735-4a49-a70d-d4cac5629042@linuxfoundation.org>
Date: Mon, 20 Oct 2025 14:06:12 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
 <2025101910-dipper-suburb-1755@gregkh>
 <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
 <d072dfe7-e0e9-49f6-89ed-25d194035e3b@gmail.com>
 <02e617bec795d2ef371069f2d5fb954dfb31a450@intel.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <02e617bec795d2ef371069f2d5fb954dfb31a450@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/25 03:50, Jani Nikula wrote:
> On Sun, 19 Oct 2025, Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> wrote:
>> On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 19.10.25 um 16:34 schrieb Greg KH:
>>>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>> Replace kmalloc() with kmalloc_array() to correctly
>>>>> handle array allocations and benefit from built-in overflow checking[1].
>>>>>
>>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>>>
>>>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>>>> ---
>>>>>    drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/
>>>>> repaper.c
>>>>> index 4824f863fdba..290132c24ff9 100644
>>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct
>>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>>        DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>>>              epd->factored_stage_time);
>>>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>>>> +    buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
> 
> Also worth emphasizing that this is wildly wrong for any height that is
> not a multiple of 8.
> 
> And I thought I shot down a similar patch not long ago.
> 
> Is there some tool that suggests doing this? Fix the tool instead
> please.
> 

They are documented in https://docs.kernel.org/process/deprecated.html
Mu understanding is that this document lists deprecates APIs so people
don't keep adding new ones.

I didn't get the impression that we are supposed to go delete them from
the kernel and cause a churn.

thanks,
-- Shuah
