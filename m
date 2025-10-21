Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17F53164AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761036266; cv=none; b=rSrsVv5L7Rdou1kA1qRLnAduGA8nt3ufckKwT9KpZqtNET8GSHEOx2jz2eOvZ/cMsTdOXRzl8grmeBWRhWcDS4TylA+v6fqnLq3TQxPrtEGrxLultt7v+4mXdBK6QRu7zYt/wtrxM24tbWNG1IRbHoIuZ/EoTB28sroX78lgklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761036266; c=relaxed/simple;
	bh=J/k1wLVOkD3GUGrnVtkGjnikZd3EasoKzlYkt6QQfHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6ZdDQWCiNThdZJbR5p4KhMK80DhR1wbcEUI3G/BSHbXe33vJGHGhRI90HD9q4RXdHcjGQtcrQ3FE5meN1UXrHIgJb95nEA4AIZqEAPMF+l6Sb33SMunN3ROHUFZvpGSnWxAANO0qdvCFCBYyksh3s66aDrKs/83NL6laRrY4kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmpSvRCm; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmpSvRCm"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F34B40337
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 08:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awzWTQCi1nNB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 08:44:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8042B40322
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8042B40322
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RmpSvRCm
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8042B40322
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 08:44:23 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b5dfff01511so142087666b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761036261; x=1761641061; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYiwgwtNxK6/rIcMjyR2at6k/Vxbv6cWYDWAIm9NAlQ=;
        b=RmpSvRCmp62d4dkuucD5KAvH5NhqsF9cA3x9hljOx3RY7UTNuo7W1z17GRgU8FNfmB
         +ARBf+5taYsbEHYIDuLtPs6ygYGK/pdOuLxZ4qglT08A6OxrId/dv0x9x0GBFWqQKSxa
         okUmXW75P40Tv76NO+XLelobiFig4k3nflxb4lqzssbPeZ9XIVju7rL8t8fkVR2k6d2H
         TcvdEhTqg7mUY/iH1Cs3kzWoaGNKFNV7oEmjzYMawpcq/OtUuC/+Nw/T/2L90EqSmzUo
         F7VDkJLu32j79mmreQgorSl/K+bgu9Rkjo9x+zrdU1MFwTOf7UTHU0ip+fUF/FEl4gmH
         j4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761036261; x=1761641061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GYiwgwtNxK6/rIcMjyR2at6k/Vxbv6cWYDWAIm9NAlQ=;
        b=q6YNJNHEr/yQ6YRHX8N8jAP0IuIoI/HF+TJz4HtWwJjc5nuhF10DEpJq/gRqF5Tx/Z
         eNdUBVuFrt9g1UUSh32QLG6yIEmNNV0ZE82BP82Yn68K5IsHanDj9PSpj4qpvxdxZaaQ
         YPfLMayjpW0N19j01/wqphp+QnZ7vt6Pny/FwqyLTycR8jP5oI724yyjapE1JcOhCyTB
         iP0U233LnHqYjb96NyhLh95roHGM5v5HM73b+xNoE2rtF9XnZG302rxR1Rj9S63nnfPL
         SM1OxGHePs1+hA71OOl5bQGrlBoUQpUmP6Svasniu/uplMf8YB26ELDm+CN7a3cKBT16
         kQ4A==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7XtEQuOaArHOQhMyT2jLKxykriZqW4bs6Rra/Ojtju/ob8fPhdgacG3sETtDn+Ik0Jx5NAsDgT3oEVV/jjDHJ7q2XA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzkHyxJuZKmMn3YkjlpcJdr6MxUTI2ODywM+TsNuYnIBNmbu4B9
	cbuW8MOeyKVu7V0vqqKP0y9f/vI+GNzLXl/EN/yOamEbB6V09llAGJpf
X-Gm-Gg: ASbGncuS0eA74Wzad1d/dyfULlzaunwfXw/iZonWkwVs3PwTRgfQiYRaFlkYfiNcLZs
	NNFhHCncgXMyxcePnEqKFe+FRGExjKvVefLg0cAFQpaLEZkKb/3ThjXuwrN/dyc8ay2L7J5tTVO
	GTMbQX3MxJcDJddYfNYa/xJH9hm+gRRnrm5/TrV+mbGmXrMa5hITwlNulHRYNijlAi5+3dX4YSG
	O08Bl7dLk7S6/ObAFRrqpVYGaTdsHYjRpHf2ijr7S8j0dLN1ckVfDzdqk8lcphsMrjceSzVRq+1
	qwZU0P/rPTVXADtgBRuSKA7Wh4uEW7ESx1A0FURY2hBXsfMx7I2xsAn3iexKIV2fQUY8k9orh3M
	+dIj0XYXkBWoQeZu1I69/Lo/TTloVCcLaj7L0QeYtOMsw/KokVJrCIv3PhsjtWHO/LDWsw2UBYp
	2kZJNNVar9pB0pDfdEdAFylYXmW3zz
X-Google-Smtp-Source: AGHT+IHgFcbQCcTMOQ9kPtrRGAEFN37W9IGTKfgQiKIn3e3zPC+cubu+IIUXeREIVPhgLeQPlMhorw==
X-Received: by 2002:a17:907:9708:b0:b04:2d89:5d3a with SMTP id a640c23a62f3a-b6475505d94mr1071125466b.7.1761036261251;
        Tue, 21 Oct 2025 01:44:21 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2bbcsm1000822466b.5.2025.10.21.01.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 01:44:21 -0700 (PDT)
Message-ID: <d7e06f84-c555-4eb7-b781-b8444eedd625@gmail.com>
Date: Tue, 21 Oct 2025 10:44:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Refactor framebuffer's size calculation
To: Thomas Zimmermann <tzimmermann@suse.de>, lanzano.alex@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251020115803.192572-1-mehdi.benhadjkhelifa@gmail.com>
 <1de3112b-6349-46d8-b90b-69d0849c7659@suse.de>
 <6a917f07-18dd-4f8f-bfc5-b85d9051339d@gmail.com>
 <4b01c775-f87a-4c3c-88f1-f5c52261d9b2@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <4b01c775-f87a-4c3c-88f1-f5c52261d9b2@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/21/25 9:32 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.10.25 um 10:41 schrieb Mehdi Ben Hadj Khelifa:
>> On 10/21/25 7:51 AM, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 20.10.25 um 13:57 schrieb Mehdi Ben Hadj Khelifa:
>>>> Use drm_format_info_min_pitch() to calculate the framebuffer line pitch
>>>> instead of directly multiplying width and height. This aligns with DRM
>>>> helpers for determining per-line byte size and avoids manual 
>>>> assumptions
>>>> about bytes per pixel.
>>>>
>>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/tiny/repaper.c | 6 +++++-
>>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/ 
>>>> repaper.c
>>>> index 4824f863fdba..aeff49bc6ba7 100644
>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>> @@ -517,6 +517,8 @@ static int repaper_fb_dirty(struct 
>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>       unsigned int dst_pitch = 0;
>>>>       struct iosys_map dst;
>>>>       struct drm_rect clip;
>>>> +    const struct drm_format_info *info = fb->format;
>>>
>>> This is the wrong format. You're allocating the output buffer here, 
>>> but you're using the input format. IIUC the output format is 
>>> DRM_FORMAT_R1. The input is _XRGB8888.
>>>
>> Ah. Thanks for clarification.I thought since it had the same output 
>> format. I will send a v3 shortly.> Best regards
> 
> Maybe just don't do it. This is just churn with no clear goal.
> 
Okay,I will abort working on it.Though my goal was to remove the manual 
assumption that height is multiple of 8 and to align with other 
'correct' API used in other drm drivers as you suggested[1].

[1]:https://lore.kernel.org/all/cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de/

Best Regards,
Mehdi Ben Hadj Khelifa> Best regards
> Thomas
> 
>>> Thomas
>>>
>>>> +    size_t pitch;
>>>>       int idx, ret = 0;
>>>>       u8 *buf = NULL;
>>>> @@ -534,7 +536,9 @@ static int repaper_fb_dirty(struct 
>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>       DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>>             epd->factored_stage_time);
>>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>>> +    pitch = drm_format_info_min_pitch(info, 0, fb->width);
>>>> +
>>>> +    buf = kmalloc_array(fb->height, pitch, GFP_KERNEL);
>>>>       if (!buf) {
>>>>           ret = -ENOMEM;
>>>>           goto out_exit;
>>>
>>
> 

