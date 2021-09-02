Return-Path: <SRS0=Ip/S=NY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E587C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Sep 2021 19:17:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B060761056
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Sep 2021 19:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B060761056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DEAC614D4;
	Thu,  2 Sep 2021 19:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seLyxvzy3V-s; Thu,  2 Sep 2021 19:17:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 681D96075D;
	Thu,  2 Sep 2021 19:17:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4520FC0010;
	Thu,  2 Sep 2021 19:17:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB552C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 19:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3CC5425F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 19:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0BRHUsNXE4l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 19:17:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB122425F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 19:17:31 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id q21so1833074plq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Sep 2021 12:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WwZz/1yizfSUY1BCoUTiuDMnkJ0H5apB/ZZA5EC5KSM=;
 b=o/ZqE6YHmasXWqfGlNp/FtLj3nHiNnj7ZxgxkCJyiEUP4BAhVegOT3GE3K5zBLbEPo
 xwO36povG6waHmMNDagfxeNc7UxlO5X/KhhekLnXgGF1pKrNZ0vGbAQuScTNaB0bABLW
 RdMlhIZ7V9GkwIpDJ1bGuA0XmtXkr2TkJHJ1dgI1FJM+UALsC5UEA+3vc5GJDoZ9q/8n
 2AoJQvrtrhs2/9uhnJ6L8Is6kBPKQRoG3RR4skmcgImeYLBBv53n1A87Z1rR3N0sXgsU
 J4n/BJvvX4HB4po1amaTw+TRubXYlDQp4+XHrPY/NwnDkbLgA6Q+RoFQxRcEfoZZcF6K
 kX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WwZz/1yizfSUY1BCoUTiuDMnkJ0H5apB/ZZA5EC5KSM=;
 b=VeyBnJ9belr/GeCaIUSwLHZRaNow6XsQcSkiLcWYYUyMN4BI5O4rU9fFzd28j8KLru
 BQZqsNiwnbur6alOGVcRfg5ZNQOwGmSKjnW+SuBUniup+OnbK9Zeo1ndT/TqFtKOp2X3
 axHZ4SeUa/yX6HnRRKiej8wiJAYZOI0VN19SxfJGN+4UV4jE2hD89O1g2Mqq6MuTygV7
 M6QLjxOoyOASaeFsjk/QOOsjnLbs6IhukBCZKDRJOKWmPUXkPzKJylltCzhyU0+Hs9Sf
 3b3uWkebQQCrdhwNB6uy2KmdEgU8wawyQ8Gjc1GNrdB5WTSSHVUayFi3UaqtAgj1nHa4
 VEhA==
X-Gm-Message-State: AOAM5308LYRThRg3oH79V+ED1nNEjVn8hm0jWKR8HlLvjFTZjCNrjIxV
 nxIst797nWH2CUaaH4yXLQc=
X-Google-Smtp-Source: ABdhPJyZO9QzHEGK390hD9YGFlClOSqChirFCFkE/aR96yCV6ig2OseyeT1bkFju/GC9J1I5BmHejQ==
X-Received: by 2002:a17:902:f693:b0:134:924:1734 with SMTP id
 l19-20020a170902f69300b0013409241734mr4420205plg.8.1630610250935; 
 Thu, 02 Sep 2021 12:17:30 -0700 (PDT)
Received: from [192.168.86.235] (c-73-241-150-58.hsd1.ca.comcast.net.
 [73.241.150.58])
 by smtp.gmail.com with ESMTPSA id c4sm208554pji.51.2021.09.02.12.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 12:17:30 -0700 (PDT)
Subject: Re: [PATCH v6 1/6] Bluetooth: schedule SCO timeouts with delayed_work
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, marcel@holtmann.org,
 johan.hedberg@gmail.com, luiz.dentz@gmail.com, davem@davemloft.net,
 kuba@kernel.org, sudipm.mukherjee@gmail.com
References: <20210810041410.142035-1-desmondcheongzx@gmail.com>
 <20210810041410.142035-2-desmondcheongzx@gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <0b33a7fe-4da0-058c-cff3-16bb5cfe8f45@gmail.com>
Date: Thu, 2 Sep 2021 12:17:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810041410.142035-2-desmondcheongzx@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 8/9/21 9:14 PM, Desmond Cheong Zhi Xi wrote:
> struct sock.sk_timer should be used as a sock cleanup timer. However,
> SCO uses it to implement sock timeouts.
> 
> This causes issues because struct sock.sk_timer's callback is run in
> an IRQ context, and the timer callback function sco_sock_timeout takes
> a spin lock on the socket. However, other functions such as
> sco_conn_del and sco_conn_ready take the spin lock with interrupts
> enabled.
> 
> This inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} lock usage could
> lead to deadlocks as reported by Syzbot [1]:
>        CPU0
>        ----
>   lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
>   <Interrupt>
>     lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
> 
> To fix this, we use delayed work to implement SCO sock timouts
> instead. This allows us to avoid taking the spin lock on the socket in
> an IRQ context, and corrects the misuse of struct sock.sk_timer.
> 
> As a note, cancel_delayed_work is used instead of
> cancel_delayed_work_sync in sco_sock_set_timer and
> sco_sock_clear_timer to avoid a deadlock. In the future, the call to
> bh_lock_sock inside sco_sock_timeout should be changed to lock_sock to
> synchronize with other functions using lock_sock. However, since
> sco_sock_set_timer and sco_sock_clear_timer are sometimes called under
> the locked socket (in sco_connect and __sco_sock_close),
> cancel_delayed_work_sync might cause them to sleep until an
> sco_sock_timeout that has started finishes running. But
> sco_sock_timeout would also sleep until it can grab the lock_sock.
> 
> Using cancel_delayed_work is fine because sco_sock_timeout does not
> change from run to run, hence there is no functional difference
> between:
> 1. waiting for a timeout to finish running before scheduling another
> timeout
> 2. scheduling another timeout while a timeout is running.
> 
> Link: https://syzkaller.appspot.com/bug?id=9089d89de0502e120f234ca0fc8a703f7368b31e [1]
> Reported-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
> Tested-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  net/bluetooth/sco.c | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> index ffa2a77a3e4c..62e638f971a9 100644
> --- a/net/bluetooth/sco.c
> +++ b/net/bluetooth/sco.c
> @@ -48,6 +48,8 @@ struct sco_conn {
>  	spinlock_t	lock;
>  	struct sock	*sk;
>  
> +	struct delayed_work	timeout_work;
> +
>  	unsigned int    mtu;
>  };
>  
> @@ -74,9 +76,20 @@ struct sco_pinfo {
>  #define SCO_CONN_TIMEOUT	(HZ * 40)
>  #define SCO_DISCONN_TIMEOUT	(HZ * 2)
>  
> -static void sco_sock_timeout(struct timer_list *t)
> +static void sco_sock_timeout(struct work_struct *work)
>  {
> -	struct sock *sk = from_timer(sk, t, sk_timer);
> +	struct sco_conn *conn = container_of(work, struct sco_conn,
> +					     timeout_work.work);
> +	struct sock *sk;
> +
> +	sco_conn_lock(conn);
> +	sk = conn->sk;
> +	if (sk)
> +		sock_hold(sk);

syzbot complains here that sk refcount can be zero at this time.

refcount_t: addition on 0; use-after-free.
WARNING: CPU: 0 PID: 10451 at lib/refcount.c:25 refcount_warn_saturate+0x169/0x1e0 lib/refcount.c:25
Modules linked in:
CPU: 0 PID: 10451 Comm: kworker/0:8 Not tainted 5.14.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events sco_sock_timeout
RIP: 0010:refcount_warn_saturate+0x169/0x1e0 lib/refcount.c:25
Code: 09 31 ff 89 de e8 d7 c9 9e fd 84 db 0f 85 36 ff ff ff e8 8a c3 9e fd 48 c7 c7 20 8f e3 89 c6 05 e8 7f 81 09 01 e8 f0 98 16 05 <0f> 0b e9 17 ff ff ff e8 6b c3 9e fd 0f b6 1d cd 7f 81 09 31 ff 89
RSP: 0018:ffffc9001766fce8 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff88802cea3880 RSI: ffffffff815d87a5 RDI: fffff52002ecdf8f
RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff815d25de R11: 0000000000000000 R12: ffff88806d23ce08
R13: ffff8880712c8080 R14: ffff88802edf4500 R15: ffff8880b9c51240
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3748c20000 CR3: 0000000017644000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __refcount_add include/linux/refcount.h:199 [inline]
 __refcount_inc include/linux/refcount.h:250 [inline]
 refcount_inc include/linux/refcount.h:267 [inline]
 sock_hold include/net/sock.h:702 [inline]
 sco_sock_timeout+0x216/0x290 net/bluetooth/sco.c:88
 process_one_work+0x98d/0x1630 kernel/workqueue.c:2276
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2422
 kthread+0x3e5/0x4d0 kernel/kthread.c:319


> +	sco_conn_unlock(conn);
> +
> +	if (!sk)
> +		return;
>  
>  	BT_DBG("sock %p state %d", sk, sk->sk_state);
>  
> @@ -91,14 +104,21 @@ static void sco_sock_timeout(struct timer_list *t)
>  
>  static void sco_sock_set_timer(struct sock *sk, long timeout)
>  {
> +	if (!sco_pi(sk)->conn)
> +		return;
> +
>  	BT_DBG("sock %p state %d timeout %ld", sk, sk->sk_state, timeout);
> -	sk_reset_timer(sk, &sk->sk_timer, jiffies + timeout);
> +	cancel_delayed_work(&sco_pi(sk)->conn->timeout_work);
> +	schedule_delayed_work(&sco_pi(sk)->conn->timeout_work, timeout);

>  }
>  
>  static void sco_sock_clear_timer(struct sock *sk)
>  {
> +	if (!sco_pi(sk)->conn)
> +		return;
> +
>  	BT_DBG("sock %p state %d", sk, sk->sk_state);
> -	sk_stop_timer(sk, &sk->sk_timer);
> +	cancel_delayed_work(&sco_pi(sk)->conn->timeout_work);


>  }
>  
>  /* ---- SCO connections ---- */
> @@ -179,6 +199,9 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
>  		bh_unlock_sock(sk);
>  		sco_sock_kill(sk);
>  		sock_put(sk);
> +
> +		/* Ensure no more work items will run before freeing conn. */

Maybe you should have done this cancel_delayed_work_sync() before the prior sock_put(sk) ?

> +		cancel_delayed_work_sync(&conn->timeout_work);
>  	}
>  
>  	hcon->sco_data = NULL;
> @@ -193,6 +216,8 @@ static void __sco_chan_add(struct sco_conn *conn, struct sock *sk,
>  	sco_pi(sk)->conn = conn;
>  	conn->sk = sk;
>  
> +	INIT_DELAYED_WORK(&conn->timeout_work, sco_sock_timeout);
> +
>  	if (parent)
>  		bt_accept_enqueue(parent, sk, true);
>  }
> @@ -500,8 +525,6 @@ static struct sock *sco_sock_alloc(struct net *net, struct socket *sock,
>  
>  	sco_pi(sk)->setting = BT_VOICE_CVSD_16BIT;
>  
> -	timer_setup(&sk->sk_timer, sco_sock_timeout, 0);
> -
>  	bt_sock_link(&sco_sk_list, sk);
>  	return sk;
>  }
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
