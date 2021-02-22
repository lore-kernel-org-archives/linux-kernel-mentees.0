Return-Path: <SRS0=c16L=HY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D98C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 21:33:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA8364E25
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 21:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EA8364E25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D55B83A8E;
	Mon, 22 Feb 2021 21:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85cGOdD6dN8x; Mon, 22 Feb 2021 21:33:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id A57D183A8C;
	Mon, 22 Feb 2021 21:33:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86768C000A;
	Mon, 22 Feb 2021 21:33:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85152C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 749798539A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VxNFBJ4csfE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:33:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 220CD851C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:33:33 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 0FB7B2B7;
 Mon, 22 Feb 2021 21:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0FB7B2B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1614029613; bh=bL4sbefqoOVp9OCqDyDEVtsiOHFV5JJR/crNNp2k3pM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VKmOuPKu3fJG5P5HH+PnRU/+xrc8DgTCfef6J3Gozkc/h7IU1qRRHZRQ86K3faEae
 XK02k7S+AJnH69MywGMCq5CPy91M+pW7TsNc6Wf1CWC3d+CM/uyoMaQo+hOM+nKG1q
 sLvELn44CiV5xcL04T6edwL5I2ANJ3TGAM+BpYbut3h7l+Sbk9FLBjzgw766QNH5BS
 iuXCncnezFRYMJM4BpunAwJ8cZVeqRSSoMIb3i4506nsvfSHBA65ZKs10sNmEnzHMj
 JsY2R7g7R5+RGcg+1xrqygBkSX8fR/TR3Jv8rggMpzLzwG4ULlhV1HdBQHSJaZoRvY
 PhwwVmINpkNqg==
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <20210217145625.14006-1-yashsri421@gmail.com>
References: <20210217145625.14006-1-yashsri421@gmail.com>
Date: Mon, 22 Feb 2021 14:33:32 -0700
Message-ID: <878s7flrdf.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: Re: [Linux-kernel-mentees] [RFC] scripts: kernel-doc: fix array
 element capture in pointer-to-func parsing
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

Aditya Srivastava <yashsri421@gmail.com> writes:

> Currently, kernel-doc causes an unexpected error when array element (i.e.,
> "type (*foo[bar])(args)") is present as pointer parameter in
> pointer-to-function parsing.
>
> For e.g., running kernel-doc -none on kernel/gcov/gcc_4_7.c causes this
> error:
> "Use of uninitialized value $param in regexp compilation at ...", in
> combination with:
> "warning: Function parameter or member '' not described in 'gcov_info'"

In the future, please quote error messages from the kernel verbatim.
You can trim irrelevant stuff before or after, but please do not edit
them in this way.  That helps me to understand what you are fixing, and
is also useful for anybody else who might be searching for a solution to
the same problem.

> Here, the parameter parsing does not take into account the presence of
> array element (i.e. square brackets) in $param.
>
> Provide a simple fix by adding square brackets in the regex, responsible
> for capturing $param.
>
> A quick evaluation, by running 'kernel-doc -none' on entire kernel-tree,
> reveals that no additional warning or error has been added or removed by
> the fix.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> * Applies perfectly over next-20210217
>
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index e046e16e4411..8b5bc7bf4bb8 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1553,7 +1553,7 @@ sub create_parameterlist($$$$) {
>  	} elsif ($arg =~ m/\(.+\)\s*\(/) {
>  	    # pointer-to-function
>  	    $arg =~ tr/#/,/;
> -	    $arg =~ m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;
> +	    $arg =~ m/[^\(]+\(\*?\s*([\w\[\]\.]*)\s*\)/;
>  	    $param = $1;
>  	    $type = $arg;
>  	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
> -- 

...meanwhile, I have applied this one, thanks.

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
