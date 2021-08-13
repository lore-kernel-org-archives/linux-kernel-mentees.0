Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813B3C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 07:33:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245AE6103E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 07:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 245AE6103E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E11F780C2A;
	Fri, 13 Aug 2021 07:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXoMPf8kCIjz; Fri, 13 Aug 2021 07:33:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E8AF180C3E;
	Fri, 13 Aug 2021 07:33:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3160C001A;
	Fri, 13 Aug 2021 07:33:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FFCBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 07:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56F6B605C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 07:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VaFVVoS2kWUZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 07:33:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63D09606EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 07:33:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86E4960720;
 Fri, 13 Aug 2021 07:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628840012;
 bh=/Ez7HIp0+x6gkQ+AXt7EEyRoY2iUgGHXpwEagk1RKCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UzTtsDLO6hrRf1Kjf1f+mnW0PKeqBbHHUQDaGx/+IcI7qjKN63ucgw3OZw+qeNTdr
 eAiF7XUSphEMaUqwI24TgogVna/wL0nWwDNYbH5ggprJAovLp1MH/4m4GtlDz7jv1S
 CA/wuFx+U6ggIhw5FH5h0WjviZknlKjFn2NeAlQc=
Date: Fri, 13 Aug 2021 09:33:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Subject: Re: [PATCH] tty: Fix data race between tiocsti() and flush_to_ldisc()
Message-ID: <YRYgSZwivcPPMhrS@kroah.com>
References: <20210807190513.3810821-1-phind.uet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210807190513.3810821-1-phind.uet@gmail.com>
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

On Sun, Aug 08, 2021 at 03:05:13AM +0800, Nguyen Dinh Phi wrote:
> The ops->receive_buf() may be accessed concurrently from these two
> functions.  If the driver flushes data to the line discipline
> receive_buf() method while tiocsti() is using the ops->receive_buf(),
> the data race will happen.
> 
> For example:
> tty_ioctl                       |tty_ldisc_receive_buf
>  ->tioctsi                      | ->tty_port_default_receive_buf
>                                 |  ->tty_ldisc_receive_buf
>    ->hci_uart_tty_receive       |   ->hci_uart_tty_receive
>     ->h4_recv                   |    ->h4_recv
> 
> In this case, the h4 receive buffer will be overwritten by the
> latecomer, and it cause a memory leak.

That looks to be a bug in the h4 code, if the receive_buf() call can not
be run at the same time, it should have a lock in it, right?

> Hence, change tioctsi() function to use the exclusive lock interface
> from tty_buffer to avoid the data race.

Where is the lock being grabbed from the other receive_buf() call path
to ensure that the lock is always needed here?

> 
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> Reported-by: syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com
> ---
>  drivers/tty/tty_io.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index e8532006e960..746fe13a2054 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -2307,8 +2307,10 @@ static int tiocsti(struct tty_struct *tty, char __user *p)
>  	ld = tty_ldisc_ref_wait(tty);
>  	if (!ld)
>  		return -EIO;
> +	tty_buffer_lock_exclusive(tty->port);
>  	if (ld->ops->receive_buf)
>  		ld->ops->receive_buf(tty, &ch, &mbz, 1);
> +	tty_buffer_unlock_exclusive(tty->port);

Did this fix the syzbot reported issue?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
