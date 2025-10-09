Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC109260590
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760019396; cv=none; b=YgMlOuTwcDDDYmi55buCjUSEyaRXUnLykKjj58abuhhdq39TFyrGdeIDlfB+eL1zh4/Nua+fZDNJNNH4R3/+emAsGY9dRL3alelEyHZWUBSQUcHtm4PfiprMe8N85zQjMr6EdjZiGoaTEh91Fm+D8vKcVbit/Qx6f0nJrDyNR8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760019396; c=relaxed/simple;
	bh=INg2l1L3qVlchF8lbtAersWzkgZD/yRLdxvFc3cUXeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ky9DtU7aZOtti1lrNLl3KwEAZb3qaP1HbkDzQErTxxQfiKg1Nk+a9QuvO3SRjsIsx1eiCze13zYiGPpBeCcpkh6cXP1aWTU5DBlKr+1a20aPrIde49bJgCnCMcm5LhPu4txgPAjbrI9JbuvBE0DgSKwht72kVpBdnDpHkdnCbMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hbxm5hFY; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hbxm5hFY"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5126461298
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 14:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsc0-tkp5vMO for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 14:16:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A7D461293
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A7D461293
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hbxm5hFY
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6A7D461293
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 14:16:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-46e32139ef7so1717205e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Oct 2025 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760019392; x=1760624192; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KSrrO4mmiUzY5qFigdCsu5TCXkFT2TeakHQbJDtrsro=;
        b=Hbxm5hFYaAHD0BfGvyaDum73vTDGLP2IXzG6ju7j2yo2AYeS7r2T+oZf5uEGdpy8m+
         i6uCRuS0Wx/LMNUbR5WSM11KMJalq53XOOQsMd9IR3XErUpJlInXNo2bnhaKHgt7uSN6
         I9+/NiDVbPxGGp3WBP9BdO0VeaMS28FQc48cgRpnY1P2GSt2/ybs9/8lYb3LNYaj4r8X
         jmcU1Cf6aemRYubGDavDmkh2wdbV0xiSv4AasuIKO7BRHQNAQaZ9iCTllICcE6hEBrLm
         wU+6XIFKKhKKFjhgvhjLRWIJqfaHFAB5s8YqKbhyP/h3EKf8SIPaR6CSTz1AjLL0PS9e
         FP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760019392; x=1760624192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSrrO4mmiUzY5qFigdCsu5TCXkFT2TeakHQbJDtrsro=;
        b=JnuesxOlaqb2NR3GmnfyCHP30zgVDAMNkRrzPvsyqN3D6u0owuOE+StjKH96B9BIT3
         S3/Pa+Nny7KZ1qQQixzy/gXWWZrhFUhyijjolcC6GscjuphChP6yqEzl4cMRNs942gl5
         k9j2pRbP6KqwD94wbVwN1hSMIP+AvpxjEI5w+j1E//tJKRoVzf4aTJDOEvrVzhjwW08r
         MzLKto0PrDirsoa6A1b6gG9Eor3YMAG48H+kMfSLRdsAUpMhnctN+HguZHKIz5+Ojcwx
         EUmE7VYvLFhqQbmiTppOymqbeyHgxNVM+o9my2TbiYAmc4JKfduSolx2zS5ikff5OxUy
         Gupw==
X-Forwarded-Encrypted: i=1; AJvYcCWbncgx3hL6qoXC0arUIvum17WO5NmVOXEnrTN+h1X3ZqjV8/xl0f1GaZi3VhYZtRg6ceofPTiZ4f+1zSdxF63UZWHcog==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw0z4ygzh+u3BRXS3cuWDc0PfvG2NTF8CxmDO9sA02yv3E8bNsd
	xsU1EiH6UUKXVn/BMCh9v1Qn4qjxezUZ+oUWeSJv6/5n2iF7TvJK4tK6
X-Gm-Gg: ASbGncsNZsyAm8CSYLPtxAXxjGnRBpZwgISn1ihYga7L8Thlo5lVPFBHXjduK+LI+bE
	ZTj7CEzPlwHcogYt4AVjPefJ3S3v9pXsBbud4vDHNLmIfXN5GyYH3QHV59K5fpff/YX34gAwZbD
	U+OPnKDd4/lyWkty/0QCbkgPaqf5XKd2MywJt/BYax9JUia2zEqSzayA0X53cZXTHt7AAbq9/Lw
	uaIwUUfOogp6amU5H2+8TSSzkkoQ5qvTDbsu/ZYcehDN0EH6ClASMFpDFlHPkPiBKk3yx8Nt+GL
	Fg3/pjHToqjJ3lxyTPlmoL9RqIJM57uTDV8OE1/L/5lduPV/RyYP4f0kh+0jPo9DlcLmow3PyxX
	Bfwud4nxoqMs6K6Le/3XUU7AgBmZ+6egzfuXvLL9bnv/qYsSW2WvYn3zEnRDeX+wqmqWYX2jM/O
	Ebl0FR
X-Google-Smtp-Source: AGHT+IG9tRKBlq86RJLVpcZ2NOyilhHrsunhrFrqoHub96Rq1cpuS2RUwseJcNN4aM0Y2mlO6+vqOA==
X-Received: by 2002:a05:6000:1846:b0:425:5d25:ffc7 with SMTP id ffacd0b85a97d-4266e7d4864mr2905327f8f.6.1760019392134;
        Thu, 09 Oct 2025 07:16:32 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.46.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f4ab0sm35103359f8f.52.2025.10.09.07.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:16:31 -0700 (PDT)
Message-ID: <84bf5902-b3e5-4d58-a2a7-f01e15cfe143@gmail.com>
Date: Thu, 9 Oct 2025 16:16:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: cpu_rmap.c Refactor allocation size calculation in
 kzalloc()
To: Shuah Khan <skhan@linuxfoundation.org>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org
References: <20250930092327.27848-1-mehdi.benhadjkhelifa@gmail.com>
 <10082c41-4302-4cb3-a2bf-788e59bad0c8@linuxfoundation.org>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <10082c41-4302-4cb3-a2bf-788e59bad0c8@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/25 11:23 PM, Shuah Khan wrote:

> 
> How did you find this problem and how did you test this change?
For the first part of your question,After simply referring to deprecated 
documentation[1] which states the following:
'For other calculations, please compose the use of the size_mul(), 
size_add(), and size_sub() helpers'
Which is about dynamic calculations made inside of kzalloc() and 
kmalloc(). Specifically, the quoted part is talking about calculations 
which can't be simply divided into two parameters referring to the 
number of elements and size per element and in cases where we can't use 
struct_size() too.After that it was a matter of finding code where that 
could be the problem which is the case of the changed code.

For the second part, As per any patch,I make a copy of all dmesg 
warnings errors critical messages,then I compile install and boot the 
new kernel then check if there is any change or regression in dmesg.
For this particular change, since it doesn't have any selftests because 
it's in utility library which in my case cpu_rmap is used in the 
networking subsystem, I did some fault injection with a custom module to 
test if in case of overflow it fails safely reporting the issue in dmesg 
which is catched by the __alloc_frozen_pages_noprof() function in 
mm/page_alloc.c and also return a NULL for rmap instead of wrapping to a 
smaller size.

If any further testing or work to be done or even suggestions on 
improvements to my testing methodology, I would gladly hear any advice.
Thank you for you time.

> 
> thanks,
> -- Shuah

Best Regards,
Mehdi Ben Hadj Khelifa

