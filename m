Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839759548
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 23:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T3RfVicL"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D079D4367F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 23:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D079D4367F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=T3RfVicL
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id inmuAoV_3JU8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 30 Nov 2023 23:38:44 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B0E194367A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 23:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0E194367A
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7b37a2e6314so18487939f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Nov 2023 15:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701387524; x=1701992324; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8VSO3h3YSEqNeVJ9Fi67nw8jeBYbkM3BVJqSu9EWHk=;
        b=T3RfVicLorFgTQngYkYpnNVutDe41EPtBb2cfSIjThIbgRzYj7Hp5gv1kruQ4fVfQi
         txqX7YKiuwtTrV5JZMuJ7GE3tkoLF+PTxx78jBtrJSzlkuyGLIJtq7UzusfOQ30YGqt/
         gNA/UHqhRq+Gba3Cn1BjwUNaWkpBEZdfyaDbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701387524; x=1701992324;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8VSO3h3YSEqNeVJ9Fi67nw8jeBYbkM3BVJqSu9EWHk=;
        b=YO14sVcWMRXr+7aBj7rdcD5qjcufutq5aEti9XfYjBPH4qfopMVq5fAgMRc4EK7d2c
         3Hm+P6B6vCxeVyjCQXuhlgMUMhv/r2BkYuAPswX9Ei0nlwBTirXUar+f34/FwG1nnO0y
         VdRAWir1B4pVVbYM1DF3mZsVP0TjodVZoe0tOuDdqpYajJ7wga4DAyWY23ZgvGzj1jWg
         x5nsjZEcGUraUgfkzTBqVXGz6nBc7rVgX09uYx0IGRVs2uiWcM7Xq9ZDTKwEOSbaZP94
         ovwuBFrMrcd7iL1Ocsu+lvHYjrppCDmJP/HS1zwm0Gnxz+T7uRVpgRMPmpNeY5+do02Q
         ioKQ==
X-Gm-Message-State: AOJu0Yxsi+4FUpTBaKZdwbaL7GlUqi620fS2w4K3LahgMVN5Xwvbaz2k
	e2zGSx7+/QBuNhYTT+vXA1rELrDG
X-Google-Smtp-Source: AGHT+IEYVFgFuCQ9/iSPvBP7ggc5G0uFd8cYcDJdySji0vrzDvhBu7qkO3oqJyFU8Fbgj1HNp1WU4w==
X-Received: by 2002:a6b:6915:0:b0:7b0:aea8:2643 with SMTP id e21-20020a6b6915000000b007b0aea82643mr3960976ioc.1.1701387523699;
        Thu, 30 Nov 2023 15:38:43 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ft18-20020a056638661200b004667eb7fd91sm565078jab.101.2023.11.30.15.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 15:38:43 -0800 (PST)
Message-ID: <7900802c-3860-4a52-aede-edc544461a57@linuxfoundation.org>
Date: Thu, 30 Nov 2023 16:38:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: capabilities: namespace create varies for
 root and normal user
Content-Language: en-US
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, luto@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ZU+xkpH09xjzO5IS@swarup-virtual-machine>
 <20231111173806.16775-1-swarupkotikalapudi@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231111173806.16775-1-swarupkotikalapudi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/23 10:38, Swarup Laxman Kotiaklapudi wrote:
> This patchset fixes TODO:
> "If we're already root, we could skip creating the userns."
> 
> Change namespace creation for root and non-root
> user differently in create_and_enter_ns() function
> in this file:
> tools/testing/selftests/capabilities/test_execve.c
> 
> Test result with root user:
> $sudo make  TARGETS="capabilities" kselftest
>   ...
>   TAP version 13
>   1..1
>   timeout set to 45
>   selftests: capabilities: test_execve
>   TAP version 13
>   1..12
>   [RUN]       +++ Tests with uid == 0 +++
>   [NOTE]      Using global UIDs for tests
>   [RUN]       Root => ep
>   ...
>   ok 12 Passed
>   Totals: pass:12 fail:0 xfail:0 xpass:0 skip:0 error:0
>   ==================================================
>   TAP version 13
>   1..9
>   [RUN]       +++ Tests with uid != 0 +++
>   [NOTE]      Using global UIDs for tests
>   [RUN]       Non-root => no caps
>   ...
>   ok 9 Passed
>   Totals: pass:9 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Test result without root or normal user:
> $make  TARGETS="capabilities" kselftest
>   ...
>   timeout set to 45
>   selftests: capabilities: test_execve
>   TAP version 13
>   1..12
>   [RUN]       +++ Tests with uid == 0 +++
>   [NOTE]      Using a user namespace for tests
>   [RUN]       Root => ep
>   validate_cap:: Capabilities after execve were correct
>   ok 1 Passed
>   Check cap_ambient manipulation rules
>   ok 2 PR_CAP_AMBIENT_RAISE failed on non-inheritable cap
>   ok 3 PR_CAP_AMBIENT_RAISE failed on non-permitted cap
>   ok 4 PR_CAP_AMBIENT_RAISE worked
>   ok 5 Basic manipulation appears to work
>   [RUN]       Root +i => eip
>   validate_cap:: Capabilities after execve were correct
>   ok 6 Passed
>   [RUN]       UID 0 +ia => eipa
>   validate_cap:: Capabilities after execve were correct
>   ok 7 Passed
>   ok 8 # SKIP SUID/SGID tests (needs privilege)
>   Planned tests != run tests (12 != 8)
>   Totals: pass:7 fail:0 xfail:0 xpass:0 skip:1 error:0
>   ==================================================
>   TAP version 13
>   1..9
>   [RUN]       +++ Tests with uid != 0 +++
>   [NOTE]      Using a user namespace for tests
>   [RUN]       Non-root => no caps
>   validate_cap:: Capabilities after execve were correct
>   ok 1 Passed
>   Check cap_ambient manipulation rules
>   ok 2 PR_CAP_AMBIENT_RAISE failed on non-inheritable cap
>   ok 3 PR_CAP_AMBIENT_RAISE failed on non-permitted cap
>   ok 4 PR_CAP_AMBIENT_RAISE worked
>   ok 5 Basic manipulation appears to work
>   [RUN]       Non-root +i => i
>   validate_cap:: Capabilities after execve were correct
>   ok 6 Passed
>   [RUN]       UID 1 +ia => eipa
>   validate_cap:: Capabilities after execve were correct
>   ok 7 Passed
>   ok 8 # SKIP SUID/SGID tests (needs privilege)
>   Planned tests != run tests (9 != 8)
>   Totals: pass:7 fail:0 xfail:0 xpass:0 skip:1 error:0
> 
> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> ---
> 
> Changes in V2:
>   - Change the commit message explaining
>     why this patchset is needed.
> 

Applied to linux-kselftest next for Linux 6.8-rc1

thanks,
-- Shuah

