Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE66239E88
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 15:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760802733; cv=none; b=UC0yxy6tSM7K3ogRSyCMkxzAECWufku3GKtyHb9GMN2mGQOE5BSXqNA0gu6F/qqx2kRSFbpUPVM2QM5TeeU3SJgspTMrkex+wRiVRQV+6Okg73Z8JLernCtITxVOfV5/tCTe0BDv1FgeE+jRb1uXlrEPbc9tI5L6AbYlFgdbedM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760802733; c=relaxed/simple;
	bh=jkKNTWqA+dunjGtKp9ONacoSeruZQel4vRKBXYFAQuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DIr0YAoP/NilhNn77WE3N0SpRZrd/wqBdx+Lb7+cEpWWDtvFGHFHoLvBDTSg2crwOK+l3alsbkT6NDVSvY4HMl0AecNLoa3Vp4nKmZTdlhTlDzMm00c3GxicPQT1fu3P7nRmspY8lmSaxfwTASo9bQASxOPtDjJHn6p9rIDFK54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fe0awU3E; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fe0awU3E"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BECE4089C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 15:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4QQF0eBhVJf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Oct 2025 15:52:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF55F401C8
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF55F401C8
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fe0awU3E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EF55F401C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 15:52:10 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4710dc94cf0so692735e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760802729; x=1761407529; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/+d6bg7Je6LSfnCh0eUcN2Abtn61/XzTPi6xEkMU+k=;
        b=fe0awU3E61NDbxMm6gusdNAk03xHrcIxozAs3efZAYozEBTh2l+HQsnQxR5+aT6iKV
         y0f54magXjC4rGMVt9dz5j6V6IYa+iEKEAhoDQ2pMY8AMmjf59SD9J1wJi7AeEPnpMkc
         XoocrjR1pBwmYWEFZCuEUmhZ4oLvnrWYI1a/pLTk13SyvkzgETmIRzyjcSNq8Im69dND
         QRiLrocBN0s8J1ksmLo1etKR+bTiy1kXwK0LSaCRr9yAygcEC/TAyqUTkyaheIIaP6GD
         YdgKbkgSp7CrxQ8FarfebXbnbUPU9y9ZiTLvoZtzrdy/Uyy/9VKIjKiuGmlBXLiI0SUK
         jqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760802729; x=1761407529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/+d6bg7Je6LSfnCh0eUcN2Abtn61/XzTPi6xEkMU+k=;
        b=lSrvNvGrUas+z5RhjBtnBZDcZ3kWgSq1K23tR0RUzF83zS6/BcqlEFow2H/JguILEL
         8q+V9w31eDfyShsSrucTKfrIshnTCgVb5iYnCRKM7Fd0IL4Ah9QFrYn0QfAlGBUd4r3q
         P3/nJZsptYu4HLaO+r0mzoLBfmdU3w9YsrMZKUSKVbXwTVQ2cmOfNlC4zyCEoZZWbh5A
         fJt187DFEnawa8XjTN7U96I40kvZIV07pJ3myrVifr3Ljyl8nK6cogz5ghFCagvErB+9
         VTOGBBZSFohjwabRNBINtnx88o+0SfTkGQ04JHlB1bQoqlBvCqmCj/RN9hoJ3Z6YED/B
         NKtw==
X-Forwarded-Encrypted: i=1; AJvYcCXcX5ZfUwKSaGQltUQ/DsdPJaTc2IWRPafu6DtVVDhR7vwhnrVQrPkMMj8KgOQFuEdxcw83OTPxix3rKm4WujKqGl9Wtg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzDiOpAA7haagRDw0JI9GkHPT/+iWKHweKrAej8QpLcpJ0Hz4jl
	bhib5CsaCzakdXSwIYZ3YKjKgPrpGtdGJDFFI+5aaI6fgHUywf4WOOfj
X-Gm-Gg: ASbGnctxHg5O2lsYnH5gfryOkpo2f1QdbljjzhReJTflmY82+rd6NTZfRftFoxZwAcy
	tW0jjn2exYRZmYzvzO2qLRl/sc29R5ozlEUKfG1Dqo13Apr/FB4SgaFBfbnvUSG94daKIaGrAM7
	dQfZZGU/XIWBCKoL5KYsmbB165wa9LXhgocy0bT35HzuG5TY4lFkGKigquGIoInTVylFN7RrfjH
	0wYquiDv+btowxxewdk2nqcc+UAJUDoxkil605vBOQejXN7rkLKUeJbkYW6ql83Fn+sBN3R7WMG
	blR+pFKk2R7gO5bMWvFbAtmCIVrnUXcLZOS4hGAdtOh1zuAupcnTInyFF8IqdMSTewBoBdVQDXC
	2CQPFsIZKYOeRvYdKtZ/12/a3XM6JDzUB9m9A61gbSiHybO742xYjPdOXKNTfhB4MegtLUB/A5g
	UDNckuRUD7FWTZ1gzUDpd/
X-Google-Smtp-Source: AGHT+IFbTEDd0tDgCWfpUzX7d3KQYCRA8fou8NjdDwmZRR71rY4raU6CKiilA4b8HyfDtmg5bF09sQ==
X-Received: by 2002:a05:600c:4e86:b0:45d:da49:c47d with SMTP id 5b1f17b1804b1-471177c245bmr32622905e9.0.1760802728516;
        Sat, 18 Oct 2025 08:52:08 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.121.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715520d747sm58135015e9.14.2025.10.18.08.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 08:52:08 -0700 (PDT)
Message-ID: <1263c092-d4bc-4d8f-8ef8-2706d337f4c2@gmail.com>
Date: Sat, 18 Oct 2025 17:52:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: cpu_rmap.c Refactor allocation size calculation in
 kzalloc()
To: Shuah Khan <skhan@linuxfoundation.org>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org
References: <20250930092327.27848-1-mehdi.benhadjkhelifa@gmail.com>
 <10082c41-4302-4cb3-a2bf-788e59bad0c8@linuxfoundation.org>
 <84bf5902-b3e5-4d58-a2a7-f01e15cfe143@gmail.com>
 <bd60a8e5-f4df-4743-8b56-3d6127906ff2@linuxfoundation.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <bd60a8e5-f4df-4743-8b56-3d6127906ff2@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/25 6:00 PM, Shuah Khan wrote:
> On 10/9/25 09:16, Mehdi Ben Hadj Khelifa wrote:
>> On 10/7/25 11:23 PM, Shuah Khan wrote:
>>
>>>
>>> How did you find this problem and how did you test this change?
> 
> Bummer - you trimmed the code entirely from the thread. Next time
> leave it in for context for the discussion.
> 
Ah, I saw in other LKMLs that some do delete the code so I thought it 
was okay. We'll do next time.>> For the first part of your 
question,After simply referring to
>> deprecated documentation[1] which states the following:
> 
> Looks you forgot to add link to the deprecated documentation[1].
> It sounds like this is a potential problem without a reproducer.
> These types of problems made to a critical piece of code require
> substantial testing.
> 

Ack, This is the doc that I was referencing: 
https://docs.kernel.org/process/deprecated.html
I'm not sure what is exactly demanded in substantial testing.My guess 
was to do normal testing as I mentionned and add some fault injection to 
test the change in case of failure and also compare dmesg outputs.I have 
run selftests for the net subsystem too since my last mail with no sign 
of regression.Any suggestions on what testing for this case should look 
like instead or on top of what I did?>> 'For other calculations, please 
compose the use of the size_mul(),
>> size_add(), and size_sub() helpers'
>> Which is about dynamic calculations made inside of kzalloc() and 
>> kmalloc(). Specifically, the quoted part is talking about calculations 
>> which can't be simply divided into two parameters referring to the 
>> number of elements and size per element and in cases where we can't 
>> use struct_size() too.After that it was a matter of finding code where 
>> that could be the problem which is the case of the changed code.
>>
>> For the second part, As per any patch,I make a copy of all dmesg 
>> warnings errors critical messages,then I compile install and boot the 
>> new kernel then check if there is any change or regression in dmesg.
> 
> This is a basic boot test which isn't sufficient in this case.
> 
>> For this particular change, since it doesn't have any selftests 
>> because it's in utility library which in my case cpu_rmap is used in 
>> the networking subsystem, I did some fault injection with a custom 
>> module to test if in case of overflow it fails safely reporting the 
>> issue in dmesg which is catched by the __alloc_frozen_pages_noprof() 
>> function in mm/page_alloc.c and also return a NULL for rmap instead of 
>> wrapping to a smaller size.
> 
> Custom module testing doesn't test this change in a wider scope
> which is necessary when you are making changes such as these
> without a reproducer and a way to reproduce. How do you know
> this change doesn't introduce regressions?
> 
My custom module testing specifically tested the change in case of 
failure which is what the change is for in the first place.The change 
which deems to be simple in the documentation since we are just wrapping 
calculations instead of using operators,is just to safe guard 
calculations that are made inside of kzalloc() so that no unwanted 
behavior is produced i.e in case of overflow.As I mentionned above,I 
tested regressions by running selftests for net subsystem with it 
showing no regressions on top of fault injection mentionned.
I would like to have more guidance as to what I could do to have more 
robust testing in this case.> thanks,
> -- Shuah

Regards,
Mehdi Ben Hadj Khelifa
