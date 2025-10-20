Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC6D2DAFD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 21:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994408; cv=none; b=sQQouZqZHzxvS24neq7CiwZdjMwwVm1atuwOrqaWX42XK5XIVBM3C+8+d6FARISzNd/N73Y5KX82CqkRWy01MEYrdKRqlYzzOhDXiyEAc7idEJbfhmO/9dSR8IV5O2jnx6x6oTriVGsTJ2rKyG+zO8hjzz5gRCc2TBD6gfmlyW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994408; c=relaxed/simple;
	bh=jKHNAcHa8OjYTcahk/Cvw5CM9egvf6escUcxMCMyzmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyWOkRbN6gJj3CT6wn/vMOdzD3Jae9k9bmNBs7GDwQeNf6RIIxVTABDvQv2Fn1DnZlUe/adoW+evdUTGw6eFkpUrq7J/vj4Y/e6hr0APe3Wp4ttNiWyTNlH/OoiECYQkXERnSYQozxWg0bN9b7MYu1bOTJfM1z9X9/l0HTrITmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bg5nKXQD; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bg5nKXQD"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 246BF4037A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 21:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hffqbLHkgs4R for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 21:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6694C400F1
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6694C400F1
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bg5nKXQD
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6694C400F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 21:06:45 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b40884aeaf4so99548066b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760994403; x=1761599203; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhY4ES2p36Sez9d7ccqmI9W2N8u8/97h46vN/q1eK6M=;
        b=Bg5nKXQDBym2ZO5UZ7iJ80y+v3rEL9riStND5nY0hQizMPi56E6dYnG8Zf1+t2PW1d
         +XAPtfyBN6uoaEKLPaR3zxdmuTu2/YFKOfsIMNf9zprmQ5K6NfLTYf4khjl4GUXyqix5
         PsOEa1N/sb/W1C1i39VXt20QmqqMzVakc1QZcGGXQuhf5V+qFpcG1VRyhLlIrJ22XvYg
         CREZIAGFu+z9Hp959HaM24VVFP5itxfG6fVQ1FeTQg/3M0Nw/BZyl3YX4Psv+qmg0sJ/
         WrVGVf8n/XIzOAYPg2Oj14t7NePZ3xGg8ATkAoJO86UizzbA5Ow1aH5PMTG46zJecE9X
         PE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760994403; x=1761599203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhY4ES2p36Sez9d7ccqmI9W2N8u8/97h46vN/q1eK6M=;
        b=vHx9kc5KSlST/WINiARG7KP5DvwTaKNPWZVAs6xneIgkmY+RYqE30bJ7MUWxaEx+gc
         /XYUfutpnflv/Ghd8hr1aoNZOAuHTdk7k9f+V5LaZexXLMOe21QJy2g4Ueposb0pjdWg
         jlu58+0PAU+77EJfVsURE69TiM1Oev0Oi8Qvj9RJLwz4V4zmDKhKC39cVZgCmxT/knX4
         gwk/aETR7awJAhWsjlmkxaUSfYyQAidTT+ajve1lDZRlboidcHi9ZQ6wLQBJYDL49QBi
         ikn1QLlzYnU1eRCZkO4Vr4QkOrmWHePKcMqKwt6kgZhkehX63/9NJiWw8WLp5EKIcbdm
         YL4A==
X-Forwarded-Encrypted: i=1; AJvYcCVf0HSrdjqZ8nu2gNJSn+PhsnNoy/O23OAofsvTdTeLT0RFygIfEbQg6x+yqwgBNlOXPNYKET6VyzKpsOoBhkPmcWSFvw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxbn+gJ5x33QrMwzd/QTvRF4oZiD4fM7fS9IRq/xWN2GpnND0WC
	S+HqVtx2tqXoZUehkXy7gXFcpyNLnWQUs3VbJbQ7uVVsYaprLY3CiIhI
X-Gm-Gg: ASbGncvjCGOEvBom7sRvN9lYqTiW/yl/y3ev6Btxl8H7vUxai70+chAt+ZE6aYjkPI3
	FngfR8F40Y4fbs7e7HWVEaTW1ece1pAeFfVBYxlzUYB2lLUDQYvPJFIrOAQgqanNrREFoNnhPo4
	eJG40hoF0Lef++yiMkVSNgnPX9+14MvFhMeU+lWrgYbKnvXq8M+m2g14cNriUdxaqTzHqTlksEi
	en/AN4onpx3xFM3zx4Egmk7QTMTfwCjJktNfoqk+6WQ3EjMEw5lDTnLlM5fsTEknKmuJCN19P1h
	mAJxEjyj8XGee8zGG9Sj/RVmiNtehI6GYgiF3NIvtaSdZKD6Hitmnh/vvp4LyBkncvIvNVUwBGF
	1RKH5Qb6NOnEuv5QAwDo2hkM5fHsvepRHkQFTL2+GO4VW2urK5OOKMjxQNk8Dq2FIl5r1Yp64LN
	CyO38LPSnlDcVNalkafvazTmJOAwQu
X-Google-Smtp-Source: AGHT+IHZVqYKS2iFYtOE/tSHz7RN3sZh1WOSb+4OP97fjXIur8QI9sPPBXL8/BZMXg3DfJFX6AmixQ==
X-Received: by 2002:a17:907:94c9:b0:b04:53be:7652 with SMTP id a640c23a62f3a-b6475706f75mr883556366b.8.1760994403086;
        Mon, 20 Oct 2025 14:06:43 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb526175sm894178166b.56.2025.10.20.14.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 14:06:42 -0700 (PDT)
Message-ID: <8dc12a18-58ee-4df6-a9f3-12d8c05a0954@gmail.com>
Date: Mon, 20 Oct 2025 23:06:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
To: Shuah Khan <skhan@linuxfoundation.org>, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
 <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
 <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
 <3f523293-8a8d-4136-b4bc-4ad0d4a50c59@linuxfoundation.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <3f523293-8a8d-4136-b4bc-4ad0d4a50c59@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 9:56 PM, Shuah Khan wrote:
> On 10/20/25 15:38, Mehdi Ben Hadj Khelifa wrote:
>> On 10/20/25 9:08 PM, Shuah Khan wrote:
>>> On 10/19/25 08:58, Mehdi Ben Hadj Khelifa wrote:
>>>> Replace kmalloc() with kmalloc_array() in several places to correctly
>>>> handle array allocations and benefit from built-in overflow checking.
>>>> This prevents potential integer overflows[1] when computing allocation
>>>> sizes from width, height, pitch, or page values.
>>>>
>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>
>>> Mu understanding is that this document lists deprecates APIs so people
>>> don't keep adding new ones.
>>>
>>> I didn't get the impression that we are supposed to go delete them from
>>> the kernel and cause a churn.
>>>
>> the document[1] specifically quotes the following:"
>> Dynamic size calculations (especially multiplication) should not be 
>> performed in memory allocator (or similar) function arguments due to 
>> the risk of them overflowing. This could lead to values wrapping 
>> around and a smaller allocation being made than the caller was 
>> expecting. Using those allocations could lead to linear overflows of 
>> heap memory and other misbehaviors. (One exception to this is literal 
>> values where the compiler can warn if they might overflow. However, 
>> the preferred way in these cases is to refactor the code as suggested 
>> below to avoid the open-coded arithmetic.)"
>> Specifically mentionned the refactor of the code base in such cases 
>> which is why i'm doing the patches in the first place.Also i'm trying 
>> the best to send patches related to the issue where such issues of 
>> overflow are present or to be consistent with the same API used within 
>> the same subsystem.
>> [1]:https://docs.kernel.org/process/deprecated.html> How are you 
>> testing these changes - do you have this hardware?
>>>
>>>>
>> I have a raspberrypi zero 2 wh that i'm using in combination with the 
>> ssd1306 OLED panel via I2C to test it's rendering and it's working 
>> properly by using modetest and seeing no regressions or warnings in 
>> dmesg.
>>
> 
> Send v2 with all these details and why this change is needed
> in the first place.
> 
Okay, I will do that as soon as possible.> When and how does this 
potential problem trigger? Is this a
> theoretical or does this happen in this code path and how?
> Next time include all of these details people understand the
> problem better.
> 
We'll do in the next iteration.Thanks

BR,
Mehdi> thanks,
> -- Shuah
> 

