Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C713698E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 02:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730427966; cv=none; b=ZO0fyaueYaXdubTf3pgDxX4Wwlj+FUG7qaFUJiw0MHrD985cLgY92yuoX65CV7HGIurGtBvtEs6bpfWcGASKQd8ICAvHdrXSMEA4wcSFr3KLKwf2F0xQ7aaNx5I9z5pT4vCRxAKp6EU9FdmUwaICzrMoSEGG91CNuosRfkhqPmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730427966; c=relaxed/simple;
	bh=isrbn6EYcEzs5iUMEs7MLuxGYggTLZ3mlD/ARBA2Q60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOw+m0LN2ZRWw5v1STxfz7OL70GsBM69TVaGrdjsKkumQvINWgnrgJE742xHc3yJGij3qX32f+F2hm5ubUj2EQnLTnQAK2IMbNKW/SlZRze0rv2j/E9IPYrzxjEtZO9XEmLqtopXtvhql799e+akEdUrmEycLH/k+opO5tdh64U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TPqUcTBS; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TPqUcTBS"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8BD240142
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 02:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqRm9E2eBv0P for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Nov 2024 02:25:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8393F400B9
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8393F400B9
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=TPqUcTBS
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8393F400B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  1 Nov 2024 02:25:59 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-83aacecc8efso78537539f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 31 Oct 2024 19:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730427958; x=1731032758; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D9PP5OUZKSxt9w/+Lhs2fVip8LzoowBW6uYRcN2k+fA=;
        b=TPqUcTBS55npPlZU059l7C8as179FdytoQ0pECGv9SPwkytn1Ntzcvv/LDzuYcUg1K
         u7aSfrch2cCcWlmGIX7cJ3HQA1EFGUaEsZIgOfgQfyJHKuj6E7O0NidhKfmjaGUYnBIM
         sK6VEXbLaNuXg/xUtsWD1IRQWOb8rfK7kiwn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730427958; x=1731032758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D9PP5OUZKSxt9w/+Lhs2fVip8LzoowBW6uYRcN2k+fA=;
        b=nlhhj9lK6Yl8h/dkNvuxI/0OCJ+13rMepM2gAVn2HhhuZ+djzZPXDaDjqb/w/m6Rrm
         uJ2tyUfwRMEDVS6dQUGgnn/aUddpnw5hfsOovL+u5VnKXVBi4qlkcEdp/PRZK9KIv1p+
         8wFZcDyJaBMMUDWhlP/OmwSDj5FvItqyLPX0hrGqyu27zwAks5zYmwf92uVxE6A06omQ
         L1FhYSDNyo6jU9ZK41VcvGWlgvxrq5T3SIQGy9Is1wGYmXx2HGgILx/dRCICZ1QFVO0e
         OqxG8h02p1XmaN/X7PPdmU1HYAhagmYLVW3TNNZ93vWD9lPGgp63DaBc2CA8O3lAsN3/
         0LQw==
X-Forwarded-Encrypted: i=1; AJvYcCX9U2h3SUUpp2ZMByog7Fh6AHGLpi5eq50d1ZWrCLPsyWRXZ19TUZhEgHk0FQ81Iv1kT9bNF1qQElhMr2Ixm6qnqpvtHw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxZIXOleJvT8hnI5wXDJJtUSURikAulUi9QBZW7+rYu2T85c+SI
	sNsvsq/OzyB4Ae03SijErszUP4KvZrNiGIzLqHuMdpDI7xcslGfyroogvgWjcwqt+g==
X-Google-Smtp-Source: AGHT+IGbzrRisQU8oq/lZylfKAV7nYtIg3h5+eZKf3TwSBnm5JaztVcEX6HAUF2Byk6mTF3PQf2MpA==
X-Received: by 2002:a05:6602:3355:b0:83a:ab58:a84d with SMTP id ca18e2360f4ac-83b71370717mr147537439f.8.1730427958408;
        Thu, 31 Oct 2024 19:25:58 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de04978461sm546663173.107.2024.10.31.19.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 19:25:57 -0700 (PDT)
Message-ID: <388a8b6c-1acf-413c-bbf4-3b23156117f8@linuxfoundation.org>
Date: Thu, 31 Oct 2024 20:25:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] lib/math: Add int_sqrt test suite
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
 brendan.higgins@linux.dev, davidgow@google.com,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 ricardo@marliere.net, linux-kernel-mentees@lists.linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20241030134355.14294-1-luis.hernandez093@gmail.com>
 <c213dbcb-35de-4afd-9d4b-f42f6a9e3de6@linuxfoundation.org>
 <20241031173941.3487ccbfd7421d81d9b0cb97@linux-foundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241031173941.3487ccbfd7421d81d9b0cb97@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/24 18:39, Andrew Morton wrote:
> On Thu, 31 Oct 2024 11:50:16 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>> On 10/30/24 07:43, Luis Felipe Hernandez wrote:
>>> Adds test suite for integer based square root function.
>>>
>>> The test suite is designed to verify the correctness of the int_sqrt()
>>> math library function.
>>>
>>> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
>>> ---
>>> Changes in v2
>>>     - Add new line at the end of int_sqrt_kunit.c
>>>     - Add explicit header includes for MODULE_* macros, strscpy, and ULONG_MAX
>>>
>>> Changes in v3
>>>     - Remove unnecesary new line after Kconfig entry for INT_SQRT_KUNIT_TEST
>>>     - Correct int_sqrt instances with int_sqrt() in commit message and kconfig
>>> entry desc
>>>     - Fix limits.h header include path
>>
>> Adding Andrew to the thread.
> 
> Thanks.
> 
>> I think this depends on the other lib kunit
>> content that is already in next.
> 
> Actually the patch applies cleanly to 6.12-rc5.
> 
>>> --- a/lib/math/Makefile
>>> +++ b/lib/math/Makefile
>>> @@ -9,3 +9,4 @@ obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
>>>    obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
>>>    obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
>>>    obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
>>> +obj-y  += tests/
> 
> What's this change about?  It seems somewhat unrelated to adding a
> single test.  I mean, there's an unrelated test listed in
> lib/math/tests/Makefile so what change does this patch have upon that
> one?
> 

I think this is a new test. I can take this for 6.13-rc1

I thought the conflicts might persist in case you have any 6.13 material
already in linux-next. Doesn't look like it if you could apply to 6.12-rc5

Sorry for the confusion.  I can take this for 6.13-rc1

thanks,
-- Shuah
