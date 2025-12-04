Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54482DDC5
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Dec 2025 00:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764809030; cv=none; b=YCfAZzfZMwHm5fdqt8JfaWZmvoFqJa0XhJBWWRAzrOqSqFLHmaxoYwwC59K+EwlDYahlS9w1L6P3MCJXb0bY5hpC5MO+o3tkDXTDrIfMtI6x6cARriqfrQIkLNv+Ekx48FNnVdlP+EJHErN6FWcGlfgSie/puslT4xFFjiVaeQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764809030; c=relaxed/simple;
	bh=7C4m9y22CDhJly1Sa/M8ZgDQxAAaoOub7TsjprrN6mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Znaiuo8IToqYLLbR8VYzSJcM4jCV1RZovrBDdrGR9xiHLp5oCtLioD0aQCdSeQWcJO0lWCMdKOmim+vbflMQQlIg/CFJJPdJM6nZrfhqdKmKs4gxljLb04nDPv3SB9+l+GdhBbDi+dFYE/M5pBNTvJYJbVewHAr8dB0wR0GuWY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alnVpMO/; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alnVpMO/"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55ad466ad1eso117691e0c.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 03 Dec 2025 16:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764809028; x=1765413828; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61Fg0qope6bIFTvBwF2PK7eB2MmgYw/t+V2Q9FitbBc=;
        b=alnVpMO/RMMj4yti7sU9PlFyJGPxZtYZ981Ify75SfoEzvxkgSs7/MPKfmpbvPdaD9
         WXpeAY3p06cw8KDG3GDeWXthmdx+vdx9D/teXkDYWWSmyfmm7LOsk5VIj36x4pCsiBee
         Lb8iduuzCpVBagcV11XhHhoIqSiNoIRl/05h1O0j0HlWnvCn2vRDX+bB1yRCgtXv6rwB
         aQuR3W9hJIcdgXv8FFmh+ololIlH99Cjq8ZiacmoDAAiZYD+/UlcgoNoJvspv7GUd1N+
         VVtc6xKROibD9XxxxmK/jikS+x63x6WZPayUV54VdSsMxSsHMM2b2BaX5gs0TfWGj4/w
         bygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764809028; x=1765413828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61Fg0qope6bIFTvBwF2PK7eB2MmgYw/t+V2Q9FitbBc=;
        b=DGyrSaJkC1IeF6vH7m0bBkSvhBRzdM4VBv+wTxk1lZzR8sciHZmMXMa+pD/74eGOKk
         I4HheuHTnqPgpQ2pJEQEqMQGejDFTz93oxSgNnxrDhrRxIzKdIGEcwGBbYQMullr9G86
         vxLmlaTepwMqBBdI2+ty2Dyn3NqA3zQabVpdqLT7rqE1Dup7LLnev2BPqhdrhZMd/NUp
         lP0JHMe+V4ekalG79AiN3wBxrz6tQ1DCoLVVfM4yEHlhHRVZy2M5YqJM9v2jmvDgiN8V
         p/CoZEGw2cWZfm5FS+WFhays2AiQVCFVGR77vV9mSa7CRz36isRIALREJVgkxatmhkKR
         hVhA==
X-Forwarded-Encrypted: i=1; AJvYcCWYma2P7ukGDDaTIvsxDtHbaarWc/rAKEGIuT9lz7R1kK6F9nQL9WuoNgJmkDzTQXSXn/IvdEKJsTV0gDB1mDGoJ8UmZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoPcEZZmHiYgAJpWxHDijj1S0XJjszYjtVWoOE8Pky1dP4V4Mp
	imcDBGSh6NUNpCZy5pgpKZXxvGocJcVHkp7Qqm+lNVe2KVPATnJWJsqi
X-Gm-Gg: ASbGncthV0hGTrZr+jRaFbDvhflgbrOzuItY2k1MrfowdZ3pDyf3h22VFe3JO6BBYWI
	u8hktrHUYTReP2h3vauhERSez8xi/lIWw3dKnJE6A9/YenXtLTogvzp+mVg9KnYkXP4Q0o+HNGH
	xWkQEdwH2aCgRaHQCgVHLE0m+FpNxIsg5gnEOFi24knRzk2/XtA7BDHKy8uwaMQE8xdtwtqZwSn
	sUmBAazOI8XwrIo8kdCK7oDshocpydOafh5FBkHh8Azr3TaL4fCnv4XYHu3wj0kVJ9RAGKJWTnT
	TrbVpiTY00Zm/Q1VvhVSZoUWlWbfYbSb+2wbOHXJBqd7HSOcYUNusk7UOqToeMPSzWku0NSTe+9
	xsPbrgGyPp2pIwLU6ZuwZ1zdDK2z5U0CKEuQcduwNIpG01fYzMmPWGuXMb/F4Oo8ZSnjK5HYyz5
	T+PxJ89cdbtUXrGGSW0DP+rvsu78z8
X-Google-Smtp-Source: AGHT+IGsuatuhKh4iVq8o2lXvbj9+Qg260ROC3Yx+Y7OG23faK6RtOzwe4m6qVvfmSN3u8YYtNXYFg==
X-Received: by 2002:a05:6122:8c7:b0:55b:aab:95e8 with SMTP id 71dfb90a1353d-55e69d8b1e4mr240706e0c.9.1764809028159;
        Wed, 03 Dec 2025 16:43:48 -0800 (PST)
Received: from [172.16.226.146] ([98.254.184.207])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55e6c56853esm77504e0c.1.2025.12.03.16.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 16:43:47 -0800 (PST)
Message-ID: <fb90cdeb-3286-43df-9043-eb474bf4ba8a@gmail.com>
Date: Wed, 3 Dec 2025 19:43:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
To: Clint George <clintbgeorge@gmail.com>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 khalid@kernel.org
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/1/25 15:37, Clint George wrote:
> This patch series focuses on addressing various coding style issues in
> the dummy_hcd USB gadget driver. The changes includes adding relevant
> comments, improving readability, and ensuring consistency with kernel
> coding conventions.
> 
> Clint George (6):
>   usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with octal (0444)
>   usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
>   usb: gadget: dummy_hcd: document ISO endpoint allocation pattern
>   usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
>   usb: gadget: dummy_hcd: remove unnecessary parentheses
>   usb: gadget: dummy_hcd: move function braces
> 
>  drivers/usb/gadget/udc/dummy_hcd.c | 52 ++++++++++++------------------
>  1 file changed, 21 insertions(+), 31 deletions(-)
> 
> ---
> 
> Testing:
> - Ran compiler testing with no new warnings detected.
> - Ensured the module builds and inserts cleanly without issues.
> - Used Static Analysis tools to confirm no new issues were introduced.
> 
> Please review the changes and let me know if any modifications
> or further testing of the module is required.
> 
> As part of my LKMP mentorship i have to complete 5 patches as a criteria
> for graduation and thus have focused on working on such
> beginner-friendly patches so that not only do i get the required number
> of patches but also get familiar with the process of kernel
> developement. Thus, while this patch series doesn't address the max_stream value
> exceeding problem that triggers the BUG() API, i will take some time to
> dig deeper and truly understand the problem and fix it and not just
> paper-over the problem.
> 
> Again, i am very grateful for your feedback greg and alan to guide a
> beginner like me. 
> 
> Thanks,
> Clint
> 

Hey Clint,

In general, when submitting version 2 of a patch series, most
maintainers will prefer that you send it as a new patch series and not
as a reply. I usually recommend putting the links to the respective
previous versions in the change log.

Thanks,
David Hunter
