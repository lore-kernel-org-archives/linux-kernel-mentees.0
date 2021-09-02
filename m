Return-Path: <SRS0=Ip/S=NY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4C5C43217
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Sep 2021 23:42:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AAC5610E8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Sep 2021 23:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AAC5610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F543425F7;
	Thu,  2 Sep 2021 23:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZ5RAtfAdyD6; Thu,  2 Sep 2021 23:42:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F21C442592;
	Thu,  2 Sep 2021 23:42:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF68BC0010;
	Thu,  2 Sep 2021 23:42:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79452C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 23:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 625A161525
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 23:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZnoTSlz0Obc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 23:42:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26AB26067F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 23:42:14 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id bf15so3027497vsb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Sep 2021 16:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z3Mb5qD63cCUONGM6JVxKhEAn0nMsQDsAtA2oDhp/1U=;
 b=REJwvePpLQXdALZ9VbfGtyVnTJODDqzaa074uB2ovL1ZxuJLLoHdfFMGKYK0jC3uB8
 iQHgtr5lnq1NCFZkOUmSpDfMqEjc0UHAI165dKzDvokd5vcyfJzRKdxu0UfHPgugfv1K
 mCmQjm29w0/DTtsUsf42vwua5U1jgAGueR7SI+cCAb8c8WT2tgTjxuxSyYv6K+wah8LJ
 IsTc0aWqk471BxvLEn/RxrNnId4LIQE/SCC3CvZoJ4TTXWImxyKYwCH/71KnQWtQGDUt
 tZ9grHZzw6Gcw9pSSi/w46WXqgv+UcVETdTkqDjPlqeWnu7Ubpv92mWCf2ZBEUSiGobQ
 O7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3Mb5qD63cCUONGM6JVxKhEAn0nMsQDsAtA2oDhp/1U=;
 b=HRwm2zs7Lfvlz3FzMaVeNdDxI8UcowYCUzAUAJ6Hc++NKYQ9HIq18TUsQHdsghj/Iy
 4VOZBD3L9iLibBfEZ3YkAnhmmzMsIxVlTDroH7pZPIiZBXG9BDXdDLi4/j2TFNxmWaJE
 PhK4h+r+WZAYPlvW+Caj+n+jordjpqFpvWsemHSSwWhflGSMcGda89bLLT+Gti3o2cNv
 RcPLSqzGQUK6l6DGYoNodn3uDnW/KZjmWbCkd8s7i0YkHPgRj5NpAAHnACnCfSXDbKt0
 83KQAOuml1G+qgpWxzKNZ2ci12nZIPItJoqLVmNDFrrv2Ke+/YWCb974RQuplHaet7hQ
 yT5A==
X-Gm-Message-State: AOAM531i2/vIyhjvDD9QHDbQW68MkPUXGdamk5TyM//R41SBwq+muzHD
 hwdUI0ejK2gWLr5bKxTUuJ2Ol7xucsTkeokb5i8=
X-Google-Smtp-Source: ABdhPJzq7iGdSNz7qy2k/rFUj+qSnHN/MGLFGXZAC3JXnheFVxVDBGh+n9qGYpcc2YlLe4QDHaDa+ln9yzseSXJsySQ=
X-Received: by 2002:a67:ebcc:: with SMTP id y12mr596151vso.18.1630626132772;
 Thu, 02 Sep 2021 16:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210810041410.142035-1-desmondcheongzx@gmail.com>
 <20210810041410.142035-2-desmondcheongzx@gmail.com>
 <0b33a7fe-4da0-058c-cff3-16bb5cfe8f45@gmail.com>
 <bad67d05-366b-bebe-cbdb-6555386497de@gmail.com>
 <94942257-927c-efbc-b3fd-44cc097ad71f@gmail.com>
 <fa269649-21eb-be76-e552-36a3aa4f3da4@gmail.com>
 <e54b3c01-6804-4f0d-3e4b-eba49f881039@gmail.com>
In-Reply-To: <e54b3c01-6804-4f0d-3e4b-eba49f881039@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 2 Sep 2021 16:42:01 -0700
Message-ID: <CABBYNZJaPFzU-oXcYkuob0zw16tNcVgoVx8N-_GvL8=nT0Kn3Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] Bluetooth: schedule SCO timeouts with delayed_work
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Eric Dumazet <eric.dumazet@gmail.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Desmond,

On Thu, Sep 2, 2021 at 4:05 PM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
>
> On 2/9/21 6:53 pm, Desmond Cheong Zhi Xi wrote:
> > On 2/9/21 5:41 pm, Eric Dumazet wrote:
> >>
> >>
> >> On 9/2/21 12:32 PM, Desmond Cheong Zhi Xi wrote:
> >>>
> >>> Hi Eric,
> >>>
> >>> This actually seems to be a pre-existing error in sco_sock_connect
> >>> that we now hit in sco_sock_timeout.
> >>>
> >>> Any thoughts on the following patch to address the problem?
> >>>
> >>> Link:
> >>> https://lore.kernel.org/lkml/20210831065601.101185-1-desmondcheongzx@gmail.com/
> >>>
> >>
> >>
> >> syzbot is still working on finding a repro, this is obviously not
> >> trivial,
> >> because this is a race window.
> >>
> >> I think this can happen even with a single SCO connection.
> >>
> >> This might be triggered more easily forcing a delay in sco_sock_timeout()
> >>
> >> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> >> index
> >> 98a88158651281c9f75c4e0371044251e976e7ef..71ebe0243fab106c676c308724fe3a3f92a62cbd
> >> 100644
> >> --- a/net/bluetooth/sco.c
> >> +++ b/net/bluetooth/sco.c
> >> @@ -84,8 +84,14 @@ static void sco_sock_timeout(struct work_struct *work)
> >>          sco_conn_lock(conn);
> >>          sk = conn->sk;
> >> -       if (sk)
> >> +       if (sk) {
> >> +               // lets pretend cpu has been busy (in interrupts) for
> >> 100ms
> >> +               int i;
> >> +               for (i=0;i<100000;i++)
> >> +                       udelay(1);
> >> +
> >>                  sock_hold(sk);
> >> +       }>          sco_conn_unlock(conn);
> >>          if (!sk)
> >>
> >>
> >> Stack trace tells us that sco_sock_timeout() is running after last
> >> reference
> >> on socket has been released.
> >>
> >> __refcount_add include/linux/refcount.h:199 [inline]
> >>   __refcount_inc include/linux/refcount.h:250 [inline]
> >>   refcount_inc include/linux/refcount.h:267 [inline]
> >>   sock_hold include/net/sock.h:702 [inline]
> >>   sco_sock_timeout+0x216/0x290 net/bluetooth/sco.c:88
> >>   process_one_work+0x98d/0x1630 kernel/workqueue.c:2276
> >>   worker_thread+0x658/0x11f0 kernel/workqueue.c:2422
> >>   kthread+0x3e5/0x4d0 kernel/kthread.c:319
> >>   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> >>
> >> This is why I suggested to delay sock_put() to make sure this can not
> >> happen.
> >>
> >> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> >> index
> >> 98a88158651281c9f75c4e0371044251e976e7ef..bd0222e3f05a6bcb40cffe8405c9dfff98d7afde
> >> 100644
> >> --- a/net/bluetooth/sco.c
> >> +++ b/net/bluetooth/sco.c
> >> @@ -195,10 +195,11 @@ static void sco_conn_del(struct hci_conn *hcon,
> >> int err)
> >>                  sco_sock_clear_timer(sk);
> >>                  sco_chan_del(sk, err);
> >>                  release_sock(sk);
> >> -               sock_put(sk);
> >>                  /* Ensure no more work items will run before freeing
> >> conn. */
> >>                  cancel_delayed_work_sync(&conn->timeout_work);
> >> +
> >> +               sock_put(sk);
> >>          }
> >>          hcon->sco_data = NULL;
> >>
> >
> > I see where you're going with this, but once sco_chan_del returns, any
> > instance of sco_sock_timeout that hasn't yet called sock_hold will
> > simply return, because conn->sk is NULL. Adding a delay to the
> > sco_conn_lock critical section in sco_sock_timeout would not affect this
> > because sco_chan_del clears conn->sk while holding onto the lock.
> >
> > The main reason that cancel_delayed_work_sync is run there is to make
> > sure that we don't have a UAF on the SCO connection itself after we free
> > conn.
> >
>
> Now that I think about this, the init and cleanup isn't quite right
> either. The delayed work should be initialized when the connection is
> allocated, and we should always cancel all work before freeing:
>
> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> index ea18e5b56343..bba5cdb4cb4a 100644
> --- a/net/bluetooth/sco.c
> +++ b/net/bluetooth/sco.c
> @@ -133,6 +133,7 @@ static struct sco_conn *sco_conn_add(struct hci_conn *hcon)
>                 return NULL;
>
>         spin_lock_init(&conn->lock);
> +       INIT_DELAYED_WORK(&conn->timeout_work, sco_sock_timeout);
>
>         hcon->sco_data = conn;
>         conn->hcon = hcon;
> @@ -197,11 +198,11 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
>                 sco_chan_del(sk, err);
>                 release_sock(sk);
>                 sock_put(sk);
> -
> -               /* Ensure no more work items will run before freeing conn. */
> -               cancel_delayed_work_sync(&conn->timeout_work);
>         }
>
> +       /* Ensure no more work items will run before freeing conn. */
> +       cancel_delayed_work_sync(&conn->timeout_work);
> +
>         hcon->sco_data = NULL;
>         kfree(conn);
>   }
> @@ -214,8 +215,6 @@ static void __sco_chan_add(struct sco_conn *conn, struct sock *sk,
>         sco_pi(sk)->conn = conn;
>         conn->sk = sk;
>
> -       INIT_DELAYED_WORK(&conn->timeout_work, sco_sock_timeout);
> -
>         if (parent)
>                 bt_accept_enqueue(parent, sk, true);
>   }

I have come to something similar, do you care to send a proper patch
so we can get this merged.

> > For a single SCO connection with well-formed channel, I think there
> > can't be a race. Here's the reasoning:
> >
> > - For the timeout to be scheduled, a socket must have a channel with a
> > connection.
> >
> > - When a channel between a socket and connection is established, the
> > socket transitions from BT_OPEN to BT_CONNECTED, BT_CONNECT, or
> > BT_CONNECT2.
> >
> > - For a socket to be released, it has to be zapped. For sockets that
> > have a state of BT_CONNECTED, BT_CONNECT, or BT_CONNECT2, they are
> > zapped only when the channel is deleted.
> >
> > - If the channel is deleted (which is protected by sco_conn_lock), then
> > conn->sk is NULL, and sco_sock_timeout simply exits. If we had entered
> > the critical section in sco_sock_timeout before the channel was deleted,
> > then we increased the reference count on the socket, so it won't be
> > freed until sco_sock_timeout is done.
> >
> > Hence, sco_sock_timeout doesn't race with the release of a socket that
> > has a well-formed channel with a connection.
> >
> > But if multiple connections are allocated and overwritten in
> > sco_sock_connect, then none of the above assumptions hold because the
> > SCO connection can't be cleaned up (i.e. conn->sk cannot be set to NULL)
> > when the associated socket is released. This scenario happens in the
> > syzbot reproducer for the crash here:
> > https://syzkaller.appspot.com/bug?id=bcc246d137428d00ed14b476c2068579515fe2bc
> >
> >
> > That aside, upon taking a closer look, I think there is indeed a race
> > lurking in sco_conn_del, but it's not the one that syzbot is hitting.
> > Our sock_hold simply comes too late, and by the time it's called we
> > might have already have freed the socket.
> >
> > So probably something like this needs to happen:
> >
> > diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> > index fa25b07120c9..ea18e5b56343 100644
> > --- a/net/bluetooth/sco.c
> > +++ b/net/bluetooth/sco.c
> > @@ -187,10 +187,11 @@ static void sco_conn_del(struct hci_conn *hcon,
> > int err)
> >       /* Kill socket */
> >       sco_conn_lock(conn);
> >       sk = conn->sk;
> > +    if (sk)
> > +        sock_hold(sk);
> >       sco_conn_unlock(conn);
> >
> >       if (sk) {
> > -        sock_hold(sk);
> >           lock_sock(sk);
> >           sco_sock_clear_timer(sk);
> >           sco_chan_del(sk, err);
>


-- 
Luiz Augusto von Dentz
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
