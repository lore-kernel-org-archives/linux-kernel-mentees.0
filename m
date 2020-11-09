Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5C7C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 13:04:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 612ED206C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 13:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 612ED206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C6A3785DD1;
	Mon,  9 Nov 2020 13:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0h-hujabpwO; Mon,  9 Nov 2020 13:04:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5AE62850E9;
	Mon,  9 Nov 2020 13:04:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4676CC088B;
	Mon,  9 Nov 2020 13:04:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E86D9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D733F850E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-3Ue3-yuLKd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:04:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E22484E5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:04:42 +0000 (UTC)
Received: from marcel-macbook.fritz.box (p4fefcf0f.dip0.t-ipconnect.de
 [79.239.207.15])
 by mail.holtmann.org (Postfix) with ESMTPSA id 2674ECECC6;
 Mon,  9 Nov 2020 14:11:49 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201016131447.32107-1-anant.thazhemadam@gmail.com>
Date: Mon, 9 Nov 2020 14:04:40 +0100
Message-Id: <46A02F1A-DABE-4CEE-A43B-F44766D15FFB@holtmann.org>
References: <20201016131447.32107-1-anant.thazhemadam@gmail.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Cc: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] bluetooth: hci_h5: fix memory
	leak in h5_close
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

Hi Anant,

> When h5_close() is called, h5 is directly freed when !hu->serdev.
> However, h5->rx_skb is not freed, which causes a memory leak.
> 
> Freeing h5->rx_skb and setting it to NULL, fixes this memory leak.
> 
> Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
> Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
> Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
> Changes in v5:
> 	* Set h5->rx_skb = NULL unconditionally - to improve code
> 	  readability
> 	* Update commit message accordingly
> 
> Changes in v4:
> 	* Free h5->rx_skb even when hu->serdev
> 	(Suggested by Hans de Goede <hdegoede@redhat.com>)
> 	* If hu->serdev, then assign h5->rx_skb = NULL
> 
> Changes in v3:
> 	* Free h5->rx_skb when !hu->serdev, and fix the memory leak
> 	* Do not incorrectly and unnecessarily call serdev_device_close()
> 
> Changes in v2:
> 	* Fixed the Fixes tag
> 
> 
> drivers/bluetooth/hci_h5.c | 3 +++
> 1 file changed, 3 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
