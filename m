Return-Path: <SRS0=rXb3=MG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8B1C47E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Jul 2021 19:12:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ACD8613C1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Jul 2021 19:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ACD8613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41741606A6;
	Wed, 14 Jul 2021 19:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ap4Hs7X1FTl; Wed, 14 Jul 2021 19:12:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7F469605DE;
	Wed, 14 Jul 2021 19:12:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 532C8C001A;
	Wed, 14 Jul 2021 19:12:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A83F6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Jul 2021 19:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 834248282C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Jul 2021 19:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9hCGIBWs5xv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Jul 2021 19:12:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34FFD827F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Jul 2021 19:12:45 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id x192so4959120ybe.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Jul 2021 12:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a6b8ZUl1AAFuzaqzIwO12TaxvALaJZH9f5hR4YvB20U=;
 b=TJxHLuLGO77Ii9zKR8Vj3C2y3yuTiSE/k7wJk4RcwUDujq+HmTDLECE1S5gesSCQKc
 pqtsBQTcyMNXFv+7BOnUUlIeKcFL494CdV8qGN+fSg4LAQJ5qMFL27+M53x18SILciMt
 5mmynKuSo07m8KnIZszyn6myqNESnKQQywuAXKm0I9V/7rHXPFB8B1rf/9NvUAaBnCrc
 ytUZFRFBZ3IsTgUUgaLlQe8KqZCBko5VgOsA4w0Gbjlbi0nRpVx1mkjL1lbmEt7YcI9K
 T7XGSM/4ytFdI+Qx4xEwaN7IOK7zv89ok9DSBiVqga1QGYeHRAXedqVpXTTTO/DnvA5s
 Wbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6b8ZUl1AAFuzaqzIwO12TaxvALaJZH9f5hR4YvB20U=;
 b=q9clDiXiYgE05UsZRtSFsz/uAnVS4Y0MaU8i2G/6UcSXAakhG6Q1krCoR7pIpsGyju
 MPYhF/C7A/KAFiFidFqu2wiNgbDjcVsXYFNOqeAC6LqqXz+LC2O1gzSHd6NhSB/CGTQU
 1NeF6BTTImQt7XN9kivXMz6rLZn25QVrrXBwCenETltVCpM4fOQdu07CVXjH9N61iDMI
 j4JFw8CChMMxWqZSRR+iSFzUaiLcB9yQOUrcHgv3f6eiX2PClzqXZlufX0UQCP0Hatxz
 z65khgdgT6U283ooOMbBSHp98hYJysDoOoum6PuQ4FDE9sgzLG4P4HUvSE3bdT8QjBAi
 niSQ==
X-Gm-Message-State: AOAM531WTQOhBWWmbs+wbl7FAB7TFKR7XyFMMiT5o+AM/cxi0OmHwBMn
 yQW9AlA/zEfqy9ItIwc8ykX0830NDf4dSNBt8R8=
X-Google-Smtp-Source: ABdhPJzPJ+le/Tv5V9h0OeOL/PowxLw/S9z37qFXjdPvshSIOWqzIW6uY24e2ErD55XW2C8rrdsjvslRQJdYx9Nql9I=
X-Received: by 2002:a25:be02:: with SMTP id h2mr15785186ybk.91.1626289964654; 
 Wed, 14 Jul 2021 12:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210713162838.693266-1-desmondcheongzx@gmail.com>
In-Reply-To: <20210713162838.693266-1-desmondcheongzx@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 14 Jul 2021 12:12:33 -0700
Message-ID: <CABBYNZLBfH+0=yhgcAK4XzizUKqpmAxjyxGpBACiFZpPsr0CEQ@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: fix inconsistent lock state in sco
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com,
 Jakub Kicinski <kuba@kernel.org>,
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

On Tue, Jul 13, 2021 at 9:29 AM Desmond Cheong Zhi Xi
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
>
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
> As sco_conn_del now disables local bh before calling sco_chan_del,
> instead of disabling local bh for the calls to sco_conn_lock in
> sco_chan_del, we instead wrap other calls to sco_chan_del with
> local_bh_disable/enable.
>
> Reported-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
> Tested-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>
> Hi,
>
> The previous version of this patch was a bit of a mess, so I made the
> following changes.
>
> v1 -> v2:
> - Instead of pulling out the clean-up code out from sco_chan_del and
> using it directly in sco_conn_del, disable local irqs for relevant
> sections.
> - Disable local irqs more thoroughly for instances of
> bh_lock_sock/bh_lock_sock_nested in the bluetooth subsystem.
> Specifically, the calls in af_bluetooth.c and rfcomm/sock.c are now made
> with local irqs disabled as well.
>
> Best wishes,
> Desmond
>
>  net/bluetooth/rfcomm/sock.c |  2 ++
>  net/bluetooth/sco.c         | 26 +++++++++++++++++++++++++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/net/bluetooth/rfcomm/sock.c b/net/bluetooth/rfcomm/sock.c
> index ae6f80730561..d8734abb2df4 100644
> --- a/net/bluetooth/rfcomm/sock.c
> +++ b/net/bluetooth/rfcomm/sock.c
> @@ -974,6 +974,7 @@ int rfcomm_connect_ind(struct rfcomm_session *s, u8 channel, struct rfcomm_dlc *
>         if (!parent)
>                 return 0;
>
> +       local_bh_disable();
>         bh_lock_sock(parent);
>
>         /* Check for backlog size */
> @@ -1002,6 +1003,7 @@ int rfcomm_connect_ind(struct rfcomm_session *s, u8 channel, struct rfcomm_dlc *
>
>  done:
>         bh_unlock_sock(parent);
> +       local_bh_enable();

Looks like you are touching RFCOMM as well, perhaps you should have it
split, also how about other sockets like L2CAP and HCI are they
affected? There seems to be a lot of problem with the likes of
bh_lock_sock I wonder if going with local_bh_disable is overall a
better way to handle.

>         if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(parent)->flags))
>                 parent->sk_state_change(parent);
> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> index 3bd41563f118..2548b8f81473 100644
> --- a/net/bluetooth/sco.c
> +++ b/net/bluetooth/sco.c
> @@ -167,16 +167,22 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
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
> @@ -202,6 +208,7 @@ static int sco_chan_add(struct sco_conn *conn, struct sock *sk,
>  {
>         int err = 0;
>
> +       local_bh_disable();
>         sco_conn_lock(conn);
>         if (conn->sk)
>                 err = -EBUSY;
> @@ -209,6 +216,7 @@ static int sco_chan_add(struct sco_conn *conn, struct sock *sk,
>                 __sco_chan_add(conn, sk, parent);
>
>         sco_conn_unlock(conn);
> +       local_bh_enable();
>         return err;
>  }
>
> @@ -303,9 +311,11 @@ static void sco_recv_frame(struct sco_conn *conn, struct sk_buff *skb)
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
> @@ -420,18 +430,25 @@ static void __sco_sock_close(struct sock *sk)
>                 if (sco_pi(sk)->conn->hcon) {
>                         sk->sk_state = BT_DISCONN;
>                         sco_sock_set_timer(sk, SCO_DISCONN_TIMEOUT);
> +                       local_bh_disable();
>                         sco_conn_lock(sco_pi(sk)->conn);
>                         hci_conn_drop(sco_pi(sk)->conn->hcon);
>                         sco_pi(sk)->conn->hcon = NULL;
>                         sco_conn_unlock(sco_pi(sk)->conn);
> -               } else
> +                       local_bh_enable();
> +               } else {
> +                       local_bh_disable();
>                         sco_chan_del(sk, ECONNRESET);
> +                       local_bh_enable();
> +               }
>                 break;
>
>         case BT_CONNECT2:
>         case BT_CONNECT:
>         case BT_DISCONN:
> +               local_bh_disable();
>                 sco_chan_del(sk, ECONNRESET);
> +               local_bh_enable();
>                 break;
>
>         default:
> @@ -1084,21 +1101,26 @@ static void sco_conn_ready(struct sco_conn *conn)
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
> @@ -1109,6 +1131,7 @@ static void sco_conn_ready(struct sco_conn *conn)
>                 if (!sk) {
>                         bh_unlock_sock(parent);
>                         sco_conn_unlock(conn);
> +                       local_bh_enable();
>                         return;
>                 }
>
> @@ -1131,6 +1154,7 @@ static void sco_conn_ready(struct sco_conn *conn)
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
