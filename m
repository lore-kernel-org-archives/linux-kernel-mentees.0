Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3E8258CF2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759827647; cv=none; b=U+WvMemso7+FSTz5LpOTNvzt8J3/cJY2vtLwczI+XYuVahkdc6l83Vvr51/Z2kequh5vEUxS+xKS6GiPpGFnFsFnX0iEvSOHqgyeXHN6ba5ygI3iLrFooW40lPKYaJeVLeygWtg1eErqAKIVqACk94T4SGvWNSeowltvBuZ7JLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759827647; c=relaxed/simple;
	bh=z/GtfcwCMRIYf28FfY/V57DZjTDHU5TCWA1AXextCVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbZlMkuYoEbJzUEEjmPB/Y2ckVr8fUUUvfmejw4hoZ060bY/OhjWlboOMzav3Ab+vMS+GI33qKINsok0robg8zODOEq111KueyT/5GCmpXX29cI4HooXQK0ktBvQH3a21jm5MDP40XtxRiIok44rR34+VakIGeg1eYBKWcxuR2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ov3008Eg; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ov3008Eg"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7139B40ACE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 09:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6oDq5M99ZCE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 09:00:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A42D413CC
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A42D413CC
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ov3008Eg
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5A42D413CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 09:00:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3fd2dee5c00so151036f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Oct 2025 02:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759827642; x=1760432442; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Xa6ifE/xlQHISGLdoOjoC3GElKqUAHWHKf7zodIGK0=;
        b=Ov3008Ego8ahF+x/REdElfwRe4Lx6Hok4w5h1YARO3CjjR6dhnWOoVwADA3cLLP1ir
         Cv2/0woj1+FSK8FLz7dfRYcQfeGYjvYxer1KkCBZLFa+vNCG/f00A3dmIfN5D5ft3ZRD
         OFe22b02nWbo88Un412A+Hyx6M871nJNvhQhlpRyC5Kk/iw8if/7VmR5pEkSRcyKa1RF
         msTBjZPGitMg5f2lkjW5n5H579cv+H5IeHxInIayd3HyUcvNgtwGxSxAFKewkuse/6n+
         7Mgkc9XU8H/2wRbWq19+3gFnoNz79y363nVD5L/iDE4mz7eGMCDl9ODS//VxtrCbZg0Q
         j4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759827642; x=1760432442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Xa6ifE/xlQHISGLdoOjoC3GElKqUAHWHKf7zodIGK0=;
        b=pFZkFfv5B0Chj705Iwv+bDxJ+Qpc1vvqcc1rTuJbMwYiq2B2bNlkKfn4JITW5ADOD2
         Uo+POOrmx+yHOjfL7g61Cx3UCg56MJDfljHvjZhIbPoOi2wAOELQ5fpRzrJ3uVyv9dRy
         qNTHalg44aL5lJVPNlP/yR4Uhx9kwqtcQ7fHEIDAgh4e53MApSNqjLPAhNOQq33grr+0
         9rgcQ9Pqep911nR+EQzQWUgYNwsIqunVTeyN/DReCRMPnRFOGK/0m8ZaVDcwf8rYzPPu
         Ds+GMuR5j8phLJ1LPawV0P1SyRuq8AO5mg9Yb+zNGPJonZmKlKglK/dOLpnOhhLdSivE
         A30w==
X-Forwarded-Encrypted: i=1; AJvYcCXLkE5vPJ7LBpdI7H4cEzZLZ3SPL3LEZfCcXWn1Tx8l8UzyxNZxZvwDzozdEdCspFNxVESh1rAkJbSYZKPo2trP3FfegA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywp90JqBQyZ0W9QmrELHNvWTVnSQzmH+VgwljvNLJ9DpYA2QI3z
	uBWoDMzxhGc4j1jLzB2MIuS4+Nw75DvZR7wt1DJFt2UOVlMuyAYs+0kk
X-Gm-Gg: ASbGncsor5xT8I96NC0T9bRNIckWeXE962eFHr0Ho+HV19/Sl8nq0TAiYgL7gBh7ZLw
	WB5veYk3xhxRwPLBkcpGFJ9Uv5aaNKnFUyVh3RJEYTMH66ZGyKN+zsTv10IqWxFsl9jVk+P2Suo
	J9HMjSmTAtocXap95OQEcdomnyjvQpu022ry3W9wPbvlz6TtFUzremrDidq8Ffrb7I+dzPEYYve
	3WjMVtTUhjkMjouE2srJcW6Tc1AYmGe3vgSSsLOAeteG8xDKwI8MP8zjc+cF988tZL//3Ocd5mc
	L6tAJqBlK0N5PMl1wCe56CNasIgsUGIGRDfd+iiCUm9QX5Vw1GfhsFwKrzXvNB57NY5/cB7E7qL
	xjyO+/fI/dhCOYihzxJl+JE/pK9+hXsr2dp8fHbYg4nz/hh+AutsgnIlS9HWuD4sKhnNteA==
X-Google-Smtp-Source: AGHT+IHdxxupVPmhNAdLsdEEwrhmyDrL1qTVyuXmX4U9HVJoLYW50xyIBDHuslFTZC4TvnRMs+w1nw==
X-Received: by 2002:a5d:584b:0:b0:3ec:7ff4:23bf with SMTP id ffacd0b85a97d-425671c195amr4899519f8f.9.1759827642182;
        Tue, 07 Oct 2025 02:00:42 -0700 (PDT)
Received: from [172.16.134.209] ([41.229.125.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abe9bsm24792358f8f.22.2025.10.07.02.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 02:00:41 -0700 (PDT)
Message-ID: <d087a2c8-05f6-4fc1-924a-c3a84eae119c@gmail.com>
Date: Tue, 7 Oct 2025 10:00:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/gud: Use kmalloc_array() instead of kmalloc()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 rubenru09@aol.com, linux-kernel-mentees@lists.linuxfoundation.org
References: <20251007083320.29018-1-mehdi.benhadjkhelifa@gmail.com>
 <bef19ef2-b22d-4adb-9513-b267d0e53330@suse.de>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <bef19ef2-b22d-4adb-9513-b267d0e53330@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/7/25 9:58 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 07.10.25 um 10:32 schrieb Mehdi Ben Hadj Khelifa:
>> Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
>> calculation inside kmalloc is dynamic 'width * height'
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> As Ruben already acked the previous patch, you should add such acks to 
> any later patches. But no need to resend a new iteration now. I'll add 
> Ruben's a-b when I merge the patch.

ack,I forgot about that. Thanks for the heads-up.We'll do next time!

> Best regards
> Thomas

Best Regards,
Mehdi Ben Hadj Khelifa

>> ---
>> Changelog:
>>
>> Changes since v2:
>> -Reversed width and height in parameter order.
>> Link:https://lore.kernel.org/all/20250923085144.22582-1- 
>> mehdi.benhadjkhelifa@gmail.com/
>> Changes since v1:
>> - Use of width as element count and height as size of element to
>> eliminate the mentionned calculation and overflow issues.
>> Link:https://lore.kernel.org/all/20250922174416.226203-1- 
>> mehdi.benhadjkhelifa@gmail.com/
>>   drivers/gpu/drm/gud/gud_pipe.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/ 
>> gud_pipe.c
>> index 8d548d08f127..c32a798ccadf 100644
>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>> @@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const 
>> struct drm_format_info *format
>>       height = drm_rect_height(rect);
>>       len = drm_format_info_min_pitch(format, 0, width) * height;
>> -    buf = kmalloc(width * height, GFP_KERNEL);
>> +    buf = kmalloc_array(height, width, GFP_KERNEL);
>>       if (!buf)
>>           return 0;
> 

