Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A1A2E22B4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993799; cv=none; b=Wj4zThXMi/TVJ5XLFq22vDVOnCQPQtfDTjRUgEkPjAAaLW+7cby2KEfExKjW7Yu68qg17h/f71JX38Qd/WR7f1MP2BK3ydyyjGDflcjukGuIO0cTyitwwCOXSQEF32YBVvE33XmyPoISTnv7gTv3LrnQFyTZZppjljQMAG5K0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993799; c=relaxed/simple;
	bh=GYEPVtDsttvda142P5IMaxq4re3bE586j0GC1bxwJ54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJHnlZG68oxdEw8imGTkfAZHM2kXjSwe94Gd+K0bzKEeSUyZdYxx/yMKBi3GjH74kiEwRxmhWQG/3+tL9Rp7/s3Zf4i6kPrtBAfhMJeu5kR2Sh32uSL26Qy2j+tlNcxV6Rmkua/HxjtW8fqIbrWbo57OxN8Hm0B9X8by0qawr7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LSg6I2PE; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LSg6I2PE"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3C36400AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgcwsDqqFhee for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 20:56:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B59C240159
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B59C240159
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=LSg6I2PE
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B59C240159
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:56:36 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-940d27610b8so92809339f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760993795; x=1761598595; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ja+n9veh9qlHqb8hMHqgjmxsNKt1NGlPkWcYxqSmGs=;
        b=LSg6I2PEUF2t3LUcgeF95iyJMFpztJ9wLbAOmNqdALjXHq05O8JY0f3Me1BRA5tFcK
         QkP1pqmRR9YJd6ZvtNOda8Uc4grpJNR+/22Lo++2Kf87uetDL8WdZdIuk7E9YyjzxK5i
         CK9b3mPLKqPAMTs4oqpI+xoA3NIBDklwD92pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993795; x=1761598595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ja+n9veh9qlHqb8hMHqgjmxsNKt1NGlPkWcYxqSmGs=;
        b=xBy3oLm4v0/mWwM40nAQYXopM6tuSBCOcdxYuSWteKw/zy8m0vhnmwrdvIHhUBzSyK
         JqJChQLRZJxEuZtiuDYoAZl7NB7O7scIeKezfxK8VYMsx0Isr8WrBhxpJbwsWsEnFBvk
         Jq3nYuI5JYwJfontyeE1XTBO0oo0dnTkf0+2F5G882y1vRvwyRd7ea2XR5TcEZQAUFCJ
         MDry1ZXDOPYlKMtsa8zD3lbDWsObY2/ANBdJS3i/fox7JTIt/drKdlYoyTp5QZyxa9ZO
         wxrpmTfbAbzqVuH8z9t5eVN4T/FYktwI3KUEgvoWQEUChERZJlMsjMFacupZhcrahDMw
         qsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMCgtY+axtqUuvyn4j9e8mD2ZfpnW7zfbPxzc+uOyxd7WlFTNERx000GH8pGEFcH7QjOoD2nYFBvxv6RZj0uqiD9C7FQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YykqKaYnjvtJiv9hc0X7a441JmaEnM4qycqfWzMEYykjAzDan94
	n7LBPGLpPHrVBRG46vJmbwh1qukUmxTUG+xAzmN4riooG4vyZNt1V6Hg9Wym/y+KqI/Cig==
X-Gm-Gg: ASbGnctr3b9w9l2Vkzk7BOxkDC9Wajj3pjq6LfIcYOMZJpwbzWk0pem5WcpGrUq2fvH
	5Up7pm7kNAFfUTUyvapsMpqBzlQRV52PpMNaWL2wMQS68TgrjVCcQSJutDbLlrfpHrD6Kc7Ryyu
	4eQflgEmuiGjtoXfBhPZH0xEm55CSiW3RBWA6+y7O5jOirBA0/ptCuZBmOEteFFDyIQs8SDT4K1
	J8sfDox1Fr0MQK3pLBy67i3Vf0G41UbTr76G5hGm9CQzAB3RHMhcXjlLSkjXo5IoVIFurts4BF+
	TElsukzvo3eKEAcNH9cnS1OvQHkLL4lKVuyeGDJM//Pv0B34CtEnGGtcW5JHpnm4+jQj8n4ScGl
	5KTZSXh49B5rLkYc4jnOQ/QxCzhXxjzotGItb4/usCVtim6DSreXP8FuUEELGQ2tfi2JJW+bSKq
	q3U1PunoaG4Nby
X-Google-Smtp-Source: AGHT+IEYQuMsRrQP0zzcYNlBWGppocUzz2r9I/kZPTACOG5ljM8owh9X4YfA9kncxZnuMAgjkIzHhg==
X-Received: by 2002:a92:c245:0:b0:429:4c65:e8f7 with SMTP id e9e14a558f8ab-430c52d775cmr191927495ab.24.1760993795511;
        Mon, 20 Oct 2025 13:56:35 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d070a461sm33957455ab.9.2025.10.20.13.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:56:35 -0700 (PDT)
Message-ID: <3f523293-8a8d-4136-b4bc-4ad0d4a50c59@linuxfoundation.org>
Date: Mon, 20 Oct 2025 14:56:34 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
 <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
 <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 15:38, Mehdi Ben Hadj Khelifa wrote:
> On 10/20/25 9:08 PM, Shuah Khan wrote:
>> On 10/19/25 08:58, Mehdi Ben Hadj Khelifa wrote:
>>> Replace kmalloc() with kmalloc_array() in several places to correctly
>>> handle array allocations and benefit from built-in overflow checking.
>>> This prevents potential integer overflows[1] when computing allocation
>>> sizes from width, height, pitch, or page values.
>>>
>>> [1]:https://docs.kernel.org/process/deprecated.html
>>
>> Mu understanding is that this document lists deprecates APIs so people
>> don't keep adding new ones.
>>
>> I didn't get the impression that we are supposed to go delete them from
>> the kernel and cause a churn.
>>
> the document[1] specifically quotes the following:"
> Dynamic size calculations (especially multiplication) should not be performed in memory allocator (or similar) function arguments due to the risk of them overflowing. This could lead to values wrapping around and a smaller allocation being made than the caller was expecting. Using those allocations could lead to linear overflows of heap memory and other misbehaviors. (One exception to this is literal values where the compiler can warn if they might overflow. However, the preferred way in these cases is to refactor the code as suggested below to avoid the open-coded arithmetic.)"
> Specifically mentionned the refactor of the code base in such cases which is why i'm doing the patches in the first place.Also i'm trying the best to send patches related to the issue where such issues of overflow are present or to be consistent with the same API used within the same subsystem.
> [1]:https://docs.kernel.org/process/deprecated.html> How are you testing these changes - do you have this hardware?
>>
>>>
> I have a raspberrypi zero 2 wh that i'm using in combination with the ssd1306 OLED panel via I2C to test it's rendering and it's working properly by using modetest and seeing no regressions or warnings in dmesg.
> 

Send v2 with all these details and why this change is needed
in the first place.

When and how does this potential problem trigger? Is this a
theoretical or does this happen in this code path and how?
Next time include all of these details people understand the
problem better.

thanks,
-- Shuah

