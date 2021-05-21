Return-Path: <SRS0=yYPO=KQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461FFC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 May 2021 06:49:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1BB6613D4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 May 2021 06:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1BB6613D4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C158E605ED;
	Fri, 21 May 2021 06:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_01DkZethWr; Fri, 21 May 2021 06:49:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id C124D605A6;
	Fri, 21 May 2021 06:49:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA699C000D;
	Fri, 21 May 2021 06:49:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D4C4C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 06:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B08F605BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 06:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iwERYXF-zCWQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 06:49:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49A47605A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 06:49:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 082B660724;
 Fri, 21 May 2021 06:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621579739;
 bh=wdYmfwdm4nzmPrxFS2YNbnS85Aq+b2coK+5qodudhVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I8k5NsQjBtZEB1VUmQrF9eBLUNFT+5AhYaJBK9tXorNi1FFT/CSZDXcaYFCT4SfVW
 lSs9KoWtwF2oFXL1Nmqq8vy/3B0mOLhGdmj2YuVNEXX87ofG2B/bbroESp82R7yBxa
 1k0fI7JTRdl7WZjke/bfPQ5axrfBEF/sWKsVD4wQ=
Date: Fri, 21 May 2021 08:48:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: aviral14112001 <shiv14112001@gmail.com>
Subject: Re: [PATCH] This commit fixes the following checkpatch.pl errors and
 warnings : >>ERROR: switch and case should be at the same indent +
 switch (whence) { +		case 1: [...] +		case 0: [...] + default:
Message-ID: <YKdX2FEsuyBkmqki@kroah.com>
References: <20210521054857.7784-1-shiv14112001@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210521054857.7784-1-shiv14112001@gmail.com>
Cc: shuah@kernal.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, viro@zeniv.linux.org.uk,
 linux-kernel@vger.kernel.org
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

On Fri, May 21, 2021 at 11:18:57AM +0530, aviral14112001 wrote:
> >>ERROR: code indent should use tabs where possible
> +                              void (*callback)(struct dentry *))$
> 
> >>WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
> +			printk(KERN_WARNING "%s: %s passed in a files array"
> 
> >>WARNING: break quoted strings at a space character
> +			printk(KERN_WARNING "%s: %s passed in a files array"
> +				"with an index of 1!\n", __func__,
> 
> >>WARNING: Symbolic permissions 'S_IRUSR | S_IWUSR' are not preferred. Consider using octal permissions '0600'.
> +	root->i_mode = S_IFDIR | S_IRUSR | S_IWUSR;
> 
> >>WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> +			loff_t pos, unsigned len, unsigned flags,
> 
> >>WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> +			loff_t pos, unsigned len, unsigned flags,
> 
> >>WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> +		unsigned from = pos & (PAGE_SIZE - 1);
> 
> >>WARNING: Block comments use a trailing */ on a separate line
> + * to set the attribute specific access operations. */
> 
> >>WARNING: Symbolic permissions 'S_IRUGO | S_IXUGO' are not preferred. Consider using octal permissions '0555'.
> +	inode->i_mode = S_IFDIR | S_IRUGO | S_IXUGO;
> 
> >>Several other warnings (WARNING: Missing a blank line after declarations)
> 
> Signed-off-by: aviral14112001 <shiv14112001@gmail.com>
> ---
>  fs/libfs.c | 66 ++++++++++++++++++++++++++++++------------------------
>  1 file changed, 37 insertions(+), 29 deletions(-)
> 

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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file, Documentation/SubmittingPatches
  for how to do this correctly.

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
