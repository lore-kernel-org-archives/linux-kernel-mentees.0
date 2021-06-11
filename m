Return-Path: <SRS0=OZPh=LF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEA9C48BD1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Jun 2021 03:17:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24FA561359
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Jun 2021 03:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24FA561359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E525B401C5;
	Fri, 11 Jun 2021 03:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Vs0VOsdqbFl; Fri, 11 Jun 2021 03:17:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CBC564016D;
	Fri, 11 Jun 2021 03:17:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A279DC000D;
	Fri, 11 Jun 2021 03:17:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 897BEC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 03:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6346B4016D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 03:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lj-6xeCg7-Oy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 03:17:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D4A7400BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Jun 2021 03:17:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1623381426; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HdTxatKiOuJtnz3mnNbLrJH0QSz53F7Bv1oH8ZGvGV5VsijOYSp2ejsWAkjERUr8QQ7w1abIOdVjncXFEem9sZfA/zij3UAbERxmbNkhGpNDIrziAWabeZqOvKmFvl0UqBNYJktCYFc8bebegZXD3PlqQ0HsZ/5tV06Fng393Es=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623381426;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=6w24q4KjkkPDLysSVflU0zB+gETtZEUm88FEMMwn7GI=; 
 b=LR9vGj6Z3O3sYwxygoDirXJFI7o9RQ3XMUy1B8WgRWMGWItICdX2i9dsbeLUoSlU6258vuWdNWMBX/058ic1VMju31GeIpq1xs5D7k+6wFGSkc5N6bRK12W6sWXZxN7w50z7tm/x4qGCPm8dyLSzKbNMfreutgYc4C1Byr+JPWI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623381426; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=6w24q4KjkkPDLysSVflU0zB+gETtZEUm88FEMMwn7GI=;
 b=S4C4tt0G79erc+nJUWrj5nFueHq96WxkfTLfxvzWvV4pWvgT/bawlJtaZMz9tJRJ
 zbTqk68dYaCISPFtV4CPYZAjqSinFG/dbm7vGOI2nW54EVt9UL252/3atXzEd0LFgCS
 epHw9lezYcFVCW5dgFSM36yUnp9cSbbH+aVn2aAQ=
Received: from anirudhrb.com (106.51.107.73 [106.51.107.73]) by mx.zohomail.com
 with SMTPS id 1623381424796479.5654824572481;
 Thu, 10 Jun 2021 20:17:04 -0700 (PDT)
Date: Fri, 11 Jun 2021 08:46:58 +0530
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v4] firmware_loader: fix use-after-free in
 firmware_fallback_sysfs
Message-ID: <YMLVqvFtR8OS+Qst@anirudhrb.com>
References: <20210518155921.4181-1-mail@anirudhrb.com>
 <20210519032014.GS4332@42.do-not-panic.com>
 <CAB=NE6Uq_t9Mbs8zN30QQrwH190p5Oz4M7OwDxmQgUeRRWS_6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB=NE6Uq_t9Mbs8zN30QQrwH190p5Oz4M7OwDxmQgUeRRWS_6g@mail.gmail.com>
X-ZohoMailClient: External
Cc: syzbot+de271708674e2093097b@syzkaller.appspotmail.com,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Junyong Sun <sunjy516@gmail.com>,
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

On Thu, Jun 10, 2021 at 03:32:53PM -0700, Luis Chamberlain wrote:
> On Tue, May 18, 2021 at 8:20 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Tue, May 18, 2021 at 09:29:20PM +0530, Anirudh Rayabharam wrote:
> > > This use-after-free happens when a fw_priv object has been freed but
> > > hasn't been removed from the pending list (pending_fw_head). The next
> > > time fw_load_sysfs_fallback tries to insert into the list, it ends up
> > > accessing the pending_list member of the previoiusly freed fw_priv.
> > >
> > > The root cause here is that all code paths that abort the fw load
> > > don't delete it from the pending list. For example:
> > >
> > >       _request_firmware()
> > >         -> fw_abort_batch_reqs()
> > >             -> fw_state_aborted()
> > >
> > > To fix this, delete the fw_priv from the list in __fw_set_state() if
> > > the new state is DONE or ABORTED. This way, all aborts will remove
> > > the fw_priv from the list. Accordingly, remove calls to list_del_init
> > > that were being made before calling fw_state_(aborted|done)().
> > >
> > > Also, in fw_load_sysfs_fallback, don't add the fw_priv to the list
> > > if it is already aborted. Instead, just jump out and return early.
> > >
> > > Fixes: bcfbd3523f3c ("firmware: fix a double abort case with fw_load_sysfs_fallback")
> > > Reported-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
> > > Tested-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
> > > Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> > > ---
> > >
> > > Changes in v4:
> > > Documented the reasons behind the error codes returned from
> > > fw_sysfs_wait_timeout() as suggested by Luis Chamberlain.
> > >
> > > Changes in v3:
> > > Modified the patch to incorporate suggestions by Luis Chamberlain in
> > > order to fix the root cause instead of applying a "band-aid" kind of
> > > fix.
> > > https://lore.kernel.org/lkml/20210403013143.GV4332@42.do-not-panic.com/
> > >
> > > Changes in v2:
> > > 1. Fixed 1 error and 1 warning (in the commit message) reported by
> > > checkpatch.pl. The error was regarding the format for referring to
> > > another commit "commit <sha> ("oneline")". The warning was for line
> > > longer than 75 chars.
> > >
> > > ---
> > >  drivers/base/firmware_loader/fallback.c | 46 ++++++++++++++++++-------
> > >  drivers/base/firmware_loader/firmware.h |  6 +++-
> > >  drivers/base/firmware_loader/main.c     |  2 ++
> > >  3 files changed, 40 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
> > > index 91899d185e31..f244c7b89ba5 100644
> > > --- a/drivers/base/firmware_loader/fallback.c
> > > +++ b/drivers/base/firmware_loader/fallback.c
> > > @@ -70,7 +70,31 @@ static inline bool fw_sysfs_loading(struct fw_priv *fw_priv)
> > >
> > >  static inline int fw_sysfs_wait_timeout(struct fw_priv *fw_priv,  long timeout)
> > >  {
> > > -     return __fw_state_wait_common(fw_priv, timeout);
> > > +     int ret = __fw_state_wait_common(fw_priv, timeout);
> > > +
> > > +     /*
> > > +      * A signal could be sent to abort a wait. Consider Android's init
> > > +      * gettting a SIGCHLD, which in turn was the same process issuing the
> > > +      * sysfs store call for the fallback. In such cases we want to be able
> > > +      * to tell apart in userspace when a signal caused a failure on the
> > > +      * wait. In such cases we'd get -ERESTARTSYS.
> > > +      *
> > > +      * Likewise though another race can happen and abort the load earlier.
> > > +      *
> > > +      * In either case the situation is interrupted so we just inform
> > > +      * userspace of that and we end things right away.
> > > +      *
> > > +      * When we really time out just tell userspace it should try again,
> > > +      * perhaps later.
> > > +      */
> > > +     if (ret == -ERESTARTSYS || fw_state_is_aborted(fw_priv))
> > > +             ret = -EINTR;
> > > +     else if (ret == -ETIMEDOUT)
> > > +             ret = -EAGAIN;
> >
> >
> > Shuah has explained to me that the only motivation on her part with
> > using -EAGAIN on commit 0542ad88fbdd81bb ("firmware loader: Fix
> > _request_firmware_load() return val for fw load abort") was to
> > distinguish the error from -ENOMEM, and so there was no real
> > reason to stick to -EAGAIN. Given -EAGAIN is used typically to
> > ask user to retry, but it makes no sense in this case since the
> > sysfs interface is ephemeral, I think we should do away with it
> > and document this rationale.
> >
> > I think we should stick to use -ETIMEDOUT. Its more telling of what
> > happened. And so I think just removing the check should do it, but
> > augmenting the comment should suffice.
> >
> > Since this change is already big, it would be good for this other
> > change to go in as a separate change. If you can test to ensure the
> > -ETIMEDOUT does indeed get propagated that'd be appreciated.
> >
> > Otherwise looks good. Thanks for your patience!
> 
> Anirudh, did you get a chance to test?

Hi Luis, I had replied to your email here:
https://lore.kernel.org/lkml/YKVcnQ7mm1b92mbR@anirudhrb.com/

Thanks!

	- Anirudh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
