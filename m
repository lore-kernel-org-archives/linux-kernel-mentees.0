Return-Path: <SRS0=UC8y=IY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D44C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Mar 2021 10:00:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C2061A48
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Mar 2021 10:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08C2061A48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AACFD40239;
	Fri, 26 Mar 2021 10:00:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UgP_Kxp29HJV; Fri, 26 Mar 2021 10:00:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id B807340250;
	Fri, 26 Mar 2021 10:00:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93E7CC000E;
	Fri, 26 Mar 2021 10:00:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27C1EC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EB5A60715
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IeFh1R-n1xRm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:28 +0000 (UTC)
X-Greylist: delayed 00:25:53 by SQLgrey-1.8.0
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA63060685
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:28 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1lPirI-0003cX-LR; Fri, 26 Mar 2021 20:34:25 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 26 Mar 2021 20:34:24 +1100
Date: Fri, 26 Mar 2021 20:34:24 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] crypto: vmx: fix incorrect kernel-doc comment syntax in
 files
Message-ID: <20210326093424.GP12658@gondor.apana.org.au>
References: <20210320202525.12562-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210320202525.12562-1-yashsri421@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: nayna@linux.ibm.com, corbet@lwn.net, mpe@ellerman.id.au,
 rdunlap@infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, pfsmorigo@gmail.com,
 linux-crypto@vger.kernel.org, benh@kernel.crashing.org, leitao@debian.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 paulus@samba.org
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

On Sun, Mar 21, 2021 at 01:55:25AM +0530, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are certain files in drivers/crypto/vmx, which follow this syntax,
> but the content inside does not comply with kernel-doc.
> Such lines were probably not meant for kernel-doc parsing, but are parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> 
> E.g., presence of kernel-doc like comment in the header line for
> drivers/crypto/vmx/vmx.c causes this warning by kernel-doc:
> 
> "warning: expecting prototype for Routines supporting VMX instructions on the Power 8(). Prototype was for p8_init() instead"
> 
> Similarly for other files too.
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> * Applies perfectly on next-20210319
> 
>  drivers/crypto/vmx/aes.c     | 2 +-
>  drivers/crypto/vmx/aes_cbc.c | 2 +-
>  drivers/crypto/vmx/aes_ctr.c | 2 +-
>  drivers/crypto/vmx/aes_xts.c | 2 +-
>  drivers/crypto/vmx/ghash.c   | 2 +-
>  drivers/crypto/vmx/vmx.c     | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
