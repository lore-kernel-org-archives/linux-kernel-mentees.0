Return-Path: <SRS0=MxuE=4T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E92C3F2D7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 17:45:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9262214DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 17:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9262214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A8F98204B1;
	Mon,  2 Mar 2020 17:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIY4fHgMqEkk; Mon,  2 Mar 2020 17:45:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E0A6D20108;
	Mon,  2 Mar 2020 17:45:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB0F3C1AE2;
	Mon,  2 Mar 2020 17:45:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3BEDC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9D0422045D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pa5cv4Z+M+E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:45:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by silver.osuosl.org (Postfix) with ESMTPS id C402920108
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:45:03 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id E5E922E4;
 Mon,  2 Mar 2020 17:45:02 +0000 (UTC)
Date: Mon, 2 Mar 2020 10:45:01 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Pragat Pandya <pragat.pandya@gmail.com>
Message-ID: <20200302104501.0f9987bb@lwn.net>
In-Reply-To: <20200302173920.24626-2-pragat.pandya@gmail.com>
References: <20200302173920.24626-1-pragat.pandya@gmail.com>
 <20200302173920.24626-2-pragat.pandya@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] Documentation: Add a new
 .rst file under Documentation
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

On Mon,  2 Mar 2020 23:09:19 +0530
Pragat Pandya <pragat.pandya@gmail.com> wrote:

Thanks for working to make the documentation better.  A few comments,
though...  To begin with, please give a more descriptive subject line; any
time you have multiple patches with the same subject line you should be
seeing an indicator that you're not giving enough information there.

> Add io_mapping.rst under Documentation and reference it in TOCTree of
> index.rst to include it in html documentation.

You're not adding a file, you're renaming an existing file; say that.
> 
> Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
> ---
>  Documentation/index.rst                       |   1 +
>  .../{io-mapping.txt => io_mapping.rst}        |   0
>  doc_make.log                                  | 372 ++++++++++++++++++

This doc_make.log file certainly doesn't belong here; please look
carefully at your patches before sending them.

>  3 files changed, 373 insertions(+)
>  rename Documentation/{io-mapping.txt => io_mapping.rst} (100%)
>  create mode 100644 doc_make.log
> 
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index e99d0bd2589d..14670f2eaa33 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -141,6 +141,7 @@ Architecture-agnostic documentation
>     :maxdepth: 2
>  
>     asm-annotations
> +   io_mapping

Is there a reason you changed the name (io-mapping to io_mapping)?  If so,
you should explain it.

Finally, this document really doesn't belong in the top level.  Please
move it into the driver-api manual.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
