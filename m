Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D68CC433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 19:39:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30EC2208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 19:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30EC2208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D53485429;
	Mon, 27 Jul 2020 19:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_MHWgBmuVbS; Mon, 27 Jul 2020 19:38:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3C87085218;
	Mon, 27 Jul 2020 19:38:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 247E3C0050;
	Mon, 27 Jul 2020 19:38:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7BEBC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D3D2388127
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qR06MD3mpD6i
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:38:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 65BD185A03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:38:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id BF56C1276E442;
 Mon, 27 Jul 2020 12:22:09 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:38:54 -0700 (PDT)
Message-Id: <20200727.123854.863832576284265842.davem@davemloft.net>
To: lkp@intel.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <202007272337.Rd2io2fw%lkp@intel.com>
References: <20200727131057.7a3of3hhsld4ng5t@pesu.pes.edu>
 <202007272337.Rd2io2fw%lkp@intel.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 27 Jul 2020 12:22:10 -0700 (PDT)
Cc: kbuild-all@lists.01.org, bkkarthik@pesu.pes.edu,
 linux-kernel@vger.kernel.org, jmaloy@redhat.com, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, ying.xue@windriver.com, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] net: tipc: fix general
 protection fault in tipc_conn_delete_sub
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

From: kernel test robot <lkp@intel.com>
Date: Mon, 27 Jul 2020 23:52:50 +0800

> All warnings (new ones prefixed by >>):
> 
>    net/tipc/topsrv.c: In function 'tipc_conn_send_to_sock':
>>> net/tipc/topsrv.c:259:10: warning: 'return' with a value, in function returning void [-Wreturn-type]
>      259 |   return -EINVAL;
>          |          ^
>    net/tipc/topsrv.c:247:13: note: declared here
>      247 | static void tipc_conn_send_to_sock(struct tipc_conn *con)
>          |             ^~~~~~~~~~~~~~~~~~~~~~

Please look at the compiler output when you submit changes.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
