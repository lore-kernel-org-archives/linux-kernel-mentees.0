Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABF1218EA2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759552271; cv=none; b=cp+tjIcUYzwdsuw04jly4jvkMOjUTNHWsU5zS+FwKPMSt0ugOugjiJcElCdi1eSFySFpRwMLkr52JHDay5sdDGs62lxJ5ssz9CVrWmUAU2oive9Zl0COxXX4F9FdCfJ06irRArTSoKh8hJSYo9yMv0YRo+v5EkD3s7siVZwsAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759552271; c=relaxed/simple;
	bh=enoINwlA9+PevoMLkOQfPIAcWmrKh+doHnEubrvsPIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=se6vBQIyGqvKGF3vQ6d/Slcye8TmNRfE6oo5cHkMWnqdA3NC7Y1i2cVsyXd1Z9yn3FEEVDnHTTspPhCbVj/IQic7i3XSyzP6KQwVk2JnKUFbMuJcDqGGY/H6r8HJ0f1r8LxwR5xO2L+B7LIAaFzW2OJgltuLgrpnnLj6lzSlKA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRQ27QjM; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRQ27QjM"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40BBB6167A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_0lxBua7wRE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Oct 2025 04:31:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9DE36616B6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE36616B6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PRQ27QjM
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9DE36616B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 04:31:08 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so2676423b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 03 Oct 2025 21:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759552268; x=1760157068; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=StwDBKa8ZRSfrd7VD6MhCNqBvOmQ/m+xhmau3mnSCHE=;
        b=PRQ27QjMNOq+zGbdCeT/O9h0STRnCNnaXpDJf4S07UsXdeBDA0I0VP+e+OghvFalPw
         97uit0HSZJvFJTJOwtoqh0kP56fR+rykqFyYPW091/q504I9Q3kzFummEfvTrxsTTAUl
         3JoPgx0rprVF1DIKZkuNDnyxvglezyqez5aaSQTCw3z+duPM7W6nPUWQeHbBiKLPAniV
         APKZ8P8mkZqy8nHtQqpbBQJ+zdOJ3uLbH0tXeAfb4/xPfelqlFAfcMtb5W84JtbZDNfT
         +lVl/MiEiJbVe0EckrpyUyhslLw1Fh0TZ5tMnVRUOWqSbgJgy3mezDgsRzirxVTQl320
         K5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759552268; x=1760157068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StwDBKa8ZRSfrd7VD6MhCNqBvOmQ/m+xhmau3mnSCHE=;
        b=dRQpydvMMKmzak58/UAPVpnbQL8saXzvh84VqkJpIhS1AT46Qx0KzI6F0OEIojTR3s
         zt/qxuBRBhrKH/wr58D2bVbRBPkYGIxWyMmfrgZz3PDI1N/Gv3Gwjl9vB5fc1d8GWZ58
         1OioFO3MRlu/IGSH9r5+o1SAIImSfYMKT/lnrEVZq5Iqe1Mxjubc9Q0F+cacPl6hdfiu
         9FOgFBQaZm6jU9QsAT0JXBEG7JvpiKfaSULHUWj+bBs/ZsngRKqgMKANc6XHDvaNnkhQ
         Mym/gNdqs3dxriICxCtsMA3X4/cYrVeTDZc6nBt1vWe77y6/kE8i5zZDoO4PchGLyoAP
         9TZg==
X-Forwarded-Encrypted: i=1; AJvYcCVfdenjxDooxGoS79NNfHTOdWrsHBdWS9w/7Bd+tBOaih7cYWCTs0py6yJZvn0b6SqLU59QeBi2ATvaBFCowCRFNSAU6A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyzW8i9qcQtjaUWKV9ZXYFk7SImdQla1PIkjXV6FHl4O/T9ZYXn
	WVAytcvF71NehmRPhph80XVTUDFe/N03FtRPMm+LLX1BNPqYY6FXbR/2
X-Gm-Gg: ASbGnctKeI4DklW0r3n7nrS4SQ1O/W1N6CSocn4RLiTLKHKB+SGOk5KA2uEvYdNbE6D
	tp0ZmCsdoQZA9TFa+h1+C0GTQUfZ6B9l6dXPJi740lNpUPTxxpT4UhRwrHFwrf6dsaYxMC4yUMe
	35EVwEc4dcrTM1LiGwhQua+FCGAgg8BcOm9J+SLavRDoWKtWlNgyEDDa9VqxF3xWyL+izTS0MbF
	CrVGz/yjFXmYjMiZ4yKik7J5CiyQDVmAirshDhKknCjzpDkNvxXWOJyylQ0xcDVt/6MJEon16KU
	rVBp7dXcZtnFg+zusuyfuu0LTI5/ut+YFCAuftoR6kHBmag6tM+79y7M6EaCigshrp+dZNdC3xL
	iTUFhh4ymly1jJfkUimPt5TEmWJj7c+q0yJz4eGytBDao+gfaMiB/GeGNjIiqKpI6rOP0WTw=
X-Google-Smtp-Source: AGHT+IGFVdu0idHFioNc6W6G3QpB4+em7I6xbQXdwjM7auYWjIP5jrn2CpWgS3aswdOPecIYETyQ3A==
X-Received: by 2002:a05:6a20:72a8:b0:2f6:cabe:a7b3 with SMTP id adf61e73a8af0-32b62107c29mr7468985637.50.1759552267731;
        Fri, 03 Oct 2025 21:31:07 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.90.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb1b73sm6413167b3a.28.2025.10.03.21.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 21:31:07 -0700 (PDT)
Message-ID: <9a7072cb-840f-472a-9e22-a5252e52ef48@gmail.com>
Date: Sat, 4 Oct 2025 10:01:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: doc: Fix typos
To: Carlos Maiolino <cem@kernel.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>,
 Paulo Alcantara <pc@manguebit.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-bcachefs@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, netfs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <DrG_H24-pk-ha8vkOEHoZYVXyMFA60c_g4l7cZX4Z7lnKQIM4FjdI_qS-UIpFxa-t7T_JDAOSqKjew7M0wmYYw==@protonmail.internalid>
 <20251001083931.44528-1-bhanuseshukumar@gmail.com>
 <kp4tzf7hvtorldoktxelrvway6w4v4idmu5q3egeaacs7eg2tz@dovkk323ir3b>
 <yms8llJZQiWYVxnbeWEQJ0B_S6JRxR0LQKB1FwVe0Tw66ezuA-H1qZVCyuCUDtsw7s7h4jHTwTh98XivLW3vvw==@protonmail.internalid>
 <425ef7bd-011c-4b05-99fe-2b0e3313c3ce@gmail.com>
 <6t4scagcatuba7hjy4aib5hqfgyhc4wofegr2jrl34wwa7fsyq@5uwpzmpixm7o>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <6t4scagcatuba7hjy4aib5hqfgyhc4wofegr2jrl34wwa7fsyq@5uwpzmpixm7o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/25 21:22, Carlos Maiolino wrote:
> On Wed, Oct 01, 2025 at 07:19:13PM +0530, Bhanu Seshu Kumar Valluri wrote:
>> On 01/10/25 17:32, Carlos Maiolino wrote:
>>> On Wed, Oct 01, 2025 at 02:09:31PM +0530, Bhanu Seshu Kumar Valluri wrote:
>>>> Fix typos in doc comments
>>>>
>>>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>>>
>>> Perhaps would be better to split this into subsystem-specific patches?
>>>
>>> This probably needs to be re-sent anyway as bcachefs was removed from
>>> mainline.
>>>
>> I just did a google search and understood about frozen state of bcachefs
>> in linux kernel since 6.17 release onward. It is going to be maintained
>> externally.
>>
>> Thanks for your comment. I will resend the patch excluding bcachefs.
> 
> It's not only bcachefs. But most of subsystems and documents you touch
> have different maintainers, so beyond removing bcachefs bits, I'd
> suggest looking at MAINTAINERS file and send specific patches targeting
> each subsystem. It makes maintainer's lives easier, at least for me.
> 
> 
>>
>> Thanks.
>>
>>
Hi,
Thank you for the suggestion. I will split it.

Regards,
Bhanu Seshu Kumar Valluri
