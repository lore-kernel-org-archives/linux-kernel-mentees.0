Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CA4C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 21:04:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A316D20B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 21:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFTHiXoj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A316D20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 014C087525;
	Fri,  6 Nov 2020 21:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUpgj6Jf8hoN; Fri,  6 Nov 2020 21:04:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 666FA87511;
	Fri,  6 Nov 2020 21:04:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AE6EC088B;
	Fri,  6 Nov 2020 21:04:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95027C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 21:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 857C186A56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 21:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnDWutPZq-nN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 21:04:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0713686A36
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 21:04:30 +0000 (UTC)
Received: from sx1.lan (c-24-6-56-119.hsd1.ca.comcast.net [24.6.56.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6B8B2087E;
 Fri,  6 Nov 2020 21:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604696669;
 bh=9ixnt+Fdr/ysIEkQIJWSwlXkjcUJXvNSmNtHjsiEvhE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=KFTHiXojtHgyof51PtRWCwBIRcqkJ1S5Phui0j1JLOLZBxMx9HmFYeI/5gMMBWsex
 M1ZDm8to6GsjbAV8O9qJrgK/fj+NIBURT3UjpSq0oIcxcuHEiVF4ikFxFNt3TjXbGh
 E17KJbrxv5tFIDQVMGAUmX9a+ESyjLPd/kFKIWgc=
Message-ID: <b97dc3f0843cc2b7d7674dbd467ad5ba40824ba3.camel@kernel.org>
From: Saeed Mahameed <saeed@kernel.org>
To: Anmol Karn <anmol.karan123@gmail.com>, ralf@linux-mips.org, 
 davem@davemloft.net, kuba@kernel.org
Date: Fri, 06 Nov 2020 13:04:27 -0800
In-Reply-To: <20201105155600.9711-1-anmol.karan123@gmail.com>
References: <20201105155600.9711-1-anmol.karan123@gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 net] rose: Fix Null pointer
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

On Thu, 2020-11-05 at 21:26 +0530, Anmol Karn wrote:
> rose_send_frame() dereferences `neigh->dev` when called from
> rose_transmit_clear_request(), and the first occurance of the `neigh`
> is in rose_loopback_timer() as `rose_loopback_neigh`, and it is
> initialized
> in rose_add_loopback_neigh() as NULL. i.e when `rose_loopback_neigh`
> used in 
> rose_loopback_timer() its `->dev` was still NULL and
> rose_loopback_timer() 
> was calling rose_rx_call_request() without checking for NULL.
> 
> - net/rose/rose_link.c
> This bug seems to get triggered in this line:
> 
> rose_call = (ax25_address *)neigh->dev->dev_addr;
> 
> Fix it by adding NULL checking for `rose_loopback_neigh->dev` in
> rose_loopback_timer(). 
> 
> Reported-and-tested-by: 
> syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
> Link: 
> https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
>  
> Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>

missing proper fixes tag.

> ---
>  net/rose/rose_loopback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> index 7b094275ea8b..cd7774cb1d07 100644
> --- a/net/rose/rose_loopback.c
> +++ b/net/rose/rose_loopback.c
> @@ -96,7 +96,7 @@ static void rose_loopback_timer(struct timer_list
> *unused)
>  		}
>  
>  		if (frametype == ROSE_CALL_REQUEST) {
> -			if ((dev = rose_dev_get(dest)) != NULL) {
> +			if (rose_loopback_neigh->dev && (dev =
> rose_dev_get(dest)) != NULL) {
>  				if (rose_rx_call_request(skb, dev,
> rose_loopback_neigh, lci_o) == 0)
>  					kfree_skb(skb);
>  			} else {

check patch is not happy:

WARNING:TYPO_SPELLING: 'occurance' may be misspelled - perhaps
'occurrence'?
#7: 
rose_transmit_clear_request(), and the first occurance of the `neigh`

ERROR:ASSIGN_IN_IF: do not use assignment in if condition
#36: FILE: net/rose/rose_loopback.c:99:
+                       if (rose_loopback_neigh->dev && (dev =
rose_dev_get(dest)) != NULL) {

total: 1 errors, 1 warnings, 0 checks, 8 lines checked


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
