Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1224A17BB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Mar 2024 12:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711281973; cv=none; b=VtCrEvgMNIJ6fVXXn7I595OZu9kmydQY/vw3m3QZNWb3ns1nGWcIjRg12QH4PN9MI89ZYVJTas6eWCQHLbzUvczAMfuj+7JGKY1N6qLsTaXPenFBB2kdxNlbGrpnrKmV0akGAGQBN3YJfygvvqnRJeUtGmr3hyS4FmiT/LU/Hec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711281973; c=relaxed/simple;
	bh=mtf1RDgfBz1CQuj0fSdA/b+qA44E+AI5WneOq3D0Xb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCjkspl2P0wO37X9BH8zlZosfByLlqtK0zS1qjPUe42J/veRMMOs0L3COY/MHFrrIf7kr1dyX9nKtcSwZ9GEpYZiiyVfqtbqTcYHn3UrVj6I/8uT2D5WX2JvVa9J3O56cwF5IgKRrFcm1+WbMLz+xU1o+FpIxq2hdsoagYSgPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkjsszDy; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkjsszDy"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B90340339
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Mar 2024 12:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrQqVHtbqMtS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Mar 2024 12:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F36C74032B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F36C74032B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AkjsszDy
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F36C74032B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Mar 2024 12:06:09 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33ecdffd9e7so586791f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Mar 2024 05:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711281968; x=1711886768; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtYyUSACFde+IBYskgVCX0Wr+Na6g8D8ZvFebNcAS00=;
        b=AkjsszDyVhN0xoUibiQmNp6iymSRXnljbtE4OpihyV5bQlVGWf/TMBR2DVndc7rmqj
         lZuVyxgXbAoN02c9d6foFFTkVslqyeaD5S5Df0I1Q54Eb3zYjbRPrMkQYID2GMha97Im
         MoqMgJN/XOzzOFdvT9849NMoMAAkUdpyu9wGg9fQDFAVXDP7LU1XPMK/nLUSJJtGFxz4
         0mKb/O0xfVSQH78c8om4AZg/DJk/q3D/D+4jsmN1/fB+ztefe/QVzSt+yQ+ZQUCL68TC
         pKD85eBSUWtPxzv1FZlrzwqe1zO5w6ChBiMtGT/NYzhlJ6O9jCtvooVXhDRLz6D07f+a
         9bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711281968; x=1711886768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtYyUSACFde+IBYskgVCX0Wr+Na6g8D8ZvFebNcAS00=;
        b=YLdzxAA2QR4l3y6rEUFxLiUISPI45cpN8BkcN50I+6j54mccRRYVXKonxieupcPhGh
         7ldjlhQYz7pQLZh7sidqbdkXuEJ/GRU8IpnE9prngpW0rkqFPYrYcK8i535lkTpP3mVW
         cuVYx8VFwOAqSr/3LJxE4HGHQx6mLNUllWw96O9LAm4zpwD3fPN1+qQxltYji4bAxEVS
         1EHzc+4rHoJTAaKJWPYy8IBaYM5op2iCx5ekcvyZCLHH8KORL1UZ/xhgYIayPf9Is6zg
         eukihouWw1TgfmfkaPA2gG4Ft8se097w/L35NF7CVAGFJBbTFVX4njqsiIOp5PTpWLmu
         ZywQ==
X-Gm-Message-State: AOJu0Yx9jgkmiT5XNxiPS3FU+nQX+jxd6VAxUArjUu4bItyCggejS3mt
	D3xX5s4YCwvfDCnJ0+mUyN7Q/GpokBB8I9wzqaO8VKVSdHFiPfP7
X-Google-Smtp-Source: AGHT+IHlXOirsRDZKiAzC3seE+GNVUGaePkht437g4QV4Vul6/RMlMk9xDwrGSXhYmPu2WGx30Ns+w==
X-Received: by 2002:a5d:6708:0:b0:33b:48ed:be63 with SMTP id o8-20020a5d6708000000b0033b48edbe63mr2536678wru.7.1711281967667;
        Sun, 24 Mar 2024 05:06:07 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id a1-20020a5d5081000000b0033e91509224sm6666868wrt.22.2024.03.24.05.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Mar 2024 05:06:07 -0700 (PDT)
Message-ID: <11e6d108-e5d9-4c50-8404-766403eb5a5a@gmail.com>
Date: Sun, 24 Mar 2024 13:06:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] staging: media: remove duplicates
Content-Language: en-US
To: coolrrsh@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
 mchehab@kernel.org, gregkh@linuxfoundation.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org
References: <20240324092917.19177-1-coolrrsh@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240324092917.19177-1-coolrrsh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/24 10:29, coolrrsh@gmail.com wrote:
Hi Rajeshwar,

Please make your "Subject" line more unique. Consider that we may end up
with having dozen of commits like yours, all of them referring to
different removals and all without the necessary information to tell 
what they differ in (except the driver/subsystem). So it would help if 
you add the changed file to make it more unique.

Typically we omit the v1 on the first patch in the subject

> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
This line does not belong here. Please remove it.

> 
> In Kconfig, the kernel configuration VIDEO_DEV is defined twice.
> To prevent doing repeated checks, the redundant code was replaced.
replaced?

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp

> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> ---
>   drivers/staging/media/imx/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index 21fd79515042..772f49b1fe52 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -4,7 +4,6 @@ config VIDEO_IMX_MEDIA
>   	depends on ARCH_MXC || COMPILE_TEST
>   	depends on HAS_DMA
>   	depends on VIDEO_DEV
> -	depends on VIDEO_DEV
>   	select MEDIA_CONTROLLER
>   	select V4L2_FWNODE
>   	select V4L2_MEM2MEM_DEV

