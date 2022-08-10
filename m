Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CEEC25B06
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Aug 2022 08:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DAA04010D;
	Wed, 10 Aug 2022 08:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DAA04010D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=F3S3yEz0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7ySl1_lW-LJ; Wed, 10 Aug 2022 08:50:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2B37340148;
	Wed, 10 Aug 2022 08:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B37340148
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3A20C0032;
	Wed, 10 Aug 2022 08:50:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87D9CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 08:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54227408F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 08:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54227408F0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=F3S3yEz0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7YHOO-nUs3IT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 08:50:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F4A441506
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F4A441506
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Aug 2022 08:50:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6FE11B81B43;
 Wed, 10 Aug 2022 08:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B62C433D7;
 Wed, 10 Aug 2022 08:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660121403;
 bh=7DdOKNwMkF/itIl0UK3wH8fL2YQXQRsF8NfajD114MQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F3S3yEz0M0w7HP9XfGz0ge0moEg8QcvxJY4XEitq+WPpvaz4NWpROUX1+lftHOkjL
 rPoSWCkuDZ2Nqhf81ZqwgkzEis4eS2srSdN+pxEUdqUy4Y7tYHwu7mzieQ8coum6mP
 gnwg4Qo541x+kD8y8XbLd/P4f/OzpEoNGDBZ+3So=
Date: Wed, 10 Aug 2022 07:18:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mazin Al Haddad <mazinalhaddad05@gmail.com>
Subject: Re: [PATCH] tty: n_gsm: fix missing assignment of gsm->receive() in
 gsmld_attach_gsm()
Message-ID: <YvM/oKdt/NPfOiXS@kroah.com>
References: <20220810031251.91291-1-mazinalhaddad05@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220810031251.91291-1-mazinalhaddad05@gmail.com>
Cc: daniel.starke@siemens.com, jirislaby@kernel.org, paskripkin@gmail.com,
 syzbot+e3563f0c94e188366dbb@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, Aug 10, 2022 at 06:12:52AM +0300, Mazin Al Haddad wrote:
> Fixes a bug reported by syzbot.

I do not understand this sentence :(

> A null pointer dereference can
> happen when attempting to access the "gsm->receive()" function in
> gsmld_receive_buf(). Currently, the "gsm->receive()" function is only set
> after a call to the GSMIO_SETCONF ioctl. Since the gsmld_receive_buf()
> function can be accessed without the need to call the line discipline
> ioctl (GSMIO_SETCONF), the gsm->receive() function will not be set and a
> NULL pointer dereference will occur.
> 
> Fix this by setting the gsm->receive() function when the line discipline
> is being attached to the terminal device, inside gsmld_attach_gsm(). This
> will guarantee that the function is assigned and a call to TIOCSTI,
> which calls gsmld_receive_buf(), will not reference a null pointer.
> 
> Call Trace:
>  <TASK>
>  gsmld_receive_buf+0x1c2/0x2f0 drivers/tty/n_gsm.c:2861
>  tiocsti drivers/tty/tty_io.c:2293 [inline]
>  tty_ioctl+0xa75/0x15d0 drivers/tty/tty_io.c:2692
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:870 [inline]
>  __se_sys_ioctl fs/ioctl.c:856 [inline]
>  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> 
> Fixes: 01aecd917114 ("tty: n_gsm: fix tty registration before control channel open")
> Reported-and-tested-by: syzbot+e3563f0c94e188366dbb@syzkaller.appspotmail.com
> Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>

What commit does this fix?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
