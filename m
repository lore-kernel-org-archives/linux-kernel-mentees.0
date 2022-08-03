Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B6AC19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 15:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D409160BDC;
	Wed,  3 Aug 2022 15:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D409160BDC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WHLmK99N
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7i0C9RyQeih; Wed,  3 Aug 2022 15:14:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C87BB60A68;
	Wed,  3 Aug 2022 15:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C87BB60A68
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0480C0033;
	Wed,  3 Aug 2022 15:14:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF7ADC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 15:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B77AA60BDC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 15:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B77AA60BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYObX5qzfAHE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 15:14:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C068B60A68
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C068B60A68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 15:14:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E931EB822BA;
 Wed,  3 Aug 2022 15:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21E2C433D7;
 Wed,  3 Aug 2022 15:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659539655;
 bh=pK3P6YKF/O7YvZ9WTM4gxZVhDGtihziln7chla4iH5k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WHLmK99NPoh2XDLKBc8f63WccKUVyqXftm9dlFIwJgKXDyOUW1xGLVr9REBVvDIcW
 9IJMTMHr2rBRYhKlVGx0CW5FpSF2CmdFut3hllMCWnRjoUhIw2kQZzEjQAjg8l7P3j
 ij54+7b2Uys4a2OeIIVOVXCvsO3bJ8vkm7A+mgPv09SiQPeQ603p9ZtYoeFMEI6m+q
 +jjkJrqu6d9L4ql4apSGZfm8RQ3lRp9ITsfSt4uM3//ruNlYo4YrQFScbzVegcimyg
 1pAchX4QHKemLcAlanRzbUaIwmAdqVjp69dhaNOB7ymHUs7LCW5dXIadiaUXzcR7IJ
 WHCl3NPza6BXQ==
Date: Wed, 3 Aug 2022 08:14:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hawkins Jiawei <yin31149@gmail.com>, kafai@fb.com
Subject: Re: [PATCH v4] net: fix refcount bug in sk_psock_get (2)
Message-ID: <20220803081413.3cc27002@kernel.org>
In-Reply-To: <20220803124121.173303-1-yin31149@gmail.com>
References: <00000000000026328205e08cdbeb@google.com>
 <20220803124121.173303-1-yin31149@gmail.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, ast@kernel.org, edumazet@google.com,
 jakub@cloudflare.com, daniel@iogearbox.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org, yhs@fb.com,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 Wen Gu <guwen@linux.alibaba.com>, bpf@vger.kernel.org, kgraul@linux.ibm.com
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

On Wed,  3 Aug 2022 20:41:22 +0800 Hawkins Jiawei wrote:
> -/* Pointer stored in sk_user_data might not be suitable for copying
> - * when cloning the socket. For instance, it can point to a reference
> - * counted object. sk_user_data bottom bit is set if pointer must not
> - * be copied.
> +/* flag bits in sk_user_data
> + *
> + * SK_USER_DATA_NOCOPY - Pointer stored in sk_user_data might
> + * not be suitable for copying when cloning the socket.
> + * For instance, it can point to a reference counted object.
> + * sk_user_data bottom bit is set if pointer must not be copied.
> + *
> + * SK_USER_DATA_BPF    - Managed by BPF

I'd use this opportunity to add more info here, BPF is too general.
Maybe "Pointer is used by a BPF reuseport array"? Martin, WDYT?

> + * SK_USER_DATA_PSOCK  - Mark whether pointer stored in sk_user_data points
> + * to psock type. This bit should be set when sk_user_data is
> + * assigned to a psock object.

> +/**
> + * rcu_dereference_sk_user_data_psock - return psock if sk_user_data
> + * points to the psock type(SK_USER_DATA_PSOCK flag is set), otherwise
> + * return NULL
> + *
> + * @sk: socket
> + */
> +static inline
> +struct sk_psock *rcu_dereference_sk_user_data_psock(const struct sock *sk)

nit: the return type more commonly goes on the same line as "static
inline"

> +{
> +	uintptr_t __tmp = (uintptr_t)rcu_dereference(__sk_user_data((sk)));
> +
> +	if (__tmp & SK_USER_DATA_PSOCK)
> +		return (struct sk_psock *)(__tmp & SK_USER_DATA_PTRMASK);
> +
> +	return NULL;
> +}

As a follow up we can probably generalize this into
 __rcu_dereference_sk_user_data_cond(sk, bit)

and make the psock just call that:

static inline struct sk_psock *
rcu_dereference_sk_user_data_psock(const struct sock *sk)
{
	return __rcu_dereference_sk_user_data_cond(sk, SK_USER_DATA_PSOCK);
}

then reuseport can also benefit, maybe:

diff --git a/kernel/bpf/reuseport_array.c b/kernel/bpf/reuseport_array.c
index e2618fb5870e..ad5c447a690c 100644
--- a/kernel/bpf/reuseport_array.c
+++ b/kernel/bpf/reuseport_array.c
@@ -21,14 +21,11 @@ static struct reuseport_array *reuseport_array(struct bpf_map *map)
 /* The caller must hold the reuseport_lock */
 void bpf_sk_reuseport_detach(struct sock *sk)
 {
-	uintptr_t sk_user_data;
+	struct sock __rcu **socks;
 
 	write_lock_bh(&sk->sk_callback_lock);
-	sk_user_data = (uintptr_t)sk->sk_user_data;
-	if (sk_user_data & SK_USER_DATA_BPF) {
-		struct sock __rcu **socks;
-
-		socks = (void *)(sk_user_data & SK_USER_DATA_PTRMASK);
+	socks = __rcu_dereference_sk_user_data_cond(sk, SK_USER_DATA_BPF);
+	if (socks) {
 		WRITE_ONCE(sk->sk_user_data, NULL);
 		/*
 		 * Do not move this NULL assignment outside of


But that must be a separate patch, not part of this fix.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
