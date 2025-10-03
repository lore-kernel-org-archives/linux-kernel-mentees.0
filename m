Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5132E92B4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759486978; cv=none; b=PWc4LuqlCOiCU54QDWpCizyiZ0COoQLzePQg+9lLoJLb4VfeOQJGgLoZzTSFGaV0hJqhQ2n8lI30j7OaCgnnXzaT27w3Lv8A99Azlg3vEd5epPFPYLSouM7Oe6ksjzdixgnW0zbQ56MjAYksLOttSElIzcyPMta+8+WJDOzEA+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759486978; c=relaxed/simple;
	bh=3xxXRyy3Jq92ZQAfd3xiufGuemMTntOY4GZPwSM1RdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/ua4tciK/y+V71hfUDZEHHCT15InGtofPBl1E1osd8J/6cGz45GyrbZBi4/ltmDmDj74ozRQxOPhGCFAjUe9Lt4nhWLpWJkKXz0BS5hFAaZ4XPy3j71lTN88ElVgVcEge/lDRrxA/FnZjgPqf2sRV/C0N2xOGzwQ8SnDc2K52I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpBTNhKj; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpBTNhKj"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9899740918
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 10:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVVKUG1Lv1S9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 10:22:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87D3540179
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87D3540179
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lpBTNhKj
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 87D3540179
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 10:22:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-46e38c21fafso3880465e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 03 Oct 2025 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759486973; x=1760091773; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EmsAJimqXkpHX/eRAgnIzY2He0pg7LXBAkhLwOqkjM=;
        b=lpBTNhKjKpKxXXMCtmIPII5z84kXERp46j3K1GydzDpmGUGffFeewM0rQNzIqjYZLa
         B2guurE2+vwFKG02nAJxQQGKp5uQegROIFtOrk0tg6eQOI9/jqAm7KiWqICwwVSqfihQ
         jj9M6uBJ+E38uuiTyHFlkcxZyTGUuVAn0vXNZFQshTpG4NzfAQYOyGZKLO5Icr5Et4zA
         vD7a8N8Ah40J5Gt+sryWTCCRlRaGRY/FTM64P4WUBhBrOyK2HWGxCN0e9Qa4K911K8zR
         tlYGArXGpb6H8aBdsL+gv6fE/kOGcPitvs+BqH4G6xM/8Np2tgElblP2JptdlMZwgR5m
         LBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759486973; x=1760091773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EmsAJimqXkpHX/eRAgnIzY2He0pg7LXBAkhLwOqkjM=;
        b=us0FiJV1K4ucTbsi7QmSRaW/WsHQoXxJzHCgW9YfZBS1816amkDUAJXrFM2d/Z3ImE
         nMMzgb4M1C+iQqYak71tVcyyK7Qhjm9ZcLBiPNiJ259XsVbjf7NeUCd5HEl01PjPSgFR
         +2/fY6dFzuCy8knrSf7oMZ88Yo3GA+1JGLDflMDlrhRgMfu0dJj06YDm6/3m4c+sY1zs
         UCMQGPniYyhbl4bMzcc/P+WtnQK5Btg25RHl2a5MXF8S5Z2uovHFmo9arrOiGy24A2TB
         PV2BvLcKtAfOrGtg4Jf7z1KmMIeWPClWTGj7BUwiIor/HgEQWUeAmo4XuWIWkA5VnUc+
         P2/A==
X-Forwarded-Encrypted: i=1; AJvYcCULyWrUpA2XySRRU5BBXCr8mJVEtOoSISzB15s0iDypnRr04T+T7AGF+4/TcuQCedXWwSIamyMXBcoM0f0oEeiOQk4Fdg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx5Fj6fDUXf6q1t3+2A2tMpLgYsrhKrcYnksrZ8Zgy4M6fxAy8Z
	sJSuujHvUq5IthcfjiGWB4I5w/YCOYr5iEL8lCC7bqwQBCKzLyO2pmpG
X-Gm-Gg: ASbGnctbMR6Xx+3u62cWC6SVH/x0uTHUWwRanjvnc9jJCH6Q916cAYe/A/HQTJcygMN
	bx5nzb7D0yIzxVqZiK/9zUbxbK53vEJPzwldq29s+VdrIUtwZUarsJuYIbQg8ts9zf9/rm6O+Dn
	gimEmpgnbnTU1ZREcUcbxaIShOhTmUCKZYmgMRUo370ExsKwerY8OuI7bvBRJf/ZzUTzHj46V1L
	ckT5tHJD3/UTmiH/goezc8ApAbt+8gyLlyE+HJ1OK4o/OIslyzAOaCjav+qvUVchabFCtIo+P6/
	Lwc+0ciWjvCggOZHitXDzeNcvJ8XVFmtAcG6UFQgT6C+SYgA1IlYN2c2ptc/U+felFtsoDIZTpq
	KkM2nMfzAe4EUdqabbx3vE0K98/TGmviJVrtd0o9aa09hWIztoWoBgfSnkbJnAwO8aTc4nxg=
X-Google-Smtp-Source: AGHT+IFt4JMwkbHAeDRH+Dl59b7w80xOYVWqcuo4WePcDsLt6VvfV3mFWwVaPjA3o9A7APxzKtcgQQ==
X-Received: by 2002:a05:600c:3b21:b0:46e:32d8:3f4f with SMTP id 5b1f17b1804b1-46e7115cf80mr8170935e9.8.1759486973128;
        Fri, 03 Oct 2025 03:22:53 -0700 (PDT)
Received: from [192.168.100.179] ([102.171.6.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723593d8sm27790825e9.11.2025.10.03.03.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 03:22:52 -0700 (PDT)
Message-ID: <870cb6c9-3bd5-4251-8c61-7327b8a6f9f9@gmail.com>
Date: Fri, 3 Oct 2025 11:23:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/bpf: Add -Wsign-compare C compilation flag
To: David Laight <david.laight.linux@gmail.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org,
 davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, linux@jordanrome.com,
 ameryhung@gmail.com, toke@redhat.com, houtao1@huawei.com,
 emil@etsalapatis.com, yatsenko@meta.com, isolodrai@meta.com,
 a.s.protopopov@gmail.com, dxu@dxuuu.xyz, memxor@gmail.com,
 vmalik@redhat.com, bigeasy@linutronix.de, tj@kernel.org,
 gregkh@linuxfoundation.org, paul@paul-moore.com,
 bboscaccy@linux.microsoft.com, James.Bottomley@HansenPartnership.com,
 mrpre@163.com, jakub@cloudflare.com, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, mptcp@lists.linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20250924162408.815137-1-mehdi.benhadjkhelifa@gmail.com>
 <20250926124555.009bfcd6@pumpkin>
 <e3a0d8ff-d03d-4854-bf04-8ff8265b0257@gmail.com>
 <20251002200047.2b9f9ef9@pumpkin>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <20251002200047.2b9f9ef9@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/25 8:00 PM, David Laight wrote:
> On Mon, 29 Sep 2025 17:03:29 +0100
> Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> wrote:
> 
>> On 9/26/25 12:45 PM, David Laight wrote:
>>> On Wed, 24 Sep 2025 17:23:49 +0100
>>> Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> wrote:
>>>    
>>>> -Change all the source files and the corresponding headers
>>>> to having matching sign comparisons.
>>
>> Hi david,
>> sorry for the late reply.
>>
>>> 'Fixing' -Wsign-compare by adding loads of casts doesn't seem right.
>>> The only real way is to change all the types to unsigned ones.
>> The last v3 did only do that with no casting as it was suggested by
>> David too.
>>
>>> Consider the following:
>>> 	int x = read(fd, buf, len);
>>> 	if (x < 0)
>>> 		return -1;
>>> 	if (x > sizeof (struct fubar))
>>> 		return -1;
>>> That will generate a 'sign-compare' error, but min(x, sizeof (struct fubar))
>>> doesn't generate an error because the compiler knows 'x' isn't negative.
>>
>>    Yes,-Wsign-compare does add errors with -Werror enabled in that case
>> and many other cases where the code is perfectly fine which is one of
>> it's drawbacks.
>> Also I though that because of GCC/Clang heuristics
>> sometimes min() suppress the warning not because that the compiler knows
>> that x isn't negative.I'm probably wrong here.
> 
> That sentence doesn't make sense.
> The statically_true() test in min() uses the 'value' tracking done by modern
> versions of gcc and clang.
> This means it can let signed types be promoted to unsigned ones because the
> compiler knows the value isn't negative.
> OTOH -Wsign-compare is a much older warning and is only based on the types.

Ah, I Understand now. Didn't know about value tracking in modern 
compilers before.
>>> A well known compiler also rejects:
>>> 	unsigned char a;
>>> 	unsigned int b;
>>> 	if (b > a)
>>> 		return;
>>> because 'a' is promoted to 'signed int' before it does the check.
>>
>> In my knowledge,compilers don't necessarily reject the above code by
>> default. Since -Wall in GCC includes -Wsign-compare but -Wall in clang
>> doesn't, doing -Wall -Werror for clang compiler won't trigger an error
>> in the case above not even a warning.My changes are to make those
>> comparisons produce an error since the -Werror flag is already enabled
>> in the Makefile.
> 
> This isn't about whether -Wsign-compare is enabled or not (or even what
> the option is called).
> It is about whether the compiler's 'sign-compare' warning triggers for that code.
> The one that detects the warning/error isn't gcc or clang but is probably
> used far more than clang.
> 
Yes, -Wsign-compare will trigger a warning for that code. And an error 
if -Werror is enabled. And also yes, tools like sparse which I think is 
what you are referring to here would catch that warning as well.

>>
>>> So until the compilers start looking at the known domain of the value
>>> (not just the type) I enabling -Wsign-compare' is pretty pointless.
>>
>> I agree that enabling -Wsign-compare is pretty noisy. But it does have
>> some usefulness. Take for example this code:
>> 	int n = -5;
>> 	for (unsigned i = 0; i < n; i++) {
>>       	// ...
>> 	}
>> Since this is valid code by the compiler, it will allow it but n here is
>> promoted to an unsigned which converts -5 to being 4294967291 thus
>> making the loop run more than what was desired.of course,here the
>> example is much easy to follow and variables are very well set but the
>> point is that these could cause issues when hidden inside a lot of macro
>> code.
> 
> There is plenty of broken code out there.
> It isn't hard to find places where explicit casts make things worse.
> The problem is that, even for the above example, the -5 could come from
> way earlier up the code.
> If you 'fix' the warning by changing it to 'i < (unsigned)n' the code is
> still just as likely to be buggy.

Yes,But we aren't changing a buggy code. We are changing normal running 
code for the sake of future code to not have those bugs which wouldn't 
cause any issue (espacially when only changing variable types and not 
casting like in my V3 of this patch[1]).

> 
>>
>>> As a matter of interest did you actually find any bugs?
>>
>> No,I have not found any bug related to the current state of code in bpf
>> selftests but It works as a prevention mechanism for future bugs.Rather
>> than wait until something breaks in future code.
> 
> That's what I expected...
> 
I'm by no means trying to fix buggy code.Although I searched for bugs 
when changing before and after and found none. But as I said the patch 
is to prevent future bugs from occurring.
You think I should abort working on this since the benefit is minimal?
Regards,
Mehdi>>> 	David
>>>    
>>
>> Thank you for your time David.I would appreciate if you suggest on how I
>> can have a useful patch on this or if I should drop this.
>> Best Regards,
>> Mehdi
>>>    
>>>>
>>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>>> ---
>>>> As suggested by the TODO, -Wsign-compare was added to the C compilation
>>>> flags for the selftests/bpf/Makefile and all corresponding files in
>>>> selftests and a single file under tools/lib/bpf/usdt.bpf.h have been
>>>> carefully changed to account for correct sign comparisons either by
>>>> explicit casting or changing the variable type.Only local variables
>>>> and variables which are in limited scope have been changed in cases
>>>> where it doesn't break the code.Other struct variables or global ones
>>>> have left untouched to avoid other conflicts and opted to explicit
>>>> casting in this case.This change will help avoid implicit type
>>>> conversions and have predictable behavior.
>>>>
>>>> I have already compiled all bpf tests with no errors as well as the
>>>> kernel and have ran all the selftests with no obvious side effects.
>>>> I would like to know if it's more convinient to have all changes as
>>>> a single patch like here or if it needs to be divided in some way
>>>> and sent as a patch series.
>>>>
>>>> Best Regards,
>>>> Mehdi Ben Hadj Khelifa
>>> ...
>>
> 

