Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2576FC43464
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 14:44:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E77B21741
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 14:44:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvAmBzz4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E77B21741
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4702D20494;
	Sat, 19 Sep 2020 14:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8psiRnyJeGu; Sat, 19 Sep 2020 14:44:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7805220464;
	Sat, 19 Sep 2020 14:44:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F766C088B;
	Sat, 19 Sep 2020 14:44:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A9A9C1AD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 14:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 249DA8738F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 14:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QotmGJSIE6BX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 14:44:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4EAD987378
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 14:44:24 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B8912098B;
 Sat, 19 Sep 2020 14:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600526663;
 bh=Bxl5ZkjXMp2TPSkn3hGdRJLWXUhCroTIN94qZJ785hM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HvAmBzz4j84+nW2I/6iTGG7u+tu/+fVFlTymgUy9x48ZHF94OcJYcK3VRxYLyYTyb
 gLdVK3Jz7CFYgGvvk2LFTH6hxIvgXGihiig+gwgxNnILZPGg1qc84/ZJiaXzrUMjzZ
 9BfhiCQpyntL37/8AEdpoY9xJH4Lfe+mv81k+IoQ=
Date: Sat, 19 Sep 2020 16:44:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20200919144451.GF2712238@kroah.com>
References: <20200916052657.18683-1-anant.thazhemadam@gmail.com>
 <20200916054157.GC825@sol.localdomain>
 <20200917002238.GO3421308@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917002238.GO3421308@ZenIV.linux.org.uk>
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 syzbot+4191a44ad556eacc1a7a@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: fix KMSAN uninit-value bug
 by initializing nd in do_file_open_root
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

On Thu, Sep 17, 2020 at 01:22:38AM +0100, Al Viro wrote:
> On Tue, Sep 15, 2020 at 10:41:57PM -0700, Eric Biggers wrote:
> 
> > Looking at the actual KMSAN report, it looks like it's nameidata::dir_mode or
> > nameidata::dir_uid that is uninitialized.  You need to figure out the correct
> > solution, not just blindly initialize with zeroes -- that could hide a bug.
> > Is there a bug that is preventing these fields from being initialized to the
> > correct values, are these fields being used when they shouldn't be, etc...
> 
> False positive, and this is the wrong place to shut it up.
> 
> ->dir_uid and ->dir_mode are set when link_path_walk() resolves the pathname
> to directory + final component.  They are used when deciding whether to reject
> a trailing symlink (on fs.protected_symlinks setups) and whether to allow
> creation in sticky directories (on fs.protected_regular and fs.protected_fifos
> setups).  Both operations really need the results of successful link_path_walk().
> 
> I don't see how that could be not a false positive.  If we hit the use in
> may_create_in_sticky(), we'd need the combination of
> 	* pathname that consists only of slashes (or it will be initialized)
> 	* LAST_NORM in nd->last_type, which is flat-out impossible, since
> we are left with LAST_ROOT for such pathnames.  The same goes for
> may_follow_link() use - we need WALK_TRAILING in flags to hit it in the
> first place, which can come from two sources -
>         return walk_component(nd, WALK_TRAILING);
> in lookup_last() (and walk_component() won't go anywhere near the
> call chain leading to may_follow_link() without LAST_NORM in nd->last_type)
> and
>         res = step_into(nd, WALK_TRAILING, dentry, inode, seq);
> in open_last_lookups(), which also won't go anywhere near that line without
> LAST_NORM in the nd->last_type.
> 
> IOW, unless we manage to call that without having called link_path_walk()
> at all or after link_path_walk() returning an error, we shouldn't hit
> that.  And if we *do* go there without link_path_walk() or with an error
> from link_path_walk(), we have a much worse problem.
> 
> I want to see the details of reproducer.  If it's for real, we have a much
> more serious problem; if it's a false positive, the right place to deal
> with it would be elsewhere (perhaps on return from link_path_walk() with
> a slashes-only pathname), but in any case it should only be done after we
> manage to understand what's going on.

Reproducer is pretty simple:
	https://syzkaller.appspot.com/text?tag=ReproC&x=13974b2f100000

Now if that is actually valid or not, I don't know...

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
