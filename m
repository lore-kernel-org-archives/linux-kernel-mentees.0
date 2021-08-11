Return-Path: <SRS0=y1cr=NC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C42C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 22:12:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04D4261019
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 22:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04D4261019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A216F40205;
	Wed, 11 Aug 2021 22:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Bx93i7IP9Of; Wed, 11 Aug 2021 22:12:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 60313402D5;
	Wed, 11 Aug 2021 22:12:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43836C0010;
	Wed, 11 Aug 2021 22:12:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 831B6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 22:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7270C83AC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 22:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mess.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sC19TdEkIqcg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 22:12:36 +0000 (UTC)
X-Greylist: delayed 00:10:00 by SQLgrey-1.8.0
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23B3683AB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 22:12:36 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id B55E7C63FA; Wed, 11 Aug 2021 22:54:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1628718861; bh=wP+KfV1K5Aheg65Q3eew3Tf/ttId206mNOCxpxd/k14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sKpPyjT6eyd2CJkNT1y9K7fKiIq7U/WLse0MX6NRuaZAoz+3xpcz4JBVeSXVF2lQA
 d+qJ2KORoXRKNndWJYgD/5g6FyQeZhH7NOOhtbufBwJBaGpg9Nb41ncS0vh/Ljxv7k
 adzmvkG91v95tnboW2LNJZLLgnylkfyozCcupoUK1jQm+yHSTHI75Imh+AVpRD3oiP
 1RXjrqz91/UHbWoiVYnGfzOR6+L5NwAWNlEJ5TYSnUgwlSPB6pLZy1hDXOr0TrtQeX
 ZgbSYmd1ptiI4+7HbeLMCK13ZbGxCatGLxYgi9u8qzGk2ZEU6+LZM39PHH/GfHi+Ys
 MC6LZDYhDb4uA==
Date: Wed, 11 Aug 2021 22:54:21 +0100
From: Sean Young <sean@mess.org>
To: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH] media: dvb-usb: fix memory leak in
 cinergyt2_frontend_attach
Message-ID: <20210811215421.GA28513@gofer.mess.org>
References: <20210620202317.4338-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210620202317.4338-1-paskripkin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: thierry.merle@free.fr, linux-kernel@vger.kernel.org,
 tomimo@ncircle.nullnet.fi, mchehab@kernel.org,
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

On Sun, Jun 20, 2021 at 11:23:17PM +0300, Pavel Skripkin wrote:
> My local syzbot instance hit a memory leak in
> cinergyt2_frontend_attach() [1].
> 
> The problem was in non-freed dvb_frontend in case of error.
> If dvb_usb_generic_rw() call fails, an error will be returned from
> cinergyt2_frontend_attach() [1] and num_adapters_initialized of
> dvb_usb_device won't be incremented. That means dvb usb library
> won't take care of freeing allocated frontend.

This issue is already fixed by:

9ad1efee086e0 media: dvd_usb: memory leak in cinergyt2_fe_attach

Thanks for reporting and making a patch though.


Sean

> 
> Fail log:
> BUG: memory leak
> unreferenced object 0xffff88801d9c6000 (size 2048):
>   comm "kworker/1:3", pid 2960, jiffies 4295150569 (age 17.150s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 54 65 72 72 61 54 65 63  ........TerraTec
>     2f 71 61 6e 75 20 55 53 42 32 2e 30 20 48 69 67  /qanu USB2.0 Hig
>   backtrace:
>     [<ffffffff85e169f0>] kmalloc include/linux/slab.h:556 [inline]
>     [<ffffffff85e169f0>] kzalloc include/linux/slab.h:686 [inline]
>     [<ffffffff85e169f0>] cinergyt2_fe_attach+0x40/0x110 drivers/media/usb/dvb-usb/cinergyT2-fe.c:271
>     [<ffffffff85e15b31>] cinergyt2_frontend_attach+0x61/0x140 drivers/media/usb/dvb-usb/cinergyT2-core.c:74 [1]
>     [<ffffffff85dcd71e>] dvb_usb_adapter_frontend_init+0x35e/0x5b0 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:290
>     [<ffffffff88f98e83>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:90 [inline]
>     [<ffffffff88f98e83>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:184 [inline]
> 
> Fixes: 986bd1e58b18 ("V4L/DVB (9107): Alternative version of Terratec Cinergy T2
> driver")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/media/usb/dvb-usb/cinergyT2-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/usb/dvb-usb/cinergyT2-core.c b/drivers/media/usb/dvb-usb/cinergyT2-core.c
> index 969a7ec71dff..fb60af097535 100644
> --- a/drivers/media/usb/dvb-usb/cinergyT2-core.c
> +++ b/drivers/media/usb/dvb-usb/cinergyT2-core.c
> @@ -79,6 +79,7 @@ static int cinergyt2_frontend_attach(struct dvb_usb_adapter *adap)
>  	ret = dvb_usb_generic_rw(d, st->data, 1, st->data, 3, 0);
>  	if (ret < 0) {
>  		deb_rc("cinergyt2_power_ctrl() Failed to retrieve sleep state info\n");
> +		kfree(adap->fe_adap[0].fe);
>  	}
>  	mutex_unlock(&d->data_mutex);
>  
> -- 
> 2.32.0
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
