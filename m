Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EA9C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Aug 2023 14:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B449B414C0;
	Wed,  2 Aug 2023 14:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B449B414C0
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kAuYgegW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvEUPbns0zJg; Wed,  2 Aug 2023 14:14:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AC07740B08;
	Wed,  2 Aug 2023 14:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC07740B08
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 786EEC0072;
	Wed,  2 Aug 2023 14:14:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83916C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 14:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A1B260E8A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 14:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1B260E8A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=kAuYgegW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AU1xk1GzOtuM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 14:14:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BFFA6115A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 14:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BFFA6115A
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D6DB6197C;
 Wed,  2 Aug 2023 14:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09C9C433C7;
 Wed,  2 Aug 2023 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690985641;
 bh=ixO3LW1/xG1Uw3thkOLsUVsmX4WxJS5JtOiOzZ6KopY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kAuYgegW0u5NM64phkQrrDrwF4h7B7xnXN7p6M/F8Cd2MBPO4F4ncJ0OmtVgZJd6n
 PpfcX8GuHc+9uqwDuCdBIgRYjUyPa+lqbOb+xeUHSAS1lcGeFoi3JpiWoN4Ag/trJS
 3Gssh3DwqDbyIPqIzi/ymfay+iI/x6/9y+t4vEd8SvqPUQXkFt17viu78FZyXoP0DF
 z/tX65EyO7MUu9U/wGTATJ/2GA1h0d2pcy6Jc4CE/g8tZnT6gDSk97ZTcMSSZ1Xpk3
 NzQmFE+TooPwhS+mlV7Yii3FF4Cqt8Y7D4f4kSl1sXBvMs0eAEqc75DJAVUZLUw0il
 aiV+0RKKtxCdA==
Message-ID: <2cb34364-0d7c-cf0a-487f-c15ba6568ac8@kernel.org>
Date: Wed, 2 Aug 2023 16:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] drivers: net: prevent tun_build_skb() to exceed
 the packet size limit
Content-Language: en-US
To: Andrew Kanner <andrew.kanner@gmail.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jasowang@redhat.com, netdev@vger.kernel.org, dsahern@gmail.com,
 jbrouer@redhat.com, john.fastabend@gmail.com, linux-kernel@vger.kernel.org
References: <20230801220710.464-1-andrew.kanner@gmail.com>
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20230801220710.464-1-andrew.kanner@gmail.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 02/08/2023 00.07, Andrew Kanner wrote:
> Using the syzkaller repro with reduced packet size it was discovered
> that XDP_PACKET_HEADROOM is not checked in tun_can_build_skb(),
> although pad may be incremented in tun_build_skb(). This may end up
> with exceeding the PAGE_SIZE limit in tun_build_skb().
> 
> Fixes: 7df13219d757 ("tun: reserve extra headroom only when XDP is set")
> Link: https://syzkaller.appspot.com/bug?extid=f817490f5bd20541b90a
> Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
> ---
> 
> Notes:
>      v3 -> v4:
>      * fall back to v1, fixing only missing XDP_PACKET_HEADROOM in pad and
>        removing bpf_xdp_adjust_tail() check for frame_sz.
>      * added rcu read lock, noted by Jason Wang <jasowang@redhat.com> in v1
>      * I decided to leave the packet length check in tun_can_build_skb()
>        instead of moving to tun_build_skb() suggested by Jason Wang
>        <jasowang@redhat.com>. Otherwise extra packets will be dropped
>        without falling back to tun_alloc_skb(). And in the discussion of v3
>        Jesper Dangaard Brouer <jbrouer@redhat.com> noticed that XDP is ok
>        with a higher order pages if it's a contiguous physical memory
>        allocation, so falling to tun_alloc_skb() -> do_xdp_generic() should
>        be ok.
>      
>      v2 -> v3:
>      * attach the forgotten changelog
>      
>      v1 -> v2:
>      * merged 2 patches in 1, fixing both issues: WARN_ON_ONCE with
>        syzkaller repro and missing XDP_PACKET_HEADROOM in pad
>      * changed the title and description of the execution path, suggested
>        by Jason Wang <jasowang@redhat.com>
>      * move the limit check from tun_can_build_skb() to tun_build_skb() to
>        remove duplication and locking issue, and also drop the packet in
>        case of a failed check - noted by Jason Wang <jasowang@redhat.com>
> 
>   drivers/net/tun.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index d75456adc62a..a1d04bc9485f 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -1582,6 +1582,9 @@ static void tun_rx_batched(struct tun_struct *tun, struct tun_file *tfile,
>   static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
>   			      int len, int noblock, bool zerocopy)
>   {
> +	struct bpf_prog *xdp_prog;
> +	int pad = TUN_RX_PAD;
> +
>   	if ((tun->flags & TUN_TYPE_MASK) != IFF_TAP)
>   		return false;
>   
> @@ -1594,7 +1597,13 @@ static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
>   	if (zerocopy)
>   		return false;
>   
> -	if (SKB_DATA_ALIGN(len + TUN_RX_PAD) +
> +	rcu_read_lock();
> +	xdp_prog = rcu_dereference(tun->xdp_prog);
> +	if (xdp_prog)
> +		pad += XDP_PACKET_HEADROOM;
> +	rcu_read_unlock();
> +

Isolated seen, I guess, this is a correct fix to 7df13219d757.

> +	if (SKB_DATA_ALIGN(len + pad) +
>   	    SKB_DATA_ALIGN(sizeof(struct skb_shared_info)) > PAGE_SIZE)
>   		return false;
>   

Question to Jason Wang:
Why fall back (to e.g. tun_alloc_skb()) when size is above PAGE_SIZE?

AFAIK tun_build_skb() *can* create get larger packets than PAGE_SIZE
from it's page_frag.  Is there a reason for this limitation?

(To Andrew, I assume a change in this area is another patch).

--Jesper



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
