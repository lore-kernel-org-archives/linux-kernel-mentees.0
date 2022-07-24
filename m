Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCD4C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 15:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0280140C4F;
	Sun, 24 Jul 2022 15:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0280140C4F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=V1hr/UNi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvOPcLOkVPCm; Sun, 24 Jul 2022 15:54:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B5C7C400B9;
	Sun, 24 Jul 2022 15:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5C7C400B9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88B19C0035;
	Sun, 24 Jul 2022 15:54:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C27A6C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 15:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96C2C60AC3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 15:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96C2C60AC3
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=V1hr/UNi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yifv3ZFydDp8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 15:54:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42F8F60A78
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42F8F60A78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 15:54:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F279EB80D2C;
 Sun, 24 Jul 2022 15:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524B4C3411E;
 Sun, 24 Jul 2022 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658678085;
 bh=/UIhFasVDsu284cyUeg7xTTVzwT3e9W7ftFk8kfS56s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V1hr/UNinQvJiEBZ4rYIIgce1UdeQD0du5OQbHSvKh3PhYvMLnXb4q7rOgeB0ihdf
 DZZWUVn4DYRM/ROA3DhKFQrigI4pTTBeEWAPJ+T9z+7zF0wlYlhvVL5xFeTWSyjdyo
 Cm4EqGshnNXKe3ReBXEgmf3ygOeWn5n5iI2tldiY=
Date: Sun, 24 Jul 2022 17:54:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Subject: Re: [PATCH] ntfs: Ensure $Extend is a directory
Message-ID: <Yt1rQ8Ft5klOOENg@kroah.com>
References: <20220724132107.1163-1-soumya.negi97@gmail.com>
 <Yt1NVQEOC6Ki3eUI@kroah.com> <20220724153448.GA2608@Negi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724153448.GA2608@Negi>
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

On Sun, Jul 24, 2022 at 08:34:48AM -0700, Soumya Negi wrote:
> On Sun, Jul 24, 2022 at 03:47:01PM +0200, Greg KH wrote:
> > On Sun, Jul 24, 2022 at 06:21:07AM -0700, Soumya Negi wrote:
> > > Fixes Syzbot bug: kernel BUG in ntfs_lookup_inode_by_name
> > > https://syzkaller.appspot.com/bug?id=32cf53b48c1846ffc25a185a2e92e170d1a95d71
> > > 
> > > Check whether $Extend is a directory or not( for NTFS3.0+) while loading
> > > system files. If it isn't(as in the case of this bug where the mft record for
> > > $Extend contains a regular file), load_system_files() returns false.
> > 
> > Please wrap your changelog text at 72 columns like your editor asked you
> > to when writing this :)
> 
> I will correct the changelog(Don't think I can wrap the bug report
> link. Checkpatch will still give a warning. Is that okay?).

Yes, do not wrap links.

> > > Reported-by: syzbot+30b7f850c6d98ea461d2@syzkaller.appspotmail.com
> > > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > 
> > What commit caused this problem?  What Fixes: tag should go here?
> 
> I don't think this was caused by any specific commit.The $Extend
> directory check is not present in any previous releases. Syzbot has
> also not been able to produce a cause bisection for the bug. So no fixes
> tag(please correct me if I am wrong).
> 
> > Should it go to stable kernels?  If so, how far back?
> 
> Since the NTFS extension file was new to NTFS 3.0, perhaps the patch 
> should apply all the way back to the first release with NTFS3.0 support?

Yes, mark it there.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
