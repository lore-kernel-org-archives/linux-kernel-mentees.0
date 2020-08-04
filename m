Return-Path: <SRS0=ILBb=BO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7525C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 21:26:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A19722B42
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 21:26:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7fS5brM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A19722B42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C1E4875EE;
	Tue,  4 Aug 2020 21:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83iE8ne6Iujt; Tue,  4 Aug 2020 21:26:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B92208699B;
	Tue,  4 Aug 2020 21:26:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2D56C0050;
	Tue,  4 Aug 2020 21:26:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9130EC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 21:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7FAC886D81
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 21:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufCra9c4S5KW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 21:26:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BFF908699B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 21:26:07 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id o13so23212808pgf.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Aug 2020 14:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H53lbBysrvDenqcyvIC5UIxfvFKGaXbtjEmFJwaxIpE=;
 b=T7fS5brMmb4wsPGHicKEipC/YARUq/fZUJQbVJ+Xk4BTkzZ9GzfejLGEQPEBcZ7tAq
 f4tgYSeSMSqesC9fJTzH37W+mPN5bA15tpvb7fttWSh/rIQXEdSWbSK0ZHQ39DFHtaEO
 IdAvLeQZu3/LLvABjTqO53RvtXGps7eAuOMvzLaA9lEMfUqme0I6MfqEBbDREDWHRcYT
 G5if5wjnu51vBKn+XfiPXaNCo0J6Wx1Kzh63dCvaf6CThNqef/BCWLpH5UTNMPP3d2rY
 nmqofLZ7F4cty7/B8i/xsWuZrAUts3iHqTtgQqwkPM0E3hh0ZbWL+4COSDa6WsibYTmj
 lIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=H53lbBysrvDenqcyvIC5UIxfvFKGaXbtjEmFJwaxIpE=;
 b=j5098sOHIeiOAl0slE0FqzV6E5haMtE5esYo8aoTaPElNV31xBOQd1eFlDD6J9WLLq
 nslKYMVFJZacKhx4VEnCsGdsZCRbiDHO4nILI3pIg9F9GeslgxibpdB2/hGoYDIHVFU3
 Mb1XHetJ5BblVTU8GCljVXslwGlClZ7zrMgYfYnqhm9v+pNL+8r+WYKWuoBYYKuRUM6g
 j8HDWIZJHfjZG3gCJfIsQOgvt33KsnqUStYoHSj/6fRY9g3BD5nGOe024d8wqlp3XqX8
 1S9jv7oZSKjHLfsUxHg+q71yalCiXhsA0VsoEz9Tko1gevtC+r2WyELEsXOJM9LtKkMD
 F1Iw==
X-Gm-Message-State: AOAM533rRxx7a9AaABXB8BC7ezrOOBU1TlRwwuscTCliC7D54gMwtMrO
 FlWl/9U6Kg/H78pbQVNVNNw=
X-Google-Smtp-Source: ABdhPJxillOY5cbn2FINKGZ40mF2Q8aHqizsQ7EqXczJv8PwJnzXaEl1BvDabEeUkMzRY7cIaHCkGA==
X-Received: by 2002:a63:1a04:: with SMTP id a4mr297213pga.95.1596576367419;
 Tue, 04 Aug 2020 14:26:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 63sm8759439pfu.196.2020.08.04.14.26.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 14:26:06 -0700 (PDT)
Date: Tue, 4 Aug 2020 14:26:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Message-ID: <20200804212605.GA218592@roeck-us.net>
References: <20200801112446.149549-1-refactormyself@gmail.com>
 <20200801112446.149549-11-refactormyself@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801112446.149549-11-refactormyself@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, helgaas@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 10/17] hwmon: Drop uses of
 pci_read_config_*() return value
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Aug 01, 2020 at 01:24:39PM +0200, Saheed O. Bolarinwa wrote:
> The return value of pci_read_config_*() may not indicate a device error.
> However, the value read by these functions is more likely to indicate
> this kind of error. This presents two overlapping ways of reporting
> errors and complicates error checking.
> 
> It is possible to move to one single way of checking for error if the
> dependency on the return value of these functions is removed, then it
> can later be made to return void.
> 
> Remove all uses of the return value of pci_read_config_*().
> Check the actual value read for ~0. In this case, ~0 is an invalid
> value thus it indicates some kind of error.
> 
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/i5k_amb.c | 12 ++++++++----
>  drivers/hwmon/vt8231.c  |  8 ++++----
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
> index eeac4b04df27..b7497510323c 100644
> --- a/drivers/hwmon/i5k_amb.c
> +++ b/drivers/hwmon/i5k_amb.c
> @@ -427,11 +427,13 @@ static int i5k_find_amb_registers(struct i5k_amb_data *data,
>  	if (!pcidev)
>  		return -ENODEV;
>  
> -	if (pci_read_config_dword(pcidev, I5K_REG_AMB_BASE_ADDR, &val32))
> +	pci_read_config_dword(pcidev, I5K_REG_AMB_BASE_ADDR, &val32);
> +	if (val32 == (u32)~0)
>  		goto out;
>  	data->amb_base = val32;
>  
> -	if (pci_read_config_dword(pcidev, I5K_REG_AMB_LEN_ADDR, &val32))
> +	pci_read_config_dword(pcidev, I5K_REG_AMB_LEN_ADDR, &val32);
> +	if (val32 == (u32)~0)
>  		goto out;
>  	data->amb_len = val32;
>  
> @@ -458,11 +460,13 @@ static int i5k_channel_probe(u16 *amb_present, unsigned long dev_id)
>  	if (!pcidev)
>  		return -ENODEV;
>  
> -	if (pci_read_config_word(pcidev, I5K_REG_CHAN0_PRESENCE_ADDR, &val16))
> +	pci_read_config_word(pcidev, I5K_REG_CHAN0_PRESENCE_ADDR, &val16);
> +	if (val16 == (u16)~0)
>  		goto out;
>  	amb_present[0] = val16;
>  
> -	if (pci_read_config_word(pcidev, I5K_REG_CHAN1_PRESENCE_ADDR, &val16))
> +	pci_read_config_word(pcidev, I5K_REG_CHAN1_PRESENCE_ADDR, &val16);
> +	if (val16 == (u16)~0)
>  		goto out;
>  	amb_present[1] = val16;
>  
> diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
> index 2335d440f72d..6603727e15a0 100644
> --- a/drivers/hwmon/vt8231.c
> +++ b/drivers/hwmon/vt8231.c
> @@ -992,8 +992,8 @@ static int vt8231_pci_probe(struct pci_dev *dev,
>  			return -ENODEV;
>  	}
>  
> -	if (PCIBIOS_SUCCESSFUL != pci_read_config_word(dev, VT8231_BASE_REG,
> -							&val))
> +	pci_read_config_word(dev, VT8231_BASE_REG, &val);
> +	if (val == (u16)~0)
>  		return -ENODEV;
>  
>  	address = val & ~(VT8231_EXTENT - 1);
> @@ -1002,8 +1002,8 @@ static int vt8231_pci_probe(struct pci_dev *dev,
>  		return -ENODEV;
>  	}
>  
> -	if (PCIBIOS_SUCCESSFUL != pci_read_config_word(dev, VT8231_ENABLE_REG,
> -							&val))
> +	pci_read_config_word(dev, VT8231_ENABLE_REG, &val);
> +	if (val == (u16)~0)
>  		return -ENODEV;
>  
>  	if (!(val & 0x0001)) {
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
