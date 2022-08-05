Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA429C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 10:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C34C6F951;
	Fri,  5 Aug 2022 10:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C34C6F951
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google header.b=cscfL3NT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MoReqLb21b1X; Fri,  5 Aug 2022 10:30:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 720DC6F93E;
	Fri,  5 Aug 2022 10:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 720DC6F93E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51649C0032;
	Fri,  5 Aug 2022 10:30:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98FD4C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 10:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DEEA83E25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 10:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DEEA83E25
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com
 header.a=rsa-sha256 header.s=google header.b=cscfL3NT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLU-kpcyAAWz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 10:30:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6667E83DF8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6667E83DF8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 10:30:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso1093779wmq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Aug 2022 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc;
 bh=Fj6CvmivrS9TPCyhKZOok91fag7o30GzVeMlkdrW5UY=;
 b=cscfL3NTbS6hrW9YRaDYe8O2B99CgwuZ396Af8zYT8/leAGXg6IRsbVOEu3ORRBrFa
 n1A2XRxnM1j7ypNMemvucqd8mMVq36kGgsqe3H+Zi4K9wousksUWwnXWsqHb4qi9cyOA
 MciAEOMmiwQIvhgyj+bjCZiroLfOpebuGlN7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc;
 bh=Fj6CvmivrS9TPCyhKZOok91fag7o30GzVeMlkdrW5UY=;
 b=1ITv6PMNqykdOXP+YJEdNK/imaj/51km1VigJEv3YO0D8QqcEatt5k+WoSifQ88znV
 32hF1uYdu6kBaTcFF+qvSUUmU4JznL+S6MBpH35blhg9WHbX+/HWWKye+oSvvgKx/ZUG
 nGiGXRsRSWz9g3omtDsfTxYEUn7yCUyhRBJf+trJ4MsqvkhteZ4S3QIKy/EpkJ/dbSJH
 BB24X0KpaHU7GZ4/qXk3ojX9TW/dfaSdhKnqIOhbkQDGonCu9A0z0UTIpbO8DKCNJ0FJ
 ie1wwVbDpMsDYI8c3ksHJW6SSWX7WswzW0pGKPC6mut5IOsGAxD5/k/J7Z4Q7yUpn4BJ
 tRTQ==
X-Gm-Message-State: ACgBeo05NyL8zKDkdJWmy0/kek6CjdiDAXNMo25TrNunBayZGL1woWrZ
 smqx7vgADkctLNyuLH4+qyMM4g==
X-Google-Smtp-Source: AA6agR59AieC5iYBstKo0qY2bhMRet0+L19AqHUBALTRhk6J+Kf8wmu3LcfZPUbzXe5puCQsazVxMA==
X-Received: by 2002:a1c:a1c5:0:b0:3a5:145b:3666 with SMTP id
 k188-20020a1ca1c5000000b003a5145b3666mr3938426wme.134.1659695443415; 
 Fri, 05 Aug 2022 03:30:43 -0700 (PDT)
Received: from cloudflare.com (79.184.200.53.ipv4.supernova.orange.pl.
 [79.184.200.53]) by smtp.gmail.com with ESMTPSA id
 az40-20020a05600c602800b003a310fe1d75sm9338955wmb.38.2022.08.05.03.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 03:30:42 -0700 (PDT)
References: <00000000000026328205e08cdbeb@google.com>
 <cover.1659676823.git.yin31149@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.2
To: Hawkins Jiawei <yin31149@gmail.com>
Subject: Re: [PATCH net v5 0/2] net: enhancements to sk_user_data field
Date: Fri, 05 Aug 2022 12:29:56 +0200
In-reply-to: <cover.1659676823.git.yin31149@gmail.com>
Message-ID: <87fsib9e3y.fsf@cloudflare.com>
MIME-Version: 1.0
Cc: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, paskripkin@gmail.com,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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
From: Jakub Sitnicki via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Jakub Sitnicki <jakub@cloudflare.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Aug 05, 2022 at 03:36 PM +08, Hawkins Jiawei wrote:
> This patchset fixes refcount bug by adding SK_USER_DATA_PSOCK flag bit in
> sk_user_data field. The bug cause following info:
>
> WARNING: CPU: 1 PID: 3605 at lib/refcount.c:19 refcount_warn_saturate+0xf4/0x1e0 lib/refcount.c:19
> Modules linked in:
> CPU: 1 PID: 3605 Comm: syz-executor208 Not tainted 5.18.0-syzkaller-03023-g7e062cda7d90 #0
>  <TASK>
>  __refcount_add_not_zero include/linux/refcount.h:163 [inline]
>  __refcount_inc_not_zero include/linux/refcount.h:227 [inline]
>  refcount_inc_not_zero include/linux/refcount.h:245 [inline]
>  sk_psock_get+0x3bc/0x410 include/linux/skmsg.h:439
>  tls_data_ready+0x6d/0x1b0 net/tls/tls_sw.c:2091
>  tcp_data_ready+0x106/0x520 net/ipv4/tcp_input.c:4983
>  tcp_data_queue+0x25f2/0x4c90 net/ipv4/tcp_input.c:5057
>  tcp_rcv_state_process+0x1774/0x4e80 net/ipv4/tcp_input.c:6659
>  tcp_v4_do_rcv+0x339/0x980 net/ipv4/tcp_ipv4.c:1682
>  sk_backlog_rcv include/net/sock.h:1061 [inline]
>  __release_sock+0x134/0x3b0 net/core/sock.c:2849
>  release_sock+0x54/0x1b0 net/core/sock.c:3404
>  inet_shutdown+0x1e0/0x430 net/ipv4/af_inet.c:909
>  __sys_shutdown_sock net/socket.c:2331 [inline]
>  __sys_shutdown_sock net/socket.c:2325 [inline]
>  __sys_shutdown+0xf1/0x1b0 net/socket.c:2343
>  __do_sys_shutdown net/socket.c:2351 [inline]
>  __se_sys_shutdown net/socket.c:2349 [inline]
>  __x64_sys_shutdown+0x50/0x70 net/socket.c:2349
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x46/0xb0
>  </TASK>
>
> To improve code maintainability, this patchset refactors sk_user_data
> flags code to be more generic.
>
> Hawkins Jiawei (2):
>   net: fix refcount bug in sk_psock_get (2)
>   net: refactor bpf_sk_reuseport_detach()
>
>  include/linux/skmsg.h        |  3 +-
>  include/net/sock.h           | 68 +++++++++++++++++++++++++-----------
>  kernel/bpf/reuseport_array.c |  9 ++---
>  net/core/skmsg.c             |  4 ++-
>  4 files changed, 56 insertions(+), 28 deletions(-)

Thank you for the fix.

For the series:

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
