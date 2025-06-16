Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526BF1FE461
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Jun 2025 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084480; cv=none; b=FUCBiGuwkfrvSeUIkjXv7Hd3HJ7g9LeuYlkYm6LsAhx1gRh3mA9onslr+52W97v6iL6icBfNtmgKgCyS/p3pt0ZQhW5TksXAN4Fx2KqcR9/x07ZXfuoITZ5oE3WOEXv/ONQgUIEtoRp48PUcfD9yrtW+7YD7oWGhjsl6QQMF1B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084480; c=relaxed/simple;
	bh=Wp7lzU5+Yj9+0iOBa9gILgVo4JRalw7QqSIh50BSyXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tplQUpvvflAnYV5h9LYxp5bqVHYNSqtphbc+VkwRVskf4oWQOHau2PBezQ77VQyWa1cPCfPAR/5EwF9pwnsB0QCIpxPSAXEP0KDNM7MNQSkAXuFjITG40iv8QMxoNKZYeRG+xngPp+vG2kCluVeGtJXNhUr/p6nn9Wzkhgio7AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BD/bnGuj; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BD/bnGuj"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so13895945ab.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Jun 2025 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750084477; x=1750689277; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAgEh06Y08KkZqg3CyCAQ7ePxZ39WZ/hqPC07deIYhA=;
        b=BD/bnGujdA6Jct86/5UnNWNeB6fLZYl03wCcXM/niEjNqxl00tdf0tC1H1ZTFqRDAd
         3tceRZaZWUzhQ2Sg9YR1WpAfB121bP7EKexY9GY79jpk6DHqAEapwBzM2T9vPp1h0Etv
         51mL3ZM233/GXPcw+LMT5m1oAzcHNZ02fiGhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084477; x=1750689277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAgEh06Y08KkZqg3CyCAQ7ePxZ39WZ/hqPC07deIYhA=;
        b=jIpvS7QklsRUz7KXu7k4Jk52/1LxSPONiGV2fkxWYwOJu5DtaZAzRRuxoiBaRlnviN
         odu+f1/XeCEeNHm140MCYxv0RJ17TsJStXjYVtk2o8IZl75mD+gg64qL4+O82SIkMCBI
         HzRRadL9+ocx9lB6tOGHYpZzu6bEN5LFDH9icx3uDE7iBeOqvlTX1CP0Be1aw/uNaZW1
         7p0zb0Xbbp7EjrYrPBHF5r/FpUpd7Rv6t9xMBTBoM5ZgvbJVW7XMsAvFL2z0XiWJY8k4
         LI/Wxz0TVxUjGGgmorHVHLu0+1EGOOBRQASM3aqARrM5K/dbEu5G2vr27I7nkvh1dvuV
         0tMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9uVbusK/28XqfsIqYuAeA8c3RmnHo3wjNzbIlfDDTnH8a/YqsrKvoZMi5lzcPjlWL2Cf3bQLjNddjs0xKWeCgcix5/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YywxqbY8wLZhEfKJt0wAI7VydN5cir7ZJCRfE+GSqDWvLHhxnz1
	bA1Mk+igrS0FXqdleH4CebAaUdZ7JWrFBy0U/NGyLvmthBsHiTUVa4KyaJMpTxr3Xek=
X-Gm-Gg: ASbGncus/vCb38LpCIYXxZJNDPzXBdPyebHdmJPSNukFrhDHHtbgFxxXyjhvtK47ktF
	qsMIQWMkBaGysjZ49Mvfxif4vQ72z6GvsNjsRXJzYXxqS11quUB5pHLDg0uWYBphzSCr+YH1gcP
	WA9J17HFC8gF8FdDaiSM+UMr8jAZNoi09JNCmhWRGOI8A7Wrj/grgR7nmBKhxQAZ34DoAJkjhAK
	SvyB63vT4uciRqhj78fVeP4BOUdzG4qZoDOIyIjQ2v2BkjCfXQPV5xAXJraMFJKCmLKgRc5C1Qs
	u+vfG1lCP1W8E8EgvVzhqEXrYg7gd+dJlNpQSaB7ABTAiV4QcvE3RWvzGxSAXONDEx7honCGg9X
	gMN+3nuSF
X-Google-Smtp-Source: AGHT+IFWZyOfdBvtIeaX4r9KeyscEUamoohkuJbwWLO21ggJf2ui7LwN4OGcYTpGxVLP5r6618vpNg==
X-Received: by 2002:a05:6e02:1a43:b0:3dd:d653:5a05 with SMTP id e9e14a558f8ab-3de07d01da0mr111772845ab.3.1750084477180;
        Mon, 16 Jun 2025 07:34:37 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de134094f6sm9383095ab.9.2025.06.16.07.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:34:36 -0700 (PDT)
Message-ID: <385a3bc1-2c0a-4a11-a802-ad02abafef1e@linuxfoundation.org>
Date: Mon, 16 Jun 2025 08:34:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
To: I Hsin Cheng <richard120310@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, tglx@linutronix.de,
 sboyd@kernel.org, linux-kernel@vger.kernel.org, eleanor15x@gmail.com,
 visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com> <aEuw7ls9hieUv_Ox@yury>
 <aEu1r12L_34Lxsgp@vaxr-BM6660-BM6360>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aEu1r12L_34Lxsgp@vaxr-BM6660-BM6360>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 23:22, I Hsin Cheng wrote:
> On Fri, Jun 13, 2025 at 01:02:38AM -0400, Yury Norov wrote:
>> I Hsin,
>>
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
>>
>> NAKed-by: Yury Norov <yury.norov@gmail.com>
>>
>> Thanks,
>> Yury
>>
> 
> Hello Yury,
> 
> Sorry to make troubles, I didn't mean to do this, I wasn't aware that
> you've send the same work and nor do I mean to interrupt your work. I
> didn't have the habit to check others patches regularly, I'm sorry for
> that.
> 
> I just saw Kuan-Wei's patch from months ago and I asked him whether I
> can continue that work, and he agrees, so I try to do something from
> there.
> 
> Again sorry for causing troubles, I'll make sure to look for others
> patches first before submitting them.
> 
> Sincerely sorry for this.
> 
> Thanks,
> I Hsin Cheng
> 
>> On Fri, Jun 13, 2025 at 11:34:47AM +0800, I Hsin Cheng wrote:
>>> Utilize cpumask_first_but() helper instead of first using
>>> cpumask_first() and then cpumask_next(). The logic is the same here,
>>> using the new helper will make it more conscious.
>>>
>>> Use bloat-o-meter to check the impact on code size, the result is the
>>> same, does not have positive impact nor negative impact.
>>>
>>> $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
>>> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
>>> Function                                     old     new   delta
>>> Total: Before=22590709, After=22590709, chg +0.00%
>>>
>>> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
>>> ---
>>> Generally speaking, I think this is just a small tweak on the code,
>>> making it more readable. However, no benefit in code size or performance
>>> as the implementation behind the helper is in fact the same as the one
>>> used here.
>>>
>>> Maybe more tests should be done to ensure the change is solid, I hope to
>>> seek some suggestions from everyone who has any ideas, or this is enough
>>> then it's good.
>>>

Thank you for explaining what transpired and clearing the misunderstanding.
It can be difficult to figure if there is a duplicate patch unless you
are closely watching the mailing lists - it is very hard to keep up.

Don't be discouraged with this experience. Continue to contribute.

thanks,
-- Shuah
