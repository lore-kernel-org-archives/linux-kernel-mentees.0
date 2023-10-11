Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B20FCD98C7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Oct 2023 06:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 262A1818A2;
	Wed, 11 Oct 2023 06:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 262A1818A2
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wT4buVgU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bstiNoMn0Pt2; Wed, 11 Oct 2023 06:30:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1155881B10;
	Wed, 11 Oct 2023 06:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1155881B10
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF857C0039;
	Wed, 11 Oct 2023 06:30:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B9FEC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 06:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2710881B70
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 06:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2710881B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3B8JXxtsgd1I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 06:30:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1C0E818A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 06:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1C0E818A2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BA1EEB81F4D;
 Wed, 11 Oct 2023 06:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E06C433C7;
 Wed, 11 Oct 2023 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1697005823;
 bh=cOfTkY43H2nW587bRbrhIWOL7GLGr7wMPsVn9tjAmW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wT4buVgUFRsybw4xiRLI0LgTqeVc7oFuas3/Y5EtgAlXJfXTG2Bn/LrQ4zN5W+gyo
 93GacY0ieRvY5wmyPmzX0Lf4ly56RkkjmEm5q0aOccBGmvYUIdIV7cg/rdiww5exmR
 tqMdWp9VVKmvolYBfYeWBF2CWiKZ/I1GP1vp07c0=
Date: Wed, 11 Oct 2023 08:30:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: Re: [PATCH] Remove extra unlock for the mutex
Message-ID: <2023101136-irritate-shrine-cde6@gregkh>
References: <20231010224630.238254-1-singhabhinav9051571833@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010224630.238254-1-singhabhinav9051571833@gmail.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On Wed, Oct 11, 2023 at 04:16:30AM +0530, Abhinav Singh wrote:
> There is a double unlock on mutex. This can cause undefined behaviour.
> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>  net/ipv4/inet_connection_sock.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> index aeebe8816689..f11fe8c727a4 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -597,7 +597,6 @@ int inet_csk_get_port(struct sock *sk, unsigned short snum)
>  	}
>  	if (head2_lock_acquired)
>  		spin_unlock(&head2->lock);
> -	spin_unlock_bh(&head->lock);

How was this tested?

And where is the now-needed unlock of the head->lock?

How was this change found?

And your subject line needs a lot of work...

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
