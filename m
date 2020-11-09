Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9661C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 12:17:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1165C20789
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 12:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1165C20789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8AC8D8709F;
	Mon,  9 Nov 2020 12:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfY8C1QquFhh; Mon,  9 Nov 2020 12:17:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8FE958705D;
	Mon,  9 Nov 2020 12:17:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7ADF2C088B;
	Mon,  9 Nov 2020 12:17:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCF95C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 12:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BD36F204D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 12:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NmwbjIgSZ+ev
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 12:16:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by silver.osuosl.org (Postfix) with ESMTP id 697832049E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 12:16:56 +0000 (UTC)
Received: from marcel-macbook.fritz.box (p4fefcf0f.dip0.t-ipconnect.de
 [79.239.207.15])
 by mail.holtmann.org (Postfix) with ESMTPSA id 041BDCECC5;
 Mon,  9 Nov 2020 13:24:02 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200909071700.1100748-1-yepeilin.cs@gmail.com>
Date: Mon, 9 Nov 2020 13:16:53 +0100
Message-Id: <AF20F58E-C800-45A8-A5B8-296DE4C0D906@holtmann.org>
References: <20200805180902.684024-1-yepeilin.cs@gmail.com>
 <20200909071700.1100748-1-yepeilin.cs@gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 Bluez mailing list <linux-bluetooth@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH net v2] Bluetooth: Fix
 slab-out-of-bounds read in hci_le_direct_adv_report_evt()
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

> `num_reports` is not being properly checked. A malformed event packet with
> a large `num_reports` number makes hci_le_direct_adv_report_evt() read out
> of bounds. Fix it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2f010b55884e ("Bluetooth: Add support for handling LE Direct Advertising Report events")
> Reported-and-tested-by: syzbot+24ebd650e20bd263ca01@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=24ebd650e20bd263ca01
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v2:
>    - add "Cc: stable@" tag.
> 
> net/bluetooth/hci_event.c | 12 +++++-------
> 1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 4b7fc430793c..aec43ae488d1 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -5863,21 +5863,19 @@ static void hci_le_direct_adv_report_evt(struct hci_dev *hdev,
> 					 struct sk_buff *skb)
> {
> 	u8 num_reports = skb->data[0];
> -	void *ptr = &skb->data[1];
> +	struct hci_ev_le_direct_adv_info *ev = (void *)&skb->data[1];
> 
> -	hci_dev_lock(hdev);
> +	if (!num_reports || skb->len < num_reports * sizeof(*ev) + 1)
> +		return;
> 
> -	while (num_reports--) {
> -		struct hci_ev_le_direct_adv_info *ev = ptr;
> +	hci_dev_lock(hdev);
> 
> +	for (; num_reports; num_reports--, ev++)
> 		process_adv_report(hdev, ev->evt_type, &ev->bdaddr,
> 				   ev->bdaddr_type, &ev->direct_addr,
> 				   ev->direct_addr_type, ev->rssi, NULL, 0,
> 				   false);
> 
> -		ptr += sizeof(*ev);
> -	}
> -
> 	hci_dev_unlock(hdev);
> }

patch has been applied to bluetooth-next tree.

Regards

Marcel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
