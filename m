Return-Path: <SRS0=XrqI=4Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A39C3F2D0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 07:47:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC56F246A2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Feb 2020 07:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC56F246A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A484C86C93;
	Fri, 28 Feb 2020 07:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Ykt6zXgJQiy; Fri, 28 Feb 2020 07:47:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0744F86C59;
	Fri, 28 Feb 2020 07:47:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3CBBC08A0;
	Fri, 28 Feb 2020 07:47:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6806DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 07:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4F9BB869EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 07:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TO3QhzpOoxS9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 07:46:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by whitealder.osuosl.org (Postfix) with ESMTP id 826B382FF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Feb 2020 07:46:59 +0000 (UTC)
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de
 [79.239.197.167])
 by mail.holtmann.org (Postfix) with ESMTPSA id 90990CECF6;
 Fri, 28 Feb 2020 08:46:29 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200225130809.32750-1-madhuparnabhowmik10@gmail.com>
Date: Fri, 28 Feb 2020 08:37:03 +0100
Message-Id: <182A4E2D-86AB-4C81-8ACB-AC8033BAFDE3@holtmann.org>
References: <20200225130809.32750-1-madhuparnabhowmik10@gmail.com>
To: madhuparnabhowmik10@gmail.com
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Cc: Johan Hedberg <johan.hedberg@gmail.com>, paulmck@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, joel@joelfernandes.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: bluetooth: hci_core: Fix
 Suspicious RCU usage warnings
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

Hi Madhuparna,

> The following functions in hci_core are always called with
> hdev->lock held. No need to use list_for_each_entry_rcu(), therefore
> change the usage of list_for_each_entry_rcu() in these functions
> to list_for_each_entry().
> 
> hci_link_keys_clear()
> hci_smp_ltks_clear()
> hci_smp_irks_clear()
> hci_blocked_keys_clear()
> 
> Warning encountered with CONFIG_PROVE_RCU_LIST:
> 
> [   72.213184] =============================
> [   72.213188] WARNING: suspicious RCU usage
> [   72.213192] 5.6.0-rc1+ #5 Not tainted
> [   72.213195] -----------------------------
> [   72.213198] net/bluetooth/hci_core.c:2288 RCU-list traversed in non-reader section!!
> 
> [   72.213676] =============================
> [   72.213679] WARNING: suspicious RCU usage
> [   72.213683] 5.6.0-rc1+ #5 Not tainted
> [   72.213685] -----------------------------
> [   72.213689] net/bluetooth/hci_core.c:2298 RCU-list traversed in non-reader section!!
> 
> [   72.214195] =============================
> [   72.214198] WARNING: suspicious RCU usage
> [   72.214201] 5.6.0-rc1+ #5 Not tainted
> [   72.214204] -----------------------------
> [   72.214208] net/bluetooth/hci_core.c:2308 RCU-list traversed in non-reader section!!
> 
> [  333.456972] =============================
> [  333.456979] WARNING: suspicious RCU usage
> [  333.457001] 5.6.0-rc1+ #5 Not tainted
> [  333.457007] -----------------------------
> [  333.457014] net/bluetooth/hci_core.c:2318 RCU-list traversed in non-reader section!!
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
> net/bluetooth/hci_core.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
