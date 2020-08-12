Return-Path: <SRS0=//YW=BW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061C2C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 08:18:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C64D220774
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 08:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoTbN6qb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C64D220774
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9D7A5227A3;
	Wed, 12 Aug 2020 08:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dUWz2t26xNc; Wed, 12 Aug 2020 08:18:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C087F204C1;
	Wed, 12 Aug 2020 08:18:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6125C07FF;
	Wed, 12 Aug 2020 08:18:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC383C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 08:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B6F4E878C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 08:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-3eSPA2bCJu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 08:18:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2AFFA81DC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 08:18:43 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5255620774;
 Wed, 12 Aug 2020 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597220322;
 bh=DZe4rDhjzxljBRgO7VQ+ytJ53LFjK1MMm84lYaTTDBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aoTbN6qbRHC8oLTWGWsg1IOq4qT55TJQzev+Ml+0+6WYL2d5Rr5res40LMxOW9Stk
 h6SlHs3E9bKMCM42TIdi3JvHICDxpR9+DIqlAw1cQrvA7JDwU6hA1GtOEVR1FymycK
 dmyF1wg1RL7LMKxfQKwABHqtuEwdM/q+lI94p+ww=
Date: Wed, 12 Aug 2020 10:18:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200812081852.GA851575@kroah.com>
References: <20200812065556.869508-1-yepeilin.cs@gmail.com>
 <20200812070827.GA1304640@kroah.com> <20200812071306.GA869606@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812071306.GA869606@PWN>
Cc: linux-fsdevel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] hfs,
 hfsplus: Fix NULL pointer dereference in hfs_find_init()
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

On Wed, Aug 12, 2020 at 03:13:06AM -0400, Peilin Ye wrote:
> On Wed, Aug 12, 2020 at 09:08:27AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Aug 12, 2020 at 02:55:56AM -0400, Peilin Ye wrote:
> > > Prevent hfs_find_init() from dereferencing `tree` as NULL.
> > > 
> > > Reported-and-tested-by: syzbot+7ca256d0da4af073b2e2@syzkaller.appspotmail.com
> > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > > ---
> > >  fs/hfs/bfind.c     | 3 +++
> > >  fs/hfsplus/bfind.c | 3 +++
> > >  2 files changed, 6 insertions(+)
> > > 
> > > diff --git a/fs/hfs/bfind.c b/fs/hfs/bfind.c
> > > index 4af318fbda77..880b7ea2c0fc 100644
> > > --- a/fs/hfs/bfind.c
> > > +++ b/fs/hfs/bfind.c
> > > @@ -16,6 +16,9 @@ int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd)
> > >  {
> > >  	void *ptr;
> > >  
> > > +	if (!tree)
> > > +		return -EINVAL;
> > > +
> > >  	fd->tree = tree;
> > >  	fd->bnode = NULL;
> > >  	ptr = kmalloc(tree->max_key_len * 2 + 4, GFP_KERNEL);
> > > diff --git a/fs/hfsplus/bfind.c b/fs/hfsplus/bfind.c
> > > index ca2ba8c9f82e..85bef3e44d7a 100644
> > > --- a/fs/hfsplus/bfind.c
> > > +++ b/fs/hfsplus/bfind.c
> > > @@ -16,6 +16,9 @@ int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd)
> > >  {
> > >  	void *ptr;
> > >  
> > > +	if (!tree)
> > > +		return -EINVAL;
> > > +
> > 
> > How can tree ever be NULL in these calls?  Shouldn't that be fixed as
> > the root problem here?
> 
> I see, I will try to figure out what is going on with the reproducer.

That's good to figure out.  Note, your patch might be the correct thing
to do, as that might be an allowed way to call the function.  But in
looking at all the callers, they seem to think they have a valid pointer
at the moment, so perhaps if this check is added, some other root
problem is papered over to be only found later on?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
