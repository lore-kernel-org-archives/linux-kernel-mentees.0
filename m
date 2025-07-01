Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ED2284674
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  1 Jul 2025 19:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751399620; cv=none; b=py6hMJ9n645cpMAaQ2wO2vyOIXY4yY1I72nXOK1XgeY9aSnlZJz59xIJH8txl1W6+h/ZVUzopZ2C0cLIjV2CHdrEQzg6Gu1gIpWXZnokbft4+VzE+sD4hODQE3pZOzhhLTAIABxIc6h+vUY0f3ZoAsxRVP1401xl/tgQ+osKjeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751399620; c=relaxed/simple;
	bh=xv85BblxpwCPLhEN59S0LbhTMVwob3/UmnwNbwObM+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYIlLzwmgA+gedZ81SfcnpspR4KFQtlZZFrDhff93+ODiiV21XufCRGXQY/qanBUd3NWrSO9iKJpPj4N3kvs6b7J7CDbALh9090lQweUQk7OIZL/QdeIrN5+r2ANvLgVYCUshuRMrvlpTOxAUAWzTRZX7m+Dtw1x9ivxjslstZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HUeczs0i; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HUeczs0i"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-86cf3dd8c97so325131739f.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Jul 2025 12:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751399616; x=1752004416; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05DvOPnYJvLbjXIZfvA3qU8pEVrHcgb4vIodN8pGWR8=;
        b=HUeczs0iWpsMP6SwkYbenGIeU252dfoGeCDBctg3HQV6lQxlA9bbKkBWcPSAXx/Kor
         y+6jvoRcnJIyAso5FNMlOlW/FGvwYNSdZDGj22nVgMchWxbysa7fLo4GMhZNaT2aClJH
         WBGHgU25OW13A5L534BkOrurBHGddeOjeqEFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751399616; x=1752004416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05DvOPnYJvLbjXIZfvA3qU8pEVrHcgb4vIodN8pGWR8=;
        b=U6hgYTmkml4WCl/qJSZGqlrk36zuWcj94cwEjVBDw/+R7EmeFZ2h/+9ck+Eu2XhLfb
         Q1/wv1ZaEzaarAKVT1lHmn1JDhsx8InHnX7SCeqz7N2tIKlKzRdq2O0vBatbhz+YNkoQ
         Zqy66Vqnnh0w5y6H1ZPgsq+8zlA6OgEB3IYAlgfj+LL4pLQhMDe5ha9NYrDWP/eLZdNU
         2Dr6/mnTtthWSj1nBP2hzIPLzMwqAXusrparNDPwZ95VhGIS9Ai0p82aJzoX/AlUVT5F
         iD0E4yeGSP+i/cj0COo/c/MoupA9g0McBl7hhqE3mjTNgHZ93pOWEUU8nYaxSOqRoa2f
         QO9g==
X-Forwarded-Encrypted: i=1; AJvYcCVPFVEaP7l3UzE02k3Ep6+izkrgIPTq1uWRYzLFVl2I2iQOp8IHoXSriI9b/N3bFP/z6KKeUHucyA4duhaw7/MXO5uFcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9En4QB992YcDta3RRznebIot3TGUGOoZDsX1PoR0lSwuOgocw
	yQAYamUbFLg1LdRzS1AIDFMLx8fHAPo68D5QIopWnfI5h4GErg0cgKcF9Bhq9CG7Hxk=
X-Gm-Gg: ASbGncsJIcvKnuULZKqi22dvGhrUnq1sJhHJ/5MozdIyCJ4ZiIBhXyJTqv06EW05vGj
	bhO84DyY5xoNPcPxsQ+KRQxhT7AIJCrQwB4Izjb9z+6X/JUj1rMUFDfdFXwlHTXDeyblhhW0oa1
	M0zW66FZOYew/adFAVCDEqiKJ+bKcSebON3HPGpXyjNqBzcK2VJGC1vGbBF/sMa9uIudDctwmU1
	JjY9k7eH480//IYsLZh7ASIH/PKHkaaOHI7RPMZqASdnrVuh7b9aQ8G168p3uuH7CvL8tOZsblI
	ZXz2fdxdqIdoCFI1CmCkAr8LpjbMptUSVBVTQXhrm9VbleOkFngVs1EfOVBCjykhqaoTx2hWJw=
	=
X-Google-Smtp-Source: AGHT+IFvgVmTDNSS6N+w+PWK6OvUgtAsoQ5EvKqtlmkInV+s6ra/2LpzaFJdJKj+QGj0od2XQYkO0w==
X-Received: by 2002:a05:6e02:310b:b0:3dd:b808:be74 with SMTP id e9e14a558f8ab-3e0549e27a5mr3374255ab.13.1751399616134;
        Tue, 01 Jul 2025 12:53:36 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-502048636ccsm2592165173.13.2025.07.01.12.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:53:35 -0700 (PDT)
Message-ID: <744bd439-2613-45d7-8724-5959d25100aa@linuxfoundation.org>
Date: Tue, 1 Jul 2025 13:53:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/kexec: fix test_kexec_jump build and ignore
 generated binary
To: Moon Hee Lee <moonhee.lee.ca@gmail.com>, kexec@lists.infradead.org
Cc: dwmw@amazon.co.uk, mingo@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 shuah@kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250624201438.89391-1-moonhee.lee.ca@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250624201438.89391-1-moonhee.lee.ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 14:14, Moon Hee Lee wrote:
> The test_kexec_jump program builds correctly when invoked from the top-level
> selftests/Makefile, which explicitly sets the OUTPUT variable. However,
> building directly in tools/testing/selftests/kexec fails with:
> 
>    make: *** No rule to make target '/test_kexec_jump', needed by 'test_kexec_jump.sh'.  Stop.
> 
> This failure occurs because the Makefile rule relies on $(OUTPUT), which is
> undefined in direct builds.
> 
> Fix this by listing test_kexec_jump in TEST_GEN_PROGS, the standard way to
> declare generated test binaries in the kselftest framework. This ensures the
> binary is built regardless of invocation context and properly removed by
> make clean.

The change looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

> 
> Also add the binary to .gitignore to avoid tracking it in version control.

There is another patch that adds the executable to .gitignore
https://lore.kernel.org/r/20250623232549.3263273-1-dyudaken@gmail.com

I think you are missing kexec@lists.infradead.org - added it
> 
> Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
> ---
>   tools/testing/selftests/kexec/.gitignore | 2 ++
>   tools/testing/selftests/kexec/Makefile   | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
>   create mode 100644 tools/testing/selftests/kexec/.gitignore
> 
> diff --git a/tools/testing/selftests/kexec/.gitignore b/tools/testing/selftests/kexec/.gitignore
> new file mode 100644
> index 000000000000..5f3d9e089ae8
> --- /dev/null
> +++ b/tools/testing/selftests/kexec/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +test_kexec_jump
> diff --git a/tools/testing/selftests/kexec/Makefile b/tools/testing/selftests/kexec/Makefile
> index e3000ccb9a5d..874cfdd3b75b 100644
> --- a/tools/testing/selftests/kexec/Makefile
> +++ b/tools/testing/selftests/kexec/Makefile
> @@ -12,7 +12,7 @@ include ../../../scripts/Makefile.arch
>   
>   ifeq ($(IS_64_BIT)$(ARCH_PROCESSED),1x86)
>   TEST_PROGS += test_kexec_jump.sh
> -test_kexec_jump.sh: $(OUTPUT)/test_kexec_jump
> +TEST_GEN_PROGS := test_kexec_jump
>   endif
>   
>   include ../lib.mk

thanks,
-- Shuah
