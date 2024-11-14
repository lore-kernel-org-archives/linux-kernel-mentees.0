Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FD8175D4A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Nov 2024 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731604121; cv=none; b=kg8MagC+IgWSep/qZNe5DdIixyUQtneOoxT4lcoD5Y8i8XV3MxFlHRml5B164CXbDnXOmZC7YbpEkLEAr2b9ib5tUBKBjQ8bl4yt4Bo963aQUAWA9O9ha/pEnULr7lbD76mmuoU5aw5+WPpSu2a8Y0rHJA3bGkt3t3NhS9eb034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731604121; c=relaxed/simple;
	bh=yHELOSQhvvHp71OtVk5swb+nNSN0zFC0SuN+AIziXeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urrI2MLxIjZOAwwhR/PO60YuNIBY7Wa7gWe2+XhR9TTUNSJCxl3nySarbgGdAqaM0T4d07zLprf+j/SoSTr0qFwnByQn/yQF37xeo8Ynti7hriwD6sT/0ho9NmEr2LpDq57Gx95xvfPNMo/IVP6yluKDfKXpP3nB/lpJCIeMTdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DS/HKNXk; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DS/HKNXk"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-83e2d80ad51so31933239f.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Nov 2024 09:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731604117; x=1732208917; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytkqD9XI/BHqVrDHS/oEUwpMJruMLfeh9lCP9HUJDm8=;
        b=DS/HKNXkQmThMrODhlxn2fEGRg+81qRhWY2mRU10oPQTDHhdFXeYdN4nBGgGLkFmXY
         GBrx0Rb/sUq2pwKHLLWcEMUOnDxyBsAe+GJS+b1HeBuzK9qe6alRFgVDnsNzlcPfIQeM
         5VhdePd5jbnSguZO6wc40rAtPwlCFHQXFb3oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731604117; x=1732208917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytkqD9XI/BHqVrDHS/oEUwpMJruMLfeh9lCP9HUJDm8=;
        b=AXC4U9oExL0eJUm5uZ5K8MczMWgiYeUNpOAkxYRBMYIi2CRKXuN+WcNm1a19zoex9A
         4Pk/zecu+CXI07DDBIAn7zeXotpuh9ZaTUb9bRHj5JJe9UKs9buJ+xtl8SN6QyWYTmWn
         xsB6PlzEvi/oSq9az7GAGPwhsAuVTLzeNsdSOCcyIHOkybJG/+48cWiB40tpgeqSHFxL
         XLhKbk67erHErk1V9P1dRxAILWuw5bkAJcbT7lZqgNIM/mOgmjDA+7wM1+KxUBVos/kc
         F2cKyYRCT9zqqHgqKBqpBpEdPdraQT/mWOvuo4K+RAgvO4Lx3UEn8QjfboQBlZb5JydL
         JvQg==
X-Forwarded-Encrypted: i=1; AJvYcCXDDLqJzoPbX4fWGXiwfjEi7rz6E7WLCnFkxww1vjfdnCENWD7b5cGwfFbAq0hkPKwcdnti5+BYOhxvG56UKLcntUtCFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMRej0/EkGGJ4eChuwEzgPWkYi45l9TBzQqH1nH3r56TNKSOrk
	8Mzt/EF2ap3RF0DFNY9+yWz6VhSMqNsoJ/lYVwu857ImjJJIURQKlTPf7TMiekg=
X-Google-Smtp-Source: AGHT+IGUZJKnYN5ymfXEvQzdJKzRh/hKLacsxIQ6Yl6xQ9sfR7oYN33P5rDErUzL/+6dybCL0+GDgA==
X-Received: by 2002:a05:6602:641d:b0:83a:931a:13a0 with SMTP id ca18e2360f4ac-83e032e0050mr2741669239f.8.1731604117015;
        Thu, 14 Nov 2024 09:08:37 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83e6064901bsm35300239f.45.2024.11.14.09.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 09:08:35 -0800 (PST)
Message-ID: <196eaffe-c90b-4f44-a748-b786b46fd506@linuxfoundation.org>
Date: Thu, 14 Nov 2024 10:08:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: lsm: Refactor
 `flags_overset_lsm_set_self_attr` test
To: Casey Schaufler <casey@schaufler-ca.com>,
 Amit Vadhavana <av2082000@gmail.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, shuah@kernel.org
Cc: ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241112182810.24761-1-av2082000@gmail.com>
 <52cc8e51-9e85-465b-8ee3-63a7a0a42951@linuxfoundation.org>
 <c16b7517-e490-48d9-a2b6-f0077cbb0eba@schaufler-ca.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <c16b7517-e490-48d9-a2b6-f0077cbb0eba@schaufler-ca.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/24 09:55, Casey Schaufler wrote:
> 
> On 11/14/2024 8:25 AM, Shuah Khan wrote:
>> On 11/12/24 11:28, Amit Vadhavana wrote:
>>> - Remove unnecessary `tctx` variable, use `ctx` directly.
>>> - Simplified code with no functional changes.
>>>
>>
>> I would rephrase the short to simply say Remove unused variable,
>> as refactor implies more extensive changes than what this patch
>> is actually doing.
>>
>> Please write complete sentences instead of bullet points in the
>> change log.
>>
>> How did you find this problem? Do include the details on how
>> in the change log.
>>
>>> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
>>> ---
>>>    tools/testing/selftests/lsm/lsm_set_self_attr_test.c | 7 +++----
>>>    1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>>> b/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>>> index 66dec47e3ca3..732e89fe99c0 100644
>>> --- a/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>>> +++ b/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>>> @@ -56,16 +56,15 @@ TEST(flags_zero_lsm_set_self_attr)
>>>    TEST(flags_overset_lsm_set_self_attr)
>>>    {
>>>        const long page_size = sysconf(_SC_PAGESIZE);
>>> -    char *ctx = calloc(page_size, 1);
>>> +    struct lsm_ctx *ctx = calloc(page_size, 1);
>>
>> Why not name this tctx and avoid changes to the ASSERT_EQs
>> below?
> 
> In the realm of linux security modules ctx is short for "context".
> I used tctx here because I was lazy. It would be much better to
> drop tctx, even if it means a tiny bit more change.
> 

Makes sense.

Amit, you can ignore this comment about tctx and ctx. Please do fix
others about the change log and short log.

thanks,
-- Shuah

