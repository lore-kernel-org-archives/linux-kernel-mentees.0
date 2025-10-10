Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD81B2222D1
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 10 Oct 2025 17:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760118942; cv=none; b=LdYxMn7N8h4rXLC3vhiTxCcOziMO5kYX/Gmf8cMpSQPANYvrfAeRCJiozFsLXnHaAo6mhj6+7P6Z+dtzLVkln9vMy40P6lfeo56pOt92PAPEZoehxNATGruu50cC/CxBPP+YJtF2j4x0deHWhTOrxpWzXuaDous9kTMwvxatGtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760118942; c=relaxed/simple;
	bh=wNIzmMRkLHrQdGJ9CI3n8s5+na28Lf4RqsVWycxkjMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eW5DlOKML1bAKZnxmnt68H2svM9nyieyAj8tLDX7gRAd6nBFmQzKp7yEEMkaVS67Gq8LBRo6ONyw6gr9yiINL4FklElcvfTbtPRrCw2zOe5fzxFGjDf5FiuXrijxw2pQRF7HSuduy37BbfjctO4WpaGH53sTx9iuK3rSylk14UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eboIDbtw; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eboIDbtw"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7ae21804971so770738a34.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 10 Oct 2025 10:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760118940; x=1760723740; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FaMtprRJaiBLmGg4i/xmoof6gnqLK2TnSEKb/a6bsk4=;
        b=eboIDbtwK/aLQX+KN3N5FTv0Pessqs8odrn0m1jYPQfsw+5H87pgFStQH/dHKqSgQu
         TM4L6I+hch1Xl3cPbzhHCy1Ndfny+Hgxj4SCkJ5Sm+qxgNjR8LjwKEAH+bfqqKPeLxVG
         4Ly1/3gq7FF4YX6OmjvDS0RXhaHFi2RFr2zOImeJyfy3M8MgX1OgH7I29RhG1qOMHmca
         N9fxwGrnFtStp51a5FdjZV+npETWfKDipaXCuXK1QeW8+xbiwfFkJ/bFmmbH4tBWDGoJ
         qpVAwm61bpjX2ymlh6+kpRqYspVHRCzOGGwIumsA3Soajvst2dFj15kvLGLrWADvPQ8I
         GK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760118940; x=1760723740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FaMtprRJaiBLmGg4i/xmoof6gnqLK2TnSEKb/a6bsk4=;
        b=YdEHDXxjHY9Aeoph1kY4/pAxjMGpGpxp0a0X2x0+qjyk7XyrwpQgyusPWJnDBGZOzP
         2cjEmqRNzxdPDNCf53YzbTgRyWwHDXuli9P7P2hXmKJ/xsWIpVvsDqqjGk8yd2Yzdi6M
         OnanQTDlpDZxrRtlebswksLqpNVS1lBzpmIx4SHkRDnY9ljy4TSzYUtbcv4TCiH883PS
         +1Si8sELv2gaGCvTIuok1qSpujZh9Bn7AjK+OpKifiDX6tFA8gu+vZLKCpZKoDQOnG9A
         sC8YHYyzQpleXuZvsCIEb2JxU4VQbtk0OYkIx2sI0oUXWFqDLxSrSKijAH8cG14+LkLv
         tqAg==
X-Forwarded-Encrypted: i=1; AJvYcCX4YKUGrVwnktJz59DzSOusuvfnSKJzJCzAbskLVcFjRnHJWW5SkuoEJ5L3XHxrO5KrDfrL4qDlcU/zFnusbNdb71jzNg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yye7dwVVYZ9zV+5cbuHOwqeqDkiY7oB29yWwzkxOIBnekv4kYaw
	AZYsj4sL26nfx7fGW1/KOj39Yn3ScuWNw4CGegKcR7jCQbs+2UiEklNrElZHx7Rk4pY=
X-Gm-Gg: ASbGncsnfHwKdYToZBTWoFykL767MNLwX/gll/dNJu6//pbF8NXlJ9yMKK7iUzFwhVs
	wz9tRm+VntMAm6+5MsK2RaGnxMDB2DukYmA/52iXVMNNE1iBxhoDz59F9L82iSLreQLntWXsf/0
	/7e9EEeSyswQ7e2Jorhche4npxx88AVBT3V9CgrW5rP/lyBaMf29kDt7zfxVC/5VjyKvsXH6uf/
	6Bik29u0JI8JiF8O/dtRib47uxiJMAWCcA65+vYBJHxisJbxaG8CiZqTlnPxOirI+Fq1MMc2q76
	9yuYCWoaP4MScDtbx1A2xQ3wAJWSLPZk2lBJjYPoa+Lg0t7dsC3uSR2cL4tGPPtQtUSJGZdskA6
	Yndh7ILmSlQ+xKNZf2edK9UOEl8poESxggeQLzRNgDReAxczuhFj8oT7TVi9Yr0sAKOjo8oC3sp
	8L8SiODSzTRNPuuzFYULghnsddpg==
X-Google-Smtp-Source: AGHT+IEK9+fD2C2mpPvsDARXpusuog/ajtfLqTbuc/LGs1+ce/f70c+jW5JTLJ4ttYcpUKSMQljjjg==
X-Received: by 2002:a05:6830:700e:b0:7af:1367:4f85 with SMTP id 46e09a7af769-7c0df82d758mr5830865a34.36.1760118939948;
        Fri, 10 Oct 2025 10:55:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6d3b:e3bd:4210:32e2? ([2600:8803:e7e4:500:6d3b:e3bd:4210:32e2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c0f915eed4sm1027277a34.36.2025.10.10.10.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 10:55:38 -0700 (PDT)
Message-ID: <abc4209b-eebb-40c4-902c-b584028bb611@baylibre.com>
Date: Fri, 10 Oct 2025 12:55:36 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: health: max30100: Add pulse-width
 configuration via DT
To: Shrikant Raskar <raskar.shree97@gmail.com>, jic23@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org, matt@ranostay.sg,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20251008031737.7321-1-raskar.shree97@gmail.com>
 <20251008031737.7321-3-raskar.shree97@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251008031737.7321-3-raskar.shree97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/7/25 10:17 PM, Shrikant Raskar wrote:

...

> --- a/drivers/iio/health/max30100.c
> +++ b/drivers/iio/health/max30100.c
> @@ -5,7 +5,6 @@
>   * Copyright (C) 2015, 2018
>   * Author: Matt Ranostay <matt.ranostay@konsulko.com>
>   *
> - * TODO: enable pulse length controls via device tree properties
>   */
>  
>  #include <linux/module.h>
> @@ -54,6 +53,10 @@
>  #define MAX30100_REG_SPO2_CONFIG		0x07
>  #define MAX30100_REG_SPO2_CONFIG_100HZ		BIT(2)
>  #define MAX30100_REG_SPO2_CONFIG_HI_RES_EN	BIT(6)
> +#define MAX30100_REG_SPO2_CONFIG_PW_MASK	GENMASK(1, 0)> +#define MAX30100_REG_SPO2_CONFIG_200US		0x0
> +#define MAX30100_REG_SPO2_CONFIG_400US		0x1
> +#define MAX30100_REG_SPO2_CONFIG_800US		0x2
>  #define MAX30100_REG_SPO2_CONFIG_1600US		0x3

Would make more sense to put this new code before BIT(2) to preserve the
order of lowest to highest bits.

