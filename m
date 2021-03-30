Return-Path: <SRS0=Bfkk=I4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87910C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:58:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AB5F61990
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AB5F61990
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E69E783FDD;
	Tue, 30 Mar 2021 21:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQCh6gp6bVXC; Tue, 30 Mar 2021 21:58:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14A4383FB0;
	Tue, 30 Mar 2021 21:58:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E437BC000C;
	Tue, 30 Mar 2021 21:58:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89F54C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B20260883
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ug9XxXF96Alp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:58:10 +0000 (UTC)
X-Greylist: delayed 00:16:10 by SQLgrey-1.8.0
Received: from fgw22-4.mail.saunalahti.fi (fgw22-4.mail.saunalahti.fi
 [62.142.5.109])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCF4F6078C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:58:09 +0000 (UTC)
Received: from darkstar.musicnaut.iki.fi (85-76-72-22-nat.elisa-mobile.fi
 [85.76.72.22]) by fgw22.mail.saunalahti.fi (Halon) with ESMTP
 id beb0906a-91a0-11eb-88cb-005056bdf889;
 Wed, 31 Mar 2021 00:41:56 +0300 (EEST)
Date: Wed, 31 Mar 2021 00:41:54 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] ARM: OMAP1: fix incorrect kernel-doc comment syntax in
 file
Message-ID: <20210330214154.GB120746@darkstar.musicnaut.iki.fi>
References: <20210330205330.26345-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330205330.26345-1-yashsri421@gmail.com>
Cc: linux-doc@vger.kernel.org, tony@atomide.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 linux-omap@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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

Hi,

On Wed, Mar 31, 2021 at 02:23:30AM +0530, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for arch/arm/mach-omap1/timer.c follows this syntax, but the
> content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> "warning: expecting prototype for OMAP1 Dual(). Prototype was for OMAP1610_GPTIMER1_BASE() instead"
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> ---
> * Applies perfectly on next-20210326
> 
>  arch/arm/mach-omap1/timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap1/timer.c b/arch/arm/mach-omap1/timer.c
> index 97fc2096b970..0411d5508d63 100644
> --- a/arch/arm/mach-omap1/timer.c
> +++ b/arch/arm/mach-omap1/timer.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * OMAP1 Dual-Mode Timers - platform device registration
>   *
>   * Contains first level initialization routines which internally
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
