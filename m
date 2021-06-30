Return-Path: <SRS0=IXLA=LY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7C2C11F65
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 07:00:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9DE0611AF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 07:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9DE0611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C74783AB4;
	Wed, 30 Jun 2021 07:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXlwtvUsSeTB; Wed, 30 Jun 2021 07:00:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 91A40825B9;
	Wed, 30 Jun 2021 07:00:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 545B9C0010;
	Wed, 30 Jun 2021 07:00:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA240C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 07:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D174260781
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 07:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o3pqYJEjaIyu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 07:00:48 +0000 (UTC)
X-Greylist: delayed 00:09:37 by SQLgrey-1.8.0
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9177560633
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 07:00:48 +0000 (UTC)
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout2.secunet.com (Postfix) with ESMTP id B63B7800051;
 Wed, 30 Jun 2021 08:51:08 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 30 Jun 2021 08:51:08 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 30 Jun
 2021 08:51:08 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)
 id 0182E318040F; Wed, 30 Jun 2021 08:51:07 +0200 (CEST)
Date: Wed, 30 Jun 2021 08:51:07 +0200
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH] net: xfrm: fix memory leak in xfrm_user_rcv_msg
Message-ID: <20210630065107.GT40979@gauss3.secunet.de>
References: <20210625102354.18266-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210625102354.18266-1-paskripkin@gmail.com>
X-ClientProxiedBy: cas-essen-02.secunet.de (10.53.40.202) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Cc: herbert@gondor.apana.org.au, netdev@vger.kernel.org, 0x7f454c46@gmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, syzbot+fb347cf82c73a90efcca@syzkaller.appspotmail.com
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

On Fri, Jun 25, 2021 at 01:23:54PM +0300, Pavel Skripkin wrote:
> Syzbot reported memory leak in xfrm_user_rcv_msg(). The
> problem was is non-freed skb's frag_list.
> 
> In skb_release_all() skb_release_data() will be called only
> in case of skb->head != NULL, but netlink_skb_destructor()
> sets head to NULL. So, allocated frag_list skb should be
> freed manualy, since consume_skb() won't take care of it
> 
> Fixes: 5106f4a8acff ("xfrm/compat: Add 32=>64-bit messages translator")
> Reported-and-tested-by: syzbot+fb347cf82c73a90efcca@syzkaller.appspotmail.com
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Applied, thanks a lot!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
