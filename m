Return-Path: <SRS0=0rjs=LP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73018C48BE5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Jun 2021 08:54:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1D760FE9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Jun 2021 08:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1D760FE9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBCDC606A9;
	Mon, 21 Jun 2021 08:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1ls6YzJsWwL; Mon, 21 Jun 2021 08:54:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0BFB56066F;
	Mon, 21 Jun 2021 08:54:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E27F4C000E;
	Mon, 21 Jun 2021 08:54:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0D85C000C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jun 2021 08:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF29540195
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jun 2021 08:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RX-V949V5dCG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jun 2021 08:54:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51A7F40186
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Jun 2021 08:54:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2964060724;
 Mon, 21 Jun 2021 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624265668;
 bh=VcbXkDe9DOW5t++lY6Mh89RpWsDOFcnF5LaCm5CLVu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xmzMcAcftuSuGmVHxWPyg82c8VgqbVJWe/R2fZFNNlpRxtGwcDY9wLgnE+F1a0iWQ
 ygf32c0yBJb1/3S4EYAXdGCCAmYhbrV0VZ+x59xsXGZsjoBsiR/He9x4b9V+/nMvbN
 JX2eRKEvBqPPPBp+I/qA1cmpLoQAu7q4l4PxgwKw=
Date: Mon, 21 Jun 2021 10:54:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH v2] block: genhd: don't call probe function with
 major_names_lock held
Message-ID: <YNBTwhbJ/uiE8iZe@kroah.com>
References: <f790f8fb-5758-ea4e-a527-0ee4af82dd44@i-love.sakura.ne.jp>
 <YM2STfTN5AupWlSa@kroah.com>
 <20210620024403.820-1-hdanton@sina.com>
 <24b7c3a9-e10a-f983-9fde-1ae66b0bc6b0@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24b7c3a9-e10a-f983-9fde-1ae66b0bc6b0@i-love.sakura.ne.jp>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 Hillf Danton <hdanton@sina.com>, vigneshr@ti.com, richard@nod.at,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, desmondcheongzx@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Sun, Jun 20, 2021 at 10:54:20PM +0900, Tetsuo Handa wrote:
> On 2021/06/20 11:44, Hillf Danton wrote:
> > Good craft in regard to triggering the ABBA deadlock, but curious why not
> > move unregister_blkdev out of and before loop_ctl_mutex, given it will also
> > serialise with the prober.
> > 
> 
> Well, something like this untested diff?
> 
> Call unregister_blkdev() as soon as __exit function starts, for calling
> probe function after cleanup started will be unexpected for __exit function.
> 
> Keep probe function no-op until __init function ends, for probe function
> might be called as soon as __register_blkdev() succeeded but calling probe
> function before setup completes will be unexpected for __init function.
> 
>  drivers/block/ataflop.c |    6 +++++-
>  drivers/block/brd.c     |    8 ++++++--
>  drivers/block/floppy.c  |    4 ++++
>  drivers/block/loop.c    |    4 ++--
>  drivers/ide/ide-probe.c |    8 +++++++-
>  drivers/md/md.c         |    5 +++++
>  drivers/scsi/sd.c       |   10 +---------
>  7 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
> index d601e49f80e0..3681e8c493b1 100644
> --- a/drivers/block/ataflop.c
> +++ b/drivers/block/ataflop.c
> @@ -1995,6 +1995,7 @@ static int ataflop_alloc_disk(unsigned int drive, unsigned int type)
>  }
>  
>  static DEFINE_MUTEX(ataflop_probe_lock);
> +static bool module_initialize_completed;

This is almost always wrong.

>  
>  static void ataflop_probe(dev_t dev)
>  {
> @@ -2006,6 +2007,8 @@ static void ataflop_probe(dev_t dev)
>  
>  	if (drive >= FD_MAX_UNITS || type >= NUM_DISK_MINORS)
>  		return;
> +	if (!module_initialize_completed)
> +		return;

This is not correct, when you register a callback structure, it can be
instantly called.  Do not expect it to be delayed until later.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
