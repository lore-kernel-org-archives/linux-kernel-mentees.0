Return-Path: <SRS0=z0fH=5Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6ECC2D0EE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 22:50:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A006020714
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 22:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A006020714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C44186DFF;
	Tue, 31 Mar 2020 22:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKBMswxEO9Q0; Tue, 31 Mar 2020 22:50:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8EB6886DCD;
	Tue, 31 Mar 2020 22:50:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F041C1AE2;
	Tue, 31 Mar 2020 22:50:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B1EEC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2A172888D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uKEz+88f6egz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:49:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A1AB4888CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 22:49:58 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id F1393537;
 Tue, 31 Mar 2020 22:49:57 +0000 (UTC)
Date: Tue, 31 Mar 2020 16:49:56 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <20200331164956.0e10b87e@lwn.net>
In-Reply-To: <cover.1585693146.git.vitor@massaru.org>
References: <cover.1585693146.git.vitor@massaru.org>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/2] Documentation: Convert
	sysfs-pci to ReST
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

On Tue, 31 Mar 2020 19:28:55 -0300
Vitor Massaru Iha <vitor@massaru.org> wrote:

> Vitor Massaru Iha (2):
>   Documentation: filesystems: Convert sysfs-pci to ReST
>   Documentation: filesystems: remove whitespaces
> 
>  .../{sysfs-pci.txt => sysfs-pci.rst}          | 44 ++++++++++---------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>  rename Documentation/filesystems/{sysfs-pci.txt => sysfs-pci.rst} (81%)

Thanks for working on the documentation!  I do have a few comments...

The purpose for including a cover letter on a patch series is to explain
what the series as a whole is trying to accomplish.  Without that, it's
not all the helpful.

In this case, there is no real need for a series; just clean up that
trailing whitespace while doing the conversion.  (It *is* normally good
practice to separate such conversions from other changes, but that
particular change is trivial enough that you should just do it while
you're there).

When you convert a file to RST, you need to add it to the index.rst file
as well so that it can be a part of the documentation build.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
