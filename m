Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF80026FA6B
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 22:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952367; cv=none; b=eZ4XsdmalazMYKtm+OW94W8X9eFNSuejBz5vOBQVLxUflPtA3gvRX8wOK97HAORfbsb7xK/jiRcpgrP09Q1391IDeNFdoBNQGMaLvvSpzzM3j6pfAjHfTJstBXpOnQ04IcPUAXr5dVcFY3ANPoU/L97+di9lKc6+51mEkMFx6Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952367; c=relaxed/simple;
	bh=7NRYbwbYrh3x1KViQ1U6RIE08C8vCKcJ8G+srM/U/p8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVbGBxONnq0IjNxvsjR/gHSySIlgFYbsi2/2y+HJNeZ7Tvp/WnJPsDOHttMtZSSUTFUtDesGI782/hVIts5QEsbKXvQKrlGXMs8xm/p5jPtm8r74IeL7wfBvrRqROm0TVPC78PICowUcyi84q0Q4XjoTtuZIG0H2jxeH4u98L1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Sb60qK0i; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Sb60qK0i"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3dc7ffeb9b8so14615865ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 15:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747952364; x=1748557164; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T2BBhyB5BSe8xiN4xkcpWffnGhtL3C+c766u9Ynb8BA=;
        b=Sb60qK0iyMt4ZuYB1jdRf3UjO6tn2rSreXoC+s+AWhrUvFjFvUnyuYTFlkEjz8OqLf
         HLzfa9EJKXxPn0Z8KnOHHdZ+MeYnYiiOx3bVWn0S2p4ltHe4XSD1stwegmDbHGWDLEAS
         TKlEJIKfi+AyNamRMLzR2U2re6tagMLGXdnRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952364; x=1748557164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2BBhyB5BSe8xiN4xkcpWffnGhtL3C+c766u9Ynb8BA=;
        b=GoBGMy1nenCQYEOYjiMQYlB/9NsHrW9wSyqHfWIR2s/sB6XYi5NVxC+Zc4bJcCQhll
         Zj42ud8ETNTjD5y9x1nc2a0Ar6IGQn+TmvMGUHD8IhPheei5cDOYH2Ji0G7LNxBXSCAs
         foJl4D62ywv4t0kZcUqjydl19xd4lwwn9XONBqdT4mFmQc5KeKD/sKwGrNfBrO9j7Mg9
         aNN9N7B/jvKfkq/ryT6O+hNbY3p+GO1xQAKogZKxbCzWv4cMlgsfpw5QsfLLp7rx2dx1
         POUlhJgUmwBSe9MSbmyW45IOKMwjfttJF0zqViXa1tcH+DseDemoZNj0VmWmkfFNpMy9
         EGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQIlpqMXZIgem9cbI60pFt2YoI/bgsXH8pPzNPrauU8tTTlfZ8EqBMVk3RMfqznB7EY/N4HvBBsEM4qDMiTVPhOlZdNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YypKjmZ8hvRJJUV8qunKFiHMlPmDRrY1tg8EhrmtTkhQnojnmNq
	N1cHFS3C23DQ7hhfBEjxn23NYwRc76xD0K/AUQDhy8K0B7lnJ94udci1aeB5NPIIZ2s=
X-Gm-Gg: ASbGnctKA/Ug1Y13hI6MXYaeaP/tHrBNnfIArk+EU0KtPAVEmvWy2bbNfXuHqjn0d8H
	H+t/9R5BGhagj2LrSc4lyaeZElczGmo2VduNzEPznTsK7ZA/Om4y8rFbYLnRIyYj64+l1ByEpIE
	Gvfh4ZObKsF9dmaqKuWfm+tqObI5GQE7+kymKa9ZYXcLUFrqV1c46SmSr+Ao776eDIWOS4xUy01
	iYI04F1D7Nrr4NkoHzrX029BlZTaaqGlLD9VYhaGNemtzX2FlyW/rCeXx4/xzH6enQFg8mCq5uL
	MTnPeaWa64OF4lRRmhjSjtIw51PJ0Wn+zHhNa25ekSy8mIqUzBtGeEtoZwhwZSHOZ/cQSMd0
X-Google-Smtp-Source: AGHT+IGIm2be03aa+hk73LqpnK7jFcUNiFbXggRZAdWiAlqqdT6OIX3F0RPmogpvOlodCQDE5M6LuQ==
X-Received: by 2002:a05:6e02:3709:b0:3dc:787f:2bb5 with SMTP id e9e14a558f8ab-3dc93407c47mr9424535ab.19.1747952363816;
        Thu, 22 May 2025 15:19:23 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a460sm3349280173.26.2025.05.22.15.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:19:23 -0700 (PDT)
Message-ID: <73a4b1c9-44b4-4f06-a766-ea7ed391c578@linuxfoundation.org>
Date: Thu, 22 May 2025 16:19:22 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: firmware: Add details in error logging
To: Harshal <embedkari167@gmail.com>, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250516153955.111815-1-embedkari167@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250516153955.111815-1-embedkari167@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 09:39, Harshal wrote:
> Specify details in logs of failed cases
> 
> Use die() instead of exit() when write to
> sys_path fails

Please explain why this change is needed?

> 
> Signed-off-by: Harshal <embedkari167@gmail.com>
> ---
>   tools/testing/selftests/firmware/fw_namespace.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/testing/selftests/firmware/fw_namespace.c b/tools/testing/selftests/firmware/fw_namespace.c
> index 04757dc7e546..deff7f57b694 100644
> --- a/tools/testing/selftests/firmware/fw_namespace.c
> +++ b/tools/testing/selftests/firmware/fw_namespace.c
> @@ -38,10 +38,11 @@ static void trigger_fw(const char *fw_name, const char *sys_path)
>   
>   	fd = open(sys_path, O_WRONLY);
>   	if (fd < 0)
> -		die("open failed: %s\n",
> +		die("open of sys_path failed: %s\n",
>   		    strerror(errno));
>   	if (write(fd, fw_name, strlen(fw_name)) != strlen(fw_name))
> -		exit(EXIT_FAILURE);
> +		die("write to sys_path failed: %s\n",
> +		    strerror(errno));

Hmm. Wrapper scripts key off of the EXIT_FAILURE - how does
the output change with this change?

>   	close(fd);
>   }
>   
> @@ -52,10 +53,10 @@ static void setup_fw(const char *fw_path)
>   
>   	fd = open(fw_path, O_WRONLY | O_CREAT, 0600);
>   	if (fd < 0)
> -		die("open failed: %s\n",
> +		die("open of firmware file failed: %s\n",
>   		    strerror(errno));
>   	if (write(fd, fw, sizeof(fw) -1) != sizeof(fw) -1)
> -		die("write failed: %s\n",
> +		die("write to firmware file failed: %s\n",
>   		    strerror(errno));
>   	close(fd);
>   }
> @@ -66,7 +67,7 @@ static bool test_fw_in_ns(const char *fw_name, const char *sys_path, bool block_
>   
>   	if (block_fw_in_parent_ns)
>   		if (mount("test", "/lib/firmware", "tmpfs", MS_RDONLY, NULL) == -1)
> -			die("blocking firmware in parent ns failed\n");
> +			die("blocking firmware in parent namespace failed\n");
>   
>   	child = fork();
>   	if (child == -1) {
> @@ -99,11 +100,11 @@ static bool test_fw_in_ns(const char *fw_name, const char *sys_path, bool block_
>   			strerror(errno));
>   	}
>   	if (mount(NULL, "/", NULL, MS_SLAVE|MS_REC, NULL) == -1)
> -		die("remount root in child ns failed\n");
> +		die("remount root in child namespace failed\n");
>   
>   	if (!block_fw_in_parent_ns) {
>   		if (mount("test", "/lib/firmware", "tmpfs", MS_RDONLY, NULL) == -1)
> -			die("blocking firmware in child ns failed\n");
> +			die("blocking firmware in child namespace failed\n");
>   	} else
>   		umount("/lib/firmware");
>   
> @@ -129,8 +130,8 @@ int main(int argc, char **argv)
>   		die("error: failed to build full fw_path\n");
>   
>   	setup_fw(fw_path);
> -
>   	setvbuf(stdout, NULL, _IONBF, 0);
> +
>   	/* Positive case: firmware in PID1 mount namespace */
>   	printf("Testing with firmware in parent namespace (assumed to be same file system as PID1)\n");
>   	if (!test_fw_in_ns(fw_name, sys_path, false))

The rest look fine.

thanks,
-- Shuah

