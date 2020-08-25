Return-Path: <SRS0=1t6x=CD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1CDC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 15:44:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53BA207BC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 15:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKrg3F2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53BA207BC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 81400886E5;
	Tue, 25 Aug 2020 15:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zW3eF71yM2x; Tue, 25 Aug 2020 15:44:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 09CFD886E1;
	Tue, 25 Aug 2020 15:44:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF668C07FF;
	Tue, 25 Aug 2020 15:44:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3644C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 15:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8F67086934
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 15:44:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IcoBvgp6pDsw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 15:44:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EF5ED86918
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 15:43:59 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1EDA420782;
 Tue, 25 Aug 2020 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598370239;
 bh=DgFyxOdNOTi3TG94BiEuLcvBwr2/zo4bHO/PeqCjCx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IKrg3F2vFQXnqAASePy/mMuLsPQW7IEiL+Xux1qbWn0qGtd1OeKAs6//mcqd5evcH
 FplyaJzVGuDTO1NiHzr441tAkqzWhwayfwfl5jDKAJkZMHemuEv0dp2dMbGVIreylT
 pochdB6GTVu2BLXiAolfJbfQGA4AiPxAdKQgbtQI=
Date: Tue, 25 Aug 2020 17:44:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Message-ID: <20200825154415.GA1513396@kroah.com>
References: <20200823082042.20816-1-himadrispandya@gmail.com>
 <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com>
 <20200823101924.GA3078429@kroah.com>
 <CACT4Y+YbDODLRFn8M5QcY4CazhpeCaunJnP_udXtAs0rYoASSg@mail.gmail.com>
 <20200823105808.GB87391@kroah.com>
 <CACT4Y+ZiZQK8WBre9E4777NPaRK4UDOeZOeMZOQC=5tDsDu23A@mail.gmail.com>
 <20200825065135.GA1316856@kroah.com>
 <20200825143946.GA365901@rowland.harvard.edu>
 <20200825144437.GA1484901@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825144437.GA1484901@kroah.com>
Cc: netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>,
 Himadri Pandya <himadrispandya@gmail.com>
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

On Tue, Aug 25, 2020 at 04:44:37PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 25, 2020 at 10:39:46AM -0400, Alan Stern wrote:
> > On Tue, Aug 25, 2020 at 08:51:35AM +0200, Greg Kroah-Hartman wrote:
> > > At first glance, I think this can all be cleaned up, but it will take a
> > > bit of tree-wide work.  I agree, we need a "read this message and error
> > > if the whole thing is not there", as well as a "send this message and
> > > error if the whole thing was not sent", and also a way to handle
> > > stack-provided data, which seems to be the primary reason subsystems
> > > wrap this call (they want to make it easier on their drivers to use it.)
> > > 
> > > Let me think about this in more detail, but maybe something like:
> > > 	usb_control_msg_read()
> > > 	usb_control_msg_send()
> > > is a good first step (as the caller knows this) and stack provided data
> > > would be allowed, and it would return an error if the whole message was
> > > not read/sent properly.  That way we can start converting everything
> > > over to a sane, and checkable, api and remove a bunch of wrapper
> > > functions as well.
> > 
> > Suggestion: _read and _send are not a natural pair.  Consider instead
> > _read and _write.  _recv and _send don't feel right either, because it
> > both cases the host sends the control message -- the difference lies
> > in who sends the data.
> 
> Yes, naming is hard :)
> 
> 	usb_control_read_msg()
> 	usb_control_write_msg()
> 
> feels good to me, let me try this out and see if it actually makes sense
> to do this on a few in-usb-core files and various drivers...

Turns out we have a long history of using snd/rcv for USB control
messages:
	usb_rcvctrlpipe()
	usb_sndctrlpipe()

so while _recv and _send might feel a bit "odd", it is what we are used
to using, and when converting existing users, I can drop the pipe macro
from the calls, turning something like:
	usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0), ...);
into:
	usb_control_send_msg(hdev, 0, ...);

or maybe:
	usb_control_msg_send(hdev, 0, ...);
with a full noun_verb pairing, instead of noun_verb_noun.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
