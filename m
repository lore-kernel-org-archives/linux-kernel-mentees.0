Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08A5C2BC73
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 16:38:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C640120659
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 16:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KiqVQ3CN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C640120659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A729422E20;
	Wed,  4 Dec 2019 16:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuXtFtJeVeUN; Wed,  4 Dec 2019 16:38:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 82349203AE;
	Wed,  4 Dec 2019 16:38:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69EA9C1DD6;
	Wed,  4 Dec 2019 16:38:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56A45C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 43A4787C0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RWb5rY0WGT5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:38:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 918ED85EF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xfQ+lvUckzKsMaIRi5u6tGdP1WAeCSU0z6SwMQ1YJQQ=; b=KiqVQ3CNjf8gnnkRJKo5pHlR4
 QDak0t6lU5vhwqYeZ18k8nyIs15u43dpLYok/4dekdwgUDnUygmGi3ov0GVdn5xBYdhrocmf5ZKjc
 yn7UVv4OKzaVTaQgkUeSBO/9XvndNRyj0SIEOkNTdtUmE2xuz7oWH4EU530hCH9MVvufi5Xv+CGji
 F1DC4qTo81eOU3zaRS+UYcMO57SAWAn/R/KPrO1RfLY7OSwrGY43fn2OOvlTh551uk1Q7lesgF+l0
 Kmjf4hEn67t3Y0PduP/co9t5LWpv8xVgg7EFbo8otmAIUsF9hr2tT35kHBG6mV7a3JZdscOh9xUxs
 IY97wPMbw==;
Received: from [2601:1c0:6280:3f0::3deb]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icXfH-0006Mi-5r; Wed, 04 Dec 2019 16:38:11 +0000
To: madhuparnabhowmik04@gmail.com, corbet@lwn.net, mchehab@kernel.org
References: <20191204100941.6268-1-madhuparnabhowmik04@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <09c9f538-8698-37c4-c5c0-2107a96ae859@infradead.org>
Date: Wed, 4 Dec 2019 08:38:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191204100941.6268-1-madhuparnabhowmik04@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: filesystems:
 automount-support: Change reference to document autofs.txt to autofs.rst
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

On 12/4/19 2:09 AM, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> This patch fixes the following documentation build warning:
> 
> Warning: Documentation/filesystems/automount-support.txt references
>  a file that doesn't exist: Documentation/filesystems/autofs.txt
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> ---
>  .../filesystems/automount-support.txt         |    2 +-
>  doc.txt                                       |  492 ++
>  four.txt                                      | 7656 +++++++++++++++++
>  fs/nfs/dir.c                                  |    2 +-
>  scripts/pnmtologo                             |  Bin 0 -> 18112 bytes
>  5 files changed, 8150 insertions(+), 2 deletions(-)
>  create mode 100644 doc.txt
>  create mode 100644 four.txt
>  create mode 100755 scripts/pnmtologo

Hi,

It seems that there are some files in this patch that should not be here.

-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
