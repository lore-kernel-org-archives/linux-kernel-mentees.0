Return-Path: <SRS0=ha8c=IN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3E6C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 22:34:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E6F464F0F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 22:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E6F464F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1C144EBF2;
	Mon, 15 Mar 2021 22:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zue0DgpkF2G7; Mon, 15 Mar 2021 22:34:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7262A4EBDD;
	Mon, 15 Mar 2021 22:34:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BBB7C000B;
	Mon, 15 Mar 2021 22:34:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5901C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 22:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A460D4424E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 22:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0oxS0aiPMbmp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 22:34:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A0F24EBF4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 22:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=6x00DFwVN2oFrJ92yfTSKid5GQ86PjCsN9u0Eqop0RU=; b=o8f8r0cKrnxVxkNaRteiB7F47j
 RsOA0Rc8wjuv8xFtd/qqhj+l3XUUzGZX3kk63VNdJ5kCvHC6M6QPzBypl215597fGT/0ov17hC7x3
 2y777UWFFLyR8vZdaT3B+Q7k0ir2zUMzPex/0R/uyPh0J8FgWiDqsoU2/3OqsYDiRXPx98Ne7daWh
 qML9xAuoZQ3vq/t1Y0LD44uZiS0c5xOefExqdARm1qSjHwGm9Mo0ei7YX+AQ6IzI033sGh3m2xhWH
 4goffGgb8BMWyPcFGLTDgTSes9mHvd0Xcac5CccdGuageF0fijX0rheQHpM6clkyoBe7TtjdIbrpv
 9gUK5tSA==;
Received: from merlin.infradead.org ([2001:8b0:10b:1234::107])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLvmA-00H2EB-KP
 for linux-kernel-mentees@lists.linuxfoundation.org;
 Mon, 15 Mar 2021 22:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=6x00DFwVN2oFrJ92yfTSKid5GQ86PjCsN9u0Eqop0RU=; b=Z85sk+RkBTyNGShbvEZ2gdsSP/
 CXByVyWvzoZEu2Mw06d/llDZLm3f/CwJT2lVq8nFU2e1URa5NfMMEMcZrT+iNFwT/OfMHq6HP0xbG
 Rzc1523KKGkI8hCe7VDVHYBCsvW/Gahywp5BBW5ek73IkSocZ2cI1WrgPipaboUgZ7W4+LBSknvYY
 CMkpxtd5a2sDuCBsxP3JHOAzErQW+8l4D8WAeo96I982BIhcJNnzTY+Rp7fwawlckm+xOeV2j8K6e
 55GlukRdHzqEeOvNLU71jD+uDPgtBxTVHh6cWnQ0piPx2Evt8HAfoMlNL9RXQUiNtKgdLHC/e5kMk
 IE+m1JLg==;
Received: from [2601:1c0:6280:3f0::9757]
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lLvlf-001NOE-Ug; Mon, 15 Mar 2021 22:33:04 +0000
Subject: Re: [PATCH v2] rsi: fix comment syntax in file headers
To: Aditya Srivastava <yashsri421@gmail.com>, kvalo@codeaurora.org
References: <20210315173259.8757-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dd3c5da5-ec8e-1354-3ab9-bf4c4f90a378@infradead.org>
Date: Mon, 15 Mar 2021 15:32:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315173259.8757-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, amitkarwar@gmail.com, siva8118@gmail.com,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
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

On 3/15/21 10:32 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are some files in drivers/net/wireless/rsi which follow this syntax
> in their file headers, i.e. start with '/**' like comments, which causes
> unexpected warnings from kernel-doc.
> 
> E.g., running scripts/kernel-doc -none on drivers/net/wireless/rsi/rsi_coex.h
> causes this warning:
> "warning: wrong kernel-doc identifier on line:
>  * Copyright (c) 2018 Redpine Signals Inc."
> 
> Similarly for other files too.
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e., "/*", to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> - Applies perfectly on next-20210312
> 
> Changes in v2:
> - Convert the patch series to a single patch as suggested by Lukas and Kalle
> 
>  drivers/net/wireless/rsi/rsi_boot_params.h | 2 +-
>  drivers/net/wireless/rsi/rsi_coex.h        | 2 +-
>  drivers/net/wireless/rsi/rsi_common.h      | 2 +-
>  drivers/net/wireless/rsi/rsi_debugfs.h     | 2 +-
>  drivers/net/wireless/rsi/rsi_hal.h         | 2 +-
>  drivers/net/wireless/rsi/rsi_main.h        | 2 +-
>  drivers/net/wireless/rsi/rsi_mgmt.h        | 2 +-
>  drivers/net/wireless/rsi/rsi_ps.h          | 2 +-
>  drivers/net/wireless/rsi/rsi_sdio.h        | 2 +-
>  drivers/net/wireless/rsi/rsi_usb.h         | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
