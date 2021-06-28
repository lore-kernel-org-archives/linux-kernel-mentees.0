Return-Path: <SRS0=s8/Q=LW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B164CC49361
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 17:15:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59CDE61C43
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 17:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59CDE61C43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C9D40283;
	Mon, 28 Jun 2021 17:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY5PDH4y2l1D; Mon, 28 Jun 2021 17:15:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BF86F4026D;
	Mon, 28 Jun 2021 17:15:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4CABC0010;
	Mon, 28 Jun 2021 17:15:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBFCFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD4F8402CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ft9ywhWuZybn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:15:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6F8F402C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:15:07 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id u190so16011880pgd.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 10:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fCKObqA74NqRAYeVYKlKeknSs67vwt3CV8aw7Nhvy9Y=;
 b=TNZkaKv7eJglshBuJEK/UhqienXmlRATwI+7iziTa3f0dRigg6mYsjMCVdF/Tf4SGN
 cip34c2yIqs8d5p20Kaln2A1a3dnOObbjZT/lblPMDUZFBkAxFaSrXhx6VvHXq13Xb0L
 Sn02VBe9+CTEV44DJpt3f16X5VV4JdtiWmosc/JenE289VhuNNuJxGRBdWrHyyIZX5K+
 Vs0ggg8Yj3VZV1vbkHwkqeAyanKgd2kskucy5RYIJ6CyyoZgt2fXKsztiNkgHRUS09Ht
 WhRBBYjeXZFWL7WlChB/I/mH2xgZmBG8usWjMMlMa2MDb7/BPq+PFpCVlorpAuQcEWsy
 137w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fCKObqA74NqRAYeVYKlKeknSs67vwt3CV8aw7Nhvy9Y=;
 b=EPreonLrG413FqkIXAJkkIBIEBX8bpoT0jt+L7QqdRfzExi9LVpQ0/ifpBqZCJo+X1
 KDC0UDnpPkPAw1qJLyd/Gcai7Vev5TqEbHJm74hZevhZtnCK5Bk8YJjsP5TNv7x0WJ+W
 Z0BynJGOgOLjuXM86MqwFkFzax9L0u65tpJqTJSKeUlBSKMtzrYO2ngt5jLzAnP2WNWi
 V5iE+C5Zfi/RaY8UqKruvl7Ony/GXPSDlbYTbpNZlX/kPg3KK1st6++ZZkSBT9vesNxv
 ynIiKKoYNUQNH7KsVMuRgjvhbaukqzr6Xx9JrGCtqE6jF9JflUXwI74cqUkbR3pHp8ur
 14YQ==
X-Gm-Message-State: AOAM5328xH2hyajn/6BG4Y+qqv7swwMwZoS2bdam49X8EURwebTLOH+I
 EoSQxEkb+HqocRr1d+bqlOc=
X-Google-Smtp-Source: ABdhPJxZbRVyTh/aEiikN39UXk/5br3PktBli3ZLyY1Oyps6WsdFzqRLViK+wikefkKAegarMKsrQA==
X-Received: by 2002:a62:8857:0:b029:30c:5b98:564d with SMTP id
 l84-20020a6288570000b029030c5b98564dmr6515689pfd.81.1624900507209; 
 Mon, 28 Jun 2021 10:15:07 -0700 (PDT)
Received: from [192.168.93.106] (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id w8sm16282132pgf.81.2021.06.28.10.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 10:15:06 -0700 (PDT)
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Neal Cardwell <ncardwell@google.com>
References: <20210628144908.881499-1-phind.uet@gmail.com>
 <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
 <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
 <CADVnQy=Q9W=Vxu81ctPLx08D=ALnHBXGr0c4BLtQGxwQE+yjRg@mail.gmail.com>
From: Phi Nguyen <phind.uet@gmail.com>
Message-ID: <ee5ef69e-ee3f-1df0-2033-5adc06a46b9c@gmail.com>
Date: Tue, 29 Jun 2021 01:15:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADVnQy=Q9W=Vxu81ctPLx08D=ALnHBXGr0c4BLtQGxwQE+yjRg@mail.gmail.com>
Content-Language: en-US
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Yuchung Cheng <ycheng@google.com>,
 kpsingh@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>
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

On 6/29/2021 12:24 AM, Neal Cardwell wrote:

> Thanks.
> 
> Can you also please provide a summary of the event sequence that
> triggers the bug? Based on your Reported-by tag, I guess this is based
> on the syzbot reproducer:
> 
>   https://groups.google.com/g/syzkaller-bugs/c/VbHoSsBz0hk/m/cOxOoTgPCAAJ
> 
> but perhaps you can give a summary of the event sequence that causes
> the bug? Is it that the call:
> 
> setsockopt$inet_tcp_TCP_CONGESTION(r0, 0x6, 0xd,
> &(0x7f0000000000)='cdg\x00', 0x4)
> 
> initializes the CC and happens before the connection is established,
> and then when the connection is established, the line that sets:
>    icsk->icsk_ca_initialized = 0;
> is incorrect, causing the CC to be initialized again without first
> calling the cleanup code that deallocates the CDG-allocated memory?
> 
> thanks,
> neal
> 

Hi Neal,

The gdb stack trace that lead to init_transfer_input() is as bellow, the 
current sock state is TCP_SYN_RECV.

#0  tcp_cdg_init (sk=sk@entry=0xffff8880275fa080) at net/ipv4/tcp_cdg.c:380
#1  0xffffffff83a3c129 in tcp_init_congestion_control 
(sk=sk@entry=0xffff8880275fa080) at net/ipv4/tcp_cong.c:183
#2  0xffffffff83a21312 in tcp_init_transfer 
(sk=sk@entry=0xffff8880275fa080, bpf_op=bpf_op@entry=5, 
skb=skb@entry=0xffff888027704400) at net/ipv4/tcp_input.c:5928
#3  0xffffffff83a22a55 in tcp_rcv_state_process 
(sk=sk@entry=0xffff8880275fa080, skb=skb@entry=0xffff888027704400) at 
net/ipv4/tcp_input.c:6416
#4  0xffffffff83a35f8a in tcp_v4_do_rcv (sk=sk@entry=0xffff8880275fa080, 
skb=skb@entry=0xffff888027704400) at net/ipv4/tcp_ipv4.c:1716
#5  0xffffffff83a39300 in tcp_v4_rcv (skb=0xffff888027704400) at 
net/ipv4/tcp_ipv4.c:2087
#6  0xffffffff839eaf57 in ip_protocol_deliver_rcu 
(net=net@entry=0xffff888022858180, skb=skb@entry=0xffff888027704400, 
protocol=<optimized out>) at net/ipv4/ip_input.c:204
#7  0xffffffff839eb266 in ip_local_deliver_finish 
(net=0xffff888022858180, sk=<optimized out>, skb=0xffff888027704400) at 
./include/linux/skbuff.h:2544
#8  0xffffffff839eb34a in NF_HOOK (sk=0x0 <fixed_percpu_data>, pf=2 
'\002', hook=1, in=<optimized out>, out=0x0 <fixed_percpu_data>, 
okfn=0xffffffff839eb1f0 <ip_local_deliver_finish>,
     skb=0xffff888027704400, net=0xffff888022858180) at 
./include/linux/netfilter.h:307
#9  NF_HOOK (pf=2 '\002', sk=0x0 <fixed_percpu_data>, out=0x0 
<fixed_percpu_data>, okfn=0xffffffff839eb1f0 <ip_local_deliver_finish>, 
in=<optimized out>, skb=0xffff888027704400,
     net=0xffff888022858180, hook=1) at ./include/linux/netfilter.h:301
#10 ip_local_deliver (skb=0xffff888027704400) at net/ipv4/ip_input.c:252
#11 0xffffffff839ea58e in dst_input (skb=0xffff888027704400) at 
./include/linux/skbuff.h:980
#12 ip_rcv_finish (net=net@entry=0xffff888022858180, sk=sk@entry=0x0 
<fixed_percpu_data>, skb=skb@entry=0xffff888027704400) at 
net/ipv4/ip_input.c:429
#13 0xffffffff839eb4fa in NF_HOOK (sk=0x0 <fixed_percpu_data>, pf=2 
'\002', hook=0, in=0xffff888022a20000, out=0x0 <fixed_percpu_data>, 
okfn=0xffffffff839ea4b0 <ip_rcv_finish>, skb=0xffff888027704400,
     net=0xffff888022858180) at ./include/linux/netfilter.h:307
#14 NF_HOOK (pf=2 '\002', sk=0x0 <fixed_percpu_data>, out=0x0 
<fixed_percpu_data>, okfn=0xffffffff839ea4b0 <ip_rcv_finish>, 
in=0xffff888022a20000, skb=0xffff888027704400, net=0xffff888022858180,
     hook=0) at ./include/linux/netfilter.h:301
#15 ip_rcv (skb=0xffff888027704400, dev=0xffff888022a20000, 
pt=<optimized out>, orig_dev=<optimized out>) at net/ipv4/ip_input.c:540
#16 0xffffffff83712acf in __netif_receive_skb_one_core (skb=<optimized 
out>, skb@entry=0xffff888027704400, pfmemalloc=pfmemalloc@entry=false) 
at net/core/dev.c:5482
#17 0xffffffff83712b59 in __netif_receive_skb (skb=0xffff888027704400) 
at net/core/dev.c:5596
#18 0xffffffff83712f09 in process_backlog (napi=0xffff88803ec2c8d0, 
quota=64) at net/core/dev.c:6460
#19 0xffffffff837159f2 in __napi_poll (n=n@entry=0xffff88803ec2c8d0, 
repoll=repoll@entry=0xffffc900007b7e0f) at net/core/dev.c:7015
#20 0xffffffff837161b2 in napi_poll (repoll=0xffffc900007b7e20, 
n=0xffff88803ec2c8d0) at net/core/dev.c:7082
#21 net_rx_action (h=<optimized out>) at net/core/dev.c:7169
#22 0xffffffff84600114 in __do_softirq () at kernel/softirq.c:558
#23 0xffffffff81241506 in run_ksoftirqd (cpu=<optimized out>) at 
kernel/softirq.c:920
#24 run_ksoftirqd (cpu=<optimized out>) at kernel/softirq.c:912
#25 0xffffffff8127ec83 in smpboot_thread_fn (data=0xffff888008f70240) at 
kernel/smpboot.c:164
#26 0xffffffff81274475 in kthread (_create=<optimized out>) at 
kernel/kthread.c:319
#27 0xffffffff8100230f in ret_from_fork () at arch/x86/entry/entry_64.S:295
#28 0x0000000000000000 in ?? ()

Best Regards.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
