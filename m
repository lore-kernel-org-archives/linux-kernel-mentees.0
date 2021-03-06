Return-Path: <SRS0=Yqm+=IE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3E6C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 04:36:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECC2D65011
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Mar 2021 04:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECC2D65011
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8DC14332F;
	Sat,  6 Mar 2021 04:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNg0anYzZx7t; Sat,  6 Mar 2021 04:36:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89FB0414F6;
	Sat,  6 Mar 2021 04:36:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71E13C000B;
	Sat,  6 Mar 2021 04:36:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23D62C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 04:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0758D4ED79
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 04:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RecPaFBke64G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 04:36:06 +0000 (UTC)
X-Greylist: delayed 09:52:26 by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BFA44ED76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Mar 2021 04:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RWCxwMP7E0t1Cv2Sce54HAeoQwsG0UeKFOUNYGps2a0=; b=FHDdTH+xd4AJVLLCat2soNRIW/
 afPBVSefStZEWrGZBzy9LLpZp+HLsH9lpOsZDMBX7g1VBvY5Aawb8ayJTW4LkeCoOvJK4wKm6Pthg
 RxVVy3GJHCwj7yDzIedVWEkVfdxJvGJ/Oi34NFnQ0aJsVn/gD3KYZXjgDomOzZL5ZSpMiyZgwW1sb
 GtDCXXKx1sNRmXpDgtYypGujeRAaqgcYDYrYxyMTCeTuTYWrIRcTGZNcun+0tpZB0eG73Dx1l+bLf
 Ozzz7hrV9UhfxRRUk3PQrdyCLptcEbp1FWCkZXKushPBMCTg8Up2v6ItkoNkB2vcVrY3V5JWhFZPG
 xtItxtww==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lIOfM-00Cc4o-31; Sat, 06 Mar 2021 04:35:51 +0000
Date: Sat, 6 Mar 2021 04:35:48 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [RFC v3] scripts: kernel-doc: fix typedef support for
 struct/union parsing
Message-ID: <20210306043548.GO2723601@casper.infradead.org>
References: <CAKXUXMzHPnM=ie06ZGuFXyJ7RcRjYomjyASbp3ND9-Mb2Es+2w@mail.gmail.com>
 <20210225145033.11431-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225145033.11431-1-yashsri421@gmail.com>
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

On Thu, Feb 25, 2021 at 08:20:33PM +0530, Aditya Srivastava wrote:
> +++ b/scripts/kernel-doc
> @@ -1201,12 +1201,23 @@ sub dump_union($$) {
>  sub dump_struct($$) {
>      my $x = shift;
>      my $file = shift;
> +    my $decl_type;
> +    my $members;
> +    my $type = qr{struct|union};
> +    # For capturing struct/union definition body, i.e. "{members*}qualifiers*"
> +    my $definition_body = qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
> -    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
> -	my $decl_type = $1;
> +    if ($x =~ /($type)\s+(\w+)\s*$definition_body/) {
> +	$decl_type = $1;
>  	$declaration_name = $2;
> -	my $members = $3;
> +	$members = $3;
> +    } elsif ($x =~ /typedef\s+($type)\s*$definition_body\s*(\w+)\s*;/) {
> +	$decl_type = $1;
> +	$declaration_name = $3;
> +	$members = $2;
> +    }

In the same spirit as dump_function, would something like this work?

-    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
+    $x =~ s/__packed +//;
+    $x =~ s/__aligned +//;
+    $x =~ s/____cacheline_aligned_in_smp +//;
+    $x =~ s/____cacheline_aligned +//;
+    $x =~ s/__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)//;
+
+    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*)*/) {

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
