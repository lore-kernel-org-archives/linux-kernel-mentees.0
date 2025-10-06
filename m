Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2505A24CEEA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 19:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759777267; cv=none; b=TKhLkBbzwNED74mko4+FzEuj7QPRx5zA3bKofVUm+4f5f6FqsRHeedOS3FDNm+mCBqZX9pnavGOEdplex/IdO7M+7YqeOVwkrEXyWFvnOtxLqhs7DxrNaNv9rUkMligGiiGKl/4yuEhb/36lcU7GAqSIzGwaOI9zQcjCNUmNKsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759777267; c=relaxed/simple;
	bh=jix1ZaFWcTXD7lm+GUKe4K6AZ4bK5yet5vY9zFRPzwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qf/EWwLju1DVs7ZOANHFL1h1bbai/HN0fsIT7Eh94YDiJuNXOBphtyuPo02EOnv4sUQNhjgWifYO/AenipJIeVdDKu8KQpU28WyHyZGGqvvarlzoq4CAY71aJqPJ1eIg9zUbZvhHbLiU7C1mWzhwE+SWevkORRUZgUTsVA+CNqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUNJjqH4; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUNJjqH4"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5F5D418C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 19:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2IcNFpJlNhf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Oct 2025 19:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=khalid@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EE1C418CB
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE1C418CB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qUNJjqH4
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1EE1C418CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 19:01:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B0B44078A;
	Mon,  6 Oct 2025 19:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54AFC4CEF5;
	Mon,  6 Oct 2025 19:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759777260;
	bh=jix1ZaFWcTXD7lm+GUKe4K6AZ4bK5yet5vY9zFRPzwI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qUNJjqH4G8IxIKW9WBWAojboqWM1VTccYLc8f/s4lRm/Eo6NRSVYrQTrZGggN0RED
	 6BJkSrPU9f0aLZOvP79WdoI3O1d09h4+lB3MlNnhEc59lg1diUudd6sUNI6oc1drYF
	 M6oa7GQDoP7YUmY3RVlTgBZdpQQYqsniOpXMWLFe9oLK1clB10POqgRPugSZ61dJJP
	 kTK7wnoQrfoywTuHaDe+Q8w1/XS7E95DMmeMvdMGizjjam2ApHHc3/9dWKAKR24dRF
	 DeL2fx5kk9cPQ8pK7oRuZU7KaV3VDAZ0HsI9fT7l2Ggk0hGH5KzikL5xcq3RE++v8U
	 ycLiFCTmiJnSg==
Message-ID: <866d28f8-616c-4a79-9030-2ebc971e73fd@kernel.org>
Date: Mon, 6 Oct 2025 13:00:59 -0600
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
 Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251004040722.82882-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Khalid Aziz <khalid@kernel.org>
In-Reply-To: <20251004040722.82882-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/25 10:07 PM, Bhanu Seshu Kumar Valluri wrote:
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
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>   Note:
>   The patch is compiled and tested.
>   The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
>   found by syzbot earlier.
>   The review mail chain where this fix was suggested is given below.
>   https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/
> 
>   drivers/net/usb/lan78xx.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index d75502ebbc0d..5ccbe6ae2ebe 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
> @@ -1174,10 +1174,13 @@ static int lan78xx_write_raw_eeprom(struct lan78xx_net *dev, u32 offset,
>   	}
>   
>   write_raw_eeprom_done:
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
>   }
>   
>   static int lan78xx_read_raw_otp(struct lan78xx_net *dev, u32 offset,

You were able to test the change to read eeprom code by forcing a 
timeout while doing probe on EVB-LAN7800LC. Were you able to test this 
code change the same way just to make sure callers of the write function 
handle the new ETIMEDOUT return value correctly?

Thanks,
Khalid
