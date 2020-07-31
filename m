Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E92C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 04:53:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 437A92074B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 04:53:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugZ+u62G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 437A92074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 384CE86917;
	Fri, 31 Jul 2020 04:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vi9YCF1wLwDS; Fri, 31 Jul 2020 04:53:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AE1B18848F;
	Fri, 31 Jul 2020 04:53:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97544C0050;
	Fri, 31 Jul 2020 04:53:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5686C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 04:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D41EC88538
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 04:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6eM9tnYU1QX5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 04:53:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4BC538848F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 04:53:06 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50CE12074B;
 Fri, 31 Jul 2020 04:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596171186;
 bh=MnEbR4t/xoxAN93gD+qE5jCDyQ4vcBjhtQp8diZ/N88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ugZ+u62GbxspOh76EELUql3biENANGq3nTvcDrY1aGLphdm1mxDObpR/WAHU3Upvn
 I6lfZeT+cGvAyIdNSrO/BfjIlqiTUE6aaA+CVw0L9tF5MEzpHH9faVIlaS8keDBqB8
 hn6iSlGtBHbLSPJg0Yb5zkpCpXC//r+57UaXAD0s=
Date: Fri, 31 Jul 2020 07:53:01 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200731045301.GI75549@unreal>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730192026.110246-1-yepeilin.cs@gmail.com>
Cc: rds-devel@oss.oracle.com, Arnd Bergmann <arnd@arndb.de>,
 linux-rdma@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak
 in rds_notify_queue_get()
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

On Thu, Jul 30, 2020 at 03:20:26PM -0400, Peilin Ye wrote:
> rds_notify_queue_get() is potentially copying uninitialized kernel stack
> memory to userspace since the compiler may leave a 4-byte hole at the end
> of `cmsg`.
>
> In 2016 we tried to fix this issue by doing `= { 0 };` on `cmsg`, which
> unfortunately does not always initialize that 4-byte hole. Fix it by using
> memset() instead.

Of course, this is the difference between "{ 0 }" and "{}" initializations.

>
> Cc: stable@vger.kernel.org
> Fixes: f037590fff30 ("rds: fix a leak of kernel memory")
> Fixes: bdbe6fbc6a2f ("RDS: recv.c")
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Note: the "real" copy_to_user() happens in put_cmsg(), where
> `cmlen - sizeof(*cm)` equals to `sizeof(cmsg)`.
>
> Reference: https://lwn.net/Articles/417989/
>
> $ pahole -C "rds_rdma_notify" net/rds/recv.o
> struct rds_rdma_notify {
> 	__u64                      user_token;           /*     0     8 */
> 	__s32                      status;               /*     8     4 */
>
> 	/* size: 16, cachelines: 1, members: 2 */
> 	/* padding: 4 */
> 	/* last cacheline: 16 bytes */
> };
>
>  net/rds/recv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/rds/recv.c b/net/rds/recv.c
> index c8404971d5ab..aba4afe4dfed 100644
> --- a/net/rds/recv.c
> +++ b/net/rds/recv.c
> @@ -450,12 +450,13 @@ static int rds_still_queued(struct rds_sock *rs, struct rds_incoming *inc,
>  int rds_notify_queue_get(struct rds_sock *rs, struct msghdr *msghdr)
>  {
>  	struct rds_notifier *notifier;
> -	struct rds_rdma_notify cmsg = { 0 }; /* fill holes with zero */
> +	struct rds_rdma_notify cmsg;
>  	unsigned int count = 0, max_messages = ~0U;
>  	unsigned long flags;
>  	LIST_HEAD(copy);
>  	int err = 0;
>
> +	memset(&cmsg, 0, sizeof(cmsg));	/* fill holes with zero */

It works, but the right solution is to drop 0 from cmsg initialization
and write "struct rds_rdma_notify cmsg = {};" without any memset.

Thanks
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
