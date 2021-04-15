Return-Path: <SRS0=fLed=JM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33330C43460
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Apr 2021 21:29:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B993761004
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Apr 2021 21:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B993761004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E2CF84341;
	Thu, 15 Apr 2021 21:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csC1KPONY4Nv; Thu, 15 Apr 2021 21:29:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 963A5840FE;
	Thu, 15 Apr 2021 21:29:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71959C000B;
	Thu, 15 Apr 2021 21:29:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A242DC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 21:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88F494028E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 21:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lwn.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZV7fntScbpv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 21:29:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA07A40242
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 21:29:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id AE58180F;
 Thu, 15 Apr 2021 21:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AE58180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1618522188; bh=t67+k546gBIsT9XMy+RiKFoHmpRAnf+zrnYpN23A658=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qCgLddaaKzlYEgUW7CqQ/6SBb65eOp9XNBTVKE1iVE6xxFvFni03RbE4P4n3TiuRy
 QUTdLo0nyU0cJaI7G+VZy29Io1laPGte88fA/Zr+D3fSV9er440lMD5plm3R0riP0L
 5LFCzft7q0Ww86FmO+nEGUdo8aEdbWZ/rE/JcanuIlAhVvmcBn6/HS4sfzp96jOB6B
 H9RFGNFcmPwO7OFeZVb5s5ULsc9eZ3wDpqdabjIr6V4/J4K+sC7uMyxrC/2QMtm1xZ
 +CR4tNzlZgsfoaLKrGmM6xVj3cX9m5TOUxqGd7QL7Xtbhd81cMSitd4OFuH+hmco5n
 307Z1ytvm8BHQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: improve parsing for kernel-doc
 comments syntax
In-Reply-To: <20210414192529.9080-1-yashsri421@gmail.com>
References: <20210414192529.9080-1-yashsri421@gmail.com>
Date: Thu, 15 Apr 2021 15:29:47 -0600
Message-ID: <87y2djgrsk.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
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

> Currently kernel-doc does not identify some cases of probable kernel
> doc comments, for e.g. pointer used as declaration type for identifier,
> space separated identifier, etc.
>
> Some example of these cases in files can be:
> i)" *  journal_t * jbd2_journal_init_dev() - creates and initialises a journal structure"
> in fs/jbd2/journal.c
>
> ii) "*      dget, dget_dlock -      get a reference to a dentry" in
> include/linux/dcache.h
>
> iii) "  * DEFINE_SEQLOCK(sl) - Define a statically allocated seqlock_t"
> in include/linux/seqlock.h
>
> Also improve identification for non-kerneldoc comments. For e.g.,
>
> i) " *	The following functions allow us to read data using a swap map"
> in kernel/power/swap.c does follow the kernel-doc like syntax, but the
> content inside does not adheres to the expected format.
>
> Improve parsing by adding support for these probable attempts to write
> kernel-doc comment.
>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Link: https://lore.kernel.org/lkml/87mtujktl2.fsf@meer.lwn.net
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/kernel-doc | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

OK, I've applied this, but I have a couple of comments...

> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 888913528185..37665aa41e6b 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -2110,17 +2110,25 @@ sub process_name($$) {
>      } elsif (/$doc_decl/o) {
>  	$identifier = $1;
>  	my $is_kernel_comment = 0;
> -	if (/^\s*\*\s*([\w\s]+?)(\(\))?\s*([-:].*)?$/) {
> +	my $decl_start = qr{\s*\*};

I appreciate the attempt to make the regexes a bit more comprehensible,
but we can do better yet, methinks.  This $decl_start is very much like
$doc_com defined globally.

It would really help a lot if we could at least take the incredible mass
of regexes in this program and boil them down to a smaller, unique set
that is used throughout.  kernel-doc might still make brains explode,
but perhaps the blast radius would be a bit smaller.

> +	my $fn_type = qr{\w+\s*\*\s*}; # i.e. pointer declaration type, foo * bar() - desc

Some of the lines in this change go waaaaay beyond the 80-character
limit; please try not to do that.  I fixed up the offending comments
this time around.

Thanks,

jon

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
