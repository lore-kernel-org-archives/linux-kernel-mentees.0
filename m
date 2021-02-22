Return-Path: <SRS0=c16L=HY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9BAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 21:40:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4448560234
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 21:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4448560234
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D7B783A94;
	Mon, 22 Feb 2021 21:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFqX3PyU4gF1; Mon, 22 Feb 2021 21:40:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id C797083A8E;
	Mon, 22 Feb 2021 21:40:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C2E8C000A;
	Mon, 22 Feb 2021 21:40:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E16DC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2C46987000
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O--PXHViKVj7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:40:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0FE4286FF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 21:40:06 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 875E930D;
 Mon, 22 Feb 2021 21:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 875E930D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1614030005; bh=EFM1k3V9bO7Y53Xdrp5AG/ja+u+SEr6m8EZGNNYAocA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LblIRwbmGR0JwwL06ujLz65nEyig0pcLcQSCTe5cXiD8cpjKM+if4EwV8W/FVrR5K
 9Nzcgfwh0+r3yGzfWLj3zxVMqll1x8GDwzoXJfMNWmVRzszh1WWryqvEkkTGcxW58t
 xa7F8hXK+ZGNCvA28hSV+9njhkCUz1PoOwv06AWH6D5ujZqg7s41JIdzmlmDCScFvx
 cJ+zvVxkXttFBr1lPttyBv2Sp8DgrzjCsjboHmDSTCpvqsAtLLf4yBZJd4EPRaCpAx
 /CkdcPHJ0qWFONaTSyceBKFacD8ZEbFfY2wytr1xJ/f2DNQ5kzwV08wynccIkoL+0y
 WJwPfa/z7Eavw==
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <20210222160347.23410-1-yashsri421@gmail.com>
References: <20210222160347.23410-1-yashsri421@gmail.com>
Date: Mon, 22 Feb 2021 14:40:04 -0700
Message-ID: <875z2jlr2j.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: Re: [Linux-kernel-mentees] [RFC] scripts: kernel-doc: fix typedef
	support for struct parsing
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

> There are files in kernel, which use 'typedef struct' syntax for defining
> struct. For eg, include/linux/zstd.h, drivers/scsi/megaraid/mega_common.h,
> etc.
> However, kernel-doc still does not support it, causing a parsing error.
>
> For eg, running scripts/kernel-doc -none on include/linux/zstd.h emits:
> "error: Cannot parse struct or union!"
>
> Add support for parsing it.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/kernel-doc | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 8b5bc7bf4bb8..46e904dc3f87 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1201,12 +1201,20 @@ sub dump_union($$) {
>  sub dump_struct($$) {
>      my $x = shift;
>      my $file = shift;
> +    my $decl_type;
> +    my $members;
>  
>      if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
> -	my $decl_type = $1;
> +	$decl_type = $1;
>  	$declaration_name = $2;
> -	my $members = $3;
> +	$members = $3;
> +    } elsif ($x =~ /typedef\s+(struct|union)\s*\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*\s*(\w*)\s*;/) {

So this isn't your fault, but these regexes are really getting out of
hand.  I would *really* like to see some effort made into making this
code more understandable / maintainable as we tweak this stuff.  So:

 - Splitting out the common part, as suggested by Lukas, would be really
   useful.  That would also avoid the problem of only occurrence being
   edited the next tine we add a new qualifier.

 - Splitting out other subsections of the regex and giving them symbolic
   names would also help.

 - We really could use some comments before these branches saying what
   they are doing; it is *not* obvious from the code.

See what I'm getting at here?

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
