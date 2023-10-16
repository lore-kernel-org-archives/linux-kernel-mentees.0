Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285F8CDB482
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Oct 2023 01:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92320414C8;
	Mon, 16 Oct 2023 01:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92320414C8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1152-bit key) header.d=isely.net header.i=@isely.net header.a=rsa-sha256 header.s=deb header.b=BU2P7bfw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5LtMrJDB8oC; Mon, 16 Oct 2023 01:55:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1C1E94036F;
	Mon, 16 Oct 2023 01:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C1E94036F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6F16C0039;
	Mon, 16 Oct 2023 01:55:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58484C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 01:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id 2092460F49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 01:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2092460F49
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1152-bit key) header.d=isely.net header.i=@isely.net
 header.a=rsa-sha256 header.s=deb header.b=BU2P7bfw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id JXO66WpCKFju
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 01:55:08 +0000 (UTC)
X-Greylist: delayed 309 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 16 Oct 2023 01:55:08 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA12860F2C
Received: from cnc.isely.net (cnc.isely.net [192.69.181.175])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id BA12860F2C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 01:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=isely.net; s=deb;
 t=1697420997; bh=kS0RTd3CYTDBCJcqdUFcBC+zypJLcH4lZRAhcLFcZb8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References;
 b=BU2P7bfwss2/P+6aqWSIk9NJvJoB13SWtKIlBfGLT7svcwvSlZDnlIJUXIhcYjjUb
 b2yTdAX8rOy6iZa101JPW+Bc+nwQbYEQKFp3f9+9B49/hOZ2SbHpO7cpq1+gWKSUJb
 Rk7iL1Zq3+Cn2TaFXegiEyyVUkaKHoyDguYGqL/XaVeVnjnJupWJ7O9/dgH6O
Original-Subject: Re: [PATCH] media: pvrusb2: fix use after free on context
 disconnection
Author: Mike Isely <isely@isely.net>
Original-cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 syzbot+621409285c4156a009b3@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Received: from sheridan.isely.net (sheridan.isely.net [::ffff:192.168.24.5])
 (AUTH: PLAIN isely, TLS: TLS1.3,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
 by cnc.isely.net with ESMTPSA
 id 0000000000080091.00000000652C96C5.00000BA0; Sun, 15 Oct 2023 20:49:57 -0500
Date: Sun, 15 Oct 2023 20:49:57 -0500 (CDT)
From: Mike Isely <isely@isely.net>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH] media: pvrusb2: fix use after free on context
 disconnection
In-Reply-To: <20231012230911.48113-2-ricardo@marliere.net>
Message-ID: <5f652494-1e4f-4965-f9b7-0f2bf05f718f@isely.net>
References: <20231012230911.48113-2-ricardo@marliere.net>
Mime-Version: 1.0
Cc: syzbot+621409285c4156a009b3@syzkaller.appspotmail.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media@vger.kernel.org
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


Acked-by: Mike Isely <isely@pobox.com>

  -Mike

On Thu, 12 Oct 2023, Ricardo B. Marliere wrote:

> Upon module load, a kthread is created targeting the
> pvr2_context_thread_func function, which may call pvr2_context_destroy
> and thus call kfree() on the context object. However, that might happen
> before the usb hub_event handler is able to notify the driver. This
> patch adds a sanity check before the invalid read reported by syzbot,
> within the context disconnection call stack.
> 
> Fixes: e5be15c63804 ("V4L/DVB (7711): pvrusb2: Fix race on module unload")
> Reported-and-tested-by: syzbot+621409285c4156a009b3@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/000000000000a02a4205fff8eb92@google.com/
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-context.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-context.c b/drivers/media/usb/pvrusb2/pvrusb2-context.c
> index 14170a5d72b3..1764674de98b 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-context.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-context.c
> @@ -268,7 +268,8 @@ void pvr2_context_disconnect(struct pvr2_context *mp)
>  {
>  	pvr2_hdw_disconnect(mp->hdw);
>  	mp->disconnect_flag = !0;
> -	pvr2_context_notify(mp);
> +	if (!pvr2_context_shutok())
> +		pvr2_context_notify(mp);
>  }
>  
>  
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
