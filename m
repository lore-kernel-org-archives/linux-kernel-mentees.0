Return-Path: <SRS0=UocX=PA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28114C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Oct 2021 15:46:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A168C60EBB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Oct 2021 15:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A168C60EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DB9740421;
	Tue, 12 Oct 2021 15:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMAvlKBMIxx6; Tue, 12 Oct 2021 15:46:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 87DC840410;
	Tue, 12 Oct 2021 15:46:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 593A1C000F;
	Tue, 12 Oct 2021 15:46:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23AA0C000F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 15:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B15A80EA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 15:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lK_dd9naxbyL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 15:46:21 +0000 (UTC)
X-Greylist: delayed 00:07:32 by SQLgrey-1.8.0
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE15B80EE5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 15:46:20 +0000 (UTC)
Received: from smtpclient.apple (p4fefcb73.dip0.t-ipconnect.de
 [79.239.203.115])
 by mail.holtmann.org (Postfix) with ESMTPSA id 20798CECE1;
 Tue, 12 Oct 2021 17:38:46 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] Bluetooth: hci_sock: purge socket queues in the
 destruct() callback
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211007190424.196281-1-phind.uet@gmail.com>
Date: Tue, 12 Oct 2021 17:38:45 +0200
Message-Id: <8C82DF3C-98B1-4C41-B9D8-3415DD64138F@holtmann.org>
References: <20211007190424.196281-1-phind.uet@gmail.com>
To: Nguyen Dinh Phi <phind.uet@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 syzbot+4c4ffd1e1094dae61035@syzkaller.appspotmail.com,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
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

Hi Nguyen,

> The receive path may take the socket right before hci_sock_release(),
> but it may enqueue the packets to the socket queues after the call to
> skb_queue_purge(), therefore the socket can be destroyed without clear
> its queues completely.
> 
> Moving these skb_queue_purge() to the hci_sock_destruct() will fix this
> issue, because nothing is referencing the socket at this point.
> 
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> Reported-by: syzbot+4c4ffd1e1094dae61035@syzkaller.appspotmail.com
> ---
> net/bluetooth/hci_sock.c | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
