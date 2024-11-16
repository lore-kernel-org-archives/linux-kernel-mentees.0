Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E921078F
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 Nov 2024 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731770745; cv=none; b=M+QsmSeN23mZXpT5WmvSf8b3XkkIegARE8HAcE84JrFNltfkbf3CFALn4peciL0CuRnn1FZ5vXRcadETnFlT2L1mKoccqH6yNjDgWYybcANUdqxGepcDARGb8dHNsnQM3cTLvmEs4MW8xB6gl3rl3uEUN8FKA8i5s26/bp8439A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731770745; c=relaxed/simple;
	bh=obrV/0cQ9hJsrorEohHeNXHw27ku/AAp2n6zkeNlkYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAwAkq/0YZwd2jKrXCylZhoAOdVIA4zLIz1SOljhd6mwMJZpqFVXkraHvLKGAZkufgvFqeGm3XkALvC97OJMFj2ihrzV0QeOnv0dfVLo0zJayK42yx3iMzZEJo7w9wIECS/Nj/9PGWspWn8fdjECGd65qpxm5xF1oT7iVy5x+f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AedB3V2u; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AedB3V2u"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ea2dd09971so770142a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 Nov 2024 07:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731770743; x=1732375543; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDjoxcHWQzlcTPxRMAEqKxDEdflI9umWnb9NkBm5LqA=;
        b=AedB3V2uPp8ZLdbVE7MY2LXqyypPnPy34hK8ZiufY3QZPzSSIyWAZ4e74yyxGtNGfQ
         C0nQwaJg2pr0m9mCcTHGT2C/k9ejCfrdZ5JOTQ3I1xeQ+NN8hIJlMfmVulNH6THOP07r
         JmvTS8zLpReVuMcBS1O7yW0CeChv3dG+E+rZeTRpS30KPn6T0LbxQEAWkTtcflEre3Wv
         fIfFzKjLeJgIGadN/z6yUHh/68116sYsuUlSqFuHaYEdLqC/pn5Tv61eA32pDZU0V0GP
         MP/6Vq5BxEetHj3RxSeVjbgOWrmY/Dg2xOwy7jY6VgpSq3jOPKgwdi6DBEAY+0abpaV2
         FRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731770743; x=1732375543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDjoxcHWQzlcTPxRMAEqKxDEdflI9umWnb9NkBm5LqA=;
        b=obWkc0/u++aMQhNwa1XRIeGpzkKQnTfYasivJ/vJvWDM7D0GP6U/gFqkHMzjYj7Yhu
         ggL00QMxSfMrOjtt31f3obyER6W9+0ooQV8rlAOYZZav7S639Ld6kZ10DIZyh0r8Qt9w
         Wo4Hn+o4+9weXfAD+oGbtmqitLUVYWOcwOOecwkx1xlpbqLL0/Mh0FLfcTrHk3RBnS9O
         43hwvmAkph5U/wJWPu+PTKuZ/8teYg+mF/uV08VlNV5wO5HcL+m/tEQzCL5bSxlnfeuq
         bZRD0eu1y5lhLJ/EBhmJSJx7uWCzYpjFiTq87E60VOOQanGHST4ybWUtEZ9VxFuF+b0m
         j1/A==
X-Forwarded-Encrypted: i=1; AJvYcCX2vJbF9SOn0hs9JP8hbbUgIDri5WO0Bm4GFt8jGzK1M+rcfewlUG5ggZcVrlNI55ghwFj+t3QpbDCAefN0uBlwTBPrAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqJThRG9lBxHGcvczoHwyLDPwkW9LWMU5DG+E+ntqXkoAA35ru
	amfEdsUVk4q8rNqC0OxNq9wPY08FHSINz7rSd7NEG6YA8ff0qlYA
X-Google-Smtp-Source: AGHT+IGw4VfASD8aKJiavcRypK0mXbkTJDydc3lHd+ZsM1SsGgcBaeyg/h+UixlVWuHLWUdJK7FU7Q==
X-Received: by 2002:a17:90b:2494:b0:2ea:356f:51a6 with SMTP id 98e67ed59e1d1-2ea356f54a1mr3572540a91.14.1731770743219;
        Sat, 16 Nov 2024 07:25:43 -0800 (PST)
Received: from ?IPV6:2409:40c1:0:e383:932c:79f0:2381:e2d3? ([2409:40c1:0:e383:932c:79f0:2381:e2d3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea02481b6bsm4727260a91.8.2024.11.16.07.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:25:42 -0800 (PST)
Message-ID: <4a72bea1-da58-438f-b03e-e79bd4011f64@gmail.com>
Date: Sat, 16 Nov 2024 20:55:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: lsm: Refactor
 `flags_overset_lsm_set_self_attr` test
To: Shuah Khan <skhan@linuxfoundation.org>,
 Casey Schaufler <casey@schaufler-ca.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, shuah@kernel.org
Cc: ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241112182810.24761-1-av2082000@gmail.com>
 <52cc8e51-9e85-465b-8ee3-63a7a0a42951@linuxfoundation.org>
 <c16b7517-e490-48d9-a2b6-f0077cbb0eba@schaufler-ca.com>
 <196eaffe-c90b-4f44-a748-b786b46fd506@linuxfoundation.org>
Content-Language: en-US
From: Amit <av2082000@gmail.com>
In-Reply-To: <196eaffe-c90b-4f44-a748-b786b46fd506@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/11/24 10:38 pm, Shuah Khan wrote:
> On 11/14/24 09:55, Casey Schaufler wrote:
>>
>> On 11/14/2024 8:25 AM, Shuah Khan wrote:
>>> On 11/12/24 11:28, Amit Vadhavana wrote:
>>>> - Remove unnecessary `tctx` variable, use `ctx` directly.
>>>> - Simplified code with no functional changes.
>>>>
>>>
>>> I would rephrase the short to simply say Remove unused variable,
>>> as refactor implies more extensive changes than what this patch
>>> is actually doing.
>>>
>>> Please write complete sentences instead of bullet points in the
>>> change log.
V2: https://lore.kernel.org/all/20241116152136.10635-1-av2082000@gmail.com/
>>> >>> How did you find this problem? Do include the details on how
>>> in the change log.
While exploring the kselftest framework. I found the this problem.
>>>
>>>> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
>>>> ---
>>>>    tools/testing/selftests/lsm/lsm_set_self_attr_test.c | 7 +++----
>>>>    1 file changed, 3 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>>>> b/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>>>> index 66dec47e3ca3..732e89fe99c0 100644
>>>> --- a/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>>>> +++ b/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
>>>> @@ -56,16 +56,15 @@ TEST(flags_zero_lsm_set_self_attr)
>>>>    TEST(flags_overset_lsm_set_self_attr)
>>>>    {
>>>>        const long page_size = sysconf(_SC_PAGESIZE);
>>>> -    char *ctx = calloc(page_size, 1);
>>>> +    struct lsm_ctx *ctx = calloc(page_size, 1);
>>>
>>> Why not name this tctx and avoid changes to the ASSERT_EQs
>>> below?
>>
>> In the realm of linux security modules ctx is short for "context".
>> I used tctx here because I was lazy. It would be much better to
>> drop tctx, even if it means a tiny bit more change.
>>
> 
> Makes sense.
> 
> Amit, you can ignore this comment about tctx and ctx. Please do fix
> others about the change log and short log.
> 
> thanks,
> -- Shuah
> 

-- 
Thanks,
Amit V.
