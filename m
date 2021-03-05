Return-Path: <SRS0=DOtU=ID=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B8FC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Mar 2021 18:43:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D5E460200
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Mar 2021 18:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D5E460200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0D7340004;
	Fri,  5 Mar 2021 18:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxSPoxdJp4JW; Fri,  5 Mar 2021 18:43:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B09940002;
	Fri,  5 Mar 2021 18:43:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F81BC000B;
	Fri,  5 Mar 2021 18:43:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A49EC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 18:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32B2784233
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 18:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvZEs-6AOqNo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 18:43:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1AE984222
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sIGgzA66tHNsHeYn52XPo7JeAyKpJREW3Whf9/UDz4Y=; b=OpnKc2NA/LxZwoGWyc+vlOOaWP
 yuxaV1NSzwOKD5oALjsHc5ar2eyGku1gpkXfZXWrJQeYg3GebuJggCh5voJFZ4m0PCupLcRcbj2wN
 8mjYj+4QhF7hAYPK6arrF80Z8qDrGC/FoOQHJPzhJjaCXAtdKoQAsaaZ5QXvENYd1noOiQJy6OwJC
 hS55Yxrv+91mmq3wFsmY3vi19i57u3bLwlJOLTL4abU/HxLphOPER7Nq0l7oBMFi8/fidBFwHPaHK
 qtKcUiRze1HSCaoM++0S/gNbDuaHzItcbTCaK+HWbToYFDuujgbsgT7NSos9Dbq0Hfx6q//9mNr2O
 C9N9k6VA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lIFQ2-00C85B-3R; Fri, 05 Mar 2021 18:43:23 +0000
Date: Fri, 5 Mar 2021 18:43:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: fix attribute capture in function
 parsing
Message-ID: <20210305184322.GN2723601@casper.infradead.org>
References: <20210305182000.8363-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305182000.8363-1-yashsri421@gmail.com>
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

On Fri, Mar 05, 2021 at 11:50:00PM +0530, Aditya Srivastava wrote:
> Provide a simple fix by adding "__attribute_const__" in the corresponding
> regex expression.
> 
> A quick evaluation by running 'kernel-doc -none' on kernel-tree reveals
> that no additional warning or error has been added or removed by the fix.

I'm no perlmonger, but why isn't this simply:

+++ b/scripts/kernel-doc
@@ -1753,6 +1753,7 @@ sub dump_function($$) {
     $prototype =~ s/^__inline +//;
     $prototype =~ s/^__always_inline +//;
     $prototype =~ s/^noinline +//;
+    $prototype =~ s/__attribute_const__ +//;
     $prototype =~ s/__init +//;
     $prototype =~ s/__init_or_module +//;
     $prototype =~ s/__meminit +//;

(completely untested)

> +++ b/scripts/kernel-doc
> @@ -1753,6 +1753,7 @@ sub dump_function($$) {
>      my $prototype = shift;
>      my $file = shift;
>      my $noret = 0;
> +    my $attribute_const = qr{__attribute_const__};
>  
>      print_lineno($new_start_line);
>  
> @@ -1808,7 +1809,7 @@ sub dump_function($$) {
>  	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>  	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>  	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s*\*+$attribute_const?)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>  	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>  	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
>  	$prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
