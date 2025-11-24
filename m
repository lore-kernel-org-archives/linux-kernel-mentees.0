Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E683168E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003335; cv=none; b=HrzphIONph7J/GroGwaT3xafpl8TI/uDHcMnqqRW5o5BaJDjpD39SYz7Xh0JHauGvme0SVCUOWYQfAgxl1BBeqRceYdGX86ts58u+NVBqtHNDMUU9gzbtN+BkQx3e+qtZL0utcl8Ji8KlFywYbFyZ2orPl4MfwaS+uMmQ3jTjrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003335; c=relaxed/simple;
	bh=U0M/EmSJN19l9+/ebzMn3Zl/F3Tgh6cVySTFgrA/WJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYLvrAlJlo1aNT3VCyVyAfK5a2BALb/0EG+p28E4c+Gd6wvema71gnsNCq6t+fwSB7U/JNpgeVFoQIv2ykm4KoRXaOchkZJlNcJo0kdRRt3hQV3HIJBthyEGMBuhhFVWvo86hk44NYJMDBWFpKb1vqk0Q5eVIeEuFkQVaQNRz6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNX8ym6c; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNX8ym6c"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BF8140ACC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 16:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUJFA-jLxf1y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Nov 2025 16:55:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E1F140AC9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E1F140AC9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GNX8ym6c
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9E1F140AC9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 16:55:32 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso2434499a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Nov 2025 08:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764003332; x=1764608132; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PkTSzPqE//CxFZT2DpLFmyaJNBSmVJlFczuQFCha10=;
        b=GNX8ym6cUUAW5OKh3eqAGxyMucqFrK0Rw3jJ8zh/UQ4FqxjNyvIWXYG89ApS+1iUpa
         Wi+8nmB9DbXGFnZG6f/Wc4eFTXrT1MlBN05TpM6HWj+YKFyBpO0ahFL6S3UelTpZl+H3
         ZpKv7jkieXlqcTxbQwJN2YCsDHk4frQjpjvPHdnogZ+0abchpGfGLYYRHIuwXiqkC7G8
         VBbYlruq3RviTSV1dzV34Gk2Eht+hO1ykb1/H6Fz28NO9BdzdKDHE2VEMgA7K2wTWdvl
         oE0rdPBa9o95bQ8j6xAMIpMMXMom6HcbKQlbxxjC8GK/CQK60GEXx4/KLjXHzgHr0Y08
         2Mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003332; x=1764608132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PkTSzPqE//CxFZT2DpLFmyaJNBSmVJlFczuQFCha10=;
        b=a0Cdo5ZRIpEDK+NybqUuRIhsE2Barial+cUpz0dqO0dFHiNstZV8k7SciyTvQral1Q
         VQHzW1eohJYhzN4Vuw+n/txvp7qsukKgIrYYLf8wmuYKM24lwbzuxBUG15l/v/z9AoDf
         Mij/dcPrJ1SGqs9IJJwYH3wv5LCZehO6u7vwnbUcjTUwhLsk5fRQubwXda3Gc2ER3KGR
         qTPVpreqYNPpov9uAjBgaQG9O3tBXkByitK2n+BlAN9MPC3qJ+BS+0IgxBABvxwgTwd4
         pl26p4Ae8/uuaa/s3NxnrY3QSp4DzAmnY6IAuEhUXj0za218S5vKpKrprHnPyzAEscX1
         sEXw==
X-Forwarded-Encrypted: i=1; AJvYcCUrXcBckIMo3SoVrErX6EVIdbsuhtHukECqiUMPcJHdIAavIU77o71gUFcG8uR3vrzD6K2WEHJL66x5t6U1DToyj2KOhQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwPSF0ZvLPfr+nH3hReCZSNEFv+EiAkeI6sziEwQ1jN76fSDwkG
	wPPpjLXyasxmlW/WNxdcbh9wNQupcz7VsmCwAQ238+xEUlY2l1tISRE6
X-Gm-Gg: ASbGncs7S0a+91aC1ax0NYyKUYXUc79R/HevQwVo0QMZvJ3efU2RI30kk30QlPLhM/h
	f4B6kvePVc2RPeUzWx78dsrbSgzggpSuEbd+3cIQ2UbH4CXLkNbWrNm7fzueNL9G9ibnPJVU3RH
	QQjrVhaZOvdK9qGoZ6VYWsIDD/vapTt8EUW23hQlWcaDHFYbaxOcfhPU4oa7y1LJ3M9S4GyPBBM
	n1aX8ZWHK7AyQAgCCXNMJ7KpB0tYFxuhMxO9kDPJ70Cz0dPRSnIAE7AVvhzU9d7bSV+XudA6IaK
	boiB56cabsC/xncLXKjdXoVUxALM5O4jOACRMTnVGsKCB/McBe+UWi9XyXtExdOhIPQ3mj3hvMc
	gDB5s0WOrPYBjXPsWqLnCvg3LGsBv6FAeWMaGswN36vK1ztqhm9BaX0FvLeriWQZ/Jd0W6xMBW7
	81hWnw9XVQ+I8hp7z/YvMUh9n0Ra22nu0X3x4=
X-Google-Smtp-Source: AGHT+IE9A0t3u+DlBF5w0TChVNS8IAJiNWyhPSKPb8XU7WkuxpEILcbBsNrK17+S0nkmNY7Re9mHKg==
X-Received: by 2002:a17:90b:3841:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-347331bf3a7mr11163515a91.6.1764003331638;
        Mon, 24 Nov 2025 08:55:31 -0800 (PST)
Received: from [10.0.2.15] ([152.57.124.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727c4b663sm14053551a91.9.2025.11.24.08.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 08:55:30 -0800 (PST)
Message-ID: <4aef483f-df7f-420a-abba-b2fc27db0105@gmail.com>
Date: Mon, 24 Nov 2025 22:25:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dmaengine: add explanation for phys field in
 dma_async_tx_descriptor structure
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20251113064937.8735-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <20251113064937.8735-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/25 12:19, Bhanu Seshu Kumar Valluri wrote:
> Describe the need to initialize the phys field in the dma_async_tx_descriptor
> structure during its initialization.
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Documentation/driver-api/dmaengine/provider.rst | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
> index 1594598b3..f4ed98f70 100644
> --- a/Documentation/driver-api/dmaengine/provider.rst
> +++ b/Documentation/driver-api/dmaengine/provider.rst
> @@ -411,7 +411,7 @@ supported.
>    - This structure can be initialized using the function
>      ``dma_async_tx_descriptor_init``.
>  
> -  - You'll also need to set two fields in this structure:
> +  - You'll also need to set following fields in this structure:
>  
>      - flags:
>        TODO: Can it be modified by the driver itself, or
> @@ -421,6 +421,9 @@ supported.
>        that is supposed to push the current transaction descriptor to a
>        pending queue, waiting for issue_pending to be called.
>  
> +    - phys: Physical address of the descriptor which is used later by
> +      the dma engine to read the descriptor and initiate transfer.
> +
>    - In this structure the function pointer callback_result can be
>      initialized in order for the submitter to be notified that a
>      transaction has completed. In the earlier code the function pointer

Hi,

I just wanted to check if you had a chance to review it or if any changes are needed from my side.

Regards,
Bhanu Seshu Kumar Valluri
