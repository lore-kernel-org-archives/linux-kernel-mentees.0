Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2525D8E8
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155085; cv=none; b=L0jwjge0+dYLX7QFFpAyom52n/fWFNSQct9zq57s56eeK4tyNXSZmTJ95YR0pggzzfzru3sCa2f7QiSVMGfU/oO63hoaqyeIhz7klmkxTGvTK7CYY/ACGJJnmWehdzFW5U8bRsXW0wy+5sQUs/gT05fxkoXOTni/2APSQw+iKYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155085; c=relaxed/simple;
	bh=axItH2vBexI9WYp+hgNirm/qy/Qm2h6LocHN2HrnuC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6yS+mwV6rmx59sNXkXEvhBwHJl8MQg+5bcEsQJ7mGhSAX1/ZdjkTaacJsIbZaHnF363TTTu6+uQBS+ix+gka3pQS6Qh0sA2QzePc1IhPiAFmgnaGLyeifahUNkB54/Etu/Ac/pQ6uukXNHnkICNNdnsxHRqWtScwyXRXiN/dGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLpLrpqk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLpLrpqk"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553bcf41440so993059e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752155081; x=1752759881; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZcBxk6Ub7G3BSN8mWlE2MxlVN1ULSz2H9YriMM7YwY=;
        b=gLpLrpqkLXmt+WSx2QLNxkZtNyoSXh80WPV5n/VUc3pwx2cKI4j55qul57upXAU2C6
         qUKIrNw/zbL38HzpBtw2eBGwVrvnIw/UtYX3wYswX/dYBaC5dtz6gDCZBZjsAHO+VoyT
         Vx3A+Z9G3mC50EP0Ep5htijYt01GQIDQZF2pvmzUR0fm3swqNLQNfxOLcTpiuhHo8+EF
         BnaDsZUCWgYXF9v5c9NAdewmCkKOJxJ+kCtIeObXOBgEeIs2C89mebtmWAryOlOsAe9A
         gET09aeTd2gTLUbM5NhjaUynPSBp2UF5WIzFS4r6lAncUnUaSUYkH0TT71pk5qKxwVXw
         qErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752155081; x=1752759881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZcBxk6Ub7G3BSN8mWlE2MxlVN1ULSz2H9YriMM7YwY=;
        b=uGPU8qY8XLRjR29py00JDafyUpPqOvcyo59SVBHvgu69MW1wio5YURsBQR81zFouIx
         W8vzrcC4ToJHTPJOKKAsFHhSgNyxCi5JC84CK3WQ6/P9KQXpFcItsZR9BRjVgBxswNZr
         moydLZCDtcS1eMl0prIvf9rKC0DcQnH2Ae9pElDXdey1UmRmD93C30UNp51hv6HbDrkE
         K3R9CZSfTvvbz1JFkgnWU0sEnkmI7YNVUDkf600Ph+nX4mBbcYxjlafXrm4Bg3eNRMSs
         PE9z3VOPDkU52c0e0R7K9lR+HREBsaWBudJ4stk93c/1SWmJkwrIC7Iu2ZYbxCdqrjru
         BL9A==
X-Forwarded-Encrypted: i=1; AJvYcCVn47ZB5RZKZPufjB8JzNNLGBMiFFfI5V4nov0iMpZjXy6zmLD3adC+hWsYJDMY/R6RdNXPA7W9rLN4V+9N3h27ym4iuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMT6P/0DLuQJ6POwGH3Kn2lfj1b7L9qgL6iGXWvo9WMb/gDQmt
	WsOLH8rYu/mjZEex0njGrs0gNHOXZiWgaq5/lcAPh36YKaSfyvH+He4t
X-Gm-Gg: ASbGncuuJMu/+cIuMDB5iaVfbfVA53bP5yFhprFaCyEmLGopZAgQZnwuWJJA6L3SKnl
	Ne7XxZd3RO2R921CQh4rCVUcRBkan9P1Md42bVPs0Da69pOUD/4S1Pc12jJ+XSd6AxLIzB7KaGD
	KdU2AkVYGPJCL2b6V1mN6N0nZZAfsINgxaA2WyD5KkeaIzjY5pVp4FrRVrzfUgMavEgSQZoyUcs
	XDCyuJS6bqqHHs9OeBsg98jW0TjRvw1sSuVQZy5iXCEEeYnuWdKbJX1oKofKOwQCH95tudRWrPF
	PyWP+Zy5f6Gm0qRXWJ1bnwyQ5z61NoIDNaA4p/ghkkNgKGuFftmqnDtXYoEWYkpCd/4lYa9ni/8
	snyiyutcYT8UrNgnTG880nmeO6K98ubw9k/wGnoJTKur4PtKQae+Of0ht6AfCEXRaCxSdPE6SOa
	OKsjEmC0eJLHYY/JfZ75n+K5Ar
X-Google-Smtp-Source: AGHT+IF3xzLbFd6eb1uuvSPRe25LEU48vxGpoZoR54hsmwmCzDQWYAU+9W5sMZtYCz1b98KqiGXgsg==
X-Received: by 2002:a05:6512:3508:b0:554:f9c5:6b3e with SMTP id 2adb3069b0e04-558fa90c6f4mr2987115e87.41.1752155081143;
        Thu, 10 Jul 2025 06:44:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:f766:61ba:c3c7:fc97? (2001-14ba-6e-3100-f766-61ba-c3c7-fc97.rev.dnainternet.fi. [2001:14ba:6e:3100:f766:61ba:c3c7:fc97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b736d5sm369615e87.213.2025.07.10.06.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 06:44:39 -0700 (PDT)
Message-ID: <221b6c0b-ac23-4b27-804a-aab9e563453d@gmail.com>
Date: Thu, 10 Jul 2025 16:44:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: Documentation: Improve grammar in DVB API
To: David Hunter <david.hunter.linux@gmail.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20250708155206.91281-1-hannelotta@gmail.com>
 <680b91c0-0fae-4230-9fa1-da988cb82e65@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <680b91c0-0fae-4230-9fa1-da988cb82e65@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 7/10/25 7:22 AM, David Hunter wrote:
> On 7/8/25 11:52, Hanne-Lotta Mäenpää wrote:
>> Fix typos and punctuation and improve grammar in documentation.
>>
>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
> 
> Overall, good work. Here is a suggestion for future patch series:

Thank you very much!

> Subsequent versions of patch series should be posted as replies in the same thread. Currently, each version is its own independent thread, which makes it hard to track changes. This link has the documentation for the proper way to handle subsequent patches:
> 
> https://www.kernel.org/pub/software/scm/git/docs/SubmittingPatches.html
> 
> The relevant part starts at "To that end, send them as replies to either..."

I wonder which way is preferred. I have been reading the kernel 
documentation at 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#explicit-in-reply-to-headers

Quoting the instructions:

"However, for a multi-patch series, it is generally best to avoid using 
In-Reply-To: to link to older versions of the series."

> Another good practice is to have the previous versions' links from "lore.kernel.org" directly in the change log.

Good point, thank you. I will start to include the links to previous 
versions.

> Thanks,
> David Hunter

How come there are two sets of documentation?

Best regards,

Hanne-Lotta Mäenpää
