Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE630F4FA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032578; cv=none; b=V+5PIHaUmzGe+U4D8JvYGrpQUDdMrEqRS9qy6EjBY970MOFkCwr833SGZT2DN3vD1z2PQA3QKdZ98AVxjXNn+o+jJPLBVbgpU8ejwNalU73ktk5O+Yycq6oxaHXJBHoy0rnjNiHwJT6pIj4cOJT58Zpfe2hAlwM49mp0l8TS7P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032578; c=relaxed/simple;
	bh=Co0g2oq9Dvgm/vKLbYkp5UqWrktn3iu3zgG/qt6obY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MI7Re3SscLHoHocoAru8DXVy71WVX88Da0Za+qJ3gHwdVQOmyGFSeNW2BuQGE9jQVNB2Z2udp8/4wLVXDb9oVX6ZZsuqukFMAtBeUvTdXPda/LoIXWxn6tZFRdKHqIMWCQzJrluEh88rDLtVp3tsE9LVdylYHLFXJTDBnGztjn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEEaeBIM; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEEaeBIM"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E5958103B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmoDJlVdeY1y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 07:42:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5EDC81028
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5EDC81028
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZEEaeBIM
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A5EDC81028
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:42:56 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3e8f400f79so89647866b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761032575; x=1761637375; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GStPgF6qWg8eBpq7k/CjdOQ6h0CGmfUgYnZon0KO2vw=;
        b=ZEEaeBIM+1HF7NbZRCpYGV05abUxG/ObNVfpzqHI2rw77CvtPKI9phwHCiA/vFAPm3
         gbN+6wb2lAbf08zZ7iuQY8zRajM8nlHTt0B+90YPfaxRKwSOlascqF9eIge9YV9nTyiE
         U6lpesBeSxPVwIbbKIm5lUC+5Ly2qJyQsdZJU0dyUISxXGuEns/ufQOSRcnW+wwfk2gt
         78JHKT+L/A0604QuZ1RT3KekGh1bUygfMfYhQGJ1ooPONnIEamDeN0r4M7IwN+PL/+OR
         lAyY8A74mwvyUfOVPZffarvitVT+eYuPPmplC4v9CGLyu6rbWShwqrltUfAsqhFUcmdo
         kUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032575; x=1761637375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GStPgF6qWg8eBpq7k/CjdOQ6h0CGmfUgYnZon0KO2vw=;
        b=aDhhc12ySFZW8eBltsW4JRKwlNcA0j6XWbM75QlWrUstWNNj4O4CP0XvmELLAnWnFK
         pyE+bb2Q8hIvoQEnFzvqFEn1rL9dDdyYRWhujbjaClDpl2pbxLDL43p9j3nyboyIDmkF
         X/eK7vhDl02lMCfCtOKm4vYflQPZ/DKMIvnUntGzgqE5JoCsrjmiaUM29HOf3K/eRJVX
         VtTObb1rG4H+ajQ5VRAowEcYMQ48KVSGAdsPK9D1xnllCaZxV/hTIAJY0OHpCY+i0PQG
         TLLRgDKv7Azq/FBTSpcExpY/LdPuPrLuhAkvkD4oBQnbztDM032uB2s/BZ7HJom048h4
         rgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYPttE30UgVy3YFyttLhrc3xC2LMZ7REuPFFgUCiYGXgEqG9yN0hemWjw7rb3Wyj1jUpTAbHZ7Wd9EDJKr+rz7owmDig==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzjWmUguJSqfqjm7TBCDRZoi5evQMamYKGSsuML3MKYU/xoa5R5
	Yj52PWMNAza26Ws/GU3x8dVVuQJE3c/bi8L/R2DNDnEaFhQEuALZn0Pc
X-Gm-Gg: ASbGncvOJWuADKxmSslrsldQsh5vAb65meUbzX307kzn54Zq8EMv6574eDNd73pLcEu
	J3em+vlFlHUtoSHjHVgFcLSUUII/+7MjCpys8KBCVbu2p6jL+n+WKBIU9rTUWayNGQ08dS64Lv3
	oxfgqhMjgXlOwp0pXMrotgQrBH16a/Snm/mBuavKYXWaJqMNp8EBuIvOaoq11/WUophBJ4O9/+I
	kT5KNcR/Avf+GOB3g2l//ccu6CzHp3EzySfNVjaOSbv4IpiljPJJHuVcZ2xvjE87bMlEvUUInN2
	JKwxBCyW6tYx563y1YsakRtwIX9qWtAcEFqgD+L1h/wvdfm6xrFbqsMF2mUDPKasKmWgu+gH6PA
	KMfjCZXHCvEVWbro+JOCXsTE9uXADk0lUBFlJFkdAH//iqqCiPj9BfLPS1aFemuw/C7XFCWDZHl
	SC3oMxiYQiZjzb23dKZI4RPYepM2Qr
X-Google-Smtp-Source: AGHT+IGTAHitbAGYUoiDBb3JjyGZ6zbzSc2aytK1cYPhymZfc5cQ/shi+4Gz6sE1cziBWlkHoCqTpg==
X-Received: by 2002:a17:907:6ea3:b0:b65:c8b8:144f with SMTP id a640c23a62f3a-b6c793063bbmr164905566b.6.1761032574440;
        Tue, 21 Oct 2025 00:42:54 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25c9sm1018929566b.11.2025.10.21.00.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:42:54 -0700 (PDT)
Message-ID: <dfb3d547-9842-443b-80a2-94bf715bb46e@gmail.com>
Date: Tue, 21 Oct 2025 09:42:46 +0100
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
 <a37d83c7-dc2d-4e1d-a8d4-5628e0ac52a2@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <a37d83c7-dc2d-4e1d-a8d4-5628e0ac52a2@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/21/25 7:57 AM, Thomas Zimmermann wrote:
> 
> 
> Am 21.10.25 um 08:51 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 20.10.25 um 13:57 schrieb Mehdi Ben Hadj Khelifa:
>>> Use drm_format_info_min_pitch() to calculate the framebuffer line pitch
>>> instead of directly multiplying width and height. This aligns with DRM
>>> helpers for determining per-line byte size and avoids manual assumptions
>>> about bytes per pixel.
>>>
>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>> ---
>>>   drivers/gpu/drm/tiny/repaper.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/ 
>>> repaper.c
>>> index 4824f863fdba..aeff49bc6ba7 100644
>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>> @@ -517,6 +517,8 @@ static int repaper_fb_dirty(struct 
>>> drm_framebuffer *fb, const struct iosys_map *
>>>       unsigned int dst_pitch = 0;
>>>       struct iosys_map dst;
>>>       struct drm_rect clip;
>>> +    const struct drm_format_info *info = fb->format;
>>
>> This is the wrong format. You're allocating the output buffer here, 
>> but you're using the input format. IIUC the output format is 
>> DRM_FORMAT_R1. The input is _XRGB8888.
>>
>> Best regards
>> Thomas
>>
>>> +    size_t pitch;
>>>       int idx, ret = 0;
>>>       u8 *buf = NULL;
>>>   @@ -534,7 +536,9 @@ static int repaper_fb_dirty(struct 
>>> drm_framebuffer *fb, const struct iosys_map *
>>>       DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>             epd->factored_stage_time);
>>>   -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>> +    pitch = drm_format_info_min_pitch(info, 0, fb->width);
>>> +
>>> +    buf = kmalloc_array(fb->height, pitch, GFP_KERNEL);
> 
> And TBH I'm not sure if we should really convert this call. It's not an 
> array in the sense of that API.
> 
> Good candidates look like 'kmalloc(count * sizeof(<some type or 
> variable>))'
> 
I will leave kmalloc in v3. Do you want me to send deep testing 
information on this patch?
BR,
Mehdi>>>       if (!buf) {
>>>           ret = -ENOMEM;
>>>           goto out_exit;
>>
> 

