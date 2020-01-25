Return-Path: <SRS0=HsuC=3P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7D3C35247
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jan 2020 07:43:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6B9F20842
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jan 2020 07:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUnjdjSi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6B9F20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 98ACC8790D;
	Sun, 26 Jan 2020 07:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0fd9W12a9wv; Sun, 26 Jan 2020 07:43:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0CFB687884;
	Sun, 26 Jan 2020 07:43:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFC51C1D80;
	Sun, 26 Jan 2020 07:43:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37DC6C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jan 2020 07:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2837C2044A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jan 2020 07:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYxR+Nyn2RnM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jan 2020 07:42:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 5E24F20449
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jan 2020 07:42:59 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84A662071E;
 Sun, 26 Jan 2020 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580024579;
 bh=UcAPO1fkxYC4ytyKX1oTy8cKaRy2y2XXPJoZZhR3HRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MUnjdjSiO+93K2gosmx9muHilww8DDnIaDl1yb9MgidpGc7L+ryjgf5HzNKDBiUwL
 28mGAvCoph4j5xoP/y1tqIvdGLc/UaMxw1rKvSKnmoch64U/bSAqIdVM+FK1gd2MLO
 Sr7HJFObHfskjwzYafH+gR+IPkCGl5HML8cEdnrQ=
Date: Sat, 25 Jan 2020 14:38:14 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Pragat Pandya <pragat.pandya@gmail.com>
Message-ID: <20200125133814.GA3518118@kroah.com>
References: <7278a1cb979cd574bccbbbccaf1a9c90acd514b5.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7278a1cb979cd574bccbbbccaf1a9c90acd514b5.camel@gmail.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "valdis.kletnieks@vt.edu" <valdis.kletnieks@vt.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 ppandya2103@gmail.com,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RESEND PATCH] staging: exfat: Fix
	alignment warnings
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

On Sat, Jan 25, 2020 at 05:49:48PM +0530, Pragat Pandya wrote:
> Fix checkpatch warning "Alignment should match open parenthesis".
> 
> Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
> ---
>  drivers/staging/exfat/exfat_blkdev.c |  4 ++--
>  drivers/staging/exfat/exfat_core.c   | 29 ++++++++++++++--------------
>  drivers/staging/exfat/exfat_super.c  |  2 +-
>  3 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/exfat/exfat_blkdev.c
> b/drivers/staging/exfat/exfat_blkdev.c
> index 7bcd98b13109..3068bfda39e4 100644
> --- a/drivers/staging/exfat/exfat_blkdev.c
> +++ b/drivers/staging/exfat/exfat_blkdev.c
> @@ -31,7 +31,7 @@ void exfat_bdev_close(struct super_block *sb)
>  }
>  
>  int exfat_bdev_read(struct super_block *sb, sector_t secno, struct
> buffer_head **bh,
> -             u32 num_secs, bool read)
> +                   u32 num_secs, bool read)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
