Return-Path: <SRS0=DgfW=CU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82402C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 07:02:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA037221EE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 07:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA037221EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 268F32288F;
	Fri, 11 Sep 2020 07:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fD1+E8GYLGzP; Fri, 11 Sep 2020 07:02:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BD30A2094B;
	Fri, 11 Sep 2020 07:02:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7366C0859;
	Fri, 11 Sep 2020 07:02:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8492C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 07:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BE97D86D01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 07:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGLWYYy_ih5e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 07:02:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BE17E86BF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 07:02:01 +0000 (UTC)
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de
 [79.249.244.48])
 by mail.holtmann.org (Postfix) with ESMTPSA id 530AECED19;
 Fri, 11 Sep 2020 09:08:55 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200909072551.1101031-1-yepeilin.cs@gmail.com>
Date: Fri, 11 Sep 2020 09:01:59 +0200
Message-Id: <15999FE1-5227-4D55-8E3C-39142725FDA5@holtmann.org>
References: <20200908200635.1099360-1-yepeilin.cs@gmail.com>
 <20200909072551.1101031-1-yepeilin.cs@gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: Miao-chen Chou <mcchou@chromium.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, syzkaller-bugs@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] Bluetooth: Fix memory leak in
 read_adv_mon_features()
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

> read_adv_mon_features() is leaking memory. Free `rp` before returning.
> 
> Fixes: e5e1e7fd470c ("Bluetooth: Add handler of MGMT_OP_READ_ADV_MONITOR_FEATURES")
> Reported-and-tested-by: syzbot+f7f6e564f4202d8601c6@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=f7f6e564f4202d8601c6
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> I forgot the "Link:" tag yesterday. Sorry about that.
> 
> Change in v2:
>    - add a proper "Link:" tag.
> 
> net/bluetooth/mgmt.c | 12 ++++++++----
> 1 file changed, 8 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
