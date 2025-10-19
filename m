Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF192E7BCF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760886236; cv=none; b=jGz/qilgk2vwYJilkPirG9ej4Ds79QP75euPwSEQn3LBPn2m/177+XK0gb+fBXFhS3PSOO731glF2ZgHR1uiy01c1FtNuWnwmJmK9Wz/Rqtw7K1olk4SW9VkjIWoxdhAvxBB4QaSeCQRIzBATvXo2Q0eoYVAcyzWwTiBR1kQDMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760886236; c=relaxed/simple;
	bh=vBM/xIZ40/SjaB/zXEdhYY+kJhrkNTuMgWw0XXXBvfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+PE32z+Posc8BvhEiIq55tL/j2Djilx/RTnq99/T0ZvuqC8x3jByNopUgcsjSfDWwk8C0fqR1rNCM1oCZK2JfhffuIP/GNyUCauYG68/IFQfCVOTsL/clekDMFZbVVIjxH5ay3E/9p42Nvwi6aaln28m+vwpMTS6kctB2COFZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mimco9Bw; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mimco9Bw"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67EFA40D42
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 15:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhQRbtMtqHv1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Oct 2025 15:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3680B40D35
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3680B40D35
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mimco9Bw
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3680B40D35
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 15:03:53 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3c76f3703cso57271466b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760886231; x=1761491031; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/9udsA3BE7foY00QqPjtJbwYeXlQDHSIpbrDLCZLLAM=;
        b=mimco9BwMdEgd14QcTdWHw7MMDLlTELhoLDLZn4Di4g+WOsyaSe0ZivnNXREvmwGva
         hcWQ5aiOlDTVyVAABXIFnRAoMr8Kdn212k72yZG5LnYgjmxmW2tYIRq/UVXOGrxsXA4j
         qhy8HEuXieO6yX21fG/JulHndOyoV0Y3cI5lnyuvhkzuki40GsdMdBDvwaZoF08ZP0ZE
         06Lv6BZOXAIG/YBQOVm9rQEzADK/16+TtyNL/zR473qCYbGP5uNZLe+kmjx40hLQi6it
         f98b+tewJABFFL57vVyJ+l4oz4FCvJujl6hn+n24OXhO9uZdWythOIbtK90xlbMlfRc5
         9+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760886231; x=1761491031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9udsA3BE7foY00QqPjtJbwYeXlQDHSIpbrDLCZLLAM=;
        b=fNHFi7vqnXXXv3RLJON6QvYhrcY0Xj8kZ47EN23sutniw3lwxalLnuLdyMFpQ4fJxQ
         qpJr5pJ84CL508l6DBHbcbYzc4UtQI4bMHUlzkszBss7tmdrbD52bj+P87AnbZTciQ+H
         DmwHTql8rK1cH1+SnhKYPnvMXsinK4/rGeOlntNftp4aJSbms+hOUK58mcCbOGvG2olP
         4o5WgoCmkKL+YdhD5pLczhm5h8e3hB3K3kzDYO5fproi6UGS3WoZ1c8qBeYTDqvEiC8t
         UXMNI+tVHpl8fb1euLxdjCNStt/He1vFt8BWo/i3JfHhL4rXlPI5GrwCVN2K9sylLOY7
         W18w==
X-Forwarded-Encrypted: i=1; AJvYcCUnwS3i3LjN7Ql5bLamMkpXm6PmHNoTAM801tYvkZtxZtQLcrspGM4M0OsFZYyYcx/4mgmXZkJ7sW//vwgix9F0qkoIPQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwSydYc+bTOBEMx+zn5EBszcubSR154xMNv5l0TwZqE2YeK9kE9
	2+VepNjhOeWDcp+8m4wZRboj/dLK2we6578r0CBacq/5C/D6oIYObFPO
X-Gm-Gg: ASbGncv31XPylDDKNnD6x1lzachBY/XyF+GWVgksax0e0yrNenZYYv1mYTG6GF74szv
	sz9+fQwfQNkfB0M4a/KnJNg7kxnW7jAXrQ6mxWQ7uyVaEispTQmsUJQDcFl0LCMbbteAIIzPWty
	/0taqJooyqepY0WP8IlNaD1uXluqaCsYh8k4lGIapAvw478JcCuMhdn+4f2SqtI7hunkKAeV4hd
	+eHjFljmAZya9gr29ELV1KGd1ROGc0vCNN4XxwOEmGly3hvcZZaPD0whaNCxTvk/7Zz168xYMz9
	LC333QLxYRyVJ6BOOug2fK8ujqeJ4LGD+cweBqAVgeppihRHmnQ1xR7crttOxW/rTdQA8NC4247
	SM67UM81YqVJbrJRS7/e8BBZ59JVqgALeZyaCbcFd4m0lPCHT0HdKmRcZ93NoxV/zLYJyILdC7b
	OUgTVnoLZ2rCeW190W2eym
X-Google-Smtp-Source: AGHT+IH6TluHuNvwOnAVvgBjwGA0zfWFt6b5AZGTbaDmowoHujtKj2lEr/TiFV0djG0kgxyb8b/vig==
X-Received: by 2002:a05:6402:2751:b0:634:4e0:8377 with SMTP id 4fb4d7f45d1cf-63c1f634390mr5314959a12.2.1760886230847;
        Sun, 19 Oct 2025 08:03:50 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.121.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48a92961sm4345576a12.8.2025.10.19.08.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 08:03:50 -0700 (PDT)
Message-ID: <d072dfe7-e0e9-49f6-89ed-25d194035e3b@gmail.com>
Date: Sun, 19 Oct 2025 17:03:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
 <2025101910-dipper-suburb-1755@gregkh>
 <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 19.10.25 um 16:34 schrieb Greg KH:
>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa wrote:
>>> Replace kmalloc() with kmalloc_array() to correctly
>>> handle array allocations and benefit from built-in overflow checking[1].
>>>
>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>
>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>> ---
>>>   drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/ 
>>> repaper.c
>>> index 4824f863fdba..290132c24ff9 100644
>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct 
>>> drm_framebuffer *fb, const struct iosys_map *
>>>       DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>             epd->factored_stage_time);
>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>> +    buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
>> This isn't an array, so this function change doesn't seem to make much
>> sense, right?  The size should have already been checked earlier in the
>> call change to be correct.
Yes,I was intending to say framebuffer but I was working on another 
similar patch simultaneously so I reused same words by mistake. Thanks 
for clarifying that.>
> Yes, we've recently received plenty of these pointless changes. The 
> correct code would compute the number of bytes per pixel using 
> drm_format_info_min_pitch() and multiply with fb->height. The latter 
> could (maybe) use kmalloc_array(). It would still not be an array in the 
> common sense.
> 
Thanks for the review and suggestion.I will be sending a v2 patch with 
the recommended code change.

Best Regards,
Mehdi Ben Hadj Khelifa> Best regards
> Thomas
> 
>>
>> thanks,
>>
>> greg k-h
> 
> -- 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

