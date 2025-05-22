Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D09C25B666
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 21:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747950747; cv=none; b=OHyvNUG+UQZd5HwdAvoHBaC4PoaMX/Ah5jNz8PtgubtPr8It0l1v2WiMkyO1Z2zCraacXKjwfULx3EWDJNKvSeBqkbKWeH07ZwmX8RD7ebjgHjvJ5y7vIfK+dRH1M8SBt5Nm6N69rKrxcHRofbG605mNbN0PVyw8HeBtGsCMAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747950747; c=relaxed/simple;
	bh=h3gxn9cuXoddDKHE83elseHrpfGuY2/pgmGAoap5d/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HS4EbV4+zr8wScyHNf9aawgjSDvnrh+KIwx5rhooVPxlK+c1XCQ3lf6ZAn15N8ijf3lcYZTHCETlXfvpYJrukxlrGPVfWF1QnVGV2FdbQzHbBmkPKZJ2paZfiJEGRdqdQf2dTMH/QkjVcMA8Ke5VDVdULEu8GDb0kDixGjfKKFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SFaZT3lW; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SFaZT3lW"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3dc7294716cso34277455ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 14:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747950744; x=1748555544; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3gxn9cuXoddDKHE83elseHrpfGuY2/pgmGAoap5d/8=;
        b=SFaZT3lWP/pCtautHSpTCohwj10U1Z20sQ4cPX0z+FQDrzltA+lTbrjllRCkjla0C5
         2ykYSDZIcs+etnWzWic5CLo22IZTQmW88ouKjzl1vGtrUmpmapzumraaDqKHYHsOjICA
         RM3CW9wXkdDGNiFhXpF81FxQMVY97Duu14bGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747950744; x=1748555544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3gxn9cuXoddDKHE83elseHrpfGuY2/pgmGAoap5d/8=;
        b=ZknVTrypLGC1kcOVnDouRLdJ9THdvX/aM/vrixOQluvAWY3aUzzD/8ww4e0EUUhRQU
         A+Xpni2jUQ9f1aLE2WBJHaNwzJs/60lfuzIF+ZMYWOioi8ngk4f0rbRh4+m09AkKl12n
         zsIgJPfIT19/V1oNcPG19LBJpNYjlD+hu36dcHe+p/2J/I3f4rF6GuCCOEB+C4Whor8L
         qjvX1/WrPVb05TuOx07yM4X5EFWSv6vRQI/CCniz2pI7JcC1ZK5WKYVC/Ztxa0wBLKKv
         vpZxEBMCAcV/8Rq7iPnYqF7a73YQww4j5jegDrqXkgxx1B2t/KBOzvRkzEitAlhGRm3X
         7A5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDKjWW+PykLVmZk92d4RjtIgeizbpjdLIfUezcsiALWeuWUYf/1dhGSoqXeKIIWJv9EvybFFmNwIG7GDIXJjevkQuVNg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6aNMMDmYC906vbkibhtUNkQRKGfp+C0RVCpqtRfTQDTdkydRk
	RtbcFCCOEQXYvgA+j4BvIJgAYmKFP6GJf7pt9ABr7Jnd+t1JyzN/FRbJ4LA7MQB3ISE=
X-Gm-Gg: ASbGncsRRbVlJa+Gg6qbQ35leBP3HAOujqbR3OabM0AxT+jW9GXu0srAblx6Wqp7PYW
	OAjE9zAVaQVpqJXA+qWnenIFJyLRw2yhF92VffHN6ZgSLhJNB+L96/mjMsX83SPZTX/cqJ35166
	8fF/UwrA01aBwyn+/y8LduhHd3AS6HC+JKLUj3p3VJnZsxY3FekruJnHuOitGW1e8BTJUdcVcYE
	2c7rQfljmqZ92Ne20iFZmS0VZSo4XqQWJKrIkbgvCamKF77CZtaUzoPTVuNqUBjtOkXuUd2Ld4+
	DYOeBbviMpTY6KXx3Is85a+/FMNUo7QnmR1lh6wVFRPipM8UcSmhF6L/YKzjig==
X-Google-Smtp-Source: AGHT+IGDkDoKX26+mZpUKHL9ezkJ1Wm3f/pt0o5Qwk3JRyWzB8+ExKX2tHk3jPeY0mXqaoYvPkV82A==
X-Received: by 2002:a05:6e02:380c:b0:3dc:7df8:c822 with SMTP id e9e14a558f8ab-3dc7df8cf18mr116514675ab.14.1747950744575;
        Thu, 22 May 2025 14:52:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db8444924bsm37442605ab.72.2025.05.22.14.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:52:24 -0700 (PDT)
Message-ID: <d1908709-dc6e-48cf-8a94-d03e173c6cea@linuxfoundation.org>
Date: Thu, 22 May 2025 15:52:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: timers: Fix grammar and clarify comments in
 nanosleep.c
To: Rahul Kumar <rk0006818@gmail.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250514222112.396705-1-rk0006818@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250514222112.396705-1-rk0006818@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 16:21, Rahul Kumar wrote:
> Improved the clarity and grammar in the header comment of nanosleep.c
> for better readability and consistency with kernel documentation style.

This patch isn't really fixing anything. I won't be taking this one.
Sorry.

thanks,
-- Shuah
