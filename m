Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A5257326
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 21:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K5RRD1qX"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 388B041FAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 21:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 388B041FAB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=K5RRD1qX
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZ-GA6bw2SKp
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 30 Nov 2023 21:36:12 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E057F41925
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 21:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E057F41925
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7b37a2e6314so17100639f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 13:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701380171; x=1701984971; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fp9VwMviLQPX+3MgbIIB9b/GRHCxnV7F0fIl1aHZ/II=;
        b=K5RRD1qXhdo/SWsxNXsgF9zw7/HkGJbN9RDGWLXdFmugcf8W6UJ/fJM0e2YYDisJhx
         YXJTZEIKHxOt9mRRLOgZRBhp+n6BMUQfQrlnpSmjdR7n3qSRzpAyANL3QUFZQVgVfg4i
         g12AbiuXooQ1uyT/Szyc2gaWpIypeyYRLeSJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701380171; x=1701984971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp9VwMviLQPX+3MgbIIB9b/GRHCxnV7F0fIl1aHZ/II=;
        b=Oc1QZsvpna9e5c0Of91FCvpqM6irobkZGsy0hrg8P3BcO67hieWUt+UMxD+AX4HZ1W
         wR/zybetEa2JduckSlLOHkf33WCNqUzIOWl9Gchxa+3CVOKNtWDYWXkDI0b0917aGNZJ
         cA4NbLhLfDKb8EOwT6bUrO3JKxIOUQG3iEt9o9111T0gvsqpSOBxKbC7Xx305y9cZEmu
         VQIlytKAA5WqDos0r966m9p7MdbuagIgIMJgK78TW6SkiDiydZZ68fq/iaROjOch2rIU
         WoJqpdWvpVuE0+hw1zxS48d9APB29YvJRqMnhjsTN8hHEdG66PmAyLQr+S2mo0N1uhDE
         SjXQ==
X-Gm-Message-State: AOJu0Ywl8sLE5U97gdPG4cbmEe5WkoxX9c40BHISU0/7hz++rG5xDq2X
	Wbru5hHBkia2H9lFRB4TgfwamHC4
X-Google-Smtp-Source: AGHT+IFAje2WETdYrzqFGUkr/49oxBQQwP5VhDCh8321mO5Pj1w3J8co5z+7nxeYC4a/pt7umT+5aA==
X-Received: by 2002:a05:6e02:1b05:b0:35d:f2b:4992 with SMTP id i5-20020a056e021b0500b0035d0f2b4992mr3016222ilv.0.1701380171001;
        Thu, 30 Nov 2023 13:36:11 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id i9-20020a056e020ec900b0035aeaed5112sm609123ilk.84.2023.11.30.13.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 13:36:10 -0800 (PST)
Message-ID: <89e0378d-f03d-42ef-9495-ada312dd5139@linuxfoundation.org>
Date: Thu, 30 Nov 2023 14:36:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests:breakpoints: Fix Format String Warning in
 breakpoint_test
Content-Language: en-US
To: angquan yu <angquan21@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231129035726.6273-1-angquan21@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231129035726.6273-1-angquan21@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/23 20:57, angquan yu wrote:
> From: angquan yu <angquan21@gmail.com>
> 
> This commit resolves a compiler warning regardingthe
> use of non-literal format strings in breakpoint_test.c.
> 
> The functions `ksft_test_result_pass` and `ksft_test_result_fail`
> were previously called with a variable `msg` directly, which could
> potentially lead to format string vulnerabilities.
> 
> Changes made:
> - Modified the calls to `ksft_test_result_pass` and `ksft_test_result_fail`
> by adding a "%s" format specifier. This explicitly declares `msg` as a
> string argument, adhering to safer coding practices and resolving
> the compiler warning.
> 
> This change does not affect the functional behavior of the code but ensures
> better code safety and compliance with recommended C programming standards.
> 
> The previous warning is "breakpoint_test.c:287:17:
> warning: format not a string literal and no format arguments
> [-Wformat-security]
>    287 |                 ksft_test_result_pass(msg);
>        |                 ^~~~~~~~~~~~~~~~~~~~~
> breakpoint_test.c:289:17: warning: format not a string literal
> and no format arguments [-Wformat-security]
>    289 |                 ksft_test_result_fail(msg);
>        |    "
> 
> Signed-off-by: angquan yu <angquan21@gmail.com>

Thank you foe the fix. Applied to linux-kselftest next Linux 6.8-rc1

thanks,
-- Shuah

