Return-Path: <SRS0=PhKz=FQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46862C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Dec 2020 17:50:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C59392225E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Dec 2020 17:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C59392225E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 830A58672E;
	Sat, 12 Dec 2020 17:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2vjfZ33hHho; Sat, 12 Dec 2020 17:50:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C91785FD7;
	Sat, 12 Dec 2020 17:50:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5412C0FA7;
	Sat, 12 Dec 2020 17:50:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAB30C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 17:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D368F2DAFA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 17:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sDSKMOyrUX8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 17:49:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id E29FF226E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 17:49:58 +0000 (UTC)
Date: Sat, 12 Dec 2020 18:51:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607795398;
 bh=M1xusLri83arQeEVIJkerY3xEWn9pDMA4pngS+wOKeU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=afq4FV/BRJ0EO7gL+ANz8kBmbjkpUC9S44YSIeUD7EGvQLrWaDlbfCOKBCJsI+K8F
 UzF2PwIHiDzFtK0JlwAhYGPcoZqTwx6N8lC6DjDae3TdN5qp4r5SDqiV8M5tmVLPHP
 YrKEyP0+J/Co0ZVhs0Mkqv3mpQf24Xmaa7XkkzNg=
From: Greg KH <gregkh@linuxfoundation.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <X9UDC9YNCnxCf0w/@kroah.com>
References: <20201212153517.155164-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201212153517.155164-1-dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] leds: convert symbolic
 permission bit macros to octal
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

On Sat, Dec 12, 2020 at 09:05:17PM +0530, Dwaipayan Ray wrote:
> Symbolic macro names are hard to understand and should not be
> used for permission bits.
> 
> Convert all bad symbolic permission bit macro uses in led to just use
> the octal numbers.
> 
> Following macros were replaced:
> 
> S_IRUGO => 0444
> S_IWUSR => 0200
> S_IRUGO | S_IWUSR => 0644
> 
> Link: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/
> 
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  drivers/leds/leds-blinkm.c        | 8 ++++----
>  drivers/leds/leds-lm355x.c        | 2 +-
>  drivers/leds/leds-lm3642.c        | 4 ++--
>  drivers/leds/leds-lp55xx-common.h | 6 +++---
>  4 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index e11fe1788242..6b9b13f58d8a 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -209,7 +209,7 @@ static ssize_t store_red(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> -static DEVICE_ATTR(red, S_IRUGO | S_IWUSR, show_red, store_red);
> +static DEVICE_ATTR(red, 0644, show_red, store_red);

Why not use DEVICE_ATTR_RW() instead?  THat would handle all of this
automatically for you, which is why they are recommended to be used
instead.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
