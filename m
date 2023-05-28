Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B6BC7EE31
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 May 2023 16:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B3E0417DC;
	Sun, 28 May 2023 16:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B3E0417DC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=s/8wAz3s
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3By5K8aD66F2; Sun, 28 May 2023 16:50:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1E016417CA;
	Sun, 28 May 2023 16:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E016417CA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 089D5C0036;
	Sun, 28 May 2023 16:50:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 750B6C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 16:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C2FE60B53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 16:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C2FE60B53
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=s/8wAz3s
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsnKcUWhyYEE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 16:50:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9209160B06
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9209160B06
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 May 2023 16:50:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B41E61799;
 Sun, 28 May 2023 16:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5878EC433EF;
 Sun, 28 May 2023 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1685292639;
 bh=csNksqn/IdsviUBpssSbOkgkznb1eomYoKzxxWPxXvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s/8wAz3s/NIbEVuUVe4auP8X8yIp3cfY5fJDYhCU5fNmk0m4t7q63GrtImgw88+9p
 +5QiBzON7VaEyv7zEVmZs9R5slJAEjY8X1cUCwHI/pHtMxTYit4uIwrDhSK1l4ngXt
 ZqpK/T5M7yKDf+FzVYQ68rSWzEYIgl2WT73wMWgs=
Date: Sun, 28 May 2023 17:46:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
Subject: Re: [PATCH] Null check to prevent null-ptr-deref bug
Message-ID: <2023052822-mauve-gauging-0ab3@gregkh>
References: <000000000000cafb9305fc4fe588@google.com>
 <20230528164400.592092-1-princekumarmaurya06@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230528164400.592092-1-princekumarmaurya06@gmail.com>
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

On Sun, May 28, 2023 at 09:44:00AM -0700, Prince Kumar Maurya wrote:
> sb_getblk(inode->i_sb, parent) return a null ptr and taking lock on that leads to the null-ptr-deref bug.
> 
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
>  		lock_buffer(bh);
>  		memset(bh->b_data, 0, blocksize);
>  		branch[n].bh = bh;
> -- 
> 2.40.1

Why resend this when I already responded:
	https://lore.kernel.org/r/2023052803-pucker-depress-5452@gregkh

confused,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
