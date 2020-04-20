Return-Path: <SRS0=VNSv=6E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AEBC3815B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 06:56:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F0D21473
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 06:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BmjMl8Qf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28F0D21473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DA48087527;
	Mon, 20 Apr 2020 06:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHdsUxknBSgy; Mon, 20 Apr 2020 06:56:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B4BE87526;
	Mon, 20 Apr 2020 06:56:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60806C1D74;
	Mon, 20 Apr 2020 06:56:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8D56C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 06:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D069A87527
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 06:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MOrEBqxfQPnk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 06:56:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D31FA87526
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=X/v8Z0YkHiHsX9OtsVssmTwi5zmYAXyf+YH2GZxvCKY=; b=BmjMl8Qf3mmDrWUaea8RATT3R+
 f65Eqv5E1WshwMgCWCAAZeRR36Vz/+EPv0V+mTR+Phi+0tk6KDLIN9ENtqwJ3CXhkhYnFl+iKkpto
 MtGMJgidNqnpywWOnP0ILr9iNyvY8w9YP5qZV9rPEA6v0mb/LrQmic6L6lysUHOMjE9eCioYgKn59
 QjWaGuKKs09DTiLa4D0GrQ+Z8jIaiUPNZG6xfw253OcsUnsW8Fmr52IVWhzwv8rrrbFXMUtIyytmS
 hAGLqQMIPnOcdQwzoPuoVVOkmoxTpbeNdaL5RhSIZmvJXLvVshv8DBoSmRGPQuF9sWTwE98XFB9Tw
 LcV4qEgA==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216]
 helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQQMG-00031F-N9; Mon, 20 Apr 2020 06:56:45 +0000
Date: Mon, 20 Apr 2020 08:56:41 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <20200420085641.5d8f1a0b@coco.lan>
In-Reply-To: <445b3e38-123e-eb72-2bbb-c40ac4ea9899@gmail.com>
References: <445b3e38-123e-eb72-2bbb-c40ac4ea9899@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Clarification on the behaviour of
	checkpatch.pl
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

Em Mon, 20 Apr 2020 02:20:19 +0200
Saheed Bolarinwa <refactormyself@gmail.com> escreveu:

> Hello,
> 
> My experience is that checkpatch.pl will not flag some warnings when I use
> 
> the '-f' flag. This especially true for .rst files. My understanding is 
> that this flag
> 
> is needed to use it with a raw source file instead of a patch.
> 
> Please, I will like to confirm if this is a normal behaviour or is it my 
> system setup.
> 
> Below is an example from the current stable release linux-5.6.y
> 
>     [saheed@net linux-stable]$ perl ./scripts/checkpatch.pl -f
>     ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
>     total: 0 errors, 0 warnings, 279 lines checked
> 
>     ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst has no
>     obvious style problems and is ready for submission.
> 
> 
>     [saheed@net linux-stable]$ perl ./scripts/checkpatch.pl
>     ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
>     WARNING: Possible unwrapped commit description (prefer a maximum 75
>     chars per line)
>     #6:
>     TAA is a hardware vulnerability that allows unprivileged speculative
>     access to
> 
>     ERROR: Does not appear to be a unified-diff format patch
> 
>     total: 1 errors, 1 warnings, 0 lines checked

If you don't use "-f" flag, then you need to pass a patch to checkpatch,
e. g.:

	git show --pretty=email | ./scripts/checkpatch.pl

That's btw what you need to do with all patches you would submit upstream.

The "-f" flag is used only when you want to run a check on an entire file
(and not to the lines modified by a patch).


Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
