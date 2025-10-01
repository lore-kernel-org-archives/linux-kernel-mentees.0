Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254B2FC871
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 13:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759327102; cv=none; b=PziCfSJxufvS47ddAwEVf7xikGFigeMkkRIWWO42TVXTNfz8HlKZlPFcrP+I9RrDJQIZPBF1PjIZ3jhqmG730mA5iYpUKtCM1cHo0d021ULTtCKEjFwEnFsnICEUGIfEKBMJdNadwG//19cSn7QR6ocQC2PsVjDgc2CcVG8Epvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759327102; c=relaxed/simple;
	bh=AErz9DRE4zvoV1QAhCMy5Ce5EIwMk6a2u/GPbn+LmQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrXM99WYgK/78zOWbQV1FGINg1lGFR9AjBFffFq+NE3KVsmwdraR1aDTJHOiRGbpz469IhLGPORahbwsW5nT9A7mksG1k+Vq6xULgMDYhgPpskKfDTwUAMOmsnmVplFQ7IJAGocJQIP+I+MpzaErWuL7hLtFSTsxM39xeX5cDq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiYJlJaF; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiYJlJaF"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD0E4125B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 13:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30QpJfse_qPy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 13:58:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20BB14124F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20BB14124F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RiYJlJaF
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 20BB14124F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 13:58:19 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-77f605f22easo6665023b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759327099; x=1759931899; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cHICQ9kYf8w+w6O3p0zJJOxecrN+M89vOZ1OdrVwWEc=;
        b=RiYJlJaFOvXyG3J2HWIv5KrCnPqJL+I/tjZGAMNOvEqUuXctXmDkRm2neDuRkCNE0Q
         rgdGd6rY7hgiDJAvyjggtAW3A6mnstnhsO7upCrhJrJoROxGa0Wz5S80oRaTE4+JfXYj
         +zkQKeyLzsRyFUqpj/YmGEBdDw32UR/rsdmZ5MRogNGj65mMjntZXHLMallF/T1YjxC6
         EGVteryUAtAjhMWyHmuJdHyRzJaGkgIvLAAHRotmTlJlbkHdCXY3d1X4LS0iuMTJbB6n
         kRsB+KwvKJVPuJAFYv1CV0OrK/wMnuZa5d97u5Yems0Uuy/AQfVvpzSsiTUDGkF3Jod9
         eI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759327099; x=1759931899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHICQ9kYf8w+w6O3p0zJJOxecrN+M89vOZ1OdrVwWEc=;
        b=f7C4bVlDyMVYdWqztp4zs4R9TWuHKXcscC9fLYjGTjfBj3Y6QU6wifAJ1LhwqUy3dB
         xIntHcHzLea48UjD/D5ESXKsz+2KfFjcU/hD11OsFYq0mgQinLAcDXUF5bLhK0c+XZUN
         dXhk5TwazNhbuvzgQLuh9EKeAXOk+jHyMcOjubHaE8Fbu0NE/CJ/mrWFhDITmlJ9DXL8
         82QPEV7SlDT7OMNmCOhJu24ZV5tYYNVG0V2l7iaqgaMIFZt3hqfzBQCbq8iwslETZokF
         KeWOgCbELg9aQCmv8b0bJz8vczwLW4Bsh6rPc4Xyq3cW1QvCOlglWR1PpCJr1Kp7yHRO
         LFNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxNuVK8azYZBatXVE5HedytUFBVAn9ig9MA50imj3juT2b0eqWZIHjIdDEuBOCB1G21hvmUomQIj6I38nPyc0WAgfHKg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwgUCrbA8nu9DpmgM8TSrOLBFT8vHWO0z3FP90cAZlp38sflA3u
	vNf0J16g8WUHlD3NnsTGbUw/tb+ZSScySyZjT/O3iDJkaAVyDy1rrjMJ
X-Gm-Gg: ASbGncuaYARovYoOsrKN/TD250mOQhpOII2MRadZSj35xbjnY19eYipGK9EjXkXBy4E
	dVYqef4+MKDhsY56VmofHx7yotoPjf0M57yUld+1hO0Qa7UKciDywumnCF99f6RSFP5faJywTSh
	zhInROfGvXXzukAmNaaB/lwFmTcqu/rmhikIscBdt0Zo+zkLguZMYnfstrxqeQXIKnTBTNzoo2v
	ONTihPdT02XFNYqvBmybf+NhhISlhf9/jHEJMKdV7ngiJ1p2TrP1396/IZ9yFJfPbTlz4a5Y80+
	LxKYDwFe0Nhl/7ZdHEkc1+RFn5p7GlnyknS1UsWTclo86OVDNjXbgodq4sLbRyDoC5SzZwJaRo5
	dn0opiDnyshgUCCqirTS4D8Y6Zg0opSiRxo6TE3o4rGEWYsinJnlb040FSxoTBcRr/I+Deg==
X-Google-Smtp-Source: AGHT+IEVrUrSHnJxKWleti3ip/7ssnZbESbu792noCsfEcKl9fEdE1xbBALgSKgo50vIeSR68LO4xQ==
X-Received: by 2002:a17:90b:2249:b0:330:852e:2bcc with SMTP id 98e67ed59e1d1-339a6f38013mr4558738a91.21.1759327099110;
        Wed, 01 Oct 2025 06:58:19 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.95.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3399be87425sm2129797a91.1.2025.10.01.06.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:58:18 -0700 (PDT)
Message-ID: <425ef7bd-011c-4b05-99fe-2b0e3313c3ce@gmail.com>
Date: Wed, 1 Oct 2025 19:19:13 +0530
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
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <kp4tzf7hvtorldoktxelrvway6w4v4idmu5q3egeaacs7eg2tz@dovkk323ir3b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/25 17:32, Carlos Maiolino wrote:
> On Wed, Oct 01, 2025 at 02:09:31PM +0530, Bhanu Seshu Kumar Valluri wrote:
>> Fix typos in doc comments
>>
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> 
> Perhaps would be better to split this into subsystem-specific patches?
> 
> This probably needs to be re-sent anyway as bcachefs was removed from
> mainline.
> 
I just did a google search and understood about frozen state of bcachefs
in linux kernel since 6.17 release onward. It is going to be maintained 
externally. 

Thanks for your comment. I will resend the patch excluding bcachefs.

Thanks.


