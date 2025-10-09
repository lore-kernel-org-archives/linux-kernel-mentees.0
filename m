Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE154654
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760031264; cv=none; b=II7MUOEnJr5oUKgdaOs0s7o5AtQgHC3BkflLjEYpNNWvzqWYIfKiJ2gVbD4kKePrLIAXO5uT8WA6eZW9lIyIoyEVyp3XG7ZBT+Ym3KuY2B8JeLE/ZzsSGZyr5xOBrZ/rMNiTMetZryu2NILtKx+nwsKe/vxT00Z69jWy2qFbLFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760031264; c=relaxed/simple;
	bh=nhvrtGcS3u1fCmAmUlvHcQ0TLObODLwGAtqos5CLtRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxKciZGcWwtYqjVVBsaqL/ON7iYligt8W3aV4vcPCX6WYBdd0aBWvTX/RSADRffyQxK/TpWvduPk2WvwsopxWyydTQxj/P5qoXvWxnIH2Au//XN7bStgwl7oZO2Zx8tbVtIe10PXkkHxO7wxpa2FMR5lghaOZY9WDEHzq+CCcGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBpmY4Jb; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBpmY4Jb"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 778BD405AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 17:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQFbC9G94fTp for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 17:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0469404DE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0469404DE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dBpmY4Jb
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B0469404DE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 17:34:21 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-27d3540a43fso12297165ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Oct 2025 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760031261; x=1760636061; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZec7guQB1/23fuKfkx/BbJ2ooYxivX+gc56zQve75Y=;
        b=dBpmY4Jbm42J8jXJEDt+Z87z4JAyBo6jbMniozaf28oZIQQr4mLikjUMhAzmk1+/ne
         bjpyr5C+7Ykv/hxmtD75cX/oD00mHvgEJkfORVRxt8/ao2FLXCxAx6bpD/GoMWHfDCPB
         M8k7pSAH+R+cNPbx/a6DCc+YbXXmy/BP0U++Fxp6lthdFUCTHVYU4j3jU7uWBRYbz9hJ
         EVbNVcJyVIzk+WFHYF6LIPMAeIsrhs08XU2L55l8T2nuJpdYlWU94GVhnjOPL34eVOb/
         HaT/erOx7YziW2qYwA8p0ULB31kww5wngDYABIJjRY+qtvuCVfPOFC9qVImDAFANS/n2
         gKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760031261; x=1760636061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZec7guQB1/23fuKfkx/BbJ2ooYxivX+gc56zQve75Y=;
        b=cQH8bK1aSftxu++PcTLVxNhVMsoo7vs8fRytOCTRPqaMR/4ZotlsqdbqS2EOTu8o4L
         6ZbKwIZvRMqt2zP3jF+6LH3MezMidLiYQZvS53LmZKvBo+5GpLz/RpVUBOWGgV4EupDh
         6PGTB/9KFdr0OvKCYv4jsjLnLDU9uCogRo1rFzaFfiFU3UMo6NjNfySQSwF+tWbKyg/V
         E2bUYvkjolbgjBbGYhk9tvGj4NygjkCTOrlsqaab3/kuz5kETEN3UFyh1UMOk9+LLXUN
         /qYuJJMRTG/8DixT5oYfiZw30LggagV5KSNdDteZyImdOGamT7zih2rXA9lDIsRqw7Oc
         oYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMWitmHsDzQAnxJV2C+N72n5wQzx1P4VYekxfphAtD6Z2oLqBu/UA9Hbu9vggQd4zV2yoya7u+orwCB7/Ogydg6vaK/Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw/rcg3dzCcnv5iWc1l08G+8fTIYnOEr9hF9Kg3UM1FDj4NBlus
	l/QhMQz1dUcjZJdEXYx/KyPYRol3SjX0HqCVtElPNIZL85oFTZpf+CUo
X-Gm-Gg: ASbGncsJEm6upV3u9whCmVG1naS8YJdhLDAQyMtA6Yy+iZmsWZS7SmCzxAR7FwvwEi8
	Bm9dbzW98WZb9xrVUGXc3oB5wMtipn4iXc9ks5pKvUep9yN6yn9AyQ9InNiIJ8ljiiFqaHlZaf9
	wMvqTm8mXu8YbM2ApfG6fv+2J51ERU74fN+i1rBGtxFt6UPtaPyhq4efyaEKcNqKxHoG22Jwn/c
	/r+ybuJjlZGXxa3mSC1x7QOBQhxOi3dFLbGGZsdGvUlDn9I9S7K5kNfSiJkwDfhpnw74zO/tC2S
	QKkFifdvtCrKTq3F07cIdfp7J8xwArG8kRmPQ1ck9iwlupvIvW/ZTH7j/zWLavGyLh76eoRY9Xq
	aPC92Mg/NIykpsX9FyCapQomqiV9FGm7mqPIu3jlwIU31YLgLILil+d2QzA3EuHadF01LwurX
X-Google-Smtp-Source: AGHT+IEZkDXyWcjmyEIZEBGDL6gaOvmfLfQvDuTZAyEkYwTd8bSBEAjejEH3nXfsszGdDfHk9p5n+A==
X-Received: by 2002:a17:903:1a03:b0:267:a1f1:9b23 with SMTP id d9443c01a7336-2902723ff44mr103416485ad.18.1760031260759;
        Thu, 09 Oct 2025 10:34:20 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.180.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f4ad6esm34197345ad.109.2025.10.09.10.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 10:34:20 -0700 (PDT)
Message-ID: <25836029-baea-4de1-8d06-6f97c25f31dc@gmail.com>
Date: Thu, 9 Oct 2025 23:04:16 +0530
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
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, bhanuseshukumar@gmail.com
References: <20250903085506.6042-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
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
Hi,

I just wanted to check if you had a chance to review it or if any changes are needed from my side.

Regards,
Bhanu Seshu Kumar Valluri
