Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C44AC433EC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 16:42:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9F8020738
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 16:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9F8020738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B5E088947D;
	Mon, 13 Jul 2020 16:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSP0RC4BH24G; Mon, 13 Jul 2020 16:42:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77CB589429;
	Mon, 13 Jul 2020 16:42:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 563AAC088E;
	Mon, 13 Jul 2020 16:42:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 115B4C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EE183896EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SN07zMEZGu7c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:42:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7157C89753
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:42:02 +0000 (UTC)
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de
 [91.61.38.56])
 by mail.holtmann.org (Postfix) with ESMTPSA id 8F230CECC9;
 Mon, 13 Jul 2020 18:51:58 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <3f69f09d6eb0bc1430cae2894c635252a1cb09e1.1594414498.git.yepeilin.cs@gmail.com>
Date: Mon, 13 Jul 2020 18:42:00 +0200
Message-Id: <72AE7F80-CE19-4051-85DB-60A3FD80D390@holtmann.org>
References: <3f69f09d6eb0bc1430cae2894c635252a1cb09e1.1594414498.git.yepeilin.cs@gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] net/bluetooth: Prevent
 out-of-bounds read in hci_inquiry_result_evt()
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

> Check `num_rsp` before using it as for-loop counter.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> net/bluetooth/hci_event.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
