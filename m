Return-Path: <SRS0=b7VJ=MU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086BEC4320E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 22:50:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD226101B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 22:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AD226101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5480660664;
	Wed, 28 Jul 2021 22:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lHBxT568XMxW; Wed, 28 Jul 2021 22:50:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2730960637;
	Wed, 28 Jul 2021 22:50:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C820C0010;
	Wed, 28 Jul 2021 22:50:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB558C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 22:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE6682E9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 22:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DCj6wi1XtMMy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 22:50:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CFC682C2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 22:50:20 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id k65so6607207yba.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 15:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xDglts5u6VpbhAGOZw3Y55QgpbppwZZ4z2QzwRWYIMw=;
 b=eIhxy57lYiIrdgmnFC7BRTAEesLAb4gLsJQeoG/65b1YzdtHwDXRSbxJTnVcG0EASf
 kbp4e47lKcmtOq2+Di7E6T5iH4+/IVc1scAG2IWA0Us2wPph7L/4g8KQVUuh6fA5vbiV
 xKVhazCDLSddziWs1wTtasX2qOrAlLApeOzb3p/57+9XfkrtRpNSpP2DtALyARHkIDVn
 851552cmTNttBrfFx3JpMe988uT/CUVskrbD4bY8e/ibJzV27GRzLwNCsEcsy+TArL1W
 Rm+ZFboyIkiRvmb63IFr7OZE/feFe9wnq8W9GjxsU+u+NYWXRbNuFGyNkheXgWFZeaij
 dqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xDglts5u6VpbhAGOZw3Y55QgpbppwZZ4z2QzwRWYIMw=;
 b=stqO6xXQ5vZ4JS/I36gIYwMhyb9jVuRIPLV9SoPL2g+HHbIMnot9CcA7iDLZ/nAbWJ
 EOR/7pAHbQ1Iyu+gUJaXs7M6BvzwIXUNTntHZAKRca9QojmAuQX4XU6ZakCnynXE8bed
 JW4Vt1WWZpC0qde2oeO7MLYI0pagyb1R5t4EBIHItwEu0CmGpY61fQt64sjSVPSsfbV0
 0gabC+4yDMEyJE+LcSvMT0VH+xir5bh5GHUzHg9lVKjXN+Iz2abHNwawAqF/PaobXhPH
 dGgs0IaCTupCPpSJC9/3G1qZFo4jdkoz4/j8sHbhJDY8TaR3EzuuofhpU9uR2TNvjgXy
 pyqw==
X-Gm-Message-State: AOAM530no9oAKA7hCCnKuPzOP3Xz/rlwen7EjaJoX+1E1BsQ0wAJmfpw
 c3YNujsHFOsxuHTR9bO3YWXl0HiPO3SR6jgf73I=
X-Google-Smtp-Source: ABdhPJygSR7K8iQnG/zIAjQnp2X206xR9Ica52iAlCPgC8m7bMf1qoOiLsIIJjJeMk87sEjwdFqBRsYU2LrPAnFE92U=
X-Received: by 2002:a25:8205:: with SMTP id q5mr2678137ybk.440.1627512619052; 
 Wed, 28 Jul 2021 15:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210728071721.411669-1-desmondcheongzx@gmail.com>
In-Reply-To: <20210728071721.411669-1-desmondcheongzx@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 28 Jul 2021 15:50:08 -0700
Message-ID: <CABBYNZJcSS+fnTtF4S4UqASaG2DSN4DxwC-8AZAOaEkfu68uew@mail.gmail.com>
Subject: Re: [PATCH v4] Bluetooth: schedule SCO timeouts with delayed_work
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>
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

Hi Desmond,

On Wed, Jul 28, 2021 at 12:17 AM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
>
> struct sock.sk_timer should be used as a sock cleanup timer. However,
> SCO uses it to implement sock timeouts.
>
> This causes issues because struct sock.sk_timer's callback is run in
> an IRQ context, and the timer callback function sco_sock_timeout takes
> a spin lock on the socket. However, other functions such as
> sco_conn_del, sco_conn_ready, rfcomm_connect_ind, and
> bt_accept_enqueue also take the spin lock with interrupts enabled.
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
> Link: https://syzkaller.appspot.com/bug?id=9089d89de0502e120f234ca0fc8a703f7368b31e [1]
> Reported-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---

Is there a way to trigger syzbot to know if this change really fixes it?

> Hi,
>
> As suggested, this patch addresses the inconsistent lock state while
> avoiding having to deal with local_bh_disable.
>
> Now that sco_sock_timeout is no longer run in IRQ context, it might
> be the case that bh_lock_sock is no longer needed to sync between
> SOFTIRQ and user contexts, so we can switch to lock_sock.
>
> I'm not too certain about this, or if there's any benefit to using
> lock_sock instead, so I've left that out of this patch.
>
> v3 -> v4:
> - Switch to using delayed_work to schedule SCO sock timeouts instead
> of using local_bh_disable. As suggested by Luiz Augusto von Dentz.
>
> v2 -> v3:
> - Split SCO and RFCOMM code changes, as suggested by Luiz Augusto von
> Dentz.
> - Simplify local bh disabling in SCO by using local_bh_disable/enable
> inside sco_chan_del since local_bh_disable/enable pairs are reentrant.
>
> v1 -> v2:
> - Instead of pulling out the clean-up code out from sco_chan_del and
> using it directly in sco_conn_del, disable local softirqs for relevant
> sections.
> - Disable local softirqs more thoroughly for instances of
> bh_lock_sock/bh_lock_sock_nested in the bluetooth subsystem.
> Specifically, the calls in af_bluetooth.c and rfcomm/sock.c are now made
> with local softirqs disabled as well.
>
> Best wishes,
> Desmond
>
>  net/bluetooth/sco.c | 39 ++++++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 15 deletions(-)
>
> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> index 3bd41563f118..b6dd16153d38 100644
> --- a/net/bluetooth/sco.c
> +++ b/net/bluetooth/sco.c
> @@ -48,6 +48,8 @@ struct sco_conn {
>         spinlock_t      lock;
>         struct sock     *sk;
>
> +       struct delayed_work     sk_timer;
> +
>         unsigned int    mtu;
>  };
>
> @@ -74,9 +76,11 @@ struct sco_pinfo {
>  #define SCO_CONN_TIMEOUT       (HZ * 40)
>  #define SCO_DISCONN_TIMEOUT    (HZ * 2)
>
> -static void sco_sock_timeout(struct timer_list *t)
> +static void sco_sock_timeout(struct work_struct *work)
>  {
> -       struct sock *sk = from_timer(sk, t, sk_timer);
> +       struct sco_conn *conn = container_of(work, struct sco_conn,
> +                                            sk_timer.work);
> +       struct sock *sk = conn->sk;
>
>         BT_DBG("sock %p state %d", sk, sk->sk_state);
>
> @@ -89,16 +93,18 @@ static void sco_sock_timeout(struct timer_list *t)
>         sock_put(sk);
>  }
>
> -static void sco_sock_set_timer(struct sock *sk, long timeout)
> +static void sco_sock_set_timer(struct sock *sk, struct delayed_work *work,
> +                              long timeout)
>  {
>         BT_DBG("sock %p state %d timeout %ld", sk, sk->sk_state, timeout);
> -       sk_reset_timer(sk, &sk->sk_timer, jiffies + timeout);
> +       cancel_delayed_work(work);
> +       schedule_delayed_work(work, timeout);
>  }
>
> -static void sco_sock_clear_timer(struct sock *sk)
> +static void sco_sock_clear_timer(struct sock *sk, struct delayed_work *work)
>  {
>         BT_DBG("sock %p state %d", sk, sk->sk_state);
> -       sk_stop_timer(sk, &sk->sk_timer);
> +       cancel_delayed_work(work);
>  }
>
>  /* ---- SCO connections ---- */
> @@ -174,7 +180,7 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
>         if (sk) {
>                 sock_hold(sk);
>                 bh_lock_sock(sk);
> -               sco_sock_clear_timer(sk);
> +               sco_sock_clear_timer(sk, &conn->sk_timer);
>                 sco_chan_del(sk, err);
>                 bh_unlock_sock(sk);
>                 sco_sock_kill(sk);
> @@ -193,6 +199,8 @@ static void __sco_chan_add(struct sco_conn *conn, struct sock *sk,
>         sco_pi(sk)->conn = conn;
>         conn->sk = sk;
>
> +       INIT_DELAYED_WORK(&conn->sk_timer, sco_sock_timeout);
> +
>         if (parent)
>                 bt_accept_enqueue(parent, sk, true);
>  }
> @@ -260,11 +268,11 @@ static int sco_connect(struct sock *sk)
>                 goto done;
>
>         if (hcon->state == BT_CONNECTED) {
> -               sco_sock_clear_timer(sk);
> +               sco_sock_clear_timer(sk, &conn->sk_timer);
>                 sk->sk_state = BT_CONNECTED;
>         } else {
>                 sk->sk_state = BT_CONNECT;
> -               sco_sock_set_timer(sk, sk->sk_sndtimeo);
> +               sco_sock_set_timer(sk, &conn->sk_timer, sk->sk_sndtimeo);
>         }
>
>  done:
> @@ -419,7 +427,8 @@ static void __sco_sock_close(struct sock *sk)
>         case BT_CONFIG:
>                 if (sco_pi(sk)->conn->hcon) {
>                         sk->sk_state = BT_DISCONN;
> -                       sco_sock_set_timer(sk, SCO_DISCONN_TIMEOUT);
> +                       sco_sock_set_timer(sk, &sco_pi(sk)->conn->sk_timer,
> +                                          SCO_DISCONN_TIMEOUT);
>                         sco_conn_lock(sco_pi(sk)->conn);
>                         hci_conn_drop(sco_pi(sk)->conn->hcon);
>                         sco_pi(sk)->conn->hcon = NULL;
> @@ -443,7 +452,8 @@ static void __sco_sock_close(struct sock *sk)
>  /* Must be called on unlocked socket. */
>  static void sco_sock_close(struct sock *sk)
>  {
> -       sco_sock_clear_timer(sk);
> +       if (sco_pi(sk)->conn)
> +               sco_sock_clear_timer(sk, &sco_pi(sk)->conn->sk_timer);
>         lock_sock(sk);
>         __sco_sock_close(sk);
>         release_sock(sk);
> @@ -500,8 +510,6 @@ static struct sock *sco_sock_alloc(struct net *net, struct socket *sock,
>
>         sco_pi(sk)->setting = BT_VOICE_CVSD_16BIT;
>
> -       timer_setup(&sk->sk_timer, sco_sock_timeout, 0);
> -
>         bt_sock_link(&sco_sk_list, sk);
>         return sk;
>  }
> @@ -1036,7 +1044,8 @@ static int sco_sock_shutdown(struct socket *sock, int how)
>
>         if (!sk->sk_shutdown) {
>                 sk->sk_shutdown = SHUTDOWN_MASK;
> -               sco_sock_clear_timer(sk);
> +               if (sco_pi(sk)->conn)
> +                       sco_sock_clear_timer(sk, &sco_pi(sk)->conn->sk_timer);
>                 __sco_sock_close(sk);
>
>                 if (sock_flag(sk, SOCK_LINGER) && sk->sk_lingertime &&
> @@ -1083,7 +1092,7 @@ static void sco_conn_ready(struct sco_conn *conn)
>         BT_DBG("conn %p", conn);
>
>         if (sk) {
> -               sco_sock_clear_timer(sk);
> +               sco_sock_clear_timer(sk, &conn->sk_timer);
>                 bh_lock_sock(sk);
>                 sk->sk_state = BT_CONNECTED;
>                 sk->sk_state_change(sk);
> --
> 2.25.1
>


-- 
Luiz Augusto von Dentz
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
