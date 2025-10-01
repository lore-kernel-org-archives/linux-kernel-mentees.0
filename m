Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD712C21FA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 11:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759316773; cv=none; b=oJV+O+QLdxPJRG74hye1CDp19DLhwZtsabVNRHwqEX/Y8e7Y12GQpRBtJl8kEo/Rg7OKs1kxqL6vjtWIYAFSocbwdPqyRa+eAG34VsOe/8tampmrhp+NRpWS/1LCBznhpYnJnrXJHkifyxGvlT3diTSag9pxqBZBBph5Ei5i/vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759316773; c=relaxed/simple;
	bh=H2FvDp5EcW5NNwgMTtH+nhDevA4wTd/GB7ppsb/tDGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I38DNh03dTjbvbe1dRGaq5mgZypn1UIxa2/7WmOFksOmms66KWC89BLgqIGbAH/7QKLjLnNWdI6SHD6f6FnChHrARkIEkhVFHrbD3aBK754FaNqbOHm9jzluvPZgsLVjJWx9afHtfUG0I32ZBRmRT1SZwNTkFsDDj53+C8kK94Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeusfYMY; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeusfYMY"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07DDD8379F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 11:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThqNMHwNn_OQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 11:06:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 722F58322E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 722F58322E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WeusfYMY
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 722F58322E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 11:06:11 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-279e2554b5fso7552555ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759316771; x=1759921571; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OUTO1WZObRKjcF69kojRq6rqV5jRn37FuLlY5Jot1Vo=;
        b=WeusfYMYMu3FOh2ba+UH3Jh+oKmwpqUlhLSI3BgYo77bW4LP/RlozhXpbfdZxm+UxA
         UorLKo4r0OfmEDHkflsgJ3vYXhuje6HRL5qN5Yvs3Zf70UIqF8tClPq6W6bRCvZKKNH1
         q+jbuYS+sxAs1vY/iYXojPDUZmd6JFvICgR9DylMFcSMGjB41q31BkOK9n6LBmlozyv6
         +JAdB2zeEaEagnAtxlGAJrM+F/oxxGyl1gdFK4/dd8IehLSjiHR4lZNuCKSiVnUnjAis
         SMy+lrF0k3bsCfQ1on/ZaA3HPfMwxlz7uIPt1p8UlMG0+ziFpuopKG+yk/AMy3kxXTKq
         hcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759316771; x=1759921571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUTO1WZObRKjcF69kojRq6rqV5jRn37FuLlY5Jot1Vo=;
        b=Xpv9/IjDha0LMo3dhEGMe79bD0sCk+qfMs2Ix5N3btyzjb78FAOJN1yy3i2FB2NTx6
         NCaHHzBton0F9/ygXj2Ycmm+U5GX9wWMVY29CD0mVn0InVbbjLioVgsFDedbZH2BI8f0
         UPt2B/KJNwikeqF3J6oDbgZhUCRaxQUulVNFSHru9sK1Uf48+GTJjCfIntxqGBXSkvtz
         7h6Q7JM6nwDHYqDcL9L7Wr++wvN30THmOh+OtcfTWEhCSc2sPr164iK5aqRXA5W/i2IO
         pSQgZHpWIesEH9xJsNEK5xyqH3PmrJYOws800isD1k3MfGaXAJfM47qD92D3K2zpsHDV
         0REw==
X-Forwarded-Encrypted: i=1; AJvYcCWhL1mDaDetu0kHsKSV957+xVM+RWbQBADJp6VB2ziuWiwr5UWI68tyepi7T0ZYE1ll8qohonfGvmLptL4CSWhk0Hwwfw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyPU3Ttl6lpeBej+VJzFpvfFM2ml01l8cX0iWiEt9NZhGd2gWF7
	ImKOoj41neO5ep3mwlUqTXFPFUBzlSYmgyzUy8GtvbVtyPt5zPIcNFly
X-Gm-Gg: ASbGnctDFn+7UFSS1OB3MXEKHKgqbLk0SKL0mewn93a07+tv/uifUOabxMk+iT9BAaV
	6lTVXmflHf9VWhH6cgp2HQapBvOITY+P6DKRfReORIgu8P9tXagAQnSRH692Axe2FxZYhYX7P9y
	0c82U9qTgdmF84INjeaI57Oy7XapfeAYwHllyYSh9di2nvdhoEELpzfaBrsCaPZVVeV35j+2MbJ
	38JRt8xpjqcGYT4Hplaia/H3baIBGJ/64RBWJW9YYt1dbRnGtHR4aD4lzUZJH5VZwZiPX7HNPYd
	lLAsL41rg6SgQ/6jeAYgTJR+P4NDkq/uYFtgc+1LlWYy2PhiWVR+KqKuDFBJlXB7BjI/TlsNlX0
	2YsMEsOgof5bU5tJZVoTuQxW8dA6naTVySO39AwWEeTEuvPpDXqFnXSgnoEmO+uM47cylTw==
X-Google-Smtp-Source: AGHT+IG1IDj8iyRkR3Qp/J2mbmh1w//edaVdXzT4iefYbJRU8w1dPyNhwk4JZHL6+GK7spNE7nI9Yg==
X-Received: by 2002:a17:903:1904:b0:26e:7ac9:9d3 with SMTP id d9443c01a7336-28d170e948amr95641775ad.18.1759316770491;
        Wed, 01 Oct 2025 04:06:10 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm181403015ad.138.2025.10.01.04.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 04:06:10 -0700 (PDT)
Message-ID: <20f92e3d-dd20-4f37-854b-17d96efe92e4@gmail.com>
Date: Wed, 1 Oct 2025 16:35:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: doc: Fix typos in docs
To: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "david.hunter.linux@gmail.com" <david.hunter.linux@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jon Maloy <jmaloy@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
References: <20251001064102.42296-1-bhanuseshukumar@gmail.com>
 <GV1P189MB198840D92F47A423791FF803C6E6A@GV1P189MB1988.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <GV1P189MB198840D92F47A423791FF803C6E6A@GV1P189MB1988.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/25 15:58, Tung Quang Nguyen wrote:
>>  * @server: pointer to connected server
>> - * @sub_list: lsit to all pertaing subscriptions
>> + * @sub_list: list to all pertaing subscriptions
> Replace "pertaing" with "pertaining"
> 
v2 patch is sent fixing the "pertaing" spelling.

Thanks.
>>  * @sub_lock: lock protecting the subscription list
>>  * @rwork: receive work item
>>  * @outqueue: pointer to first outbound message in queue
>> --
>> 2.34.1
>>
> 
