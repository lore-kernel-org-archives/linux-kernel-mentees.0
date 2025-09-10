Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4393D26FD97
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 10 Sep 2025 11:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502981; cv=none; b=UUJm/HDM9rYYnkRqRIYDELbUxA093xEfqP6WRY4WR/OB9XfJQUbt3vG1VJNGyKxH4v5hRAefJ9ytXyxUD0fvVdGgo+yamqArRh9YFoDB/X6hEpOEV469jzZQ4QW0Yfh/l9bTdQUfTlV2u+KvlH6ZJmtTWsEHEZRUm2j/6WcOK/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502981; c=relaxed/simple;
	bh=2rASD+s8QFj1eS4oF5z2j1I3AkxBGsqd2eCLiUasoB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMClTtsWORJIXiEjoKFS6AAduV8QTykj53IYrJMtWEpItL5dcS9dLV2CTXi5auTqvpWrCuuRgrnYTvyWoAbZogvq5y8/d4j9B5yWs4y7naF8/kJ8iJgaABv7yD5w+d7K+zSufsPz77/XFbmrQuxuSDsgcBXjtabf3BftWwe3AzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4uGCasw; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4uGCasw"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4c8bee055cso5655146a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 10 Sep 2025 04:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757502978; x=1758107778; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZbusY2YZDJHUgvIqP5aq8nFaPzc4Ije89rvbFvkmb4=;
        b=R4uGCaswN7j4Lu/igYseT/rrNI3aoo/gsfZyNKlBBuqy7UuQjVChe3DacM6Mpq6L98
         0gvklv8Wj4cKR/csIfPc1N04xGLTyKy02Hn0x6z+/KZ+imIhU8bvhI6orAfcQ8aXorSX
         h2Z7wucUoMNrB0Z5BgIJtDy6yJSxpuAED62Bq6d38kGKBlpvMldFrkbeVd/sHipDjz8P
         tLHdhCIf6t9upIlh+g5uV0v/VILWe4aIiraak0r0uGnMk+nKbd1zdqh9Y+cNV4EUTgz7
         9r5Su6z4k2S3pEKedGi+cqSMJc07BhUR07s6dSbzvwphQdc/k54O6JMjxI/pDTcW23Fy
         lCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757502978; x=1758107778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZbusY2YZDJHUgvIqP5aq8nFaPzc4Ije89rvbFvkmb4=;
        b=FW2uC3rOsWgmr0lt2lyGeaDjCV2YCAz0+UU+BkgXWoGgaW3J3C889HGswnPXj3TUFs
         otYeodoZ1Yg8TfztHLJUnElZkDh/nRcK9IljoPsdIzPMHgiB5Y9LbD1a+7Fk2TcvSH6p
         IMJAC53EqMFdIJBzFzhQuu3Oc1MLQDnVyMyldKi/18OdIyRsZ6NugyPYwmnIEwDrIVhE
         6t+TA4rsbnbCO7kYPyvT2Sq1S6wGlOTBzjheDxJFPtyMPI6EfnxE9F70RzvLlI2tudqn
         lgjLKNOX664sj/DtGYhJfnekJaZ1hgCAukY/AGdVJt5J7Ug3r7pQdeH/khVGljrFc/oM
         n2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWZPPFqBrIMNFMaZZwgvqxjIMITfyQ7G7cotV06Te8rrNzE0Yn7HAdUTr96M2dA1IMXSU/TEAeg4EN5GCjM5PqH9FOnNg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa/WNGErRKrjdVeKEzdmKuW4TYEiRCqpgeD5zHBmW2gDpqC16x
	3YT4eP9OwzYW9k9ipD3EeSj86XM2uOjJvpvI/i3Sdn3rqFlbJXCM0cuu
X-Gm-Gg: ASbGncsZCOPbtOt6bzRNcczcoZwhgsv9lo4vAiJPA5F7y9y+9tbSfuv4yeWoC/F8YXc
	w4AP9SvuARrkfGbfj17anzuJod0fnR3suTUKKXIq7p6w3cAaISRZTX0LM3RhdMCNheg/Xa/eAgX
	86lfxkhdVGgTwUCyVWr7INpvZdccBo9ZnOc7srF73JWUvnshlRfaWaoev41s4Hbdr/Y+l/KOb+4
	uJ8kMLWbwTKpec/ayco0vuDYv4KFLMSYzJKmiLpjIRTzPUxYKw5m4UljvdRPuuuf97Lk45hcJ0O
	znhDvnuPD2wfruGB7132gHEE6gE2JDQLbGanXFYOlOiD1aHxOE21HUD4VPyS/3gEnKKQaPxhweF
	aqATf/4S+y5h7rYWJmieh35wyqYdKq/j4CAlWOFiMxDku4sxrZQ0B9TBmMbgbndPMseO+9QVrOS
	vMn/veB8C0XDJhTBoX4mNM3eoJbeLozKQjBiTD6veeu1+MES/rXalLJDlV00b5k0rA
X-Google-Smtp-Source: AGHT+IHYJUR0byJaWrm8+KNFqANo8zElvFbaG5ym9raoJ7ygPAvqG0hpZXLy2KjyUuPvUxUS73wvMQ==
X-Received: by 2002:a17:902:fc45:b0:246:464d:1194 with SMTP id d9443c01a7336-2516d81836dmr194708695ad.2.1757502978484;
        Wed, 10 Sep 2025 04:16:18 -0700 (PDT)
Received: from ?IPV6:2001:b400:e28d:ed7:4d5a:39b4:7c51:4c71? (2001-b400-e28d-0ed7-4d5a-39b4-7c51-4c71.emome-ip6.hinet.net. [2001:b400:e28d:ed7:4d5a:39b4:7c51:4c71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2ac085f9sm23656115ad.117.2025.09.10.04.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 04:16:18 -0700 (PDT)
Message-ID: <270488a6-ec6b-4b38-aa30-b5c9e08cdd18@gmail.com>
Date: Wed, 10 Sep 2025 19:16:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/net: fix unused return value warnings in ksft.h
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250906-selftests-net-ksft-v1-1-f1577cea3f68@gmail.com>
 <20250908182018.28d9ff10@kernel.org>
 <a3d1c5ca-cdce-428d-8c1c-6a1f59e2dd76@gmail.com>
 <20250909162551.5224a3dc@kernel.org>
Content-Language: en-US
From: "Nai-Chen(Simone) Cheng" <bleach1827@gmail.com>
In-Reply-To: <20250909162551.5224a3dc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Jakub,

On 2025-09-10 07:25, Jakub Kicinski wrote:
> Sounds good!

I tried the direct void casting approach, but it still generates 
warnings with GCC 14.2.0:
     (void)write(fd, msg, sizeof(msg));
     still shows: warning: ignoring return value of 'write'...

After further researching, I found this appears to be a known GCC/glibc 
issue dating back to 2015 where direct void casting doesn't work for 
functions with __warn_unused_result__. [1] Since this is a long-standing 
toolchain issue and direct void casting won't suppress warning, I think 
you can skip this patch. Thank you!

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66425

Best Regards,
Nai-Chen Cheng
