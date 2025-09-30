Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F37156F45
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759237941; cv=none; b=oEQ+cfaatZiypKIhu7LCkUgEa5SUMWOosMrxRPCyAuyRapEM3S3OpUWBoN3nb1+tH7ojtYinQxuS8oQuMwf21l5cnxGjYfg/NHTgyxu+VyjoSbILFkdDfD/veVEPKsT2rLlGmRJJhkqWjZ7IOpRQOporFxuHp8eEoMD/AdE5nMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759237941; c=relaxed/simple;
	bh=BuPu+QkpbK+LDOXFJoK0UGvneBSjF3bPjWyHTdkxLa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMCmQ3N1AfgLvgJXFqSPqv3TGC30M7FkdaLrdDXHxCOUqJ0UAbjubETw9bXYRrLzKmQ3XKl43Gj9DYZtgXsgeFlL0rgv416rHlUUzw6sHFU/UQWtJUVFgRMAmZ9WtqIGt2pqSHTBDphwtVIWz3X7qe04vC8YxJ0czNB4WCRY4bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0PEVd3I; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0PEVd3I"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29E7840ACC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 13:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udlfNB4zm0HJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Sep 2025 13:12:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95D554096D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D554096D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k0PEVd3I
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 95D554096D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 13:12:18 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32df5cae0b1so6970136a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Sep 2025 06:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759237938; x=1759842738; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BalHeIL5/BqDqtC0xwxyjR7KLhvy/kVeEz+cc6DlymU=;
        b=k0PEVd3Id1IY9vvwkoqwNZ3C8G94xet+5osDzSG10FSJbRtNXindDjxMyRfR1PqiL6
         u7e7AJTtbd8VfRtZSBla593ZnZMrDe6fhdfS9gRMuMjhTTYo90iPJqfNtVLpImF2hkui
         mXpwJSxeuo3BFMpCl8jx+/8UEO/X7MjzgMmGTsmkLkURMJNcy/LpblnG23JvqM+LqWuN
         cY9aDIW7eW9Yjp5hTCmAUbTVh7pxt7ueEVqMOPGrYrWg1QeulER2u/JO4IP5YQ+7WJlF
         4iWDcjWe3QSZBAhuC2XilK8JfUF4oLz8OkUmfvYYugJjVHaox5Lf6PamQxOfYBJPCut+
         eLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759237938; x=1759842738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BalHeIL5/BqDqtC0xwxyjR7KLhvy/kVeEz+cc6DlymU=;
        b=KuTT+JnDueRDaoP2qfXUwB9YdcZDB7xQxP0iYDG184QO3iy8taUrK6LVCesTybhDZF
         98P5Cxzu+L6+onpjDklIh/+SEfd6td0JUQytUBenJZEc0I069x+Hm8HuNd8o4fpFjkuD
         BXMOWHwivOPMOJZxAPNiyOO2VDqupIO6lgFg6HyDHJe9gWroiOsNPLmnVouMUPEH4otD
         NaHkWJ6elDMpEHnku+05kIbGaqreQlv6YDDELLogHVsge6zAT0O6SRZb8DWf0oohaBdb
         P5KPK0NVZodUPHGqLDR7h9w7K4O29eMoUZSDZLElDvud8116bUYEC+siWHRCN0GGY1tG
         vavg==
X-Forwarded-Encrypted: i=1; AJvYcCXTEAUSGdOw5bKXiyt8YORC8JUyd0dT/nPJ+eRACyyHui+hAyLqf+p6NQaO3v7NDSG9MOJ2F3oGNtsxKPH/JH274Vv8Wg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyNCyvT8J25DntawAkDhtJ/IVh+4PRMwkyjS43ewGlLG9Ylu+f5
	imoHJnZSX3VjSjN67Is3CxnXnHZLzHltOHxWD1d+ej/837F2+sQkXTrO
X-Gm-Gg: ASbGnct0y8lunTIbYYHRYF4BrgXp00KYhDBLOL/GKoA0SrTq6HZJHkkBekRprA/EjRT
	ohAmvUjuWEdLjrx1aQrGOp+h6MVRZVrZGpY3vG3JPNkL/kvbvlQxvAJHogM15vo8fKLLj5mWhv2
	G+KFol/ELt/BbRMraHUtuHsqCTvQvQExqxiNdKEeFtbjuAtDL18C7+EnlraHN5PalIo3z0J9eNL
	b9j4by9caYN+217BocxjTwOrKf9LxbCYZHG7/NCa0os253JzFrySwhlWWnc2EBT70hRETBcoesn
	QnnXu+d5ii7ub9jDdQORIdN0ssdGaxIGi3DlXQ05K6SMENmzoBM56aGqsLq5woAtYkYWrVI84uz
	4YTFl/21u+I+muo86zfRPqpiAb1ZrOYgSM4PKxaYh98dNbIuJEiNo8yHicB/qmfEMWIXEYh41FH
	VlE/VnOro=
X-Google-Smtp-Source: AGHT+IE15DBb6dGJWvDatwyNtMkBRWBDtr4Csa2oquli/nlczM66Li2djXIykdMF6+kAtORFpU8ZEg==
X-Received: by 2002:a17:90b:2786:b0:32d:3895:656b with SMTP id 98e67ed59e1d1-3342a22b08dmr26954381a91.12.1759237937639;
        Tue, 30 Sep 2025 06:12:17 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.102.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-338387256cdsm4420310a91.20.2025.09.30.06.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 06:12:17 -0700 (PDT)
Message-ID: <c1ac5c9b-9089-4bc3-be0b-27cc9468d05b@gmail.com>
Date: Tue, 30 Sep 2025 18:42:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: atlantic: Use kmalloc_array to prevent overflow of
 dynamic size calculation
To: Eric Dumazet <edumazet@google.com>
Cc: Sahil Chandna <chandna.linuxkernel@gmail.com>, epomozov@marvell.com,
 irusskikh@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20250930111933.28730-1-bhanuseshukumar@gmail.com>
 <b0cdffc2-7db2-4aee-aca7-ddb068d5022a@gmail.com>
 <68484d2e-653a-4256-bd99-47f1a9b740f8@gmail.com>
 <CANn89iJpvsB55vbTmZiDV=8H6xQ=dVtAZJsGo9f_4nrfZfCcJA@mail.gmail.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <CANn89iJpvsB55vbTmZiDV=8H6xQ=dVtAZJsGo9f_4nrfZfCcJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/09/25 17:47, Eric Dumazet wrote:
> On Tue, Sep 30, 2025 at 4:39 AM bhanuseshukumar
> <bhanuseshukumar@gmail.com> wrote:
>>
>> On 30/09/25 16:54, Sahil Chandna wrote:
>>> On 30/09/2025 16:49, Bhanu Seshu Kumar Valluri wrote:
>>>> Use kmalloc_array to avoid potential overflow during dynamic size calculation
>>>> inside kmalloc.
>>>>
>>>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>>>> ---
>>>>   Note: Patch is tested for compilation.
>>>>   drivers/net/ethernet/aquantia/atlantic/aq_ptp.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
>>>> index 5acb3e16b567..f445d449f80f 100644
>>>> --- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
>>>> +++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
>>>> @@ -182,7 +182,7 @@ static unsigned int aq_ptp_skb_buf_len(struct ptp_skb_ring *ring)
>>>>     static int aq_ptp_skb_ring_init(struct ptp_skb_ring *ring, unsigned int size)
>>>>   {
>>>> -    struct sk_buff **buff = kmalloc(sizeof(*buff) * size, GFP_KERNEL);
>>>> +    struct sk_buff **buff = kmalloc_array(sizeof(*buff), size, GFP_KERNEL);
>>>>
>>> Shouldn't this be kmalloc_array(size, sizeof(*buff), GFP_KERNEL); ?
>>
>> I didn't change the order of arguments to make it easier to review.
> 
> I think this NIC limits the number of skbs per queue to less than 8192.
> 
> Also sizeof(struct sk_buff *) is quite small (a pointer is 8 or 4 bytes)
> 
> So your patch would probably target net-next as a cleanup, in about
> two weeks when the merge window is over.
> 
> More details in
> https://www.kernel.org/doc/Documentation/process/maintainer-netdev.rst
> 
> Thanks.

Thank you for sharing helpful documentation. I will send a cleanup patch designated with net-next once
net-next reopens.

Thanks.
