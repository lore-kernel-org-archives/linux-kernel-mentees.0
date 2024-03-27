Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D5412F392
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Mar 2024 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711555983; cv=none; b=OjPNJnal1rAKiZlBNY4Biz8S8zblFBKbcwTeGlXDkFWI7/JrSjvNh8QyfYhpP2WsWmt279/Nkz3rmhGdMr5eToFNMuLOUfabG1XvrU601ppVl/sOk9fgklpB/RlvE0OPJFtXk7j8Gr6mbNr2pMhWCpN99myWSteZuPQAHxAj23Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711555983; c=relaxed/simple;
	bh=asmUPmQus7LUzQcer9/ecRHC+gd8g+NWqrc+D732lew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+p5Qi+sB6s0EapP1So9+aFTWYdKoEfGSWvYdxLDtZdC803Gnee8hj2uWMHQrSn/7pB/g4S1Jq5hUzCRhzuWYKPDRcFhgqtk6+63WUAbqYB21DYi8xWBJOVaLo4n+83X+Wu1FcaJZjbfbeizONBTXhnKXIOH3kjH64O82BGpJ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cTTv0GTY; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cTTv0GTY"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C86C140547
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Mar 2024 16:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_kJvWe5-HGg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Mar 2024 16:13:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECB114018B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECB114018B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=cTTv0GTY
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ECB114018B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Mar 2024 16:13:00 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3685acaa878so3927525ab.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Mar 2024 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1711555980; x=1712160780; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaFX9mxiKZDeQbSxmpDbkMXN0EZslMStzgRp5fvgfwQ=;
        b=cTTv0GTY6auaOb9JgXTLTDEvtiit7EAMRBvbvrzykaSCUo5XYfXGiXIBmaUvtbcQcP
         /a8eKrVLrp3U46RqDRY5P2f/aznnOPyB+I26BztQ1N24xiQDSU69u09PfYFgMOic3zwe
         FXe4ejYpEnzgy6PGKYUXBMygqMjU2ugIahRzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555980; x=1712160780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XaFX9mxiKZDeQbSxmpDbkMXN0EZslMStzgRp5fvgfwQ=;
        b=g/mXUniQje/4RdquB/14DhJqKV4ucCh2QjLQ4nxoO2OG0Po2EG94/nlSPaD0iHxmhs
         WLvUxeA69NadBDMs9qCDeM4vus1F4uy2OUndK4AUjXynEwvpvwQa5JE/NBg8KzJr413k
         +YSM9IuUdF1eNt1xtEm0kbLdW+TLEy4N6dTVEq+YZEMXTB5jN1wdhMtigx3pWlnz3Vjt
         YKGJk77m8WXkstQp3qf+tdLQ1+1a1AibyL66Tk5vEGWyDnmGp0Jr/SZy2hqylEZSms4r
         HmjeaXqCJdkf06vtn4mIi8gYbfrHA+hacYvWtkrWBdy9f8Wdh9TLkMw1OIdx4pDTFf25
         gwyw==
X-Forwarded-Encrypted: i=1; AJvYcCV15NmwQKyseSJoCUYSu3rUiE2c+ffSMEtRQAfBeYemny4RmLKiig2R06s1pRLTIHr2uaDlUU222ujJuMmRUgAdKvXDaDehJjU8MXh7dgdQ0yqnv2uv59sf8aDOFRTr
X-Gm-Message-State: AOJu0Yx9yNM0OhKqnSIjrRStoWGzeVRRduoGZqF/SQS5u1sRK6KJz0vK
	Ij0iZWkODMO1/pxtuB6lo/DJR6FrkmN4AbTMDK0OG8A0W/iUohBjSjPnVNomFU7MXg==
X-Google-Smtp-Source: AGHT+IEiXA6OtOY9zanEWliIGMGWJVj77uZLVHDmL258djEO4ZMAaUheobq2lblEoYMdKO5ZRdKtRA==
X-Received: by 2002:a92:d08f:0:b0:366:b0bd:3a1a with SMTP id h15-20020a92d08f000000b00366b0bd3a1amr436522ilh.1.1711555979887;
        Wed, 27 Mar 2024 09:12:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id r12-20020a92d98c000000b0036851cd6c59sm343584iln.1.2024.03.27.09.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 09:12:59 -0700 (PDT)
Message-ID: <3c8bcd55-3acd-4659-ab4d-567053049a7a@linuxfoundation.org>
Date: Wed, 27 Mar 2024 10:12:58 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Add Landlock test for io_uring IORING_OP_OPENAT
 operation
To: Dorine Tipo <dorine.a.tipo@gmail.com>, mic@digikod.net,
 outreachy@lists.linux.dev
Cc: "Fabio M . De Francesco" <fabio.maria.de.francesco@linux.intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
References: <20240327132001.30576-1-dorine.a.tipo@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240327132001.30576-1-dorine.a.tipo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/24 07:20, Dorine Tipo wrote:
> This patch expands Landlock test coverage to include io_uring operations.
> It introduces a test for IORING_OP_OPENAT with Landlock rules, verifying
> allowed and disallowed access. This mitigates potential security
> vulnerabilities by ensuring Landlock controls access through io_uring.
> 
> It also updates the Makefile to include -luring in the LDLIBS.
> This ensures the test code has access to the necessary liburing
> library for io_uring operations.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>

You are missing linux-kselftest and linux-kernel mailing lists
when you send kselftest patches.

cc linux-kernel-metees since you are a LFX mentee

Adding missing lists
   
> ---
> Changes since V1:
> V2: - Consolidated two dependent patches in the V1 series into one patch
>        as suggested by <fabio.maria.de.francesco@linux.intel.com>
>      - Updated the subject line to be more descriptive.
> 
>   tools/testing/selftests/landlock/Makefile  |   4 +-
>   tools/testing/selftests/landlock/fs_test.c | 132 +++++++++++++++++++++
>   2 files changed, 134 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/landlock/Makefile b/tools/testing/selftests/landlock/Makefile
> index 348e2dbdb4e0..ab47d1dadb62 100644
> --- a/tools/testing/selftests/landlock/Makefile
> +++ b/tools/testing/selftests/landlock/Makefile
> @@ -13,11 +13,11 @@ TEST_GEN_PROGS := $(src_test:.c=)
>   TEST_GEN_PROGS_EXTENDED := true
> 
>   # Short targets:
> -$(TEST_GEN_PROGS): LDLIBS += -lcap
> +$(TEST_GEN_PROGS): LDLIBS += -lcap -luring

Check if .gitignore needs updates since you are adding
a new executable.

The rest look good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
