Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE8D2E5B38
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753276229; cv=none; b=J/xcdKd54VYOd2yXOZRETR+kJRwEyDQMAcFjHsE8KnvKFqVqx/Uq9boswXCuHfTyl/WTmveT9OD3huaGBQzCPzofeEqAoValCs/sdLq1mtFOMI5MxRKta9VLxEX958ExiX/L28ZGixX2dQzBmOXv74Ta9qaiSCUB0UcLPsFypmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753276229; c=relaxed/simple;
	bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTS7CqZKzmAwjUWV/SxVvbWaJ12b1TeF6006WleLWCPmEQA+U7VcNEjkj5gr52bXDhuO81RG9Q7Ngu0EHB1nthU1/l9g3KBM5RdLS5f717adsGJuTAgBHrSHMwsnIRbIIWhsHytGI4lN7ANnaT6uX/MX7sQYY0ptlIq9zfoLwHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=lRKaV+oO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="lRKaV+oO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a5257748e1so4029599f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753276224; x=1753881024; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
        b=lRKaV+oOBoJoCBUMh90gd6NeylamtkguGUH6WI2NVErgcqLuKOOXYcSWhA1eTRbC0g
         euywJytgv4Yx/YIROrgsNk+mEweYnfg6/n35oKGUxvD8TI1SrLMJQTupNzNuzBlViKPc
         vBmHYng3A0EawF+GsOzNnfEtV+xqNXSNobr0KClMrXe4L1TsYa+of4HIE4RXQC/83+sd
         BD6hsI/oMV2vYIJZKYu40fSZ4rid2UUm+TcMndhawFLpI/kpE96VDmzR19LuyFmYiy5y
         vnJJ0RxGzycKXqUhEMvmXp7HLUkCjwk8bbmLRYsWuapzzVBovbcJvFhCUABSh4LQAWKJ
         4ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753276224; x=1753881024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
        b=xBBVvGGNuLN82xHBDLlU8Xztv7sIRebjlSi3/3jPge3bFaWCFRthyFfaqY9XLOtW9C
         RLjG9ueENsWd5gFYGZ6oQEFrFWEf3IzqWrgOSgOBi9CGGZTvTOEOPCHUtyBNmj0T9R2i
         hyRxWi4p/4lvyZq4eoCvAaMX5ric2ewyOSrrKEiftwQlzRrFB9ygbzqc/NjfDBtiVNdo
         ltU6gSlM3wRkijm3x0k8Z1d6AgY3yr1z4aoN3AQ6o6rI8QQeH/Yy60YRZaLy7H/esWBx
         KdMmoNpSLkzJSxTka99wzLE3B8jxM78izNake3xXHF114PBOt2Y1iMY2lDoUZZlzu9hD
         NCdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsKOhDz3sUstENFodp5+EIXoYWh9iNuANLV/GK62hkYCOHvTzQhqIxBBJpmhuCZQoAXK93tAE6O/uiltJy9wfTa6v5Tw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo94D6DEW/1O2YqLEwzOYadiJVt6OtJeuUW5EaX2Kpx3Dukzcj
	BncpFR1w5VsfhWwjz6bAwD1GQ2QI4q/6yc3nPJkF0FsdL9VKvS/pCgvhZbPJDSKfSUU=
X-Gm-Gg: ASbGncuIOuuGvEBGqkAWc/ABU64geCVWuXljFoNyiMduMdaZVmnNF9GgnyS9CdAy+F3
	1KQoax/pKbXQVRmfS5xL3jiHu0BlNXed6vBTD4wvJw0xMKS7Y88FtKOES1S4FeE4Xwt660P4J9/
	RWf9TKdC+14jJ8bMdZ8ClKI8gxcIuu9a5IdSHOHQHJJnrgrLkGqVMrzfCOXL7gpN5Yv+Bp96V92
	LfQS/7PGraMMEtFR4hBvXDmCuVxUotkaiLv0hzx7uFCY6bgwQM13SJ37ILTrdts1b9iPCB2uQQp
	uQxPFu1R27m3J7Kc30VD7n26YPA2wQN15XjXyl0TEWJHJW987DoyyOUT2GyGX/Glud9IP4asoRr
	EGER78iuzRE6mAS9pJVTb+d9ZB+pvheVOgZAMG2DaOiwoYbhr+jnoJqGVEW7aB4ZbtBKncRD7vc
	a9aQgt6t0yB0Tu
X-Google-Smtp-Source: AGHT+IHaikAjtXSOK7TzkgieFuqf48w0q0zzAkHwiGU+rMcHAorrKzxT8fl3tGpNBEzEAzrmfTi+OA==
X-Received: by 2002:a05:6000:40da:b0:3a4:eae1:a79f with SMTP id ffacd0b85a97d-3b768ef3c90mr2447676f8f.33.1753276224129;
        Wed, 23 Jul 2025 06:10:24 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:7fcb:5e01:8f11:1009? ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c813sm16511400f8f.84.2025.07.23.06.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:10:23 -0700 (PDT)
Message-ID: <fd4eba94-50f5-46c9-8675-cc0aaa4601c6@hammernet.be>
Date: Wed, 23 Jul 2025 15:10:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Yixun Lan <dlan@gentoo.org>
Cc: sboyd@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250723124020.60897-1-hendrik.hamerlinck@hammernet.be>
 <20250723125416-GYA738759@gentoo>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250723125416-GYA738759@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Yixun,

Thank you for the review.

On 7/23/25 14:54, Yixun Lan wrote:
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
> Can you put Fixes tag before SoB? I'd suggest to follow tip tree's docs
>
> https://docs.kernel.org/process/maintainer-tip.html
> 4.2.6. Ordering of commit tags
>
> otherwise, looks good
Thanks for pointing that out. I'll send the corrected version in the v2
and make sure to follow the guidelines in the future.
>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>

