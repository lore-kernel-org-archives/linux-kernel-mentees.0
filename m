Return-Path: <SRS0=DeHd=KT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5370DC04FF3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 May 2021 16:07:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2BD56128D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 May 2021 16:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2BD56128D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB59940001;
	Mon, 24 May 2021 16:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPT9KBOf4hR7; Mon, 24 May 2021 16:07:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEFA240268;
	Mon, 24 May 2021 16:07:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5FE5C000D;
	Mon, 24 May 2021 16:07:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9385C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 16:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0F1740281
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 16:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNFOB0q6AN9M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 16:07:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A6FC40001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 16:07:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37EAC613F9;
 Mon, 24 May 2021 16:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621872434;
 bh=jPw+QKOWI6o1RGgUT4n/9FHwCr3VTPV+8kFU79WZUNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5Zz3fwSVx+0sa+hmuUjzdHOjPiPAWyzRG0V24dTyJSVBJlvEm32SfvaU/Xp+LP2e
 nHp8kehBSRokBS5IJ1gWNRHfwJaoGwMc6x8Fmrx+SYFdgQLeBAzYeRT4O1cR7RClJO
 XyGBVzwCnD13lvCvDjDfNPDUHIa8slYTJ76J1si0=
Date: Mon, 24 May 2021 18:07:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aviral Gupta <shiv14112001@gmail.com>
Subject: Re: [PATCH] This patch fixes the warning generated due to use of
 symbolic
Message-ID: <YKvPMFuZYn/ypSP1@kroah.com>
References: <20210524155705.5138-1-shiv14112001@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524155705.5138-1-shiv14112001@gmail.com>
Cc: axboe@kernel.dk, richard.peng@oppo.com, ulf.hansson@linaro.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 adrian.hunter@intel.com, guoqing.jiang@cloud.ionos.com, satyat@google.com,
 avri.altman@wdc.com, linux-kernel-mentees@lists.linuxfoundation.org,
 beanhuo@micron.com
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

On Mon, May 24, 2021 at 09:27:06PM +0530, Aviral Gupta wrote:
> It's better to use octal permissons instead of symbolic ones because  peoples are more
> familiar with octal permissons.
> WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> +	md->force_ro.attr.mode = S_IRUGO | S_IWUSR;
> 
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> +			mode = S_IRUGO;
> 
> WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> +			mode = S_IRUGO | S_IWUSR;
> 
> WARNING: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
> +			debugfs_create_file("ext_csd", S_IRUSR, root, card,
> 
> Signed-off-by: Aviral Gupta <shiv14112001@gmail.com>
> ---
>  drivers/mmc/core/block.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)


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

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

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
