Return-Path: <SRS0=6KHC=JU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885B6C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 13:22:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1193661452
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 13:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1193661452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0008606B9;
	Fri, 23 Apr 2021 13:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9LxeV0Bi9aA; Fri, 23 Apr 2021 13:22:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F19D607E5;
	Fri, 23 Apr 2021 13:22:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49D78C000F;
	Fri, 23 Apr 2021 13:22:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37787C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 13:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18B38414D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 13:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKqB_wUO57rS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 13:22:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C4FE40F8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 13:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tpTBKNV5/izxL1k5IlHIzvsRqg3svyXWJhuDCpXyO+A=; b=MHQet0QejLNMAzlp2D84sdDlE7
 z8qe6n1GFkCB/BkNAYLvOt0ujj5k2q82CxRvH1HHwkRVSdTwGJD3uHa4Lt0tiB+mRGBHqQbPx8bW9
 ZNRJxDU7mhF4xnEi5x3I+KV3s9Mr0E0piUmhIs+p6kzLRFpctHSgp9etgpFHI9XP090GBkHciinEw
 FBX61IUTaDPEG307xfYRyg1uYVY41AP0wjIelDatlxEVOOCn6V3TdpL6ei6r9TLkxQgPHcLz9Hlh4
 6PwP2aXWA/DTWTEK/zgquxOOan2HQNRD1sOoGm6hhQIjBOJ3PcCc3KmCw85PYI0WWH0/slyrxhcXE
 esCUXA9w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lZvkD-001tIH-3X; Fri, 23 Apr 2021 13:21:27 +0000
Date: Fri, 23 Apr 2021 14:21:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: reduce repeated regex expressions
 into variables
Message-ID: <20210423132117.GB235567@casper.infradead.org>
References: <20210422191839.6119-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422191839.6119-1-yashsri421@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net
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

On Fri, Apr 23, 2021 at 12:48:39AM +0530, Aditya Srivastava wrote:
> +my $pointer_function = qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};

Is that a pointer-to-function?  Or as people who write C usually call it,
a function pointer?  Wouldn't it be better to call it $function_pointer?

> @@ -1210,8 +1211,14 @@ sub dump_struct($$) {
>      my $decl_type;
>      my $members;
>      my $type = qr{struct|union};
> +    my $packed = qr{__packed};
> +    my $aligned = qr{__aligned};
> +    my $cacheline_aligned_in_smp = qr{____cacheline_aligned_in_smp};
> +    my $cacheline_aligned = qr{____cacheline_aligned};

I don't think those four definitions actually simplify anything.

> +    my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;

... whereas this one definitely does.

> -	$members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)/ /gi;
> -	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
> -	$members =~ s/\s*__packed\s*/ /gos;
> +	$members =~ s/\s*$attribute/ /gi;
> +	$members =~ s/\s*$aligned\s*\([^;]*\)/ /gos;

Maybe put the \s*\([^;]*\) into $aligned?  Then it becomes a useful
abstraction.

> -    } elsif ($prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/)  {
> +    } elsif ($prototype =~ m/^()($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+)\s+($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+\s+\w+)\s+($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^()($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+)\s+($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*($name)\s*$prototype_end2/)  {

This is probably the best patch I've seen so far this year.

Now, can we go further?  For example:
	$prototype_end = $prototype_end1|$prototype_end2
That would let us cut the number of lines here in half.

Can we create a definition for a variable number of \w and \s and '*'
in the return type?  In fact, can we define a regex that matches a type?
So this would become:

> +    } elsif ($prototype =~ m/^($type)\s*($name)\s*$prototype_end/) {

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
