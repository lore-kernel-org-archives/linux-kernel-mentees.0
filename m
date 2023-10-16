Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E6DCDB465
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Oct 2023 09:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A563A61361;
	Mon, 16 Oct 2023 09:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A563A61361
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NRflpb9i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytzpeajLQtmr; Mon, 16 Oct 2023 09:50:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4241161363;
	Mon, 16 Oct 2023 09:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4241161363
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1911AC0071;
	Mon, 16 Oct 2023 09:50:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0669BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 09:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2B0F40979
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 09:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2B0F40979
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=NRflpb9i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXqpsc_8M_G3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 09:50:23 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F03240895
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 09:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F03240895
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 71B9DB81202;
 Mon, 16 Oct 2023 09:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1929C433C9;
 Mon, 16 Oct 2023 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697449819;
 bh=3qu5yONyWa09qHBA5krufIoFjAXIFT/JnmHaxFdNKbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NRflpb9iTrQMM1roVvBLDaaRC/btPdgwE+P5YkY0ui/HfGIgWe422OSHysA8DAeAY
 XbLUi+vCbF1lVsHHtr+bUFY11iQXK9sJiTjNuHX9jL5P8Lm54roOwSkHCB1HUqQAyY
 A7DZ3lGgY8HTvtlHq8hhPkhD+X9px3M4k3HcLZPxehfS4z+bQqWj4+iinJPl+QZixF
 2NoNSGs1CDFItkr8+X9xqwu5CQ/OhYvEM1Fnh7u1Z9BhZUOvJR1ChRSQgLHupg0Y03
 sNMQp9mpUfuPSGvpWcjn/CbhPDY2Q1UemvacMhWvS6kggtPqwuTXSqfYG5/F/XYK49
 sG3yOKByvNj+Q==
Date: Mon, 16 Oct 2023 11:50:15 +0200
From: Simon Horman <horms@kernel.org>
To: Juntong Deng <juntong.deng@outlook.com>
Subject: Re: [PATCH] net/tls: Fix slab-use-after-free in tls_encrypt_done
Message-ID: <20231016095015.GJ1501712@kernel.org>
References: <VI1P193MB0752428D259D066379242BD099D3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P193MB0752428D259D066379242BD099D3A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Cc: syzbot+29c22ea2d6b2c5fd2eae@syzkaller.appspotmail.com, borisp@nvidia.com,
 netdev@vger.kernel.org, john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
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

On Thu, Oct 12, 2023 at 07:02:51PM +0800, Juntong Deng wrote:
> In the current implementation, ctx->async_wait.completion is completed
> after spin_lock_bh, which causes tls_sw_release_resources_tx to
> continue executing and return to tls_sk_proto_cleanup, then return

Hi Juntong Deng,

I'm slightly confused by "causes tls_sw_release_resources_tx to  continue
executing".

What I see in tls_sw_release_resources_tx() is:

        /* Wait for any pending async encryptions to complete */   
        spin_lock_bh(&ctx->encrypt_compl_lock);
        ctx->async_notify = true;
        pending = atomic_read(&ctx->encrypt_pending);
        spin_unlock_bh(&ctx->encrypt_compl_lock);  

Am I wrong in thinking the above will block because
(the same) ctx->encrypt_compl_lock is held in tls_encrypt_done?

> to tls_sk_proto_close, and after that enter tls_sw_free_ctx_tx to kfree
> the entire struct tls_context (including ctx->encrypt_compl_lock).
> 
> Since ctx->encrypt_compl_lock has been freed, subsequent spin_unlock_bh
> will result in slab-use-after-free error. Due to SMP, even using
> spin_lock_bh does not prevent tls_sw_release_resources_tx from continuing
> on other CPUs. After tls_sw_release_resources_tx is woken up, there is no
> attempt to hold ctx->encrypt_compl_lock again, therefore everything
> described above is possible.
> 
> The fix is to put complete(&ctx->async_wait.completion) after
> spin_unlock_bh, making the release after the unlock. Since complete is
> only executed if pending is 0, which means this is the last record, there
> is no need to worry about race condition causing duplicate completes.
> 
> Reported-by: syzbot+29c22ea2d6b2c5fd2eae@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=29c22ea2d6b2c5fd2eae
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
> ---
>  net/tls/tls_sw.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 270712b8d391..7abe5a6aa989 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -441,6 +441,7 @@ static void tls_encrypt_done(void *data, int err)
>  	struct sk_msg *msg_en;
>  	bool ready = false;
>  	struct sock *sk;
> +	int async_notify;
>  	int pending;
>  
>  	msg_en = &rec->msg_encrypted;
> @@ -482,10 +483,11 @@ static void tls_encrypt_done(void *data, int err)
>  
>  	spin_lock_bh(&ctx->encrypt_compl_lock);
>  	pending = atomic_dec_return(&ctx->encrypt_pending);
> +	async_notify = ctx->async_notify;
> +	spin_unlock_bh(&ctx->encrypt_compl_lock);
>  
> -	if (!pending && ctx->async_notify)
> +	if (!pending && async_notify)
>  		complete(&ctx->async_wait.completion);
> -	spin_unlock_bh(&ctx->encrypt_compl_lock);
>  
>  	if (!ready)
>  		return;
> -- 
> 2.39.2
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
