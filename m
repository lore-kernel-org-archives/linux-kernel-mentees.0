Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0E0C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 13:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6866761171;
	Sun, 24 Jul 2022 13:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6866761171
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2Ghi/sb6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZUw_3F_-0ms; Sun, 24 Jul 2022 13:47:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3318060F9B;
	Sun, 24 Jul 2022 13:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3318060F9B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E3F6C0035;
	Sun, 24 Jul 2022 13:47:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACAB2C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 13:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93B5542452
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 13:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93B5542452
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=2Ghi/sb6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUOvMr3kqp1v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 13:47:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C63C4243B
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C63C4243B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 13:47:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5759E610A7;
 Sun, 24 Jul 2022 13:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602DFC3411E;
 Sun, 24 Jul 2022 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658670426;
 bh=8MUfeClKGcKn3AqtGfuecf9P0aJoL5wTpMq5gBsfuvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2Ghi/sb6AHNs2SquAR9Zh7Y7LO1D/OeY3BGMpz33m8NNcKtoolVFdRiD4t6N/004p
 R/XDf0DHzUC5G4Sii/M8dxBlGehzszPiUg5u20gMTo5b1kDOuyUBSZwpsl1b6si49G
 0OBZWffxDOpYQSPA8z3cCYnEe0P1SrZ6NgLlFhwM=
Date: Sun, 24 Jul 2022 15:47:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Subject: Re: [PATCH] ntfs: Ensure $Extend is a directory
Message-ID: <Yt1NVQEOC6Ki3eUI@kroah.com>
References: <20220724132107.1163-1-soumya.negi97@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724132107.1163-1-soumya.negi97@gmail.com>
Cc: linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Anton Altaparmakov <anton@tuxera.com>
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

On Sun, Jul 24, 2022 at 06:21:07AM -0700, Soumya Negi wrote:
> Fixes Syzbot bug: kernel BUG in ntfs_lookup_inode_by_name
> https://syzkaller.appspot.com/bug?id=32cf53b48c1846ffc25a185a2e92e170d1a95d71
> 
> Check whether $Extend is a directory or not( for NTFS3.0+) while loading
> system files. If it isn't(as in the case of this bug where the mft record for
> $Extend contains a regular file), load_system_files() returns false.

Please wrap your changelog text at 72 columns like your editor asked you
to when writing this :)

> 
> Reported-by: syzbot+30b7f850c6d98ea461d2@syzkaller.appspotmail.com
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>

What commit caused this problem?  What Fixes: tag should go here?
Should it go to stable kernels?  If so, how far back?

> ---
>  fs/ntfs/super.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 5ae8de09b271..18e2902531f9 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -2092,10 +2092,15 @@ static bool load_system_files(ntfs_volume *vol)
>  	// TODO: Initialize security.
>  	/* Get the extended system files' directory inode. */
>  	vol->extend_ino = ntfs_iget(sb, FILE_Extend);
> -	if (IS_ERR(vol->extend_ino) || is_bad_inode(vol->extend_ino)) {
> +	if (IS_ERR(vol->extend_ino) || is_bad_inode(vol->extend_ino) ||
> +	    !S_ISDIR(vol->extend_ino->i_mode)) {
> +		static const char *es1 = "$Extend is not a directory";
> +		static const char *es2 = "Failed to load $Extend";
> +		const char *es = !S_ISDIR(vol->extend_ino->i_mode) ? es1 : es2;
> +
>  		if (!IS_ERR(vol->extend_ino))
>  			iput(vol->extend_ino);
> -		ntfs_error(sb, "Failed to load $Extend.");
> +		ntfs_error(sb, "%s.", es);

Are you allowing the system log to be spammed by an untrusted user with
this change?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
