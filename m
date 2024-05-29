Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9579911CAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989331; cv=none; b=NH0SliNS9Sw4rBmRjW9I18sXUEji3n+QZgSDNiSsvmiV3x3uwGtP5mybKOw0EnIpCiCDdpQPp8SlR5b+NTuBMyZLobWAqWzqcb+BTrtY9HzUswISbKkjtl1/3rMFSM8G0G1MCWgQDsy304W72JQ/fSRzRG5tuWjwIvt3L5Yk/VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989331; c=relaxed/simple;
	bh=p/oqckoilHDd3nwrPNG90Eb/yDiE/NNkxmvgpHkUi5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t6zpm5R1pNdtHvc14fE1LhxEmmwiCVYo2UxqRYvfTV+PavErp2E8qUgJK/DTi3bUh/QKvxHq4Vg0JJSNZjXQJeHpK2kPu29zm3HB8KD/JuOzkeaC4jCliUjsknKMPubCWMn7Z+mY/9Nit94trKw26act2HahViIjrGwfURZYgso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W5G1dndw; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W5G1dndw"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D729408E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 13:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.089
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYs7gIgLqKGz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 May 2024 13:28:48 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=jgross@suse.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41C0240564
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41C0240564
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=W5G1dndw
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 41C0240564
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 13:28:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52b03d66861so719961e87.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 May 2024 06:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716989325; x=1717594125; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXmr6j/tvonQwkWDxBgodd8VSD2h8lNR4zZeNwuG1Go=;
        b=W5G1dndww0aPhEnHqvK1qB2InRMQpxaENB4udZsNRmFUj9Bm2OM+iAaIL1oX/GRDEs
         yWXT+vqiLIOQXXfqgYgkTINalzjuaDUN60YCmgeqa7ifn4hM3KASsnbfOe3VldcbO61m
         XTRJo+sUvNsiD5QBJw6v7NIS5BbcOEavMdc39g7/82boMyU0kKDuAzEZf4XoqLx9a06j
         nQw0zZCFMAaNwVBtacjW16zeMBFjGe8FBTk/XuNCJijBq+zq0Wz3BMmru16ZgiXW73OR
         aHldItUvRzmj/6PDAjzDN6naVvQf/bjA2qVUbYtKwOjm+NIuaLiXLbHDlhRURlOffZoK
         PBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716989325; x=1717594125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXmr6j/tvonQwkWDxBgodd8VSD2h8lNR4zZeNwuG1Go=;
        b=O59gr2uS+6VTWhs9NaeSZSp6hy8o5dA6C1Nqp/beshx54nhwZ6SOMS77hq0Y08nOzY
         bBbVIRW2/MJAbr0m4oc2ozNCamws6l2UgDLub1F+YPECLImAkOJ5olnUprL9TbFT/pPJ
         X0Dhufsp24BTXeJL74muWxp4IywQ1hkVdR4UkCO28Wa1OHrt5cJ7qGiiM1ZTdgLgWMK/
         Hgc9qLdiU+QUN2vdX5ImC5DoIWCKmaDNKTB3HGyt3SeSeWE1O13FyjAZzfssHoWJkVMz
         gef76bMZWTO0tbRH2rXjr7vrxlwUBgy7XxhbO9VLgxyVG0wo8SzWiroY7rNSaiAy2+wA
         p4uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHdJvIRmtq9vJO4reTmdZzmmNT6UJObAnJdzdWzXFvZARwwf+yePIm86jVF4b+f4fOIb8k4rbsJpNcF0kFA91wxZqcuEwIwKFRL+I99kgJ6z38p3lXyG9teZUKtgIH
X-Gm-Message-State: AOJu0YzDPm5s2xpoVbAEOkE8tvIGoMXThhUTNTuKK8g4ZOeFsCZOadJP
	RCu+dgPTfWZxkTqXb7GEOkzkccNxa9IPh4ZvCQBT4rgU3i3OcRIIJhzKSds3WxU=
X-Google-Smtp-Source: AGHT+IEq5J35jp5oyjSaT4U2EpNtDbrlLRiwcYvKIzo9K+RuuN07fUdxYFnLzwmPTjwExZKBrEuQig==
X-Received: by 2002:a05:6512:1042:b0:529:a389:f6a6 with SMTP id 2adb3069b0e04-529a389f747mr9715451e87.67.1716989325376;
        Wed, 29 May 2024 06:28:45 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2? (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de. [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d7276d95sm3726512a12.78.2024.05.29.06.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 06:28:45 -0700 (PDT)
Message-ID: <2095a4a2-7db5-4de6-9609-d8e6a5adf27f@suse.com>
Date: Wed, 29 May 2024 15:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: handle pointer to NULL in alloc/free_pdev
To: yskelg@gmail.com, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: skhan@linuxfoundation.org, sj@kernel.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20240529131926.29590-1-yskelg@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240529131926.29590-1-yskelg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.05.24 15:19, yskelg@gmail.com wrote:
> From: Yunseong Kim <yskelg@gmail.com>
> 
> Modify 'alloc_pdev()' to set 'pdev->xdev' to NULL
> if 'xen_pcibk_init_devices()' fails. This ensures that 'pdev->xdev' does
> not point to 'xdev' when 'pdev' is freed.
> And modify 'free_pdev()' to set 'pdev' to NULL.
> 
> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
> ---
>   drivers/xen/xen-pciback/xenbus.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
> index b11e401f1b1e..f1709b8e284a 100644
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -54,6 +54,7 @@ static struct xen_pcibk_device *alloc_pdev(struct xenbus_device *xdev)
>   	INIT_WORK(&pdev->op_work, xen_pcibk_do_op);
>   
>   	if (xen_pcibk_init_devices(pdev)) {
> +		pdev->xdev = NULL;
>   		kfree(pdev);
>   		pdev = NULL;
>   	}
> @@ -102,6 +103,7 @@ static void free_pdev(struct xen_pcibk_device *pdev)
>   	pdev->xdev = NULL;
>   
>   	kfree(pdev);
> +	pdev = NULL;
>   }
>   
>   static int xen_pcibk_do_attach(struct xen_pcibk_device *pdev, int gnt_ref,

NAK!

Please stop that nonsense. NULL-ing pointers which have no chance to be used any
more is just adding code for no purpose at all.

Please don't send other iterations of this patch. You are wasting review
bandwidth.


Juergen
