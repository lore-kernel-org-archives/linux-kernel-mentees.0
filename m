Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3FB2609EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 05:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759988330; cv=none; b=Jv5gP0P2zxy0zLilWajQJNDpB+hKygyY4bzjcTe8uSNg2uDOo/qI7ng5SGIfWneN0NC+/aA5mFjysSYfuVOcI/ez9c2SLCQKFF6wuhNoVc2CK8FaHf8uWJOEunzV74CaK6l47T412Vc9x8/5V8LaaDtDVwAnsc8OldBoeIO2iWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759988330; c=relaxed/simple;
	bh=npR5+hdrCx438MidrYA4MYFDxbFLQwa9+iFgs/BnSQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UB+CPB7G/ubcnujsbRyXCjl4fn9Lk38a+2nwyMv5DYvlSfvxQy26SRIStpJPhbNmajZYv5Ilo6N5DFnyg/NKVvguCPg3qXW5GkSMZoJYc91XzYyIfM0HXS7BxKvhNh/5H1JL6tzPbaVYl9XMK8OtNm9XNtDHdW4YFzI9M4FXO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAvMRqq8; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAvMRqq8"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B8CE83592
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 05:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnn9SYhv8TKz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 05:38:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9465C834EF
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9465C834EF
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kAvMRqq8
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9465C834EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 05:38:47 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7810289cd4bso550739b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Oct 2025 22:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759988327; x=1760593127; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKbCLdA0D3ZyyrFcf4HmlfoknTM5HGR4JdTF6XUV7wY=;
        b=kAvMRqq84DQNGEZ1lYRCgJcb4NPElv2L2lsJnqUtbxrXOd6pc/4ec9SWixO20k2SE6
         MEc3MbGCd/9zA8vg54/J0QupkLeBT4zD1ZiQWiHz6h8o589nUDwlnIwp7n/tM4MOCXlb
         ucOf+LqAQfJnifR5lxrq/PcmLYPTB3bstM9Tz6TM8EFrmIH0l0ldw8/2XjJTuJ8n636D
         AtFt+w9i/7dFrObJYXX/wFDVApPlEp1v0HbT3bZz9yA7TPbzIANJc8sbrzdRRLO7pFC5
         olCjn/+DkcoF/hl3QZT9/YfnRs+MvACM55BCkLUqlHaSLnMMFk1snUNlJFTQtktlwOnh
         ofAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759988327; x=1760593127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKbCLdA0D3ZyyrFcf4HmlfoknTM5HGR4JdTF6XUV7wY=;
        b=WiPWYjnv0wK1bN+BmrxMTs4K7O3Ke+X6QeanRs+WJRRyil18fDtpfwVpSbXNGdqpfG
         lZbJG8pcNrt7+RmNhyiKNmmiMlly/1d/7rZQ8cG5oAKZkj5RozGpC9kgfS+tWN4ss4Xq
         iToG7P/zUTx/cSre0vhHJzeEKEdYwXljwToz64SusTtyCNUGVidDx4UVW67+ptbNcXG9
         QPHlG4BCc4/rWy6Jg5uAakKHSFZE+Lhq1oeExQ0EuVaodRBZQo7muoaPIIXUSab/3aPV
         2l8DvGN4ANK9x+i3rMbAHxJQeSCklPSAtxVX+2te6r8anTXdUvisuecr10C00MVhQO/7
         0nSg==
X-Forwarded-Encrypted: i=1; AJvYcCXaCzqWx6ObgEcng0f2Ed1bWtt6CBr5gL/6O2+RpbOectw7TcEY033QQjfjvWzMHnTL/6h/8bikWcN5zDP8wgmxnvxf3Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzwHXicjD8yB0j/YgCl7+JDnPcVkglPUqUQ7KogvDtgFQ1yDa+u
	vo52P6eyfKk1K+S9gUvI/akkocWyittsEYqXZlFREmBOW1HOwlBt0yfi
X-Gm-Gg: ASbGnct0ql0Ay2YuZNGjVGGhL72bokTlKK6Kp2tPDjmPTsH36fyx8a+eJxYMSkS4SEb
	aANnzT6ElNZwcw1BK5Kpyf09mYqbE2fCnGqoKnNLzWRP8hbb6kWmy4RfGcXX1DZBRcl3vXdVA9J
	19zS2cuW+8uL75a3617Sln4GKj9IMQWyU6N6A6xoMPNNsplcDApQrTiSduV6EWqb1jIgnsNh7zo
	nChZ3Hr58QVVse8GspqhPJ+yFQqo9gk4WQ2XXWTQrblpvDiTGLMlNuWpgVShFu2YJh2jM5Okx9x
	lqL/IoEGPJRJf93ZDgB+Vx/edZ/481Z5MpOPP8aOt1AkdIwkUJD4WecUkQZshuYtacgZFtzFgQp
	SK/Xnv/rqaBhTEIJNY1fQ1uklScSscX+ZQ2AN8K50JDADkH8rBixHUtMGVGwudnB/q6Y=
X-Google-Smtp-Source: AGHT+IHZ44y6ZFCxVyEDZOYJddPo2NG2UBmtyjURIoIIViVofpipLRjydPLmmlTTcL3OK6IoivH0yg==
X-Received: by 2002:a05:6a21:33a8:b0:32b:70a3:afea with SMTP id adf61e73a8af0-32da80da519mr8783258637.3.1759988326785;
        Wed, 08 Oct 2025 22:38:46 -0700 (PDT)
Received: from [10.0.2.15] ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b51113776sm5508816a91.14.2025.10.08.22.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 22:38:46 -0700 (PDT)
Message-ID: <5fe7d13e-e608-48a7-8205-514c461a145d@gmail.com>
Date: Thu, 9 Oct 2025 11:08:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout
 error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251004040722.82882-1-bhanuseshukumar@gmail.com>
 <2025100407-devalue-overarch-afe0@gregkh>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <2025100407-devalue-overarch-afe0@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/10/25 11:21, Greg KH wrote:
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.
> 

Hi,

Sent a v2 with cc: stable tag.
v2 Link https://lore.kernel.org/all/20251009053009.5427-1-bhanuseshukumar@gmail.com/

Regards,
Bhanu Seshu Kumar Valluri


