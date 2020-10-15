Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E62C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 05:12:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD990206D4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 05:12:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="17sdWbGE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD990206D4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 240C58831E;
	Thu, 15 Oct 2020 05:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 265gpx37g3Rz; Thu, 15 Oct 2020 05:12:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A68E588313;
	Thu, 15 Oct 2020 05:12:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F049C0052;
	Thu, 15 Oct 2020 05:12:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20D83C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 05:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0859A88792
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 05:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x36LloWAJOTU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 05:12:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 581D98878F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 05:12:28 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 360CE206C1;
 Thu, 15 Oct 2020 05:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602738747;
 bh=l66933Qijvlma2H2mJiGIE31Bp4WgAXHjUxLzCCBTQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=17sdWbGEA46Tkwiolaxdp1AEB0ed3BVPASRr7PQB4SPbC5gviCBCQVkxMp2I8Zaj8
 cTftTKMrS7wDdGimIej8j9dznomg+fIQ8Yl6YrS0kF4XQaFGZScTtthPbSw/8cG+CA
 t+NsxnIW58q3s74WKBIBdgvWVV4i+zD6TwYbe7/g=
Date: Thu, 15 Oct 2020 07:12:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anmol Karn <anmol.karan123@gmail.com>
Message-ID: <20201015051225.GA404970@kroah.com>
References: <20201015001712.72976-1-anmol.karan123@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015001712.72976-1-anmol.karan123@gmail.com>
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com,
 linux-hams@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: rose: Fix Null pointer
 dereference in rose_send_frame()
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

On Thu, Oct 15, 2020 at 05:47:12AM +0530, Anmol Karn wrote:
> In rose_send_frame(), when comparing two ax.25 addresses, it assigns rose_call to 
> either global ROSE callsign or default port, but when the former block triggers and 
> rose_call is assigned by (ax25_address *)neigh->dev->dev_addr, a NULL pointer is 
> dereferenced by 'neigh' when dereferencing 'dev'.
> 
> - net/rose/rose_link.c
> This bug seems to get triggered in this line:
> 
> rose_call = (ax25_address *)neigh->dev->dev_addr;
> 
> Prevent it by checking NULL condition for neigh->dev before comparing addressed for 
> rose_call initialization.
> 
> Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
> Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3 
> Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> ---
> I am bit sceptical about the error return code, please suggest if anything else is 
> appropriate in place of '-ENODEV'.
> 
>  net/rose/rose_link.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> index f6102e6f5161..92ea6a31d575 100644
> --- a/net/rose/rose_link.c
> +++ b/net/rose/rose_link.c
> @@ -97,6 +97,9 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
>  	ax25_address *rose_call;
>  	ax25_cb *ax25s;
>  
> +	if (!neigh->dev)
> +		return -ENODEV;

How can ->dev not be set at this point in time?  Shouldn't that be
fixed, because it could change right after you check this, right?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
