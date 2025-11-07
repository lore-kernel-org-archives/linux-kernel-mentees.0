Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37A33370E9
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Nov 2025 17:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538069; cv=none; b=YmwlhMvV2yIKU9H9W2YKi7KWrYPCQBOQkYIh+Eqy1jrOgxlbksQtq3hzOrS0uTmMF5jGskHqATpB7Vw8nm7fGBvPnto0sFEcspDc5G+zJqxP9LS7CwJAW4xHMQF+gPWgGmZcarWGJomJUQO83a3bQLhaMX3mk2JEOci/68d6zXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538069; c=relaxed/simple;
	bh=dIlUqtzLyQeoLWra58iVWTQ8+nwBRh5dtagRaNZsUEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcQ51zjEYPidUq4B7dr0rfHF9bTCAjqNABCwLejeuCRNRlNTFpXF+n09ILWX+Bw+3VPDi4jNPqTybGkL5uF5N9Mn7eHEDy9JwQWFmLpXbQmX3hQwCGAlwxh7nkIOZtEq2p8LEtX0iIBOT542NwETWLCqDWF91Ne9wcIEXRab4a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Tz/CDJI+; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tz/CDJI+"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-4334f0f9c6cso9770545ab.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Nov 2025 09:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762538067; x=1763142867; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FU3/MuagL6B3vYQIaeUguOWrDr12VN/IdKPR191w65w=;
        b=Tz/CDJI+oz2wPY+2muwzXXOkhsmsT9fgFp4Bq0EmqCctNuN0W6URauN1flfGKhfw6t
         mFMCqcRTVy73VUJ0kKUR3teg+cfh7TJKpAnXMm/96hEXcfPGbzKuosNAWn7WdF/jT9Vg
         M8yOq5ly/QtzQLhYqlS/G0eMhPv+LfBjsd6tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762538067; x=1763142867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FU3/MuagL6B3vYQIaeUguOWrDr12VN/IdKPR191w65w=;
        b=HhPJU6eSccywuy993Cnt+AX/Jcg+o2UflLmh8f6aU/nK/oTYtzV5Pf/+9o+DQJb3l9
         CEE/AeY/NvLxj1eQmc62B5PKX/IwJu7rupDPPshrpTtiAwC4qTEFBJ/gHrVmnbXKpkzj
         VGUrvMHc1iNZdNRKrk/1uB0kRR0KsiKiNIr16WAz4THsw4eU5xCZLURoakTfStAhFQ07
         YTMX33a9yjqxKZXfL1uvQ88D3P3gRtcLZVRZ5JI9/UekxDAlt2R9liPmHwNqOJZUKGwt
         78d++bW4Zmn36cNBTw/rJjJuBxogcajEbW061Ssw5pVe7Hm81TPSj7erRVnpzEaWLryg
         UHXg==
X-Forwarded-Encrypted: i=1; AJvYcCXF83fKYFd+mrBvxD31dBDVpkmnUY5lZfiRydAZ7mTrji1OYiu4a1qtbv0CLm6oDcXuU6AMxzMWkTNEfVOKqhDuEYMOAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yztr3WUS1LA9O5Y0Ep/spnSoj4ahpsp/mlewai51wG8HCkSp7Aq
	Y3BNamOAfxHn834u2ltflbLwWrgIBU0hOpxgE4A8uRHB09L8ne48blTzjSQ5Pu3lg74=
X-Gm-Gg: ASbGncs0rYpeR/d6XMF2ykcyhgSJDYX1pxCpvtFLyrF6nO7VfPuyhn0dZLqTGImRfex
	dXyaqnRAgYmZV2NVp5cxU1MdfTjjI80IM5lS+TxrJ6X2dEB/lmpFwmLsrCwm8YbL/oG9qflngnu
	2+G2PC+xOL1NAK8AZ4dGaaa9uTVZkwgABTk+55NCgmmvh9FWQbdWGEHHlFUR/vmaFwvviUQX/R9
	Cpbkp2UpXfkKAbdyIxsLAezpFT7GBkGkouzIbfhmgfxQ9rIRhOWq7Nf9zAwBIEzYr7udDfsXZ3x
	6ackM2G2slYyW/SoaAGZzNtVmwzbaEi56isKp7dzrP1WzotBwRAdCo3ufusR1Vl0aUiz5BpEvpK
	+RbRIU15aUSTSjz7ArTa6M0R1vN/vbdWh6j66ZnvfLQAouOAQhvN5A+eWQyk8Jvbc9ZhWjyoDlI
	meeqoND4phViQNdt8NONmvjB8=
X-Google-Smtp-Source: AGHT+IFKp4dE65PiBOFxRJN/woRBeSQ9orDQvbl++M1O5M6uLi0c6Zrpx9SmAbu7RjKzh9d0tCzeOw==
X-Received: by 2002:a05:6e02:1a2c:b0:433:4c96:48b8 with SMTP id e9e14a558f8ab-43367e7a04dmr5317795ab.32.1762538066733;
        Fri, 07 Nov 2025 09:54:26 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4334f4e77b7sm24550145ab.29.2025.11.07.09.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 09:54:26 -0800 (PST)
Message-ID: <e45ac35b-8cb3-42c0-b5dc-d4c718ee0d9d@linuxfoundation.org>
Date: Fri, 7 Nov 2025 10:54:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: core: Initialize new header to zero in
 pskb_expand_head
To: Jakub Kicinski <kuba@kernel.org>,
 Prithvi Tambewagh <activprithvi@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, alexanderduyck@fb.com, chuck.lever@oracle.com,
 linyunsheng@huawei.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 khalid@kernel.org, linux-kernel-mentees@lists.linux.dev,
 syzbot+4b8a1e4690e64b018227@syzkaller.appspotmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251106192423.412977-1-activprithvi@gmail.com>
 <20251106165732.6ea6bd87@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251106165732.6ea6bd87@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/25 17:57, Jakub Kicinski wrote:
> On Fri,  7 Nov 2025 00:54:23 +0530 Prithvi Tambewagh wrote:
>> KMSAN reports uninitialized value in can_receive(). The crash trace shows
>> the uninitialized value was created in pskb_expand_head(). This function
>> expands header of a socket buffer using kmalloc_reserve() which doesn't
>> zero-initialize the memory. When old packet data is copied to the new
>> buffer at an offset of data+nhead, new header area (first nhead bytes of
>> the new buffer) are left uninitialized. This is fixed by using memset()
>> to zero-initialize this header of the new buffer.
> 
> It's caller's responsibility to initialize the skb data, please leave
> the core alone..
> 
>> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
>> index 6841e61a6bd0..3486271260ac 100644
>> --- a/net/core/skbuff.c
>> +++ b/net/core/skbuff.c
>> @@ -2282,6 +2282,8 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
>>   	 */
>>   	memcpy(data + nhead, skb->head, skb_tail_pointer(skb) - skb->head);
>>   
>> +	memset(data, 0, size);
> 
> We just copied the data in there, and now you're zeroing it.

Prithvi,

This type of careless coding introduces serious problems. Don't
make changes to the code without understanding it. memcpy()
is right above where you added memset() which is hard to miss.

thanks,
-- Shuah
