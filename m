Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9AC2ECD21
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796095; cv=none; b=c7NVlBlGHS0IN2TXf3a+icnbGulKOjcEY3c2W7na7l7li6z446qbldrF6GfI0y8PcxTh35X4YIeobtZTWkFY+9COJHcum8pWGzaZdW+dSHhLGA9H8YVVwmxkCr7i+iWteQKCIh4KvWKQFE7lZ9yiUOJkpyf7MGbFpOOreyxUSLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796095; c=relaxed/simple;
	bh=fCJa3DLjw9wWm3YVXWypadAkRQz6cPsnPd46/rToZIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmI1s21RYPCTEHsWsfEWT+FjBfsYp+nkb7kPKCLyEgl8GMWzPj9dTwuMww2smZ964a11fMZVlGeI9Qljn2xjPsGbu2ch5EKZi2rDgGD33lr3ODIeHI1gfIQTYjRkKB+O9ly0BOYejy/wi2j+OyqtVp99ydmcu3fdrARKxJTdSpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYgzkdK3; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYgzkdK3"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 415CB410DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 10:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USCtdtBCx65M for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 10:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63432410D1
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63432410D1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NYgzkdK3
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 63432410D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 10:28:13 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b2b7d5ff690so18180666b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 03:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758796091; x=1759400891; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkkQhkQp0131ZIKNy1iXUtHUjD1n/PLL5NGGdY7hx9Y=;
        b=NYgzkdK3ryHmDIEUMMZk6/cqXkk0dM2VeQCA1cc7iP0Ew2QnMvlvN6HO6ZpI6JHYrO
         QMMlRWypUEJEf/Xt/qs/PEgLxboIuyPoKrUdztUhPPL6eghW7KcJziBaZOsWJmxJwnrW
         YZDtvSPT6myC7/Bk364/1qLxoU5j9G+io9HRS1pL9rFvN2B9VoZnUQuN6eWW9XGqTOhp
         KX/Vu7qu2QB3B8fYvpsyFHEsldKDSQRtJdJXxhL8+C6BPkawiiTj1Dzw76ubXv9kKijx
         FCzTQCbLSqWmnAy85YzvXL+WIr0nIq5NVfXTcGcOV2ZNHtQa9cNm6ZqfSxJPEA+VMG/d
         93eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796091; x=1759400891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AkkQhkQp0131ZIKNy1iXUtHUjD1n/PLL5NGGdY7hx9Y=;
        b=GCHye8KqhaugRuywixibM3rM+k5rzS7vanfjCv8vzvelD49UkSrDIsfRy1GDUEknyj
         zxMdpYjqRiYN3/CiMv4C9xB3FFePIl+jIVZaeyr8IvbY/iGQkx26JQvp+Y6mB1bpIUM7
         U9gHe5G2GCGgtCIQyVhunUTqi6clag07xVCp+72ot0s5/ReCTJlXOt5+l4Ya7peB6PE/
         HOIHVI1ub8VTHwvcJYTinT51vj4mtBSZ3z96ZGqLj/AqXzZaaxTbBCh1timOm1gFxzuL
         yqfN7c3OX2Bafe6Qv68/AkmO9b8S7mgC40dVS1SQJBJOO11n0eD3MX9TYet9a0nWRce+
         x8MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeFaoJz1BFs9DhL0eGdPM28CXxN500mknHaEjbWzS0I9tl+ZJCiWgxLimJGrNqXJOVvJt+GvGMhbsp3WEeae6MOmUeRA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxrdnW5WkiZsVJx9RdDp883N0uhZuce+uW57mxNY5Q84DZeJ1EN
	RHzTmkyTKHJwi2G8vRCmmTUMRBf2OPaFAxNfcHjckTBV2PpdNiFui2wj
X-Gm-Gg: ASbGncsoJvjkLS/HO7uM2QF6FzM7ASgzeo6vFT9k1Lzq7JII1l6/OMSwKjrvPnpxpUg
	XpT8XQE5Ku/pcykj1SUEz6PjlX+wL33rCyo7f4jb/EPGDbsEDuwKtArN5cXUX4bhu0wTTb0CvZl
	IqI4gqRLEjSs20S53Tg1mnE6C8j4+Crz+i5Lr04160n7s3Qx+Utxhj4O6JKRjSSeGMnpao/u+TK
	zF6QkCsJZVzjDXzZpkcAs49+5pr4UZ3PWZs7DiRN8gOMovVqfKWejz6f5cRxbiOweCcGh7YgmhV
	CHKhoeHDKsxJVht+mEQbu+0D+XwZWrvd2mANqNNV2mLTzkDT0yQF7DEFG3co3jTxs+XP9ojzgUM
	1m1Un+12jUuu0rjWNhoCMkK4d6vmjrFjJZ9LwMLVYNAs=
X-Google-Smtp-Source: AGHT+IEJRAjZWd8i/spFohWijM9GpkErorZXWbmJA8bf0ZF8n/1FpAdkOBR7e4k1rIrGaK9+GbCQ4A==
X-Received: by 2002:a17:907:9493:b0:b0e:e45:f934 with SMTP id a640c23a62f3a-b34ba350c67mr180986166b.4.1758796091304;
        Thu, 25 Sep 2025 03:28:11 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.112.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a9769bsm139873366b.99.2025.09.25.03.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:28:10 -0700 (PDT)
Message-ID: <e85e7bb2-6229-4b04-9c2a-7a7b79497c6c@gmail.com>
Date: Thu, 25 Sep 2025 12:28:07 +0100
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
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <87348a4yyd.fsf@cloudflare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/25 11:18 AM, Jakub Sitnicki wrote:
> On Thu, Sep 25, 2025 at 11:54 AM +01, Mehdi Ben Hadj Khelifa wrote:
>> On 9/25/25 10:43 AM, Jakub Sitnicki wrote:
>>> On Tue, Sep 23, 2025 at 10:00 PM +01, Mehdi Ben Hadj Khelifa wrote:
>>>>    This patch series is intended to make a base for setting
>>>>    queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
>>>>    the right index. Although that part I still didn't figure
>>>>    out yet,I m searching for my guidance to do that as well
>>>>    as for the correctness of the patches in this series.
>>> What is the use case/movtivation behind this work?
>>
>> The goal of the work is to have xdp programs have the correct packet RX queue
>> index after being redirected through cpumap because currently the queue_index
>> gets unset or more accurately set to 0 as a default in xdp_rxq_info. This is my
>> current understanding.I still have to know how I can propogate that HW hint from
>> the NICs to the function where I need it.
> 
> This explains what this series does, the desired end state of
> information passing, but not why is does it - how that information is
> going to be consumed? To what end?

In my vision,The queue index propagated correctly through cpumap can 
help xdp programs use it for things such as per queue load 
balancing,Adaptive RSS tuning and even maybe for DDoS mitigation where 
they can drop traffic per queue.I mean if these aren't correct intents 
or if they don't justify the added code, I can abort working on it. Even 
if they weren't I need more guidance on how I can have that metadata 
from HW hints...
Best Regards,
Mehdi

