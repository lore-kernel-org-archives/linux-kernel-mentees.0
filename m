Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AA7C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Aug 2023 05:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B1EF60F00;
	Tue,  8 Aug 2023 05:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B1EF60F00
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=B9ZxvXh1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKsBijqjd4KZ; Tue,  8 Aug 2023 05:27:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 43A4B60BBA;
	Tue,  8 Aug 2023 05:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43A4B60BBA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 170AAC0072;
	Tue,  8 Aug 2023 05:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36BB4C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 05:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F13CB40923
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 05:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F13CB40923
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=B9ZxvXh1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxAKGIT2jmAR
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 05:27:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C72474091E
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 05:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C72474091E
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AEE66239A;
 Tue,  8 Aug 2023 05:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47730C433C7;
 Tue,  8 Aug 2023 05:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691472425;
 bh=S9P0wt9/UV+bZwCnIUc+wtbpz2FzSntM/auL0J/PicU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9ZxvXh1Apn7cPVBgbYzQsJo5pXkygSx/IaWe63PMlz0D+HZ7IERKsmOoxOWPpL/D
 cgcCPx9EVmvp/8k9D8u/ZDWMLDhGjzcbJuqfZrjzCPBVxwR3q/o2D0dc/nHY1Vpwdj
 jg4WCJ6iFvYW2RfRUc0OLYPwu54K+JwG15UlimWs=
Date: Tue, 8 Aug 2023 07:27:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manas Ghandat <ghandatmanas@gmail.com>
Subject: Re: [PATCH] ntfs : fix shift-out-of-bounds in ntfs_iget
Message-ID: <2023080821-blandness-survival-44af@gregkh>
References: <20230808043404.9028-1-ghandatmanas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808043404.9028-1-ghandatmanas@gmail.com>
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Linux-kernel-mentees@lists.linuxfoundation.org,
 linkinjeon@kernel.org, anton@tuxera.com
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

On Tue, Aug 08, 2023 at 10:04:05AM +0530, Manas Ghandat wrote:
> Added a check to the compression_unit so that out of bound doesn't
> occur.
> 
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
> ---
>  fs/ntfs/inode.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 6c3f38d66579..2ee100a7df32 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -1077,6 +1077,17 @@ static int ntfs_read_locked_inode(struct inode *vi)
>  					goto unm_err_out;
>  				}
>  				if (a->data.non_resident.compression_unit) {
> +					if(a->data.non_resident.compression_unit + 
> +						vol->cluster_size_bits > 32) {
> +							ntfs_error(vi->i_sb, "Found "
> +								"non-standard "
> +								"compression unit (%u).   "
> +								"Cannot handle this.",

Please do not split strings across lines.

And checkpatch will find other problems with this change as well, did
you run it before submitting it.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
