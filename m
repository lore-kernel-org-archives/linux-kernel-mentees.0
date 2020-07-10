Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AE5C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 17:16:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A2820674
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 17:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A2820674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A554A22274;
	Fri, 10 Jul 2020 17:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWE8JVcZ3DPv; Fri, 10 Jul 2020 17:16:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F15FD204BB;
	Fri, 10 Jul 2020 17:16:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9B6FC0890;
	Fri, 10 Jul 2020 17:16:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AFE9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 17:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1662620798
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 17:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlWQJz9FGtlg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 17:16:45 +0000 (UTC)
X-Greylist: delayed 00:07:52 by SQLgrey-1.7.6
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by silver.osuosl.org (Postfix) with ESMTP id 250D0204BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 17:16:44 +0000 (UTC)
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de
 [91.61.38.56])
 by mail.holtmann.org (Postfix) with ESMTPSA id B137CCED26;
 Fri, 10 Jul 2020 19:18:48 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200710160915.228980-1-yepeilin.cs@gmail.com>
Date: Fri, 10 Jul 2020 19:08:51 +0200
Message-Id: <43E6945B-1FFE-4283-9F1B-E84AFDCB528F@holtmann.org>
References: <20200709130224.214204-1-yepeilin.cs@gmail.com>
 <20200710160915.228980-1-yepeilin.cs@gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Cc: Johan Hedberg <johan.hedberg@gmail.com>, syzkaller-bugs@googlegroups.com,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] net/bluetooth: Fix
 slab-out-of-bounds read in hci_extended_inquiry_result_evt()
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

Hi Peilin,

> Check upon `num_rsp` is insufficient. A malformed event packet with a
> large `num_rsp` number makes hci_extended_inquiry_result_evt() go out
> of bounds. Fix it.
> 
> This patch fixes the following syzbot bug:
> 
>    https://syzkaller.appspot.com/bug?id=4bf11aa05c4ca51ce0df86e500fce486552dc8d2
> 
> Reported-by: syzbot+d8489a79b781849b9c46@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v3:
>    - Minimum `skb->len` requirement was 1 byte inaccurate since `info`
>      starts from `skb->data + 1`. Fix it.
> 
> Changes in v2:
>    - Use `skb->len` instead of `skb->truesize` as the length limit.
>    - Leave `num_rsp` as of type `int`.
> 
> net/bluetooth/hci_event.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
