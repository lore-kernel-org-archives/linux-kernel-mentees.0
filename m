Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DA82E973D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Sep 2025 22:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758063565; cv=none; b=LjOuvoQm2IPhHpFGSH5aZ0t4bGAoAkr+JdU2d/rqG9ldM2gVaWsS5KvQHCZesT+vyD/M8CMuMIdF87csmC4weIfjNtcIAuokLYAMSQTpYKdnRD0yM3k3JoJBuEBDLTheKOBwEXFLHDcIEWNxmpMl28EHtK19Oa0tMkYXI8tL0q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758063565; c=relaxed/simple;
	bh=kYWD/1pnHOiVcV/86OAJQo2hlBq8UVutDfZZWO+nnUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHH6Zpa6LCcPu6l0AXNmV8dKC2rqHqTSOaFoPD8rf7bHl4MqHQ1o/aQX7zd2aLQjjQ3QTABfwQQXQlb6poHw8355OAjnTF4zSGNnCMQygmRKf3GSWUAjhb0DFz8tcJzSHZ7nauX7wgYtMXqRo52m8b6TCCPkdB44XJGC4zZY/Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D4C4n+ab; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D4C4n+ab"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-826fe3b3e2cso332093385a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Sep 2025 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758063563; x=1758668363; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+2Sobvr9+5pGFbp47+ByPtEfYFFz5lnTSyJG9VlL420=;
        b=D4C4n+ab0qwvAddzD9303W2vjuURdHDLIY+XFdHw7/s0QirD2EexifGiZJ/7wlo83a
         PKQc0e+/DiP8Ll1pnD0f4zZ5BMrhZjzi9GrcrnoJm2e4pUa5S7m6Z0Wjksja83za897A
         Ff6soR/zVVmLLAdx2reJrNEvcYQ0mhYPVcne4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758063563; x=1758668363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2Sobvr9+5pGFbp47+ByPtEfYFFz5lnTSyJG9VlL420=;
        b=n5KSfCn1bPE7/Xrd7qKHyEImRV5sGqQTP6Bs2ReGGcX/Z+IKCYz8j8DiLBQIbU+Rcy
         8Hm6yH3Ahc5kWCdAbpRR/9ZjQYGlm06K0CCFZdsRKBnLZ6YGBy6JgivcgmXZXi2dBjRb
         rJNVsWMJoIjQer+fveqdwnox9KZCRgEPjuyQDKdfnht/x/2X17u+ylpaMKYj/5B/dZSp
         dLG4Zt0blZbHgRp2P/gQY22V3LP+Fi88eCWO9twctjFSJWTHGmeFn7F9v3msv7gVlRQf
         wrZwj3xzqpdu2EmIrTc4SBcoo2f/uyC1U+zGSqe6kLqs/1Tuj1nKWI/48fSxN/vxL3vf
         oraA==
X-Forwarded-Encrypted: i=1; AJvYcCWfoMWgZ0CTdVjmUGi8gkJvcd1grneI+MN8Tn/3OQkJ0IKyZvrQIkuAQJBjNvjLPHVb6VMvWTnDbTfcdoLNZsc38kizAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZWrahS/Gwafc91pDChAGdIbA1WKcR8Q6oymfE0lYio9pmiIA8
	nfRF+1FqAsFEt+McB5jsgooW5FAxVvxPKmxMIdSuLWRi8f14+jPlre5cuH1Nxw6OUY0=
X-Gm-Gg: ASbGnctqV4eQPyO26znA8AnBtBd9eUV7u956sjvmfZThKqCZl7dn6BmJdzI0kidiSfa
	YtSJMQWCu2B18CVV6INs5iZT2YH1PJIL/U4lFvPh86yCrl7aY5nSaoXpBU9CabkypZQ1BCGpkd8
	SDUz+oAQzoasQ+Ai3PxsuOr4NprP9pqaWsdDi4w1im1PEGGDB64bULaXCt5pIGh+rNs5OSrnCwG
	HtYVuV3E2iIgpVl4ijfD/zwFdvprmHk7e3b5btDWjuvDrwiCibUqmg7EVt0ssBnZkBveuUgx1jV
	FFluOtLu6nt4/14UqVwQm7g1boM5XlU51lIz8SQrmGlCfFcWLbSb+5g7O1qS8UQwZxJL5MXrV4o
	wcrI1CpQnmY43+k9kyzbUpo6wc/FjqR7Wkgk/OjwC+PYmNVihMfjc6joJI8ki4Ajpnf2S5r5/ea
	ZBFRKPRrbd5FTsUaaqPrMoH4EXDlvNjW8CfItZpbM2ZrI=
X-Google-Smtp-Source: AGHT+IHPewFSAtglBYb72x7KGBoL3MPQo1PXWAxums+c5Qp8pXMLQan4rC8XJhOv0uEYkxN+tL5s9A==
X-Received: by 2002:a05:620a:4629:b0:828:ee0c:64da with SMTP id af79cd13be357-8310f02c9fcmr5639285a.43.1758063562631;
        Tue, 16 Sep 2025 15:59:22 -0700 (PDT)
Received: from [192.168.226.35] (207-181-222-53.s5939.c3-0.hnc-cbr1.chi-hnc.il.cable.rcncustomer.com. [207.181.222.53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8281e956653sm613334885a.32.2025.09.16.15.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 15:59:22 -0700 (PDT)
Message-ID: <fef87364-80e9-4cbb-909d-22b1af0e9d3f@linuxfoundation.org>
Date: Tue, 16 Sep 2025 16:59:20 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/Makefile: include $(INSTALL_DEP_TARGETS) in
 clean target to clean net/lib dependency
To: Jakub Kicinski <kuba@kernel.org>, Nai-Chen Cheng <bleach1827@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250910-selftests-makefile-clean-v1-1-29e7f496cd87@gmail.com>
 <20250911164137.29da651f@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250911164137.29da651f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/25 17:41, Jakub Kicinski wrote:
> On Wed, 10 Sep 2025 19:30:32 +0800 Nai-Chen Cheng wrote:
>> The selftests 'make clean' does not clean the net/lib because it only
>> processes $(TARGETS) and ignores $(INSTALL_DEP_TARGETS). This leaves
>> compiled objects in net/lib after cleaning, requiring manual cleanup.
>>
>> Include $(INSTALL_DEP_TARGETS) in clean target to ensure net/lib
>> dependency is properly cleaned.
> 
> Shuah, please LMK if think it makes sense for netdev to take this
> (net/lib is the only DEP_TARGET today).

No problems - take this through netdev

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
