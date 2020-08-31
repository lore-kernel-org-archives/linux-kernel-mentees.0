Return-Path: <SRS0=Gq3P=CJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EFFC433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 16:06:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88A4920767
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Aug 2020 16:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88A4920767
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 65EE52153D;
	Mon, 31 Aug 2020 16:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tlsxbvQwJ5p; Mon, 31 Aug 2020 16:06:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CBDE6258A5;
	Mon, 31 Aug 2020 16:06:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6BC3C0052;
	Mon, 31 Aug 2020 16:06:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A5B2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 16:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5520E258A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 16:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZ73T7yzoTZd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 16:06:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by silver.osuosl.org (Postfix) with ESMTP id 0DA952153D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Aug 2020 16:06:20 +0000 (UTC)
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de
 [79.249.244.48])
 by mail.holtmann.org (Postfix) with ESMTPSA id BF220CECCE;
 Mon, 31 Aug 2020 18:16:27 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200823010022.938532-1-coiby.xu@gmail.com>
Date: Mon, 31 Aug 2020 18:06:18 +0200
Message-Id: <C0A907BA-9C0D-4124-A2AF-3748055DB062@holtmann.org>
References: <000000000000c57f2d05ac4c5b8e@google.com>
 <20200823010022.938532-1-coiby.xu@gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, syzkaller-bugs@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] Bluetooth: fix "list_add double
 add" in hci_conn_complete_evt
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

Hi Coiby,

> When two HCI_EV_CONN_COMPLETE event packets with status=0 of the same
> HCI connection are received, device_add would be called twice which
> leads to kobject_add being called twice. Thus duplicate
> (struct hci_conn *conn)->dev.kobj.entry would be inserted into
> (struct hci_conn *conn)->dev.kobj.kset->list.
> 
> This issue can be fixed by checking (struct hci_conn *conn)->debugfs.
> If it's not NULL, it means the HCI connection has been completed and we
> won't duplicate the work as for processing the first
> HCI_EV_CONN_COMPLETE event.

do you have a btmon trace for this happening?

> Reported-and-tested-by: syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=dd768a260f7358adbaf9
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
> net/bluetooth/hci_event.c | 5 +++++
> 1 file changed, 5 insertions(+)
> 
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 4b7fc430793c..1233739ce760 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -2605,6 +2605,11 @@ static void hci_conn_complete_evt(struct hci_dev *hdev, struct sk_buff *skb)
> 	}
> 
> 	if (!ev->status) {
> +		if (conn->debugfs) {
> +			bt_dev_err(hdev, "The connection has been completed");
> +			goto unlock;
> +		}
> +

And instead of doing papering over a hole, I would rather detect that the HCI event is not valid since we already received one for this connection.

Regards

Marcel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
