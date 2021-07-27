Return-Path: <SRS0=JmfH=MT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2F5C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 05:13:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D1C610A5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 05:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11D1C610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8EDB4014D;
	Tue, 27 Jul 2021 05:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M16EbXKi_pD1; Tue, 27 Jul 2021 05:13:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BCC0D400CA;
	Tue, 27 Jul 2021 05:13:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A28BDC0010;
	Tue, 27 Jul 2021 05:13:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4C23C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 05:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CCF683224
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 05:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJsf4Oea0ErU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 05:13:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A267882F51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 05:13:33 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id n10so14565891plf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ph2241rVhgFO1amFPzoGwsMLBS0Tz5IeCzxNLId1vXc=;
 b=gdwR086Hu7r35kWnQF0+ekLFEqIS1UkEZ2Rr+pk3kYNcMGN5XtBklkD1WVPXrfimUV
 y7OaLmDQe12utiZbLbdGGfbABbEPsV2M7J6BdH1yGIWvJHpJe+tEdQPzGVCT4rpxfJwO
 qQahkB0HQ6Gl/OIQPklTsFgkITtnssQZ4VcFmkWUG943Pa8jdmRxIQqL2nBRapLSglFj
 z6bbjwXs+2vIN8EuQ9t5h5oLF1ziRdNPDjuFa8AQyOQbNNvIN9rKpXSsd5z6+T1+jlXX
 FIfR4yMgCjT2XeWKPSOmTVymXGJUWHtEMQsaZyAD4qmFGkHvpeHK2ZpENUcwY8ZNyaMt
 743Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ph2241rVhgFO1amFPzoGwsMLBS0Tz5IeCzxNLId1vXc=;
 b=q5EKU6Ke6azrlNvo7dve+kYxFghyStGD+2CjxoGRk0Cg6g3FOkqlsRy6SqZy0/6SFO
 ldPyyPdMt4G04Om7cG4zZWi0sKHNzddL8DMxx5UaA2v8Da+e78V1+42+xWyKd748m/KI
 cl/z/AoaAxxRXGIHjMDOxg4qlhUSrmi2o3D/MMDzXNeEqGyZfHKTUsArSVzXbWzAaAoD
 1k0VllSoRQ99g7K0KBgYb+2lK9ydq5Z6etYb0P++I1k8HKlXUXypCVHqF/74nSXDC9bb
 xymwoV2N0rvCH5+0GdZnzf/yIjp7Vh97mooBLs2khKYL8B3f5Hd1XhRC6cjmJqWDjjKJ
 uTdA==
X-Gm-Message-State: AOAM533TqGQKLwBHgck1mXY5gLrFqO4bVLjG1CW5zxugFSVrn2B/Waw1
 DaoqrqpUG6pnwN2pMFKnL6I=
X-Google-Smtp-Source: ABdhPJxZEy2MtnZLGq/NKaVaId5yRY4DxMvwQhA3+PXJieyEq/OF3/hpSiN9OPRS9XlPmqd1CYGoUQ==
X-Received: by 2002:aa7:8642:0:b029:348:7bf1:efec with SMTP id
 a2-20020aa786420000b02903487bf1efecmr21187171pfo.49.1627362813117; 
 Mon, 26 Jul 2021 22:13:33 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 198sm1853800pfw.21.2021.07.26.22.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 22:13:32 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] Bluetooth: fix inconsistent lock state in SCO
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20210721093832.78081-1-desmondcheongzx@gmail.com>
 <20210721093832.78081-2-desmondcheongzx@gmail.com>
 <CABBYNZLus8GyPuTp4jmAeSEdsYTZ-4gK6OvGXqcABhci8tBOwA@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <764e18f7-ccf4-2010-87fc-feb1d3089098@gmail.com>
Date: Tue, 27 Jul 2021 13:13:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CABBYNZLus8GyPuTp4jmAeSEdsYTZ-4gK6OvGXqcABhci8tBOwA@mail.gmail.com>
Content-Language: en-US
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com,
 matthieu.baerts@tessares.net, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, stefan@datenfreihafen.org
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

On 27/7/21 8:30 am, Luiz Augusto von Dentz wrote:
> Hi Desmond,
> 
> On Wed, Jul 21, 2021 at 2:39 AM Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
>>
>> Syzbot reported an inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} lock
>> usage in sco_conn_del and sco_sock_timeout that could lead to
>> deadlocks.
>>
>> This inconsistent lock state can also happen in sco_conn_ready,
>> rfcomm_connect_ind, and bt_accept_enqueue.
>>
>> The issue is that these functions take a spin lock on the socket with
>> interrupts enabled, but sco_sock_timeout takes the lock in an IRQ
>> context. This could lead to deadlocks:
>>
>>         CPU0
>>         ----
>>    lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
>>    <Interrupt>
>>      lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
> 
> Having a second look at this, it does seem this is due to use of
> sk->sk_timer which apparently run its callback on IRQ context, so I
> wonder if wouldn't be a better idea to switch to a delayed_work to
> avoid having to deal with the likes of local_bh_disable, in fact it
> seems we have been misusing it since the documentation says it is for
> sock cleanup not for handling things like SNDTIMEO, we don't really
> use it for other socket types so I wonder when we start using
> delayed_work we forgot about sco.c.
> 

Hi Luiz,

That makes sense to me. I don't think there's a need for the timeout to 
be run in an IRQ context.

I'll prepare a patch for this, thanks for the suggestion.

>>   *** DEADLOCK ***
>>
>> We fix this by ensuring that local bh is disabled before calling
>> bh_lock_sock.
>>
>> After doing this, we additionally need to protect sco_conn_lock by
>> disabling local bh.
>>
>> This is necessary because sco_conn_del makes a call to sco_chan_del
>> while holding on to the sock lock, and sco_chan_del itself makes a
>> call to sco_conn_lock. If sco_conn_lock is held elsewhere with
>> interrupts enabled, there could still be a
>> slock-AF_BLUETOOTH-BTPROTO_SCO --> &conn->lock#2 lock inversion as
>> follows:
>>
>>          CPU0                    CPU1
>>          ----                    ----
>>     lock(&conn->lock#2);
>>                                  local_irq_disable();
>>                                  lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
>>                                  lock(&conn->lock#2);
>>     <Interrupt>
>>       lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
>>
>>    *** DEADLOCK ***
>>
>> Although sco_conn_del disables local bh before calling sco_chan_del,
>> we can still wrap the calls to sco_conn_lock in sco_chan_del, with
>> local_bh_disable/enable as this pair of functions are reentrant.
>>
>> Reported-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
>> Tested-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   net/bluetooth/sco.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
>> index 3bd41563f118..34f3419c3330 100644
>> --- a/net/bluetooth/sco.c
>> +++ b/net/bluetooth/sco.c
>> @@ -140,10 +140,12 @@ static void sco_chan_del(struct sock *sk, int err)
>>          BT_DBG("sk %p, conn %p, err %d", sk, conn, err);
>>
>>          if (conn) {
>> +               local_bh_disable();
>>                  sco_conn_lock(conn);
>>                  conn->sk = NULL;
>>                  sco_pi(sk)->conn = NULL;
>>                  sco_conn_unlock(conn);
>> +               local_bh_enable();
>>
>>                  if (conn->hcon)
>>                          hci_conn_drop(conn->hcon);
>> @@ -167,16 +169,22 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
>>          BT_DBG("hcon %p conn %p, err %d", hcon, conn, err);
>>
>>          /* Kill socket */
>> +       local_bh_disable();
>>          sco_conn_lock(conn);
>>          sk = conn->sk;
>>          sco_conn_unlock(conn);
>> +       local_bh_enable();
>>
>>          if (sk) {
>>                  sock_hold(sk);
>> +
>> +               local_bh_disable();
>>                  bh_lock_sock(sk);
>>                  sco_sock_clear_timer(sk);
>>                  sco_chan_del(sk, err);
>>                  bh_unlock_sock(sk);
>> +               local_bh_enable();
>> +
>>                  sco_sock_kill(sk);
>>                  sock_put(sk);
>>          }
>> @@ -202,6 +210,7 @@ static int sco_chan_add(struct sco_conn *conn, struct sock *sk,
>>   {
>>          int err = 0;
>>
>> +       local_bh_disable();
>>          sco_conn_lock(conn);
>>          if (conn->sk)
>>                  err = -EBUSY;
>> @@ -209,6 +218,7 @@ static int sco_chan_add(struct sco_conn *conn, struct sock *sk,
>>                  __sco_chan_add(conn, sk, parent);
>>
>>          sco_conn_unlock(conn);
>> +       local_bh_enable();
>>          return err;
>>   }
>>
>> @@ -303,9 +313,11 @@ static void sco_recv_frame(struct sco_conn *conn, struct sk_buff *skb)
>>   {
>>          struct sock *sk;
>>
>> +       local_bh_disable();
>>          sco_conn_lock(conn);
>>          sk = conn->sk;
>>          sco_conn_unlock(conn);
>> +       local_bh_enable();
>>
>>          if (!sk)
>>                  goto drop;
>> @@ -420,10 +432,12 @@ static void __sco_sock_close(struct sock *sk)
>>                  if (sco_pi(sk)->conn->hcon) {
>>                          sk->sk_state = BT_DISCONN;
>>                          sco_sock_set_timer(sk, SCO_DISCONN_TIMEOUT);
>> +                       local_bh_disable();
>>                          sco_conn_lock(sco_pi(sk)->conn);
>>                          hci_conn_drop(sco_pi(sk)->conn->hcon);
>>                          sco_pi(sk)->conn->hcon = NULL;
>>                          sco_conn_unlock(sco_pi(sk)->conn);
>> +                       local_bh_enable();
>>                  } else
>>                          sco_chan_del(sk, ECONNRESET);
>>                  break;
>> @@ -1084,21 +1098,26 @@ static void sco_conn_ready(struct sco_conn *conn)
>>
>>          if (sk) {
>>                  sco_sock_clear_timer(sk);
>> +               local_bh_disable();
>>                  bh_lock_sock(sk);
>>                  sk->sk_state = BT_CONNECTED;
>>                  sk->sk_state_change(sk);
>>                  bh_unlock_sock(sk);
>> +               local_bh_enable();
>>          } else {
>> +               local_bh_disable();
>>                  sco_conn_lock(conn);
>>
>>                  if (!conn->hcon) {
>>                          sco_conn_unlock(conn);
>> +                       local_bh_enable();
>>                          return;
>>                  }
>>
>>                  parent = sco_get_sock_listen(&conn->hcon->src);
>>                  if (!parent) {
>>                          sco_conn_unlock(conn);
>> +                       local_bh_enable();
>>                          return;
>>                  }
>>
>> @@ -1109,6 +1128,7 @@ static void sco_conn_ready(struct sco_conn *conn)
>>                  if (!sk) {
>>                          bh_unlock_sock(parent);
>>                          sco_conn_unlock(conn);
>> +                       local_bh_enable();
>>                          return;
>>                  }
>>
>> @@ -1131,6 +1151,7 @@ static void sco_conn_ready(struct sco_conn *conn)
>>                  bh_unlock_sock(parent);
>>
>>                  sco_conn_unlock(conn);
>> +               local_bh_enable();
>>          }
>>   }
>>
>> --
>> 2.25.1
>>
> 
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
