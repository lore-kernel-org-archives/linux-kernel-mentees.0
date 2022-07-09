Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A7EC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  9 Jul 2022 03:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E438F84ADB;
	Sat,  9 Jul 2022 03:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E438F84ADB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RC3lVRzP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRtTqWQ5JpjA; Sat,  9 Jul 2022 03:06:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 09E0A84AFF;
	Sat,  9 Jul 2022 03:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E0A84AFF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAD7BC0033;
	Sat,  9 Jul 2022 03:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D6EDC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 03:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1090660E53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 03:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1090660E53
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=RC3lVRzP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68L8aF9FBWkw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 03:06:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A77BB60B3F
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A77BB60B3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 03:06:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE806B82A36;
 Sat,  9 Jul 2022 03:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D39EC341C0;
 Sat,  9 Jul 2022 03:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657335964;
 bh=U1K6nef6J4x5j2XZwh1q8ZuqeJJFO88Lt/OQry2fCKw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RC3lVRzP8QHAXO23r0o/AgJAlXIPlF75VO9wbzqXPFl0327gY9yesP6+YxwL+rKH7
 Rn+U+mCqgj6lq0AST5RPzgzIEVOXJ5Tmbghas1cnC9jRHj8cq/L/8/2Vw1akeYYPXi
 YVZdONr1SOKWKW6HXF16WCx/FUpllbuefJ8amYI/mjTb2aVokXg20+MF4tKFiZsUA6
 rksCcjmuIbgI2WhmTC9pmxqbdD38c+s1ui9h73vJgqM3IH/3/sErpWvi4Y1xVN1Wrl
 3XW8GqvdFH+eg6tBLruRl8Id1JAFqItTKC0QntSVnDRuxazNHbZiWBRgVaVAnRODZC
 iUoyEclRJLfGg==
Date: Fri, 8 Jul 2022 20:06:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hawkins Jiawei <yin31149@gmail.com>
Subject: Re: [PATCH] smc: fix refcount bug in sk_psock_get (2)
Message-ID: <20220708200602.1059bc09@kernel.org>
In-Reply-To: <20220709024659.6671-1-yin31149@gmail.com>
References: <00000000000026328205e08cdbeb@google.com>
 <20220709024659.6671-1-yin31149@gmail.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, ast@kernel.org, edumazet@google.com,
 daniel@iogearbox.net, davem@davemloft.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org, yhs@fb.com,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 kgraul@linux.ibm.com, guwen@linux.alibaba.com, bpf@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat,  9 Jul 2022 10:46:59 +0800 Hawkins Jiawei wrote:
> Reported-and-tested-by: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com
> Signed-off-by: hawk <18801353760@163.com>
> ---
>  net/ipv4/tcp.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index 9984d23a7f3e..a1e6cab2c748 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -3395,10 +3395,23 @@ static int do_tcp_setsockopt(struct sock *sk, int level, int optname,
>  	}
>  	case TCP_ULP: {
>  		char name[TCP_ULP_NAME_MAX];
> +		struct sock *smc_sock;
>  
>  		if (optlen < 1)
>  			return -EINVAL;
>  
> +		/* SMC sk_user_data may be treated as psock,
> +		 * which triggers a refcnt warning.
> +		 */
> +		rcu_read_lock();
> +		smc_sock = rcu_dereference_sk_user_data(sk);
> +		if (level == SOL_TCP && smc_sock &&
> +		    smc_sock->__sk_common.skc_family == AF_SMC) {

This should prolly be under the socket lock?

Can we add a bit to SK_USER_DATA_PTRMASK and have ULP-compatible
users (sockmap) opt into ULP cooperation? Modifying TCP is backwards,
layer-wise.

> +			rcu_read_unlock();
> +			return -EOPNOTSUPP;
> +		}
> +		rcu_read_unlock();
> +
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
