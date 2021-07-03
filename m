Return-Path: <SRS0=Q14B=L3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0759CC07E97
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Jul 2021 21:50:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ACB06124B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Jul 2021 21:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ACB06124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A9D1606F7;
	Sat,  3 Jul 2021 21:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfb61F7KFcSG; Sat,  3 Jul 2021 21:49:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 462D06059F;
	Sat,  3 Jul 2021 21:49:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2428EC0010;
	Sat,  3 Jul 2021 21:49:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B2CBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 21:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6877B83DEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 21:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWUIHcnHOpUG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 21:49:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C09A83DAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 21:49:52 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id C45144D3131C8;
 Sat,  3 Jul 2021 14:49:49 -0700 (PDT)
Date: Sat, 03 Jul 2021 14:49:45 -0700 (PDT)
Message-Id: <20210703.144945.1327654903412498334.davem@davemloft.net>
To: phind.uet@gmail.com
Subject: Re: [PATCH v4] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
From: David Miller <davem@davemloft.net>
In-Reply-To: <20210703093417.1569943-1-phind.uet@gmail.com>
References: <20210703093417.1569943-1-phind.uet@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Sat, 03 Jul 2021 14:49:50 -0700 (PDT)
Cc: songliubraving@fb.com,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com, daniel@iogearbox.net,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, andrii@kernel.org,
 edumazet@google.com, yyd@google.com, ycheng@google.com, kuba@kernel.org,
 kpsingh@kernel.org, yhs@fb.com, bpf@vger.kernel.org, ncardwell@google.com,
 kafai@fb.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

From: Nguyen Dinh Phi <phind.uet@gmail.com>
Date: Sat,  3 Jul 2021 17:34:17 +0800

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 7d5e59f688de..855ada2be25e 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5922,7 +5922,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_op, struct sk_buff *skb)
>  		tp->snd_cwnd = tcp_init_cwnd(tp, __sk_dst_get(sk));
>  	tp->snd_cwnd_stamp = tcp_jiffies32;
> 
> -	icsk->icsk_ca_initialized = 0;
>  	bpf_skops_established(sk, bpf_op, skb);
>  	if (!icsk->icsk_ca_initialized)
>  		tcp_init_congestion_control(sk);

Don't you have to make the tcp_init_congestion_control() call unconditional now?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
