Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71592F49E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758798200; cv=none; b=bEPE8lTz9OKiijCUCLGEmMa2zAoyIzyEirk+N3Fl9X+ZaGNPmHhVfK7YKd00/CHzsEJVFrHukJOa2uRebOCQtYiqbAsNFfNfNxBz6S9fzws+yxKQsbZWSZnMM269AmzEplcNAFOD1ijyYLd1vkETmTfr6Doe3lreVjPawATIeTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758798200; c=relaxed/simple;
	bh=5f5jzmY/8z4+Z/yXxNdh/MioRwPbuZwA+8mB7aWl2NQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XG0VN8A9P6cQOYh0XNKUmdXTo3PGrJmA1lZ1+hAWQVMKoRnVnwcMT8ujmLAa67PDi9C2uMaw6OB4+spPo+pE1NA0A+uvYzwGUw9y9zBSuocnbQm9/RcQqSWjrPwhLUVoRa22qpfw01dbNq99BbKxmMsExH4Dv2s5JqM/Pz1BRMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abL0+HTT; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abL0+HTT"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D8884096D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 11:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHVNmvl_f30F for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 11:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B6BF40CDA
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B6BF40CDA
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=abL0+HTT
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7B6BF40CDA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 11:03:17 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b2a55c5dd2dso22382366b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758798195; x=1759402995; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kbayy13shJENppb8XOVzKg697zuEvFkUeRfz0DCdeZk=;
        b=abL0+HTTQvKbFjQfH4z44f5Sse3zwiqBDFFJDYSMt/CXnS829OsApH/adewWwZq6nn
         pzZh8+Fbvq5TrWBohPCnQ3/81k/Ez6mC6o73/q0KDc/mlCV9r5fD1KycEjIbpPJg/7F2
         8p5x7R36FyOOJBKdl8I0dbXO8+XfPJRKEdxsJPJb+Q/Ghtmz2ZNem6UYrgLmPrEm67jg
         SK7J4QOO1f+ah6uiU9BuAPnqEa1Ke1LY/a+rBqVZXYptxgelgi2gMmYxKNbqmDJGNSvM
         8VN6XBe7SSDwcop9MAXtDG3S53/R6v5eeLOHIqxsXBXtJL/fWX9CT/CVeXPyu6XYDNHt
         /2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758798195; x=1759402995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kbayy13shJENppb8XOVzKg697zuEvFkUeRfz0DCdeZk=;
        b=d1E8q0xApTfzm+8BGhGV+y+Lo7vCQ6Ex2qUzvTQDl0v0qsFU6DpXOXew9O2edYIxUm
         Bs2xvD+j3XY8OiEcWq1LD/iMAPy281sVCzBfkFRwi3JbfWeYjePqLhX10v7eJPWe3neR
         BxtaIs4MQmOulbc5PdbEcG183tU9BFgz5OosFx9SBB5JTeXtoKH2XFe1gljHJMuh4vgv
         18gXGri8d9z8z3OekrmLa14HGxKh5oyvc6iJF2pbj3abzcpAGOlPe5yxE/B8nuVHUgJa
         FBGMP6IXgbPzxATm9vw5/LC+drnMFl9F+G0niYxOnR9xW4KTf2iv8E6RcoGlnKwIZwL5
         dytg==
X-Forwarded-Encrypted: i=1; AJvYcCWIFQX5m/GKYFBxxneRKxgoPRPjSjm8BMTO+ti63ckK+n9s9MxiYNcWkAm1Kg549EIXDUjdUcUlu3bUkRu+M6+BcRqkeQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy4zKyh14zzvm6XOi7g8IKRrFWbFBEF/S3fDhVfhvKKpqjo10xE
	kbH/E3Dx6F1rOxJhKKZBL0nV2TNpRzn5T2pcbItd1MADHF0y2iBbsGlP
X-Gm-Gg: ASbGncvZf9PEkapBVsVEfCVEphQeinALZ51lDplVhjBCH18VpamE8cyo/Ph1r/wrFCx
	zWgTKD74x+stqPDCrvpBv57cHaEvG7DgNBC4+AQsYGyM2i+8X4O56QeEqA9Ia6buNutxrWdhGWN
	M5iRpM/x/Nwz0a3AHmQ2r/TJf+fBjaHK9lCBStcxEjx9xkGfIvr3yqL71p9SE3W0OX3PjaFMMPP
	NL+CwkrS2C6o9hQc2Ltk7Io7GFFpLCfk20MmMCz3mBv23XsvbV1F8idY9fAHTflmKcz5FTsYka3
	LGPiiN/8n9Ea12+a9RWDJIAf0xsrDISdL9AhEuDOzS825171oqPLo9oVHc4dV//CsABv+YHQAj1
	jpnFGq23yGWPEiVh+0JvGITfmN/TjrEJmu5DI8sof/+dL+6oElYuLhUDhWj/5Pg==
X-Google-Smtp-Source: AGHT+IE+FDIp8REoReNlisltZxekgZurykBl8HQME4zI0tHguqI3KAp9IuApteihHX89I/9CUSSgZw==
X-Received: by 2002:a17:907:868d:b0:afe:88ac:ab9 with SMTP id a640c23a62f3a-b34bbeba6d0mr166541366b.9.1758798195396;
        Thu, 25 Sep 2025 04:03:15 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.112.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7806sm147331066b.70.2025.09.25.04.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:03:15 -0700 (PDT)
Message-ID: <941fece6-9660-4aa8-91ed-346b0c2d97c1@gmail.com>
Date: Thu, 25 Sep 2025 13:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Add XDP RX queue index metadata via kfuncs
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, donald.hunter@gmail.com, andrew+netdev@lunn.ch,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, matttbe@kernel.org, chuck.lever@oracle.com,
 jdamato@fastly.com, skhawaja@google.com, dw@davidwei.uk,
 mkarsten@uwaterloo.ca, yoong.siang.song@intel.com,
 david.hunter.linux@gmail.com, skhan@linuxfoundation.org, horms@kernel.org,
 sdf@fomichev.me, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
 <87h5wq50l0.fsf@cloudflare.com>
 <0cddb596-a70b-48d4-9d8e-c6cb76abd9d2@gmail.com>
 <87348a4yyd.fsf@cloudflare.com>
 <e85e7bb2-6229-4b04-9c2a-7a7b79497c6c@gmail.com>
 <87y0q23j2w.fsf@cloudflare.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <87y0q23j2w.fsf@cloudflare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/25 11:47 AM, Jakub Sitnicki wrote:
> On Thu, Sep 25, 2025 at 12:28 PM +01, Mehdi Ben Hadj Khelifa wrote:
>> On 9/25/25 11:18 AM, Jakub Sitnicki wrote:
>>> On Thu, Sep 25, 2025 at 11:54 AM +01, Mehdi Ben Hadj Khelifa wrote:
>>>> On 9/25/25 10:43 AM, Jakub Sitnicki wrote:
>>>>> On Tue, Sep 23, 2025 at 10:00 PM +01, Mehdi Ben Hadj Khelifa wrote:
>>>>>>     This patch series is intended to make a base for setting
>>>>>>     queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
>>>>>>     the right index. Although that part I still didn't figure
>>>>>>     out yet,I m searching for my guidance to do that as well
>>>>>>     as for the correctness of the patches in this series.
>>>>> What is the use case/movtivation behind this work?
>>>>
>>>> The goal of the work is to have xdp programs have the correct packet RX queue
>>>> index after being redirected through cpumap because currently the queue_index
>>>> gets unset or more accurately set to 0 as a default in xdp_rxq_info. This is my
>>>> current understanding.I still have to know how I can propogate that HW hint from
>>>> the NICs to the function where I need it.
>>> This explains what this series does, the desired end state of
>>> information passing, but not why is does it - how that information is
>>> going to be consumed? To what end?
>>
>> In my vision,The queue index propagated correctly through cpumap can help xdp
>> programs use it for things such as per queue load balancing,Adaptive RSS tuning
>> and even maybe for DDoS mitigation where they can drop traffic per queue.I mean
>> if these aren't correct intents or if they don't justify the added code, I can
>> abort working on it. Even if they weren't I need more guidance on how I can have
>> that metadata from HW hints...
> 
> Both filtering or load balancing you'd want to do early on - in the XDP
> program invoked on receive from NIC, which as Stanislav pointed out
> already has access to the RX queue index in its context. Not on the
> remote CPU after spending cycles on a redirect.
> 
> And even if you wanted to pass that information to the remote XDP
> program, to do something with it, you can already store it in custom XDP
> metadata [1].
> 
> So while perhaps there is something that you can't do today but would be
> useful, I don't know what it is. Hence my question about the use case.
> 
> [1] https://docs.ebpf.io/linux/helper-function/bpf_xdp_adjust_meta/
> 
Very clear,
I will abort working on this since it can be passed as a custom XDP 
metadata [1] until further valid use cases or when it proves to be more 
useful.
Thank you for your review and time.
Best Regards,
Mehdi

[1] https://docs.ebpf.io/linux/helper-function/bpf_xdp_adjust_meta/
