Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2726B18EAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Oct 2025 17:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760115661; cv=none; b=pr5vBQdXe029UQGl9YnxtVXwRASx9QqGFZehdJ3sEB+RcASfpSHdPSqM2gJ4b4m4FrU4Dsl2OMd0ATTkEwEOSuHGgNRBeTp1IACwcEfRr/Hmg7ZhiimhZ8pw2IXXvxszyyIbtBhRFU7Un0S6a4XSjj2zEQv+mDDL7Dz7XruBbwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760115661; c=relaxed/simple;
	bh=EYyHZi7lJwHBaK15OLYLE1MUoZnPM2C96io0qfOoKwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LnJfhhN8DZ5fBmImfBqXqqywsVvzP24pUgYZrxf4An3VKX6CkjS2fR3lLF2jgYLn7zxnSD5+BOAZfVVpPoUVYCUojhqdoBT0HAmyo2whxeUjRfBhoP2D97yM6i/z5v12nLUrTLT9Qmu0/KXOUcG91hdfdJwr4cp9ajCu80VFNc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=STsvGrqc; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="STsvGrqc"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5A66605EB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Oct 2025 17:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKWa5c8AixsL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Oct 2025 17:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1BC9605E8
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1BC9605E8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=STsvGrqc
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D1BC9605E8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Oct 2025 17:00:58 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-930a6c601b3so223285539f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Oct 2025 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760115657; x=1760720457; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZn78b0wyDjiwHnWB67MhXOFvbYgRHJbgZQPwFHCBKo=;
        b=STsvGrqcpqs5oontch0C23mdR3oCgUO1+/TUBtkadBJCvOgsKx232+LWLWMth/PYZC
         Flw2opW/elqTPg9+/QtTHnRZoi2FqXIq4f/FT7P8LXqjdrYM7+YZMvK95ezi6knwHhOk
         4UbRydwg03ascX/kf1/xhxkmYIzk0RkV/U/uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760115657; x=1760720457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZn78b0wyDjiwHnWB67MhXOFvbYgRHJbgZQPwFHCBKo=;
        b=YfQ3bKRwqymbJka73OyaD09lubJSo05EttMhH6LirxPxAw/GU4+ACm1RX1wpLNVqNh
         ndVX0czYmC1z382wtwdhfF9uXH3RKZlyEaRv0esqOr/6NGs1mefaqs1WwjGIpV9pTo17
         YRavKSQBH0J6yrrV0sYcDuh6V0ysZ3mwR+OL4O68byeGSHfjiSAVSRqlNToEWKB+15c2
         1whiCPEXU3m3HHa6OXbsNP4RZaG+xChsxudrgOLA5hjx3bYdqU88NsU8Cao+NBsOly4Q
         aX7CuNq9GMl/7pmdHYrP4wCfUHXTuqAtGO08jPLdHEKKwf3TGwoQWGiOx1mFvsx/1v1z
         BN6A==
X-Forwarded-Encrypted: i=1; AJvYcCXD1gNFY0eyFznanV7ZEjgsRR/scpJiKUy8xioPpllThCSLYpgbjMiv38pvT4cCsPo9rEZqP7ZsSqh026MDsYWAs/o0lw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywq/N6gE7SeC8SU34bb4kJdIzfPxUugI5Q7Jm1h32Vx+0pXMDvF
	69N8tywf9OOWrxIsOKgP4v2zEdughXPLb55Oqku9vODFgB2U1YTgdgPr40nfIZgxF6UwMA==
X-Gm-Gg: ASbGnctK32umUZS4oGAzAiRm+RoidyahFePOrd6Qcm8tydTm3lph1tcY0tCZBCwSYTO
	8+cYjQtCnnSuPdTcwetSUJE3qeWvtR2UltdowVNYNA1cwUzdkM7MBzhN3PzoVNxqVxoSbcjH+Nm
	UYCesUPCXu7z4NTgaibfWkeuCycGFUEdmAQNlRnXQA289LnIVN/h0QRHc/IsphzP7FSAzd5Hu4N
	Pz8IO4qQjiRwOzwNZ/b1EKUbtcp1vjDRUrd7pYeJ9c64JislrxGf7vA5aWxzWkUevpLPgzphKeD
	IrWSjYetdgZ+G0oRTYO1mO/jAQoiG4rSBezQdrKVee0SB2vDBWmukGUluy84jpB+7miaVQB/n+7
	pSUV3Mg2HWCrzypmJjupf8qquHVa02HhkXkLwB2x0ZX0tCeO0l3LNCA==
X-Google-Smtp-Source: AGHT+IHPmVcN5C+66P07fmSeMZl3tP1046j5NJ9TkQM499GvnLbyfyBXHwVz+boWgvfT6iEAzYzEcQ==
X-Received: by 2002:a05:6602:1410:b0:884:1e28:904e with SMTP id ca18e2360f4ac-93bd19712b3mr1401822139f.12.1760115655891;
        Fri, 10 Oct 2025 10:00:55 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f7200b0a4sm1016355173.38.2025.10.10.10.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 10:00:55 -0700 (PDT)
Message-ID: <bd60a8e5-f4df-4743-8b56-3d6127906ff2@linuxfoundation.org>
Date: Fri, 10 Oct 2025 11:00:53 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <84bf5902-b3e5-4d58-a2a7-f01e15cfe143@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/25 09:16, Mehdi Ben Hadj Khelifa wrote:
> On 10/7/25 11:23 PM, Shuah Khan wrote:
> 
>>
>> How did you find this problem and how did you test this change?

Bummer - you trimmed the code entirely from the thread. Next time
leave it in for context for the discussion.

> For the first part of your question,After simply referring to deprecated documentation[1] which states the following:

Looks you forgot to add link to the deprecated documentation[1].
It sounds like this is a potential problem without a reproducer.
These types of problems made to a critical piece of code require
substantial testing.

> 'For other calculations, please compose the use of the size_mul(), size_add(), and size_sub() helpers'
> Which is about dynamic calculations made inside of kzalloc() and kmalloc(). Specifically, the quoted part is talking about calculations which can't be simply divided into two parameters referring to the number of elements and size per element and in cases where we can't use struct_size() too.After that it was a matter of finding code where that could be the problem which is the case of the changed code.
> 
> For the second part, As per any patch,I make a copy of all dmesg warnings errors critical messages,then I compile install and boot the new kernel then check if there is any change or regression in dmesg.

This is a basic boot test which isn't sufficient in this case.

> For this particular change, since it doesn't have any selftests because it's in utility library which in my case cpu_rmap is used in the networking subsystem, I did some fault injection with a custom module to test if in case of overflow it fails safely reporting the issue in dmesg which is catched by the __alloc_frozen_pages_noprof() function in mm/page_alloc.c and also return a NULL for rmap instead of wrapping to a smaller size.

Custom module testing doesn't test this change in a wider scope
which is necessary when you are making changes such as these
without a reproducer and a way to reproduce. How do you know
this change doesn't introduce regressions?

thanks,
-- Shuah
