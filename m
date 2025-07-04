Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F082C08AE
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Jul 2025 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627459; cv=none; b=pYjLKn7woCsiF5D8CNNYf0Ewm2D+4HuX50aLMXPy92n87VmxY+814SgCtwqn7uNYI+LFHmc3wRbcBWsgUVi92HFsiDxPryia4TmJQR8e1xYkKe39s2Dgr4cWW1L7iAqaKZw5cZkA4kNdePuLQOgw5XzF/2y/ZJ6DOgPCyKXoMZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627459; c=relaxed/simple;
	bh=SF8CYPTrOdy+j7O2eI2p8/yS2Z2CtPaSi47s5TwJido=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1RyGhc6oibMorZK6jMTdUIr09O+RpG/lLi8umpyJbIrliKJq7fShC2I7J4ldgQkwajJzgLjz/WvaOiKI0afvpC0PyzEJZDhR8bNyMXyeYuAYFXx3/JYbAbwwdcfPmW9Zl1YmbUk8+9xIuOvHhMgIoBHwIYOyl/9iZ6RJnOzl3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vk+wcRVM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vk+wcRVM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ab112dea41so393903f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 04 Jul 2025 04:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751627456; x=1752232256; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCPtwnOfQ6keZPy4LpTxW8EywDH7gbIh/lGbQNpkD4Y=;
        b=Vk+wcRVM7SwUO+VBPz7boMd0k4QAymmGo7vx2H9HWJ3v3ff9VDEWEtz6bQCE9ScSyS
         mReqGe47L2DbwsYTGt4qNlHTvOrNhWK07BKYW19xCB6kTNaqeGhCysk4NQk8cuvU3Od5
         rjU+XR1JXoyuAEhsLqyhB1gqBTXizJudotl0GVY69Sbxg2WWSKrTTsRydrtdtWZjB7K/
         oEQgALXtiLDlvKdwbim9lh9OvwI8T8lvoIK7iIVqnKRidVb53A4CkMlDFxlAlSqt4EGL
         WxliTkieNkgGD8Pk9sp0DbtSnZAMxJFwwHE8oPxb70r9J4Z8+pmqSBDVjcKq9ye03Gph
         DYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751627456; x=1752232256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCPtwnOfQ6keZPy4LpTxW8EywDH7gbIh/lGbQNpkD4Y=;
        b=YnCQ2ZYNup1A5qvagYeU9xi8pxQztfZV2j/TAoAlBZJcP0N1rfYOMoYn+O4DpweWU6
         fm8w5KzNJsuZO4G0SLjE0YhnnfrjjDFsRd9yJ9ScFGm9b8DeceCW+XopeFv4dxFpKfQT
         7ibTyBvEyt/9uL0UlIbmcfCmyOqK1naz5O/GIB+4PPQ3vKgvUS39hmW3Aw75J12j55sT
         dut32qbLtLSfqb8xzxQ1Ynciax+4YjTFFEeNs0HQFpoH7BPUpSsw+gKrrBEZjba+b9tY
         +sbQdrEJB6BDx2TD4uq36HS0c8cVEWAQKLcs8J1VejVGoaeyBSrCCXCpZc1H6C9ssqKb
         GBPA==
X-Forwarded-Encrypted: i=1; AJvYcCUNHQVkoRc9tL+l5BoSTQIoF4Zuhpg17MKTWmCUjfnpukQrm84XmM4UeLsCMoX28eltvzkJ8vfcMflpJpjm8YaD0bMjqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPVGDIrgpiFp2cnylUOjayFCO1TDiwPb9imD2veuBmNkBi/3l6
	Z9jMIGrOijqgfhce/SHSwaSvlSfr+QLWMLaIg7lmK5JV6Qw4s3An9XzH+2kjqM7iOYE=
X-Gm-Gg: ASbGncvC5nbejf+d9tWMxpxd8vRjrcIazt9GwOoWZBjFM9e798K5WwKpJXVUpRiShDm
	ROk3pD8i4A8ng0ByMJkqlgp+L8rSGlK77uYeQ/+mcNyVPVg82jqHibCzg4vQS5eQ4PDouHdgzzH
	MWfaaWeqQ0H74zT2l9Al5vZ9AkOthyh+NPuWfpqZfTYGdH3NczGGCcxPWN0o6O9k6+D6I6e0uPf
	YrzcFMLRlx4cFHN6Ui9Bh+wjfB5pxxhKblHFTTbsQdY1iZfh3hXexlfEImZkCHaSjS0yQuD6ONd
	3ZCp3J2iFQSSAn9iFqAqWIXTX0zxdTqpHbJ/C9XktBCjQsT+t/6v7QO5gzjyWJ5mauc=
X-Google-Smtp-Source: AGHT+IFUrRT4OwH5hTE+/EwaS0JQstvht/Nvd/yC+ncXVq5jOgWUtrHO2HEpZmkTrSJj963GBPh1Hw==
X-Received: by 2002:a05:6000:26ca:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3b4965fa43dmr1629767f8f.38.1751627455547;
        Fri, 04 Jul 2025 04:10:55 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97732sm2265248f8f.59.2025.07.04.04.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:10:55 -0700 (PDT)
Message-ID: <9c59d1b1-a483-49d9-b57a-c86e3e020234@linaro.org>
Date: Fri, 4 Jul 2025 12:10:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/x86: Replace strncpy() with memcpy() for vendor
 string
To: David Laight <david.laight.linux@gmail.com>,
 Usman Akinyemi <usmanakinyemi202@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
References: <20250618215843.109941-1-usmanakinyemi202@gmail.com>
 <20250704102007.6354ce9f@pumpkin>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250704102007.6354ce9f@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/2025 10:20 am, David Laight wrote:
> On Thu, 19 Jun 2025 03:28:43 +0530
> Usman Akinyemi <usmanakinyemi202@gmail.com> wrote:
> 
>> strncpy() is unsafe for fixed-size binary data as
>> it may not NUL-terminate and is deprecated for such

But memcpy doesn't null terminate after the 4 chars either so I don't 
think that's a good justification. Surely you don't want null 
termination, because char *vendor is supposed to be a single string 
without extra nulls in the middle. It specifically adds a null at the 
end of the function.

>> usage. Since we're copying raw CPUID register values,
>> memcpy() is the correct and safe choice.
>>

There should be a fixes: tag here if it actually fixes something. But in 
this use case strncpy seems to behave identically to memcpy so I don't 
think we should change it. Except maybe if b,c,d have NULLs in them then 
strncpy will give you uninitialized parts where memcpy won't. But that's 
not mentioned in the commit message and presumably it doesn't happen?

>> Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
>> ---
>>   tools/perf/arch/x86/util/header.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/perf/arch/x86/util/header.c b/tools/perf/arch/x86/util/header.c
>> index 412977f8aa83..43ba55627817 100644
>> --- a/tools/perf/arch/x86/util/header.c
>> +++ b/tools/perf/arch/x86/util/header.c
>> @@ -16,9 +16,9 @@ void get_cpuid_0(char *vendor, unsigned int *lvl)
>>   	unsigned int b, c, d;
>>   
>>   	cpuid(0, 0, lvl, &b, &c, &d);
>> -	strncpy(&vendor[0], (char *)(&b), 4);
>> -	strncpy(&vendor[4], (char *)(&d), 4);
>> -	strncpy(&vendor[8], (char *)(&c), 4);
>> +	memcpy(&vendor[0], (char *)(&b), 4);
>> +	memcpy(&vendor[4], (char *)(&d), 4);
>> +	memcpy(&vendor[8], (char *)(&c), 4);
> 
> Why not:
> 	cpuid(0, 0, lvl, (void *)vendor, (void *)(vendor + 8), (void *)(vendor + 4));
> 
> 
>>   	vendor[12] = '\0';
>>   }
>>   
> 

