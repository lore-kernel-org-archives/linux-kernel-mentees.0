Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6171E3DD7
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Jun 2025 14:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084700; cv=none; b=HBu+UG/QpWKxqQpPXkTAOuQgeo8+dBUF88AqaTJqLXOsK04lY6d4rDu+XbHSq/q6MH5aR4L9XGaVzrfiTWRRGZHJMfLog2o7ply8gcX+pAIL/EzNa5Am7ghtii1mQthkclgAz5TlrLmDZblLw2OYBzrgDfLt2uMBKCSWPVgFhAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084700; c=relaxed/simple;
	bh=UXaABHQD22K9FyO8R9mM3dQFCxIl3GBYZjPUSbcMKwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R08tBetxVZzmB3IMiY2W0f2Vcsw/qfdXS0CRfH1nQjJxYamqfUcu35zr4WxUW32p4gn1o+d3EU5SLKXmWq2Z6uJkpJ5oL+Iml5guPESzKIWc/cdzGJCfaZ+6BGYYCqOo6HoUhJGSeS1q5ri6bEtM4xoR7fYP3/6IDbrPTnYHseI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LdvNwPnU; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LdvNwPnU"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso16361505ab.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Jun 2025 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750084697; x=1750689497; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaDdB7ecZw9rq7H/cB+ruY2mtDm9EqdjfLyEE/nDh7s=;
        b=LdvNwPnU5ClvgmE0jmwJ1bhL46p/bNksLzKsVOsP41KyTbaYy9SsubTAKr9d0xkHGX
         25P/Ghzvp1NPP60Xm4mEISKcEtFFZP1X6lIdCLbc/nRSbcz+SGAZqmVZgMZ9vBITh91s
         WUBRNxHmU5a7HgIwhpZfoDjshbHwUQN+X5o9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084697; x=1750689497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaDdB7ecZw9rq7H/cB+ruY2mtDm9EqdjfLyEE/nDh7s=;
        b=AJ9kt7vHbdit3CRnGQ4yCZuZCZ1HZRCJab9BoXThF8hmFcp68whL7Eb520sCxH1WUG
         i4fqkMDubrrcJ3BgUKIgjT6B0wtZJK0javfbYnQsXklEqEEM8MyT+Sq+NWSE+8JBezpc
         kdyNizTxYzWXLeUnWe+gPgoT9VpQn5f7mYMqonMDYR65ygZafftRlmvI5cACi0Fac19d
         Y06rb7SelGKkaGYgDZ6TE5bantw/7s1UCe5qS0RU9MFOrW/alP8LMHturfwP/qPLv+M2
         zYYF4oN2J0CnTinSp/AYm/mOIMCBLRfQXtuoZT/fV8aPc6OOURhSNw8Cbq5mOyOM5vm2
         Kpfg==
X-Forwarded-Encrypted: i=1; AJvYcCVlqzUJzrvxMHhmTDo36AranxMrVXXA+qtGGpPAxsg2iS0BP/AzBYZLKHa0KN5IMSJelETekcw65QnOFTxk+OFT0yRQjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCYnyKjpWmREWUOI+8WeLj/6vNOmfV2b74dj6+kmw+VoaejTow
	ANNEtyYMStOjIPe8KoM7s6ayH911nASYbr5c2H8o1S1DJJlzscp21Bfr//G2Yo4kvws=
X-Gm-Gg: ASbGncu4zfOab+RyX5Cprok850GKk2PZ6CBmcT3FzZdBBFJYYpiFtQ3+YFgufh568d6
	B5qrcjblUWW1H4/qN65ommaN/Pi2IfqRxLQO1nPPWJ05uxZGSmGwRoNnUsC72pgdQH8SS/BxUxB
	+IUEj+mKpYyMCedAJ6WV9kvTeVRNT9TfV6I8TP/r45CTAwNaS0zEj8Kiwk7mvZuSqm1rdNymSh8
	vgEngoUoyxgJgHjmM0KmN/fCfcl2o+zXWf39fFqS/rdUxsn5li+3hfSLZyMixZZkws5p6lMomKU
	CYeepegfFxMvESQbDDNuoufzvxSIO4uP6Cug31994cH66pjdEsaXZK8C6XhV9ov0TofHsD/Plw=
	=
X-Google-Smtp-Source: AGHT+IGp/2E6cAX4aTSkp5+1j4lVd5Xk0hzBOAiQZW5tUPxlnAfIJ0ewA01WNGRwtt7CvP7Nt/sbOw==
X-Received: by 2002:a05:6e02:1c09:b0:3db:86fc:d328 with SMTP id e9e14a558f8ab-3de07c3ef41mr106272685ab.5.1750084697187;
        Mon, 16 Jun 2025 07:38:17 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b3fd0sm19388505ab.11.2025.06.16.07.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:38:16 -0700 (PDT)
Message-ID: <5e8e0f17-9a4c-41d0-854f-e73a6f5866b7@linuxfoundation.org>
Date: Mon, 16 Jun 2025 08:38:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
To: Thomas Gleixner <tglx@linutronix.de>, Yury Norov <yury.norov@gmail.com>,
 I Hsin Cheng <richard120310@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, eleanor15x@gmail.com, visitorckw@gmail.com,
 jserv@ccns.ncku.edu.tw, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com> <aEuw7ls9hieUv_Ox@yury>
 <87ldpvsyr8.ffs@tglx>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <87ldpvsyr8.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 04:48, Thomas Gleixner wrote:
> Yury!
> 
> On Fri, Jun 13 2025 at 01:02, Yury Norov wrote:
>> This exact change has already been submitted by me and is under review.
>>
>> https://lore.kernel.org/all/20250604232550.40491-2-yury.norov@gmail.com/
>>
>> I don't understand why are you undercutting my work, and moreover do it
>> for the second time.
>>
>> For the first time you submitted something that duplicates my another
>> patch from the exact same series. John Stultz has pointed that, so you're
>> surely aware.
>>
>> https://lore.kernel.org/all/CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com/
>>
>> Kernel development process implies that one makes sure that his work
>> is unique and doesn't break someone else's development, at one's best
>> knowledge.
>>
>> What you're doing not only breaks this rule. You're in fact trying to
>> get credit for the work that is done by someone else. This is the
>> definition of fraud.
>>
>> I cannot make sure that any other patches from you are unique and
>> written by actually you. Therefore, I will not take your work anymore.
>>
>> I encourage everyone else to be careful working with I Hsing Cheng
>> and check his patches for uniqueness, at minimum.
> 
> There is absolutely no justification for accusing Hsin of fraud or other
> nasty intentions.
> 
> It's sufficient to point him to your series and tell him that it's
> already been dealt with.

Thank you Thomas.

I Hsin is enrolled in kernel mentorship program and is new to the
kernel community. Pleas give them the benefit of the doubt. It can
be overwhelming when you just start sending patches. It can be
difficult to figure out if there is duplicate work happening.

Duplicate patches happen during kernel workflow. Most of us have done
that at least once.

thanks,
-- Shuah
