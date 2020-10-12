Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01330C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 08:06:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24AD52080D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 08:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24AD52080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codewreck.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C5E9185F58;
	Mon, 12 Oct 2020 08:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZL6UUqMJnggC; Mon, 12 Oct 2020 08:06:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4262485F53;
	Mon, 12 Oct 2020 08:06:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C05BC07FF;
	Mon, 12 Oct 2020 08:06:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3F97C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 08:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1F81D815BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 08:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2U-LGnLfnwQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 08:06:30 +0000 (UTC)
X-Greylist: delayed 00:06:58 by SQLgrey-1.7.6
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AE51186F9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 08:06:26 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 1001)
 id B3EDCC009; Mon, 12 Oct 2020 09:59:25 +0200 (CEST)
Date: Mon, 12 Oct 2020 09:59:10 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20201012075910.GA17745@nautica>
References: <20201012042404.2508-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012042404.2508-1-anant.thazhemadam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: lucho@ionkov.net, syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com,
 ericvh@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, v9fs-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH net] net: 9p: initialize
 sun_server.sun_path to have addr's value only when addr is valid
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

Anant Thazhemadam wrote on Mon, Oct 12, 2020:
> In p9_fd_create_unix, checking is performed to see if the addr (passed
> as an argument) is NULL or not.
> However, no check is performed to see if addr is a valid address, i.e.,
> it doesn't entirely consist of only 0's.
> The initialization of sun_server.sun_path to be equal to this faulty
> addr value leads to an uninitialized variable, as detected by KMSAN.
> Checking for this (faulty addr) and returning a negative error number
> appropriately, resolves this issue.

I'm not sure I agree a fully zeroed address is faulty but I agree we can
probably refuse it given userspace can't pass useful abstract addresses
here.

Just one nitpick but this is otherwise fine - good catch!

> Reported-by: syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com
> Tested-by: syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
>  net/9p/trans_fd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/9p/trans_fd.c b/net/9p/trans_fd.c
> index c0762a302162..8f528e783a6c 100644
> --- a/net/9p/trans_fd.c
> +++ b/net/9p/trans_fd.c
> @@ -1023,7 +1023,7 @@ p9_fd_create_unix(struct p9_client *client, const char *addr, char *args)
>  
>  	csocket = NULL;
>  
> -	if (addr == NULL)
> +	if (!addr || !strlen(addr))

Since we don't care about the actual length here, how about checking for
addr[0] directly?
That'll spare a strlen() call in the valid case.

Well, I guess it doesn't really matter -- I'll queue this up anyway and
update if you resend.


Thanks,
-- 
Dominique
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
