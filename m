Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B3F2D1F6B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 20:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769198762; cv=none; b=BG2ckHXP2dd7EVhuDTcOWR5g6fOF1BLJt35lqI8Ltps+5H5sHxUJ/AqLmowiMxkWCGmkGFMjCTq5ful2XDXbyrm0XqHzwc9pP8zhS4OeUQOrL6WLVpAP8a+j5QbjmeGYziLpT+t96uhDoxRVVj5J//39EU8JvKRo+I4mKShOT4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769198762; c=relaxed/simple;
	bh=JVxxTBA46VGFx+Bk/g/ADIsmn9+VdXQAqq0bhwHyBmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUI9E0xsCGQvKP/I48LjhGzmOxUFPISoiZCIAbwz4Etb99NzwPt/bZcAJBQnqtFK2ZROqPHRpLoHgdZQxgcn2vyExwodGR88k2gcYMjOPacw7dek1eLHdBuZU+LpBIdYA3WokAjxjacduBPL77Rnj8ztFXyBH84u040ApZS6GPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rm4qdzgI; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rm4qdzgI"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C88E4400D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 20:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKTDqBKBVzfs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jan 2026 20:05:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6ECD4000B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6ECD4000B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rm4qdzgI
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C6ECD4000B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 20:05:59 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a7bced39cfso28425135ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Jan 2026 12:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769198759; x=1769803559; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjtGERCHcSBI6vMjqzraBszJfT/kafygoaBLRuXTPLE=;
        b=Rm4qdzgIfdcIzYUY762bOUCRVXfILgHlgOrwAuGyoAEJ6LFC9nGSpMM4Smj/njLPe9
         ix+CsU5JKo5FT/NnC/xyq3r/n4nPLlXGPclR+PUBWhOw15k472+ARwcHXD+Rnxg7htE+
         w/F+5m4uvS0u5uelCi2uWVcrYvh57zXPQEb/+/7GPppXCko0fRM4m/M08jCbXaCMziOO
         mIDDioliIHgrqJfur8HekYRI7GxV6EZXjQMY8nW32bL3cx/sBhJyeSygH/BWHw4InJ2m
         YSipDdtxD7KdwNYIft1sjn0qNYzkwMzajQjKR4rAm3qxrjSXzyFmZSE1Da46fqqDzgu6
         j4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198759; x=1769803559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjtGERCHcSBI6vMjqzraBszJfT/kafygoaBLRuXTPLE=;
        b=iRuxXhze3EXw6flY0vSfDa0RWFEXIKLc0qSgpDW9HvifnqDNfwMa4Dw2H9OSK4cEkG
         xbzIVLoHkCxa390GBygYCsccw5U4dVqwVZFEhLAFCPMsRfONxFRq7RPfBDVgPOTV/WZa
         kmBbrGhQoKcOkuMzRvolagjjy+HVtDIl0Bq62Y8dcZRVmm/MshmYs3/fipRwDaB8V/hN
         n3GwUhRjoCoIlNEP5L6t4c1jTwantNzOdxgTn0FGHB1nvA3cDJJvDzqk0RathpX9mckR
         fiCAp5mD/cY2J9dOYDrvAlurnPTbP3hLFDqyvIznq/diAKOdxdgubh6GpCo+iPiMQBCL
         cx7w==
X-Gm-Message-State: AOJu0Yzx6ZYeEhHnzTY1mxl1PJZDQskzJcY/ndr13snWvZSZLndGhwu6
	ViUKCyMqEdFBmFcPLZndK62KotnuHQpdprr+s3/Hq//6u5Fkw5tJyZX91ILmGAWA
X-Gm-Gg: AZuq6aLckWbpuz/z/TSkk5Oy7lPUMGfUeRA0KzJJpP6SwkAeKq8btXLk8GZ8IN3JTUF
	EUKKjtFlo2kVd1yDwtNtYhek05LT3moApp/VaohK60fQ7vWOPYM2kOK5NW5R/N0v5HfgAX6CWmN
	bAwVstgibPIGbOf+YtjZtEqJhGXWpcpZU6++DeFXRueqNZBR2JaeU42Tat+zuJQntWWr6Oo2krj
	iNDkfGH7e6U7PbxTOtSM5LJdjzyp3XjPbcvKGxwDU1TeDnC87kM66dO3mv2bI5i/WSGDjpT1V4V
	zrCU8EUxMGqnCAiAjtJfjs0rZGLIf4x+QAYhm/HGNIk1JDuq2Aw/cOpHdGTZ/WWJoWPIEnFKzxl
	jwCAZaBQpB3tCBwzgukO09Y1hJLBOBkOqgpVq6llMO27sBmIc7u8WDKcgwfDkCBnIsPFzje2RZb
	4q3/2hGw8QnShYcOOye4g=
X-Received: by 2002:a17:902:f544:b0:2a1:10f7:9718 with SMTP id d9443c01a7336-2a7fe625098mr39710475ad.30.1769198758469;
        Fri, 23 Jan 2026 12:05:58 -0800 (PST)
Received: from [192.168.7.12] ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcfaf7sm27309455ad.34.2026.01.23.12.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 12:05:58 -0800 (PST)
Message-ID: <49b45635-5f17-4cfc-8324-8c6f59fec082@gmail.com>
Date: Sat, 24 Jan 2026 01:35:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/armada-370-xp: Fix dead link to timer
 binding
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20251203195859.65835-1-sohammetha01@gmail.com>
Content-Language: en-US
From: Soham Metha <sohammetha01@gmail.com>
In-Reply-To: <20251203195859.65835-1-sohammetha01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/12/25 01:28, Soham Metha wrote:
> The old text binding 'marvell,armada-370-xp-timer.txt' was replaced by a 
> DT schema in commit '4334d83904fc' 
> ("dt-bindings: timer: Convert marvell,armada-370-timer to DT schema").
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
> No functional changes.
> 
>  drivers/clocksource/timer-armada-370-xp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-armada-370-xp.c b/drivers/clocksource/timer-armada-370-xp.c
> index 54284c1c0651..2221148e2de2 100644
> --- a/drivers/clocksource/timer-armada-370-xp.c
> +++ b/drivers/clocksource/timer-armada-370-xp.c
> @@ -22,7 +22,7 @@
>   *     doing otherwise leads to using a clocksource whose frequency varies
>   *     when doing cpufreq frequency changes.
>   *
> - * See Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
> + * See Documentation/devicetree/bindings/timer/marvell,armada-370-timer.yaml
>   */
>  
>  #include <linux/init.h>

Hi,

Just a gentle ping on this documentation patch in case it was missed.
Please let me know if any changes are needed.

Thanks,
Soham
