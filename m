Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9287CC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jul 2022 23:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26DFC6102A;
	Mon, 18 Jul 2022 23:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26DFC6102A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eu+8mAms
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCQPvPC0EGc2; Mon, 18 Jul 2022 23:04:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 21BB560EA3;
	Mon, 18 Jul 2022 23:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21BB560EA3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEF81C0035;
	Mon, 18 Jul 2022 23:04:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5723BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jul 2022 23:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 295E5410BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jul 2022 23:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 295E5410BB
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eu+8mAms
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDh7iHM7AKM9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jul 2022 23:04:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03A2410A9
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C03A2410A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jul 2022 23:04:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t1so21877739lft.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jul 2022 16:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TZUTBE8JOO+dBwswBQU/UW48YDxWzcOqBKIIatUeRxg=;
 b=eu+8mAmsNBdDm3xB9tJ7qWbNXhdC6joRhpKHQAJ4NU3Mky13rD9L25sbhWt9DuIotI
 gUojvdBW5A0Yn/MC4O+GhB63tm4n97gegK8HpEZRkzwH2RBhJ3qbgnumGnjVrlCvsJR7
 2tNXRis6jsm9duhk3z7u+9TVJuxAzDeFkQhctki+wu7c0eWrDms/Ckpf9yes50sGz5ZS
 iqzCE8Mh9LilppMXKYD8OidSUpoV8K4oY90b0RKIZ/yMBMgmavyjBG0D5sM+o8aKrngS
 gmmNcREgRh2MPSjA60ICVGr0N2G66g230+VXfqZ4m8y7QeVjVf+NB5gcvz50Ti9awr+y
 lg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TZUTBE8JOO+dBwswBQU/UW48YDxWzcOqBKIIatUeRxg=;
 b=cPd6vcldtN6xJwMcDB+KF3rPuS9XA3fkOcNbXeIXSx3TJ8P8d2TodxEAN5hWRa4fLQ
 NU734xfZ9L68qyA+PcU+582sgoP+2nSvmjfntExKHMmooONNv07LW+P7GHd8T0hQpm6I
 PdEtf2A/a93Ws4LLiblPLvqAwtCTEVM9FQriYcbmTB4NYrX+inGI4mSZ/qIPl/tAURGi
 nwvrapCo7sNEyMh9buoi+hdI1KTJG1Kw9EQTG08Jh1OHDjyhcaYyYFN9iOTWLQKOIPay
 DpWIaMM9hSglWaG/azdPW9OYpLc4dgtPthigR2+5MH2KxRdRGgvrawvTltH/9XlxLF7U
 brsg==
X-Gm-Message-State: AJIora+6L3Pyt+YqOXDRl9EArU1mIX7cyStRESRnoEqGbQbbpwW9acKe
 tKrNU7LnNk5jXgeTbFQ7r9vr533L6DhgbSXDZGU=
X-Google-Smtp-Source: AGRyM1u0wBbNmMakHQBA/ZO0hGJZKUbnq/dnkUov8nPUnJv4Mrzha3OP1ESzVnpMYzPJIoYstMUH0d87QXPunDiWZNY=
X-Received: by 2002:a05:6512:3409:b0:489:c549:4693 with SMTP id
 i9-20020a056512340900b00489c5494693mr15228484lfr.26.1658185443502; Mon, 18
 Jul 2022 16:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220717133759.8479-1-khalid.masum.92@gmail.com>
 <3ea0ea90-48bf-ce19-e014-9443d732e831@gmail.com>
 <CAABMjtHiet1_SRvLBhoNxeEh865rwtZCkb510JmFPkHFMd5chQ@mail.gmail.com>
In-Reply-To: <CAABMjtHiet1_SRvLBhoNxeEh865rwtZCkb510JmFPkHFMd5chQ@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 18 Jul 2022 16:03:52 -0700
Message-ID: <CABBYNZJVv=pJv60P6fYZh65JU+BV5agGfXEh4VenxELEXqtDsA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_core: Use ERR_PTR instead of NULL
To: Khalid Masum <khalid.masum.92@gmail.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
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

Hi Khalid,

On Sun, Jul 17, 2022 at 11:34 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
>
> On Sun, Jul 17, 2022 at 10:17 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
> >
> > Hi Khalid,
> >
> > Khalid Masum <khalid.masum.92@gmail.com> says:
> > > Failure of kzalloc to allocate memory is not reported. Return Error
> > > pointer to ENOMEM if memory allocation fails. This will increase
> > > readability and will make the function easier to use in future.
> > >
> > > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> > > ---
> >
> > [snip]
> >
> > > index a0f99baafd35..ea50767e02bf 100644
> > > --- a/net/bluetooth/hci_core.c
> > > +++ b/net/bluetooth/hci_core.c
> > > @@ -2419,7 +2419,7 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
> > >
> > >       hdev = kzalloc(alloc_size, GFP_KERNEL);
> > >       if (!hdev)
> > > -             return NULL;
> > > +             return ERR_PTR(-ENOMEM);
> > >
> >
> > This will break all callers of hci_alloc_dev(). All callers expect NULL
> > in case of an error, so you will leave them with wrong pointer.
>
> You are right. All callers of hci_alloc_dev() need to be able to handle
> the error pointer. I shall send a V2 with all the callers of hci_alloc_dev
> handling the ERR_PTR.
>
> > Also, allocation functionS return an error only in case of ENOMEM, so
> > initial code is fine, IMO
> >

If there just a single error like ENOMEM then Id say this is fine,
just as it is fine for kzalloc.

> I think it makes the memory allocation error handling look to be a bit
> different from what we usually do while allocating memory which is,
> returning an error or an error pointer. Here we are returning a NULL
> without any context, making it a bit unreadable. So I think returning
> an error pointer is better. If I am not mistaken, this also complies with
> the return convention:
> https://www.kernel.org/doc/htmldocs/kernel-hacking/convention-returns.html

Not sure if that would apply to code that is basically a wrapper of kzalloc.

> >
> > Thanks,
> > --Pavel Skripkin
>
>
> Thanks,
>   -- Khalid Masum



-- 
Luiz Augusto von Dentz
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
