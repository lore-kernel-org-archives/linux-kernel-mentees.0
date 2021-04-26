Return-Path: <SRS0=JFG5=JX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F71C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 17:31:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E62956100C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 17:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E62956100C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 897338398E;
	Mon, 26 Apr 2021 17:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-OEKg2kmMIB; Mon, 26 Apr 2021 17:31:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4368B8394A;
	Mon, 26 Apr 2021 17:31:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20A9EC000E;
	Mon, 26 Apr 2021 17:31:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87DBFC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 17:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71DE360905
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 17:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cc7EJNKChfX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 17:31:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41266605D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sEsgnbR9Bd5/MELEwxLgHOD1YuAgY9Prs8WjOgXrw04=; b=jWxiyEf1/h7v6v/zUTVDudlE8c
 Sl5uCsPzX/1NTkE16ziM651qe8yFaVQbZrI7f6eKKvLoVA3E556OPEbCuCbWdfJUXvhgU4DPxol62
 +QvztcslRjRM5965YaU5y8SojB5Kz0t9KJQyRBrxhd+MB40G+o60vRg9gxtSz96g/CcFItiMfVsF4
 G24MGWDozUhuBA37bsu9p2b8z077z5JdnZuYMtyK4w6/E7/rpeRSsnl0V9mYhXZhkRE67D42a3dfW
 +n0p2DySZx5Zmwncc8eu72X0T4FXF+sNZbl4i3zmT3HkBCl05qku4X7MtJvjIEcbUqemvsCfdg/U5
 iCukrDtg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lb54Y-005uHt-Bm; Mon, 26 Apr 2021 17:31:04 +0000
Date: Mon, 26 Apr 2021 18:31:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: reduce repeated regex expressions
 into variables
Message-ID: <20210426173102.GO235567@casper.infradead.org>
References: <20210422191839.6119-1-yashsri421@gmail.com>
 <20210423132117.GB235567@casper.infradead.org>
 <6f76ddcb-7076-4c91-9c4c-995002c4cb91@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f76ddcb-7076-4c91-9c4c-995002c4cb91@gmail.com>
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

On Sat, Apr 24, 2021 at 05:27:34PM +0530, Aditya Srivastava wrote:
> On 23/4/21 6:51 pm, Matthew Wilcox wrote:
> > On Fri, Apr 23, 2021 at 12:48:39AM +0530, Aditya Srivastava wrote:
> >> +my $pointer_function = qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};
> > 
> > Is that a pointer-to-function?  Or as people who write C usually call it,
> > a function pointer?  Wouldn't it be better to call it $function_pointer?
> > 
> Will do it.
> 
> >> @@ -1210,8 +1211,14 @@ sub dump_struct($$) {
> >>      my $decl_type;
> >>      my $members;
> >>      my $type = qr{struct|union};
> >> +    my $packed = qr{__packed};
> >> +    my $aligned = qr{__aligned};
> >> +    my $cacheline_aligned_in_smp = qr{____cacheline_aligned_in_smp};
> >> +    my $cacheline_aligned = qr{____cacheline_aligned};
> > 
> > I don't think those four definitions actually simplify anything.
> > 
> >> +    my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;
> > 
> > ... whereas this one definitely does.
> > 
> >> -	$members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)/ /gi;
> >> -	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
> >> -	$members =~ s/\s*__packed\s*/ /gos;
> >> +	$members =~ s/\s*$attribute/ /gi;
> >> +	$members =~ s/\s*$aligned\s*\([^;]*\)/ /gos;
> > 
> > Maybe put the \s*\([^;]*\) into $aligned?  Then it becomes a useful
> > abstraction.
> 
> Actually, I had made these variables as they were repeated here and at
> -    my $definition_body =
> qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
> +    my $definition_body =
> qr{\{(.*)\}(?:\s*(?:$packed|$aligned|$cacheline_aligned_in_smp|$cacheline_aligned|$attribute))*};
> 
> So, defining them at a place might help.
> 
> What do you think?

I don't think that seeing $packed is any easier to read than __packed.
Indeed, I think it's harder, because now I have to look up what $packed
is defined as.

Defining a variable, say

	$decorations = qr{__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\))}
	(i didn't count brackets to be sure i got that right)

would be helpful because then we could say:

	my $definition_body = qr{\{(.*)\}...$decorations...

and have a fighting chance of understanding what it means.

Now, this other place we use it, we do the =~ operation a number of times.
Is there a way to use the $decorations variable to do the same thing
with a single operation?

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
