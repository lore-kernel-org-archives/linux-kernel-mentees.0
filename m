Return-Path: <SRS0=GqCC=2J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34A8C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Dec 2019 17:00:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A9124676
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Dec 2019 17:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A9124676
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9528887F8C;
	Thu, 19 Dec 2019 17:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ELljC3659vn; Thu, 19 Dec 2019 17:00:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7161787EDB;
	Thu, 19 Dec 2019 17:00:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58488C1AE8;
	Thu, 19 Dec 2019 17:00:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AFD3C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 80927886AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkWMgmAgmOiE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:00:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C15F687C7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:00:27 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id F41BF2E5;
 Thu, 19 Dec 2019 17:00:26 +0000 (UTC)
Date: Thu, 19 Dec 2019 10:00:25 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191219100025.255003e6@lwn.net>
In-Reply-To: <20191121130605.29074-1-dwlsalmeida@gmail.com>
References: <20191121130605.29074-1-dwlsalmeida@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, hirofumi@mail.parknet.co.jp,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] Documentation: filesystems:
	convert vfat.txt to RST
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

On Thu, 21 Nov 2019 10:06:05 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Converts vfat.txt to the reStructuredText format, improving presentation
> without changing the underlying content.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> -----------------------------------------------------------
> Changes in v2:
> Refactored long lines as pointed out by Jonathan
> Copied the maintainer
> Updated the reference in the MAINTAINERS file for vfat
> 
> I did not move this into admin-guide, waiting on what the 
> maintainer has to say about this and also about old sections
> in the text, if any.

This one, too, could user a bit less markup, and more consistent markup.
If you have to mark up literal text, for example, it should be ``literal``,
not *emphasis*.  But please think about whether it needs marking up at all.

I have one other thing here, that could use input from the vfat maintainer:

[...]

> +BUG REPORTS
> +===========
> +If you have trouble with the *VFAT* filesystem, mail bug reports to
> +chaffee@bmrc.cs.berkeley.edu.
> +
> +Please specify the filename and the operation that gave you trouble.
> +
> +TEST SUITE
> +==========
> +If you plan to make any modifications to the vfat filesystem, please
> +get the test suite that comes with the vfat distribution at
> +
> +`<http://web.archive.org/web/*/http://bmrc.berkeley.edu/people/chaffee/vfat.html>`_
> +
> +This tests quite a few parts of the vfat filesystem and additional
> +tests for new features or untested features would be appreciated.

What are the chances that the above email address works at all, especially
given that the associated web page has to be dug out of the wayback
machine?  We should really try to avoid perpetuating obviously wrong
information when we can.  Hirofumi, do you have any thoughts on what might
replace this section?

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
