Return-Path: <SRS0=iase=EU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD17FC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Nov 2020 19:18:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63F2E22263
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Nov 2020 19:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbQG5JPN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63F2E22263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A25E8726F;
	Sat, 14 Nov 2020 19:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvH4MquVnT7v; Sat, 14 Nov 2020 19:18:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C9558711A;
	Sat, 14 Nov 2020 19:18:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7C5FC0891;
	Sat, 14 Nov 2020 19:18:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C97C9C0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 19:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B3871861EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 19:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6muGkQgw3DoL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 19:18:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 15EDE86B24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 19:18:40 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com
 (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E6732225E;
 Sat, 14 Nov 2020 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605381519;
 bh=XeWIoRdu3Vh6vI8C5YoHUTBLPxwLTyEekVkd5XX4N2g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UbQG5JPNXscaruzdvVD5th4tLGHg9bWZta0FCSu4QF/WeN+J2imau9P98bqPcy2fX
 Z5xZbgoFjBK6OgW6DAv62jQav1sBqqTkQpai33lY7+lE+Zm3Url9ztLgKDwOHN2Yep
 0uLtgQu8frIHbM8+yZ9GHdHamVrJvV61SgzzuyGk=
Date: Sat, 14 Nov 2020 11:18:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Anmol Karn <anmol.karan123@gmail.com>
Message-ID: <20201114111838.03b933af@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201111165954.14743-1-anmol.karan123@gmail.com>
References: <20201110194518.GA97719@Thinkpad>
 <20201111165954.14743-1-anmol.karan123@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, saeed@kernel.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH v4 net] rose: Fix Null pointer
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

On Wed, 11 Nov 2020 22:29:54 +0530 Anmol Karn wrote:
> rose_send_frame() dereferences `neigh->dev` when called from
> rose_transmit_clear_request(), and the first occurrence of the
> `neigh` is in rose_loopback_timer() as `rose_loopback_neigh`,
> and it is initialized in rose_add_loopback_neigh() as NULL.
> i.e when `rose_loopback_neigh` used in rose_loopback_timer()
> its `->dev` was still NULL and rose_loopback_timer() was calling
> rose_rx_call_request() without checking for NULL.
> 
> - net/rose/rose_link.c
> This bug seems to get triggered in this line:
> 
> rose_call = (ax25_address *)neigh->dev->dev_addr;
> 
> Fix it by adding NULL checking for `rose_loopback_neigh->dev`
> in rose_loopback_timer().
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
> Tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
> Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>

> diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> index 7b094275ea8b..6a71b6947d92 100644
> --- a/net/rose/rose_loopback.c
> +++ b/net/rose/rose_loopback.c
> @@ -96,10 +96,12 @@ static void rose_loopback_timer(struct timer_list *unused)
>  		}
> 
>  		if (frametype == ROSE_CALL_REQUEST) {
> -			if ((dev = rose_dev_get(dest)) != NULL) {
> +			dev = rose_dev_get(dest);
> +			if (rose_loopback_neigh->dev && dev) {
>  				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
>  					kfree_skb(skb);
>  			} else {
> +				dev_put(dev);
>  				kfree_skb(skb);
>  			}
>  		} else {

This is still not correct. With this code dev_put() could be called with
NULL, which would cause a crash.

There is also a dev_put() missing if rose_rx_call_request() returns 0.

I think that this is the correct code:

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 7b094275ea8b..ff252ef73592 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,11 +96,22 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}
 
 		if (frametype == ROSE_CALL_REQUEST) {
-			if ((dev = rose_dev_get(dest)) != NULL) {
-				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
-					kfree_skb(skb);
-			} else {
+			if (!rose_loopback_neigh->dev) {
 				kfree_skb(skb);
+				continue;
+			}
+
+			dev = rose_dev_get(dest);
+			if (!dev) {
+				kfree_skb(skb);
+				continue;
+			}
+
+			if (rose_rx_call_request(skb, dev, rose_loopback_neigh,
+						 lci_o) == 0) {
+				dev_put(dev);
+				kfree_skb(skb);
 			}
 		} else {
 			kfree_skb(skb);

Please test this and resubmit it if it works.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
