Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10430421EFB
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  5 May 2026 18:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778006521; cv=none; b=quZvUIo8Kt0b3ES1Kc1VHdRhLdf1vbcBAQyVdfZ2uPN2dCef6cVj/XYrmMJ6jsFQl/Ekj+VCptyvv/UQDffQN2uaiXP/fpy79+OSzaUyooC9UjQPfwwSYFcjWK4pqnDtX4KJqMET+WK83a9xZHup1jZCZeMW66CIP0/EKGnyPQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778006521; c=relaxed/simple;
	bh=PxhdK7gj2zjUC6Zs48u/3dPbyPUC8JEb6+TGJXFmU9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVBa1Kxb8LkXOhHoTKur6BwxiHOjhHSYwOewMilHnsCZSRTvPucvFGFnqJTfDICuJ6EUb8cf2mxDWd038gjVC5rbAadsucS8mgyBamw1ongqIMagsZWwH7CfRu9XldLDqAk51QkstYIuT8DPRaESjomYb4R8if6XikyHwnzUjRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nf1tXsSg; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nf1tXsSg"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d4be94eeacso6267744a34.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 05 May 2026 11:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778006518; x=1778611318; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Me8gsx2QO5esJCBY5A9GXybByVneJGu1Qo6HjDO3dyA=;
        b=Nf1tXsSgd/3QKbFE4xzLEERUSzHFwqDwDxfIcYW56PHQjNg2U83SONPKiXRERLXZXt
         QShbVsummS72zWFZWId4nECct7KzdyaEAHwUzpS7z9hRNAhFjEaXZv8s1yvjBEdQD3I8
         7vuetA08Wq6kPf9IdMOx3nrxAj7kore5etVbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778006518; x=1778611318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Me8gsx2QO5esJCBY5A9GXybByVneJGu1Qo6HjDO3dyA=;
        b=OilRJpRnFjKZo6K/mlKE47E74V17vRytnrLIIqfXmRjX7tCgRsmdZIDU5l+jnhooIR
         xeuqxp3IbFAy0Ym0QNX7o5WzmwD1VRYjuvLA4dhJ+RQ2pMn5NHZM9n7ZD4QHfx6Bxqh+
         chZli6FtOhSKxkAEXZw0KzSBJxoUi7xdJXRuZwOoY6JKpwmhc/DmFBlFoQMsb0LrZw2U
         wUEYvxzYxQCaWL9PzJPJQpxDaRKCC2Xd75DCV+5HbFTGXboGVMEs9QCNC0y5mTE029Cw
         3sHPgB/LyU5oft9I+zx5CbtQ/RRsd26Ki2NoqQOWPs01zAGIG8Sjib/qHEjSrPuHWvsf
         8OJg==
X-Forwarded-Encrypted: i=1; AFNElJ/bEUpYE/xtlQYafGQZfc9ZoF6gVfvrHkOFxtwBBRpJo/Xje0bhA/SkYAl5Q8w4BS53Es9gvnXP9We3aWHhThiit9F17g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAnRlB+p37zS/6p9cLAFI07UX2RoNDwq/xMxRofnoaQl8Tz3cm
	yuEr5FQaB5ntec7FIAY+B/IsXmunUNXWXuJ4vhjMY7nCE+cwriGXQgM5jTOvQh6ZpfI=
X-Gm-Gg: AeBDiesOVh8iYM13AQ45Kp7FHYIpdC6SVn2GZpgxk2zEeRoVxaRBkFx19zEjyFZ3MkH
	/hKP60Y9xO/Xi9VOytsH7NyV4ZvhaHCAsGW9xjkJQVQUIuGJ3wDMFjoJaPYDK7Z5/EPOc/prQyd
	ZmyUM6mD6Xct1FiZkfzYXNiFGTSEQvPITq9ZFSEuEWisKPxwIlfZicVCSjJRDM1CPdM/6qxnOoi
	bSCjMI/C90CO77y6NKYq/R9aHtAYNlLyFzoERluH8aYXdmrpAc4qc/OP8tz8pOenN3zvlIjc42B
	GTFiVjrqgzkwSh7G1Ox1hivTIgDbHY4Zvd77p711otz734CQaD1bM3iUtap/iPJyZTrtkxMZ0ge
	/JBcwaxxqTYkUEv34ok8cGTRpyUriBWp8WhHdBnZYI+CT2ZTgq6oijK8pK+FoHXHvJeHSTbGoQQ
	rqxZG3y+0scvbjdiMdCGgcfB+FGpOv7vrOIQKc+IbUog==
X-Received: by 2002:a05:6830:82e3:b0:7d7:d510:4bf9 with SMTP id 46e09a7af769-7dee12e360cmr9447027a34.12.1778006518012;
        Tue, 05 May 2026 11:41:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7decac8ef53sm10778237a34.21.2026.05.05.11.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:41:57 -0700 (PDT)
Message-ID: <8bf165df-faca-4765-9492-613dff06e43d@linuxfoundation.org>
Date: Tue, 5 May 2026 12:41:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest: fix doc for ksft_test_result_report()
To: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>, shuah@kernel.org
Cc: broonie@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260505182213.22924-1-woradorn.laon@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260505182213.22924-1-woradorn.laon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 12:22, Woradorn Laodhanadhaworn wrote:
> Fix documentation to reference ksft_test_result_report() instead of
> ksft_test_result().
> 
> Signed-off-by: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
> ---
>   tools/testing/selftests/kselftest.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> index 6d809f08ab7b..b50a8478d4d3 100644
> --- a/tools/testing/selftests/kselftest.h
> +++ b/tools/testing/selftests/kselftest.h
> @@ -346,9 +346,9 @@ void ksft_test_result_code(int exit_code, const char *test_name,
>   }
>   
>   /**
> - * ksft_test_result() - Report test success based on truth of condition
> + * ksft_test_result_report() - Report test result based on a kselftest exit code
>    *
> - * @condition: if true, report test success, otherwise failure.
> + * @result: a kselftest exit code
>    */
>   #define ksft_test_result_report(result, fmt, ...) do {		\
>   	switch (result) {					\

Applied to linx_kselftest next branch for Linux 7.2-rc1

thanks,
-- Shuah
