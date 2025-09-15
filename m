Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F0031B82B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757945674; cv=none; b=GEYmYgmMDqyJuhTdStzGN55jflK058GPfwLBTpn3n1HG7hhxIvMKZ1KjufWBh9Foqi2kfSyiiPOdGaTwM2BHelw3EIWQ2h/6gnjPfwvjYLJ5eroZrVX73+03RM6ysHjPfrFTzja8+XM8rLb1gMYSlqqIzu+6DRCSzvQeRt4a1HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757945674; c=relaxed/simple;
	bh=12Emjj+7/Y21r7ax12Etcbi4CasxbBKPE6TE0rhUvbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRDUQjmhejJDdqSe0wRGJ1zWGj/pSazRpQxaII7u7ZRCLk40rh93NLDbaEuE3GIY1T7q8VEeSJNg1EFuiHAWwrxBJzAjMZG4kA2+Xu35agbMkaq/c4+VCOICIKgSctQ5Tuxczg3FsjorMqoTpnxr3kNZfhylAlh/ovf3SA6hjRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0s3x2z2; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0s3x2z2"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69EA140263
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 14:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MS-nOkOYmc4w for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Sep 2025 14:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2023D41054
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2023D41054
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B0s3x2z2
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2023D41054
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 14:14:30 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2445826fd9dso50287575ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757945670; x=1758550470; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/TbOYmHOQBrAm+qdpMKoJI4NJtD8Trd/XZ08rPp4G8=;
        b=B0s3x2z2FOdYupKDQVZevlO1z0jxXmuSglvJ4PLgRh9HCfgdkABdA2nEKB/C7dYTAX
         YeBKt1wJcZ25IMrizX5O5HqWeg2pol4Yfck2G04+8RRoRRYb1yDQorbOoP/QWM1MnF55
         5aM6lwMjh7+8Nhby6P25O7ROLo+vDCU3hWFJxIfO6/Z+Kghp/phR7FBtGGc1QJ9aib5T
         9GlnGEj5ttojZ4Y2mgR+gnMvm3NABf8XXFDeuS/3UTK306TOsihXHEcgt//cSlMdIDn+
         n5zSXZFfO+1KPQ6QXzPyMq1xYoiwJ/aR3rV2BXPvz/wVdLlXnC7Uqvmgkj2E+RzSb5ZS
         sRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757945670; x=1758550470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/TbOYmHOQBrAm+qdpMKoJI4NJtD8Trd/XZ08rPp4G8=;
        b=gzHogtFKHrCUaEsVTobQnLotncp7E4FYhz0vhxFbOJM8+MdZx+KvzTCdm+tCb9DLIN
         mZoGNgJwlGcBAX6ttl2jWKFx1HnvbNG8UyNkG2IgLKdUve2O0r8dk0w45HbbjY9BFEtP
         wdN8nJWJ6NqQcOTJPdn6mz11SbJGOpjh7sQIZqM7FGzNBwSzqJihemUIJXea7SZ/CGMD
         ZeU0SZXGXpHf2Bhk2nWhOGdcyNbihiTpdvtwtFBTepD2xzawADGEf4FtnFqbKCn9GAU8
         omYfa1fBSPB+h7wDjW5iFP7JWBqynKriO5GbOqGMIMk+gm3gxYQx3rnz/kYICIqHH9RW
         NoFg==
X-Forwarded-Encrypted: i=1; AJvYcCVrJ2kALfG1DCOc63OwmRwHL5iyE8LTe81lUWfr+3B48wvup7BvGpaiYrEZF5zsjHktWqxtufVPTcyCi6MIpjgpocDjNA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzZU96ix3DoLmCNKBly/U4kzmjLRdb41sAkSMEankkB3AS0XXs0
	NWmhRkwRd8/iTtHb3hCSB9/l0EQLyQwm+XU0aMbjz3scZevsVrDXDv8S
X-Gm-Gg: ASbGncsgQVGOQ4FfOlm61PT78UNPma9H7fVmIQR1bjbbtlVsq1d9Qt1ubXg7SG7KDgO
	/o7xreGwELxPSEHknngt5T4LI2d6cSX26KpOBkMfuPTgLMl38DnDewTIJexQn9OOFPHXeMI7kLj
	iTuVY1zHUOnfJCEaTkhtzBkmn4GN5CbZtCdPnrufBvNxZbPnpU2T42BrfpveyVBrfeL4FcjdMc4
	vJY1FH+ouIV+LDRBFzcuKG0iQ/YN5UPTVqnFlyogckJq5YMnhnGJKnB80fgrXUbOAIoXsIMDg4c
	yqxB2D4HrWKLs/NZLcQGAVkJ8Wf8qIotScvAZiTuFXEpal3+cUSI3yHXIN84ofpKOGXt/Gtqzw5
	eYdzYQkZZ16Exw6B3DNLUSv9FiU5leS6dTT4ByDAK8arwIWhsI9jSo74ha4w=
X-Google-Smtp-Source: AGHT+IFoAiO4nMA477oqCu8LJLJfHZM9TOyXyx33nI3ilJAse1dz47T2WKEsQopizBPSqSaJhxuBDA==
X-Received: by 2002:a17:902:f792:b0:24c:cae9:77bd with SMTP id d9443c01a7336-25d283184bemr187323915ad.54.1757945670053;
        Mon, 15 Sep 2025 07:14:30 -0700 (PDT)
Received: from [10.0.2.15] ([152.57.104.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3ad2fa37sm125830025ad.111.2025.09.15.07.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 07:14:29 -0700 (PDT)
Message-ID: <ecba3708-e233-470e-b3ff-d5212286d437@gmail.com>
Date: Mon, 15 Sep 2025 19:44:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Input: bcm5974 - Driver cleanup by replacing dprintk
 with dev_dbg
To: rydberg@bitmath.org, dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250903085506.6042-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
In-Reply-To: <20250903085506.6042-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/25 14:25, Bhanu Seshu Kumar Valluri wrote:
> Debug printk messages are converted to dev_dbg based logs
> for better control over debug messages using dynamic logging.
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Changes in V3
>  1. Name in the from tag & signed-off tag are matched.
>  
>  Note: This patch is tested for compilation.
>  v1 patch : https://lore.kernel.org/all/20250902164351.36828-1-bhanuseshukumar@gmail.com/
>  v2 patch : https://lore.kernel.org/all/20250903061908.41910-1-bhanuseshukumar@gmail.com/ 
> 
>  drivers/input/mouse/bcm5974.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
> index dfdfb59cc8b5..03e112666c2e 100644
> --- a/drivers/input/mouse/bcm5974.c
> +++ b/drivers/input/mouse/bcm5974.c
> @@ -156,13 +156,6 @@ MODULE_AUTHOR("Henrik Rydberg");
>  MODULE_DESCRIPTION("Apple USB BCM5974 multitouch driver");
>  MODULE_LICENSE("GPL");
>  
> -#define dprintk(level, format, a...)\
> -	{ if (debug >= level) printk(KERN_DEBUG format, ##a); }
> -
> -static int debug = 1;
> -module_param(debug, int, 0644);
> -MODULE_PARM_DESC(debug, "Activate debugging output");
> -
>  /* button data structure */
>  struct bt_data {
>  	u8 unknown1;		/* constant */
> @@ -550,8 +543,7 @@ static int report_bt_state(struct bcm5974 *dev, int size)
>  	if (size != sizeof(struct bt_data))
>  		return -EIO;
>  
> -	dprintk(7,
> -		"bcm5974: button data: %x %x %x %x\n",
> +	dev_dbg(&dev->intf->dev, "button data: %x %x %x %x\n",
>  		dev->bt_data->unknown1, dev->bt_data->button,
>  		dev->bt_data->rel_x, dev->bt_data->rel_y);
>  
> @@ -688,7 +680,7 @@ static int bcm5974_wellspring_mode(struct bcm5974 *dev, bool on)
>  		goto out;
>  	}
>  
> -	dprintk(2, "bcm5974: switched to %s mode.\n",
> +	dev_dbg(&dev->intf->dev, "switched to %s mode.\n",
>  		on ? "wellspring" : "normal");
>  
>   out:
> @@ -718,7 +710,7 @@ static void bcm5974_irq_button(struct urb *urb)
>  	}
>  
>  	if (report_bt_state(dev, dev->bt_urb->actual_length))
> -		dprintk(1, "bcm5974: bad button package, length: %d\n",
> +		dev_dbg(&intf->dev, "bad button package, length: %d\n",
>  			dev->bt_urb->actual_length);
>  
>  exit:
> @@ -753,7 +745,7 @@ static void bcm5974_irq_trackpad(struct urb *urb)
>  		goto exit;
>  
>  	if (report_tp_state(dev, dev->tp_urb->actual_length))
> -		dprintk(1, "bcm5974: bad trackpad package, length: %d\n",
> +		dev_dbg(&intf->dev, "bad trackpad package, length: %d\n",
>  			dev->tp_urb->actual_length);
>  
>  exit:
> @@ -786,7 +778,7 @@ static int bcm5974_start_traffic(struct bcm5974 *dev)
>  
>  	error = bcm5974_wellspring_mode(dev, true);
>  	if (error) {
> -		dprintk(1, "bcm5974: mode switch failed\n");
> +		dev_dbg(&dev->intf->dev, "mode switch failed\n");
>  		goto err_out;
>  	}
>  
Just want to know the status of this patch. Let me know if any further modifications needed.

