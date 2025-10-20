Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40EA2DC353
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991103; cv=none; b=cHpTt3NsNy7NN9EF4+FTJGcWqeaXPjkAjBOO2ctgy4f+KDqHpkMc+wKhhNnMdQR4a/9LXXHVcwSChAQbuiVjaoCVn6vCJUjjgaqqP2p1AaxwIki49RvIEUzpzogiVURrX9oHw0lm/eBQkNRYyXlse+8JT5ZrKnjYmxGHv88pk8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991103; c=relaxed/simple;
	bh=V6ULhW8H38NcYr33oKX3sVtwABaGZ1jZoxnobG/0Uto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKebMD1MbitirGirO+TOS/I9NkCgnLxV9BZTN6DD6oRcm/pL0Lu4Qqb/0KfdTTc5K5KX9/vAEKQoHz0YT/39H0qamV8/XZJNj1SXSbBVC6Cdxz9nsl0K8wmI8K4vM22QcFAhZmScv1saVZWbsJ+4V9Qy/GLnf5qeCPBbV7pSDRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jICVMbJs; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jICVMbJs"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55DEE84734
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ik20TnIXryZj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 20:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2553C84733
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2553C84733
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jICVMbJs
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2553C84733
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:11:39 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b47a5a17303so77084166b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 13:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760991098; x=1761595898; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4pYR5fc+13GPBMaNnLf78tmb9Ja2klUsIxWce12udek=;
        b=jICVMbJsNbkWKSZsiHcy03NM32dA94xYXQ7zgsrm4MkBwKZR7gnUBceaeTvtqRxRQO
         QvVPCBvurR6FAfo3UnIsQOKDvuZTpa/dplWtLPbedv1ZpCa+yMK3OWbQAzfOLBDct1gy
         ZOe4Li/GYDNCX63JnnmomSjYSvJNC0WerQ97+3D7+5M8kA1PIFCaMFcu5+v5cvL2MFC/
         uquWG53vnOUnH1RkUb2yHN7zJfEVZ91X/Jb/Chj59ZFOvKEfgToV3O5RogKHzw0LMRwB
         Zt1NQenIDFom4s7iJid+smSFXvCNG7yRLvlOkL2P8rrptlVvlJqYKKcpqb5JuEowyLws
         aAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991098; x=1761595898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pYR5fc+13GPBMaNnLf78tmb9Ja2klUsIxWce12udek=;
        b=VkFAJleFiMIdh/UmNtKgJKSVE6DzaMr2eOYROQ8PC/4RhnJ0OMEHgCxYJl+6NO/9YS
         XFPmsXav+zYZyUA7HP+hKSSLMvYSJWrEugVTI3GOrr6p1qh4N7Q+fd+moWYr5mRt5L9Z
         r2OaYMjYTNqpJ/E30sL84BWo2Ol+nx2XVLx3GprlM98pemE2eJ1ymX7U/Blk786niSqV
         B7NJuYfDlH2X2MiD0FvboIX1/INatbRlkqmkJ0mOzWh3vTCeCi3kPa4QZCkq7WWXY4i2
         8GJX3rPo8nrrMREYMn8+woqkeBqHapWCH+GJVMaSUwskw5ODAImTaknoZGqK8rOjnzMR
         UWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIQpEoRl/9yx/DmiQSTcI27smkKwXESXT/b6y5NlrwjS629A7m3uMN4rQcXx98K8kQG2RPYgueLj35UaCuBf1yYhfqog==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwWa4Mlm1zLUOpOWbV8YwCjdjNyaT223Du93ozvipGle3qEIxdV
	8PC5voqqQlHBcgtyJr10P7BLNcVWMF8fsrb3yL3rkQB1NEwTXmwixy+X
X-Gm-Gg: ASbGncuGO3rxYKfLbMe8rN51EPc1G/ho8IDdoCvBxOk7DFQTdgNwlvg15vad43Ufmes
	d3QSx7ahhZYXJspW0cC5a56Oj1xBOFGtdSR/N+5HbaaDbNoR+/EJpucjhE9uOJEAH9Evlas80IB
	PXYen9XsEBH+MD9JCSXqZFqIPT41pfFb0xSgKviAnXtUeFX6aI40PStLGbrQAstLgQxlxzw9CRz
	EIpEgUl54z78s4r/MuGKj3RBn5tP8qLs1CuhPqefIS+qeKXCNRihFZCgtOiJBovj1XCtKGCQqne
	Q832C/dpL6WFqeDXuEah6EerqS8k572VtqIS4XaXPx4kjoIFaHNVD7JLuBz1qJjcCfhRZSvrC0O
	DBmxTqJaGf9wkWYnwiDGJGUW3PcAD7UtWThE02pOP6pai3ioZMt0W1sodxOd3EkNbsGDCEmccsV
	hwxHH+NxZ6Xwc+5OYoB37N83wU34mV
X-Google-Smtp-Source: AGHT+IGfP+vFkv8zioVQynwazhbvBh6MaoC6q2IrSLhmWZgtPgsGhhqQc2LuymVoNGeawx228yiFQQ==
X-Received: by 2002:a17:907:72cb:b0:b3e:c7d5:4cb9 with SMTP id a640c23a62f3a-b6c7758d3fdmr67446066b.5.1760991097698;
        Mon, 20 Oct 2025 13:11:37 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb725f3fsm873186966b.68.2025.10.20.13.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:11:37 -0700 (PDT)
Message-ID: <b0b1c2e9-c367-4e9c-b931-d3e1b0ba7f5b@gmail.com>
Date: Mon, 20 Oct 2025 22:11:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Shuah Khan <skhan@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
 <2025101910-dipper-suburb-1755@gregkh>
 <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
 <d072dfe7-e0e9-49f6-89ed-25d194035e3b@gmail.com>
 <02e617bec795d2ef371069f2d5fb954dfb31a450@intel.com>
 <ea12faad-1735-4a49-a70d-d4cac5629042@linuxfoundation.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <ea12faad-1735-4a49-a70d-d4cac5629042@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/25 9:06 PM, Shuah Khan wrote:
> On 10/20/25 03:50, Jani Nikula wrote:
>> On Sun, 19 Oct 2025, Mehdi Ben Hadj Khelifa 
>> <mehdi.benhadjkhelifa@gmail.com> wrote:
>>> On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 19.10.25 um 16:34 schrieb Greg KH:
>>>>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa 
>>>>> wrote:
>>>>>> Replace kmalloc() with kmalloc_array() to correctly
>>>>>> handle array allocations and benefit from built-in overflow 
>>>>>> checking[1].
>>>>>>
>>>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>>>>
>>>>>> Signed-off-by: Mehdi Ben Hadj Khelifa 
>>>>>> <mehdi.benhadjkhelifa@gmail.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/
>>>>>> repaper.c
>>>>>> index 4824f863fdba..290132c24ff9 100644
>>>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct
>>>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>>>        DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>>>>              epd->factored_stage_time);
>>>>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>>>>> +    buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
>>
>> Also worth emphasizing that this is wildly wrong for any height that is
>> not a multiple of 8.
>>
>> And I thought I shot down a similar patch not long ago.
>>
>> Is there some tool that suggests doing this? Fix the tool instead
>> please.
>>
> 
> They are documented in https://docs.kernel.org/process/deprecated.html
> Mu understanding is that this document lists deprecates APIs so people
> don't keep adding new ones.
> 
> I didn't get the impression that we are supposed to go delete them from
> the kernel and cause a churn.
> 
I have sent an appropriate v2 specifically to suit the case that we have 
here. But the document[1] specifically quotes the following:"
Dynamic size calculations (especially multiplication) should not be 
performed in memory allocator (or similar) function arguments due to the 
risk of them overflowing. This could lead to values wrapping around and 
a smaller allocation being made than the caller was expecting. Using 
those allocations could lead to linear overflows of heap memory and 
other misbehaviors. (One exception to this is literal values where the 
compiler can warn if they might overflow. However, the preferred way in 
these cases is to refactor the code as suggested below to avoid the 
open-coded arithmetic.)"
Specifically mentionned the refactor of the code base in such cases 
which is why i'm doing the patches in the first place.Also i'm trying 
the best to send patches related to the issue where such issues of 
overflow are present or to be consistent with the same API used within 
the same subsystem.
[1]:https://docs.kernel.org/process/deprecated.html

Best Regards,
Mehdi Ben Hadj Khelifa> thanks,
> -- Shuah

