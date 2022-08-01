Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E07C00144
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Aug 2022 09:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3336B41295;
	Mon,  1 Aug 2022 09:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3336B41295
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google header.b=fp+jCnQ/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJEOlelQdOYg; Mon,  1 Aug 2022 09:16:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D051D410E6;
	Mon,  1 Aug 2022 09:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D051D410E6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8486AC0033;
	Mon,  1 Aug 2022 09:16:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83D1AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 09:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EFA24011A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 09:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EFA24011A
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com
 header.a=rsa-sha256 header.s=google header.b=fp+jCnQ/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIWrXqlmPfhr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 09:16:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3ED1402E2
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3ED1402E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 09:16:03 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id f5so6357809eje.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 01 Aug 2022 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc;
 bh=mVLib6+KglGWzrVB//L7ezE4how+oky3wShDacSr+Rk=;
 b=fp+jCnQ/ItfHQ1hBwegHh+Ldz7J5kAwEOruTIPovevlje/32kxnh/US3StTNaYN0hk
 LBjV0xdxA2kKiZ7glZAtjn3ihomHLymWh2cSyoDhKTDoMt0iZjgAys3zXeZ2SIK1lC6N
 FW7ALONcIV5nxv9CvyCeLgNoZFZ3ZWcMX0q24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc;
 bh=mVLib6+KglGWzrVB//L7ezE4how+oky3wShDacSr+Rk=;
 b=y95kSNOgDMRMVK+D1W9iHvNyqn6JdzwavmyH5cuYTvrE2bPvX24rsXuQ63ulS404s0
 J3VKEAtIEamIAsAss1xhmEZoe9dxFEauyUPbxGSwJGBSulsOMFLk4WdPkhUHGPjAUyIP
 JugjyiY0aRIjIG+GJ1A4Y9AaROo9WjxKmke6eSGoQLoLvA3L+lsMHEMTJxYsRYcnlOKt
 W6zzJxd7zCTNUf4QjvBnpKGAqcmiHCjwqJMcVBKdYOnNYt4dvbZorIZF87xkMs1KD2XE
 beksq+EfTXdC6whR8Lns9EOqtM9T6uj/3EZumvcw7jfj9qNkik5Bgsx1N9ktmJqcWuZB
 z1hg==
X-Gm-Message-State: ACgBeo0bqvu1HyNzKtgu8T34GZKP3pbpbVNmO9HiAYqbbbjn5sZSHjLh
 L8y2nZkl25MKIoPnPNk/fyDBnw==
X-Google-Smtp-Source: AA6agR4W2ED17/n5sJ/4mk6scRZmpD1dZvTpHT3k2MkraGjSqDq6np/Nh+5vKxICYqkmm4nr3glzrg==
X-Received: by 2002:a17:907:1deb:b0:730:81ea:1d09 with SMTP id
 og43-20020a1709071deb00b0073081ea1d09mr3464726ejc.183.1659345362041; 
 Mon, 01 Aug 2022 02:16:02 -0700 (PDT)
Received: from cloudflare.com (79.184.200.53.ipv4.supernova.orange.pl.
 [79.184.200.53]) by smtp.gmail.com with ESMTPSA id
 ky1-20020a170907778100b00722e52d043dsm4984008ejc.114.2022.08.01.02.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 02:16:01 -0700 (PDT)
References: <00000000000026328205e08cdbeb@google.com>
 <20220730085654.2598-1-yin31149@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.2
To: Hawkins Jiawei <yin31149@gmail.com>
Subject: Re: [PATCH v2] net/smc: fix refcount bug in sk_psock_get (2)
Date: Mon, 01 Aug 2022 11:09:23 +0200
In-reply-to: <20220730085654.2598-1-yin31149@gmail.com>
Message-ID: <87wnbsjpdb.fsf@cloudflare.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, guvenc@linux.ibm.com, ast@kernel.org,
 edumazet@google.com, linux-s390@vger.kernel.org, daniel@iogearbox.net,
 davem@davemloft.net, borisp@nvidia.com, paskripkin@gmail.com,
 john.fastabend@gmail.com, andrii@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, ubraun@linux.ibm.com, kpsingh@kernel.org,
 wenjia@linux.ibm.com, yhs@fb.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kgraul@linux.ibm.com, guwen@linux.alibaba.com,
 bpf@vger.kernel.org, kafai@fb.com
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

Hi,

On Sat, Jul 30, 2022 at 04:56 PM +08, Hawkins Jiawei wrote:
> Syzkaller reports refcount bug as follows:
> ------------[ cut here ]------------
> refcount_t: saturated; leaking memory.
> WARNING: CPU: 1 PID: 3605 at lib/refcount.c:19 refcount_warn_saturate+0xf4/0x1e0 lib/refcount.c:19
> Modules linked in:
> CPU: 1 PID: 3605 Comm: syz-executor208 Not tainted 5.18.0-syzkaller-03023-g7e062cda7d90 #0
> ...
> Call Trace:
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
> During SMC fallback process in connect syscall, kernel will
> replaces TCP with SMC. In order to forward wakeup
> smc socket waitqueue after fallback, kernel will sets
> clcsk->sk_user_data to origin smc socket in
> smc_fback_replace_callbacks().
>
> Later, in shutdown syscall, kernel will calls
> sk_psock_get(), which treats the clcsk->sk_user_data
> as sk_psock type, triggering the refcnt warning.
>
> So, the root cause is that smc and psock, both will use
> sk_user_data field. So they will mismatch this field
> easily.
>
> This patch solves it by using another bit(defined as
> SK_USER_DATA_NOTPSOCK) in PTRMASK, to mark whether
> sk_user_data points to a sk_psock object or not.
> This patch depends on a PTRMASK introduced in commit f1ff5ce2cd5e
> ("net, sk_msg: Clear sk_user_data pointer on clone if tagged").
>
> Fixes: 341adeec9ada ("net/smc: Forward wakeup to smc socket waitqueue after fallback")
> Fixes: a60a2b1e0af1 ("net/smc: reduce active tcp_listen workers")
> Reported-and-tested-by: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Acked-by: Wen Gu <guwen@linux.alibaba.com>
> Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
> ---

Since using psock is not the common case, I'm wondering if it makes more
sense to have an inverse flag - SK_USER_DATA_PSOCK. Flag would be set by
the psock code on assignment to sk_user_data.

This way we would also avoid some confusion. With the change below, the
SK_USER_DATA_NOTPSOCK is not *always* set when sk_user_data holds a
non-psock pointer. Only when SMC sets it.

If we go with the current approach, the rest of sites, execpt for psock,
that assign to sk_user_data should be updated to set
SK_USER_DATA_NOTPSOCK as well, IMO.

That is why I'd do it the other way.

[...]
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
