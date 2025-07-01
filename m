Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0662D218E99
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  1 Jul 2025 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751397422; cv=none; b=UnCFqvjKOkBFCQOdOHQltXKNVhKhyE6qam5BQNGNqZ9RrY1mjdK/hJqJDsKHw2gIyUI+ajAuX22rvTUWJyf3BnSLqE40cASuPpOjoZq/AW8pt9mkYxq8bWx607M6dSGQX9GN0hWesdpgpEb9H1kfxrRxocZjq8W0Nl7b1m+IZnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751397422; c=relaxed/simple;
	bh=FcYa0P68tMu4irkQQIVFEWw6CjVH7GiWKQ0vAIynfuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqfHyXlU8uPTOw9TEGvTWkiQbQOFbwpQziF18HbvxyMUj/EIHNv+0GqBjkMl2eXsuI4q/XBCBxrOQrZBJ7UYsgDYCQTZaENZZiHnO9V9qsAJe0v6xd1OgaDiLJsOjJ/a+esmGCWGvuHUHWlBVwwPhhKeOSFGstADjYFM/1lhScc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QWwecjmx; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QWwecjmx"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3df303e45d3so19846785ab.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Jul 2025 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751397419; x=1752002219; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9WagJ9l2OBOz2LHi7f/cwLGTFcCqNNX4A8nF5wosIo=;
        b=QWwecjmxkZ6ao/djW+++s/MRhYQ/lb4Xs5cgIOSgC8u9VWObogvX2ZI1NPTs6aAalO
         e4rldLQMF08Z/YENNXqPTo/tdsd8p1HcQWfoo5UJPGpZ4we3EmiV4v+upCdE4ieiCpDl
         2dGZQPJHYKYI6nzx9Z+appQkBZWrugAx/WjMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751397419; x=1752002219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9WagJ9l2OBOz2LHi7f/cwLGTFcCqNNX4A8nF5wosIo=;
        b=EhSDViJ3IEsfk08vtJIifuUZGaXby5WMR0GnMYYlsEZdyJG9haF4GyTROBe9xkpHIb
         hTEzRtQ7y5QeLxyEewj9LihFY9/NquJ0bL2h7Y4VLtSbbodTEU5rl+0a8joQ/YKhDjA8
         5A1JwhDAXeV0UEO19scj7rAIkOZ1eK4zslLaGi7XbkLc5X/SKYXGpwpM1QqGQhT6hBDB
         S5WhLzwXrM6/0zy3nUgB38Kwz3hnWL/BO8ohDQAJkMOiDMLOfnKnJi0n4+gyqhLPwG6p
         XlgCXMli8pLlHefiS82Iv1oBiBCEDXrMz4lTIt1UD/akMlXupNofiu2WrkiaVNPohGWX
         p5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCW2/BKCxdVAZBXobNrcwMBE2LU4lPGyTYnfTMaHK1hN5LrJq6CgUIvMBrTKwWq8/QVvOkRaJUXnRKLatDqcvAPUEThdxg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/LNER2mNYkRKNEDa19KZiI+STpI4IKETVl0+04//sTJRPd6eL
	A5kYd5AFMJMPCGQ8EIDgnC4u5hRbwykoLJDHrS6rdmFBZC8WvyOppCN1z9Xc4LoJSfU=
X-Gm-Gg: ASbGncueu65z61n+x8uUb5kDgXVKN02eJ8Z+LtftdmPNUikiNdpHXLB8TtP3JpmEn67
	vrphQ2EbFT7BjIdIIZFASOWz5e/ucOMHVw/AjVlF/GzPkyACC73oZRg7kUmh/f3o5EVubi2EML4
	EM4WRs9Eu7629m7yW+d8A/cUQObxAXvmBLr3+X1UYjIbwMUwTMlkTzv9abbTtBX0yTdjtGj3oHy
	wLKsCypb3en4BAndH0KQRP9RqKoShBUqZIWS57GYO3hPyARHvD+AvKBXbkh+m2Uk6yos45R3IHG
	VHLiCEYaYDP5xeYPkowoLLFzAcJOGB6186VvAjB8HibMv3xvoWnMrrMDmufQ2A/lHZB4+k8yEg=
	=
X-Google-Smtp-Source: AGHT+IE44w/SVGV9VP6dFhYt54g3cS7ykKIhCvzjksCEeynlm/mCTHQaDqHedT31nr9Tl1C9TYKb4Q==
X-Received: by 2002:a05:6e02:3108:b0:3d9:6cb6:fa52 with SMTP id e9e14a558f8ab-3e0549ae93emr2275695ab.12.1751397418976;
        Tue, 01 Jul 2025 12:16:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204aae3ccsm2622022173.116.2025.07.01.12.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:16:58 -0700 (PDT)
Message-ID: <ebd094e8-2b7c-4267-9a6b-6e2c821988dd@linuxfoundation.org>
Date: Tue, 1 Jul 2025 13:16:57 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: ptrace: add set_syscall_info to .gitignore
To: Moon Hee Lee <moonhee.lee.ca@gmail.com>, shuah@kernel.org
Cc: oleg@redhat.com, ldv@strace.io, akpm@linux-foundation.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250623183405.133434-2-moonhee.lee.ca@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250623183405.133434-2-moonhee.lee.ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/25 12:34, Moon Hee Lee wrote:
> Add the set_syscall_info test binary to .gitignore to avoid tracking
> build artifacts in the ptrace selftests directory.
> 
> Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
> ---
>   tools/testing/selftests/ptrace/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/ptrace/.gitignore b/tools/testing/selftests/ptrace/.gitignore
> index b7dde152e75a..f6be8efd57ea 100644
> --- a/tools/testing/selftests/ptrace/.gitignore
> +++ b/tools/testing/selftests/ptrace/.gitignore
> @@ -3,3 +3,4 @@ get_syscall_info
>   get_set_sud
>   peeksiginfo
>   vmaccess
> +set_syscall_info

Applied to linux-kselftest next branch for 6.17-rc1

thanks,
-- Shuah
