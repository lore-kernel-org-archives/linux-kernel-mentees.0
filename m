Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC82D7817
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759996972; cv=none; b=TnnEVNRlNhB8tr8nmx+uXLaz6lWGGXJgzkfmw2KyY/KoHTQNFyEiRxT1qMY/U5xC7cI9WjP1KyCcnBcyNhrWlQWBbTLrFSwNYEPY6+b7PBFiNfFXJGLeoXjdXhjKTsTlzbq3MXrrOezB8+Z4BS+nhcJaMmPqk9zzbS5xP9ZRWEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759996972; c=relaxed/simple;
	bh=KfgP8PKHQkhMPJ6eadK+yTkypPjqTwhIA8NepWDeE9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbUtxL4+UHOCFAweSy17mmGulXPQ6RE+hkN+GKmMnKRRrLvYMgilNzG1cjBrrdylz9NF2RAT3aI+JBf47ijK+3DCccRka6QKB/tIkFbxOn+77bXknGLNKchr9gFxm8dDvoY+XEXqYZj4jm80LnLKAZwUtLl9L2MjP0wQ6glKHXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AKw/JXTV; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AKw/JXTV"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CAEE40F6A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 08:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FL-8ESUhDNVF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 08:02:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E90FB40E83
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E90FB40E83
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AKw/JXTV
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E90FB40E83
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 08:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759996968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V6zsf8fjJWbuUz6EJwoT59Z49B5oYOEITBMV+N/RaV8=;
	b=AKw/JXTVyvDw4cD5PZBbcwJWzSxkLXr64lpoIyOfgUenGbtYo80Qjoh8PQrV6HvEjIg/Ca
	7gEBHPTqaJ2NDyJ2040eioPFF2feErLrjoYUoxzIRrC7A427HcuYt71/bT6/Vk36zfRnCW
	05u5OeleOkHAROlnxYNkCE5bbC2+NRQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-45x1-NFTPZqLzkCYyRYIdw-1; Thu, 09 Oct 2025 04:02:47 -0400
X-MC-Unique: 45x1-NFTPZqLzkCYyRYIdw-1
X-Mimecast-MFC-AGG-ID: 45x1-NFTPZqLzkCYyRYIdw_1759996966
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-426c4d733c4so420783f8f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Oct 2025 01:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996966; x=1760601766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6zsf8fjJWbuUz6EJwoT59Z49B5oYOEITBMV+N/RaV8=;
        b=HniOi4dVNow7amJ1zH6yywnIfl3ENh24cEb87zilqhgjS8Lt1dRmWzTBsPCvUkgMqp
         iwklW0Ql/Pn+sLXUO6BapSw1vh07ZE/RC0r4tx2PoFmtuyWEQvW13Seg/ugXqsUB1S3e
         JlNBY4HkAgo19pq/2+K5Q5wcSTv3igb3OmDawLa2YiXCAZCAt37P7KaL/MKvXOY1luGu
         mvr5JyhAy/jAzlpJjV9Wm/fTvS2IB55RbrZZ1Sgv0c2Y5VCyrpS1cqTXxjeCrqL76g7R
         R3E8fP3jMvKCFmL/PjbdFUaQFiI0yl82CWY5EOZTToaUIuVtHlzeFOxb0hykxsqJunzS
         f7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV3nJd/6q2bG/8QonsBuMyGlJ5djHhzcIVUbVznTMVzDpfJtUV9uAGU6mshlaDQawoqZ0a31cy2yBw1YbmzVG9e+y5oqg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxsp46IWI818dM/IlaIpyuHMFurezBP2jVJDUJEbwXNpcvJa7Qa
	wWfFQnJB4Q3NZy5xlgfs66TbWEOB8hXVNDLgCfb00wcvBm4DBcuSLVK+tnwPFUIATSibRbRwllB
	ULsjptPJ0xORXFfgpwytJwNIEHy2Rdu90xjzcYnb3gs35eicukn6zHP0OS3p7g4P6ftKbEAWWWz
	+9XXuK/CIaesd86Q==
X-Gm-Gg: ASbGnctI0tTGo88V1KAZJ80ZB9NiDTZxzSuMaJQDYVEiTBSMMBJjsbylR2rJR8SPdnC
	Vy2EokWA1RW6HDieHpSTybydoIEaQ09Q7eihWp7sFafm/Ln2DGOL/qpxS3gdsPXBmIaglb/nMCU
	odNS6VOWQ3q+GD08TBLKKGcEGIdSK0j/OUFw6/OeC6XQFuz+YTDhV5NmVADbOckO2eZxR7K4hcY
	3uKkXuPhYL0awNXCQqYW2z6KDQ8bZnOaVVzZdzr9PKv7LVsC2ySB6Ehfshdjo0BmbirREejeO97
	zoiqpeX0AihvZ9yMgoFuxVi+ud36k/lr6ovuvr4rr8gS/qHVyMdNBdFu1T+Kx68PmUv8roC7OSz
	2gjO9NC2BMJk5Fkpxlg==
X-Received: by 2002:a05:6000:26d0:b0:425:8bf9:557d with SMTP id ffacd0b85a97d-4266e8dd3c2mr4394915f8f.44.1759996965726;
        Thu, 09 Oct 2025 01:02:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErg2jmKIzfr0le15oKD1DjKM11Y25v2S6Dk1KGneA1BBfPBadVcx+OCodmaVYpJSX8X4ibLA==
X-Received: by 2002:a05:6000:26d0:b0:425:8bf9:557d with SMTP id ffacd0b85a97d-4266e8dd3c2mr4394872f8f.44.1759996965224;
        Thu, 09 Oct 2025 01:02:45 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f45e9sm33944702f8f.51.2025.10.09.01.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:02:44 -0700 (PDT)
Message-ID: <ef6fd852-0e9a-41fb-a4f9-8cc95c78f9bd@redhat.com>
Date: Thu, 9 Oct 2025 10:02:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout
 error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, stable@vger.kernel.org
References: <20251009053009.5427-1-bhanuseshukumar@gmail.com>
 <b183a040-3d1c-47aa-a41a-9865ba70b94d@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <b183a040-3d1c-47aa-a41a-9865ba70b94d@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RXowAOksUSc3GCXaGtKU2qlhU4lOOj9B-UmMHSU446Q_1759996966
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 10/9/25 7:41 AM, Bhanu Seshu Kumar Valluri wrote:
> On 09/10/25 11:00, Bhanu Seshu Kumar Valluri wrote:
>> The function lan78xx_write_raw_eeprom failed to properly propagate EEPROM
>> write timeout errors (-ETIMEDOUT). In the timeout  fallthrough path, it first
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
>> cc: stable@vger.kernel.org
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>> ---
>>  Note:
>>  The patch is compiled and tested using EVB-LAN7800LC.
>>  The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
>>  found by syzbot earlier.
>>  The review mail chain where this fix was suggested is given below.
>>  https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/
>>
>>  ChangeLog:
>>  v1->v2:
>>   Added cc:stable tag as asked during v1 review.
>>   V1 Link : https://lore.kernel.org/all/20251004040722.82882-1-bhanuseshukumar@gmail.com/
>>
>>  drivers/net/usb/lan78xx.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
>> index d75502ebbc0d..5ccbe6ae2ebe 100644
>> --- a/drivers/net/usb/lan78xx.c
>> +++ b/drivers/net/usb/lan78xx.c
>> @@ -1174,10 +1174,13 @@ static int lan78xx_write_raw_eeprom(struct lan78xx_net *dev, u32 offset,
>>  	}
>>  
>>  write_raw_eeprom_done:
>> -	if (dev->chipid == ID_REV_CHIP_ID_7800_)
>> -		return lan78xx_write_reg(dev, HW_CFG, saved);
>> -
>> -	return 0;
>> +	if (dev->chipid == ID_REV_CHIP_ID_7800_) {
>> +		int rc = lan78xx_write_reg(dev, HW_CFG, saved);
>> +		/* If USB fails, there is nothing to do */
>> +		if (rc < 0)
>> +			return rc;
>> +	}
>> +	return ret;
>>  }
>>  
>>  static int lan78xx_read_raw_otp(struct lan78xx_net *dev, u32 offset,
> 
> Hi,
> 
> The subject prefix must be [PATCH v2] instead. I overlooked it. Should I resend it?

This is not a review, and given the current amount of queued patches a
real one will not follow soon, but please do not send a new version just
for this.

Thanks,

Paolo

