Return-Path: <SRS0=UC8y=IY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3952C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Mar 2021 10:00:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16DE561A50
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Mar 2021 10:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16DE561A50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF6DD4025C;
	Fri, 26 Mar 2021 10:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJARB_8PLJwU; Fri, 26 Mar 2021 10:00:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id D304C40251;
	Fri, 26 Mar 2021 10:00:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2998C000E;
	Fri, 26 Mar 2021 10:00:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E20DC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E10E84B9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3M7yvRKYnoBO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67C0C84B6C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 10:00:32 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1lPirS-0003ci-Qv; Fri, 26 Mar 2021 20:34:35 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 26 Mar 2021 20:34:34 +1100
Date: Fri, 26 Mar 2021 20:34:34 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] crypto: amcc: fix incorrect kernel-doc comment syntax in
 files
Message-ID: <20210326093434.GQ12658@gondor.apana.org.au>
References: <20210321120832.12837-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210321120832.12837-1-yashsri421@gmail.com>
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

On Sun, Mar 21, 2021 at 05:38:32PM +0530, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are certain files in drivers/crypto/amcc, which follow this syntax,
> but the content inside does not comply with kernel-doc.
> Such lines were probably not meant for kernel-doc parsing, but are parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> 
> E.g., presence of kernel-doc like comment in
> drivers/crypto/amcc/crypto4xx_alg.c at header, and some other lines,
> causes these warnings by kernel-doc:
> 
> "warning: expecting prototype for AMCC SoC PPC4xx Crypto Driver(). Prototype was for set_dynamic_sa_command_0() instead"
> "warning: Function parameter or member 'dir' not described in 'set_dynamic_sa_command_0'"
> etc..
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  drivers/crypto/amcc/crypto4xx_alg.c     | 12 ++++++------
>  drivers/crypto/amcc/crypto4xx_core.c    | 18 +++++++++---------
>  drivers/crypto/amcc/crypto4xx_core.h    |  4 ++--
>  drivers/crypto/amcc/crypto4xx_reg_def.h |  8 ++++----
>  drivers/crypto/amcc/crypto4xx_sa.h      | 18 +++++++++---------
>  drivers/crypto/amcc/crypto4xx_trng.h    |  2 +-
>  6 files changed, 31 insertions(+), 31 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
