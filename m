Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD7613D245
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726157291; cv=none; b=nuBXVsBZbdS69qC5BPMZn801nEOCXeiZgKakT41MX3APh0IELNj6QOIT5c0c/T8iauFwhC6ZlzDnYdhmbESyfRjsq8mfi5s+sala7ufghCWHym4S3iO2jOdfIkC1HyP1FfvzHx3R+vgCpYdxzh7gEBUkMrfMLh+7210jg9zUNM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726157291; c=relaxed/simple;
	bh=jlDv07f0uJH2tvHJ8Q3I14k6ePq27Cv6MvyBrLPvYKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BH2/loXxaeCo01ucI/VnDgjc7UadedYUf3c8xprKY2KkGHKsf+EPSeZpIY/96Ua7Wi4JsSlWoi3ldBcru5FroEcBkc+PNw7V6eMOWFAaUB9haiCo746vUx9CUhUdHQQlTMc/CpbH4Ska4iMFHtPXCCOQ1NkP66bLJmyv2hOFpHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HGG1djDt; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HGG1djDt"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A183406FC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 16:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kldxjfx1Rs89 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 16:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 734B3406FB
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734B3406FB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HGG1djDt
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 734B3406FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 16:08:07 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3e049185cfeso456045b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726157286; x=1726762086; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NI7OEbpTh45hhxXq/OOmTMo70izGjSuZNxMT6AI6//o=;
        b=HGG1djDtAKeeNK0taFJBW4dgpR1Nu9TrKTDRMGSd/8QojRbMWBgf3YGm350q3JoLzn
         03GC4tN2YTmQtqBVcULG+P2hUO7+zp6M9XsLrbLIwwdTsYEFau2wvHTyuf5xjpyL/Bz+
         QyfmCZfBbzzq557tyPoiu4VUbx8Xje+UIjlWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157286; x=1726762086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NI7OEbpTh45hhxXq/OOmTMo70izGjSuZNxMT6AI6//o=;
        b=SvQKYLpbb7v903lFywHvcg9odgwkZxa3hz9drTUroRt+qd4t4TIh2n52HkIYFmLoES
         ODTrQ/QXHg1dIE1A73XEIEHkID8PZPtH35kYl1PZz38NvZEEH/hh58//LNupnA7rD6rE
         yt4+fsATGK8RLQCadCF3O6FhN5UXc+WGtq17hu0ziar1SrDcRP946aNSadcjRGZUp2DG
         xfZx6nZ6xueDdUMl+XG/nkQ7Gpk/X+o1yNGurEwADoIEb6Z3GTVSTkYdC9UcwHTGbnrj
         DA85PrqUk5Mya0reWolbvru1AR1l5sF16q7cnN3zK+XuXOhStdjMzpeqUrSctwd8wM9N
         UhZA==
X-Forwarded-Encrypted: i=1; AJvYcCWjEuWCsxu3sitZNT/hPQrEwk5yJOtTls8oHEdIAlFEsZGx6hHNLogfl4LiqNhHUyMPOJGXPCGOcVib3DU1ttv0yzSxYw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxnxKSVpvpF5pEctMrXzHBCRDULJp7QnWNmvNod3vOfGLfyKHRK
	4RmRVznYad7fU3Pn0ZxQ9MEOwzSOElPsI9D0nMYJ5+Gxa3QQThQe/NTh1f317nwflg==
X-Google-Smtp-Source: AGHT+IEeDlnxBgeSMcMWoxZbKQaLPEEou9RlVyGheJGyi3fFx2gRYmz9PmkXaDTlKl5PVSGqX4pVSg==
X-Received: by 2002:a05:6808:2021:b0:3e0:6fd2:b7d with SMTP id 5614622812f47-3e071aab5bamr1978744b6e.22.1726157286408;
        Thu, 12 Sep 2024 09:08:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d35f948ecdsm658153173.163.2024.09.12.09.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 09:08:05 -0700 (PDT)
Message-ID: <b207948f-c8e8-4291-bb27-de3b6fa10e04@linuxfoundation.org>
Date: Thu, 12 Sep 2024 10:08:05 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] lib/math: Add int_pow test suite
To: David Gow <davidgow@google.com>,
 Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: brendan.higgins@linux.dev, rmoar@google.com,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240910011036.15117-1-luis.hernandez093@gmail.com>
 <CABVgOSmpS4GN-iskm2DzebkxF-vcA3iJuba3YnicdNYwy+8mbQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CABVgOSmpS4GN-iskm2DzebkxF-vcA3iJuba3YnicdNYwy+8mbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/24 22:33, David Gow wrote:
> On Tue, 10 Sept 2024 at 09:10, Luis Felipe Hernandez
> <luis.hernandez093@gmail.com> wrote:
>>
>> Adds test suite for integer based power function.

It would be nice to see more details on what this test does>
What's the output look like?

I fixed it up with the details from the Kconfig. Please do make sure
to add test details in the commit long in the future.

There was a trailing whitespace I had to fix. Run checkpatch to verify
that there are no issues with the patch in future.

>>
>> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
>> ---
>> Changes in v5:
>>    - Fix kernel test bot warning
>>    - Rebase with latest
>> Changes in v4:
>>    - Address checkpatch warning and make kconfig description longer
>>    - Use GPL-2.0-only for consistency
>>    - Spelling fix fith -> fifth
>> Changes in v3:
>>    - Fix compiler warning: explicitly define constant as unsigned int
>>    - Add changes in patch revisions
>> Changes in v2:
>>    - Address review feedback
>>    - Add kconfig entry
>>    - Use correct dir and file convention for KUnit
>>    - Fix typo
>>    - Remove unused static_stub header
>>    - Refactor test suite to use paramerterized test cases
>>    - Add close to max allowable value to in large_result test case
>>    - Add test case with non-power of two exponent
>>    - Fix module license
>> ---
> 
> Looks good to me, thanks!
> 
> Reviewed-by: David Gow <davidgow@google.com>
> 
> Cheers,
> -- David

thanks,
-- Shuah
