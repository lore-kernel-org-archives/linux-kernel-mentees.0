Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CBBC19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  2 Aug 2022 14:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3335408DE;
	Tue,  2 Aug 2022 14:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3335408DE
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aesQNlVx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPhpCZIc2by3; Tue,  2 Aug 2022 14:32:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6092D408F1;
	Tue,  2 Aug 2022 14:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6092D408F1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30F83C0033;
	Tue,  2 Aug 2022 14:32:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 539D3C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 14:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2557C81455
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 14:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2557C81455
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aesQNlVx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2sGXwsjARdp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 14:32:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5426381454
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5426381454
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 14:32:22 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso15805822pjq.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 02 Aug 2022 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=a2I3feE0Mlfc3dQYVR+6wp2Xd8855Ae93uhZIIi/yHM=;
 b=aesQNlVxD1yT/+g/rcziiqLmKf9Hlm4zQQ8bBvOm0oMfANjlGDpxKqZmpWKm2YnQDm
 LFZ/MXvbb3s71YM75UkKN4Jt4s/ZWOV3PKtzYjpYxhWxYjfsefJutvUBRtmXRkDT/+fh
 gvKoiOn1EBsouTWHyg6Ju3+b6aBVDJ1KmwG+DpepedgZHxZgRbFkbSTgUmbcGvP0mIp0
 y/+m+2Hx6jAYOjwCJ0cO5ZlX1EwegRTdAkUDJY2269qXI/owaAW0twShGzApePCaVe7h
 D/jqVN4qGJ8AoNxqd1bLBacScqDR+hSIys2eexLd8l1X5EptRGbTSsyq3NtxmxZmQdO6
 O7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=a2I3feE0Mlfc3dQYVR+6wp2Xd8855Ae93uhZIIi/yHM=;
 b=NjoeyjpqarQ//Cow576dLW5t1Mz5LcAul/3c8pzck3SMBC2uqZkavPyDkKDZT4DKAy
 TQ48E2Um/WM7ga2fyA2RQ/s17rsz+cuPZsGAGOw2fmx4FtHZEjhDBst7UaUupZeQePv5
 uO9qhrI8pzc9qwWeV1BdpACednpfegqpgBOCuhZqLxWpLHYhD5erl12FP+euzsnGCw9k
 ZDYKXcdhQoIW3Z0qXQ803wa2TOuG2gLkpjxI9EoYn+GZf8qmq7GGlxLKrZUPedVk0ZUi
 R057ijSJd31WAqCvC2WceMOqWiBuTvejuLcXWbEKxvIT1qdvFv1OVUQQXV/AggIdIsv/
 g8KA==
X-Gm-Message-State: ACgBeo3j5F+em2EDAA5dxsZA1vlHai4cS1mkGQ6eWnsfO1e1xZcnTnF3
 xcVAfMSYRt0GYWkC96pWe/w=
X-Google-Smtp-Source: AA6agR5f0C9L4dHw1ZGT1V6HsSKE+oSWd0oY5hDNIEcYNyrNHoM+heSlQ+rbuArRCrxHcS4G+noBOA==
X-Received: by 2002:a17:902:ab96:b0:16a:6db6:2715 with SMTP id
 f22-20020a170902ab9600b0016a6db62715mr22067267plr.141.1659450741586; 
 Tue, 02 Aug 2022 07:32:21 -0700 (PDT)
Received: from localhost ([223.104.103.89]) by smtp.gmail.com with ESMTPSA id
 q16-20020a17090311d000b0016be6a554b5sm12172323plh.233.2022.08.02.07.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 07:32:21 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: jakub@cloudflare.com
Subject: Re: [PATCH v2] net/smc: fix refcount bug in sk_psock_get (2)
Date: Tue,  2 Aug 2022 22:32:14 +0800
Message-Id: <20220802143214.5885-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87wnbsjpdb.fsf@cloudflare.com>
References: <87wnbsjpdb.fsf@cloudflare.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, guvenc@linux.ibm.com, ast@kernel.org,
 edumazet@google.com, linux-s390@vger.kernel.org, daniel@iogearbox.net,
 davem@davemloft.net, borisp@nvidia.com, paskripkin@gmail.com,
 john.fastabend@gmail.com, andrii@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, ubraun@linux.ibm.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, wenjia@linux.ibm.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kgraul@linux.ibm.com,
 yhs@fb.com, guwen@linux.alibaba.com, yin31149@gmail.com, bpf@vger.kernel.org,
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

Thanks for your suggestion!

On Mon, 1 Aug 2022 at 17:16, Jakub Sitnicki <jakub@cloudflare.com> wrote:
> This way we would also avoid some confusion. With the change below, the
> SK_USER_DATA_NOTPSOCK is not *always* set when sk_user_data holds a
> non-psock pointer. Only when SMC sets it.
>
> If we go with the current approach, the rest of sites, execpt for psock,
> that assign to sk_user_data should be updated to set
> SK_USER_DATA_NOTPSOCK as well, IMO.
Yes, as you point out, in this patch, this flag's name should be
*SK_USER_DATA_NEEDCHECK_NOTPSOCK*, which is more clearly.

To be more specific, we don't need to set this flag for
every sk_user_data who holds non-psock pointer. Only set the flag for
the site that has been reported involved with the type-mismatch bug
like this bug.
> > During SMC fallback process in connect syscall, kernel will
> > replaces TCP with SMC. In order to forward wakeup
> > smc socket waitqueue after fallback, kernel will sets
> > clcsk->sk_user_data to origin smc socket in
> > smc_fback_replace_callbacks().
> > 
> > Later, in shutdown syscall, kernel will calls
> > sk_psock_get(), which treats the clcsk->sk_user_data
> > as sk_psock type, triggering the refcnt warning.

For other sites, this patch is actually transparent to them, because
the *SK_USER_DATA_NEEDCHECK_NOTPSOCK* flag is always unset. So this
patch won't affect them, which won't introduce any extra
potential bugs.
> +/**
> + * rcu_dereference_sk_user_data_psock - return psock if sk_user_data points
> + * to the psock
> + * @sk: socket
> + */
> +static inline
> +struct sk_psock *rcu_dereference_sk_user_data_psock(const struct sock *sk)
> +{
> +	uintptr_t __tmp = (uintptr_t)rcu_dereference(__sk_user_data((sk)));
> +
> +	if (__tmp & SK_USER_DATA_NOTPSOCK)
> +		return NULL;
> +	return (struct sk_psock *)(__tmp & SK_USER_DATA_PTRMASK);
> +}

>
> Hi,
> Since using psock is not the common case, I'm wondering if it makes more
> sense to have an inverse flag - SK_USER_DATA_PSOCK. Flag would be set by
> the psock code on assignment to sk_user_data.
However, your suggestion seems more elegant. For my patch, as you point
out, when anyone reports a new type-mismatch bug, the relative assign to
sk_user_data should be updated to set *SK_USER_DATA_NEEDCHECK_NOTPSOCK*
flag.

For your suggestion, you seems avoid above situation. What's more, as I
use git grep to search, there seems no direct access to sk_user_data,
all via a small amount macros and wrapper functions. So we can keep
transparent by only update those macros and wrapper functions, which
also won't introduce any extra potential bugs.

I will patch as you suggest in v3 patch.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
