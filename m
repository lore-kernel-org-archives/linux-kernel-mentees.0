Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C02C2368
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760992749; cv=none; b=vCreLlfcHhkXU+8zifVgVz5LCOAbnyK+RObg1vA6UxWZ+4s1eOYxlgf1H0PEiWAjJP0DYfCCdHJh1681j0QiGMo8KAewVTBqy+BTox2INHoX7/1ey9nOGB6ihbwIvZ6UdRKUPyuvWA8dn/aU8uRyf8cotPIDC0p8NKhRdZzDrOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760992749; c=relaxed/simple;
	bh=qBfD4dD8XFhkLWwXK5SqJnOINmi5CJvE/sMdh19cgbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qs+CBbXfBv4+jvYXes7xdVf51vSQCYGcisj66pmDjhGR9BCo+bfJiqbZHulBmvVZKoE/bO/6cyQ2R4+X4N1lq4w1FEG8Oyh3e6PoBQOizBdoWf8PKIearKbP2pMA19Ul1QBNQ2PJQ3rGTqxP5CPM7o/7xM+/6qf92QiJ51DmPjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgsPqhkZ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgsPqhkZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1138420A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFWKqmvo69d3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 20:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A21C7420F7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A21C7420F7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fgsPqhkZ
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A21C7420F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:39:06 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b3df81b1486so92904866b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 13:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760992744; x=1761597544; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I13zc6oy6n5wEThdTlFRQKlOHJB6pi47H7uQVP12yGs=;
        b=fgsPqhkZPx/fNXOklHRoh7b2u+vWRw4o/BbOdW/Pfkg3yrq1W8pgXaYz/VQWXZ7UBd
         awf5vszQvFAur3I2/uAqZoTK/DC8IcussxQWq/S3QXTwU7jc2kkDdcGyh3hzhTAwFu8J
         4tMp03gaqzW04Yo2ooGcI3T4JP3Hr5Orum5o4+5KwA/+lvsxBnGZ5L4yTkVkA1yp6pAk
         sAldPG7QmyOWoCg67gPSGCmIkKT13+vmofttgvtwlSE0NDYo4bz69BrrAhJbUqMpf73d
         MPnqJqtnBgFIRmRv8Ub+JiOQEfpAiYo4r3mgpcbWVT9e/zUZJj60ahu/Wy9yskQ9i3mh
         bGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760992744; x=1761597544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I13zc6oy6n5wEThdTlFRQKlOHJB6pi47H7uQVP12yGs=;
        b=HEUhl0YJ8NYmH/44PuMh+7Vw5bZaJxiGPdpQaqgSPeHgQuKb2g3klNWekAR86HP+L9
         SUs8OdHNBswsxGVVW3Nip1MwxhmElv0EPGF/5jHvsZ9u+Z1n4Dvle8PRilXgLpg488NS
         zB6uJzTbglwSSAyQvwYHCRuFHeA6tqiwgj1j4FzeWVZex+izKLfXQ/FtbDVDaZhbBWCV
         OhgbDtcYt4wSyXdkQTkCyiCvsVGedtAIdZOe6eKrW/ZhUdsNkIARNqZy9F09Oal6YVn1
         FLQpCsxdu0lsyIJInMxve8J3rCHzMmYhimYoLMoMf7IT7z1hvi+XWaEVDsvIeVnMuDns
         lxag==
X-Forwarded-Encrypted: i=1; AJvYcCUWNYyl5/iTxcqEMWF0YcK2lJmL96YAJXGd0uywymaW6fRPY/jDdgum0cvMcoslpa1jKp51qVUh1M+HOMierLVSR5j8hQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywkq1QcOtYGOk8chO2LkrItKEDsp6phWjOzz6BwGdXuo5afbB3v
	+V0aU4Io2NAIz9uLALGeNP1v8shjhi2UbXLRbpoLYyOhn9GahXHYLdzH
X-Gm-Gg: ASbGncs2IXPSJ5kbT/2bcAWzq85G0o6yDNZHumkIftjOKNOLip+PskasfCD5P6yoqZA
	FC1QaE3jQJgQy94D6HQBtsvPYqRwZWzK04WfPw66pcWJy+m17Wbv1JGzH8r9NxJBFyZBnZaV14+
	RmJ5NIEtzKJj5kimj42ZnIU4b5u9X5I/KfkUWsG1vChBPA4LhtR7njtVSCugIHPN94tcSaJQr/T
	gXbruDWH4r8HDVPI5zEEykMObbbsBzKKz4OJ/D0hpyB816IUZjpH8CI5OPthYkVJ+iMg20tysk2
	jrM76RNEBBr9K9XZfQRfDSn18exb3klVfQQuCLRDTmccwxNxZuDiKIrak65n0v3K9hZAMdg35mk
	fwVQW0CS+WDyoSDBe7dF1Qg32dCEz9PalDeEAQTsQf4yKKIhCyh8dCX3taKsGTHoiazZSZsdinY
	0+9dQvqZ6lu06aLYgtZ6TYb7ti/N8W
X-Google-Smtp-Source: AGHT+IHzlmKFJ8QvxM6XXCi3yDGc0o5ave5OzIak2mYRhAtf9x4ZklR2v8SH+Ts3J9IOPDUqUfvRMA==
X-Received: by 2002:a17:907:9805:b0:b29:8743:81ef with SMTP id a640c23a62f3a-b6c744b500bmr72625166b.0.1760992744003;
        Mon, 20 Oct 2025 13:39:04 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb035d5fsm891116266b.44.2025.10.20.13.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:39:03 -0700 (PDT)
Message-ID: <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
Date: Mon, 20 Oct 2025 22:38:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
To: Shuah Khan <skhan@linuxfoundation.org>, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
 <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/25 9:08 PM, Shuah Khan wrote:
> On 10/19/25 08:58, Mehdi Ben Hadj Khelifa wrote:
>> Replace kmalloc() with kmalloc_array() in several places to correctly
>> handle array allocations and benefit from built-in overflow checking.
>> This prevents potential integer overflows[1] when computing allocation
>> sizes from width, height, pitch, or page values.
>>
>> [1]:https://docs.kernel.org/process/deprecated.html
> 
> Mu understanding is that this document lists deprecates APIs so people
> don't keep adding new ones.
> 
> I didn't get the impression that we are supposed to go delete them from
> the kernel and cause a churn.
> 
the document[1] specifically quotes the following:"
Dynamic size calculations (especially multiplication) should not be 
performed in memory allocator (or similar) function arguments due to the 
risk of them overflowing. This could lead to values wrapping around and 
a smaller allocation being made than the caller was expecting. Using 
those allocations could lead to linear overflows of heap memory and 
other misbehaviors. (One exception to this is literal values where the 
compiler can warn if they might overflow. However, the preferred way in 
these cases is to refactor the code as suggested below to avoid the 
open-coded arithmetic.)"
Specifically mentionned the refactor of the code base in such cases 
which is why i'm doing the patches in the first place.Also i'm trying 
the best to send patches related to the issue where such issues of 
overflow are present or to be consistent with the same API used within 
the same subsystem.
[1]:https://docs.kernel.org/process/deprecated.html> How are you testing 
these changes - do you have this hardware?
> 
>>
I have a raspberrypi zero 2 wh that i'm using in combination with the 
ssd1306 OLED panel via I2C to test it's rendering and it's working 
properly by using modetest and seeing no regressions or warnings in dmesg.

Best Regards,
Mehdi Ben Hadj Khelifa

>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>> ---
>>   drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
> 
> thanks,
> -- Shuah

