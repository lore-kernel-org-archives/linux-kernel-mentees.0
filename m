Return-Path: <SRS0=39L3=CB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F69C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 10:56:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BA262072D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 10:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="v/aPdIfA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BA262072D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 473B287836;
	Sun, 23 Aug 2020 10:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JV8u6xbrBdJ4; Sun, 23 Aug 2020 10:56:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B7BCE87828;
	Sun, 23 Aug 2020 10:56:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABE3FC07FF;
	Sun, 23 Aug 2020 10:56:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77B83C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 735F687836
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDVUlUjgG2Kz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:56:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D24B987828
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:56:02 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 130D92072D;
 Sun, 23 Aug 2020 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598180162;
 bh=4yd51JrmDIU9v+Uu6SenJKfbOo3beI55UZ1+lyBGMa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v/aPdIfAiaTcN17ybARTdRUaeD7Hd5J/SIBYkPBlSXaUP0egieEsu/OYYKZLS4tA+
 2Fz2FCNGu2cwIRqIpyfjeMXphy4vy+i6KDUPF8+huSX2XMC0NeoFplO97MSaEWdWdw
 kcIx2Jt3wxp9RDvWhg0qUl9QKI26gtne3FnlHOIk=
Date: Sun, 23 Aug 2020 12:56:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20200823105622.GA87391@kroah.com>
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
> > It's not always a failure, some devices have protocols that are "I could
> > return up to a max X bytes but could be shorter" types of messages, so
> > it's up to the caller to check that they got what they really asked for.
> 
> Yes, that's why I said _separate_ helper function. There seems to be
> lots of callers that want exactly this -- "I want 4 bytes, anything
> else is an error". With the current API it's harder to do - you need
> additional checks, additional code, maybe even additional variables to
> store the required size. APIs should make correct code easy to write.

One note on this, will respond to the rest of the email later.

It should be the same exact amount of code in the driver to handle this
either way:

Today's correctly written driver:

	data_size = 4;
	data = kmalloc(data_size, GFP_KERNEL);
	...

	retval = usb_control_msg(....., data, data_size, ...);
	if (retval < buf_size) {
		/* SOMETHING WENT WRONG! */
	}

With your new function:

	data_size = 4;
	data = kmalloc(data_size, GFP_KERNEL);
	...

	retval = usb_control_msg_error_on_short(....., data, data_size, ...);
	if (retval < 0) {
		/* SOMETHING WENT WRONG! */
	}


Catch the difference, it's only in checking for retval, either way you
are writing the exact same logic in the driver, you still have to tell
the USB layer the size of the buffer you want to read into, still have
to pass in the buffer, and everything else.  You already know the size
of the data you want, and you already are doing the check, those things
you have to do no matter what, it's not extra work.

We can write a wrapper around usb_control_msg() for something like this
that does the transformation of a short read into an error, but really,
does that give us all that much here?

Yes, I want to make it easy to write correct drivers, and hard to get
things wrong, but in this case, I don't see the new way any "harder" to
get wrong.

Unless you know of a simpler way here?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
