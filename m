Return-Path: <SRS0=ODNG=IM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2619C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 16:17:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1008364E66
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Mar 2021 16:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1008364E66
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA9E46F4D5;
	Sun, 14 Mar 2021 16:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6CKtjn7DGzQr; Sun, 14 Mar 2021 16:17:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 272A46F4D2;
	Sun, 14 Mar 2021 16:17:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0542CC000B;
	Sun, 14 Mar 2021 16:17:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78BBAC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 16:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 602586F4D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 16:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sckScHdBAFCj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 16:17:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40F936F4D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Mar 2021 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=h3oKT2DIWMi/3UOnem0PmyfrJuvNhkM34vsZ5Qcbs8I=; b=Rtlyin6oGmxB7aF3PfGkBScUdb
 XDIpJ58isJNVQs5N7qawgn38SvVphkEjVE0W2z8jw4NumbPfu/djPN8ov78pK2Fr54XpAicgcBC8I
 ZdYaiOqNPhrHSndzH36dAcFdow3l+3wHjt0iwPdG8JS6xVh50nt3tTwQnGNhjH9s4eWVIp7vluxpP
 O4GlxOFFuxwHOLosvsH6vEvJkBS7CE6bVI+cd3UuZJbSyiDFvihBL44OLVv1/2zuHSysgKAUq/Ol7
 /4ku+ld20ZWTCV6IURTSO4P3L6n6RJes6RMYtoDpmLktYsWx5ndErI2b6/P1CgSEXh5/wWp79wcYj
 WExW3GEA==;
Received: from merlin.infradead.org ([2001:8b0:10b:1234::107])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLTQx-00EKSO-69
 for linux-kernel-mentees@lists.linuxfoundation.org;
 Sun, 14 Mar 2021 16:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=h3oKT2DIWMi/3UOnem0PmyfrJuvNhkM34vsZ5Qcbs8I=; b=aaJt/VQm3LY5XSCT8IZoqz6Dfu
 RHGD6IcX8kOz4lYEBQzKW4vqCWhl54QfBJZc9YSopxtB289Mz+vP4k/TtDE7uKtCSOpaamIDgWdl4
 J3H9wB23k/bWDyfxP7ATLI6a2NWh+nr14Fsm51QhmRLKaXavPYq9c7JFOuflxxb+e9H+sjk9GmEpQ
 iJCDlH2ynfGFS5JMDOP3i3E/sIipk5T9KcQr7AC9Z2PwsYKjQMgdIYnxXAzYthOStEnVY5MWCPmM8
 XySCxYCSylV8VdUCjv0wf8OaEiaimRs/D9Hx8sj6U5xD7XqIupipP+irq5s+uUddNVb0unAyV7Vcb
 DbiHgJOQ==;
Received: from [2601:1c0:6280:3f0::9757]
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lLTQf-001DPd-Ni; Sun, 14 Mar 2021 16:17:22 +0000
Subject: Re: [PATCH] soc: fsl: guts: fix comment syntax in file
To: Aditya Srivastava <yashsri421@gmail.com>, leoyang.li@nxp.com
References: <20210314072828.9270-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1cab34f0-dcd1-b8ff-6bab-38ff9adc94b5@infradead.org>
Date: Sun, 14 Mar 2021 09:17:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314072828.9270-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On 3/13/21 11:28 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for kernel-doc comments.
> There are certain comments in include/linux/fsl/guts.h which follows this
> syntax, but the content inside does not comply with kernel-doc.
> 
> E.g., opening comment for "Freecale 85xx and 86xx Global Utilties
> register set" follows kernel-doc syntax(i.e., '/**'), but the content
> inside does not comply with any kernel-doc specification (function,
> struct, etc).
> 
> This causes unwelcomed warning from kernel-doc:
> "warning: expecting prototype for Freecale 85xx and 86xx Global Utilties register set(). Prototype was for __FSL_GUTS_H__() instead"
> 
> Replace all such comment occurrences with general comment format,
> i.e. '/*' to pervent kernel-doc from parsing these.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> * Applies perfectly on next-20210312
> 
>  include/linux/fsl/guts.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/fsl/guts.h b/include/linux/fsl/guts.h
> index 0ac27b233f12..fdb55ca47a4f 100644
> --- a/include/linux/fsl/guts.h
> +++ b/include/linux/fsl/guts.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
> -/**
> +/*
>   * Freecale 85xx and 86xx Global Utilties register set
>   *
>   * Authors: Jeff Brown
> @@ -14,7 +14,7 @@
>  #include <linux/types.h>
>  #include <linux/io.h>
>  
> -/**
> +/*
>   * Global Utility Registers.
>   *
>   * Not all registers defined in this structure are available on all chips, so
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
