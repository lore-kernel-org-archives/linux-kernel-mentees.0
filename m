Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E52CCA480
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Jul 2022 07:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B19260EA8;
	Mon, 11 Jul 2022 07:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B19260EA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQ2cES5CSedv; Mon, 11 Jul 2022 07:21:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9EA5160A91;
	Mon, 11 Jul 2022 07:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA5160A91
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 784A4C0033;
	Mon, 11 Jul 2022 07:21:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECA8DC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jul 2022 07:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7A3C60E9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jul 2022 07:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7A3C60E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hojcb67zF6NT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jul 2022 07:21:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 272D660A91
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 272D660A91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jul 2022 07:21:32 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=guwen@linux.alibaba.com; NM=1; PH=DS; RN=26; SR=0;
 TI=SMTPD_---0VIxofy0_1657524082; 
Received: from 30.227.65.231(mailfrom:guwen@linux.alibaba.com
 fp:SMTPD_---0VIxofy0_1657524082) by smtp.aliyun-inc.com;
 Mon, 11 Jul 2022 15:21:24 +0800
Message-ID: <0408b739-3506-608a-4284-1086443a154d@linux.alibaba.com>
Date: Mon, 11 Jul 2022 15:21:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] smc: fix refcount bug in sk_psock_get (2)
To: Hawkins Jiawei <yin31149@gmail.com>,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com
References: <00000000000026328205e08cdbeb@google.com>
 <20220709024659.6671-1-yin31149@gmail.com>
From: Wen Gu <guwen@linux.alibaba.com>
In-Reply-To: <20220709024659.6671-1-yin31149@gmail.com>
Cc: songliubraving@fb.com, ast@kernel.org, edumazet@google.com,
 daniel@iogearbox.net, davem@davemloft.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org, yhs@fb.com,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, kuba@kernel.org,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 linux-kernel@vger.kernel.org, kgraul@linux.ibm.com, bpf@vger.kernel.org,
 kafai@fb.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 2022/7/9 10:46 am, Hawkins Jiawei wrote:

> 
> syzbot is try to setup TLS on a SMC socket.
> 
> During SMC fallback process in connect syscall, kernel will sets the
> smc->sk.sk_socket->file->private_data to smc->clcsock
> in smc_switch_to_fallback(), and set smc->clcsock->sk_user_data
> to origin smc in smc_fback_replace_callbacks().

> 
> Later, sk_psock_get() will treat the smc->clcsock->sk_user_data
> as sk_psock type, which triggers the refcnt warning.
> 


Thanks for your analysis.

Although syzbot found this issue in SMC, seems that it is a generic
issue about sk_user_data usage? Fixing it from SK_USER_DATA_PTRMASK
as you plan should be a right way.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
