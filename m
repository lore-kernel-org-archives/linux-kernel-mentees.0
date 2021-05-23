Return-Path: <SRS0=ZuYk=KS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B67C47082
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 21:32:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C866115C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 21:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C866115C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 938AA4034C;
	Sun, 23 May 2021 21:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGQLFXuidG8l; Sun, 23 May 2021 21:32:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5711C4039B;
	Sun, 23 May 2021 21:32:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33BC3C000D;
	Sun, 23 May 2021 21:32:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F6B6C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 21:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25C8C82F96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 21:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BD6JnOwWZdHo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 21:32:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4506C82F92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 21:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=zwy49mBFt0f/ZPtPHzgSxw7NhGYpoFYgHQDG3NspMlg=; b=cmLB1nQUM7/1eU0JpuzQi9vXzM
 sel/Ty4HL8EDgqm99ja9/jmeSH/K7HsiP0y6DsNVYT++sVwZ74usky+8vumH7lUcZ+pgSw2VZDHeK
 D3qKj5kqM/dNqziVVGVA/VO8NeWroxRvRAlxr2stom2RglffOVz1ciC36MBjvli7d7PMLhULk2u3C
 b1rKbVmeDQ/R68m6eZdeUmOYuULEDaHpI7CCIjHBRGtAp8qPHrqZ4fh7ZRHYFkGlQa0QCWPOktI6X
 K5deAYA8WtTKFD3Hg8ilyGfAhnInh3x3lUx6zkajXl7t1lcaFOQVEtpTkhgXSGDIQW3Grqh9ESR3k
 b+Mr1aZg==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lkvhV-000Zzz-DI; Sun, 23 May 2021 21:31:57 +0000
Subject: Re: [PATCH] NFC: nfcmrvl: fix kernel-doc syntax in file headers
To: Aditya Srivastava <yashsri421@gmail.com>, krzysztof.kozlowski@canonical.com
References: <20210523210909.5359-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f194e3a9-c541-8ee9-3332-22f25d7a7bc5@infradead.org>
Date: Sun, 23 May 2021 14:31:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210523210909.5359-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-nfc@lists.01.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On 5/23/21 2:09 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/nfc/nfcmrvl follows this syntax, but the content
> inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> For e.g., running scripts/kernel-doc -none on drivers/nfc/nfcmrvl/spi.c
> causes warning:
> warning: expecting prototype for Marvell NFC(). Prototype was for SPI_WAIT_HANDSHAKE() instead
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/nfc/nfcmrvl/fw_dnld.h | 2 +-
>  drivers/nfc/nfcmrvl/i2c.c     | 2 +-
>  drivers/nfc/nfcmrvl/nfcmrvl.h | 2 +-
>  drivers/nfc/nfcmrvl/spi.c     | 2 +-
>  drivers/nfc/nfcmrvl/uart.c    | 2 +-
>  drivers/nfc/nfcmrvl/usb.c     | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/nfc/nfcmrvl/fw_dnld.h b/drivers/nfc/nfcmrvl/fw_dnld.h
> index ee4a339c05fd..058ce77b3cbc 100644
> --- a/drivers/nfc/nfcmrvl/fw_dnld.h
> +++ b/drivers/nfc/nfcmrvl/fw_dnld.h
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Marvell NFC driver: Firmware downloader
>   *
>   * Copyright (C) 2015, Marvell International Ltd.
> diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
> index 18cd96284b77..c5420616b7bc 100644
> --- a/drivers/nfc/nfcmrvl/i2c.c
> +++ b/drivers/nfc/nfcmrvl/i2c.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Marvell NFC-over-I2C driver: I2C interface related functions
>   *
>   * Copyright (C) 2015, Marvell International Ltd.
> diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
> index de68ff45e49a..e84ee18c73ae 100644
> --- a/drivers/nfc/nfcmrvl/nfcmrvl.h
> +++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Marvell NFC driver
>   *
>   * Copyright (C) 2014-2015, Marvell International Ltd.
> diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
> index 8e0ddb434770..dec0d3eb3648 100644
> --- a/drivers/nfc/nfcmrvl/spi.c
> +++ b/drivers/nfc/nfcmrvl/spi.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Marvell NFC-over-SPI driver: SPI interface related functions
>   *
>   * Copyright (C) 2015, Marvell International Ltd.
> diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
> index e5a622ce4b95..7194dd7ef0f1 100644
> --- a/drivers/nfc/nfcmrvl/uart.c
> +++ b/drivers/nfc/nfcmrvl/uart.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Marvell NFC-over-UART driver
>   *
>   * Copyright (C) 2015, Marvell International Ltd.
> diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
> index 888e298f610b..bcd563cb556c 100644
> --- a/drivers/nfc/nfcmrvl/usb.c
> +++ b/drivers/nfc/nfcmrvl/usb.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Marvell NFC-over-USB driver: USB interface related functions
>   *
>   * Copyright (C) 2014, Marvell International Ltd.
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
