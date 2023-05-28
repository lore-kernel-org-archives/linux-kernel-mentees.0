Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD43C7EE2E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 May 2023 06:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE108400D0;
	Sun, 28 May 2023 06:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE108400D0
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fa1SCm7T
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8fdsiMo_Y8d; Sun, 28 May 2023 06:58:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CCEAA400C1;
	Sun, 28 May 2023 06:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCEAA400C1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4C53C0036;
	Sun, 28 May 2023 06:58:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4E90C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 06:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89040608F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 06:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89040608F5
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=fa1SCm7T
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdeFruTn2wD7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 06:58:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF9D56079E
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF9D56079E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 06:58:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAC9B60B95;
 Sun, 28 May 2023 06:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CEBC433D2;
 Sun, 28 May 2023 06:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1685257106;
 bh=ULT0MUHPV6zX7gWbuYwDfef9KCFMMv1QSrnhRpZmcj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fa1SCm7T3Q5lK/lJrmqPV2lMY+4v5Rj5yfAZoiuD+1SfOC1ai00qLK9d1UQ6/P8rE
 km85mTgahwwEbBF4o8crePN4XyFIScPMKHU2QPtnAVsrQM51irFwYGgz6viuIzVJ9J
 AhJmqGFb7wmByVvKVNPlm2GBZAb06r81fz0xTYKI=
Date: Sun, 28 May 2023 07:58:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
Subject: Re: [PATCH] Null check to prevent null-ptr-deref bug
Message-ID: <2023052803-pucker-depress-5452@gregkh>
References: <000000000000cafb9305fc4fe588@google.com>
 <20230528012516.427126-1-princekumarmaurya06@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230528012516.427126-1-princekumarmaurya06@gmail.com>
Cc: brauner@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 chenzhongjin@huawei.com
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

On Sat, May 27, 2023 at 06:25:16PM -0700, Prince Kumar Maurya wrote:
> sb_getblk(inode->i_sb, parent) return a null ptr and taking lock on that leads to the null-ptr-deref bug.

Please wrap your changelog comments at 72 columns.

> Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
> ---
>  fs/sysv/itree.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/sysv/itree.c b/fs/sysv/itree.c
> index b22764fe669c..3a6b66e719fd 100644
> --- a/fs/sysv/itree.c
> +++ b/fs/sysv/itree.c
> @@ -145,6 +145,8 @@ static int alloc_branch(struct inode *inode,
>  		 */
>  		parent = block_to_cpu(SYSV_SB(inode->i_sb), branch[n-1].key);
>  		bh = sb_getblk(inode->i_sb, parent);
> +		if (!bh)
> +			break;

How have you tested this?  Have you reproduced this failure and has this
patch resolved the issue?  This function should never really fail in
normal operation, so it's odd that you were able to hit this somehow.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
