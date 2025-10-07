Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB17B21CC4F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 06:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759817542; cv=none; b=u4w3uX+KCSPJbno4rEezfeFrln6R4/0v6oFSUqUS/sGYKwyuxn48wfwewTL6I0rE5z97GZMWQM+kLmbiXbAP/jptLKwHZ/i1fliN1yI9aF9VscK+AiS02IuGQezD+4yIqgRVKEWqcd2lr4VoyPBwcq3+K/hnI6FrHM1wDTqt2LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759817542; c=relaxed/simple;
	bh=f/KtZW3rhkYJ2eiCGDLGTJbkYnmihth0V8SUE4SHB04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=El93k/5hmPcjcRTSvwnXccaQVxONRAXveXKeO1RMbPUl2WotnVVtZ693rj7BHw+c/FtPEWGDZw5S6EI7jiO5+4RQC1kVsLyhjRn8+BOdrl/O2hIA+JMjR1QdbBinqOTHFTKu7GFTmbV3QKAkF1yTQmfSe8XOOSZoNK3HiKt7PuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBV/iPfg; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBV/iPfg"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17D7D41A3C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 06:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-IQMHbR1cGG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 06:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42FA14195F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42FA14195F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QBV/iPfg
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 42FA14195F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 06:12:20 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3305c08d9f6so4211346a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 06 Oct 2025 23:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759817539; x=1760422339; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x039O0NFHGAXzxihdFNNk+CPOWRSSl0ZG6jnY+lkA64=;
        b=QBV/iPfgA+XzaroyGNnMFtU6kaakPsiHO/GaJguRmarS+q/Zqd7DVK21u9iglDnUhq
         rbfmrLVCzRIOUgnNFswdr2TPOR6GfzEDSj5U0xXfwzrGuc/KF8f6ADeHshWxBvgvslvN
         19T3Vz1+zWEPz3wq8rgeEvspR1KAyHdn5wD9xHcdb5xY+PLpQD6tnIlRs8atSbuzihgC
         xVJzUxeJHBxFmfJ517WJJxPkoCrSKGE5qyJHfewoVVT3iMkUbDLFQ/2h+pqQxH+edssB
         TKXs+2xZK425mccDAAYfSIj1BssnjLnKtcgprRgMOrB+OGrJqqIcXBJ4iFuoqCYnioVx
         DkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759817539; x=1760422339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x039O0NFHGAXzxihdFNNk+CPOWRSSl0ZG6jnY+lkA64=;
        b=qir007zcdCJxSda/aShviXYP/Ih2LC6sJfj0vhPGldFsw9kf6FevAEzPOHYYCBw2kU
         7TG7/ffbQ7TMec/fHLObX9sRilNBjbNth5q48wrWNbRh/K/d5xuppEAV6YbjR62IPgJ9
         uMvdfYyrhWgnEsARnhOZmcEKvDv6U8ydcnfd7R2sE3Nd1BwF0iojPWwxZYipNqKwx5Lv
         2BOaLnm+SnkNXmnPrVdABnCqJo/acPVofEFb086SIZaiPpnqQxZWta3xyumaDZCzGEG1
         HOvvkvXebEBVsZa+jxZsmfhXO0urM8zhwDtFRumzdF1/9zTHHeg0cRWk0GxpJLrsLafW
         AQMQ==
X-Gm-Message-State: AOJu0Yxz0zERt/J48TLXEizoK2AdNfAx9CzPW1ceSsg7E7pGDRTw5A5p
	8oHgsIwkYuIAjGByU7g2XEGEnIeaCQ6I7fUXmlUaGWbQqNWppmpsYy1F
X-Gm-Gg: ASbGncudPVxgxSvB8XAef6l7HQ3DqWIZPq+qmwen1WSm/Mc/oGRxhuQmtFbyKzb1nLb
	sBpGi8/1KqKiIeIz9nFQRIp09O2tHEMOcm+1tA660kajfed1PCJYMamFKiBDMNxXEDVOBERzF0n
	pscMuBMOWAAtJWgn/DCEDcIIxDgNTmR62DLHH4iiOwsYAMlk+ICHr+A9ElJrv/gJz7MaJc8z4LJ
	N8XzbKQUEYLqa+0z03xw9GkO/IhJTsQgUhJeCmRcgQSUkD1jm4u3NHaaVD5g2zSC5fs4gefngOW
	8JKTIAUw1mW4hp+m7YfIxOMp4W8RpvZlMBRV5KUzzqcR+XN0qtGkNfdduYB3gnOFUkVZ6o6DQzi
	7Updxg9LP5BV8wNTszljlH3h5zWAY1081SSDX/u1zQ/dGbVqdcZrzkJ7RB8EJNh1P8kHfaF88gZ
	6XZA==
X-Google-Smtp-Source: AGHT+IG2DTQJY2MdHBjlE/ea/em21MmRyqHMhJutkpAPqmAVGyj8WhoqLhe1SRoTVivJMvCIXdKuuw==
X-Received: by 2002:a17:90b:384f:b0:327:53f0:6368 with SMTP id 98e67ed59e1d1-339eda67866mr2533241a91.2.1759817539087;
        Mon, 06 Oct 2025 23:12:19 -0700 (PDT)
Received: from [10.0.2.15] ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339ee9218ffsm739057a91.4.2025.10.06.23.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 23:12:18 -0700 (PDT)
Message-ID: <e8311311-61bd-4be6-8025-841b84ff4422@gmail.com>
Date: Tue, 7 Oct 2025 11:42:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout
 error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
To: Khalid Aziz <khalid@kernel.org>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251004040722.82882-1-bhanuseshukumar@gmail.com>
 <866d28f8-616c-4a79-9030-2ebc971e73fd@kernel.org>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <866d28f8-616c-4a79-9030-2ebc971e73fd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/10/25 00:30, Khalid Aziz wrote:
> On 10/3/25 10:07 PM, Bhanu Seshu Kumar Valluri wrote:
>> The function lan78xx_write_raw_eeprom failed to properly propagate EEPROM
>> write timeout errors (-ETIMEDOUT). In the timeout  fallthrough path, it first
>> attempted to restore the pin configuration for LED outputs and then
>> returned only the status of that restore operation, discarding the
>> original timeout error saved in ret.
>>
>> As a result, callers could mistakenly treat EEPROM write operation as
>> successful even though the EEPROM write had actually timed out with no
>> or partial data write.
>>
>> To fix this, handle errors in restoring the LED pin configuration separately.
>> If the restore succeeds, return any prior EEPROM write timeout error saved
>> in ret to the caller.
>>
>> Suggested-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Fixes: 8b1b2ca83b20 ("net: usb: lan78xx: Improve error handling in EEPROM and OTP operations")
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>> ---
>>   Note:
>>   The patch is compiled and tested.
>>   The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
>>   found by syzbot earlier.
>>   The review mail chain where this fix was suggested is given below.
>>   https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/
>>
>>   drivers/net/usb/lan78xx.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
>> index d75502ebbc0d..5ccbe6ae2ebe 100644
>> --- a/drivers/net/usb/lan78xx.c
>> +++ b/drivers/net/usb/lan78xx.c
>> @@ -1174,10 +1174,13 @@ static int lan78xx_write_raw_eeprom(struct lan78xx_net *dev, u32 offset,
>>       }
>>     write_raw_eeprom_done:
>> -    if (dev->chipid == ID_REV_CHIP_ID_7800_)
>> -        return lan78xx_write_reg(dev, HW_CFG, saved);
>> -
>> -    return 0;
>> +    if (dev->chipid == ID_REV_CHIP_ID_7800_) {
>> +        int rc = lan78xx_write_reg(dev, HW_CFG, saved);
>> +        /* If USB fails, there is nothing to do */
>> +        if (rc < 0)
>> +            return rc;
>> +    }
>> +    return ret;
>>   }
>>     static int lan78xx_read_raw_otp(struct lan78xx_net *dev, u32 offset,
> 
> You were able to test the change to read eeprom code by forcing a timeout while doing probe on EVB-LAN7800LC. Were you able to test this code change the same way just to make sure callers of the write function handle the new ETIMEDOUT return value correctly?
> 
> Thanks,

Hi Khalid,

This function is only invoked from user's ethtool operations.  The ethtool handles errors returned from the driver callback functions. 
I tested it with ethtool -E option by forcing a ETIMEDOUT error early in the lan78xx_write_raw_eeprom temporarily. The ethtool 
reported error with "Cannot set EEPROM data" message. The ethtool version used is 5.16.

Regards,
Bhanu Seshu Kumar Valluri
