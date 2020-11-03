Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FCEC388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 00:06:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB77208B6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 00:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfgNDEmf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB77208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 579B7204F4;
	Tue,  3 Nov 2020 00:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijqZ00Dvq-WD; Tue,  3 Nov 2020 00:05:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 77748204E8;
	Tue,  3 Nov 2020 00:05:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A220C0889;
	Tue,  3 Nov 2020 00:05:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C762AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 00:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AD5B5204F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 00:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vSv-8iXqSHrZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 00:05:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by silver.osuosl.org (Postfix) with ESMTPS id C9F2E204E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 00:05:53 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id i7so10285785pgh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 16:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZqsUyULNQ5T8eVJBY1wAcNGYl5gI5fUvIShFJJSQzK0=;
 b=DfgNDEmfriKjtlAucXQj7bqPQtlYfUKZcYqfcCpViKFCMroSdVadUUPCA2eXpNxmeD
 UAmzH52ywXogsmH/VmxvVkoSkJaoiO8cItn1kh04gAx0k29YtdpUSCRMEx+gIGI2wbzQ
 I8DL86A7T7ah5GnGKrAkggTkRLxLjqvwlmJX0KY99DR5g9s3GZHmKQ0Um50ifs94Vh6P
 j76n4hN5x1GymUjXJWtKJwgHNM/OBFKPKDZ6R0n8jAkHyoAPQMWsqp4N919YYhlhy2HV
 3V9pVuTtKvtuxVvM4K8hWJOpLZvc/NaEQxvrISuzexfP32IZ6nw6nfwjBveZAeFAlth+
 LrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZqsUyULNQ5T8eVJBY1wAcNGYl5gI5fUvIShFJJSQzK0=;
 b=YfF97yqCTOm68N1GxaE6msgwSIJX3ZusCpHvoZBLsOipXV3HX5elc9ayGQG6AL8Lb6
 meAYx1/r21AMKtBLS8BcHApRevaZL4sxHpeAlCsKLdaYLIE1BcKHo6XH83vY6axWHoZj
 /98um1MpN65tYr+BHku//R98I2nIJtdxcAZ0YajzZeBhb6cvGQlwmJIfnbx+4dWbsMBw
 A7mZncK/gH4ZhWflky8Jg45cWm6eOI2h5+bgRk67U3nzki14atOWmcncwMnKeMd0rgl2
 xmSxUweglqd+HGCcV9SbNkdlA+04//YWqHjI/s0cGv18DQGMjZQHde79PZ2xp0bLYMtU
 Wang==
X-Gm-Message-State: AOAM530EiFBmMa5QPmD7dL4zrUtQ6XvoEsRtaHLkryCFL3Pk62Xo6LNJ
 Djmkt5oZmWVPXqnR/e+5+aw=
X-Google-Smtp-Source: ABdhPJyGqbbOX2zoz+z1HEzXPjET4+G2CbC1xQbDICwsFOZFmmRGiYBaN2H+fXLPSSOS504un3c2FQ==
X-Received: by 2002:a63:e34a:: with SMTP id o10mr14952419pgj.129.1604361953302; 
 Mon, 02 Nov 2020 16:05:53 -0800 (PST)
Received: from localhost ([160.16.113.140])
 by smtp.gmail.com with ESMTPSA id fy13sm606484pjb.10.2020.11.02.16.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 16:05:52 -0800 (PST)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 3 Nov 2020 08:05:07 +0800
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20201103000507.ufzukd2vkb5h2e3b@Rk>
References: <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, wang jun <availa@outlook.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
Subject: Re: [Linux-kernel-mentees] Any other ways to debug GPIO interrupt
 controller (pinctrl-amd) for broken touchpads of a new laptop model?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Oct 27, 2020 at 11:09:11AM +0100, Hans de Goede wrote:
>Hi,
>
...
>
>So I see 2 ways to move forward with his:
>
>1. Just disable the debounce filter for level type IRQs; or
>2. Add a helper to sanitize the debounce pulse-duration setting and
>   call that when setting the IRQ type.
>   This helper would read the setting check it is not crazy long for
>   an IRQ-line (lets say anything above 1 ms is crazy long) and if it
>   is crazy long then overwrite it with a saner value.
>
>2. is a bit tricky, because if the IRQ line comes from a chip then
>obviously max 1ms debouncing to catch eletrical interference should be
>fine. But sometimes cheap buttons for things like volume up/down on tablets
>are directly connected to GPIOs and then we may want longer debouncing...
>
>So if we do 2. we may want to limit it to only level type IRQs too.
>
>Note I have contacted AMD about this and asked them for some input on this,
>ideally they can tell us how exactly we should program the debounce filter
>and based on which data we should do that.

Is there any update from AMD? Based on the discussion, I'm going to
submit a patch to disable debounce filter for both level and edge
type IRQs, i.e. to remove relevant code in amd_gpio_irq_set_type of
drivers/pinctrl/pinctrl-amd.c since setting debounce filter is
orthogonal to setting irq type and Andy has submitted the patch to
support setting debounce setting supplied by ACPI in gpiolib-acpi.c

Btw, did you contact AMD through a representative? Obviously CC them
didn't get their attention. There is an inconsistency for configuring
debounce timeout in pinctrl-amd as was spotted by Andy [1]. I also need
their feedback for this matter.

[1] https://lore.kernel.org/patchwork/comment/1522675/
>
>Regards,
>
>Hans
>

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
