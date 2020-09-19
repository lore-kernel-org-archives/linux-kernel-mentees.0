Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A727C43463
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 16:17:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F0A208DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 16:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24F0A208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A2B3A2042E;
	Sat, 19 Sep 2020 16:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Jlw0VrqW4bF; Sat, 19 Sep 2020 16:17:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8DBA720379;
	Sat, 19 Sep 2020 16:17:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 825DCC088B;
	Sat, 19 Sep 2020 16:17:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81CB0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 16:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7069B86F80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 16:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vBf7fXVGV0z5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 16:17:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 02B0886F88
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 16:17:37 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kJfYF-001pPE-5f; Sat, 19 Sep 2020 16:17:27 +0000
Date: Sat, 19 Sep 2020 17:17:27 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200919161727.GG3421308@ZenIV.linux.org.uk>
References: <20200916052657.18683-1-anant.thazhemadam@gmail.com>
 <20200916054157.GC825@sol.localdomain>
 <20200917002238.GO3421308@ZenIV.linux.org.uk>
 <20200919144451.GF2712238@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200919144451.GF2712238@kroah.com>
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

On Sat, Sep 19, 2020 at 04:44:51PM +0200, Greg KH wrote:

> > ->dir_uid and ->dir_mode are set when link_path_walk() resolves the pathname
> > to directory + final component.  They are used when deciding whether to reject
> > a trailing symlink (on fs.protected_symlinks setups) and whether to allow
> > creation in sticky directories (on fs.protected_regular and fs.protected_fifos
> > setups).  Both operations really need the results of successful link_path_walk().
> > 
> > I don't see how that could be not a false positive.  If we hit the use in
> > may_create_in_sticky(), we'd need the combination of
> > 	* pathname that consists only of slashes (or it will be initialized)
> > 	* LAST_NORM in nd->last_type, which is flat-out impossible, since
> > we are left with LAST_ROOT for such pathnames.  The same goes for
> > may_follow_link() use - we need WALK_TRAILING in flags to hit it in the
> > first place, which can come from two sources -
> >         return walk_component(nd, WALK_TRAILING);
> > in lookup_last() (and walk_component() won't go anywhere near the
> > call chain leading to may_follow_link() without LAST_NORM in nd->last_type)
> > and
> >         res = step_into(nd, WALK_TRAILING, dentry, inode, seq);
> > in open_last_lookups(), which also won't go anywhere near that line without
> > LAST_NORM in the nd->last_type.
> > 
> > IOW, unless we manage to call that without having called link_path_walk()
> > at all or after link_path_walk() returning an error, we shouldn't hit
> > that.  And if we *do* go there without link_path_walk() or with an error
> > from link_path_walk(), we have a much worse problem.
> > 
> > I want to see the details of reproducer.  If it's for real, we have a much
> > more serious problem; if it's a false positive, the right place to deal
> > with it would be elsewhere (perhaps on return from link_path_walk() with
> > a slashes-only pathname), but in any case it should only be done after we
> > manage to understand what's going on.
> 
> Reproducer is pretty simple:
> 	https://syzkaller.appspot.com/text?tag=ReproC&x=13974b2f100000
> 
> Now if that is actually valid or not, I don't know...

Lovely...  That would get an empty path and non-directory for a starting
point, but it should end up with LAST_ROOT in nd->last_type.  Which should
not be able to reach the readers of those fields...  Which kernel had
that been on?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
