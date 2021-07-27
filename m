Return-Path: <SRS0=JmfH=MT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04AFC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 00:30:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD4560F55
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 00:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AD4560F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF45402CB;
	Tue, 27 Jul 2021 00:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsRUXG87yHTU; Tue, 27 Jul 2021 00:30:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 00DC4402C9;
	Tue, 27 Jul 2021 00:30:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5B83C0010;
	Tue, 27 Jul 2021 00:30:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81B02C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A524607B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pz0LF62-mOSc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:30:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 915416076C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:30:20 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id m193so17850821ybf.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 17:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WlahV91siRimjn5Od4QMmgRdTNqfaI93h5YP2ufAleM=;
 b=bRRDCCRM8Ysc/7n8ReGL7u0AZT6YqOT90xC4edP0CLn9VnnVFxzKJTY+nfBRtYZo+7
 fkNyQ/On/WId3txLmG5Lw4YuqaAAvAvUc1hcAsGQUfhkUd2tuQBMJuiAXdolDAswX9WT
 O+XaP8eKp0EcvzsoaH6LOZt5/AwckAt3RXDlHqJH9RSc2xyC12nOO6OYNpS4difxYyHY
 RpB85toIYVM7AxfOUwaShKbkBUsEqt3mcrVOCk1jB6w/0OVpmG+e9uG3zKQHFbeZB+vo
 gspifWERbt31O4wtJeqVNxgaQxupY5TUqHeq5i+JErPIKZ4aGknytJ3lzryKAGfnw7HQ
 F5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WlahV91siRimjn5Od4QMmgRdTNqfaI93h5YP2ufAleM=;
 b=oGsCRkQnVVVMDtWqU2Pv0gy280vZ4rnTltUIAXmlIzeOd6ojndiejYshwhZYF4UD1U
 Ide5p0vU4r7emh2bvCxBs8Pj93bNUckg3Eb8oG42vv2rfJIm7fWT8Yq7Yzcp9l72OKa6
 i9wKFaJETchXnPfx4NvZGvTNcrjCBybF21Oq0hDVt31ujkp+GdDCkYkeXIib+aov4DNY
 /YDKOIUvr5iidSFr1JSqSsTRrs3lrE7hui5jLyqNwVkmr+OzEUFPamJHa9EPG8X1vhMa
 EPeHEEtIsmOd9h93sovofrbOPHYu46EeXGkODxbfIzzVuAWKUBIUfUzLh0weDvGUYB6K
 RjRA==
X-Gm-Message-State: AOAM531fXVXWDgt6lHZ1rwdxJ+2MyJgbvyF3mB81HoOCYkVTHHgCRMP7
 /sJnnBKIOHC7L5b40HlKde76487Xv2dlrMjaEJw=
X-Google-Smtp-Source: ABdhPJxZXKGNSaIrmlXFd3lcCt8NDgz2o2kpO2hUE/I853+pYfA0WyPWplCnDd23A21flqbjJWotxIXUBVpOWxpK1xk=
X-Received: by 2002:a25:8205:: with SMTP id q5mr27524628ybk.440.1627345819451; 
 Mon, 26 Jul 2021 17:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210721093832.78081-1-desmondcheongzx@gmail.com>
 <20210721093832.78081-2-desmondcheongzx@gmail.com>
In-Reply-To: <20210721093832.78081-2-desmondcheongzx@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 26 Jul 2021 17:30:08 -0700
Message-ID: <CABBYNZLus8GyPuTp4jmAeSEdsYTZ-4gK6OvGXqcABhci8tBOwA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Bluetooth: fix inconsistent lock state in SCO
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Desmond,

On Wed, Jul 21, 2021 at 2:39 AM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
>
> Syzbot reported an inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} lock
> usage in sco_conn_del and sco_sock_timeout that could lead to
> deadlocks.
>
> This inconsistent lock state can also happen in sco_conn_ready,
> rfcomm_connect_ind, and bt_accept_enqueue.
>
> The issue is that these functions take a spin lock on the socket with
> interrupts enabled, but sco_sock_timeout takes the lock in an IRQ
> context. This could lead to deadlocks:
>
>        CPU0
>        ----
>   lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
>   <Interrupt>
>     lock(slock-AF_BLUETOOTH-BTPROTO_SCO);

Having a second look at this, it does seem this is due to use of
sk->sk_timer which apparently run its callback on IRQ context, so I
wonder if wouldn't be a better idea to switch to a delayed_work to
avoid having to deal with the likes of local_bh_disable, in fact it
seems we have been misusing it since the documentation says it is for
sock cleanup not for handling things like SNDTIMEO, we don't really
use it for other socket types so I wonder when we start using
delayed_work we forgot about sco.c.

>  *** DEADLOCK ***
>
> We fix this by ensuring that local bh is disabled before calling
> bh_lock_sock.
>
> After doing this, we additionally need to protect sco_conn_lock by
> disabling local bh.
>
> This is necessary because sco_conn_del makes a call to sco_chan_del
> while holding on to the sock lock, and sco_chan_del itself makes a
> call to sco_conn_lock. If sco_conn_lock is held elsewhere with
> interrupts enabled, there could still be a
> slock-AF_BLUETOOTH-BTPROTO_SCO --> &conn->lock#2 lock inversion as
> follows:
>
>         CPU0                    CPU1
>         ----                    ----
>    lock(&conn->lock#2);
>                                 local_irq_disable();
>                                 lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
>                                 lock(&conn->lock#2);
>    <Interrupt>
>      lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
>
>   *** DEADLOCK ***
>
> Although sco_conn_del disables local bh before calling sco_chan_del,
> we can still wrap the calls to sco_conn_lock in sco_chan_del, with
> local_bh_disable/enable as this pair of functions are reentrant.
>
> Reported-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
> Tested-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  net/bluetooth/sco.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> index 3bd41563f118..34f3419c3330 100644
> --- a/net/bluetooth/sco.c
> +++ b/net/bluetooth/sco.c
> @@ -140,10 +140,12 @@ static void sco_chan_del(struct sock *sk, int err)
>         BT_DBG("sk %p, conn %p, err %d", sk, conn, err);
>
>         if (conn) {
> +               local_bh_disable();
>                 sco_conn_lock(conn);
>                 conn->sk = NULL;
>                 sco_pi(sk)->conn = NULL;
>                 sco_conn_unlock(conn);
> +               local_bh_enable();
>
>                 if (conn->hcon)
>                         hci_conn_drop(conn->hcon);
> @@ -167,16 +169,22 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
>         BT_DBG("hcon %p conn %p, err %d", hcon, conn, err);
>
>         /* Kill socket */
> +       local_bh_disable();
>         sco_conn_lock(conn);
>         sk = conn->sk;
>         sco_conn_unlock(conn);
> +       local_bh_enable();
>
>         if (sk) {
>                 sock_hold(sk);
> +
> +               local_bh_disable();
>                 bh_lock_sock(sk);
>                 sco_sock_clear_timer(sk);
>                 sco_chan_del(sk, err);
>                 bh_unlock_sock(sk);
> +               local_bh_enable();
> +
>                 sco_sock_kill(sk);
>                 sock_put(sk);
>         }
> @@ -202,6 +210,7 @@ static int sco_chan_add(struct sco_conn *conn, struct sock *sk,
>  {
>         int err = 0;
>
> +       local_bh_disable();
>         sco_conn_lock(conn);
>         if (conn->sk)
>                 err = -EBUSY;
> @@ -209,6 +218,7 @@ static int sco_chan_add(struct sco_conn *conn, struct sock *sk,
>                 __sco_chan_add(conn, sk, parent);
>
>         sco_conn_unlock(conn);
> +       local_bh_enable();
>         return err;
>  }
>
> @@ -303,9 +313,11 @@ static void sco_recv_frame(struct sco_conn *conn, struct sk_buff *skb)
>  {
>         struct sock *sk;
>
> +       local_bh_disable();
>         sco_conn_lock(conn);
>         sk = conn->sk;
>         sco_conn_unlock(conn);
> +       local_bh_enable();
>
>         if (!sk)
>                 goto drop;
> @@ -420,10 +432,12 @@ static void __sco_sock_close(struct sock *sk)
>                 if (sco_pi(sk)->conn->hcon) {
>                         sk->sk_state = BT_DISCONN;
>                         sco_sock_set_timer(sk, SCO_DISCONN_TIMEOUT);
> +                       local_bh_disable();
>                         sco_conn_lock(sco_pi(sk)->conn);
>                         hci_conn_drop(sco_pi(sk)->conn->hcon);
>                         sco_pi(sk)->conn->hcon = NULL;
>                         sco_conn_unlock(sco_pi(sk)->conn);
> +                       local_bh_enable();
>                 } else
>                         sco_chan_del(sk, ECONNRESET);
>                 break;
> @@ -1084,21 +1098,26 @@ static void sco_conn_ready(struct sco_conn *conn)
>
>         if (sk) {
>                 sco_sock_clear_timer(sk);
> +               local_bh_disable();
>                 bh_lock_sock(sk);
>                 sk->sk_state = BT_CONNECTED;
>                 sk->sk_state_change(sk);
>                 bh_unlock_sock(sk);
> +               local_bh_enable();
>         } else {
> +               local_bh_disable();
>                 sco_conn_lock(conn);
>
>                 if (!conn->hcon) {
>                         sco_conn_unlock(conn);
> +                       local_bh_enable();
>                         return;
>                 }
>
>                 parent = sco_get_sock_listen(&conn->hcon->src);
>                 if (!parent) {
>                         sco_conn_unlock(conn);
> +                       local_bh_enable();
>                         return;
>                 }
>
> @@ -1109,6 +1128,7 @@ static void sco_conn_ready(struct sco_conn *conn)
>                 if (!sk) {
>                         bh_unlock_sock(parent);
>                         sco_conn_unlock(conn);
> +                       local_bh_enable();
>                         return;
>                 }
>
> @@ -1131,6 +1151,7 @@ static void sco_conn_ready(struct sco_conn *conn)
>                 bh_unlock_sock(parent);
>
>                 sco_conn_unlock(conn);
> +               local_bh_enable();
>         }
>  }
>
> --
> 2.25.1
>


-- 
Luiz Augusto von Dentz
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
