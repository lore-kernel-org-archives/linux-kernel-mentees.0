Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6DEC3DA79
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Dec 2022 20:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCEDC4031F;
	Thu, 29 Dec 2022 20:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCEDC4031F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FqKTBZPV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8p4csNY_qRZj; Thu, 29 Dec 2022 20:30:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 91339401FF;
	Thu, 29 Dec 2022 20:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91339401FF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68D98C0032;
	Thu, 29 Dec 2022 20:30:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A80EC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Dec 2022 20:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FB7B81455
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Dec 2022 20:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FB7B81455
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=FqKTBZPV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psE977t7dkUA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Dec 2022 20:30:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AB4C81322
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AB4C81322
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Dec 2022 20:30:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F22C617E3;
 Thu, 29 Dec 2022 20:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7502CC433EF;
 Thu, 29 Dec 2022 20:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672345837;
 bh=0XooJ9mP9l4J/Pq38WJ2Fm3KDYSSG/D++B3s60OVmcs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FqKTBZPVOV8UWlTk9+gSb7VxZIa9+2CnWxn0kauBH6+Q/AqaPoTocgFGzoAIX+cE0
 S3jWIAE4yg9z6RYCiKzT2ESGWmGthYRNOrZMTXSyiT2nSwtA4e6bq+fMDvmMuadvGw
 ewrnKIRUbtgSSs6lE0H1+6PcO2oHQZLz6KYA9rIquUEW7uZFEFBsyIHsDYjOnHUt/A
 OZbD0otttU1EYogIk27WWczmq+ynIWDbPBTTwDerbwqYop8JvLCDeCTv2xIP7dAnw9
 bV6ciTVTnDm6GjzSqI5ExvrzoNLDUPV3JqQLG1pWtjvo3Jsf6XCjvrBDCELjx4H1V9
 iil1tj388JOlQ==
Date: Thu, 29 Dec 2022 12:30:35 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Lizhi Xu <lizhi.xu@windriver.com>
Subject: Re: How can this fix prevent information from leaking to user space
 and prevent the kernel from crashing?
Message-ID: <Y63464YEo30Ga/US@sol.localdomain>
References: <20210506185655.7118-1-mail@anirudhrb.com>
 <20221226143119.3719096-1-lizhi.xu@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221226143119.3719096-1-lizhi.xu@windriver.com>
Cc: akpm@osdl.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
 mail@anirudhrb.com, adilger.kernel@dilger.ca, shaggy@austin.ibm.com,
 syzbot+2dcfeaf8cb49b05e8f1a@syzkaller.appspotmail.com,
 linux-ext4@vger.kernel.org, alex@clusterfs.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Dec 26, 2022 at 10:31:19PM +0800, Lizhi Xu wrote:
> Hi, Anirudh Rayabharam
> 
> I verify this patch in the following environment, using reproducer: https://syzkaller.appspot.com/x/repro.c?x=122870ff800000
> 
> 1. kernel version:  kernel version 5.15.72 
> 2. gcc 11.3
> 3. libc 2.35
> 
> Because the kernel version 5.15.72 already contains this patch ce3aba43599f0b50adbebff133df8d08a3d5fffe, 
> So I deleted this patch to make a kernel image to reproduce the problem,
> On the other hand, I reserve this patch to verify that the problem has been fixed,
> The result of the experiment is that no matter whether this patch is applied or not, 
> this problem cannot be reproduced in kernel version 5.15.72.
> 
> In addition, I am also very confused. There are three places to initialize "eh_generation". 
> There is no other reference to the parameter "eh_generation" in all the source code of the kernel,
> At the same time, there is no indirect operation on the parameter "eh_generation" in reproducer,
> How can this fix prevent information from leaking to user space and prevent the kernel from crashing?
> 
> > diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
> > index 77c84d6f1af6..677d4821bcc1 100644
> > --- a/fs/ext4/extents.c
> > +++ b/fs/ext4/extents.c
> > @@ -825,6 +825,7 @@ void ext4_ext_tree_init(handle_t *handle, struct inode *inode)
> >  	eh->eh_entries = 0;
> >  	eh->eh_magic = EXT4_EXT_MAGIC;
> >  	eh->eh_max = cpu_to_le16(ext4_ext_space_root(inode, 0));
> > +	eh->eh_generation = 0;
> >  	ext4_mark_inode_dirty(handle, inode);
> >  }
> >  
> > @@ -1090,6 +1091,7 @@ static int ext4_ext_split(handle_t *handle, struct inode *inode,
> >  	neh->eh_max = cpu_to_le16(ext4_ext_space_block(inode, 0));
> >  	neh->eh_magic = EXT4_EXT_MAGIC;
> >  	neh->eh_depth = 0;
> > +	neh->eh_generation = 0;
> >  
> >  	/* move remainder of path[depth] to the new leaf */
> >  	if (unlikely(path[depth].p_hdr->eh_entries !=
> > @@ -1167,6 +1169,7 @@ static int ext4_ext_split(handle_t *handle, struct inode *inode,
> >  		neh->eh_magic = EXT4_EXT_MAGIC;
> >  		neh->eh_max = cpu_to_le16(ext4_ext_space_block_idx(inode, 0));
> >  		neh->eh_depth = cpu_to_le16(depth - i);
> > +		neh->eh_generation = 0;
> >  		fidx = EXT_FIRST_INDEX(neh);
> >  		fidx->ei_block = border;
> >  		ext4_idx_store_pblock(fidx, oldblock);

The information leak was that uninitialized memory was being written to disk.

The way this bug was detected is with KMSAN.  If your kernel does not have KMSAN
enabled, the reproducer will not appear to do anything.  Note that KMSAN
requires Linux v6.1 or later and clang v14.0.6 or later.

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
