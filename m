Return-Path: <SRS0=UC8y=IY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2540CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Mar 2021 10:00:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70FEA61A42
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Mar 2021 10:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70FEA61A42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 214A960C15;
	Fri, 26 Mar 2021 10:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X_kjx4CyIK2E; Fri, 26 Mar 2021 10:00:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC6F460715;
	Fri, 26 Mar 2021 10:00:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDC0FC000E;
	Fri, 26 Mar 2021 10:00:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE9D4C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0269404F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKi7IWO-Brbk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93047403C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:34 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1lPirc-0003eH-CF; Fri, 26 Mar 2021 20:34:45 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 26 Mar 2021 20:34:44 +1100
Date: Fri, 26 Mar 2021 20:34:44 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] crypto: ux500: fix incorrect kernel-doc comment syntax
Message-ID: <20210326093444.GR12658@gondor.apana.org.au>
References: <20210321120912.12905-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210321120912.12905-1-yashsri421@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: corbet@lwn.net, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
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

On Sun, Mar 21, 2021 at 05:39:12PM +0530, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are certain files in drivers/crypto/ux500, which follow this syntax,
> but the content inside does not comply with kernel-doc.
> Such lines were probably not meant for kernel-doc parsing, but are parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> 
> E.g., presence of kernel-doc like comment in the header lines for
> drivers/crypto/ux500/cryp/cryp.h at header causes this warning:
> 
> "warning: expecting prototype for ST(). Prototype was for _CRYP_H_() instead"
> 
> Similarly for other files too.
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  drivers/crypto/ux500/cryp/cryp.c      |  2 +-
>  drivers/crypto/ux500/cryp/cryp.h      |  2 +-
>  drivers/crypto/ux500/cryp/cryp_core.c |  2 +-
>  drivers/crypto/ux500/cryp/cryp_irq.c  |  2 +-
>  drivers/crypto/ux500/cryp/cryp_irq.h  |  4 ++--
>  drivers/crypto/ux500/cryp/cryp_irqp.h |  4 ++--
>  drivers/crypto/ux500/cryp/cryp_p.h    | 14 +++++++-------
>  7 files changed, 15 insertions(+), 15 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
