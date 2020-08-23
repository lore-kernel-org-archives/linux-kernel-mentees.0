Return-Path: <SRS0=39L3=CB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C8FC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 10:19:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8E42075B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 10:19:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0NF1MK1u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8E42075B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 61DF9860EA;
	Sun, 23 Aug 2020 10:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGLfzV1uaU_a; Sun, 23 Aug 2020 10:19:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D56AE860C0;
	Sun, 23 Aug 2020 10:19:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE0AEC07FF;
	Sun, 23 Aug 2020 10:19:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78D8BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6E8D8877E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GzLvH3M7aBNT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:19:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A6C80877DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 10:19:05 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D21762075B;
 Sun, 23 Aug 2020 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598177945;
 bh=Ujak7Kc517HcPZ0LyBiz0rIH59QGuYtCtf+7xmhT4G0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0NF1MK1uPeo4chp3b3OeVF3gntArq7804AdQn5p/vFZQPYHLStv4l/ojbpmmEREiM
 LH+z03UqMadgSGfgYxn/yfcAvAGEqN6mPgJfxLRfvE7EFZ5QVByuL3HXW5l/NS58k1
 ELQRH9UOuSkb8chxVn+ppKNIRirtp99toiAZnqmg=
Date: Sun, 23 Aug 2020 12:19:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20200823101924.GA3078429@kroah.com>
References: <20200823082042.20816-1-himadrispandya@gmail.com>
 <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com>
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

On Sun, Aug 23, 2020 at 11:26:27AM +0200, Dmitry Vyukov wrote:
> On Sun, Aug 23, 2020 at 10:21 AM Himadri Pandya
> <himadrispandya@gmail.com> wrote:
> >
> > Initialize the buffer before passing it to usb_read_cmd() function(s) to
> > fix the uninit-was-stored issue in asix_read_cmd().
> >
> > Fixes: KMSAN: kernel-infoleak in raw_ioctl
> > Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
> >
> > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> > ---
> >  drivers/net/usb/asix_common.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
> > index e39f41efda3e..a67ea1971b78 100644
> > --- a/drivers/net/usb/asix_common.c
> > +++ b/drivers/net/usb/asix_common.c
> > @@ -17,6 +17,8 @@ int asix_read_cmd(struct usbnet *dev, u8 cmd, u16 value, u16 index,
> >
> >         BUG_ON(!dev);
> >
> > +       memset(data, 0, size);
> 
> Hi Himadri,
> 
> I think the proper fix is to check
> usbnet_read_cmd/usbnet_read_cmd_nopm return value instead.
> Memsetting data helps to fix the warning at hand, but the device did
> not send these 0's and we use them as if the device did send them.

But, for broken/abusive devices, that really is the safest thing to do
here.  They are returning something that is obviously not correct, so
either all callers need to check the size received really is the size
they asked for, or we just plod onward with a 0 value like this.  Or we
could pick some other value, but that could cause other problems if it
is treated as an actual value.

> Perhaps we need a separate helper function (of a bool flag) that will
> fail on incomplete reads. Maybe even in the common USB layer because I
> think we've seen this type of bug lots of times and I guess there are
> dozens more.

It's not always a failure, some devices have protocols that are "I could
return up to a max X bytes but could be shorter" types of messages, so
it's up to the caller to check that they got what they really asked for.

Yes, it's more work to do this checking.  However converting the world
over to a "give me an error value if you don't read X number of bytes"
function would also be the same amount of work, right?

So personally, I think this patch is right for when you are trying to
abuse the USB driver stack :)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
