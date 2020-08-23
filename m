Return-Path: <SRS0=39L3=CB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FEAC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 10:57:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D99762072D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 10:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSYTjTDZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D99762072D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8CF887841;
	Sun, 23 Aug 2020 10:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OC-deejB9puD; Sun, 23 Aug 2020 10:57:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D57687836;
	Sun, 23 Aug 2020 10:57:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 065F5C07FF;
	Sun, 23 Aug 2020 10:57:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D50BDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D11FA85E9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F2pETnIJAnlV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:57:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2F42B85DF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:57:49 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5FDF92072D;
 Sun, 23 Aug 2020 10:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598180269;
 bh=b2rTg/fR21l4CoWP+SM3cdEWOBguA/lksw8HvdFpxCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OSYTjTDZLBWGAqgsRCEdTcNPmjxDG9UvSP8PqMzE8uEWC9CuuTsDuEgNYVIjbwRJx
 b1J0+KL+yPmuQJzpS+/lzMzv3fjHNlezGBrOe84wSPv92ks38mXpSffCLRXVtXe1aG
 kADUaA2xl+nl4t41nlxVEwLTBNeqEInWzR8UqYAs=
Date: Sun, 23 Aug 2020 12:58:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20200823105808.GB87391@kroah.com>
References: <20200823082042.20816-1-himadrispandya@gmail.com>
 <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com>
 <20200823101924.GA3078429@kroah.com>
 <CACT4Y+YbDODLRFn8M5QcY4CazhpeCaunJnP_udXtAs0rYoASSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+YbDODLRFn8M5QcY4CazhpeCaunJnP_udXtAs0rYoASSg@mail.gmail.com>
Cc: netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, Himadri Pandya <himadrispandya@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: Fix uninit-was-stored
	issue in asix_read_cmd()
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

On Sun, Aug 23, 2020 at 12:31:03PM +0200, Dmitry Vyukov wrote:
> On Sun, Aug 23, 2020 at 12:19 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Aug 23, 2020 at 11:26:27AM +0200, Dmitry Vyukov wrote:
> > > On Sun, Aug 23, 2020 at 10:21 AM Himadri Pandya
> > > <himadrispandya@gmail.com> wrote:
> > > >
> > > > Initialize the buffer before passing it to usb_read_cmd() function(s) to
> > > > fix the uninit-was-stored issue in asix_read_cmd().
> > > >
> > > > Fixes: KMSAN: kernel-infoleak in raw_ioctl
> > > > Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
> > > >
> > > > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> > > > ---
> > > >  drivers/net/usb/asix_common.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
> > > > index e39f41efda3e..a67ea1971b78 100644
> > > > --- a/drivers/net/usb/asix_common.c
> > > > +++ b/drivers/net/usb/asix_common.c
> > > > @@ -17,6 +17,8 @@ int asix_read_cmd(struct usbnet *dev, u8 cmd, u16 value, u16 index,
> > > >
> > > >         BUG_ON(!dev);
> > > >
> > > > +       memset(data, 0, size);
> > >
> > > Hi Himadri,
> > >
> > > I think the proper fix is to check
> > > usbnet_read_cmd/usbnet_read_cmd_nopm return value instead.
> > > Memsetting data helps to fix the warning at hand, but the device did
> > > not send these 0's and we use them as if the device did send them.
> >
> > But, for broken/abusive devices, that really is the safest thing to do
> > here.  They are returning something that is obviously not correct, so
> > either all callers need to check the size received really is the size
> > they asked for, or we just plod onward with a 0 value like this.  Or we
> > could pick some other value, but that could cause other problems if it
> > is treated as an actual value.
> 
> Do we want callers to do at least some error check (e.g. device did
> not return anything at all, broke, hang)?
> If yes, then with a separate helper function that fails on short
> reads, we can get both benefits at no additional cost. User code will
> say "I want 4 bytes, anything that is not 4 bytes is an error" and
> then 1 error check will do. In fact, it seems that that was the
> intention of whoever wrote this code (they assumed no short reads),
> it's just they did not actually implement that "anything that is not 4
> bytes is an error" part.
> 
> 
> > > Perhaps we need a separate helper function (of a bool flag) that will
> > > fail on incomplete reads. Maybe even in the common USB layer because I
> > > think we've seen this type of bug lots of times and I guess there are
> > > dozens more.
> >
> > It's not always a failure, some devices have protocols that are "I could
> > return up to a max X bytes but could be shorter" types of messages, so
> > it's up to the caller to check that they got what they really asked for.
> 
> Yes, that's why I said _separate_ helper function. There seems to be
> lots of callers that want exactly this -- "I want 4 bytes, anything
> else is an error". With the current API it's harder to do - you need
> additional checks, additional code, maybe even additional variables to
> store the required size. APIs should make correct code easy to write.

I guess I already answered both of these in my previous email...

> > Yes, it's more work to do this checking.  However converting the world
> > over to a "give me an error value if you don't read X number of bytes"
> > function would also be the same amount of work, right?
> 
> Should this go into the common USB layer then?
> It's weird to have such a special convention on the level of a single
> driver. Why are rules for this single driver so special?...

They aren't special at all, so yes, we should be checking for a short
read everywhere.  That would be the "correct" thing to do, I was just
suggesting a "quick fix" here, sorry.

Himadri, want to fix up all callers to properly check the size of the
message recieved before they access it?  That will fix this issue
properly.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
