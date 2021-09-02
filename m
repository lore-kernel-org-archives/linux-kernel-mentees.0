Return-Path: <SRS0=Ip/S=NY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64317C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Sep 2021 22:54:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04958610E8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Sep 2021 22:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04958610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C966280B53;
	Thu,  2 Sep 2021 22:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKg69EUGsMUN; Thu,  2 Sep 2021 22:54:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D550480B27;
	Thu,  2 Sep 2021 22:54:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC0DFC001A;
	Thu,  2 Sep 2021 22:54:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C54ECC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 22:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1C32425AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 22:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WwLGts1DvEU2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 22:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E2E9425A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 22:53:56 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id e18so2183346qvo.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Sep 2021 15:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OzpYK8dvsIlm/S8gJHWT+Oy8oCpnYbMnDX+i/m5SSTs=;
 b=bQsf4oPtcPEYtYW7ZnoUgMDLuJQdxMtbDg+2hVBPPA8B+SDgbl7yHNhCOARBU3/VuO
 95jxFnGaKyu37iRHNOiXcsALAVrJbcl923U806rgq63sigTWoMHYV2g4EMFzyiah4yrt
 GwvmGhD0OojznsPNEOiEKvs4lWiwBg2KBIGlfgSCmwU9u7mFWdG2bon2nT2IpHTJC7hx
 kVmYm8grMBNhxowgcIM5OlgIZw9c7c15E+hoEJEu0kRYFz3zBjFo1pCK3aYce0XTyX+T
 W2d1DECpj60DqYOmQve18Q1cJDIWwd0X7+fuCSHzUHy6/YfPu0Amxnbfr2IC/adbg0yV
 cNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OzpYK8dvsIlm/S8gJHWT+Oy8oCpnYbMnDX+i/m5SSTs=;
 b=GvjLxUl1eRPLad4k0v68HubeuwIHK/StLTckxGuw7tOGrfOTFnnZVo9TE2C4NRnECh
 /2fbU3FuX16ziPNj0gLB5oVXwBtTOjMa6E5m6lDzQJSUOUUq+UNOU3Nb47GILpkhetdx
 98Hv98zj3zCO37vsp9ECWYk4ZID9UIK0azfAKuN7P84fd01gkQS8/49Y5hXDJqdC4G3g
 yVInTjYxOjwQyqMt2P4Qxux1sWTbK7rrWuH1y0fSWF1HU47VipQVlK07Ym5yGK8PM3nP
 lMRrO+JajiYXcMwguY7d01vVWp84zVH7B1Z+XDSVe+bELkNdqDRfctgHS/4F9oNajoWv
 xVsg==
X-Gm-Message-State: AOAM5332E8we7nGRYNZAvTQbFU2FqFdZZtIsOP7oDevor7LkAqW2dark
 Hw0vTqJH7K31wPoM5ZZBfDY=
X-Google-Smtp-Source: ABdhPJyg5pvO80hmei1LQvFpHKLM/sURl80NK6h0B8+ffkuxqd34KT8RNR5rdg3dNqfaRjmvRXMCgQ==
X-Received: by 2002:a05:6214:14f2:: with SMTP id
 k18mr618747qvw.19.1630623235206; 
 Thu, 02 Sep 2021 15:53:55 -0700 (PDT)
Received: from [192.168.4.142] (pool-72-82-21-11.prvdri.fios.verizon.net.
 [72.82.21.11])
 by smtp.gmail.com with ESMTPSA id r140sm2577993qke.15.2021.09.02.15.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 15:53:54 -0700 (PDT)
Subject: Re: [PATCH v6 1/6] Bluetooth: schedule SCO timeouts with delayed_work
To: Eric Dumazet <eric.dumazet@gmail.com>, marcel@holtmann.org,
 johan.hedberg@gmail.com, luiz.dentz@gmail.com, davem@davemloft.net,
 kuba@kernel.org, sudipm.mukherjee@gmail.com
References: <20210810041410.142035-1-desmondcheongzx@gmail.com>
 <20210810041410.142035-2-desmondcheongzx@gmail.com>
 <0b33a7fe-4da0-058c-cff3-16bb5cfe8f45@gmail.com>
 <bad67d05-366b-bebe-cbdb-6555386497de@gmail.com>
 <94942257-927c-efbc-b3fd-44cc097ad71f@gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <fa269649-21eb-be76-e552-36a3aa4f3da4@gmail.com>
Date: Thu, 2 Sep 2021 18:53:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <94942257-927c-efbc-b3fd-44cc097ad71f@gmail.com>
Content-Language: en-US
Cc: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On 2/9/21 5:41 pm, Eric Dumazet wrote:
> 
> 
> On 9/2/21 12:32 PM, Desmond Cheong Zhi Xi wrote:
>>
>> Hi Eric,
>>
>> This actually seems to be a pre-existing error in sco_sock_connect that we now hit in sco_sock_timeout.
>>
>> Any thoughts on the following patch to address the problem?
>>
>> Link: https://lore.kernel.org/lkml/20210831065601.101185-1-desmondcheongzx@gmail.com/
> 
> 
> syzbot is still working on finding a repro, this is obviously not trivial,
> because this is a race window.
> 
> I think this can happen even with a single SCO connection.
> 
> This might be triggered more easily forcing a delay in sco_sock_timeout()
> 
> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> index 98a88158651281c9f75c4e0371044251e976e7ef..71ebe0243fab106c676c308724fe3a3f92a62cbd 100644
> --- a/net/bluetooth/sco.c
> +++ b/net/bluetooth/sco.c
> @@ -84,8 +84,14 @@ static void sco_sock_timeout(struct work_struct *work)
>   
>          sco_conn_lock(conn);
>          sk = conn->sk;
> -       if (sk)
> +       if (sk) {
> +               // lets pretend cpu has been busy (in interrupts) for 100ms
> +               int i;
> +               for (i=0;i<100000;i++)
> +                       udelay(1);
> +
>                  sock_hold(sk);
> +       }>          sco_conn_unlock(conn);
>   
>          if (!sk)
> 
> 
> Stack trace tells us that sco_sock_timeout() is running after last reference
> on socket has been released.
> 
> __refcount_add include/linux/refcount.h:199 [inline]
>   __refcount_inc include/linux/refcount.h:250 [inline]
>   refcount_inc include/linux/refcount.h:267 [inline]
>   sock_hold include/net/sock.h:702 [inline]
>   sco_sock_timeout+0x216/0x290 net/bluetooth/sco.c:88
>   process_one_work+0x98d/0x1630 kernel/workqueue.c:2276
>   worker_thread+0x658/0x11f0 kernel/workqueue.c:2422
>   kthread+0x3e5/0x4d0 kernel/kthread.c:319
>   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> 
> This is why I suggested to delay sock_put() to make sure this can not happen.
> 
> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> index 98a88158651281c9f75c4e0371044251e976e7ef..bd0222e3f05a6bcb40cffe8405c9dfff98d7afde 100644
> --- a/net/bluetooth/sco.c
> +++ b/net/bluetooth/sco.c
> @@ -195,10 +195,11 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
>                  sco_sock_clear_timer(sk);
>                  sco_chan_del(sk, err);
>                  release_sock(sk);
> -               sock_put(sk);
>   
>                  /* Ensure no more work items will run before freeing conn. */
>                  cancel_delayed_work_sync(&conn->timeout_work);
> +
> +               sock_put(sk);
>          }
>   
>          hcon->sco_data = NULL;
> 

I see where you're going with this, but once sco_chan_del returns, any
instance of sco_sock_timeout that hasn't yet called sock_hold will
simply return, because conn->sk is NULL. Adding a delay to the
sco_conn_lock critical section in sco_sock_timeout would not affect this
because sco_chan_del clears conn->sk while holding onto the lock.

The main reason that cancel_delayed_work_sync is run there is to make
sure that we don't have a UAF on the SCO connection itself after we free
conn.

For a single SCO connection with well-formed channel, I think there
can't be a race. Here's the reasoning:

- For the timeout to be scheduled, a socket must have a channel with a
connection.

- When a channel between a socket and connection is established, the
socket transitions from BT_OPEN to BT_CONNECTED, BT_CONNECT, or
BT_CONNECT2.

- For a socket to be released, it has to be zapped. For sockets that
have a state of BT_CONNECTED, BT_CONNECT, or BT_CONNECT2, they are
zapped only when the channel is deleted.

- If the channel is deleted (which is protected by sco_conn_lock), then
conn->sk is NULL, and sco_sock_timeout simply exits. If we had entered
the critical section in sco_sock_timeout before the channel was deleted,
then we increased the reference count on the socket, so it won't be
freed until sco_sock_timeout is done.

Hence, sco_sock_timeout doesn't race with the release of a socket that
has a well-formed channel with a connection.

But if multiple connections are allocated and overwritten in
sco_sock_connect, then none of the above assumptions hold because the
SCO connection can't be cleaned up (i.e. conn->sk cannot be set to NULL)
when the associated socket is released. This scenario happens in the
syzbot reproducer for the crash here:
https://syzkaller.appspot.com/bug?id=bcc246d137428d00ed14b476c2068579515fe2bc

That aside, upon taking a closer look, I think there is indeed a race
lurking in sco_conn_del, but it's not the one that syzbot is hitting.
Our sock_hold simply comes too late, and by the time it's called we
might have already have freed the socket.

So probably something like this needs to happen:

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index fa25b07120c9..ea18e5b56343 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -187,10 +187,11 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
  	/* Kill socket */
  	sco_conn_lock(conn);
  	sk = conn->sk;
+	if (sk)
+		sock_hold(sk);
  	sco_conn_unlock(conn);
  
  	if (sk) {
-		sock_hold(sk);
  		lock_sock(sk);
  		sco_sock_clear_timer(sk);
  		sco_chan_del(sk, err);
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
