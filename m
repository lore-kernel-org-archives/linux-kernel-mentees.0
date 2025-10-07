Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076E221FB4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759824412; cv=none; b=E6XSY5mUBW5KXOy8Y/1VnRTWORDHdQ2bNZBOSYiMVPLAkqF9NDTpnC16G4EiHDyie/UOsCsAlOB6CExDeK3jt8AEb1EGxZB9CwF2nUeS4+IsAZdlnn6noQ3I/t2ZbHfE1veBK1wqFCUkUg4b6ewgyOzdhmWCaZpT+ic+P4ikVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759824412; c=relaxed/simple;
	bh=0nuVQOkwJzeH7k9ho0X0QYWBaSW1FiKlHuDOyl8At9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nih/naiDtYnLkpfqc7I9CLcAwa1Dgfxryc/mb63t9utW1z9S6waH61A5iAAFJRFza8ge9VaIbI78/K8wu3k+nTZg5Ju40zpjHF/MjytUCuVukiww+7rl3A22WcS2r3FmvBqFdZAI3DqSmKPkIhlDvX8ewe1wVE9NtNspYa7b/DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAlBUSBY; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAlBUSBY"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D0984016
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 08:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Da6HyhWXT8o5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 08:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3112E840CB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3112E840CB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JAlBUSBY
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3112E840CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 08:06:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-46e38c21fafso11060075e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Oct 2025 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759824408; x=1760429208; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+DemagZ3lwdnPbdAD7J+Cx+hPerc6FDpVY4UH1BSMao=;
        b=JAlBUSBYIqwF1XpKcWI1LtTChWSWoGRqSOFC2aXmjZwXgcwLCWyBuaU7aaNJetWiIw
         FreyfZggspAcHChVBj/WintfyRnBDD09KEPGzo1MhKfGdGE2XibMVjFFwNFAjSTLDcfN
         Z6E9+fkMmXj7LsseyVKIQeSk/OxUe2NKkG9Evi8bgD8qPcU3AzIwf/y70SWjmFK/gK4R
         Nj3s4U5E/z85ondFIqKjhGNu49ZIFKt9g8h3iYNRNkpxIO88YKB7fa3mklWJWD8g/sr2
         PNjzQ1WgZzhfNmct4SsSRkZ73S11QRdDYtLK+cANmGCAoBCHKo/5qT/3eQYYzKAqC+jt
         jb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759824408; x=1760429208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+DemagZ3lwdnPbdAD7J+Cx+hPerc6FDpVY4UH1BSMao=;
        b=bFkKZ9Pzva84/T0ba8PNKAkB1PXn26/ek1D79O6SQwhGkbXkd5VNlsZr+LK/2P0j/w
         Z0iRz0I+YCPXCBUgDjArLaig38mSKxcGuoXrQJz+U+SvRIuHE1YrAVydIhpDY540TFVC
         24ET7qraJ772AHBe/jdIRPIxmWTjOTUgLmR5we45+dmH6i99NLKWn0KWEnUYj7ihaxaN
         VoeRTs1iSXFiAbMKRR7AZU/QQMOgKzGHLJYYACctgWv+q5HlNAf8Xtmc03IbUz3jcc+F
         5UajS5riBTLE7YDCnls9Vcenm58mLunKjH4wwUyBVTz9+HZWhIxTBJ7ZQLz4uiRjak6i
         28cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKb3fMiGEuFAfHwwqNq3Ezq67Xr76G6vlfzzIplThWc/QfCW6wpvCr6mR3sd6lY2S6NtY6kl+5FNR/n8sdSArmbfdI3g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxUdhNMqIYpqPWVZYz4SWCLSiMLBsX7OZbhbR/mCQiiAS6nYHm8
	RiNES5qhtP1WBSPYpIiPLFr+32QseJDSMvKI1SCCa0FOiVw3s5PfXwaP
X-Gm-Gg: ASbGncsGsrR9a+0q60dri16SfksJ5Dhj9i7/U2YPv0hGTlyO4gAPwHjVRdduxBGHsQS
	ZxskwNCKreyOB6B+Oq2PuHTTD7vpekB+TBD+21INqhWQ9pqp3qNc5mFta7UYTy9E3X89ctkOmhD
	SLtw8gol4NLH0on89Sqn0vGElgei4L7wQBomFoILhwP4URwapVNl2KwBWyL1GZ3QRoFWxxGv9qd
	6JlPN7r4pnFaODt5qn1tfClW/rFUWFyRF5I6Yva3bUbIwKkCvsryMtfo6SkotlqWCOzLnxee4VD
	ERz3IzHqh4eI2QEAH/ErLZMqR3Rr8BhF5OA+YRgOI7YewehVawlCkV2xR9m0A59/OWyOOiqBQAG
	PAuTpjGSubsoFqvV7zelOEuFBK0UbLIqoLSn8Ein9IrqjsuJ8X1mw9sbrSc9vFzh5XkpvKjtS+J
	I=
X-Google-Smtp-Source: AGHT+IG7W8TdSh7hajTVSLVxdSS/RLt63cBB9lWB3+Jv1QSy+dF+pbB9sKZOf60r/31B0nPg2XLA7Q==
X-Received: by 2002:a05:600c:3510:b0:45d:f7df:270b with SMTP id 5b1f17b1804b1-46e710b22c1mr53224255e9.0.1759824407277;
        Tue, 07 Oct 2025 01:06:47 -0700 (PDT)
Received: from [192.168.174.116] ([102.155.185.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9780sm24118374f8f.29.2025.10.07.01.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 01:06:46 -0700 (PDT)
Message-ID: <20f049cc-41f4-4b23-b4a7-5d41dca7c7e5@gmail.com>
Date: Tue, 7 Oct 2025 09:07:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gud: Use kmalloc_array() instead of kmalloc()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, rubenru09@aol.com
References: <20250923085144.22582-1-mehdi.benhadjkhelifa@gmail.com>
 <26036ff3-2374-40a9-8597-271b93130a7e@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <26036ff3-2374-40a9-8597-271b93130a7e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/7/25 8:45 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.09.25 um 10:51 schrieb Mehdi Ben Hadj Khelifa:
>> Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
>> calculation inside kmalloc is dynamic 'width * height' to avoid
>> overflow.
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>> Changelog:
>>
>> Changes since v1:
>> - Use of width as element count and height as size of element to
>> eliminate the mentionned calculation and overflow issues.
>>
>>   drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/ 
>> gud_pipe.c
>> index 8d548d08f127..8898dc9393fb 100644
>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>> @@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const 
>> struct drm_format_info *format
>>       height = drm_rect_height(rect);
>>       len = drm_format_info_min_pitch(format, 0, width) * height;
>> -    buf = kmalloc(width * height, GFP_KERNEL);
>> +    buf = kmalloc_array(width, height, GFP_KERNEL);
> 
> One nitpick here: the first parameter is the number of elements and the 
> second parameter is the size of an individual element. [1] So the 
> arguments 'width' and 'height' should be reversed.  Please resubmit.
> 
Understood,I will be sending v3 shortly.

> Best regards
> Thomas
> 

Best Regards,
Mehdi

> [1] https://elixir.bootlin.com/linux/v6.17.1/source/tools/include/linux/ 
> slab.h#L15
> 
>>       if (!buf)
>>           return 0;
> 

