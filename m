Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED0834BA29
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759232386; cv=none; b=l5eBwT6d/APmth4/Isu33OxD+K1AMZg4TsvMxtzDnYJh2t9FeNXM1PJTwmihoIWnOdAu0OQMldY/njz7Od/PmjTPWXaPYD5A3Y/gYRMgdjOQpe8w5X4jF6Kaw/lGWUzxlKKaoYXmXHv+9AB9mhHHf9O0NADeGn+8vAt4nFlwdq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759232386; c=relaxed/simple;
	bh=ggEU5wRhmXuPH8pJmT0kHBfE3rPF5dKiDr06XQW0U/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5CNBuWgdtXEnLaqjytKiy02vAlJGrvGm2SnnsuVJSvUDKVbkXLMJf46eKlqAQ8VpS2kRku1XhLZdfK7kP1QrDMZD7s+f0fo0K4jD/Ay4L8HVATrphy2iCaq+TCLrd9uoa9cDWVbM/4XsG58cr0klP6eSIp0y1nVwbj4w4VQXu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2d1Z1Ay; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2d1Z1Ay"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02F7440A97
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 11:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLN8VOYu9ttn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 11:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5646740A7B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5646740A7B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J2d1Z1Ay
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5646740A7B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 11:39:44 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-26e68904f0eso58940865ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 04:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759232383; x=1759837183; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntVMwrUCe5dt7EISlFumxATMIV/hSAH2yWhPmCIGNfc=;
        b=J2d1Z1AybAC1J+4PbqdWgWSnaqMy3Q4WAl4oBEI+6XBHx2V5neeTJS/GSjUp13mXUC
         uYMKb5XXApzjPVVyQ0wj9RQZF2gHZmqNmWD67cztLug6J1m5uiZKE+alKa1a0hfyWhY7
         Jq7ExGOpQ7OLxPQ+WCm2OzE23F5pHbbjlmQEuebuOflnLHW1mxu8roB2fs2a1muZuGBP
         IU+tEUaXOh9AbkuS0wW4mxqj2EYgCSpQbOjEy3u2mXncFk8a8i5zL8x7oSbaEvQ4+8ry
         +jelaElXvZP5XKOdm3wL7E8plX9mv5PVX1lPLta3WPdiMu5SqTlp/MPOfk/LDXr/PP+0
         Y+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759232383; x=1759837183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntVMwrUCe5dt7EISlFumxATMIV/hSAH2yWhPmCIGNfc=;
        b=UhRqIUfJgtfs32ZaHnpgyWqQKy3f0R0Zh4H7KcZfG4oZArPhoJqF6BTg/YYhW5bLCQ
         NUAQTVkS+VpO50Hs0cbF1inUMB9vy+xA5AeGEyHEEan/QNtOu57aEUg/G0K7E59IQhyX
         ZxavqMxqooKRyx7bD8NfZcNGEr5uZSPwcsr16d+acKt8uCArY+Q5/0LGIn9lgyBqMbES
         qDEbZCF0AfnSQCXEWtzrskiliVGVSZtN1LuHvQ5NGZghqhoWWsvoWhunYWPvmoWoASm6
         wyj9YFE7J9IpDjtkz2p7QFFpmlVgW62uPO6MY3koNSRxfCk2iodB12hJ71GsXqdHXXDJ
         c/8g==
X-Gm-Message-State: AOJu0YyeFLIC85k1GoZMA4kG+HYyhdIjK29RJjps1SgKHObACll03hhh
	XrusjKmCdEIAIUiE+kn52QfoXOSqRnm7G1Hi/SL//ypdiB4qBGqux8Kv
X-Gm-Gg: ASbGncvG6LMqbUv6qu9hIawmBsYtM39bgcfGKKd5y4j/q9wjnkgnpdQB6yoKFoN+RXy
	GBBoMCfev8ZYpD9vNWP54RyJ0h3Xwun7buhLwEKeeq73MEXHflO1P1YcCxeMCMNTFxZehe+Sz7V
	jchrZmBls/DQWgu/hjrmQ4C7Xu2FxS0BmXqAxX1ca7t45VbI/T9Uvoy5w1xR+nSp3AoYU3cPceV
	g8J/30O9r8VbmrEdEmQhIDKxwXqtTYxqPFaObMkj8KksdD7L4UAT+K9q6jjgKqQpUkKD7buDMW1
	sEo+aZKBFHiAX8wk6rtDvBKzw5LqB1aCacRP6eQ3RyBnLen4AqzXXbkMdzHWOCCOBPwweTbFwEa
	PxdlL1pkiUzjWQz4k5dMtiLvDEdvh9eHc2Go2gGFYOj07hjAjyUpTekp2HluPCz9hPe/0YByUMp
	6pxyijZc8=
X-Google-Smtp-Source: AGHT+IHxTUO+y1PDHBjkhvUCfWGwTpdEUKYghp1HD61QMKW8TSJbkvYUt/FlMhPHOD2OHEH+hgReNA==
X-Received: by 2002:a17:903:2281:b0:266:ddd:772f with SMTP id d9443c01a7336-27ed4a06cd8mr217455595ad.9.1759232383460;
        Tue, 30 Sep 2025 04:39:43 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.102.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6996963sm156621905ad.104.2025.09.30.04.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 04:39:43 -0700 (PDT)
Message-ID: <68484d2e-653a-4256-bd99-47f1a9b740f8@gmail.com>
Date: Tue, 30 Sep 2025 17:07:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: atlantic: Use kmalloc_array to prevent overflow of
 dynamic size calculation
To: Sahil Chandna <chandna.linuxkernel@gmail.com>, epomozov@marvell.com,
 irusskikh@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20250930111933.28730-1-bhanuseshukumar@gmail.com>
 <b0cdffc2-7db2-4aee-aca7-ddb068d5022a@gmail.com>
Content-Language: en-US
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
In-Reply-To: <b0cdffc2-7db2-4aee-aca7-ddb068d5022a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/09/25 16:54, Sahil Chandna wrote:
> On 30/09/2025 16:49, Bhanu Seshu Kumar Valluri wrote:
>> Use kmalloc_array to avoid potential overflow during dynamic size calculation
>> inside kmalloc.
>>
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>> ---
>>   Note: Patch is tested for compilation.
>>   drivers/net/ethernet/aquantia/atlantic/aq_ptp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
>> index 5acb3e16b567..f445d449f80f 100644
>> --- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
>> +++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
>> @@ -182,7 +182,7 @@ static unsigned int aq_ptp_skb_buf_len(struct ptp_skb_ring *ring)
>>     static int aq_ptp_skb_ring_init(struct ptp_skb_ring *ring, unsigned int size)
>>   {
>> -    struct sk_buff **buff = kmalloc(sizeof(*buff) * size, GFP_KERNEL);
>> +    struct sk_buff **buff = kmalloc_array(sizeof(*buff), size, GFP_KERNEL);
>>   
> Shouldn't this be kmalloc_array(size, sizeof(*buff), GFP_KERNEL); ?

I didn't change the order of arguments to make it easier to review. 
> 
>>       if (!buff)
>>           return -ENOMEM;
> 

