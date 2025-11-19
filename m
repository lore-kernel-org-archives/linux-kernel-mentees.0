Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5646130CD8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 04:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763527875; cv=none; b=PB47OvgXn7nq9GAPh1GMqBDR8gu+qDEC9PC7NcbVVRfLzWzd1QCaogo4Yw+gTo0A/5dx6lt6wNn8aFD6B/fhGPCJc+ZWXF2y2ObLLhcr/gTlwAscXDvKz87prwAcQdWJmHjXmwRw+ZhCP+fmcBY1tyiXIunsVEoq6OAFLXSpc0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763527875; c=relaxed/simple;
	bh=yw4RynQSIXt3eTe4YP8FX1OSjAR1WwOZzax1dfsPlJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=fqN6EdvqYpN8a6Yp0tBHhriWsccaY+GUt6S+n+NEcPqCgzC7Ps44+RM0PzdtDJ1UUchOsKgrJmBSFAYqY3KrWVgX/p25y9SRWdOyTwiaOqKHbOEj+xKED9fkrs8Wf+oqoaPhot/01rJXo/ivpFuI2oCztk1FP/90p19edCZ8igg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsCGlbm8; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsCGlbm8"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00BA2847C1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 04:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yq_MNG_drTOB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 04:51:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9B47847C0
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9B47847C0
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HsCGlbm8
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B9B47847C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 04:51:07 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7ba49f92362so521579b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 20:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763527867; x=1764132667; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BAqS8NkYodTkoqyzgw7YJU97B39PeKluqeYwNTfeVOA=;
        b=HsCGlbm8hZuGEK4HLpmSrftvLKmrg6dzwOHSeWGCpNTUzp0EukMRX5EeLx3KWqVk1e
         IK/LJl9hL+auILhf+UN6hbwkew2jvwBnqvffo2GH/soSRv9t39iMeMuNL23jnG65ytNU
         uYxI7JZiv4Q2iLmUepihyxN+JS1RbqWfaQjgMt2NEOuG1kTjWU/mcTwRaJ2IMi8J8p4D
         73K9zpjo0uUFjami8HSSuzr89LcZ7qETkjW4pXoHYoD2LW/xlUrtB/VXYZNJfSTJWmnb
         OTPNsaGFP1ijySCkomavzdB+N7qGXZI8A60Rk8qviasGAi0ydmsbjOJ8V4GiODMZTv0X
         m9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763527867; x=1764132667;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAqS8NkYodTkoqyzgw7YJU97B39PeKluqeYwNTfeVOA=;
        b=D6CuyHxvy19HTaJlCBPwXtJqIHcqqbmlB6c5AYGr44ZFFl+ry6I17PmZe5v9S8HSwJ
         vHDP1pMlsQTLEkbf5L7nddxYSyueLh4awhgQIuO18yH933xwmmt9g8Qv3/BAEQPfjYOc
         qojqf0d2lYwzlxdGeoMOcI6lMyRx/uAJxP1nmF0TxyHDrxd7g4E7jakoOjbjj17/Jd4K
         h/cKakuUsHlY8rOsicsUeDev78a4g+tReTJq/nRrBQ1dsSm0J9TQUF3ECIU6WPW7/epd
         m5fG6i460HC0JzGe424wBux6X/HsJ88CVaPrYfpqlS5BPE4CGkv2qD62TZSoXoHb/g7S
         iLhw==
X-Forwarded-Encrypted: i=1; AJvYcCV+i/NC9e7bAYLGl9os5X6fAVj3x7VchtSV4iG5JXrpvcgtJxgnrO7yZ9K6PP8dVLdWGxoQI3P84AkAhdWMM805bgpIEw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzg/o26w0t6LqwnoPRFl/pKglVr+p9G8YpQjCZ1w8irmg4O/YkI
	EkPme/G3DG5ggUwt0Q0ZJKSKWS36jJ6bN2nDy54C07ZYuyXAU5efHqag
X-Gm-Gg: ASbGncunlGRCk0SvxMMCpW4kZEi54aFLbQoFQYdKD252aaroqnrvbtRU4dg58S7LzC9
	0V9M8mtZZKYfbgce2zBWztS+S9M0NK5Qf9lG1jaxmMKnr1UJMwqvSX7GvWulG2zXiEq/jWudxi/
	G2+ASNgnaKeiTOXNUh+zJ4F9yZ3apQcZwB3rRfCT9APINJoXdbrIEBQpES5yjL0Qo3KcZMLL7sD
	SDjIsJsW/7mkcH30bHgK4S5uUUWFPZ1Gldtb0oCpKfIY2wZoQez/HyiM/exkkr5SmpeuUChw4jO
	WBs7IIBmirxuBf+96LbJng0JuNU3DnopHvQIFLfnM0dAGH79iUDpEvkRbxh2O+KSsoQbTcqLiMk
	bjilzHpP/pNxV4E4qRL7M+rAW0kAs63cd/2Nmm2uEiTrgQ6Yqd8C7x4JTP0xnNOzYnp6ohDLMQl
	8fA2Kbb7XmcwEGGa4X/S1MQ+vBAzdjkMfIfz7MbvmuIxuWGLiWmMbeyi05Ap+TvowV54qvnOWTs
	TuZUUSRdFnSWYoHcBIRW6maRBCady56VZ5sWw==
X-Google-Smtp-Source: AGHT+IH1OnrIpHIaQrOaPNXSNfa+okDc4o69TxGrgfyoJLT+mz+U/ApiuqshLE6pxDYW+lO3R1pvUA==
X-Received: by 2002:a05:6a00:2383:b0:7aa:d1d4:bb7b with SMTP id d2e1a72fcca58-7c2c33f4f40mr1469643b3a.16.1763527866846;
        Tue, 18 Nov 2025 20:51:06 -0800 (PST)
Received: from [172.16.132.48] ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aede04sm18160310b3a.11.2025.11.18.20.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 20:51:06 -0800 (PST)
Message-ID: <ef7e9698-db22-40a9-afb7-7a5204c579ac@gmail.com>
Date: Wed, 19 Nov 2025 10:21:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firewire: Replace ENOSYS with appropriate error codes
To: o-takashi@sakamocchi.jp
References: <20251117110901.686828-1-nirbhay.lkd@gmail.com>
 <20251117113107.GA663208@workstation.local>
Content-Language: en-US
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
In-Reply-To: <20251117113107.GA663208@workstation.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/25 5:01 PM, Takashi Sakamoto wrote:
> Hi,
>   
> Yes. The newly-written code should not use ENOSYS for cadual use, indeed.
> 
>   
> There is a rest to discuss when changing existing code in respect to
> this topic, since it brings loss of backward-compatibility to userspace
> software. In this reason, I've left them as is.
> 
> If there are any strong and specific reasons to correct them, let us
> change them. Do you have such reasons? For example, Linux kernel
> developer have shared the consensus and decision to ostracize such codes?
> 
> 
> Thanks
> 
> Takashi Sakamoto

Hi Takashi,

Thank you for your detailed review and explanation.

You are absolutely right about the backward compatibility concern. I 
realize now that changing error codes in existing code paths could break 
userspace applications that might be checking for specific error values.

My patch was motivated by the checkpatch.pl warning and the general 
kernel policy that ENOSYS should only mean "invalid syscall number." 
BUt, I didn't fully consider the userspace ABI implications of changing 
error codes in code that's already been released.

I do not have a strong technical reason beyond code correctness to 
justify breaking backward compatibility in this case. Since these 
interfaces are already in use and userspace software may depend on the 
current behavior, the risk of breaking existing applications outweighs 
the benefit of this cleanup.

I withdraw this patch. Thank you for taking the time to explain this, 
its an important lesson about the difference between fixing issues in 
new code versus maintaining stability in existing interfaces.

Thanks,
Nirbhay

