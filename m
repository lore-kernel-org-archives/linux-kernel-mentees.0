Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF64CC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jul 2022 16:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A90F422AD;
	Tue, 26 Jul 2022 16:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A90F422AD
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pPEOsM58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZhxNx3TeQ8z; Tue, 26 Jul 2022 16:40:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 46A8B41BE3;
	Tue, 26 Jul 2022 16:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46A8B41BE3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CF92C0035;
	Tue, 26 Jul 2022 16:40:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7765AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 16:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 518E241198
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 16:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 518E241198
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=pPEOsM58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lej7iVPcnsI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 16:40:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 679334014B
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 679334014B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 16:40:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32A04615FB;
 Tue, 26 Jul 2022 16:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DECC433D6;
 Tue, 26 Jul 2022 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658853621;
 bh=SqugJWMS0G3TH6g4CPPFAQmpuiXRP4YIautk74KGKR8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pPEOsM587tS/xIay3ZUHlfGxy9/L4Znb20on1v4gJRiMyCq4/x/GhieD6rjJ8T6EY
 PR2oXMu68VV0nqkMf8HNX03jqgs2xo7+wLhpdmwU9hEzKdvZI7jSKZeVAvFgijQs2S
 lY1BJtR9LE2ByL28lHKroDNXMOtJZZygVa8W4NiA=
Date: Tue, 26 Jul 2022 18:40:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Subject: Re: [PATCH] ntfs: Ensure $Extend is a directory
Message-ID: <YuAY82/guMFRnfHu@kroah.com>
References: <20220724132107.1163-1-soumya.negi97@gmail.com>
 <Yt1NVQEOC6Ki3eUI@kroah.com> <20220724153448.GA2608@Negi>
 <Yt1rQ8Ft5klOOENg@kroah.com> <20220724221745.GB2608@Negi>
 <20220725190656.GA14927@Negi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220725190656.GA14927@Negi>
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

On Mon, Jul 25, 2022 at 12:06:56PM -0700, Soumya Negi wrote:
> Hi,
> 
> On Sun, Jul 24, 2022 at 03:17:45PM -0700, Soumya Negi wrote:
> > On Sun, Jul 24, 2022 at 05:54:43PM +0200, Greg KH wrote:
> > > On Sun, Jul 24, 2022 at 08:34:48AM -0700, Soumya Negi wrote:
> > > > On Sun, Jul 24, 2022 at 03:47:01PM +0200, Greg KH wrote:
> > > > > On Sun, Jul 24, 2022 at 06:21:07AM -0700, Soumya Negi wrote:
> > > > > > Fixes Syzbot bug: kernel BUG in ntfs_lookup_inode_by_name
> > > > > > https://syzkaller.appspot.com/bug?id=32cf53b48c1846ffc25a185a2e92e170d1a95d71
> > > > > > 
> > > > > > Check whether $Extend is a directory or not( for NTFS3.0+) while loading
> > > > > > system files. If it isn't(as in the case of this bug where the mft record for
> > > > > > $Extend contains a regular file), load_system_files() returns false.
> > > > > 
> > > > > Please wrap your changelog text at 72 columns like your editor asked you
> > > > > to when writing this :)
> > > > 
> > > > I will correct the changelog(Don't think I can wrap the bug report
> > > > link. Checkpatch will still give a warning. Is that okay?).
> > > 
> > > Yes, do not wrap links.
> > > 
> > > > > > Reported-by: syzbot+30b7f850c6d98ea461d2@syzkaller.appspotmail.com
> > > > > > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > > > > 
> > > > > What commit caused this problem?  What Fixes: tag should go here?
> > > > 
> > > > I don't think this was caused by any specific commit.The $Extend
> > > > directory check is not present in any previous releases. Syzbot has
> > > > also not been able to produce a cause bisection for the bug. So no fixes
> > > > tag(please correct me if I am wrong).
> > > > 
> > > > > Should it go to stable kernels?  If so, how far back?
> > > > 
> > > > Since the NTFS extension file was new to NTFS 3.0, perhaps the patch 
> > > > should apply all the way back to the first release with NTFS3.0 support?
> > 
> > > Yes, mark it there.
> > 
> > Thanks. I will send v2 of the patch. Just want to make sure that the
> > patch will apply to 2.6.11.y before marking it.
> 
> 2.6.11 is where I think NTFS3.0 support was first present and till where
> the patch should go. But I am not able to build 2.6.11 on my system and
> test the patch. I tried the patch on 4.14 and it works. Should I mark it
> to be backported till 4.14 instead?

Say 4.9 and you will get an email saying it failed to apply there when
it gets merged into Linus's tree, and then you can provide a working
patch for us to add to stable.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
