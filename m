Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1223F53E1D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 20:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WFf8y1x4"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739B381ABA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 20:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739B381ABA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=WFf8y1x4
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ILxJ4dY-pK_Q
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 30 Nov 2023 20:25:39 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC3ED81AAC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 20:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC3ED81AAC
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-35cb8fe4666so265345ab.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 12:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701375938; x=1701980738; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJRwlgJXY8zfS6Dn3Qyvps6vNutTsbWo0ctzy0xsDTE=;
        b=WFf8y1x4z6qQr2GWIkGBhslxgn2E8cz+igqDrYhoL8Av8gg69bGA/mMWvWpli7AdkA
         5EJyKqnWVKQAidPoFNzwakX0J6FzXvZ2L56sucmOZiywSeiQIUSIFAckRNRGrU5zJIsd
         wJDmrefPldlEXzZURkgunsha+SiGwWyRRhjIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701375938; x=1701980738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJRwlgJXY8zfS6Dn3Qyvps6vNutTsbWo0ctzy0xsDTE=;
        b=vFwnslADM5QKes3VGJHHesJ0/I4H22nAJ/CDIdm8nqVAp1JMAsax1uBdqSA2sO1LH7
         rhcVlThilcW2HE/qL+cz3V+DAMvtqVt7HyBaSSR/jCx3Cbt8F36E6AKslDlrxt/0jIrJ
         el9yLqAyVFN9v4/+RDN8zv1ewEfYMl42KFK0kFfv6eyCcM0cL8N1BwF/Iq8bn+yrFtvY
         y5Lb1t6X3/THtscoi4NL+7fG8g37ZtTh/GRc/QRWOpWqpBoa9ZjKNVvEhbOFWlHraYuY
         YTz2UNcjQU4iiVdIcNqtFGLl5RfqRWvA4pPm/oEjThf0RS53BOZ7msSzC+YWf8Mli0QZ
         pd9w==
X-Gm-Message-State: AOJu0YxGH9qc5MmHvm2AZqXbEdFRj+teLYstH3oLblVPqyhXc3wDVWuD
	rx/bsSoPiDSwrG28KkoAEzycpBjh
X-Google-Smtp-Source: AGHT+IEGUJuAhqQgLn7oVdVGifPgt9lHfhIlE4GIM70wiojIb1pXjfhGAMJ+UM2YbwQBa8GA9orUtQ==
X-Received: by 2002:a6b:c403:0:b0:7b3:f2a2:45e with SMTP id y3-20020a6bc403000000b007b3f2a2045emr6228689ioa.2.1701375938620;
        Thu, 30 Nov 2023 12:25:38 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id gu4-20020a0566382e0400b00466c82bce72sm484293jab.56.2023.11.30.12.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 12:25:38 -0800 (PST)
Message-ID: <2845b899-efd8-49db-8ea6-18834e97071e@linuxfoundation.org>
Date: Thu, 30 Nov 2023 13:25:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests:proc: Resolve 'Unused Result' Warning from
 proc-empty-vm.c
Content-Language: en-US
To: angquan yu <angquan21@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231129034556.5719-1-angquan21@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231129034556.5719-1-angquan21@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/28/23 20:45, angquan yu wrote:
> From: angquan yu <angquan21@gmail.com>
> 
> In tools/testing/selftests/proc/proc-empty->because the return value
> of a write call was being ignored. This call was partof a conditional
> debugging block (if (0) { ... }), which meant it would neveractually
> execute.
> 
> This patch removes the unused debug write call. This cleanup resolves
> the compi>warning about ignoring the result of write declared with
> the warn_unused_resultattribute.
> 
> Removing this code also improves the clarity and maintainability of
> the function, as it eliminates a non-functional block of code.
> 
> This is original warning: proc-empty-vm.c: In function
> ‘test_proc_pid_statm’ :proc-empty-vm.c:385:17:
> warning: ignoring return value of ‘write’
> declared with>385 |                 write(1, buf, rv);|
> 
> Signed-off-by: angquan yu <angquan21@gmail.com>
> ---
>   tools/testing/selftests/proc/proc-empty-vm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
> index 5e7020630..d231e61e4 100644
> --- a/tools/testing/selftests/proc/proc-empty-vm.c
> +++ b/tools/testing/selftests/proc/proc-empty-vm.c
> @@ -383,8 +383,10 @@ static int test_proc_pid_statm(pid_t pid)
>   	assert(rv <= sizeof(buf));
>   	if (0) {
>   		ssize_t written = write(1, buf, rv);
> +
>   		if (written == -1) {
>   			perror("write failed to /proc/${pid}");
> +			return EXIT_FAILURE;
>   		}
>   	}
>   

Hmm. Is this patch based on Linux 6.7-rc3? The code doesn't
match?

thanks,
-- Shuah
