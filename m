Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E28AC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Aug 2023 17:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DD7083FBD;
	Thu, 10 Aug 2023 17:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DD7083FBD
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wIK/zj2S
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JuoRNXfSnGR; Thu, 10 Aug 2023 17:32:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5C48381253;
	Thu, 10 Aug 2023 17:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C48381253
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45F21C0071;
	Thu, 10 Aug 2023 17:32:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4512BC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 17:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B6E341D93
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 17:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B6E341D93
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=wIK/zj2S
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3snXb82HMHzn
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 17:32:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D933241D92
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 17:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D933241D92
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C320665957;
 Thu, 10 Aug 2023 17:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F11C433C8;
 Thu, 10 Aug 2023 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691688730;
 bh=jqKPlFDYzdL8CJp3TA+4twzklky0wW7cWmS7m81wH+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wIK/zj2SRsqJMsUjc8U5fOPZna2hBCpa6VhGWa1RTzraVJdrpH06+zrTRa8s9FwWd
 lDp9xMCp9LptZ1R++ywSKldAbIZCYW+mW82qZvhO+ukEgP0faf99pAx7cmbT8YCpRR
 K4ikjzLtlOJTE3grhFYBb/zdgTM1vH/Xtbj0AKt8=
Date: Thu, 10 Aug 2023 19:32:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manas Ghandat <ghandatmanas@gmail.com>
Subject: Re: [PATCH v3] ntfs : fix shift-out-of-bounds in ntfs_iget
Message-ID: <2023081050-extent-footsie-66c9@gregkh>
References: <2023080811-populace-raven-96d2@gregkh>
 <20230810161308.8577-1-ghandatmanas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810161308.8577-1-ghandatmanas@gmail.com>
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

On Thu, Aug 10, 2023 at 09:43:08PM +0530, Manas Ghandat wrote:
> Added a check to the compression_unit so that out of bound doesn't occur.

This probably needs more text to describe what is happening.


> 
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> Reported-by: syzbot+4768a8f039aa677897d0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=4768a8f039aa677897d0

What commit id does this fix?  Should it go to stable kernels?


> ---
> V2 -> V3: Fix patching issue.
> V1 -> V2: Cleaned up coding style.
> 
>  fs/ntfs/inode.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 6c3f38d66579..a657322874ed 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -1077,6 +1077,15 @@ static int ntfs_read_locked_inode(struct inode *vi)
>  					goto unm_err_out;
>  				}
>  				if (a->data.non_resident.compression_unit) {
> +					if (a->data.non_resident.compression_unit +
> +						vol->cluster_size_bits > 32) {

Should be indented a bit left, right?

> +						ntfs_error(vi->i_sb,
> +							"Found non-standard compression unit (%u).   Cannot handle this.",

Why all the extra ' ' characters?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
