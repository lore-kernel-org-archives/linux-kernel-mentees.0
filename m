Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCC9303DE5
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 20:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752179142; cv=none; b=LGV2qs8DCcwzRwWcRSbJPeD18eoiA1RClCzgTU3Ifck7OZ7p0LQKlCiFzJDu6+EId+M0yuJqNak4WoSnUdLtHhs0N6opRQGzjuWS1Ab7sT0ZlvVOj3htogjsP0iBTK8bko7f0oeWdPitnmhL7JegPIVxkMtKdhUt1+MjBRc1mOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752179142; c=relaxed/simple;
	bh=dpAvXXm8l9op444PryNU84jOrFviRRWTvceQmBQJj7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmgVdRpNJo6TS5ssG147/IhxcX2g5XCC3QhyqsVgW3EmZ6OhbbIgxVVAgUzGBX8Sb0iZrQBOgS5rQc/nL+LgnskOYpUlAOndg4nWoUR23bF6BOo633l1QW23ap1/kGmUhA6I+f2uNucX/8OQl3WagwnWFWOFTJNHKZrQVJmNcM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ThQzsvxw; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ThQzsvxw"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3dda399db09so12032435ab.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 13:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752179140; x=1752783940; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOW545cnbFCjCw58sZPhZTZK+ICYR+NAj71Tm0cVR1c=;
        b=ThQzsvxws1MGDGIQ/n6zwI/TBmUzcNMeT9iALIz8hbRX7vfvN0kcOqNrSg34BiAUcX
         B+/tHVY5aQNuqrTN4HHPZBKhGUAH5+xzq+XR/aV1hELDfo/RX6fslKa8x8jaUkUQvX5z
         vbsgpCFuQAQX2RaKD3zOODvOwDGDhSvc5RSaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752179140; x=1752783940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOW545cnbFCjCw58sZPhZTZK+ICYR+NAj71Tm0cVR1c=;
        b=G2GLOje/hGjQpit/enoc9hIXja73xbFlpur3y7AAJcoMH5mSAQLvFWFgu++eFBdFI2
         HCKoe2FXR6cvdHh0DzJnfPJDBBuCw6Nbga/USr5n2twyQVbpXocU+IjIQGPNgN+F/D1G
         I+FaSVrliujEyt3xo6zVpcLgkEJf9kcLGE48NRh9wPHhoZXOMYQycg76yDzLWeeN51IN
         54kuFETYs6yzG/OcmXW0H2TN7+hqs+JUOBFcBwVQZdK51fquAV21Ehb02C47oyDNdMXq
         mXE+DXH7WGP5OlN+BkrScny2J2RTi4yTrazaeTVJKcTOhL9S2py4KC8YglrUnb89HKaD
         SLfw==
X-Forwarded-Encrypted: i=1; AJvYcCU4e0rdfS867nbmsyOXnSGt4XgjYXuwGExxgGlGDWtCQQWwokA5xjRtwrD3MCbYgqHBNe8Z2NWzeHtkcpx5t3SvsYn3jg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyV79TIzm0JwjnWEqKhDdr/jc1edJ9pSXXpbv5US1EXcZAU28Wg
	0UTeraCsl+Mp8afX22YGdFEdRNc4GdhroMx2p1HXhR9eEq9qECLT7pLuE7gunUW6XQM=
X-Gm-Gg: ASbGncuSD+9lM2T20WB1xDaSU7dqjk2M15U06VbCM7sZSCvyCkwFLMEvVFhxx83aQ7y
	yRpjg9bPhTKLfXcHS0yG4Suhiur4pmgbaTSJeKuO+60K6WlEn1G+TiMFoPaa6cvx5ssVTe7mZVU
	WX5nMOW8O+B5pqYkDwbRFGeEIyNzNk6GaAEfOew2bJ8QzrJNkgxA6+3YztOGtGvFEXpR2zv/q0k
	oSCICnbMUpNEooLd/HB+vFaRUt5f2W+8k93HWkyGaglg0z/DCM2CIKTgzPD+5j7XeeTA9iz1R0b
	pjN18c677lOjOTxvqcuJGKDJW7yNXPsF4z9ee61ElksltPjYFlRI/WQet/5o2XBnpEIvfcUKWg=
	=
X-Google-Smtp-Source: AGHT+IHzlWsf/jsE9z63MA8RnwflOpfP+qTaGsCEOAMrn0ovuDzhRAv3fYk2H2SczvZO524QmmMh8g==
X-Received: by 2002:a05:6e02:3420:b0:3df:3b77:1ed8 with SMTP id e9e14a558f8ab-3e25329bb7dmr10180025ab.7.1752179139748;
        Thu, 10 Jul 2025 13:25:39 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e2462422bfsm7371645ab.60.2025.07.10.13.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 13:25:39 -0700 (PDT)
Message-ID: <78cd5960-ea18-4e18-9f13-fb3c513014f2@linuxfoundation.org>
Date: Thu, 10 Jul 2025 14:25:38 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: breakpoints: use suspend_stats to reliably
 check suspend success
To: Moon Hee Lee <moonhee.lee.ca@gmail.com>, shuah@kernel.org
Cc: yifei.l.liu@oracle.com, zhujun2@cmss.chinamobile.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250626191626.36794-1-moonhee.lee.ca@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250626191626.36794-1-moonhee.lee.ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/25 13:16, Moon Hee Lee wrote:
> The step_after_suspend_test verifies that the system successfully
> suspended and resumed by setting a timerfd and checking whether the
> timer fully expired. However, this method is unreliable due to timing
> races.
> 
> In practice, the system may take time to enter suspend, during which the
> timer may expire just before or during the transition. As a result,
> the remaining time after resume may show non-zero nanoseconds, even if
> suspend/resume completed successfully. This leads to false test failures.
> 
> Replace the timer-based check with a read from
> /sys/power/suspend_stats/success. This counter is incremented only
> after a full suspend/resume cycle, providing a reliable and race-free
> indicator.
> 
> Also remove the unused file descriptor for /sys/power/state, which
> remained after switching to a system() call to trigger suspend [1].
> 
> [1] https://lore.kernel.org/all/20240930224025.2858767-1-yifei.l.liu@oracle.com/
> 
> Fixes: c66be905cda2 ("selftests: breakpoints: use remaining time to check if suspend succeed")
> Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
> ---

Applied to linux-kselftest next branch for Linux 6.17-rc1

thanks,
-- Shuah
