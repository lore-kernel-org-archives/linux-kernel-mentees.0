Return-Path: <SRS0=gjYE=ND=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2160C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 04:53:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C216603E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 04:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C216603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEBE54002B;
	Thu, 12 Aug 2021 04:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNXp2sLRg66z; Thu, 12 Aug 2021 04:53:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F40EF40189;
	Thu, 12 Aug 2021 04:53:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEDF4C001A;
	Thu, 12 Aug 2021 04:53:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6DB2C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 04:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8256083B34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 04:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATNLKPC3wiF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 04:53:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn
 [202.108.3.164])
 by smtp1.osuosl.org (Postfix) with SMTP id 1A28783B30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 04:53:24 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.130.245.194])
 by sina.com (172.16.97.35) with ESMTP
 id 6114A8B0000319D9; Thu, 12 Aug 2021 12:50:58 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 60580415073786
From: Hillf Danton <hdanton@sina.com>
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Subject: Re: [PATCH] net: drop skbs in napi->rx_list when removing the napi
 context.
Date: Thu, 12 Aug 2021 12:50:47 +0800
Message-Id: <20210812045047.2548-1-hdanton@sina.com>
In-Reply-To: <20210811235959.1099333-1-phind.uet@gmail.com>
References: <20210811235959.1099333-1-phind.uet@gmail.com>
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+989efe781c74de1ddb54@syzkaller.appspotmail.com
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

On Thu, 12 Aug 2021 07:59:59 +0800 Nguyen Dinh Phi wrote:
> 
> The napi->rx_list is used to hold the GRO_NORMAL skbs before passing
> them to the stack, these skbs only passed to stack at the flush time or
> when the list's weight matches the predefined condition. In case the
> rx_list contains pending skbs when we remove the napi context, we need
> to clean out this list, otherwise, a memory leak will happen.

Thanks for your fix.

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
Reported-by: syzbot+989efe781c74de1ddb54@syzkaller.appspotmail.com
---
 net/core/dev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index b51e41d0a7fe..319fffc62ce6 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -7038,6 +7038,13 @@ void __netif_napi_del(struct napi_struct *napi)
 	list_del_rcu(&napi->dev_list);
 	napi_free_frags(napi);

+	if (napi->rx_count) {
+		struct sk_buff *skb, *n;
+
+		list_for_each_entry_safe(skb, n, &napi->rx_list, list)
+			kfree_skb(skb);
+	}
+
 	flush_gro_hash(napi);
 	napi->gro_bitmask = 0;

--
2.25.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
