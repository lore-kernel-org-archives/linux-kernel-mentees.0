Return-Path: <SRS0=i5R+=L7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B011AC07E9E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 17:52:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6800A61CCA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 17:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6800A61CCA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B7B360A59;
	Wed,  7 Jul 2021 17:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMQ5uq0GCxcA; Wed,  7 Jul 2021 17:52:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2A1A860A41;
	Wed,  7 Jul 2021 17:52:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07A07C001A;
	Wed,  7 Jul 2021 17:52:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49AC5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 17:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 378684069E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 17:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6SizaOXoGR3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 17:52:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C71640692
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 17:52:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13F9C61CC9;
 Wed,  7 Jul 2021 17:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625680361;
 bh=0lR4729f9P/882zNtreLofGnn2m3FKaP0j19x9aMerQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=BSdQ8upaUDekKIhSIHJwTcAOONN3U4vZZrEUYCupt3+Fma4HpY3bM7WZ24BPSJVkw
 wEtMlfNN3/J29vyoOvTFSC7zQvDHkoKqIkry/t+vic1tjC4Q2MK723m+U/vYTS06aD
 ozzInOEQBjeV7dcrGLkLaFPwpib2tf4a06KgE6FgvoAtcUb4EHKHMK6D0fsfXptrc0
 HUiH5rvfip2yd51SK3CQ2HbHMMonmCvY3udbRcJwDaeZ006egNxiC1uk2AGznSCZaM
 1KwRKXQySqgbT+ahoWpodEm1WKGnesxKuWZHodPN0ShmrJc3fG46+kvrTrVpaKPVPG
 IvmaK8TIXLg1Q==
Message-ID: <9da1ba4e8fa2fc86ebb8676bbe7e68e4008476c5.camel@kernel.org>
Subject: Re: [PATCH v2 1/2] fcntl: fix potential deadlocks for
 &fown_struct.lock
From: Jeff Layton <jlayton@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 07 Jul 2021 13:52:40 -0400
In-Reply-To: <YOXVb5z3W+T9El+g@casper.infradead.org>
References: <14633c3be87286d811263892375f2dfa9a8ed40a.camel@kernel.org>
 <YOWHKk6Nq8bazYjB@kroah.com>
 <4dda1cad6348fced5fcfcb6140186795ed07d948.camel@kernel.org>
 <20210707135129.GA9446@fieldses.org> <YOXDBZR2RSfiM+A3@kroah.com>
 <20210707151936.GB9911@fieldses.org> <YOXIuhma++oMbbiH@kroah.com>
 <20210707153417.GA10570@fieldses.org> <YOXMcJAZPms7Gp8a@kroah.com>
 <03748f0bf038826f879b4429441d5a0fa8331969.camel@kernel.org>
 <YOXVb5z3W+T9El+g@casper.infradead.org>
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
Cc: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, "J. Bruce Fields" <bfields@fieldses.org>,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
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

On Wed, 2021-07-07 at 17:25 +0100, Matthew Wilcox wrote:
> On Wed, Jul 07, 2021 at 12:18:45PM -0400, Jeff Layton wrote:
> > On Wed, 2021-07-07 at 17:46 +0200, Greg KH wrote:
> > > On Wed, Jul 07, 2021 at 11:34:17AM -0400, J. Bruce Fields wrote:
> > > > On Wed, Jul 07, 2021 at 05:31:06PM +0200, Greg KH wrote:
> > > > > On Wed, Jul 07, 2021 at 11:19:36AM -0400, J. Bruce Fields wrote:
> > > > > > On Wed, Jul 07, 2021 at 05:06:45PM +0200, Greg KH wrote:
> > > > > > > On Wed, Jul 07, 2021 at 09:51:29AM -0400, J. Bruce Fields wrote:
> > > > > > > > On Wed, Jul 07, 2021 at 07:40:47AM -0400, Jeff Layton wrote:
> > > > > > > > > On Wed, 2021-07-07 at 12:51 +0200, Greg KH wrote:
> > > > > > > > > > On Wed, Jul 07, 2021 at 06:44:42AM -0400, Jeff Layton wrote:
> > > > > > > > > > > On Wed, 2021-07-07 at 08:05 +0200, Greg KH wrote:
> > > > > > > > > > > > On Wed, Jul 07, 2021 at 10:35:47AM +0800, Desmond Cheong Zhi Xi wrote:
> > > > > > > > > > > > > +	WARN_ON_ONCE(irqs_disabled());
> > > > > > > > > > > > 
> > > > > > > > > > > > If this triggers, you just rebooted the box :(
> > > > > > > > > > > > 
> > > > > > > > > > > > Please never do this, either properly handle the problem and return an
> > > > > > > > > > > > error, or do not check for this.  It is not any type of "fix" at all,
> > > > > > > > > > > > and at most, a debugging aid while you work on the root problem.
> > > > > > > > > > > > 
> > > > > > > > > > > > thanks,
> > > > > > > > > > > > 
> > > > > > > > > > > > greg k-h
> > > > > > > > > > > 
> > > > > > > > > > > Wait, what? Why would testing for irqs being disabled and throwing a
> > > > > > > > > > > WARN_ON in that case crash the box?
> > > > > > > > > > 
> > > > > > > > > > If panic-on-warn is enabled, which is a common setting for systems these
> > > > > > > > > > days.
> > > > > > > > > 
> > > > > > > > > Ok, that makes some sense.
> > > > > > > > 
> > > > > > > > Wait, I don't get it.
> > > > > > > > 
> > > > > > > > How are we supposed to decide when to use WARN, when to use BUG, and
> > > > > > > > when to panic?  Do we really want to treat them all as equivalent?  And
> > > > > > > > who exactly is turning on panic-on-warn?
> > > > > > > 
> > > > > > > You never use WARN or BUG, unless the system is so messed up that you
> > > > > > > can not possibly recover from the issue.
> > > > > > 
> > > > > > I've heard similar advice for BUG before, but this is the first I've
> > > > > > heard it for WARN.  Do we have any guidelines for how to choose between
> > > > > > WARN and BUG?
> > > > > 
> > > > > Never use either :)
> > > > 
> > > > I can't tell if you're kidding.
> > > 
> > > I am not.
> > > 
> > > > Is there some plan to remove them?
> > > 
> > > Over time, yes.  And any WARN that userspace can ever hit should be
> > > removed today.
> > > 
> > > > There are definitely cases where I've been able to resolve a problem
> > > > more quickly because I got a backtrace from a WARN.
> > > 
> > > If you want a backtrace, ask for that, recover from the error, and move
> > > on.  Do not allow userspace to reboot a machine for no good reason as
> > > again, panic-on-warn is a common setting that people use now.
> > > 
> > > This is what all of the syzbot work has been doing, it triggers things
> > > that cause WARN() to be hit and so we have to fix them.
> > > 
> > 
> > This seems really draconian. Clearly we do want to fix things that show
> > a WARN (otherwise we wouldn't bother warning about it), but I don't
> > think that's a reason to completely avoid them. My understanding has
> > always been:
> > 
> > BUG: for when you reach some condition where the kernel (probably) can't
> > carry on
> > 
> > WARN: for when you reach some condition that is problematic but where
> > the machine can probably soldier on. 
> > 
> > Over the last several years, I've changed a lot of BUGs into WARNs to
> > avoid crashing the box unnecessarily. If someone is setting
> > panic_on_warn, then aren't they just getting what they asked for?
> > 
> > While I don't feel that strongly about this particular WARN in this
> > patch, it seems like a reasonable thing to do. If someone calls these
> > functions with IRQs disabled, then they might end up with some subtle
> > problems that could be hard to detect otherwise.
> 
> Don't we already have a debugging option that would catch this?
> 
> config DEBUG_IRQFLAGS
>         bool "Debug IRQ flag manipulation"
>         help
>           Enables checks for potentially unsafe enabling or disabling of
>           interrupts, such as calling raw_local_irq_restore() when interrupts
>           are enabled.
> 
> so I think this particular warn is unnecessary.
> 

Good to know. I'm just going to leave Desmond's v1 patch (which didn't
have this WARN_ON) in linux-next for now.

> But I also disagree with Greg.  Normal users aren't setting panic-on-warn.
> Various build bots are setting panic-on-warn -- and they should -- because
> we shouldn't be able to trigger these kinds of warnings from userspace.
> Those are bugs that should be fixed.  But there's no reason to shy away
> from using a WARN when it's the right thing to do.

Agreed.
-- 
Jeff Layton <jlayton@kernel.org>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
