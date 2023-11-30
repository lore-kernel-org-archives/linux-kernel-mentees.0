Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC8057326
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YjTIbFUR"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBA63846A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 21:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBA63846A1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=YjTIbFUR
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VwuYSHz_fv8M
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 30 Nov 2023 21:34:58 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F0A888469F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 21:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0A888469F
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7b393fd9419so7675639f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 13:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701380097; x=1701984897; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUf1IZM80yx5I/uYhbQ2wqUvHfjUSNuMsT/QakbGtJk=;
        b=YjTIbFURoYhIVdXuqR91hO/yetL+gFZNAqQi5x6v5+G6xl63GGxo03dOO8ukiDR1iC
         S11kdWCXKMaRU10Yt0VotbOyYEvBW2Nklib2qz2LOGKqiJywY5CgqPvWMS0VcZcSteho
         rmMrZ5Jsp/FWTWm1ajJ8ZL2YxeZ9VQDdXH4qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701380097; x=1701984897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qUf1IZM80yx5I/uYhbQ2wqUvHfjUSNuMsT/QakbGtJk=;
        b=wK9hgU1pEa+T5HlX9lqPg4SRMxvcd6SzQFAj+qOcEm9W3SjFX6OHH0GpEbW5Bkzozz
         FWzC8btVpI8DuUTloyxXdYDX5SJFGT+hnY820iEdTmxCNegLd+ZjrLVPe2Bh6Ep75O74
         MyDHQ4kx3IMWOH2Wg0gTErKb2CNFH+I45+KxsRl5jJZikY70EwzDXHYodlAfCRdp4i4E
         yru306KW81vIcobiepJIJOpIi/82oW2SvJXF8YL7TArbMUwymFqcfrxERgsJaNAX1tp9
         6RPRRCI9YxbpIVeHdroEmJ9G7RJGFxIKCzDvbMi66dp6Skgf2XSBALoXqW57h4MBDfud
         9OTg==
X-Gm-Message-State: AOJu0Yxvz7epPClRUS6Ih99lWeibx+sA5Q1Hw2ZgT4wT4OGKZ9Jl48Xf
	pUxBiM275H5/SzOAgBUALYAC98fU
X-Google-Smtp-Source: AGHT+IF4F3xQmJZ6+UhUcyzvSzVJ0VgieGSd6DoK5uGwTAG7adkjYZew6KUU27lXIsxCnovm0RJJ1Q==
X-Received: by 2002:a92:ce8c:0:b0:35c:7b32:241f with SMTP id r12-20020a92ce8c000000b0035c7b32241fmr17946580ilo.2.1701380096997;
        Thu, 30 Nov 2023 13:34:56 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id i9-20020a056e020ec900b0035aeaed5112sm609123ilk.84.2023.11.30.13.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 13:34:56 -0800 (PST)
Message-ID: <57c7feb8-9529-460d-af4e-db4591177f9f@linuxfoundation.org>
Date: Thu, 30 Nov 2023 14:34:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/breakpoints: Fix format specifier in
 ksft_print_msg in step_after_suspend_test.c
Content-Language: en-US
To: angquan yu <angquan21@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231128214854.60362-1-angquan21@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231128214854.60362-1-angquan21@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/23 14:48, angquan yu wrote:
> From: angquan yu <angquan21@gmail.com>
> 
> In the function 'tools/testing/selftests/breakpoints/run_test' within
> step_after_suspend_test.c, the ksft_print_msg function call incorrectly
> used '$s' as a format specifier. This commit corrects this typo to use the
> proper '%s' format specifier, ensuring the error message from
> waitpid() is correctly displayed.
> 
> The issue manifested as a compilation warning (too many arguments
> for format [-Wformat-extra-args]), potentially obscuring actual
> runtime errors and complicating debugging processes.
> 
> This fix enhances the clarity of error messages during test failures
> and ensures compliance with standard C format string conventions.
> 
> Signed-off-by: angquan yu <angquan21@gmail.com>

Thank you for the fix. Applied to linux-kselftest next for Linux 6.8-rc1

thanks,
-- Shuah

