Return-Path: <SRS0=1t6x=CD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965FDC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 14:44:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5012920578
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 14:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVfNwM2x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5012920578
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C5238671E;
	Tue, 25 Aug 2020 14:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIyg6awk8LtW; Tue, 25 Aug 2020 14:44:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 738EF866B1;
	Tue, 25 Aug 2020 14:44:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DB75C07FF;
	Tue, 25 Aug 2020 14:44:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1060C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 14:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DE11C21517
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 14:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wx3XWDnAVqbw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 14:44:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 1C813228D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 14:44:22 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4264820578;
 Tue, 25 Aug 2020 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598366661;
 bh=H4ZjIEM1FoCEKtZPFYTxt0y4DJtVqeusqC+bdNjG5Gw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MVfNwM2xGfolB0ytEUD3umzKOJXUzM3sBZS523JV7zuqDlg0+rDnIVKRh3e5nGhnU
 R/lDxscVLLMMygvwAO8Tf1+7GcZ+zL3BpmiU4hlppToOx0q22P79AzMZjRe8cqNtB2
 D/IoM4cZLKEnUQIOYHIoBuw2b5VEISrn6Y35sEYg=
Date: Tue, 25 Aug 2020 16:44:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Message-ID: <20200825144437.GA1484901@kroah.com>
References: <20200823082042.20816-1-himadrispandya@gmail.com>
 <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com>
 <20200823101924.GA3078429@kroah.com>
 <CACT4Y+YbDODLRFn8M5QcY4CazhpeCaunJnP_udXtAs0rYoASSg@mail.gmail.com>
 <20200823105808.GB87391@kroah.com>
 <CACT4Y+ZiZQK8WBre9E4777NPaRK4UDOeZOeMZOQC=5tDsDu23A@mail.gmail.com>
 <20200825065135.GA1316856@kroah.com>
 <20200825143946.GA365901@rowland.harvard.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825143946.GA365901@rowland.harvard.edu>
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

On Tue, Aug 25, 2020 at 10:39:46AM -0400, Alan Stern wrote:
> On Tue, Aug 25, 2020 at 08:51:35AM +0200, Greg Kroah-Hartman wrote:
> > At first glance, I think this can all be cleaned up, but it will take a
> > bit of tree-wide work.  I agree, we need a "read this message and error
> > if the whole thing is not there", as well as a "send this message and
> > error if the whole thing was not sent", and also a way to handle
> > stack-provided data, which seems to be the primary reason subsystems
> > wrap this call (they want to make it easier on their drivers to use it.)
> > 
> > Let me think about this in more detail, but maybe something like:
> > 	usb_control_msg_read()
> > 	usb_control_msg_send()
> > is a good first step (as the caller knows this) and stack provided data
> > would be allowed, and it would return an error if the whole message was
> > not read/sent properly.  That way we can start converting everything
> > over to a sane, and checkable, api and remove a bunch of wrapper
> > functions as well.
> 
> Suggestion: _read and _send are not a natural pair.  Consider instead
> _read and _write.  _recv and _send don't feel right either, because it
> both cases the host sends the control message -- the difference lies
> in who sends the data.

Yes, naming is hard :)

	usb_control_read_msg()
	usb_control_write_msg()

feels good to me, let me try this out and see if it actually makes sense
to do this on a few in-usb-core files and various drivers...

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
