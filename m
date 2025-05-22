Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C231A25D542
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 21:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747950927; cv=none; b=S8cy/mDgZsoXkcbP4Je84P/8kwXSqZ7CYJAfuvrY++H6Hx/zoucF4OYgukxU7V/xHHPBBFRh/FNQ49f2neUpZfsPkpAH/5eZIDVToPo8WLWhlc69flvOjfyKzhKg+F8wDmiwtuCwAnu5GSuDEL4XQuwzK0qu+2xuI2BvoYvEMbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747950927; c=relaxed/simple;
	bh=XmeeadVd6Z+Q4b8dcysuWdnWYCDg66vF0EY5hAY70Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvY6p7YGzfa2JWDwCUgsi9/R4RxbxqlSbMoZxRqrgz3Sir41nb0GHgaLvSfrUoHjfmTbNPIfwzjB++1wHfD6qU25xgc0cFsnkyJiTvYe4yIHKB0ERKzsX0cPrQ6+uHEinytjx/K2n0GtynbG55+xBZKRkZ2tUUg/k5iuSW43WJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=frvaVOiA; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="frvaVOiA"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3dc7c19a4c6so11997285ab.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 14:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747950925; x=1748555725; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsNTc721PK66RA8sSI/Jw77VKtdJQEKr1LL6A2sC2Jw=;
        b=frvaVOiAJ5MgG1CVtO4Bmxnh7tmpM0ln1gU3bNwoCkGm8metndjxW+9gdxQm1zRMF/
         xappAKS2n7iFwwNux02BwMVyTuFbNgyMKm+4JZUrCSt+VSmUjJ+JFZWVNo3/KA+yb/jM
         UTM71h4VzSh+ipHV2VHM5EVai02cNakQ1sJmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747950925; x=1748555725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsNTc721PK66RA8sSI/Jw77VKtdJQEKr1LL6A2sC2Jw=;
        b=f4gTvJsgIh2lTVJevhSF0P/AOP4RpGSoNZtvYHnYcKJjhcCZ4gC+4EVc8kmOQSWKwu
         NYbsYeiT5zztBI3ZOPIYVy0WF17/1lAbsDOTeElRyD2PUiVU9jA9UzozvkYfjQx/ko1Z
         zlTyZWlY7TF+Lg9H0vYMpYuNp7fxAjS8ZoC1OpzRK5cezPMLI43Pu6RSVPOTSR361/jA
         jSIeiQf3Jzf3ACZPL+DD6tsK7jVGXa7+qEV4e6LaoEdY5m30BBG7up8tZY2HnAff+REf
         kx157dWhPqGTe2Mq1lm+B2Aq+h3B7dbfBvOpSsh4huzotHTunwWqFI/deEgT3esuCZOY
         2OEA==
X-Forwarded-Encrypted: i=1; AJvYcCWXeb7bAPYLd/ZGHLtDe73uOLYdn4BDIEA5xjEcvqWXPSb2qvJfK2KauQEO1mPKR3FU2AgQGCPnqn09oHobXNKKQ9PShA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwT/Td0Qapo8xE+m5nA4/aTbfpOgqxccSXlSTVrVJqpA/wVDBfT
	Jne+5tefh1CYWl7uJwOJnS2yq1tmrVWsodLuoqYOkb2PBZc3tLfr1nkmb8+8102s8cg=
X-Gm-Gg: ASbGncvk+BqTUk2v49Qb5xH7oXJA0OifhI4MyjE+g+QYmkefDK7Jyl3fZ7nzv9yPrVT
	0Pgn3spJ3UKRD72rh9mM3hBhSQrpRVrQaioeNRPCvnY+OkcFBZb7+1QeQZTKodvrvY7c3QdUNkY
	azz3KG7uH3uvZjYHVDyxBa4Cr8hwErjKPBHFB4KV6RTXBUt+WiDOKEKxH1Pl50s/Z+Mn5h2Uw6Q
	URSAdo8ftDs3N1xk4XfgFLostseyTmwJpvtgHZqeIEdAbcnTQUTfLGQV7pUu1aJW3wqe9cYFqch
	6yghSbSbOoq0CCk9vTm8jqA4/Ya5kDNHE3Yok/UfhjEaZQxIHoaNWZWSZRdvkg==
X-Google-Smtp-Source: AGHT+IGTZWRdRAPzUj9NunbARRKcbmYiwV5p5BdqQMJqFvX9jNL1fBlhQhdNQn649bTrCNVyXMQ+HQ==
X-Received: by 2002:a05:6e02:1569:b0:3dc:8a5f:7cbf with SMTP id e9e14a558f8ab-3dc9323abf9mr8551935ab.1.1747950924712;
        Thu, 22 May 2025 14:55:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc899a580asm8532895ab.9.2025.05.22.14.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:55:24 -0700 (PDT)
Message-ID: <d51263a0-50df-490c-84c9-ebd0ac49d7d1@linuxfoundation.org>
Date: Thu, 22 May 2025 15:55:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [PATCH] selftests : timers : valid-adjtimex.c : Fixed style
 checks
To: rujra <braker.noob.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <CAG+54DbGpNn-Ps=djpsUy+K-6V+eoNcMbTcJoW8W5upz2OKn+g@mail.gmail.com>
 <CAG+54DZ1wDTdWPQSw01G4YgTdihezQ966LGa6ttmBgT2D2gTyg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAG+54DZ1wDTdWPQSw01G4YgTdihezQ966LGa6ttmBgT2D2gTyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/25 19:44, rujra wrote:
> fixed style checks according to Linux Kernel Coding Style standards.

Fixes

> 
> 
> 1 : fixed alignment of parenthesis.
> LOG : CHECK: Alignment should match open parenthesis
> +                       printf("ERROR: out of range value %ld actually set!\n",
> +                                       tx.freq);
> 
> 2 : fixed alignment of parenthesis.
> LOG : CHECK: Alignment should match open parenthesis
> +                               printf("Error: No failure on invalid
> ADJ_FREQUENCY %ld\n",
> +                                       invalid_freq[i]);
> 
> 3 : fixed line length of 106 to 100 and less.
> LOG :  CHECK: line length of 106 exceeds 100 columns
> +               printf("Invalid (sec: %ld  usec: %ld) did not fail! ",
> tmx.time.tv_sec, tmx.time.tv_usec);

Please refer to a few logs for examples on how to write change logs.
Also check kernel documentation on submitting patches.

thanks,
-- Shuah
