Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CAEC77B7D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 07:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EF4E843A1;
	Wed, 10 May 2023 07:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF4E843A1
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HMuI5RNh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q-CEFmfsQn94; Wed, 10 May 2023 07:48:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DCC1B84347;
	Wed, 10 May 2023 07:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC1B84347
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4E3FC0036;
	Wed, 10 May 2023 07:48:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DAE9C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D848B8435E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D848B8435E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rotbkH86KjuW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:48:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C6A84347
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96C6A84347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:48:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7969962EDD;
 Wed, 10 May 2023 07:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB3EC433EF;
 Wed, 10 May 2023 07:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1683704898;
 bh=Q0YkIVrsYSiUntR8XUeUJQ9NKp/dYkedYevQTQb2i4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HMuI5RNh4+G6d5k8e8/2GKKF50cdI+G/tsR83FkbP+ja2j0Xs9BIkIVpMhH5WNQjO
 Xo6lT3ztyddPfAQyuOcCOH6nSRoVO+Rh8HI0sPw5pxHeKkm+Rf8uv/QDrxjqK0U+kq
 xXkz/fZAcQ6L7xjKi5wr/EAhvF8LlEu4aol4cUh8=
Date: Wed, 10 May 2023 09:48:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
Message-ID: <2023051052-recoil-headache-1594@gregkh>
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
Cc: axboe@kernel.dk, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, 42.hyeyoo@gmail.com, oswald.buddenhagen@gmx.de,
 surenb@google.com, linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, May 10, 2023 at 11:27:26AM +0400, Ivan Orlov wrote:
> Fix some obvious codestyle issues in the pcm_native.c file. Some of them
> were found by checkpatch with --strict option, and the others by just
> looking at the code. These issues include incorrect placement of brackets,
> trailing and starting spaces, wrong alignment of function arguments,
> incorrect multiline comments, using __attribute__((packed)) instead of just
> "__packed", comparison with null instead of using "!". Also, today we have
> 100 columns per line available, and I tried to reformat the file
> considering this.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>  sound/core/pcm_native.c | 696 +++++++++++++++++++---------------------
>  1 file changed, 323 insertions(+), 373 deletions(-)

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
