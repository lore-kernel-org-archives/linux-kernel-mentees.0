Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8BA183CC3
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 17:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020129; cv=none; b=oLh4AUQyuysqnm5MCC1fQzcyyrsKSVdFuML5bBSfbLUsy0moxjj+6VFfp0qmhLcubUVN0b39/vH/vLbhxmsQYF5a7Vw/ZmZNSiNZfx6tahBT+8JT7XNwHhuT/UzeqiPl2lCsFnLxnZM6dhUCXbaxMjlEBtExf9C+mzDRqK4cgpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020129; c=relaxed/simple;
	bh=Hm1tGMAS3PPNtzjnDWEzbfiLzrUg9XiJUBFCgHFXZlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7lHpQJ4QVxh1sAm7cew+uyHkkuDrwBxShOqQcr1R2dxmjgCYnHEru5yzh0TytfHmBbYCta+kdcZEGYdjWufyePzzRHR1fJtKIztufuDtx6hfHhSNid17XLBtI98GCn79FppR8OuRxitHPo3yuLLbw5ALqpw29ykyYh4YrHki54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JVLhk6Pu; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JVLhk6Pu"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85b41281b50so2602139f.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748020125; x=1748624925; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TvQKIUZyT1ZR4WNc1oK4VLVb2hGuyqlHiwN2Sazzkw=;
        b=JVLhk6PugMJlHnkl01r9HWTAYf+q9mFWfEr5pRvWKXZC5DHyQoP8JV8tIhk0BHjZvN
         WtGmfTcotcQ+vhBJbeIUjn+A1zDdSNB8YfKXJY2+3lRCNCbjm+W9enS09Q3uZVoXOZqW
         5e9WQz6pVERgXawEwlbNsKt06oBmxsJ70GHD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020125; x=1748624925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TvQKIUZyT1ZR4WNc1oK4VLVb2hGuyqlHiwN2Sazzkw=;
        b=PT0/v0Velj6fju6HgkrE4WtzQ3nNIKokxExY9tXF+S90K7PMp7Hly7Qo+8cdwgVEFU
         E1WiLOStRMf0nlnJJtshN1kF6dFO0k2ksvyRM++mPRswAfrt/epJ9MtzFg5q/Mj9LRSq
         3JZChFlMZ8RY5vzQ+RrvqGnZm6tL1BhM+JEtPqIPLlmBqoc0v69Yj8QbOAPw5zPa5ETJ
         LCG6gYoRb/wNRjdaGX5lcDTL8dCXUJL8qhiZiBVPLgx5hT3SupztWWHqS6qy84VwamoY
         Iic2hheuukk33CBOr7vUZWe4YOrf7zPnxmzVuD4WUKYdoMO2gZsQyofBHe/1LtyWSC6/
         W9pg==
X-Forwarded-Encrypted: i=1; AJvYcCWadBFwCjAJVZDgnyGaECYIMFDS6HHVuWZHnvwYVJNqrdsRD+hoCs5McVYZoibKVhJ5XEXDdfa3UrZAFp/+PGUXxnnyPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YySD4THmuD8kUSpVwv4GS1r8IFdNsgeI6r9zO3BjBLQDYW0rjSb
	2yd+Ehxf+yRcdJvAQJyf+qTbXrwiBsnq9mmpWQ8z5bqT4cInIc/iNL7eeh7suTPgdhI=
X-Gm-Gg: ASbGncvNFwqPNJIoyGStrA/YpHIbvvRWZnIE7q6LJJD1Q6mYcHjpTTn92U0R8xb4Z47
	CIbc/zcVRetJwx+221TV1CckEqLgtrGu7hKJz8XUB9uLp1F/VN59UAOKmUCtUWwyJgCBaXQbB3z
	NYTMd1uTXgRwUn02Vc5dFeiIiId1sSfcR163eZqRAphtI9ZlSoo2FflU4y9Y4dO88m2iaVbPIPC
	iu+20jzF4dDy7Nd+qLl8iYrM6B4A9ORvCeZEC/VDG0NCz7Ps1ldIr6Zne3i/8ACRWzdPkDn5WU9
	ulQAYWrMwk8KVaOCKkt1WuifnvltgjdjW2d3+/KizMwvL+auWZRM3YuToYZ1lQ==
X-Google-Smtp-Source: AGHT+IEuuWNkmw7BtT7vHxd95eHS8JLmv0pSVeN5jtMEWq95lJvQpjD3ML+X+PoouGtHv08OC8gqSA==
X-Received: by 2002:a05:6602:379b:b0:85b:4ad1:70e with SMTP id ca18e2360f4ac-86cbb8706c1mr22358239f.6.1748020124313;
        Fri, 23 May 2025 10:08:44 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a5b2sm3702964173.9.2025.05.23.10.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:08:43 -0700 (PDT)
Message-ID: <d86594f5-c6d0-4692-b1ec-41d76f947b7e@linuxfoundation.org>
Date: Fri, 23 May 2025 11:08:43 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: timers: valid-adjtimex: fix coding style
 issues
To: Rujra Bhatt <braker.noob.kernel@gmail.com>, shuah@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <aC_yu6Ll2E-3qRHj@brak3r-Ubuntu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aC_yu6Ll2E-3qRHj@brak3r-Ubuntu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/25 21:59, Rujra Bhatt wrote:
> 
> This patch corrects minor coding style issues to comply with the Linux kernel coding style:
> 
> - Align closing parentheses to match opening ones in printf statements.
> - Break long lines to keep them within the 100-column limit.
> 
> These changes address warnings reported by checkpatch.pl and do not
> affect functionality.
> 
> changes in v2 :
> - Resubmitted the patch with a properly formatted commit message,
> following patch submission guidelines, as suggested by Shuah Khan.
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

Sorry - I didn't realize these are all coding style related
printf - I am no longer concerned about the length of print
statements.

It is too much churn with little benefit.

thanks,
-- Shuah
