Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59987CCA481
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 06:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3E0982422;
	Wed, 13 Jul 2022 06:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E0982422
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CrkiyJKL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBCIs_IzHk3z; Wed, 13 Jul 2022 06:37:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E1DAF81CAD;
	Wed, 13 Jul 2022 06:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1DAF81CAD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B08A9C0035;
	Wed, 13 Jul 2022 06:37:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4B54C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB46781CAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB46781CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jPt6XB7lF-M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:37:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FB1281C40
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FB1281C40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:37:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E401A61C5B;
 Wed, 13 Jul 2022 06:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE27C34114;
 Wed, 13 Jul 2022 06:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1657694237;
 bh=Pw1I724OC/j5jlM0PCtT/WmkZp+NkEnzCWrfGr+EzVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CrkiyJKL4LZ8Ull6nLdOM6zNZRpI27n7U3K5sErFqSQgtTrC/wXzx5+V67pB7Pv1B
 7DhE7DbRzjgMrjfy7JXV2Sodkh8EjbO6Wt9l7u39tSLvSNDJfk1HA5HMIZxINOTaRM
 yfE1PPjd2yttQVx+FHZm31Kl6eeBrx0pnpstymrg=
Date: Wed, 13 Jul 2022 08:37:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [RFC PATCH 1/1] net: kcm: Use sk_psock size for kcm_psock_cache
Message-ID: <Ys5oGuh2WCgEG5Js@kroah.com>
References: <20220713063204.6294-1-khalid.masum.92@gmail.com>
 <20220713063204.6294-2-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713063204.6294-2-khalid.masum.92@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Nikolay Aleksandrov <nikolay@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>,
 Stefano Garzarella <sgarzare@redhat.com>
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

On Wed, Jul 13, 2022 at 12:32:04PM +0600, Khalid Masum wrote:
> `struct sock` has a member `sk_user_data`, which got its memory allocated
> in `kcm_attach` by `kcm_psock_cache` with the size of `kcm_psock`. Which
> is not enough when the member is used as `sk_psock` causing out of bound
> read.
> 
> Use `sk_psock` size to allocate memory instead for `sk_user_data`.
> 
> Reported-by: syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
>  net/kcm/kcmsock.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

What commit id does this fix?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
