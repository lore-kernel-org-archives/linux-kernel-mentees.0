Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A28DF71
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Mar 2025 01:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742175281; cv=none; b=aX+wDmtcchaaFl8uwqkm8Rpy0VlJBDgh6YmenDRkQd47T8T7iha3dweCMRcv0mD8B4spP2M1hop1BHO60F7oPMlL7Ib2tWaOAK+icDWPgCDfvz4vqlKjcc3ZsWvQQI1hbA7ElMhY+xnFxYEvAc87nK3/LjHLXjLTiNniLB2bwIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742175281; c=relaxed/simple;
	bh=eT6MFakubGkmnBAAqo9NAtgD4qcjFA/LrKjlIPZyI2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8oEShVH2CVqTFricYOhac6DBGW6iismz+s7LvWfsXjJSQiUk8P/XJiAIyG84uQBGWWMtvaPL2W8SRTzug36wMEKCDzvMKQAEMPtcLclc3XqFQQQZvAb8OhKayCw8o84rQJtARLdqNtChEkOxP4ckHPXYOmtxzzACy0xz3HDguQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=PelLB2Ze; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="PelLB2Ze"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1742175270; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=OWGQO/XmAgafV+pvwHl30RyH+rk+S5XjfM5aTrOYSKc=;
	b=PelLB2ZeJ6WEY6r7r8Trc97SqsY5vc8yQ60yK+8otNgJ/zn+Y/nJUWXt+6n3A3qqCHoLLk4bLDY2+l3q7h4/7KhnKlsNh/E7bp3ZC0+WObwak0zaB7Vhjf9WMKYroKlztBgwxaooQs0wpFnOdZy5R3nDzhRcIJcqKAR7uCC70QA=
Received: from localhost(mailfrom:dust.li@linux.alibaba.com fp:SMTPD_---0WRXPGg2_1742175268 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 17 Mar 2025 09:34:29 +0800
Date: Mon, 17 Mar 2025 09:34:28 +0800
From: Dust Li <dust.li@linux.alibaba.com>
To: I Hsin Cheng <richard120310@gmail.com>, alibuda@linux.alibaba.com
Cc: wenjia@linux.ibm.com, jaka@linux.ibm.com, tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, jserv@ccns.ncku.edu.tw,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] net/smc: Reduce size of smc_wr_tx_tasklet_fn
Message-ID: <20250317013428.GC56800@linux.alibaba.com>
Reply-To: dust.li@linux.alibaba.com
References: <20250315062516.788528-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315062516.788528-1-richard120310@gmail.com>

On 2025-03-15 14:25:16, I Hsin Cheng wrote:
>The variable "polled" in smc_wr_tx_tasklet_fn is a counter to determine
>whether the loop has been executed for the first time. Refactor the type
>of "polled" from "int" to "bool" can reduce the size of generated code
>size by 12 bytes shown with the test below
>
>$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
>add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-12 (-12)
>Function                                     old     new   delta
>smc_wr_tx_tasklet_fn                        1076    1064     -12
>Total: Before=24795091, After=24795079, chg -0.00%
>
>In some configuration, the compiler will complain this function for
>exceeding 1024 bytes for function stack, this change can at least reduce
>the size by 12 bytes within manner.
>
>Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

Reviewed-by: Dust Li <dust.li@linux.alibaba.com>

Best regards,
Dust

>---
> net/smc/smc_wr.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/net/smc/smc_wr.c b/net/smc/smc_wr.c
>index b04a21b8c511..3cc435ed7fde 100644
>--- a/net/smc/smc_wr.c
>+++ b/net/smc/smc_wr.c
>@@ -138,14 +138,14 @@ static void smc_wr_tx_tasklet_fn(struct tasklet_struct *t)
> 	struct smc_ib_device *dev = from_tasklet(dev, t, send_tasklet);
> 	struct ib_wc wc[SMC_WR_MAX_POLL_CQE];
> 	int i = 0, rc;
>-	int polled = 0;
>+	bool polled = false;
> 
> again:
>-	polled++;
>+	polled = !polled;
> 	do {
> 		memset(&wc, 0, sizeof(wc));
> 		rc = ib_poll_cq(dev->roce_cq_send, SMC_WR_MAX_POLL_CQE, wc);
>-		if (polled == 1) {
>+		if (polled) {
> 			ib_req_notify_cq(dev->roce_cq_send,
> 					 IB_CQ_NEXT_COMP |
> 					 IB_CQ_REPORT_MISSED_EVENTS);
>@@ -155,7 +155,7 @@ static void smc_wr_tx_tasklet_fn(struct tasklet_struct *t)
> 		for (i = 0; i < rc; i++)
> 			smc_wr_tx_process_cqe(&wc[i]);
> 	} while (rc > 0);
>-	if (polled == 1)
>+	if (polled)
> 		goto again;
> }
> 
>-- 
>2.43.0
>
