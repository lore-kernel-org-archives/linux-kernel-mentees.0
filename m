Return-Path: <SRS0=UC8y=IY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D508C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Mar 2021 13:56:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B1061A1D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Mar 2021 13:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01B1061A1D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B001C60C24;
	Fri, 26 Mar 2021 13:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbH24xBp963e; Fri, 26 Mar 2021 13:56:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFBC560C13;
	Fri, 26 Mar 2021 13:56:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7C14C000E;
	Fri, 26 Mar 2021 13:56:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1878BC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 13:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA11D40252
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 13:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxkq8n7-oUAK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 13:56:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53C6F400C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Mar 2021 13:56:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4380B619A0;
 Fri, 26 Mar 2021 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616766992;
 bh=O7IRWgd00UHT0VyHJxToyfBcxmszCLnq1Pe7Rl41vIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nHBx1s7kmQhhBdrxT2Z/StHNZaSpQs15JgcY3TEZa9jr0JBap0+i+ekF9XWvPHU5q
 nVaQDuxy0f31kCs8QT/kxdhz1LWCJ/hfhZndhBocLqIGCRbEUkj8nMDOZpPx4w54Eq
 UGwx4xomCwc5VeSGTK8+jgMiPOE7cGiAJ3IadIGM=
Date: Fri, 26 Mar 2021 14:56:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH resend] jfs: fix use-after-free in lbmIODone
Message-ID: <YF3oDrnN3RJBFQ0P@kroah.com>
References: <20210322161147.5593-1-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322161147.5593-1-mail@anirudhrb.com>
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 syzbot+5d2008bd1f1b722ba94e@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>,
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

On Mon, Mar 22, 2021 at 09:41:47PM +0530, Anirudh Rayabharam wrote:
> Fix use-after-free by waiting for ongoing IO to complete before freeing
> lbufs in lbmLogShutdown. Add a counter in struct jfs_log to keep track
> of the number of in-flight IO operations and a wait queue to wait on for
> the IO operations to complete.
> 
> Reported-by: syzbot+5d2008bd1f1b722ba94e@syzkaller.appspotmail.com
> Suggested-by: Hillf Danton <hdanton@sina.com>
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>  fs/jfs/jfs_logmgr.c | 17 ++++++++++++++---
>  fs/jfs/jfs_logmgr.h |  2 ++
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
> index 9330eff210e0..82d20c4687aa 100644
> --- a/fs/jfs/jfs_logmgr.c
> +++ b/fs/jfs/jfs_logmgr.c
> @@ -1815,6 +1815,8 @@ static int lbmLogInit(struct jfs_log * log)
>  	 */
>  	init_waitqueue_head(&log->free_wait);
>  
> +	init_waitqueue_head(&log->io_waitq);
> +
>  	log->lbuf_free = NULL;
>  
>  	for (i = 0; i < LOGPAGES;) {
> @@ -1864,6 +1866,7 @@ static void lbmLogShutdown(struct jfs_log * log)
>  	struct lbuf *lbuf;
>  
>  	jfs_info("lbmLogShutdown: log:0x%p", log);
> +	wait_event(log->io_waitq, !atomic_read(&log->io_inflight));
>  
>  	lbuf = log->lbuf_free;
>  	while (lbuf) {
> @@ -1990,6 +1993,8 @@ static int lbmRead(struct jfs_log * log, int pn, struct lbuf ** bpp)
>  	bio->bi_end_io = lbmIODone;
>  	bio->bi_private = bp;
>  	bio->bi_opf = REQ_OP_READ;
> +
> +	atomic_inc(&log->io_inflight);
>  	/*check if journaling to disk has been disabled*/
>  	if (log->no_integrity) {
>  		bio->bi_iter.bi_size = 0;
> @@ -2135,6 +2140,7 @@ static void lbmStartIO(struct lbuf * bp)
>  	bio->bi_private = bp;
>  	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC;
>  
> +	atomic_inc(&log->io_inflight);

Why use an atomic for this?  The value can change after you test for it,
as there's no lock involved.

Do you really need to keep track of all of these "inflight"?  That feels
very "heavy" to me.

jfs developers, any ideas?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
