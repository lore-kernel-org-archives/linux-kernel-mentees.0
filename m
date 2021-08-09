Return-Path: <SRS0=BNRj=NA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC307C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 04:04:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD7E60FC2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 04:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AD7E60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 432448271D;
	Mon,  9 Aug 2021 04:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yogp7smJjatE; Mon,  9 Aug 2021 04:04:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 885DB8267F;
	Mon,  9 Aug 2021 04:04:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FA99C0010;
	Mon,  9 Aug 2021 04:04:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E7CAC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 04:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39C17402CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 04:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ag_2MywB-9NV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 04:04:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A10A400C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 04:04:35 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so28139648pjh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Aug 2021 21:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eNi4we5Lj3P0boB7zoQskLvhgnVQduuUdy+Ns6p58HE=;
 b=YDt9z6rLaccx1u0yUAfrM7DK/uxTQ6Nlp13+xA0vzNa1rTc7G1oj4vSqsx1ldYcHgB
 pabCS1FQy5SJkUUKH9mcG6cGpKFo7no5KxcT27/7sfjvL1mNhDsKssSWySolFmtgqah5
 PhCwOvLrUau44MOEhdILNGo8i2Jgr23ctRqplqYl3khcnea/T73tBYE6bMKtNgKJL2Rj
 z+ttB/IG8YD2GSVNEYh8stXB45APkW1F58VOT3DaSMg8l9tkjUrzvrM6ZHjD7cSxQAnh
 6cuzURAT/TvQxHn4+P9/h37xiV46u4V+xyo5DFwkX27xYiA/08/PZCPFfsMcu9uEFx+p
 z1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eNi4we5Lj3P0boB7zoQskLvhgnVQduuUdy+Ns6p58HE=;
 b=ZJ+tBOeLxdgvFXYeS0GI1n5UyIT9j0UXZYk3bneVH3aEn2i0LBQi1yIhbl3C8zbAi0
 EgyUtDzQaILSKyjCbFDqr8OiacUkqEKCD7kmq3eJy/2UEyQW7xF9Ww73+0zf4iMqLgW0
 9Hz6+pULaiqvk/6GcGJPIW/+cFt8zTH/x/T39epPY9NjPxbkMQBPQjlU4ARyZe7xdN69
 Y2QQJ+hzCt+GQgaTckKVnT0gO1dKFL+EMG94T6j+diZJxpDcUa8j9R/mzMP+75DRzWKC
 JDDZkCMU55MGi5B2v37lk2Lpawxpv6uIBg8K3QKdXAbmuws/cqAfkyOCFH5hQFXbWmDS
 ULfg==
X-Gm-Message-State: AOAM532eFz3jX+kJaOl6UR/LJmI+DOCoXfae2Sdd2letB+cFPN+tSQ3n
 x24IPvh3ozePsOGhEcGS1eg=
X-Google-Smtp-Source: ABdhPJzKsNieWaXKHjzR8XFdQkm3Z+XdF11LKiu478zAdzcIqvEfqrbUOjN22K2e8i3fhC5rJi0Hnw==
X-Received: by 2002:a17:90a:70c5:: with SMTP id
 a5mr17338389pjm.23.1628481874879; 
 Sun, 08 Aug 2021 21:04:34 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id p17sm20181911pjg.54.2021.08.08.21.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Aug 2021 21:04:34 -0700 (PDT)
Subject: Re: [RESEND PATCH v5 1/6] Bluetooth: schedule SCO timeouts with
 delayed_work
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20210804154712.929986-1-desmondcheongzx@gmail.com>
 <20210804154712.929986-2-desmondcheongzx@gmail.com>
 <CABBYNZ+5-wEyLJDUU0fC3fogAkJiXD+8np_8c_M0yfYZVUYbww@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <0fc64ddd-45f0-667f-b8cb-bd958280586f@gmail.com>
Date: Mon, 9 Aug 2021 12:04:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CABBYNZ+5-wEyLJDUU0fC3fogAkJiXD+8np_8c_M0yfYZVUYbww@mail.gmail.com>
Content-Language: en-US
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Miller <davem@davemloft.net>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, sudipm.mukherjee@gmail.com
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

On 6/8/21 3:06 am, Luiz Augusto von Dentz wrote:
> Hi Desmond,
> 
> On Wed, Aug 4, 2021 at 8:48 AM Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
>>
>> struct sock.sk_timer should be used as a sock cleanup timer. However,
>> SCO uses it to implement sock timeouts.
>>
>> This causes issues because struct sock.sk_timer's callback is run in
>> an IRQ context, and the timer callback function sco_sock_timeout takes
>> a spin lock on the socket. However, other functions such as
>> sco_conn_del and sco_conn_ready take the spin lock with interrupts
>> enabled.
>>
>> This inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} lock usage could
>> lead to deadlocks as reported by Syzbot [1]:
>>         CPU0
>>         ----
>>    lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
>>    <Interrupt>
>>      lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
>>
>> To fix this, we use delayed work to implement SCO sock timouts
>> instead. This allows us to avoid taking the spin lock on the socket in
>> an IRQ context, and corrects the misuse of struct sock.sk_timer.
>>
>> As a note, cancel_delayed_work is used instead of
>> cancel_delayed_work_sync in sco_sock_set_timer and
>> sco_sock_clear_timer to avoid a deadlock. In the future, the call to
>> bh_lock_sock inside sco_sock_timeout should be changed to lock_sock to
>> synchronize with other functions using lock_sock. However, since
>> sco_sock_set_timer and sco_sock_clear_timer are sometimes called under
>> the locked socket (in sco_connect and __sco_sock_close),
>> cancel_delayed_work_sync might cause them to sleep until an
>> sco_sock_timeout that has started finishes running. But
>> sco_sock_timeout would also sleep until it can grab the lock_sock.
>>
>> Using cancel_delayed_work is fine because sco_sock_timeout does not
>> change from run to run, hence there is no functional difference
>> between:
>> 1. waiting for a timeout to finish running before scheduling another
>> timeout
>> 2. scheduling another timeout while a timeout is running.
>>
>> Link: https://syzkaller.appspot.com/bug?id=9089d89de0502e120f234ca0fc8a703f7368b31e [1]
>> Reported-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
>> Tested-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   net/bluetooth/sco.c | 41 +++++++++++++++++++++++++++++++++++------
>>   1 file changed, 35 insertions(+), 6 deletions(-)
>>
>> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
>> index ffa2a77a3e4c..89cb987ca9eb 100644
>> --- a/net/bluetooth/sco.c
>> +++ b/net/bluetooth/sco.c
>> @@ -48,6 +48,8 @@ struct sco_conn {
>>          spinlock_t      lock;
>>          struct sock     *sk;
>>
>> +       struct delayed_work     timeout_work;
>> +
>>          unsigned int    mtu;
>>   };
>>
>> @@ -74,9 +76,20 @@ struct sco_pinfo {
>>   #define SCO_CONN_TIMEOUT       (HZ * 40)
>>   #define SCO_DISCONN_TIMEOUT    (HZ * 2)
>>
>> -static void sco_sock_timeout(struct timer_list *t)
>> +static void sco_sock_timeout(struct work_struct *work)
>>   {
>> -       struct sock *sk = from_timer(sk, t, sk_timer);
>> +       struct sco_conn *conn = container_of(work, struct sco_conn,
>> +                                            timeout_work.work);
>> +       struct sock *sk;
>> +
>> +       sco_conn_lock(conn);
>> +       sk = conn->sk;
>> +       if (sk)
>> +               sock_hold(sk);
>> +       sco_conn_unlock(conn);
>> +
>> +       if (!sk)
>> +               return;
>>
>>          BT_DBG("sock %p state %d", sk, sk->sk_state);
>>
>> @@ -91,14 +104,27 @@ static void sco_sock_timeout(struct timer_list *t)
>>
>>   static void sco_sock_set_timer(struct sock *sk, long timeout)
>>   {
>> +       struct delayed_work *work;
> 
> Minor nitpick but I don't think using a dedicated variable here makes
> much sense.
> 

Thanks for the feedback, Luiz. Agreed, I can make the change in the next 
version of the series after the other patches are reviewed.

Best wishes,
Desmond

>> +       if (!sco_pi(sk)->conn)
>> +               return;
>> +       work = &sco_pi(sk)->conn->timeout_work;
>> +
>>          BT_DBG("sock %p state %d timeout %ld", sk, sk->sk_state, timeout);
>> -       sk_reset_timer(sk, &sk->sk_timer, jiffies + timeout);
>> +       cancel_delayed_work(work);
>> +       schedule_delayed_work(work, timeout);
>>   }
>>
>>   static void sco_sock_clear_timer(struct sock *sk)
>>   {
>> +       struct delayed_work *work;
> 
> Ditto.
> 
>> +       if (!sco_pi(sk)->conn)
>> +               return;
>> +       work = &sco_pi(sk)->conn->timeout_work;
>> +
>>          BT_DBG("sock %p state %d", sk, sk->sk_state);
>> -       sk_stop_timer(sk, &sk->sk_timer);
>> +       cancel_delayed_work(work);
>>   }
>>
>>   /* ---- SCO connections ---- */
>> @@ -179,6 +205,9 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
>>                  bh_unlock_sock(sk);
>>                  sco_sock_kill(sk);
>>                  sock_put(sk);
>> +
>> +               /* Ensure no more work items will run before freeing conn. */
>> +               cancel_delayed_work_sync(&conn->timeout_work);
>>          }
>>
>>          hcon->sco_data = NULL;
>> @@ -193,6 +222,8 @@ static void __sco_chan_add(struct sco_conn *conn, struct sock *sk,
>>          sco_pi(sk)->conn = conn;
>>          conn->sk = sk;
>>
>> +       INIT_DELAYED_WORK(&conn->timeout_work, sco_sock_timeout);
>> +
>>          if (parent)
>>                  bt_accept_enqueue(parent, sk, true);
>>   }
>> @@ -500,8 +531,6 @@ static struct sock *sco_sock_alloc(struct net *net, struct socket *sock,
>>
>>          sco_pi(sk)->setting = BT_VOICE_CVSD_16BIT;
>>
>> -       timer_setup(&sk->sk_timer, sco_sock_timeout, 0);
>> -
>>          bt_sock_link(&sco_sk_list, sk);
>>          return sk;
>>   }
>> --
>> 2.25.1
>>
> 
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
