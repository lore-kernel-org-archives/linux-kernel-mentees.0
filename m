Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B49261B7F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 05:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759988477; cv=none; b=eCbA9iwHIDmwPLKbz/md169lH/vTAeFr3IdSyu7BUqzhvGqE9uWsTJl8Ta8dgKUZrowYmBMVrEoMj0ngzqfvX30Jzvijftec6ZBP3pth/AMyofXfx3Hp9l4GyK6Y/CYslzDYpY1n0lU2KwgQpvnVsAd38zjOvn7f3UbKdukI8J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759988477; c=relaxed/simple;
	bh=U7g6KkV2IFnVrQikZSPZ1dcFlLVplBkp4l5QFbLACbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JMaG4l9/Y/gY1IL4qI4KEZI4V/6KzHp7AUVrkU6MQPXp8qWUdFFEMTRerEVtFXTgIbBI5hcaKdaH6GokEMNltSqKkg5xgRZB51kqfYONNlQ4WjR5OdaGkQdLEJzk6DzyVIBHomvCs36yR92FPqe1GuUTQz1mktMRQprJjshvHQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuvaxMix; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuvaxMix"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AEAB60FAD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 05:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7pBW1sFhCD8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 05:41:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7121760F3F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7121760F3F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iuvaxMix
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7121760F3F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 05:41:14 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-781206cce18so648398b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Oct 2025 22:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759988474; x=1760593274; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2KNKsCp2Ww11qIKHJ00jyA6DJfSKlBk9NjUhCjdbmcc=;
        b=iuvaxMix9Jkl6aczWCW0GPMVdN1Hmq+OCyTdDqTPpNQN3ETotEKe0/zOYEG15ttu4q
         tDDU2uds851aI9XIOV1hjnrrVtFbG2C7FRfvA2dRQt0Q5xXAIuH6GAPwwkJEx2fJm2/Q
         3fEMHbJnSu4t7FRmOtcFa2bv/oxXDYOHB6QzyTFW/6qfC00eyQMSH4HWctKiSkwOyJdb
         6FnV1H/dsCRC2Wh0aw2nkU7kSgjTVHw5lF6nsQ/XWsJFzcCAWDADpQQeBa75cb1M/3YN
         WB1zS8IBTn8fr3aTm2WNH48LGITmzC8d0SyzVHqMd/NB/UtxTnMMCEy2LFPtDRN49lRC
         7pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759988474; x=1760593274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KNKsCp2Ww11qIKHJ00jyA6DJfSKlBk9NjUhCjdbmcc=;
        b=sqC41dwW61WEh5oe7OhpmoDPA5l64+roz0SDagY8IGRWpo5Ai+MBHOK4JCMLMvWBo5
         znCXE4eSKlM82+UeBZvTUEkiQVJrchE0NuGvlm0h1YN8kSlLNkHUaGxFCc6FjRrUAEoG
         YyeW7onYsSrnU+gmbsAQq8Ohu1IYI2SEX9iubkfAw5QKOHDq5C4F5OCor/+cvqA5O+e7
         5XFBHsSGyStiItBrTwoB0sv5v3lj/v+iTwsLsCHKmv8684tI1WV7gK4RkgYkoEkd0MqO
         UApaUr4Cv0DL/G5ZkWzBqRMR3vxygcrLz0r2PnlH0UdGp0LdSTJ6wOR/oAdOxDOW0tKm
         MnZw==
X-Forwarded-Encrypted: i=1; AJvYcCVOUcKEQkEN3d47SgSxCjHI9NBdciP8MHnU9WXGyoaqtvOdGrK4VnXY1Ug2JzQL/Xd41Il2cLc22VJEcyQm7478Z7yNTw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyil+1KFJZjH7fhRRKuJ15ESa1NzwLp/5pIosFw75oT7ijPMZm2
	agZ9u5b1KehFG9xjNqTPhAtDtbw3gbhgbmO7+hkWGkNuuXxQRJm198gK
X-Gm-Gg: ASbGncviNJzB0ZzXtjENDHD2c6gUiQcdxE2tXpD4g9xtndJcIWf02XFNN2d8Az6zIcH
	Z1v/zQyec3VpfUXjgSfxANceL/eoxdhfOwMCW4/xI2wpqhsDn26aO43gpfJPlp1X0Cf0AHBvnki
	lgTmzLSGyURwdiVuYDuNSmz2LfF40tNb1HDJqNsIpCO1bpa4ppciCGQaSRHWhTgyTinBSpOiN5p
	kG05A/Itxl7NTIufLbblfmyVIOUN1+RrLdwRA8fYXZEtqYjejWdrTR44uDXLf/k8peiB5mugBjY
	2R+WXK9mRTuJN+NHOTLIMuUygXLb0mej5ANZoXfA5ulY7NhP9V3MIPH5znWoSq0VhdO/3TV+xUv
	r1DFlvUCKQlHKHnJHt+5vBMbZ+Ht4jLWT45sm9hwHrDRqBtcqZNYYtRID3WZqjZowkec=
X-Google-Smtp-Source: AGHT+IE9oykuetNbvR+7em1eWM6yMVpGn5cles1cEeIi0mcRnMwvIGU8Ccu1Dh5yRdwJE+IrZiL2mg==
X-Received: by 2002:a05:6300:7110:b0:32d:b924:f90e with SMTP id adf61e73a8af0-32db9251bfdmr3011937637.29.1759988474177;
        Wed, 08 Oct 2025 22:41:14 -0700 (PDT)
Received: from [10.0.2.15] ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f3b041sm19842042a12.24.2025.10.08.22.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 22:41:13 -0700 (PDT)
Message-ID: <b183a040-3d1c-47aa-a41a-9865ba70b94d@gmail.com>
Date: Thu, 9 Oct 2025 11:11:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout
 error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, stable@vger.kernel.org
References: <20251009053009.5427-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <20251009053009.5427-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/10/25 11:00, Bhanu Seshu Kumar Valluri wrote:
> The function lan78xx_write_raw_eeprom failed to properly propagate EEPROM
> write timeout errors (-ETIMEDOUT). In the timeout  fallthrough path, it first
> attempted to restore the pin configuration for LED outputs and then
> returned only the status of that restore operation, discarding the
> original timeout error saved in ret.
> 
> As a result, callers could mistakenly treat EEPROM write operation as
> successful even though the EEPROM write had actually timed out with no
> or partial data write.
> 
> To fix this, handle errors in restoring the LED pin configuration separately.
> If the restore succeeds, return any prior EEPROM write timeout error saved
> in ret to the caller.
> 
> Suggested-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Fixes: 8b1b2ca83b20 ("net: usb: lan78xx: Improve error handling in EEPROM and OTP operations")
> cc: stable@vger.kernel.org
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Note:
>  The patch is compiled and tested using EVB-LAN7800LC.
>  The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
>  found by syzbot earlier.
>  The review mail chain where this fix was suggested is given below.
>  https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/
> 
>  ChangeLog:
>  v1->v2:
>   Added cc:stable tag as asked during v1 review.
>   V1 Link : https://lore.kernel.org/all/20251004040722.82882-1-bhanuseshukumar@gmail.com/
> 
>  drivers/net/usb/lan78xx.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index d75502ebbc0d..5ccbe6ae2ebe 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
> @@ -1174,10 +1174,13 @@ static int lan78xx_write_raw_eeprom(struct lan78xx_net *dev, u32 offset,
>  	}
>  
>  write_raw_eeprom_done:
> -	if (dev->chipid == ID_REV_CHIP_ID_7800_)
> -		return lan78xx_write_reg(dev, HW_CFG, saved);
> -
> -	return 0;
> +	if (dev->chipid == ID_REV_CHIP_ID_7800_) {
> +		int rc = lan78xx_write_reg(dev, HW_CFG, saved);
> +		/* If USB fails, there is nothing to do */
> +		if (rc < 0)
> +			return rc;
> +	}
> +	return ret;
>  }
>  
>  static int lan78xx_read_raw_otp(struct lan78xx_net *dev, u32 offset,

Hi,

The subject prefix must be [PATCH v2] instead. I overlooked it. Should I resend it?

Regards,
Bhanu Seshu Kumar Valluri
