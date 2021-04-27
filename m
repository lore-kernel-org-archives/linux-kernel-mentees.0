Return-Path: <SRS0=0WDs=JY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646E0C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 16:57:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B59A260240
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 16:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B59A260240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4952883D55;
	Tue, 27 Apr 2021 16:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeywJ-I-2_w0; Tue, 27 Apr 2021 16:57:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2526483D53;
	Tue, 27 Apr 2021 16:57:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F40EAC0024;
	Tue, 27 Apr 2021 16:56:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 062E1C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 16:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02AB183D54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 16:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HrqF_VlF9n0v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 16:56:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5B7483D53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 16:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XVHaeqgZB+erEa9UOd2e5xkHagKcSoWRwUEctU/iNSY=; b=Fyy4Y8nUeQf9/Up8osMcyno9T0
 gy+JjV3A3VgWENh1hriXrkZMyJImCsYjwgFpvz27dbnY5Wq3OfKCVKW20dpxpbOmuhHPFHdm8Ud8R
 lDdoC48qQDaH11BU5OFZpoL5c+fq24n8DAPQeAhMktAgQJCU2mGuiHNq2EkiotGRCqM7dmlDNa1oM
 FLCDxwEqgoR8sWkiNNwzE1w+VhIN9YkJR8NsZmJLK7AYX+nNCAYPG8zX/kHhKbjCj/f0iOt761QMc
 B7kGsCJxObMQv978OeWW3iGpwbd7r48iWF5arC//g6e5ugk9Q7/WCHS3RhyJ7n+paLn3LqzOwiyjQ
 D5XDygTQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lbR0j-007ALN-Hd; Tue, 27 Apr 2021 16:56:40 +0000
Date: Tue, 27 Apr 2021 17:56:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [RFC v2] scripts: kernel-doc: reduce repeated regex expressions
 into variables
Message-ID: <20210427165633.GA235567@casper.infradead.org>
References: <6f76ddcb-7076-4c91-9c4c-995002c4cb91@gmail.com>
 <20210424124731.29905-1-yashsri421@gmail.com>
 <87wnsnd8nc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wnsnd8nc.fsf@meer.lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Aditya Srivastava <yashsri421@gmail.com>
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

On Tue, Apr 27, 2021 at 09:55:35AM -0600, Jonathan Corbet wrote:
> The use of the variables here doesn't really make those expressions more
> readable.  
> 
> >  	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
> > -	$members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
> > -	$members =~ s/\s*____cacheline_aligned/ /gos;
> > +	$members =~ s/\s*$cacheline_aligned_in_smp/ /gos;
> > +	$members =~ s/\s*$cacheline_aligned/ /gos;
> >  
> > +	my $args = qr{([^,)]+)};
> >  	# replace DECLARE_BITMAP
> >  	$members =~ s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1, __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;
> > -	$members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
> > +	$members =~ s/DECLARE_BITMAP\s*\($args,\s*$args\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
> 
> Here too ... this is the kind of stuff that makes me glad that Colorado
> is a legal-weed state, and the new version, while better, doesn't change
> that basic fact.

I'm going to have to disagree with you on this one (I agree with you on all
the others).  I find this much easier to read ...

"DECLARE_BITMAP followed by any amount of whitespace, literal open bracket,
an argument, literal comma, whitespace, another argument, literal close bracket"

Before, I get to "DECLARE_BITMAP followed by any amount of whitespace,
then some line noise".

Obviously I'm less experienced at reading regexes than you are, but this
simplification really does help me.

> I think I'll stop here; hopefully I've gotten my point across.  I really
> like where this work is heading; focusing just a bit more on pulling the
> regexes together and making the whole thing more readable would be
> wonderful.

Amen.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
