Return-Path: <SRS0=n6YR=KN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AE8C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 18:45:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 839A86124C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 18:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 839A86124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B82F4053E;
	Tue, 18 May 2021 18:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIa46FJ2dHVK; Tue, 18 May 2021 18:45:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C7C1403E5;
	Tue, 18 May 2021 18:45:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54FA6C000E;
	Tue, 18 May 2021 18:45:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9FD5C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9326140E63
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpHEwNc4R1La
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:45:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5A1340E51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 18:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ua0bE7OgkNw1FIpTpThZwhG6pubkRRk1Slp87fusRz4=; b=NA3SzPmkCO8a0bdGHc2cEGZ7jT
 g21gdb52o1mWEPmWGzwWH/4FP/b2jYHiwW81fIxjPV6eLv+4tNhe752KcwExznsPzcJ7k+8r8neRp
 Qlvlk+w9izwa2OIz6xee92GXAmAqQ+7N5hGEGbzEMa8glx4M8YujcdUhbGsllcb+Kor6vL/cjU51I
 QqvX8E8azMbsC1QXvk4C4Q69XlCAL3QXigm32EayYUNhe5+pmMQIIgj9FbDuKACsQcjJinBXiQxmy
 VAOkUPTxXZhAhZg+XlSg4Oui/Wf0u9NSOFNp8u4gsW/l+VR8b05N3LaZaSLILCxuY5GxNcZJ+WE99
 gFOJZGIw==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lj4iA-00EtEI-3B; Tue, 18 May 2021 18:44:58 +0000
Subject: Re: [PATCH] irqchip/irq-omap-intc: fix kernel-doc syntax in file
 header
To: Aditya Srivastava <yashsri421@gmail.com>, linux-kernel@vger.kernel.org
References: <20210518182310.14461-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3a5390fb-a9fb-e0da-e923-b2459d403d33@infradead.org>
Date: Tue, 18 May 2021 11:44:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210518182310.14461-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: keescook@chromium.org, linux-doc@vger.kernel.org, grandmaster@al2klimov.de,
 akpm@linux-foundation.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On 5/18/21 11:23 AM, Aditya Srivastava wrote:
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  include/linux/irqchip/irq-omap-intc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
