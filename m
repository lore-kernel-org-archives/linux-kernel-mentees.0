Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE742EBBB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994043; cv=none; b=bNyF6y0vnF+uN4sNxgdOcM+hIyJWJb4K2Lo6sN9+20q+Mg45wAZiwKJuevBVo89dicaI4lNG3YOn5pnwPvHcplkQ1yA5OK9y4b2+RvENCHuYoeHmFCxWMiFAcHufNavlSYVWROH797yZHC7c1k+x+Z2EEDjg7Cq0HHk4I20nn0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994043; c=relaxed/simple;
	bh=jqRNVk9JPPRXcEvQPe8IyfklN4EpKEZuwb6rk9nv4UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGwtohvV8kjhH85t3024dwHt8TUXZMAeX9bzk7t+6B8l5t7RCcGzsFB/kJ7a8QpCm8eivaKax0HfxaVoAawzeYLKTTIYzhTe3ZZArvadk7nvzBMCPtl0lyjzdZmg/ELkVruTSSp4XAtPmrWewSMyZkKVjfs5Ba6OaGTTuf7VwjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrSR8JqO; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrSR8JqO"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C034211C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 21:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ra1bXIMFCDtp for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 21:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F69642119
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F69642119
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CrSR8JqO
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3F69642119
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 21:00:40 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b47a5a17303so77744866b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 14:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760994038; x=1761598838; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tI1RtufrnCfn5YC744MSI0dkUCZVt+o4Wi2kRqCU9cQ=;
        b=CrSR8JqOJaqXJRynMEBncNeqj3Lmmnzjq2W/y163vzev42VwcEL+R3N6ruIOXLmy3T
         nG3WaE2sh53r45l6++HwgQzpR8AdPW/PfTykUVtDQU2qpDrAcPtZq/8btDGIQr4xF0B3
         yX1Ef1RkHb5JMRPCXqoJr6HQjz6Bgi2abyL4goNDTu1irJWI3U6bo/dWgCFzXChC1ow4
         Zp7vjezkq/5u6aAMBKB2+YY3nlrMYtr1AB/1gRJ9NDgX/CQx21AO1uOWhzP1VcrbMnDW
         VX+ibAI+cotVN/oyMMu++PHBe7L1bRr5ggWhwxSthOvENslDgC9r6nUcQAvIXK4Ac6hA
         PNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760994038; x=1761598838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tI1RtufrnCfn5YC744MSI0dkUCZVt+o4Wi2kRqCU9cQ=;
        b=F/plY8tdF1CD98LUcSy50WD5DoUnMhZ7TQBT+m87Fla6sDmKG3A1U+OEFgW+kyL/pI
         QuBpYHgiB+UWGctfkJYPg0F0kehMKrQOlpcQzugvMqF5zaoBHnyFl5qLtPsUVhxypOHr
         DaSCArdeSC9Wc1qqjql/7fCO1DZAyrCz4aBqzNIIA3M5Kjy7RvUfLOiiTx5M8mHiU7pO
         zMVMbhQyvIqOmH+X8oidkrmTfjlEBvT6xbA28vO6KZXakAdl4wQh+gre/cwT0qZ+ZScl
         OJ2b1vQlaN/zlhADo/jjCuRxN5eVIbjsb7AVhf4x6LrxXI60MgXkxDyunM0W/KMISS9Y
         PGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFiHX34elU43bbCDQ3F3YzG4K+xpJt88kS4Fa78F5iET5ha2zwrUhPp118Nd86VlGJrW3XvOkEYljghSFQwXi8JyZiGA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywtex4fP9PKGQAD7xRLDGoOzp94QXTM8we/fk58br3yW43q5Vfi
	Len5BtpaLzdpjYnoZalvbAXwLNIINuCAkWMqG9yFvDukx5Rd2EWMc5V7
X-Gm-Gg: ASbGncu4d4XaEumLF/kXIg9qfe0qWMqI2kWR34lSKrA8BpajfICelqxhxdtnJDND1tb
	6KrhNXTJM2ndmJdTmBPmWEenZwptOf8fj2p/fuT5iK2zin1c0bwm0NkRcPG954LwBlarCA7bnE8
	qtxHgm8mdgATlumlcCbKy5t/w6v8/hQZLndJOi6p50joF83xjoMox1xdDlrEFOp1aTtPuBatd5z
	pb9JCvf/C7XmDXUqqG+6iRgzn21zvE6lCyoCEdfllflksm07xWWrBvBgcUoa4F75L14Og6tC+AU
	Cbf6Ph3Qmg3A+nnm+5u3wwI22VhwmhAAZznc5ZWgdXEp6ahzi2emlF894ui66n1XDTK92Ib6TK7
	v4/0CEw72ETl240/phYVs7NPp16F5VevtxeMgkxIdh+qtYXFl+CJJMdBVE7UyOBJQsT+4OMVQmI
	+GLuIUdJQU3lWAu5hn1UQap7gjAAnS
X-Google-Smtp-Source: AGHT+IEaUHrZm36TzujHB3atkHpPtOn7/1/PguhG61tVYMTx0+WCsxhMTWkx0TTDhC0ihbzPgU9YGg==
X-Received: by 2002:a17:907:2d29:b0:b50:891f:66ae with SMTP id a640c23a62f3a-b6c78839802mr77886466b.9.1760994037800;
        Mon, 20 Oct 2025 14:00:37 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e838b946sm872537866b.19.2025.10.20.14.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 14:00:37 -0700 (PDT)
Message-ID: <1a25af58-3504-4b98-9d1d-63974491ee95@gmail.com>
Date: Mon, 20 Oct 2025 23:00:29 +0100
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
 <b0b1c2e9-c367-4e9c-b931-d3e1b0ba7f5b@gmail.com>
 <21415b1d-17c0-42a0-961c-a4aee16d20d1@linuxfoundation.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <21415b1d-17c0-42a0-961c-a4aee16d20d1@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/25 9:22 PM, Shuah Khan wrote:
> On 10/20/25 15:11, Mehdi Ben Hadj Khelifa wrote:
>> On 10/20/25 9:06 PM, Shuah Khan wrote:
>>> On 10/20/25 03:50, Jani Nikula wrote:
>>>> On Sun, 19 Oct 2025, Mehdi Ben Hadj Khelifa 
>>>> <mehdi.benhadjkhelifa@gmail.com> wrote:
>>>>> On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
>>>>>> Hi
>>>>>>
>>>>>> Am 19.10.25 um 16:34 schrieb Greg KH:
>>>>>>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa 
>>>>>>> wrote:
>>>>>>>> Replace kmalloc() with kmalloc_array() to correctly
>>>>>>>> handle array allocations and benefit from built-in overflow 
>>>>>>>> checking[1].
>>>>>>>>
>>>>>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>>>>>>
>>>>>>>> Signed-off-by: Mehdi Ben Hadj Khelifa 
>>>>>>>> <mehdi.benhadjkhelifa@gmail.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/
>>>>>>>> repaper.c
>>>>>>>> index 4824f863fdba..290132c24ff9 100644
>>>>>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>>>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>>>>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct
>>>>>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>>>>>        DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>>>>>>              epd->factored_stage_time);
>>>>>>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>>>>>>> +    buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
>>>>
>>>> Also worth emphasizing that this is wildly wrong for any height that is
>>>> not a multiple of 8.
>>>>
>>>> And I thought I shot down a similar patch not long ago.
>>>>
>>>> Is there some tool that suggests doing this? Fix the tool instead
>>>> please.
>>>>
>>>
>>> They are documented in https://docs.kernel.org/process/deprecated.html
>>> Mu understanding is that this document lists deprecates APIs so people
>>> don't keep adding new ones.
>>>
>>> I didn't get the impression that we are supposed to go delete them from
>>> the kernel and cause a churn.
>>>
>> I have sent an appropriate v2 specifically to suit the case that we 
>> have here. But the document[1] specifically quotes the following:"
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
>> [1]:https://docs.kernel.org/process/deprecated.html
>>
> 
> How are you testing these changes? Next time give more details on the
> where you found the problem - it is easy to miss the link unless you
> state that it is coming from the deprecated document.
> 
For my testing I have used a raspberry pi zero 2wh with an e-paper 
display to test. I have installed the custom kernel with my 
patch.Confirmed module loading in dmesg and ran modetest with no signs 
of regressions or errors in dmesg.
If further proof is needed I will be happy to provide it.
I will be mentionning the deprecated document more clearly next time.
> Even so you have to explain why the change is applicable to the code
> you are changing. How are you testing these changes. I have seen more
> patches from you in drm drivers and lib code.
> 
I have sent a v2 and it has the more suitable changes for this case as i 
said which was suggested by thomas. here is v2.
Important to note that my last testing was on v2 changes.
Link:https://lore.kernel.org/all/20251020115803.192572-1-mehdi.benhadjkhelifa@gmail.com/> 
thanks,
> -- Shuah

