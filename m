Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337F1C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 03:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A95BB40C40;
	Wed, 13 Jul 2022 03:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A95BB40C40
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kTU80BTa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yu7_4MpN0Qwe; Wed, 13 Jul 2022 03:10:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 76B5F404BB;
	Wed, 13 Jul 2022 03:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76B5F404BB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D7E0C0033;
	Wed, 13 Jul 2022 03:10:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E55A8C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD21D42312
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD21D42312
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kTU80BTa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzW0KY03cyhi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:10:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CFB942311
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CFB942311
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:10:26 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id s206so9297620pgs.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jul 2022 20:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TaF/Lj+NmXPxuI2k7BxAPwwPaE376VR5hymiA2YLIJU=;
 b=kTU80BTai1sfi9d9e4NKDgaZ2ivI4N82ugddNyR6E+2P4IHaogb9zaRDHpcWhrf0oB
 3FjZdAHZVAitue7xlqRHo/XqTbFXBuHsboBt0vQlCWKo4ycbB+kZm52QvqzgWLm+Owic
 aWRhkUClheIed/CEwyyyW4ywq6RsBLqhNDgvpcpmqXm2wuKCIX9v/cFqznDGo4JswjB7
 CMR+6l0RxytBhjLJl0aRVoYQjFlEqScYpPPqC/ewd3g9FlK9aBclYv6P8Kbs4s6F+idU
 cRaa2G6GXTof7UV0D3ueI5cu9eK649tJnQmSAQPgzkBG/xQhvfyjH7S6nTvLBBYFrjR9
 ufbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TaF/Lj+NmXPxuI2k7BxAPwwPaE376VR5hymiA2YLIJU=;
 b=dB554AEUZaX8f3PIMqVr5imyzsAGZ2WpxDpNsZvFxTmbR5M8eX5XEHs2nNvfQ1ewJ1
 A7Y8eJBGJmQA1GHMkF+QQPAwGrlmqe9cQP83IibgyJXuTAa2Hute3c+dreJzxqWB/z2v
 xhBsIuvbYdObmbYR1o7SQB7XFmB/UlxG7CQKlSlRPjvqBEJoPQ1wWnGyP3H08aywsF/6
 Kp+SDpahxrF3UoI9q5BiZdpUJmKSpcUYIQe0E+asSPOoETW7I0RPkgN4x9Ypttfh4hWI
 /DeijN5er+aUW+muHNT+3b3BE1HL1n74s/V0MGtu9MV680JdilizBgH7pOQzCU3/EDa6
 xZEw==
X-Gm-Message-State: AJIora/xUs/QdfgLGe3wwDt7+s5ttGwL+4EjvFl8ZOsUKt1L5mZIoD4I
 CP/+N1sfUnAMsUNBaOKYLHM=
X-Google-Smtp-Source: AGRyM1sXJbFSbjgYrExu7if6in9LpmUGA+XK4zknnmAAZK21SmCOQPX/pXLoX/FABIHJtbtShs2F4Q==
X-Received: by 2002:aa7:8896:0:b0:52a:c018:9d7d with SMTP id
 z22-20020aa78896000000b0052ac0189d7dmr1285482pfe.82.1657681825464; 
 Tue, 12 Jul 2022 20:10:25 -0700 (PDT)
Received: from localhost.localdomain (pcd568068.netvigator.com.
 [218.102.100.68]) by smtp.gmail.com with ESMTPSA id
 b6-20020a62cf06000000b00528d3d7194dsm7594291pfg.4.2022.07.12.20.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 20:10:25 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: guwen@linux.alibaba.com
Subject: Re: [PATCH] smc: fix refcount bug in sk_psock_get (2)
Date: Wed, 13 Jul 2022 11:10:05 +0800
Message-Id: <20220713031005.58220-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0408b739-3506-608a-4284-1086443a154d@linux.alibaba.com>
References: <0408b739-3506-608a-4284-1086443a154d@linux.alibaba.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, yhs@fb.com, ast@kernel.org, edumazet@google.com,
 daniel@iogearbox.net, davem@davemloft.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org,
 kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, yin31149@gmail.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 kgraul@linux.ibm.com, chuck.lever@oracle.com, bpf@vger.kernel.org,
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

On Mon, 11 Jul 2022 at 15:21, Wen Gu <guwen@linux.alibaba.com> wrote:
>Although syzbot found this issue in SMC, seems that it is a generic
>issue about sk_user_data usage? Fixing it from SK_USER_DATA_PTRMASK
>as you plan should be a right way.

Thanks for your advice. In fact, I found a more
general patch, but it seems that it has not 
been merged until now.

In this bug, the problem is that smc and psock, both use
sk_user_data field to save their private data. So they 
will treat field in their own way.

>> in smc_switch_to_fallback(), and set smc->clcsock->sk_user_data
>> to origin smc in smc_fback_replace_callbacks().
>> 
>> Later, sk_psock_get() will treat the smc->clcsock->sk_user_data
>> as sk_psock type, which triggers the refcnt warning.

So in the patch [PATCH RFC 1/5] net: Add distinct sk_psock field,
psock private data will be moved to the sk_psock field, shown as
below
> The sk_psock facility populates the sk_user_data field with the
> address of an extra bit of metadata. User space sockets never
> populate the sk_user_data field, so this has worked out fine.
> 
> However, kernel consumers such as the RPC client and server do
> populate the sk_user_data field. The sk_psock() function cannot tell
> that the content of sk_user_data does not point to psock metadata,
> so it will happily return a pointer to something else, cast to a
> struct sk_psock.
> 
> Thus kernel consumers and psock currently cannot co-exist.
> 
> We could educate sk_psock() to return NULL if sk_user_data does
> not point to a struct sk_psock. However, a more general solution
> that enables full co-existence psock and other uses of sk_user_data
> might be more interesting.
> 
> Move the struct sk_psock address to its own pointer field so that
> the contents of the sk_user_data field is preserved.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> ---
>  include/linux/skmsg.h |    2 +-
>  include/net/sock.h    |    4 +++-
>  net/core/skmsg.c      |    6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/skmsg.h b/include/linux/skmsg.h
> index c5a2d6f50f25..5ef3a07c5b6c 100644
> --- a/include/linux/skmsg.h
> +++ b/include/linux/skmsg.h
> @@ -277,7 +277,7 @@ static inline void sk_msg_sg_copy_clear(
>			struct sk_msg *msg, u32 start)
>  
>  static inline struct sk_psock *sk_psock(const struct sock *sk)
>  {
> -	return rcu_dereference_sk_user_data(sk);
> +	return rcu_dereference(sk->sk_psock);
>  }
>  
>  static inline void sk_psock_set_state(struct sk_psock *psock,
> diff --git a/include/net/sock.h b/include/net/sock.h
> index c4b91fc19b9c..d2a513169527 100644
> --- a/include/net/sock.h
> +++ b/include/net/sock.h
> @@ -327,7 +327,8 @@ struct sk_filter;
>    *	@sk_tskey: counter to disambiguate concurrent tstamp requests
>    *	@sk_zckey: counter to order MSG_ZEROCOPY notifications
>    *	@sk_socket: Identd and reporting IO signals
> -  *	@sk_user_data: RPC layer private data
> +  *	@sk_user_data: Upper layer private data
> +  *	@sk_psock: socket policy data (bpf)
>    *	@sk_frag: cached page frag
>    *	@sk_peek_off: current peek_offset value
>    *	@sk_send_head: front of stuff to transmit
> @@ -519,6 +520,7 @@ struct sock {
>  
>  	struct socket		*sk_socket;
>  	void			*sk_user_data;
> +	struct sk_psock	__rcu	*sk_psock;
>  #ifdef CONFIG_SECURITY
>  	void			*sk_security;
>  #endif
> diff --git a/net/core/skmsg.c b/net/core/skmsg.c
> index cc381165ea08..2b3d01d92790 100644
> --- a/net/core/skmsg.c
> +++ b/net/core/skmsg.c
> @@ -695,7 +695,7 @@ struct sk_psock *sk_psock_init(struct sock *sk,
>					int node)
>  
>  	write_lock_bh(&sk->sk_callback_lock);
>  
> -	if (sk->sk_user_data) {
> +	if (sk->sk_psock) {
>  		psock = ERR_PTR(-EBUSY);
>  		goto out;
>  	}
> @@ -726,7 +726,7 @@ struct sk_psock *sk_psock_init(struct sock *sk,
>					int node)
>  	sk_psock_set_state(psock, SK_PSOCK_TX_ENABLED);
>  	refcount_set(&psock->refcnt, 1);
>  
> -	rcu_assign_sk_user_data_nocopy(sk, psock);
> +	rcu_assign_pointer(sk->sk_psock, psock);
>  	sock_hold(sk);
>  
>  out:
> @@ -825,7 +825,7 @@ void sk_psock_drop(struct sock *sk,
>					struct sk_psock *psock)
>  {
>  	write_lock_bh(&sk->sk_callback_lock);
>  	sk_psock_restore_proto(sk, psock);
> -	rcu_assign_sk_user_data(sk, NULL);
> +	rcu_assign_pointer(sk->sk_psock, NULL);
>  	if (psock->progs.stream_parser)
>  		sk_psock_stop_strp(sk, psock);
>  	else if (psock->progs.stream_verdict || psock->progs.skb_verdict)

I have tested this patch and the reproducer did not trigger any issue.

In Patchwork website, this patch fails the checks on
netdev/cc_maintainers. If this patch fails for some other reasons,
I will still fix this bug from SK_USER_DATA_PTRMASK,
as a temporary solution.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
