Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066AFC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 14:04:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B52CD61051
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 14:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B52CD61051
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80C9C40495;
	Wed, 18 Aug 2021 14:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnbKT2kuSseN; Wed, 18 Aug 2021 14:03:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7778A40487;
	Wed, 18 Aug 2021 14:03:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BA62C0010;
	Wed, 18 Aug 2021 14:03:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC100C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 14:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A761780ECF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 14:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQzU4WsB1jiR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 14:03:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5087F80E79
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 14:03:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3590B61051;
 Wed, 18 Aug 2021 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629295431;
 bh=OtHThCXmHDiPy0w6lt1fEL2vmZQbCKRBjm4W84idpsI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rx5TKLHCisM/jt55skOkrCVNfntYjFdCbIbtDzpTNmpkAOX3ImgebHL812XZe9ulp
 H3rzMUDDOc7Hn90T6JvADqe0HfCHjXI1gELcST56HOlqVKFtco9drONZmebFDHtXrC
 LLoRvnCDGEj6p6Z8VRpRN06sCWJhksk9xWclybp8=
Date: Wed, 18 Aug 2021 16:03:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Phi Nguyen <phind.uet@gmail.com>
Subject: Re: [PATCH] tty: Fix data race between tiocsti() and flush_to_ldisc()
Message-ID: <YR0TRf+283ujBxbv@kroah.com>
References: <20210807190513.3810821-1-phind.uet@gmail.com>
 <YRYgSZwivcPPMhrS@kroah.com>
 <7323d825-f596-223b-a063-7539a6a57107@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7323d825-f596-223b-a063-7539a6a57107@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com, jirislaby@kernel.org,
 linux-kernel@vger.kernel.org
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

On Sat, Aug 14, 2021 at 02:35:53AM +0800, Phi Nguyen wrote:
> On 8/13/2021 3:33 PM, Greg KH wrote:
> > > 
> > > Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> > > Reported-by: syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com
> > > ---
> > >   drivers/tty/tty_io.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> > > index e8532006e960..746fe13a2054 100644
> > > --- a/drivers/tty/tty_io.c
> > > +++ b/drivers/tty/tty_io.c
> > > @@ -2307,8 +2307,10 @@ static int tiocsti(struct tty_struct *tty, char __user *p)
> > >   	ld = tty_ldisc_ref_wait(tty);
> > >   	if (!ld)
> > >   		return -EIO;
> > > +	tty_buffer_lock_exclusive(tty->port);
> > >   	if (ld->ops->receive_buf)
> > >   		ld->ops->receive_buf(tty, &ch, &mbz, 1);
> > > +	tty_buffer_unlock_exclusive(tty->port);
> > 
> > Did this fix the syzbot reported issue?
> > 
> > thanks,
> > 
> > greg k-h
> > Yes, this fixed the syzbot reported issue.
> 
> The lock is grabbed in flush_to_ldisc() and paste_selection().
> Actually, I follow the document in tty_buffer.c, where it say the callers to
> receive_buff() other than flush_to_ldisc() need to exclude the kworker from
> concurrent use of the line discipline.
> 
> And function tiocsti() has the following comment:
> /* FIXME: may race normal receive processing */
> that why I add lock in this function.

As you are fixing this FIXME, please remove it in this patch, otherwise
we will not know it is resolved :)

Can you add that to the change and submit a new version?

Also, this should go to stable kernels, right?  Any idea how far back?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
