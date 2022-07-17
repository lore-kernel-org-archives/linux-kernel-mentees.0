Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B8FC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Jul 2022 18:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A4F606ED;
	Sun, 17 Jul 2022 18:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8A4F606ED
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R+qaOJ/R
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrBzbD03Wnyi; Sun, 17 Jul 2022 18:34:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D0D94605A2;
	Sun, 17 Jul 2022 18:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0D94605A2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 803C3C0033;
	Sun, 17 Jul 2022 18:34:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9EFBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 18:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9CC54155D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 18:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9CC54155D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R+qaOJ/R
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8oVdkVSkkUHc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 18:34:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF27341552
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF27341552
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 18:34:30 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id e69so253436iof.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 11:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7T1elb4VQwrC1sZg3F4EdxUouZCTWEFZq0pNjmM10H4=;
 b=R+qaOJ/RIl3tbU2jrW/9rmGOvRSHh7KgGM8IOx/eYI3V0sYo9NQmH4FJw4hNkIeZEc
 L6glhandgJX4/1fNKk9uOpAh1MYb1SmhGdyTTj/tiOqprl10s8pSnGVB8hls1Qro3O/Q
 hsGU2inzEMgiQ3M+Peh0rABJjo7yZRQ0z3+WP9/nK4/XINkll/MVTwfkAyD/jpduSMc0
 rBtyGjceHwVaO6EyN8BTRtKRyLxkSJU/V8PcuG4Nz2XUBJSB34BTcREnZNn+zCdok3fx
 0lv26C9wusy4wO8CpSnZt9qonkLuT2UNIItzdLy8FDRALcJ8ZR0a7DiLQTrdajBmAXsE
 wISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7T1elb4VQwrC1sZg3F4EdxUouZCTWEFZq0pNjmM10H4=;
 b=lF6Tx+b5DIpFetiBwlYN8xOmMycfVx73IdCY0QoKCXZWXswzwm8CTwQ8sMLgwL6oEZ
 ok54jOmQ+2l1+G/nqN+1MDgnLrb1mo1gWat2Qbp/XuwN6yvDnyTUSKxMMe2yijQFydG6
 u30akUXhUwH/DpwTl1SSfrq232Pq5BEhU4O/xz+VWuRFaeevQ4+vsgZYX7IPSCmuILDi
 v4YLDTgtG/QURMeOLOMsw4HnkMOZ6x5+SbXo7Nm95yB3ysrFRqaTKBiduUERRGT146SP
 tUH+1NwnWwCjH5+eGqKCJoidfhU6eAgn9Nq+N6f4VEhbjXNEA+tgcAxlTQgGLYZtyaRR
 WESQ==
X-Gm-Message-State: AJIora8MjjnSN3Oqy3FmBeYN+JnAMayKFDmd5+NaDA7VHHxm+zj9dWIZ
 +9b6qsK1hLEMQdKAAas9c12tifRr/ukD17g+MtI=
X-Google-Smtp-Source: AGRyM1uwKboyXHtiqj1uHFqFb9BJSoG9rYLgloobGhf3g81UQO0u3jikyOPgFmybtt+5ILMNrsR6hmzz46pfsolzH8c=
X-Received: by 2002:a05:6638:4883:b0:33f:7948:e685 with SMTP id
 ct3-20020a056638488300b0033f7948e685mr12872724jab.138.1658082869800; Sun, 17
 Jul 2022 11:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220717133759.8479-1-khalid.masum.92@gmail.com>
 <3ea0ea90-48bf-ce19-e014-9443d732e831@gmail.com>
In-Reply-To: <3ea0ea90-48bf-ce19-e014-9443d732e831@gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Mon, 18 Jul 2022 00:34:19 +0600
Message-ID: <CAABMjtHiet1_SRvLBhoNxeEh865rwtZCkb510JmFPkHFMd5chQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_core: Use ERR_PTR instead of NULL
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, netdev@vger.kernel.org,
 Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
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

On Sun, Jul 17, 2022 at 10:17 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> Hi Khalid,
>
> Khalid Masum <khalid.masum.92@gmail.com> says:
> > Failure of kzalloc to allocate memory is not reported. Return Error
> > pointer to ENOMEM if memory allocation fails. This will increase
> > readability and will make the function easier to use in future.
> >
> > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> > ---
>
> [snip]
>
> > index a0f99baafd35..ea50767e02bf 100644
> > --- a/net/bluetooth/hci_core.c
> > +++ b/net/bluetooth/hci_core.c
> > @@ -2419,7 +2419,7 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
> >
> >       hdev = kzalloc(alloc_size, GFP_KERNEL);
> >       if (!hdev)
> > -             return NULL;
> > +             return ERR_PTR(-ENOMEM);
> >
>
> This will break all callers of hci_alloc_dev(). All callers expect NULL
> in case of an error, so you will leave them with wrong pointer.

You are right. All callers of hci_alloc_dev() need to be able to handle
the error pointer. I shall send a V2 with all the callers of hci_alloc_dev
handling the ERR_PTR.

> Also, allocation functionS return an error only in case of ENOMEM, so
> initial code is fine, IMO
>

I think it makes the memory allocation error handling look to be a bit
different from what we usually do while allocating memory which is,
returning an error or an error pointer. Here we are returning a NULL
without any context, making it a bit unreadable. So I think returning
an error pointer is better. If I am not mistaken, this also complies with
the return convention:
https://www.kernel.org/doc/htmldocs/kernel-hacking/convention-returns.html

>
> Thanks,
> --Pavel Skripkin


Thanks,
  -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
