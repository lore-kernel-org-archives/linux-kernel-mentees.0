Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3F3328FC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991779; cv=none; b=na8bEy0FygFYn1XGyZRRye77jOIdnlwOU4YuSrZhCTZFSjIVbsabURGvoF0nhSUuvVnyq7CX+C3EYbF4YXXKhd9vX2Bj6+m8+Ehy7Yp68zDNFwBWGkAJBwH3d95zOZjpHDVpPYRWM+w8iwaKWXOGsNGeeL+5Uj8RoOIOV8iuxbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991779; c=relaxed/simple;
	bh=57KurvKt64exJVef9Um1G7kmOg2hPNcAt7EPHN5ldjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1LwMKcYnUa0M2M4PV6dVK90sT+PU5UZxzCEu8KHLkR+I1C6ca6SYUMhb3jhMeGqF69anJvG81A6G7hztx+w/w8eGYac0t3NoLlqWfFmipP8NkkToVMowQ2mhH5UH/FWmk8z9LHbQk9Jf3DcCOG8KzJ7ryHMbZO/Ck2PzXhwnl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T3KGnQUS; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T3KGnQUS"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09CC44017C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLdBlghEpQlW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 20:22:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18E20400C4
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E20400C4
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=T3KGnQUS
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 18E20400C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:22:54 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-93e817d3ee3so308548239f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 13:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760991774; x=1761596574; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mg4rdzF03I9VKfQ6A0u6ZEt7ExfErvnSo3bCDGro3gQ=;
        b=T3KGnQUS72Irj2Dw87dKn9uwO79GqkDudwiMsZPEPHfBRvTrjD7UgwrnSUjWx6s0bd
         h3NR0MNx1MOvKWQF1qJnCHQAr4AYRmvzWQUHYJVM4t+E5wG7tF2fUJPQCIRThKDGMEBj
         upEIr1NI96646Il+/pX0n4ku7wipiYNrbEjMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991774; x=1761596574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mg4rdzF03I9VKfQ6A0u6ZEt7ExfErvnSo3bCDGro3gQ=;
        b=ML+/+VdtSZcdnFUqxQ1rUU76UZ+igFSgUOUm5XIuEUdMjPQ1/7XUBtN1Dq494RLP5G
         W6rGvq0Leh6uQpBVEJ3OdoFtDo2EuEus9sPNrquPvfCnd+ZrJVIN5jdikpOLBkYBS+bx
         v/F36la3Kh66ixxwti0B+fjOw2WEUGBq0sPXe040q4jVmSx5hZE2Aww1vAdU2qsnqre6
         FwvR+DJK991OADI1EWKxairCPElpakVqwIbyBbWDZPB5aeVeiNn9qT2Oe5PE1xyGP5z1
         S1BAF3/Qq5A26tZHnX7zZtCH8lkQA7JWcmKtxaB7LUKGeJ1YL9efcvFe39oiYQ5YwiCU
         vvmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8hFC2atWa+Q4kMmSP6DF80clhwtOirBnQMzglqlEp5q8cmj70DiBqMDQEnjoyfiYM8HMJPZF5iEWxNc76IxNmTAgRoQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzJ/9b/AthT9VtwowVNAZRkeBIrSRm5F6qXyNo4ZCsyAENW91k6
	sVB4MdD3XnnWHuIDJro9O5HwV1ao04gBp3DAPcngvR+Bj5f99vgUJiWnni8eRdtjUCiBOQ==
X-Gm-Gg: ASbGncvP+AEsH7v4/33dlCTL/vXQVjuBsR6IXCPLaspaAJFo8Nxu+/QS9FjRJP/2NP9
	PWg+f8BaH4Cxr1phlTs2YEVlTpevUi/qC33D6qHcwHKCd9JqXDpXmIdtxEm5WeMyC5CLvPYq4cb
	h5GxA/Zq/dv45u3ejGNd8uT6RJ+kBpb2g78MrN4RONEYfY5DfgRAXGAOVcElsaWtsQCLjD8Dssh
	sNxEtYBpJ3bt+gvkuVltB95+T1OQWxQSB1EfcXMZTqMA85p3oUOEweKkn1DnUo/LglZILDPJej9
	C/sT7HEnh0saDMlE+AcrWhHS4vETYoQ0m4tFvGd8IzeQLHxNgWBcNY9Ds9CsgJqLrHuNMUzc48h
	BARNrAGh8WCMlyjfFNJaUA6CiLlo0k6XjOaq9ukGbAqUPls7DqT0cweC+qB5fJCC2bYZ6gD5jAn
	4QMdoaeXqUsZ8uCQOvuvhG62o=
X-Google-Smtp-Source: AGHT+IH3lraseKHKDfkvaNbqZdA/pDcJuk3ieKtNJ64spgnZ1oKvXWo8ZrnWbAQWu1y8fgRUWB7mKQ==
X-Received: by 2002:a05:6602:3f91:b0:887:6ce4:8e07 with SMTP id ca18e2360f4ac-93e763ccef2mr2303274739f.9.1760991773699;
        Mon, 20 Oct 2025 13:22:53 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e8661d228sm327198839f.1.2025.10.20.13.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:22:53 -0700 (PDT)
Message-ID: <21415b1d-17c0-42a0-961c-a4aee16d20d1@linuxfoundation.org>
Date: Mon, 20 Oct 2025 14:22:52 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
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
 <ea12faad-1735-4a49-a70d-d4cac5629042@linuxfoundation.org>
 <b0b1c2e9-c367-4e9c-b931-d3e1b0ba7f5b@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <b0b1c2e9-c367-4e9c-b931-d3e1b0ba7f5b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/25 15:11, Mehdi Ben Hadj Khelifa wrote:
> On 10/20/25 9:06 PM, Shuah Khan wrote:
>> On 10/20/25 03:50, Jani Nikula wrote:
>>> On Sun, 19 Oct 2025, Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> wrote:
>>>> On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 19.10.25 um 16:34 schrieb Greg KH:
>>>>>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>>>> Replace kmalloc() with kmalloc_array() to correctly
>>>>>>> handle array allocations and benefit from built-in overflow checking[1].
>>>>>>>
>>>>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>>>>>
>>>>>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/
>>>>>>> repaper.c
>>>>>>> index 4824f863fdba..290132c24ff9 100644
>>>>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>>>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct
>>>>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>>>>        DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>>>>>              epd->factored_stage_time);
>>>>>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>>>>>> +    buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
>>>
>>> Also worth emphasizing that this is wildly wrong for any height that is
>>> not a multiple of 8.
>>>
>>> And I thought I shot down a similar patch not long ago.
>>>
>>> Is there some tool that suggests doing this? Fix the tool instead
>>> please.
>>>
>>
>> They are documented in https://docs.kernel.org/process/deprecated.html
>> Mu understanding is that this document lists deprecates APIs so people
>> don't keep adding new ones.
>>
>> I didn't get the impression that we are supposed to go delete them from
>> the kernel and cause a churn.
>>
> I have sent an appropriate v2 specifically to suit the case that we have here. But the document[1] specifically quotes the following:"
> Dynamic size calculations (especially multiplication) should not be performed in memory allocator (or similar) function arguments due to the risk of them overflowing. This could lead to values wrapping around and a smaller allocation being made than the caller was expecting. Using those allocations could lead to linear overflows of heap memory and other misbehaviors. (One exception to this is literal values where the compiler can warn if they might overflow. However, the preferred way in these cases is to refactor the code as suggested below to avoid the open-coded arithmetic.)"
> Specifically mentionned the refactor of the code base in such cases which is why i'm doing the patches in the first place.Also i'm trying the best to send patches related to the issue where such issues of overflow are present or to be consistent with the same API used within the same subsystem.
> [1]:https://docs.kernel.org/process/deprecated.html
> 

How are you testing these changes? Next time give more details on the
where you found the problem - it is easy to miss the link unless you
state that it is coming from the deprecated document.

Even so you have to explain why the change is applicable to the code
you are changing. How are you testing these changes. I have seen more
patches from you in drm drivers and lib code.

thanks,
-- Shuah
