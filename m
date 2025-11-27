Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4552F1FD8
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Nov 2025 20:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764275745; cv=none; b=MQBguvXk0jjlzcfOB12a8uggQPqr4RVGAOWtjewpoLltxKlUI81YZnFbspYMVlYeMoLiBytfC5ACGjrj51dlty8SFAGtPGUoSQvOoGIpX1J0xhGH+orRP2ZlcnSHgJvT+O/jnSdUc8HZ1YpmhEVpGQdClb6LYmPWvq2qKVcMSgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764275745; c=relaxed/simple;
	bh=HtDJiGKwBcd0MheKnVnzDxPgz7tlHfxmRyB9yTFfvLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVxLM60vzeh5zDoJvczLBNpMY5gj5fDxuSKTeHhjKVDA0WK1rWGDS0NN2eq08R7QpB0o8zH1MsBNoAHFvfH7ksmBHBrUvmS+v5qCqBv+XkuCCYBElkcoOdmaL+DwzzrqPi1z02rvIXpFW7uRDuEcVCEi4ZxyhHk2vjE4VCZ6i7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CohjRF2x; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CohjRF2x"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-640c857ce02so1076752d50.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Nov 2025 12:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764275742; x=1764880542; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiJqKid1AUPaq0JBx2dwztOPzocSSNqSoSuSWdADDrE=;
        b=CohjRF2xFt3ShE7uFhAmb4XtvvfeFqZx6Zf2gPsJMZV4ER5llKJH6E4SGTBkyK9FFS
         eiS4pz4prv+6deyFmCEzJXXzWysgH9GQCUgnNFKNjVKFclzf1P68/dcdfTBDw3TF1mdv
         gF5BlzCPtB42msRGm2sYlFnyJmVIwjDCd2fdrXRJ5Ani5xAD2mGa4ltHUAE13XJwA7qH
         5iN4V4d6X5LvnLVeSnB6kl+QmuQdfpxdLAKVcAUJDLvOiOcZWbTxEFGMWxvDB2FHT1f/
         IDexF8KReznR3qV26yeR7HDZ+cdBGP+27z/x7Ut4zbQexRo7lxqDyIru5jn9W4qRykqS
         KzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764275742; x=1764880542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiJqKid1AUPaq0JBx2dwztOPzocSSNqSoSuSWdADDrE=;
        b=e8gHrEBc+Jd2qTHhvNFWO2BhVB1QftyJv+mS/uaD3/lD6fkJnrlSL1paj+FA+Lnh9U
         YWYazQp4aBaB7Zg3NVEj9srXJuJCprjRvYU87YXHi0hfPzukXRBx7oN8gYmPUV1Zi1II
         vYJf8W6v5wrDXgkxRJd84yB3qyP0dm2uevGeZyMCCzjY6CCsqxcxcgCFE8/WkkRmMNOm
         ji1dYmr1rZJEhANDtTmfS8LaK7hHlDiMdzb1FJVc0MrbwEH/M2mC/eBcYWBnIGJZ6SxG
         ftFqB652GADlA49myy52RC+NPOabZBrnP2xUaPvOOH/3Y+DvaQjvna79NqiApwIJXksr
         LBYw==
X-Forwarded-Encrypted: i=1; AJvYcCUPpW06PC9Ar66GNofzeBTRq26nlij2w7OjCOHVwWgD1o2uV0NALJtVSTWdwOfDqNDb8BbMSTz1dsu8FXlrxrV7MTbOyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrgmzlQ8Yr/HODjVj9iaJ/sd6/W9AAbYIBreqBgINFSsTpxtII
	zJb65HepU6lEIlvmP0WL4DIeSiN18PBVSzMBhN3unrC6B3WAX+QwtjKx
X-Gm-Gg: ASbGncsJ0E16tsIV8vTOr5KrGdi/B7rAwEW50M/EOZ/aEQulMjMcBXpPG7etQDIzed7
	E0O1KrRlxzyBIZicE1RRuEPo+hG0DHE/I2eFBurh+ihgeWY2nbQY2iY5uLSwq03HYmlbv9lqGeD
	evxZ/LisXrV3wP5JuqlVm4tMQhMpSdQjBuecJ5uIEG5Cte4FcFu69dDfRDVPEjcF0ITxdqQ8//D
	+DFPYgzFAF92dRPSXkBMgqK1XA99QBsbmwXyiLxN8MR7nAnUAM3Y3aJicxp56jFURd8meHb4fvI
	H3Aphv+CXxOcqD/5DjN/gV1H73Bnp4687txcAHbqbXivAc6yWudI8+VjffO9UmjG1hHIDgJgVEd
	rY7SPcjy9FWQCrI6lHfKV3FqjBBA63xJaehvBrMGKDpCDNrgEHxU6Ysk0Grr9HVxJ87aiVQLJrn
	X4dWh+9xW5T+FuQd6I0MoV9tARDF7h4a1oh7v1PO9pGXFnof/4Cm8IZNJ8A7mxIUvRIntA
X-Google-Smtp-Source: AGHT+IH1ZhvCQv2MEp+5/UarxbSxfCaOdxcBamQdmSSrJtRgTbE7ALnAkKsKzoTBGbYiZAzE6cNyag==
X-Received: by 2002:a53:ce8f:0:b0:641:f5bc:6999 with SMTP id 956f58d0204a3-64302b39306mr12603551d50.85.1764275742186;
        Thu, 27 Nov 2025 12:35:42 -0800 (PST)
Received: from ?IPV6:2600:381:6a1e:8e2d:1df2:9a47:b4c6:d8c2? ([2600:381:6a1e:8e2d:1df2:9a47:b4c6:d8c2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d5fe10sm8958637b3.14.2025.11.27.12.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 12:35:41 -0800 (PST)
Message-ID: <70565b52-d42d-4808-84cd-ac8587c75b10@gmail.com>
Date: Thu, 27 Nov 2025 15:35:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] usb: gadget: dummy_hcd: coding style improvements and
 error handling change
To: Clint George <clintbgeorge@gmail.com>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 khalid@kernel.org
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/25 08:08, Clint George wrote:
> This patch series focuses on addressing various coding style issues in
> the dummy_hcd USB gadget driver. The changes include simplifying error
> handling by preventing kernel-space crashes, improving readability, and
> ensuring consistency with kernel coding conventions.
> 
> Clint George (8):
>   usb: gadget: dummy_hcd: replace BUG() with WARN_ON_ONCE()

Hey Clint,

Regarding our discussion on Discord, I wanted to give you advice and
have it be closer to the code, so you could see what I was talking
about. You asked about Greg's feedback regarding the "Bug()". Here is
some context so that you can understand Greg's feedback a little better.

In Kernel development, there are thousands of people writing code. As a
result, developers will write something like "Bug()" or "Warn()" if a
particular path/condition is met.This is to create a signal for future
developers about situations that should not occur. A later developer
might do something that causes that faulty condition to be met. When
debugging, your goal is not to simply remove that line. Your goal is to
find out what caused the faulty condition, and fix that.

If all you do is eliminate the signal that there is an error, you are
just "papering over" instead of addressing the actual issue.


>   usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with
>     octal (0444)
>   usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
>   usb: gadget: dummy_hcd: fix block comments, blank lines and function
>     braces

As we discussed, you can break your patches into something more focused
on one type of fix. For example, one patch could be to just remove code
and put in a more meaningful comment. Another patch could be removing
unnecessary spaces.

>   usb: gadget: dummy_hcd: merge multi-line quoted strings into one line
>   usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
>   usb: gadget: dummy_hcd: remove unnecessary 'else' after return

Also, some things like your changing of the "else if" are things that
you do not need to change. Some of the knowledge of what to change and
what to ignore will come with experience. For that particular one, most
developers are used to seeing "else if".

>   usb: gadget: dummy_hcd: fix miscellaneous coding style warnings
> 
>  drivers/usb/gadget/udc/dummy_hcd.c | 139 ++++++++++++++---------------
>  1 file changed, 67 insertions(+), 72 deletions(-)
> 

Overall, my recommendation for you is to reduce the amount you are
trying to tackle at once. You can work over a longer period of time on
the file. Not everything needs to be accepted all at once.

Also, feel free to continue reaching out on discord. I just wrote here
to closer tie my feedback to particular patches.

Good attempt at submitting your first patch series, and don't get
discouraged. Getting feedback is a part of the process.

Thanks,
David Hunter


