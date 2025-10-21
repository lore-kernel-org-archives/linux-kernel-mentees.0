Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88C24729A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032523; cv=none; b=IJxVoA43HS/nBBl0Z7T74zQVQ8jQNWnjwRL1wFqMD8HLWJg4m6JX5g1dQGy58iuQi7mwhJtb+FPdg+qI94wSLiZkppkCdfcXGfILZ4RzR2ep/TjWV0pDf2hEU6Ly9vxkonK3NUUCGafwgRKBMn0pm4Yf0dWVsjp5gbvhYl+S4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032523; c=relaxed/simple;
	bh=/KXuhprsVUz19Yhga1t3t/oxVuly9wIxHjlRZ69Jq9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noOTdDYVOYqhDPILALshXyBcKfiTg/zA438Tc5zGyKRHlgZSp4OW9A8bHEA6oZBp1iq8l/83rtoIkjrGIcaLHvU4dIm1oarb5qv6gev1hghSeTc8i8W6LCv2F3ka1rN0AjOLgGS5vmNaQRHrn7Yw+Jzfc4cl5I0Qmd2ELKCpAlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tv3pQuZL; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tv3pQuZL"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33ED34052C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4pV8_4QQkSX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 07:42:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33C6A40527
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C6A40527
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tv3pQuZL
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 33C6A40527
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:41:59 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b3c76f3703cso90742166b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761032518; x=1761637318; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qq2A1Kd0gSkqieCWoXvyag5Ixf7jlTaGJ4OOCGbMDnM=;
        b=Tv3pQuZLhsTM9uPOEtRBU8z9YEzBLIxGGEQ0m7uMPYfox7+1Oykr4+k6eLgzXzWgAc
         occxOq+KrcO68pSh4O1nL0uo0ZkzZqnvQb0bPBBzo5sXDy0hM9z0OKW8wGffmC+4Je0P
         Y5AX++1RIdIMQsjmgRvfnnaz4gV7Xx64YW1kWyjHbrc5V6sMVadpwIFWz9/WC3JJ1AT7
         mX5v/29n9STQemPkzGppa66dDdV9XFe8Mbye2cy4GA2u0XUaNVQJ//czM91ZX7u2qON4
         iixb7P59Tk8mPQ7x/UPvXNKyn1X1rvScocxZ0DYV6sw9B/tZmIYDL9zsRirGGZZkeCXR
         giXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032518; x=1761637318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qq2A1Kd0gSkqieCWoXvyag5Ixf7jlTaGJ4OOCGbMDnM=;
        b=CaDaxkiINEq/gP1ROeZWV6xlciC4oPKxET1EvC41W0PeUYbPbkU+gJBAyddyxCNnap
         FVwRFvDr5HhIfnOvz5j3n/49k5MBUhYZfjzNdf6KGxErs5p8uWFk3jxOzaHlZFTIOIQX
         QcptjfFPj5UgyMuRYE1HKjgiMdqfuoNNfiaG0/6pcAUnFGwF43Y1Pzp+cvhJhm270lzn
         rKcMpf12XugHy01t8QsRpe+vQo4f39qksj9EbbKFrboXzbJ7kiCwqe2PQ+w1GZqzBLZn
         9/sUxSMjtQUwrSJnq/vHEJ1M8J7HDQmiAos1dj4IUJ69x/13WHZdRcuUSiLPTC4yTaAN
         Y26g==
X-Forwarded-Encrypted: i=1; AJvYcCV1BR30iGqS+qKXDLuTZVLTFPOzj1qrl5y/2DDNKG08lLONdk92NvY2N1z3MT5FNDs/c1kX68ShUTIbrqpMUqSKJi0JXg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwXP70oG5Ec8sgbDYyA4PsLf5bQDAb27cDf43wjPwgxlYHiM6BJ
	vcHjnIUykKK+VtvYGUufgUJkD9bYDJ4m0MCE8xprtduRjroFUn9Nr21p
X-Gm-Gg: ASbGncvhpSwj/w3pda0XDhv1FFi/xslm+nj2iI+tZsOeruS4vHSXyN38DsjFhmhcHQx
	CUHLgdfXY0scr2yuX+L3ETdOcFyJt0CmZ03TNod6ng9+ZR7tsCsnkgaV8vaAUWVXTzYH6kWQdlV
	+IHaksFzBl0dxdRV8gii85BPLmRYDI5QBbRPbOxpemx1RS2yLIL70utbowRxGRZTVVdxkPxmYA0
	8+rgys6D9tFNb1uWyQuNO1M9cKnL8PZ4h5veZPnQwt6CzWVQv/MJfi5Nj+Af4BtkCcMF5f99JJd
	0mvr69sryBEmSG91VeQ6A47L47MBUphtKkIfXvvJ0zq7JpXHBOC9C6ftjOh4hVwVzY8hYHos47/
	p5OAntp775WM23vVra5ricYLNKzE+x8sjScq39u9kCevxpHMmWHqLXDa0Ho3UE77bo1dV7HfeB2
	/QReGfc7xxrmkjFq0S3mOtHszUfXNF
X-Google-Smtp-Source: AGHT+IGodTzNkYb0f/6+s9/q8PjxsWVWjCrsIvbWBLyQaGYptSG386KqvkxQNtg9R8tF9hr8VXvYZA==
X-Received: by 2002:a17:907:3cd5:b0:b3b:44a8:c64b with SMTP id a640c23a62f3a-b6c77583751mr151353866b.1.1761032517726;
        Tue, 21 Oct 2025 00:41:57 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb52621csm1007794266b.59.2025.10.21.00.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:41:57 -0700 (PDT)
Message-ID: <6a917f07-18dd-4f8f-bfc5-b85d9051339d@gmail.com>
Date: Tue, 21 Oct 2025 09:41:49 +0100
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
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <1de3112b-6349-46d8-b90b-69d0849c7659@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/21/25 7:51 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.10.25 um 13:57 schrieb Mehdi Ben Hadj Khelifa:
>> Use drm_format_info_min_pitch() to calculate the framebuffer line pitch
>> instead of directly multiplying width and height. This aligns with DRM
>> helpers for determining per-line byte size and avoids manual assumptions
>> about bytes per pixel.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>>   drivers/gpu/drm/tiny/repaper.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/ 
>> repaper.c
>> index 4824f863fdba..aeff49bc6ba7 100644
>> --- a/drivers/gpu/drm/tiny/repaper.c
>> +++ b/drivers/gpu/drm/tiny/repaper.c
>> @@ -517,6 +517,8 @@ static int repaper_fb_dirty(struct drm_framebuffer 
>> *fb, const struct iosys_map *
>>       unsigned int dst_pitch = 0;
>>       struct iosys_map dst;
>>       struct drm_rect clip;
>> +    const struct drm_format_info *info = fb->format;
> 
> This is the wrong format. You're allocating the output buffer here, but 
> you're using the input format. IIUC the output format is DRM_FORMAT_R1. 
> The input is _XRGB8888.
> 
Ah. Thanks for clarification.I thought since it had the same output 
format. I will send a v3 shortly.> Best regards
> Thomas
> 
>> +    size_t pitch;
>>       int idx, ret = 0;
>>       u8 *buf = NULL;
>> @@ -534,7 +536,9 @@ static int repaper_fb_dirty(struct drm_framebuffer 
>> *fb, const struct iosys_map *
>>       DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>             epd->factored_stage_time);
>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>> +    pitch = drm_format_info_min_pitch(info, 0, fb->width);
>> +
>> +    buf = kmalloc_array(fb->height, pitch, GFP_KERNEL);
>>       if (!buf) {
>>           ret = -ENOMEM;
>>           goto out_exit;
> 

