Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC022DC79B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615610; cv=none; b=JW2O/N2nGKCj579hHT4JKKTxYZMj65a/e7ns+OKEW+FNddXSAMoVL5qVMKYLTgV32J6pncn/3VT18WryrcunA5SnPs+h9Sy+/fm8IIQela76sX1TL7PCp7a8NxvIg4rQJHB+P60fW5D0coFvuvatKZDQ16XAPfJUp6iO77sEnSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615610; c=relaxed/simple;
	bh=lvdaf1jdpAn/0b3aS8IdKfsdb5q+QYRXB5ufrgSNwJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=o+RHQVXlY7AzfE76HIDKOktPfXxCeU807WhC3s511918yCdZWbb14DVudKv/30El7YNCsGWhAa8zWi/daa/GpkVcO/NCHESAq7mbPx3bE9coOBVJ1tvkcXRrUa5PJ2n9HSMV4qE6xmFLt8E4WaNs1xR92avDlzDp5XxXToCufKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcY1P9sg; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcY1P9sg"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C0C460AE3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 08:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYCg7dmUI9Mg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 08:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77A1960612
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77A1960612
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mcY1P9sg
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 77A1960612
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 08:20:07 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3f9fc54fcb2so90426f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758615605; x=1759220405; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IzyzWewMNK9Zl9E9xETHmxZ1NeS51VeZso1zp+2bU2I=;
        b=mcY1P9sgIkAAoP1CobXAmI4Gi78UFWqYOcKVyxAvy1Th7aM8bWwgrDMwtARYHj+4cm
         4SPd/1O8/pl/nJEKKVpc5CPIMCJQFd1ny0FRvugzjunbvkxmREvQl+RhGZv9suvIuf77
         UREoxCqPAQv6krcoW18C3/gd8SWM130o70Tq9D4zOsQX8O6hSM6fhhY2PEZmnLXDPf5I
         jhqx4B/z4RM8HazRuGpTmz3NlctThb1Xut/tISdvK6h4YLThKhZmzWu54q65RdlF1ZR4
         957o6mKePFv3YRzFJZrXyaUsIML9uNdoi+rkyZcnbXrRp/ipeYAMPI+Nqu5BOd05SgvL
         N2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758615605; x=1759220405;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzyzWewMNK9Zl9E9xETHmxZ1NeS51VeZso1zp+2bU2I=;
        b=sB11WWq0qEHnp0+5Xiz0noUb1TSVXLyYhhKd8KcQdkBV5NdnHMyUxA8LHrhs89AQ5d
         xIq+PBvURPTbig8rmQRmK8L1nVrosp+kHUcerFJROFosmYfetLW3Iuktg8dmW3og10ij
         Y6rB//WEixJMUm6D/C6XMbD93yLhHh62uUliu8amw6NXoBWK+mPWcDG6RKXzIftRvUd6
         hUXhg/OMmHrSz7KLSvP8E9WJSofDiOCPBpYKEQz2VWbZClNgM1fr3+ztdmHSiQ9fISdE
         BsihiF2ItnVA7vq/pb1K8Z2Iw8pfbBfqEBYUcXH6lVVMpETUCFeBw+etenSIapO9T8Uw
         My9w==
X-Forwarded-Encrypted: i=1; AJvYcCW4TNpk7VP+NyculJfkSiHCiAMrt0aVHSmYgFw+2gzj2XsXZP/NVhZtmEZWeLlLc4XGRJ5zvQFu9m7e+D4XVockmNrNxg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxuApQM4utFNy36igkeOXUtX1XsF4qQNRHkP+e0De3Ly58MQ8+w
	i9+dqEAufN5w97S4tQOMv12Lbm3FJ7ObaUVfgRTKjqEseXJrcRVCCHB/
X-Gm-Gg: ASbGnct1qH0upuzQnwS+PjwsItfG8ZEnMQ2cn7Jeoqlr2GCjiXBHOsJK/yLME77xSGw
	mbNyWrObPVqGJp/CW/SHIGkTKdeorBMKuCkvlX7SyO5XFEb+fHIrg1Q8B+/HYJMy/84R4L2MHXn
	OjIOCE/4j5Ek89Dxi/sxaFh6USvZ6i68BqJbxz0ASnPKjPGHz1gsL1uM5scYPYkbl8wEfMyIG7J
	EPAnN+mtGeabLN6VGtOynU4EbsdfWABN9dwlyfkrT14kMetA+yjQ8FR3NHmSo8n7Lbwsp8tfM6E
	mivVpe5i9fijeXQeXTRB54Y+Nx48Fj8IVXnXy5Jn6QNRDUnjOES48C5W68NWiaC/v2nRUQF12rq
	alkJ6YRqdv/qwtPe1/flCgY9VQwz5spJ4BGS9s6NHKoefQA==
X-Google-Smtp-Source: AGHT+IEMgeYQXIZ6KZjIiu5Q+SFOyifqT76gOV1N5xNcfsbVxIXA4Ao4Gbib8xuNk1pacZpZMn/dMw==
X-Received: by 2002:a05:6000:268a:b0:3ea:75d0:cf0a with SMTP id ffacd0b85a97d-405ce97fe14mr543601f8f.11.1758615605145;
        Tue, 23 Sep 2025 01:20:05 -0700 (PDT)
Received: from [192.168.100.110] ([102.170.50.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f53c4sm23321598f8f.3.2025.09.23.01.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 01:20:04 -0700 (PDT)
Message-ID: <989ace7c-92a3-438e-a0a6-3cbeb46adba6@gmail.com>
Date: Tue, 23 Sep 2025 09:20:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gud: Use kmalloc_array() instead of kmalloc()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de, jfalempe@redhat.com,
 Shuah Khan <skhan@linuxfoundation.org>, david.hunter.linux@gmail.com,
 rubenru09@aol.com
References: <20250922174416.226203-1-mehdi.benhadjkhelifa@gmail.com>
 <063fbed8-915e-47e5-99fd-ffae22cfb6fa@suse.de>
 <fda2b300-dd91-4357-8cd0-a82347907164@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <fda2b300-dd91-4357-8cd0-a82347907164@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/23/25 8:06 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.09.25 um 08:34 schrieb Thomas Zimmermann:
>> cc Ruben
>>
>> Am 22.09.25 um 19:43 schrieb Mehdi Ben Hadj Khelifa:
>>> Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
>>> calculation inside kmalloc is dynamic "width * height" and added
>>> u_char as the size of each element.
>>>
>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>> ---
>>>   drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/ 
>>> gud_pipe.c
>>> index 8d548d08f127..eeea0cb4c7aa 100644
>>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>>> @@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const 
>>> struct drm_format_info *format
>>>       height = drm_rect_height(rect);
>>>       len = drm_format_info_min_pitch(format, 0, width) * height;
>>>   -    buf = kmalloc(width * height, GFP_KERNEL);
>>> +    buf = kmalloc_array(width * height, sizeof(u_char), GFP_KERNEL);
> 
> u_char is more or less guaranteed to be 8 bit. So what's the point?

i thought it would be more "clean" to have a data type that is of 1 byte 
size to use as a reference for the size of each element here.


> There's a potential overflow in width * height. If anything, you want to 
> call kmalloc_array(height, width).

This was more apparent to me after i have sent the patch and was waiting
for a reply first. Since my initial though was that width or height 
alone couldn't be treated as a reference to "n of elements" or "size of 
each element" but your suggestion is more logical since leaving the 
calculation width * height in the kmalloc_array would defeat the purpose 
of switching from kmalloc to kmalloc_array since dynamic calculation is 
still present and overflow is still possible.

I will send a v2 patch shortly changing to your suggestion.

> Best regards
> Thomas
> 

Best Regards,
Mehdi Ben Hadj Khelifa
