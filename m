Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19613C25B06
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Aug 2022 14:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872FD8248F;
	Sun, 14 Aug 2022 14:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872FD8248F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sqeP+WC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Abs8qD8LNcZb; Sun, 14 Aug 2022 14:45:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8363C8246F;
	Sun, 14 Aug 2022 14:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8363C8246F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57A96C0033;
	Sun, 14 Aug 2022 14:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 237E6C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 14:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04C8360BC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 14:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04C8360BC6
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=sqeP+WC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jp-pplxba3pb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 14:45:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE3060746
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BE3060746
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Aug 2022 14:45:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C35D860BB9;
 Sun, 14 Aug 2022 14:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3E6C433D7;
 Sun, 14 Aug 2022 14:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660488311;
 bh=iMBFg6BfWJyRlJEWO3cnG3IzMydQoIwzayCIiqd/lL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sqeP+WC8M3JPUEoMmWj9BuYa9NwUVS63OcZXLi7LrnZLJ/ZMHBPJSBSTzBMMFyQ8Q
 AWGUg0MjUaViHFgDo2SClIfVd4OgYIBEuE2LKawXPrbmReif6bx3SpGya7it7fPc4Z
 TgjBMDMQ0uy3vNs6iL5XizwfeEcsNAZ0+atGvUUE=
Date: Sun, 14 Aug 2022 16:45:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gautam Menghani <gautammenghani201@gmail.com>
Subject: Re: [PATCH] drivers/media/rc: Ensure usb_submit_urb() is not called
 if write is in progress
Message-ID: <YvkKdIL8UVhKrI0Q@kroah.com>
References: <20220814142543.24910-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814142543.24910-1-gautammenghani201@gmail.com>
Cc: hdanton@sina.com, sean@mess.org, linux-kernel@vger.kernel.org,
 syzbot+0c3cb6dc05fbbdc3ad66@syzkaller.appspotmail.com, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

On Sun, Aug 14, 2022 at 07:55:42PM +0530, Gautam Menghani wrote:
> The warning "URB submitted while active" is reported if the function
> send_packet() in imon.c is called if a write is already is in progress.
> Add a check to return -EBUSY in case a write is already is in progress.
> Also, mark tx.busy as false after transmission is completed.
> 
> Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
> Cc: hdanton@sina.com
> Suggested-by: hdanton@sina.com
> Link: https://syzkaller.appspot.com/bug?id=e378e6a51fbe6c5cc43e34f131cc9a315ef0337e
> Reported-by: syzbot+0c3cb6dc05fbbdc3ad66@syzkaller.appspotmail.com
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  drivers/media/rc/imon.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index 735b925da998..a5b997c2c7e2 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -598,6 +598,8 @@ static int send_packet(struct imon_context *ictx)
>  	int retval = 0;
>  	struct usb_ctrlrequest *control_req = NULL;
>  
> +	if (ictx->tx.busy)
> +		return -EBUSY;

What happens if we go busy right after this check?  Where is the locking
here to protect this?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
