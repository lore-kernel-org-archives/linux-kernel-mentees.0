Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87195C47420
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 07:46:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB432087E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 07:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECB432087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ACEA987355;
	Sat, 26 Sep 2020 07:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wge42bstD0MJ; Sat, 26 Sep 2020 07:46:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 233B287346;
	Sat, 26 Sep 2020 07:46:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07504C0891;
	Sat, 26 Sep 2020 07:46:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83DD1C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 07:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6BF3787355
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 07:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPvm3NFF-JnP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 07:46:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by hemlock.osuosl.org (Postfix) with ESMTP id CC3FD87346
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 07:46:53 +0000 (UTC)
Received: from [172.20.10.2]
 (dynamic-046-114-136-219.46.114.pool.telefonica.de [46.114.136.219])
 by mail.holtmann.org (Postfix) with ESMTPSA id 52A45CECE8;
 Sat, 26 Sep 2020 09:53:50 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200905020410.20350-1-anant.thazhemadam@gmail.com>
Date: Sat, 26 Sep 2020 09:46:49 +0200
Message-Id: <2AEF86AF-8F80-4B01-B506-D2ABC654DBC7@holtmann.org>
References: <20200905020410.20350-1-anant.thazhemadam@gmail.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Fix uninit-value in
 hci_chan_lookup_handle
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

> When the amount of data stored in the location corresponding to
> iov_iter *from is less then 4, some data seems to go uninitialized.
> 
> Updating this condition accordingly, makes sense both intuitively and 
> logically as well, since the other check for extreme condition done is if
> len > HCI_MAX_FRAME_SIZE, which is HCI_MAX_ACL_SIZE (which is 1024) + 4;
> which itself gives some idea about what must be the ideal mininum size.
> 
> Reported-and-tested by: syzbot+4c14a8f574461e1c3659@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
> If there is some explicit reason why len < 4 doesn't work, and only len < 2 works, 
> please do let me know.
> The commit message that introduced the initial change 
> (512b2268156a4e15ebf897f9a883bdee153a54b7) wasn't exactly very helpful in this 
> respect, and I couldn't find a whole lot of discussion regarding this either.
> 
> drivers/bluetooth/hci_vhci.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
> index 8ab26dec5f6e..0c49821d7b98 100644
> --- a/drivers/bluetooth/hci_vhci.c
> +++ b/drivers/bluetooth/hci_vhci.c
> @@ -159,7 +159,7 @@ static inline ssize_t vhci_get_user(struct vhci_data *data,
> 	__u8 pkt_type, opcode;
> 	int ret;
> 
> -	if (len < 2 || len > HCI_MAX_FRAME_SIZE)
> +	if (len < 4 || len > HCI_MAX_FRAME_SIZE)
> 		return -EINVAL;

so the minimum requirement is to have an 1 octet packet indicator. If some other functions are missing length checks, then it should be fixed there. I see that in case of HCI_VENDOR_PKT we need to check for the 2nd octet to be present, but I have no idea why you require 3 octets minimum. As I said, if so, then the other functions that get called require proper range checks.

Regards

Marcel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
