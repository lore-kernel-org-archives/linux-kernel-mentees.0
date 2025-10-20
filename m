Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B92E2DCF5D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760992584; cv=none; b=Ex54jM+l+ebMOqFQ6QjS/IyxyPXLuKIXw8oDLtmVv3php73+larK8N0ZHcn2wO2bxk7Ds4U2ZCFdjQ3WmUCx2p96sFL6+NPAw6gdJbCNi6yUe2Vwvb++Oux7N/nTFPUXOoY5nvD63vt9UHCmM6crsOGufOlIyz7/VAlX/99RyXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760992584; c=relaxed/simple;
	bh=OHgpkAvmZ6yf/JhTQlBlLu0y0FUMUEE6N7YIxKfEsNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O/omR8taw9K5zbEsZcZ8YCx+tz/iKGwcFFZQc1qGbjwa6WsMHY8/OxVz8iIUezhScxr+freLRVR9J//oZRzGQ+4T2Er+ayZBVy+6Jkdzf9Ff/USInNg83pnOojxJudw8SMn5ac8MVKU6eyaHVKxJI4FZ1izYwodHkK4bkKyMbSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HMhXccsf; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HMhXccsf"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F31366163A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgK6GxSghdgM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 20:36:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31A8161637
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A8161637
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HMhXccsf
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 31A8161637
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 20:36:19 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-93e89a59d68so99638539f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 13:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760992579; x=1761597379; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crKMvRfwVH1JxtBHbx57zrx+BGBjZHigVkm8MVwMmQs=;
        b=HMhXccsfk3R7ITgfXftrc2Yj95DoUnjCERQFXOa1jI2xw1yMBxLhmC59C/WGosJS40
         HpcPiEyOTspm6q6YCZdaqoTwGTO28ee9z6LlcgwAD/jCwnO+y/vply4LhKDBrm26VlNC
         xgQ6fIcBW5arEq9ntDs4JRvbLhzr87FiM3HKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760992579; x=1761597379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=crKMvRfwVH1JxtBHbx57zrx+BGBjZHigVkm8MVwMmQs=;
        b=TCl+gJ/9z+QlYK7w58rLaQGO61PUT4pUzOHQAqnKe98La6HPAKFFVKeD6p0JTORNaK
         DMHEy5VFKauQbNgTOB4dVXdmEWg4B9JZy94yzkvgCierOiXfrucoNDBhznni1lOGJs2V
         AFA3uxC9QwGtZbZGEqQWA94QU5dn+AcKygGH1MH7qhLqq+0Lljg0MxTUmP9foir7/sP+
         aNN8g+hDu3R/sEmY6qqG7pRjCe2Uabqiq6QL7lmiaYqqG1JRnz8ZP6BdjDqI2AaGnZ3e
         ioGNgkmy5blnohwxjz6QCKJG6zNMx5nR8Lc103D5UieloPGERP182hi3YwhLKSIixcfR
         5hpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Romf0KteBs+2XVKUugeXWjgcPKyZKlT6GFyXW/1sM4UeSSexH9z7wrtg+IO0XtTu7nfPZlc3Ugkp4DD891MlzPThpg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxkCb2EYI7IxY5vLnnEqdf02XMShMgG4/3NhF976rq/e51naFae
	Uc6QfHfID0ijstIl0Yngdwe+X6LhgzE/pWsQnsbW3sR5+P09GhYVSRH0CvwFpLAEUY6vnA==
X-Gm-Gg: ASbGncstkWobFb9DRmi3ZG9cOgafFWAaFzTUoW5YfR+p+8qubKXD6jhwji9l2iAPdxQ
	mWWfr2Hu7V35Llmnk+7mf0rgzJMH3yhgKIcWczoZoBqXGGVHeMCpFNyWOKVhisOyc0FQVwa+j+l
	Z5s7omCt3AyXBphif1Cwbm2XmvPwONdSVewyZNJOzU5MSRiTjeApeqFeZuly80e9eW95MXXa60E
	pvo9donUw+Kd6okM8eQnW9wSKtccqDHAkoobkmlVn/6ypqXRyJHS8FhFfDZ5rXQRwrNppuEFJfJ
	O6p97kYEitRP2sbIML988dKfQneFoQpnzVcjDkK+Uyx7wNCe36/6PSv6BZsC7H74rVAGdanQhsP
	JMFOVVeq3kKclGTUvu8BjrCYA0n2MVTmhZxthI9k49IWVEKRi6EzFW39/OrzQCAMBjaJ565iV1L
	yh7gxkelD/hpoljWdh259uvOE=
X-Google-Smtp-Source: AGHT+IFw1THLnJLq7kXvJahTmoBARR7DHZ788vuoYVuwEu86BCjQmgI8bFvULKVG/FjqioZwQmTc0g==
X-Received: by 2002:a05:6e02:12c8:b0:430:a0f7:a5b1 with SMTP id e9e14a558f8ab-430c527eb4emr197839625ab.24.1760992578882;
        Mon, 20 Oct 2025 13:36:18 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3314106173.63.2025.10.20.13.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:36:18 -0700 (PDT)
Message-ID: <cabc6307-b5d1-488c-920d-0c66cedffb2e@linuxfoundation.org>
Date: Mon, 20 Oct 2025 14:36:17 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: cpu_rmap.c Refactor allocation size calculation in
 kzalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250930092327.27848-1-mehdi.benhadjkhelifa@gmail.com>
 <10082c41-4302-4cb3-a2bf-788e59bad0c8@linuxfoundation.org>
 <84bf5902-b3e5-4d58-a2a7-f01e15cfe143@gmail.com>
 <bd60a8e5-f4df-4743-8b56-3d6127906ff2@linuxfoundation.org>
 <1263c092-d4bc-4d8f-8ef8-2706d337f4c2@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <1263c092-d4bc-4d8f-8ef8-2706d337f4c2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/25 10:52, Mehdi Ben Hadj Khelifa wrote:
> On 10/10/25 6:00 PM, Shuah Khan wrote:
>> On 10/9/25 09:16, Mehdi Ben Hadj Khelifa wrote:
>>> On 10/7/25 11:23 PM, Shuah Khan wrote:
>>>
>>>>
>>>> How did you find this problem and how did you test this change?
>>
>> Bummer - you trimmed the code entirely from the thread. Next time
>> leave it in for context for the discussion.
>>
> Ah, I saw in other LKMLs that some do delete the code so I thought it was okay. We'll do next time.>> For the first part of your question,After simply referring to
>>> deprecated documentation[1] which states the following:
>>
>> Looks you forgot to add link to the deprecated documentation[1].
>> It sounds like this is a potential problem without a reproducer.
>> These types of problems made to a critical piece of code require
>> substantial testing.
>>
> 
> Ack, This is the doc that I was referencing: https://docs.kernel.org/process/deprecated.html
> I'm not sure what is exactly demanded in substantial testing.My guess was to do normal testing as I mentionned and add some fault injection to test the change in case of failure and also compare dmesg outputs.I have run selftests for the net subsystem too since my last mail with no sign of regression.Any suggestions on what testing for this case should look like instead or on top of what I did?>> 'For other calculations, please compose the use of the size_mul(),
>>> size_add(), and size_sub() helpers'
>>> Which is about dynamic calculations made inside of kzalloc() and kmalloc(). Specifically, the quoted part is talking about calculations which can't be simply divided into two parameters referring to the number of elements and size per element and in cases where we can't use struct_size() too.After that it was a matter of finding code where that could be the problem which is the case of the changed code.
>>>
>>> For the second part, As per any patch,I make a copy of all dmesg warnings errors critical messages,then I compile install and boot the new kernel then check if there is any change or regression in dmesg.
>>
>> This is a basic boot test which isn't sufficient in this case.
>>
>>> For this particular change, since it doesn't have any selftests because it's in utility library which in my case cpu_rmap is used in the networking subsystem, I did some fault injection with a custom module to test if in case of overflow it fails safely reporting the issue in dmesg which is catched by the __alloc_frozen_pages_noprof() function in mm/page_alloc.c and also return a NULL for rmap instead of wrapping to a smaller size.

Why not a write a test for this then?

>>
>> Custom module testing doesn't test this change in a wider scope
>> which is necessary when you are making changes such as these
>> without a reproducer and a way to reproduce. How do you know
>> this change doesn't introduce regressions?
>>
> My custom module testing specifically tested the change in case of failure which is what the change is for in the first place.The change which deems to be simple in the documentation since we are just wrapping calculations instead of using operators,is just to safe guard calculations that are made inside of kzalloc() so that no unwanted behavior is produced i.e in case of overflow.As I mentionned above,I tested regressions by running selftests for net subsystem with it showing no regressions on top of fault injection mentionned.
> I would like to have more guidance as to what I could do to have more robust testing in this case.> thanks,
So as you say this is a potential overflow, can you explain what
are the cases where you would run into this?

thanks,
-- Shuah

