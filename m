Return-Path: <SRS0=Yqm+=IE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9343C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 15:20:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D231764FC8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 15:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D231764FC8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C12A4EC39;
	Sat,  6 Mar 2021 15:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J81JLf8i9387; Sat,  6 Mar 2021 15:20:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F364EC05;
	Sat,  6 Mar 2021 15:20:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 138CCC000B;
	Sat,  6 Mar 2021 15:20:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0291C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 15:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E53CF42FFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 15:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUG7J05eqwc2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 15:20:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6B3D42FB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NjnK0qgYgEfs1buaAUZnKhf/ZDhnvWuO8bhHT6AcXzo=; b=u1ZJJ6BKay/Yg+3YE7MnYVhWQ9
 JH+ifgjLjYNnhi+zBeT4w/oX975qexDEVTXt4FflUFdQfTGPVDkR+XA+xM/+vJzc156wErA6MPDw+
 ufgwJmv/M9ePV01+Cny/kP3fiwa1g5LfJkIsT6mnGm8L5UTiGyWg3zMNznT3xRHrbKk46N07auZCi
 rieDnUxpby6xrLq1GcMxJPDl3nByJAzOs33sq1ZI6vGzxoWOJQ16S+YX2qpmtv6m9kPnib8YiAWAZ
 vo2gxEZPISlMYlyA/a2sG30uBAhkvwzYZU0yZXspc5Q+vv80zlmBgDijxL2KPYTpsYdm0S39aRQyU
 JxVc5XlA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lIYio-00DBQ3-0D; Sat, 06 Mar 2021 15:20:04 +0000
Date: Sat, 6 Mar 2021 15:20:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Aditya <yashsri421@gmail.com>
Subject: Re: [RFC v3] scripts: kernel-doc: fix typedef support for
 struct/union parsing
Message-ID: <20210306152001.GP2723601@casper.infradead.org>
References: <CAKXUXMzHPnM=ie06ZGuFXyJ7RcRjYomjyASbp3ND9-Mb2Es+2w@mail.gmail.com>
 <20210225145033.11431-1-yashsri421@gmail.com>
 <20210306043548.GO2723601@casper.infradead.org>
 <CAKXUXMwD_ZZA7EJaxZBRfMDEvwd4Ghsj2vy9KCfj0R-yx2_K0Q@mail.gmail.com>
 <6a75c9f4-460f-f83e-7fe2-5a3a4c64232b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a75c9f4-460f-f83e-7fe2-5a3a4c64232b@gmail.com>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
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

On Sat, Mar 06, 2021 at 01:18:38PM +0530, Aditya wrote:
> On 6/3/21 11:55 am, Lukas Bulwahn wrote:
> > I agree. That might be a suitable clean-up to keep the code for
> > functions and struct/union parsing similar in style/spirit.
> > 
> > Aditya, would you like to create a patch for that?
> 
> Sure Lukas.
> I have a doubt though, Can't we use a single expression separated by
> "|" here, instead of multiple lines? i.e.,
> 
> $x =~
> s/__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)\s*//;
> 
> 
> Probably we could do something similar for dump_function, i.e.,
> -    $prototype =~ s/^static +//;
> -    $prototype =~ s/^extern +//;
> -    $prototype =~ s/^asmlinkage +//;
> -    $prototype =~ s/^inline +//;
> -    $prototype =~ s/^__inline__ +//;
> -    $prototype =~ s/^__inline +//;
> -    $prototype =~ s/^__always_inline +//;
> -    $prototype =~ s/^noinline +//;
> 
> +    $prototype =~
> s/^(?:static|extern|asmlinkage|__?inline__?|__always_inline|noinline) +//;
> And so on for other regexps.
> 
> What do you think?

I think there's a tradeoff between speed / compactness and readability.
As someone who doesn't know perl particularly well, I can look at the
series of lines and say "Oh, it's stripping out these unwanted things".
Your one line, while undoubtedly more efficient, is considerably less
easy to understand.

Maybe there's another way to do it that's more efficient while not
sacrificing the readability?

Also, would your suggestion work for 'static inline void foo(void)'?
I think it needs to remove multiple occurrences of the things in the
regex.  But maybe that's what the ?: on the beginning is for?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
