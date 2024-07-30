Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694EE181B87
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 07:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323352; cv=none; b=qjIyQy9o90KCYhOiKHF9yQDynn/MFDRk3E81zs8LBNTOdCp8NLu1/P4Bd80hoj/U+67GpGeFybu53+8EDKUkLfepz0usPaHjSggNVURUlBj+SPiCLTSeqVh/N9sMIz9MFLj8A5ougtm7HgnF+5nw3WlSIgK6Dmg1fyZfzzYEsk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323352; c=relaxed/simple;
	bh=aUXBVwEuXvr8ZvqtozeYi9Lu0ovEhgcBBeJw/0xKvnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aazTixN+zL9CgLjP6LLMo1Vp1Vl4HwfIe1wBnP8pFtB5I3V7fVzcDXsWQPC1/ZbxW8Aym+8+IRQ1rk4kU4itOM6PoyT2yDojvhM6OrnO8J7UaXCOsQurx9c1aoImoHK56LfEOUTgePE6E9RmVjtPhKPhmgzdhI+IfHuOCjtjZ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bNk6KjzU; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bNk6KjzU"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBDAD80B37
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 07:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kqhq4IzlyqYE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jul 2024 07:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=oneukum@suse.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D5DA48128F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5DA48128F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bNk6KjzU
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D5DA48128F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 07:09:09 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso50333881fa.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 00:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722323347; x=1722928147; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVMhYxj4qNnzwO4iqD+18Ai3QfZ1Axvw0kbd5FN9fVs=;
        b=bNk6KjzU7iDMTRbWBuaUdm99zGFav9j1R1OLvVC89C66fxXWyQ5f/jpZGhZgtvnTyC
         s1wLBOKKEXoxeCb+BgRlGTPJkjjwZS9EaZNJPZ5BdJiQynAeN2ofSz8FDu5Jvlb35GhM
         Ef5QMLiUHDXeXB4zgLPKGr+fQWUzQOc32HnYfneXHEEutZVXAAbZPwJzockZavXdWX6h
         lZAZqRUe+e8vN2734wmwgWygRke+d29PwbeFq5zPT8zilojenF31c9B9pe9SO8Kq4Vrd
         EwVF777CAy3iKigPhll1dIEhdhT1PC2y4Rdcl0pGgpjFKkKW8vsiCkOf3B+g8BEMzQMQ
         KDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722323347; x=1722928147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVMhYxj4qNnzwO4iqD+18Ai3QfZ1Axvw0kbd5FN9fVs=;
        b=VYkThm9kw+5oTgmpZou1VZ04fWmBple8juFuN1br+0WJ7uk+zePpEP1Dtaxao+Nb0m
         YaMBwNtzflHqfjje1EscQqjfc1oR4jdbimH3Z6CiGVfiXvo+Dng75eWCWdfLuWHU28ni
         WusUQi8DubAQuVcKm6I3M2aN7sA/llLwbRrZdtHo1sYKqhumhgoS/eVHKu7YZyemkGx/
         6nMC5Gjk/YeDgU0xueGKrI6ViQZGhA9BxF1bqouBa8kTP1cSMTXWWlYA/7XEJ2ECQMuF
         77nFrVz2Jihjv31s4DKfDoTH1EdChov3fwb2pMcudPGCXm4f5s7f+ptqg1mkWHJ6Blsg
         ORFg==
X-Forwarded-Encrypted: i=1; AJvYcCXCXInYaZwVORzUX0uhZy/7Y5MaW6k0F9fyGBDqgY4zfMA217U2JiAQOIuIFv+MaxN3HLA5ZWsvNAbUrmrv7udtkltSaW1l6j4chu1eF64AtYQq/TEwm142GvMnD9Mb
X-Gm-Message-State: AOJu0YyM+S49lm46s7AK3tLOc0EIe8GtymESTv7X5jw1Oppf78rnX6p0
	FopfGY4OSeSHOzTeK4ar9SdCd0rLb31QhVGMaKMkfPvMtN57a1N0FahdLXPjYVs=
X-Google-Smtp-Source: AGHT+IFeNNsOEIsAWFdV4yWL2SghnTx8Z1eLwgdOiT5AgajQW3bsdyzMbPjzTwMNqrHkz03C42ZeVg==
X-Received: by 2002:a2e:7c02:0:b0:2ef:2e8f:73e9 with SMTP id 38308e7fff4ca-2f12ee1bd2dmr64461041fa.37.1722323346904;
        Tue, 30 Jul 2024 00:09:06 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5afb9422c41sm5153828a12.82.2024.07.30.00.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 00:09:06 -0700 (PDT)
Message-ID: <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
Date: Tue, 30 Jul 2024 09:09:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
 linux-usb@vger.kernel.org, skhan@linuxfoundation.org,
 dan.carpenter@linaro.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240729182348.451436-1-abhishektamboli9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29.07.24 20:23, Abhishek Tamboli wrote:
> Change bl_len from u16 to u32 to accommodate the necessary bit shifts.

Hi,

while this patch is technically correct, it papers over the issue.
Could you please

1. use a constant, where a constant is used
2. use the macros for converting endianness

	Regards
		Oliver

