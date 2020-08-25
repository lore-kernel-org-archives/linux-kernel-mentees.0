Return-Path: <SRS0=1t6x=CD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B086C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 06:54:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B5FB2076C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 06:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDvfHcMd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B5FB2076C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3695484E88;
	Tue, 25 Aug 2020 06:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlXUmsw5oU9t; Tue, 25 Aug 2020 06:54:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4550F8511C;
	Tue, 25 Aug 2020 06:54:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A925C016F;
	Tue, 25 Aug 2020 06:54:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A186C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 06:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7BDD9200E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 06:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZaN9McptK38h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 06:54:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id B81E720004
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 06:54:22 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5E8D2076C;
 Tue, 25 Aug 2020 06:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598338462;
 bh=QTOssPeTxMooyonVyo7p70FWZuhmZZcFLiqChmW5rAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sDvfHcMd+8MwLRGbLaeJe7Msxlt+I3rvc6ZJDCydE6j1+PrQkPIvq75KKGm3DSRNg
 O/RzXI4r+OHfpdzKsKT4+HO9JGr/8K4Q731Zv5EwI5n6AOIqmbHmFEQb0zmrmW0CfD
 qig9slt2Cy4X5MP6xZlDUHmmN18YrjTLv4yKgLow=
Date: Tue, 25 Aug 2020 08:54:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20200825065439.GB1319770@kroah.com>
References: <20200823082042.20816-1-himadrispandya@gmail.com>
 <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com>
 <20200823101924.GA3078429@kroah.com>
 <CACT4Y+YbDODLRFn8M5QcY4CazhpeCaunJnP_udXtAs0rYoASSg@mail.gmail.com>
 <20200823105808.GB87391@kroah.com>
 <CACT4Y+ZiZQK8WBre9E4777NPaRK4UDOeZOeMZOQC=5tDsDu23A@mail.gmail.com>
 <20200825065135.GA1316856@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825065135.GA1316856@kroah.com>
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

On Tue, Aug 25, 2020 at 08:51:35AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 24, 2020 at 10:55:28AM +0200, Dmitry Vyukov wrote:
> > On Sun, Aug 23, 2020 at 12:57 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sun, Aug 23, 2020 at 12:31:03PM +0200, Dmitry Vyukov wrote:
> > > > On Sun, Aug 23, 2020 at 12:19 PM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Sun, Aug 23, 2020 at 11:26:27AM +0200, Dmitry Vyukov wrote:
> > > > > > On Sun, Aug 23, 2020 at 10:21 AM Himadri Pandya
> > > > > > <himadrispandya@gmail.com> wrote:
> > > > > > >
> > > > > > > Initialize the buffer before passing it to usb_read_cmd() function(s) to
> > > > > > > fix the uninit-was-stored issue in asix_read_cmd().
> > > > > > >
> > > > > > > Fixes: KMSAN: kernel-infoleak in raw_ioctl
> > > > > > > Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
> > > > > > >
> > > > > > > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/net/usb/asix_common.c | 2 ++
> > > > > > >  1 file changed, 2 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
> > > > > > > index e39f41efda3e..a67ea1971b78 100644
> > > > > > > --- a/drivers/net/usb/asix_common.c
> > > > > > > +++ b/drivers/net/usb/asix_common.c
> > > > > > > @@ -17,6 +17,8 @@ int asix_read_cmd(struct usbnet *dev, u8 cmd, u16 value, u16 index,
> > > > > > >
> > > > > > >         BUG_ON(!dev);
> > > > > > >
> > > > > > > +       memset(data, 0, size);
> > > > > >
> > > > > > Hi Himadri,
> > > > > >
> > > > > > I think the proper fix is to check
> > > > > > usbnet_read_cmd/usbnet_read_cmd_nopm return value instead.
> > > > > > Memsetting data helps to fix the warning at hand, but the device did
> > > > > > not send these 0's and we use them as if the device did send them.
> > > > >
> > > > > But, for broken/abusive devices, that really is the safest thing to do
> > > > > here.  They are returning something that is obviously not correct, so
> > > > > either all callers need to check the size received really is the size
> > > > > they asked for, or we just plod onward with a 0 value like this.  Or we
> > > > > could pick some other value, but that could cause other problems if it
> > > > > is treated as an actual value.
> > > >
> > > > Do we want callers to do at least some error check (e.g. device did
> > > > not return anything at all, broke, hang)?
> > > > If yes, then with a separate helper function that fails on short
> > > > reads, we can get both benefits at no additional cost. User code will
> > > > say "I want 4 bytes, anything that is not 4 bytes is an error" and
> > > > then 1 error check will do. In fact, it seems that that was the
> > > > intention of whoever wrote this code (they assumed no short reads),
> > > > it's just they did not actually implement that "anything that is not 4
> > > > bytes is an error" part.
> > > >
> > > >
> > > > > > Perhaps we need a separate helper function (of a bool flag) that will
> > > > > > fail on incomplete reads. Maybe even in the common USB layer because I
> > > > > > think we've seen this type of bug lots of times and I guess there are
> > > > > > dozens more.
> > > > >
> > > > > It's not always a failure, some devices have protocols that are "I could
> > > > > return up to a max X bytes but could be shorter" types of messages, so
> > > > > it's up to the caller to check that they got what they really asked for.
> > > >
> > > > Yes, that's why I said _separate_ helper function. There seems to be
> > > > lots of callers that want exactly this -- "I want 4 bytes, anything
> > > > else is an error". With the current API it's harder to do - you need
> > > > additional checks, additional code, maybe even additional variables to
> > > > store the required size. APIs should make correct code easy to write.
> > >
> > > I guess I already answered both of these in my previous email...
> > >
> > > > > Yes, it's more work to do this checking.  However converting the world
> > > > > over to a "give me an error value if you don't read X number of bytes"
> > > > > function would also be the same amount of work, right?
> > > >
> > > > Should this go into the common USB layer then?
> > > > It's weird to have such a special convention on the level of a single
> > > > driver. Why are rules for this single driver so special?...
> > >
> > > They aren't special at all, so yes, we should be checking for a short
> > > read everywhere.  That would be the "correct" thing to do, I was just
> > > suggesting a "quick fix" here, sorry.
> > 
> > Re quick fix, I guess it depends on the amount of work for the larger
> > fix and if we can find volunteers (thanks Himadri!). We need to be
> > practical as well.
> > 
> > Re:
> >         retval = usb_control_msg(....., data, data_size, ...);
> >         if (retval < buf_size) {
> > 
> > There may be a fine line between interfaces and what code they
> > provoke. Let me describe my reasoning.
> > 
> > Yes, the current interface allows writing correct code with moderate
> > amount of effort. Yet we see cases where it's used incorrectly, maybe
> > people were just a little bit lazy, or maybe they did not understand
> > how to use it properly (nobody reads the docs, and it's also
> > reasonable to assume that if you ask for N bytes and the function does
> > not fail, then you get N bytes).
> 
> I did a quick scan of the tree, and in short, I think it's worse than we
> both imagined, more below...
> 
> > Currently to write correct code (1) we need a bit of duplication,
> > which gets worse if data_size is actually some lengthy expression
> > (X+Y*Z), maybe one will need an additional variable to use it
> > correctly.
> > (2) one needs to understand the contract;
> > (3) may be subject to the following class of bugs (after some copy-paste:
> >         retval = usb_control_msg(....., data, 4, ...);
> >         if (retval < 2) {
> > This class of bugs won't be necessary immediately caught by kernel
> > testing systems (can have long life-time).
> > 
> > I would add a "default" function (with shorter name) that does full read:
> > 
> > if (!usb_control_msg(, ...., data, 4))
> > 
> > and a function with longer name to read variable-size data:
> > 
> > n = usb_control_msg_variable_length(, ...., data, sizeof(data)));
> > 
> > The full read should be "the default" (shorter name), because if you
> > need full read and use the wrong function, it won't be caught by
> > testing (most likely long-lived bug). Whereas if you use full read for
> > lengthy variable size data read, this will be immediately caught
> > during any testing (even manual) -- you ask for 4K, you get fewer
> > bytes, all your reads fail.
> > So having "full read" easier to spell will lead to fewer bugs by design.
> 
> Originally I would sick to my first proposal that "all is fine" and the
> api is "easy enough", but in auditing the tree, it's horrid.
> 
> The error checking for this function call is almost non-existant.  And,
> to make things more difficult, this is a bi-directional call, it is a
> read or write call, depending on what USB endpoint the user asks for (or
> both for some endpoints.)  So trying to automatically scan the tree for
> valid error handling is really really hard.
> 
> Combine that with the need of many subsystems to "wrap" this function in
> a helper call, because the USB core isn't providing a useful call it
> could call directly, and we have a total mess.
> 
> At first glance, I think this can all be cleaned up, but it will take a
> bit of tree-wide work.  I agree, we need a "read this message and error
> if the whole thing is not there", as well as a "send this message and
> error if the whole thing was not sent", and also a way to handle
> stack-provided data, which seems to be the primary reason subsystems
> wrap this call (they want to make it easier on their drivers to use it.)
> 
> Let me think about this in more detail, but maybe something like:
> 	usb_control_msg_read()
> 	usb_control_msg_send()
> is a good first step (as the caller knows this) and stack provided data
> would be allowed, and it would return an error if the whole message was
> not read/sent properly.  That way we can start converting everything
> over to a sane, and checkable, api and remove a bunch of wrapper
> functions as well.

Oh, and if you want to start creating a bunch of syzbot bugs to report,
like this one, just start doing "short reads" on almost any control
message request...

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
