Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3080CD6E7E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Oct 2023 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 520AD81852;
	Wed, 11 Oct 2023 15:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 520AD81852
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JGClhoAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FA2ufeYcS3sZ; Wed, 11 Oct 2023 15:47:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3D38E8183D;
	Wed, 11 Oct 2023 15:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D38E8183D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D124C0039;
	Wed, 11 Oct 2023 15:47:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79F6AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 15:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54EA040347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 15:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54EA040347
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JGClhoAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQmEHUGR9nXq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 15:47:06 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3592040184
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 15:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3592040184
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-27763c2c22eso4371858a91.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697039225; x=1697644025;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EE5ap+Dur4ncULreHDrHsnDe3Sv6isz8UgK7sSfmbvM=;
 b=JGClhoADn8/AHpF/wOAbaAiOYmqKgLYOMXLmFTQkF3LpPphQsm6IniKcnQ2b+fwJzl
 t1KT/F1ZvgielcNjEYjwNPJEqaiTc09PQEaGEoWyWDas++hxeB6Z78g0jHGvXJTJtpHl
 f1PKcOqPZgeKWkAoM0TrTIOaw5QGPAhQbVbjyB/aClbLEa0OAxPKk2KJaZK2sQBiTlFi
 2MIPgsjfXGaubHZzSGAU/+W6MosSnzK/RR9WeCDwDvDzvqJbjM9NvNteWOw+FaAThX/z
 y/FqE7a66XTQGsR6XC59/pMTUwhH5T9D/y6DTNfuRWJ/MtYRMrbmsFxZLOlvNJzVOlhl
 22hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697039225; x=1697644025;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EE5ap+Dur4ncULreHDrHsnDe3Sv6isz8UgK7sSfmbvM=;
 b=lvBIK07GCmCsHe9GsmPnLZhxREX92y3eEAdAv1vqH+XmQRpAEugp/japesBUh6/IDY
 RNC+Om+PhFEfyvnMG2O6TTKgmoPcwpcVlvVRg7SH9qDybZAeYkNt9J6GFPkmK7ZnpbFs
 wi1k/9Txh9TZAtt7uKTp+mcfJ9lJnmASHEixPVaRCfI42Z/D9CgBSvYDixFJjKbzuXTY
 3np79z+o/Vk5DPWNDt3Oa5S1DePbt2JCaKzs+Gg4sWZifbHUl3n/8y26C+q3bNuajhaA
 lGW33Bn5i4QftwPAap/bBu2uoX2VWhF3cQyJtCC+ZDB9BBo0Uv6lCNz23pArZGyvA//r
 gXGQ==
X-Gm-Message-State: AOJu0YyPss5N5PRYrhuAcuRXpzIfmKP36OtsQPVoJPxE4AGK+SZe4u5r
 uSvSqxKpzjAee8zsj9684XA=
X-Google-Smtp-Source: AGHT+IGslUO1U3dFUZOHdpoPhO//SZ1QgQMJH2XqtmCUGXI+K2LWW0PH/K8qrQ2wXoMvfmUEkYJ+8Q==
X-Received: by 2002:a17:90b:3145:b0:276:cd68:608d with SMTP id
 ip5-20020a17090b314500b00276cd68608dmr16591502pjb.22.1697039225479; 
 Wed, 11 Oct 2023 08:47:05 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a17090aeb0500b0027d0a60b9c9sm61178pjz.28.2023.10.11.08.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 08:47:04 -0700 (PDT)
Message-ID: <187ea1dc-4c7d-4dee-9dfc-15f121320d0b@gmail.com>
Date: Wed, 11 Oct 2023 08:47:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove extra unlock for the mutex
Content-Language: en-US
To: Kuniyuki Iwashima <kuniyu@amazon.com>
References: <ab48efc3-9f40-4eed-bdb1-4ce04d3c55cf@gmail.com>
 <20231011002814.77527-1-kuniyu@amazon.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20231011002814.77527-1-kuniyu@amazon.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 singhabhinav9051571833@gmail.com, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 10/10/2023 5:28 PM, Kuniyuki Iwashima wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> Date: Tue, 10 Oct 2023 15:51:13 -0700
>> On 10/10/23 15:46, Abhinav Singh wrote:
>>> There is a double unlock on mutex. This can cause undefined behaviour.
>>
>> Where is the double unlock of head->lock (which is a spinlock and not a
>> mutex, btw)?
> 
> Maybe head is just confused with the preceding head2 as the two are
> the same type of struct.  They are pointers of different hash tables
> though.

Suspecting that much as well, though wanted to read it from the submitter.
-- 
Florian
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
