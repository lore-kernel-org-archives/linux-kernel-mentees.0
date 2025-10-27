Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FC32D5C91
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761542878; cv=none; b=sUBY1zjgGQNYmhgCqH6AJg8GKwabAs/d22qK4lPBdF8D4/gPCHdcbYOeerUXOoforg07L9405mBI77re6GiZgiAz7xiZulxxNyNJC3owf9d2sxIt59iUe/zdOBtGtesEEZPHNSj9IjeqtOz/7NarLBM0B+3f1k7a8WCdfYVICqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761542878; c=relaxed/simple;
	bh=inJww/Ob/vbUK/5lqAm9xN5xYDYWYeHnIJvj2WLxyEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4W8v/bHGAeOinVIWlmWrVooNY1RrhCbG7oLTtvRwEtEYqhLDvYOKzVcjJHMBIQg3HLfV8PmJtvPmMmu9FYnGr08nSZO5+ZWHSUJT0FLHrM0KgNWA32coAR18Ti7Ez6gGhQ5yQJS7i8/mexJJqFq64kgxY0U8tIlfUAPsEgy/Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxpitz+1; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxpitz+1"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CE74407AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vx4AagmiASW3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 05:27:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7AEC840022
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AEC840022
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lxpitz+1
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7AEC840022
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:27:56 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7a27c67cdc4so3063013b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 22:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761542875; x=1762147675; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/RAYqHmH1h4sjp1gNfQ9pppA/esaFm9GV+1pQeVlcQ=;
        b=lxpitz+1jBIfQ32SmXWY+MrgPK7hXZE9+RnriZCw7Otz1KVEv+N1dDC811xbb7+JZV
         U/5XBmItpowh8reQZiFrJ6ZP9osUYS0ciayoVl5Ev6YF0Ew7+iSiZKer/euUk6feGQaA
         G3yw2Jkl7A5HwfyoXBcMu3XVt70ch2TbB6kRmaiSit1Sxaq90e7B9OSomHeq+TsXarNu
         hGync9I4nurz1W4pojel2SytN6nLDYojjwtpSufQPv/09iizxG88NV/8d4q10NLB8JUa
         qXEqfLLix4yl0yPW3sGXNdQtXtN4ZzDLunpSEeSzNKQ4e/dEYYGxIol8Bj6JYLmjR1Im
         EcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761542875; x=1762147675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C/RAYqHmH1h4sjp1gNfQ9pppA/esaFm9GV+1pQeVlcQ=;
        b=wk2PPSDWqksQEDizoulMReEEp6u7jaqgo1dp8khqD6UD8tJip9tE/RefIP+5q5PF6F
         cHWx5yAFgasTntBpdjZH84Y3Enrj+jowOkQvjpVQSsfCTiKxOHZBgLpq4F8OoEmN0BAZ
         cd+jGh85xmsLeLxVeLHlaYWQ0P1UDC8Auk/WfCWGbgXhe/87lrzSTrlUXfuqxkD4io+1
         vNPWPK+68dv1JZ5DVWzVtgGjstmHwblZnoCKwap6xR3w/0eMUWiIDVr5Q3u4Nt1Ua51O
         NZcdUNm3xSiIOJ5hh0xIZB34oyG8UtFxGsaNV1QVcmnoDquK2/iYWHl7mBQTPkqTPsRJ
         0X2w==
X-Forwarded-Encrypted: i=1; AJvYcCWHXc6jk3wjmTb1/5zfLwvJw/xYOgWIkkWSd5NtPFHVN4JeoWIE0fdsepx3QwRZW7esKp1kG4gZOCtAUvSuXeDufXs3Cg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyLwn7QDsLdmD2/b8JWvW8S7MijN5Jb0blsDUcK7slcbzCIJq2Y
	1rzu6XrG/9mJGpZSM+Yh7sX+Sm5+IeiCDNDhbdAgqQcyDsLQRDYmOTyT
X-Gm-Gg: ASbGncs3RMjY+aFmbtEbTNhVA/Ae65h2mhhDHY5qTTLnmRjVX4G6AMsGbEslhKaemlC
	yAJ/7NYhX1MwxRnep/Tna9X4Gxxxst2Ek1E081uHqzPQQnkWeaxICcZNbUE+suDwlU0d8iQ6r8c
	A0C2v0d3SXerRUP5Ndq2vS0KtfonQa7UzRtPMT0mCEDtEhzOIjQb6Kym9nRwQbImxj+YFqDQ6T8
	+JAaIt1bc2M7Pq5rtFGZehhwwKJd9IXrtmEZlINVryyl7gFAoiJbHIxw4JfpeL0SyiyC2bccAkv
	CS+FFTXmnuOyHUjuVffmC/ImFF4fBsQuyMpsCBZF+Lq5rVcvo++q28VPmzQPHNaC3NDiiJwyTvk
	2cawNpai6CdC5GwSY2b2ab1jL/1lveG4Aaq1lJr9GWBmLIHwlcMWcYPOquhV/S62LIu/a7LkGr+
	JESblZ3/bLherlyYUHMQNhTUsva4TTa9E=
X-Google-Smtp-Source: AGHT+IEMUesQIHcuQu4FxPZyWoemXbk+ksDyGhqzHexxaBE/vxFXq0kjagvpHbM0Q/C8rA9lLvDSWQ==
X-Received: by 2002:a05:6a00:27a0:b0:7a2:7f87:7ae7 with SMTP id d2e1a72fcca58-7a27f877cdfmr12402808b3a.19.1761542875391;
        Sun, 26 Oct 2025 22:27:55 -0700 (PDT)
Received: from [10.0.2.15] ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414072487sm6601511b3a.52.2025.10.26.22.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 22:27:55 -0700 (PDT)
Message-ID: <47844424-302b-4a99-9cce-82924c7b7ebb@gmail.com>
Date: Mon, 27 Oct 2025 10:57:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Makefile: Sort Documentation targets
 case-insensitively in make help
To: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20251015012922.19467-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <20251015012922.19467-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/25 06:59, Bhanu Seshu Kumar Valluri wrote:
> Avoid case-sensitive sorting when listing Documentation targets in make help.
> Previously, targets like PCI and RCU appeared ahead of others due to uppercase
> names.
> 
> Normalize casing during _SPHINXDIRS generation to ensure consistent and
> intuitive ordering.
> 
> Fixes: 965fc39f7393 ("Documentation: sort _SPHINXDIRS for 'make help'")
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Notes
>  - Patch is tested with make help command.
>  - Verified case-insensitive sorting.
> 
>  Documentation/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index 3609cb86137b..00c81e7947a9 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -23,7 +23,7 @@ SPHINXOPTS    =
>  SPHINXDIRS    = .
>  DOCS_THEME    =
>  DOCS_CSS      =
> -_SPHINXDIRS   = $(sort $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)))
> +_SPHINXDIRS   = $(shell printf "%s\n" $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)) | sort -f)
>  SPHINX_CONF   = conf.py
>  PAPER         =
>  BUILDDIR      = $(obj)/output
Hi,

I just wanted to check if you had a chance to review the patch or if any changes are needed from my side.

Regards,
Bhanu Seshu Kumar Valluri
