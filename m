Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F6DC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 18:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24D864BDD5;
	Sun, 29 Oct 2023 18:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D864BDD5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=e3Ell2Vp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpdKyOoaf3rj; Sun, 29 Oct 2023 18:07:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7602C42E94;
	Sun, 29 Oct 2023 18:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7602C42E94
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3582AC0039;
	Sun, 29 Oct 2023 18:07:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0917BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8D4842E94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D4842E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzIuEKd4jp9K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:07:00 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A512E42E1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 18:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A512E42E1A
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B2F87536;
 Sun, 29 Oct 2023 18:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B2F87536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1698602819; bh=qIHDyKkopnQk5jaueVw4/Cpsh6Nvtzh18mcc6IGeFIA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=e3Ell2VpBQ5K/S8C4newIzNhefdaaZLAqPAUAwH7Fi4SUsfpMJ0rYXyavrgkchcLz
 1JZOUV594qmOACyFNMAxTdbYYVDgNjvuKkTeIY14OR3UYZXQdYIXA6MKaPSxBKGujs
 jKTo5it+G6jLKejsvWsIZoNQGc3BqV+PclbJn6cJ3edfZeJ+g2RkKnZOZZSnynSVAq
 rhRvDCfUA9zPMKFlxDtJTGvDFesBHkkDVgcWx/muR0srjRUVa0OIRCdPM4fSoCAtib
 NmbFRcj+W8sbXSKQjgka+wovHkYk1Nz4n2uBKhTli+s2tY7rC7cLVc3uC/3ASKrzHt
 T/IWnteCsyiOA==
From: Jonathan Corbet <corbet@lwn.net>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 yujie.liu@intel.com, linux-doc@vger.kernel.org,
 swarupkotikalapudi@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] scripts/kernel-doc: fix make htmldoc warning
In-Reply-To: <20231028182231.123996-1-swarupkotikalapudi@gmail.com>
References: <20231028182231.123996-1-swarupkotikalapudi@gmail.com>
Date: Sun, 29 Oct 2023 12:06:58 -0600
Message-ID: <87a5s15mm5.fsf@meer.lwn.net>
MIME-Version: 1.0
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

Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com> writes:

> make htmldocs has below warnings:
>
> ..
> Variable length lookbehind is experimental in regex;
> marked by <-- HERE in m/(?<=^|\s)-Werror(?=$|\s)
> <-- HERE / at ./scripts/kernel-doc line 188.
> ...

So how do you get this warning?  I've not seen it.  Which version of
Perl? 

> "-Werror" option in make command,
> needs "-Werror" to have space before
> and after while running make command,
> hence space checking is sepratly done,
> and is not part of lookbehind regular expression.
>
> Below command also didn't
> show any error:
>  make KCFLAGS="-Werror=return-type" W=1 kernel/fork.o
>
> Fixes: 91f950e8b9d8 ("scripts/kernel-doc: match -Werror flag strictly")
> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index d660e1f4b483..aa9e3e198d12 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
>  if (defined($ENV{'KCFLAGS'})) {
>  	my $kcflags = "$ENV{'KCFLAGS'}";
>  
> -	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
> +	if ($kcflags =~ /(?<=^|)(\s)-Werror(?=$|)(\s)/) {
>  		$Werror = 1;
>  	}
>  }

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
