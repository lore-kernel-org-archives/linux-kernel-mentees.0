Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C9234750F
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Apr 2026 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104375; cv=pass; b=OC6KGTbhR4rBHTrSY9iZ+hV7D8nDKyb9TcnF37i95oy9ViXZ/+p04ra/+7w9uWAvyQiZj0ortoNE2kKfK04TBBO9qnvenIzMz65jvB1Z8FzB8dRzuuxOgYfB1OZxxYGorYf7Pt9qJ+a8z2cHw8Pp3Klt11OUZFAcZwaAi3eSJIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104375; c=relaxed/simple;
	bh=jbJqRR1YggZpnI4Rc4S8uGMd7E1QTdhbpbMxNX8edgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cN715i+Y/GCCpXQE87uffmBIbB4wP23FNfLNX0MZ4H16bA1hLfHITasdMjlnV12r8kpRBUPgyeNzYas1tmySk1MADilTdi+H8xyUu4V9itzlIiG+pUg8aWjBhcNv1OajE0IUlEbsgVWsFo0nMBDdozVi7DsU7fKFsISvRk+LbmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8bIXrrU; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8bIXrrU"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79db5e18ac6so42764317b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Apr 2026 11:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776104370; cv=none;
        d=google.com; s=arc-20240605;
        b=CqEr6okY4UAYtkA0vAhtNORl0lsi0if+RPgYtrnB1YRVBUwkDiiuB/aJjev6hzm0tT
         TgB5uzovxQIqlHwYKoBAVeFIYyTEq3EZxiChlQwcwsnij6mqsV85V1EH0FO7HO+cS+8m
         9V4v90Cv5ckmF1JEiJhUHmaBfRyXqryq3aSBOqOfeziTql7wJ8wwmqAvPzWwFY99SnLo
         Am+glljCaaSE6HMZdZhU5g+1r+2FYr8MxfpeohRxDJAxzxkKkNv9w8E/DX7qfGozj8ig
         mNZDDbMXWWCviyq9ua3njgmj0mC7sLK/X7mO0/+nSwXY4ErTJPnDwG+nUTwSw5804UKX
         UX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XkKaFNaC9wRHn8yqUTeYtI/J85nYir4G+jZWgcFegT8=;
        fh=c743BdrPiRLR42opjKwn6ZP142ZYg8ot2w42hdCK2rI=;
        b=av3I5BhP4d+NZu1rzoYOQmNpQotwVGcNAoff6b1UWHLK4XV2ppO/Rv6UBjSY7kk9i5
         XvFylZvEQsq5a/y5rumtsURgYTaunpifRtXr9MRZS40UtMY8i2vwemG5D0Yav5Qx2NmF
         4OJGZDWrC57gKbZNDP+UIy2/1Px2qwQxZKeWRCj41sklexSvBHvkzwPpUOsTLjLfrBFH
         qdFjA0oSnlg5NODt9TjRLt24UWIEdn8DiC+ShOv0IXByi+AEAEe6L/cr/+aJY0/Ib5TM
         L2NhQRBSK1GxoXSut4J7jiRBAlsa2NhdqgyBtdXiGk6Etu4DJXq3+fiAmCGWbcu+mLbl
         r33Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776104370; x=1776709170; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkKaFNaC9wRHn8yqUTeYtI/J85nYir4G+jZWgcFegT8=;
        b=a8bIXrrUqquR9jJ6pqF9i8e8E/06mF+OnrRtCy2rWxfd4CDNyYfBFztlq6AnT8ngOP
         PHUuXib4YQoF9f+cKBkVzxEanoWMs8odeFk8hXbhGBiMu1ydQFsw031jWQ1eoq5mCoCI
         ak2beoX6TSpr1Kcna3+qmVs4sUqTmIhSHYJK9lRHbIFrGQtlzFXy9D/+VnMFjrwbzzCh
         +2AIsZXvUIhF1ch8s5DZLDK6mqIE8g1wJh8z+98OfcUAdJglWHiNTRQ4AaMLgu7l7Hg/
         5fh/TFF8o+z9eeZWmhOd4NAzU4Nyy/6VcsN7aFm3oigcTpJERkAFR1smJEqfiGxVJB/c
         vsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104370; x=1776709170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XkKaFNaC9wRHn8yqUTeYtI/J85nYir4G+jZWgcFegT8=;
        b=kNOkXKwZpD7q4jKwQ782SX/OkFAe2JYHtMDdTUrFAO+bBm7IPaq+KT8qwNO229Po4F
         j19FVQtGtgmECn6ll7+Be4Vmy5A71otE9MwKje93z+plhHA5ouj826IoZuQa1MKhnOEu
         M2GaMau5wWseZt38pcVuE28SeP0XBTuvYqLPX9rM7Pm/w1QS268BLw5Db+rphR8t8h0d
         NoL0oYuDpL7XY//kbcTwRhADmO/FoR7pLPKPXSNfz0UPVeDuwH9PDH1v3+kgq3rHKSY+
         2HthjPXw/f60sXzVpkCMcSGGXfyLnXRtwmmelTjBbu48TeeIlLF9Vad3xPE7dcYfIfAj
         q+FA==
X-Forwarded-Encrypted: i=1; AFNElJ+sIWLYknTeNpCWOF5uIYdk0GXHsG+62Uf3/8r1dRxPtiIS/klt5C0Yv/jk5DvNGiAppZDuMulLZkS7EPfINToYBwRkiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBtqbnH2x5KFOGwcAXhApkc486aGvE5eCsTe+L9ohjQeMZW/T7
	9U7591caE1GXmi7zEC0Soy6HbwNfbfWFBgkZr+b9BlFi3auwNkTCRQl+jEU1qNzvqKVEJx9sVbG
	SdJT5aPAax5g1yRZv8QKSUznfKH3UAkQ=
X-Gm-Gg: AeBDiest1mwEBpcrnrq/JMQ/4Wbni4MFjDdwdwkcimpWQOQEkaKd6GeHxswo/4d9xys
	/k3aHC5KDZgoXmyMUHOFMgmMrbUyUFb/ji0f+LL00nz1PbtfbDNXYUSKXFP+xF72pvvsM2NdrO3
	zLCRZXU0juagVT0DZdCQM10gVnF5UXo6zvHNebJ9MlDLfJvegbNcALwSwnMkGtFgSYvg799x8G8
	zBEE2iq+gF/9r0bT0//3pg/kGBc1zKV8kzXliJ6Qzvxol9rVVHBtb7kE8O8UIVgPyBi2QB4GGcA
	iCQNEvzyukVheB4f8rjYOs2pyIeWbRw7xgbb1hRJk3x9VKvKg55QqGPZBthJtAnT+rSvzuire59
	uL3zL
X-Received: by 2002:a05:690e:151b:b0:650:3124:b8c9 with SMTP id
 956f58d0204a3-6519905ad2emr9242035d50.20.1776104370232; Mon, 13 Apr 2026
 11:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412045457.53100-1-suunj1331@gmail.com>
In-Reply-To: <20260412045457.53100-1-suunj1331@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 13 Apr 2026 14:19:18 -0400
X-Gm-Features: AQROBzCdKwpPui8YqC4XYEkRd6Gjs6_0AK6EB80Qj12VEVPJMNFfoS1gMurMSa0
Message-ID: <CABBYNZJVasjYjX-Jq0rPCTVPruBOYevUgxVtPsRfLUX1VJtiSw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: RFCOMM: validate skb length in MCC handlers
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, kees@kernel.org, 
	kuba@kernel.org, me@brighamcampbell.com, shuah@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Apr 12, 2026 at 12:55=E2=80=AFAM SeungJu Cheon <suunj1331@gmail.com=
> wrote:
>
> rfcomm_recv_pn(), rfcomm_recv_rpn(), rfcomm_recv_rls(), and
> rfcomm_recv_msc() cast skb->data to their respective structs
> without first checking skb->len. A remote device can send a
> short MCC frame, causing out-of-bounds reads from the skb buffer.
>
> For rfcomm_recv_pn(), the uninitialized pn->mtu value is stored
> in d->mtu via rfcomm_apply_pn(), then echoed back to the remote
> device in the PN response, leaking kernel heap data.
>
> This results in use of uninitialized memory, as reported by KMSAN.
>
> Add explicit skb->len checks against the expected structure size
> at the start of each handler before accessing the payload.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> BUG: KMSAN: uninit-value in rfcomm_run+0x7eae/0xee90
>  rfcomm_run+0x7eae/0xee90
>  kthread+0x53f/0x600
>  ret_from_fork+0x20f/0x910
>  ret_from_fork_asm+0x1a/0x30
>
> Uninit was created at:
>  kmem_cache_alloc_node_noprof+0x3cd/0x12d0
>  __alloc_skb+0x855/0x1190
>  vhci_write+0x125/0x960
>  vfs_write+0xbe1/0x15c0
>  ksys_write+0x1d9/0x470
>  __x64_sys_write+0x97/0xf0
>  x64_sys_call+0x2ff0/0x3ea0
>  do_syscall_64+0x134/0xf80
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> CPU: 0 UID: 0 PID: 3374 Comm: krfcommd Tainted: G        W           7.0.=
0-rc7
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
> Kernel panic - not syncing: kmsan.panic set ...
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> ---
>  net/bluetooth/rfcomm/core.c | 40 +++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 8 deletions(-)
>
> diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
> index 611a9a94151e..daeba71a1514 100644
> --- a/net/bluetooth/rfcomm/core.c
> +++ b/net/bluetooth/rfcomm/core.c
> @@ -1431,9 +1431,15 @@ static int rfcomm_apply_pn(struct rfcomm_dlc *d, i=
nt cr, struct rfcomm_pn *pn)
>
>  static int rfcomm_recv_pn(struct rfcomm_session *s, int cr, struct sk_bu=
ff *skb)
>  {
> -       struct rfcomm_pn *pn =3D (void *) skb->data;
> +       struct rfcomm_pn *pn;
>         struct rfcomm_dlc *d;
> -       u8 dlci =3D pn->dlci;
> +       u8 dlci;
> +
> +       if (skb->len < sizeof(*pn))
> +               return -EINVAL;
> +
> +       pn =3D (void *) skb->data;
> +       dlci =3D pn->dlci;

How about using skb_pull_data?

>         BT_DBG("session %p state %ld dlci %d", s, s->state, dlci);
>
> @@ -1483,8 +1489,8 @@ static int rfcomm_recv_pn(struct rfcomm_session *s,=
 int cr, struct sk_buff *skb)
>
>  static int rfcomm_recv_rpn(struct rfcomm_session *s, int cr, int len, st=
ruct sk_buff *skb)
>  {
> -       struct rfcomm_rpn *rpn =3D (void *) skb->data;
> -       u8 dlci =3D __get_dlci(rpn->dlci);
> +       struct rfcomm_rpn *rpn;
> +       u8 dlci;
>
>         u8 bit_rate  =3D 0;
>         u8 data_bits =3D 0;
> @@ -1495,6 +1501,12 @@ static int rfcomm_recv_rpn(struct rfcomm_session *=
s, int cr, int len, struct sk_
>         u8 xoff_char =3D 0;
>         u16 rpn_mask =3D RFCOMM_RPN_PM_ALL;
>
> +       if (skb->len < sizeof(*rpn))
> +               return -EINVAL;
> +
> +       rpn =3D (void *) skb->data;
> +       dlci =3D __get_dlci(rpn->dlci);

Ditto

>         BT_DBG("dlci %d cr %d len 0x%x bitr 0x%x line 0x%x flow 0x%x xonc=
 0x%x xoffc 0x%x pm 0x%x",
>                 dlci, cr, len, rpn->bit_rate, rpn->line_settings, rpn->fl=
ow_ctrl,
>                 rpn->xon_char, rpn->xoff_char, rpn->param_mask);
> @@ -1589,8 +1601,14 @@ static int rfcomm_recv_rpn(struct rfcomm_session *=
s, int cr, int len, struct sk_
>
>  static int rfcomm_recv_rls(struct rfcomm_session *s, int cr, struct sk_b=
uff *skb)
>  {
> -       struct rfcomm_rls *rls =3D (void *) skb->data;
> -       u8 dlci =3D __get_dlci(rls->dlci);
> +       struct rfcomm_rls *rls;
> +       u8 dlci;
> +
> +       if (skb->len < sizeof(*rls))
> +               return -EINVAL;
> +
> +       rls =3D (void *) skb->data;
> +       dlci =3D __get_dlci(rls->dlci);

Ditto

>         BT_DBG("dlci %d cr %d status 0x%x", dlci, cr, rls->status);
>
> @@ -1608,9 +1626,15 @@ static int rfcomm_recv_rls(struct rfcomm_session *=
s, int cr, struct sk_buff *skb
>
>  static int rfcomm_recv_msc(struct rfcomm_session *s, int cr, struct sk_b=
uff *skb)
>  {
> -       struct rfcomm_msc *msc =3D (void *) skb->data;
> +       struct rfcomm_msc *msc;
>         struct rfcomm_dlc *d;
> -       u8 dlci =3D __get_dlci(msc->dlci);
> +       u8 dlci;
> +
> +       if (skb->len < sizeof(*msc))
> +               return -EINVAL;
> +
> +       msc =3D (void *) skb->data;
> +       dlci =3D __get_dlci(msc->dlci);

Ditto.

>         BT_DBG("dlci %d cr %d v24 0x%x", dlci, cr, msc->v24_sig);
>
> --
> 2.52.0
>


--=20
Luiz Augusto von Dentz
