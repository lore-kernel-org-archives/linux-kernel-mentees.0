Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092FAC63793
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 14:47:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B5E60FEE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 14:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B5E60FEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 540EA81B01;
	Thu, 22 Jul 2021 14:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N68m3aaNNFKn; Thu, 22 Jul 2021 14:47:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9BCC6819F8;
	Thu, 22 Jul 2021 14:47:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 772B4C001A;
	Thu, 22 Jul 2021 14:47:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 681C2C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 14:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A9A78198D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 14:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1ApOdO7hg4x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 14:47:35 +0000 (UTC)
X-Greylist: delayed 00:08:20 by SQLgrey-1.8.0
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EAD88190B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 14:47:34 +0000 (UTC)
Received: from smtpclient.apple (p5b3d2eb8.dip0.t-ipconnect.de [91.61.46.184])
 by mail.holtmann.org (Postfix) with ESMTPSA id E3DF1CECDF;
 Thu, 22 Jul 2021 16:39:12 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH] Bluetooth: skip invalid hci_sync_conn_complete_evt
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210721101710.82974-1-desmondcheongzx@gmail.com>
Date: Thu, 22 Jul 2021 16:39:12 +0200
Message-Id: <A47B24AE-C807-4ADA-B0F7-8283ACC83BF7@holtmann.org>
References: <20210721101710.82974-1-desmondcheongzx@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 syzbot+66264bf2fd0476be7e6c@syzkaller.appspotmail.com,
 open list <linux-kernel@vger.kernel.org>,
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

Hi Desmond,

> Syzbot reported a corrupted list in kobject_add_internal [1]. This
> happens when multiple HCI_EV_SYNC_CONN_COMPLETE event packets with
> status 0 are sent for the same HCI connection. This causes us to
> register the device more than once which corrupts the kset list.

and that is actually forbidden by the spec. So we need to complain loudly that such a device is misbehaving.

> To fix this, in hci_sync_conn_complete_evt, we check whether we're
> trying to process the same HCI_EV_SYNC_CONN_COMPLETE event multiple
> times for one connection. If that's the case, the event is invalid, so
> we skip further processing and exit.
> 
> Link: https://syzkaller.appspot.com/bug?extid=66264bf2fd0476be7e6c [1]
> Reported-by: syzbot+66264bf2fd0476be7e6c@syzkaller.appspotmail.com
> Tested-by: syzbot+66264bf2fd0476be7e6c@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
> net/bluetooth/hci_event.c | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 016b2999f219..091a92338492 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -4373,6 +4373,8 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev,
> 
> 	switch (ev->status) {
> 	case 0x00:
> +		if (conn->state == BT_CONNECTED)
> +			goto unlock;  /* Already connected, event not valid */

The comment has go above and be a lot more details since this is not expected behavior from valid hardware and we should add a bt_dev_err as well.

> 		conn->handle = __le16_to_cpu(ev->handle);
> 		conn->state  = BT_CONNECTED;
> 		conn->type   = ev->link_type;

Regards

Marcel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
