Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E8168B7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989792; cv=none; b=ZVQbNrBvx9VugbT5fz1+v9uNitQ5HaoPLrRnMGf7Y1SirsKVedYqhO8i09WXbtLIqC8T+nk0zjcHVVVAjPzhYfjis01b2oK9m9XdPGX0dJLIFp8mFAxoQaFdAYEUoQAPfK9U0uhjywBGVDa8Y4yhQrOXG1H9MnLvJrDFyhJfBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989792; c=relaxed/simple;
	bh=z/nech4YiyG1wccCfK9E60TNraeQd74bohAjLE5cmKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suOUXiggHyY8EbIDLnTqzy16OMaNhR77cN2Yt4fmZpkk252M3VqjaAvGph7EFnUTQZSmQWITpW6xnASraPGU/DpLKFQnsgcPfGb8hc/xwBoM8Am9HdUX7HJ4tQE61gvJkVTJcdTapZDX5HxvXNkNC/KqPiZwa4sJU6fI9vQVYjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uf6NN6u2; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uf6NN6u2"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6595F40407
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 13:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bq4YwkLEaoyw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 May 2024 13:36:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=yskelg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA315401DD
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA315401DD
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uf6NN6u2
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BA315401DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 13:36:30 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f44b5d0c50so14882185ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 06:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716989789; x=1717594589; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dicpLSmGeHTxR8brlcEnN0cI1QEPfhfEJAkQtcJYjXg=;
        b=Uf6NN6u2dFtkakWoUwI9A5Y6DtuMJZtb5CkRkUFZqLcbSqj0XFoOZIp9D1+7eIRpgw
         ted99HIfPyWXENOlkv4dYiwdokAHtddwsbBdMFn5qeQAS5NojGTiM1GgD5K5ulzo1Faa
         z9XNA6mnlsVeqfwSP9Prh8aUWCxbV3faE7huRC7tS16kGURPmdRuymMzCiHyzTYQqxTo
         Gp4P65J1O1ciAncvd5uUAPSY8pKJ3fYvhTup/czn4dDaKj7O8Ein8RqCLJHw/FM9r+/M
         j8KWMTUwwsMvdeOmLFvEwzuUeP8uSk1CeSdiu+JI4OK+ZvWj9acwa4WrR8QeF1du3VeE
         isKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716989789; x=1717594589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dicpLSmGeHTxR8brlcEnN0cI1QEPfhfEJAkQtcJYjXg=;
        b=Ydke/VdS4VIceMem/C64YefmtPYwaAhRnTTuJP/lAKAIl1htRFqt4ZqR4N9XcxDhM8
         kiiAismK9w+N+xNeOQaYjoXZRWL6YXn4WUKeO32SxhS44zFFAEDjFt4KEPhqOPR2DkOH
         N8pz/LQFzLqsG0oZIaavA+SPSMVekQD5zAXnOAeUh6zYiZWfI5IJCJtP/TGlpgToEwfF
         uO5UmpOAv2T3gIMB1kh00y2XKSWrPM2YZLfbQ1GGvOaYQKTArzmcb+F7fExXpCA7OLwN
         RB7WBjk1XEPbc1kzAyMPh6KlrZv9MYOggHVoARjiyfKOWztkPPGpDjE88EjQP0wEOJR0
         zm/g==
X-Forwarded-Encrypted: i=1; AJvYcCVMNfii4mWKnNAMWaYKzge4lLyW7eGu0M04rOxLxZJd4ClKqpet/0iIPVOdiXDsAA/LrQIqvf0b4jZz1dZv7e0yGZZuoMmCpRWPjhZSfJ605c1aDsP3JvLA78C69JM3
X-Gm-Message-State: AOJu0YyyYTnyR936ZXPnTeV+XxqeUIWTFBYA8beBHK8hvdQMCVMhkywS
	RU55LlSA9vk17XmvXDagfa18F+PPF85M7ImDarZQMKh4nBNAcQHc
X-Google-Smtp-Source: AGHT+IG2bzrds8yi4l23vZDAB9yvZEHtwj8ed98GsFY012BXS9ao17xB0hQkMahe4hP7gPU0TMZLBA==
X-Received: by 2002:a17:902:ce87:b0:1f4:8a83:a2dc with SMTP id d9443c01a7336-1f48a83a580mr95544275ad.10.1716989789220;
        Wed, 29 May 2024 06:36:29 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f5e6a0c323sm7448965ad.259.2024.05.29.06.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 06:36:28 -0700 (PDT)
Message-ID: <12ac8cc2-3117-4cb5-ab3a-2e8add3270a6@gmail.com>
Date: Wed, 29 May 2024 22:36:24 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: handle potential dangling pointer issue in
 xen_pcibk_xenbus_probe
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: skhan@linuxfoundation.org, sj@kernel.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20240529122232.25360-1-yskelg@gmail.com>
 <0c53415d-3394-455a-a6b5-99d3efb92318@suse.com>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <0c53415d-3394-455a-a6b5-99d3efb92318@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/29/24 9:27 오후, Jürgen Groß wrote:
> On 29.05.24 14:22, yskelg@gmail.com wrote:
>> From: Yunseong Kim <yskelg@gmail.com>
>>
>> If 'xen_pcibk_init_devices()' fails. This ensures that 'pdev->xdev' does
>> not point to 'xdev' when 'pdev' is freed.
>>
>> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
>> ---
>>   drivers/xen/xen-pciback/xenbus.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/xen/xen-pciback/xenbus.c
>> b/drivers/xen/xen-pciback/xenbus.c
>> index b11e401f1b1e..348d6803b8c0 100644
>> --- a/drivers/xen/xen-pciback/xenbus.c
>> +++ b/drivers/xen/xen-pciback/xenbus.c
>> @@ -54,6 +54,7 @@ static struct xen_pcibk_device *alloc_pdev(struct
>> xenbus_device *xdev)
>>       INIT_WORK(&pdev->op_work, xen_pcibk_do_op);
>>         if (xen_pcibk_init_devices(pdev)) {
>> +        pdev->xdev = NULL;
>>           kfree(pdev);
>>           pdev = NULL;
>>       }
> 
> NAK.
> 
> This doesn't make any sense, as pdev is freed.
> 
> 
> Juergen

Thanks for the code review Juergen!

I don't know if it's a big deal, but I think that if pdev->xdev don't
replace it with NULL, 'struct xenbus_device *xdev' address value stays
in the kmalloc cached memory.

And most of the kernel code I've seen does this (even when it's
'free_pdev()'), so I sent a patch.

In the very unlikely event that. I was thinking if someone look at the
value without initializing the kmalloced memory, someone might see the
'xenbus_device *xdev address'.

Warm Regards,

Yunseong Kim
