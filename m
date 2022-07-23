Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13CEC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jul 2022 14:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FF8C40B0C;
	Sat, 23 Jul 2022 14:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF8C40B0C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=2v4Ogmb1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E70sYhM5Cp6K; Sat, 23 Jul 2022 14:03:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2F77740B08;
	Sat, 23 Jul 2022 14:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F77740B08
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEE6AC0033;
	Sat, 23 Jul 2022 14:03:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68822C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D95960AF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D95960AF0
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=2v4Ogmb1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scmG14TKOXTo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:03:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C27ED606F2
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C27ED606F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:03:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1339DB8092D;
 Sat, 23 Jul 2022 14:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446A9C341C0;
 Sat, 23 Jul 2022 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658585016;
 bh=XqGMGbWcq/P/xI62FKVCA6GKm6TlYQEjhChvhcH8c6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2v4Ogmb1fTi6SwT/Cl8Yh7GOWTfgYMWnRtwFzv4NkzAvLBEQ4id717IHS/adN5rmh
 ScFUmUAENhzejbd4i51Tmupu3c2iNmwZxV75dfibaN3amEb+eP2d10ZlngTPGZVDpV
 tHnNtGv970qVPIm8c6jnOVFxSNJyNyM8ylAXKHOA=
Date: Sat, 23 Jul 2022 16:03:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Message-ID: <Ytv/tUrdK1ZTn4Uk@kroah.com>
References: <20220723135447.199557-1-code@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220723135447.199557-1-code@siddh.me>
Cc: syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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

On Sat, Jul 23, 2022 at 07:24:47PM +0530, Siddh Raman Pant via Linux-kernel-mentees wrote:
> If not done, a reference to a freed pipe remains in the watch_queue,
> as this function is called before freeing a pipe in free_pipe_info()
> (see line 834 of fs/pipe.c).
> 
> This causes a UAF when post_one_notification tries to access the pipe on
> a key update, which is reported by syzbot.
> 
> Bug report: https://syzkaller.appspot.com/bug?id=1870dd7791ba05f2ea7f47f7cbdde701173973fc
> Reported-and-tested-by: syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com
> 
> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
>  kernel/watch_queue.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
> index bb9962b33f95..bab9e09c74cf 100644
> --- a/kernel/watch_queue.c
> +++ b/kernel/watch_queue.c
> @@ -637,8 +637,17 @@ void watch_queue_clear(struct watch_queue *wqueue)
>  		spin_lock_bh(&wqueue->lock);
>  	}
>  
> -	spin_unlock_bh(&wqueue->lock);
>  	rcu_read_unlock();
> +
> +	/* Clearing the watch queue, so we should clean the associated pipe. */
> +#ifdef CONFIG_WATCH_QUEUE

You should not use #ifdef in .c files, it's unmaintainable over time.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
