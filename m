Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFBECCA483
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jul 2022 10:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11A0640227;
	Sat, 23 Jul 2022 10:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11A0640227
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=icTe+7uD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjjk7P9nYGBd; Sat, 23 Jul 2022 10:54:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1D24640AE0;
	Sat, 23 Jul 2022 10:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D24640AE0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8C0AC0035;
	Sat, 23 Jul 2022 10:54:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4ECCC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 10:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F88E416F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 10:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F88E416F8
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=icTe+7uD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JabB3wKJ4KIX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 10:54:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4938B416D7
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4938B416D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 10:54:15 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id r70so5292033iod.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YL9wCFcJM1S8aQnJbcoxTMo6SNRCJK/vq4C87hsQwpU=;
 b=icTe+7uDRr7EXvhDnSXmpnK61DUvZdhBUV1EG52pxLeRH5b4Fp++sDQy0J4X6UI8Eh
 uGZ7po3LSPCe4MqV6mvQgXp1tKpRTebwdxMFJqJnbVMiOOXYa56IKetWOYEVjupA+mbG
 twO9t0rDvPLv/LnZwpC1PRjDAm98sUoNPLu5bilwe8uwhUF/REZaKCxGvUR+DG4GwupY
 96lp4Ne9iS5xiYgOuBNA8rdG3KGBiukHG3Dv1+RXor7fuWoy4onvrQzoGHG68D12evdN
 qopZqWfKVBQL30UA+lFKUymH1m/li+cOtP1l6Nh3OB+i2U+cnnDaysukc+2hdfwqKlvW
 HKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YL9wCFcJM1S8aQnJbcoxTMo6SNRCJK/vq4C87hsQwpU=;
 b=uqATfd4dr7HGR27yQbPgrSqkBrrBUfb+TvrRO62LzbTVugtyrl8L6Vj+99D7o3p9bE
 dovllkQmHMnVgrJr6XC0BtcPW3gEeg2ErjjHorjXLRPlRvSJhH1OQL/F1uFmMp5EBD2w
 hoMAxBWvFou2V3L0QA7m/V32ygTPuzLBGyvpKGgiPb6yw8zJAbbWquhj/4/62NhKZT1x
 sfA/oYN0BjmZkslk24Yo3rkZyv0TLqAvvUGOZO2o2r0eUPwg2f3E9INcl6qIuOr+IUVh
 4OoulQw6FNsqO4c7AWsSGbxQao6QgjTo/bB/TM4CGgpuuSgW6yrJK3rBS9tu+TbHbmG/
 3b4g==
X-Gm-Message-State: AJIora+9UF5P89c3+is/mpO3tLskan2QAGnpLpconvg0KM72XwB8QE/h
 i1uiDUTLo0zc8ZC7hXpHCFVq2ZbMSBi3XWK+oZY=
X-Google-Smtp-Source: AGRyM1szkUECVWGAESedupd4SaLkQ477HkV5GtL8kMwaKob8JG7T9RM44BdYJtK/AyD8uGaMcylKdTpDzbiO3Mi3N/w=
X-Received: by 2002:a05:6638:1602:b0:341:3e1f:d862 with SMTP id
 x2-20020a056638160200b003413e1fd862mr1696518jas.24.1658573654111; Sat, 23 Jul
 2022 03:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220717133759.8479-1-khalid.masum.92@gmail.com>
 <3ea0ea90-48bf-ce19-e014-9443d732e831@gmail.com>
 <CAABMjtHiet1_SRvLBhoNxeEh865rwtZCkb510JmFPkHFMd5chQ@mail.gmail.com>
 <CABBYNZJVv=pJv60P6fYZh65JU+BV5agGfXEh4VenxELEXqtDsA@mail.gmail.com>
In-Reply-To: <CABBYNZJVv=pJv60P6fYZh65JU+BV5agGfXEh4VenxELEXqtDsA@mail.gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Sat, 23 Jul 2022 16:54:03 +0600
Message-ID: <CAABMjtEDHLRGVHrjPaCyuTX0SBODVcS+U+G+xS+YQH=23zk=hg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_core: Use ERR_PTR instead of NULL
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
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

On Tue, Jul 19, 2022 at 5:04 AM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Khalid,
>
> On Sun, Jul 17, 2022 at 11:34 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
> >
> > On Sun, Jul 17, 2022 at 10:17 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
> > >
> > > Hi Khalid,
> > >
> > > Khalid Masum <khalid.masum.92@gmail.com> says:
> > > > Failure of kzalloc to allocate memory is not reported. Return Error
> > > > pointer to ENOMEM if memory allocation fails. This will increase
> > > > readability and will make the function easier to use in future.
> > > >
> > > > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> > > > ---
> > >
> > > [snip]
> > >
> > > > index a0f99baafd35..ea50767e02bf 100644
> > > > --- a/net/bluetooth/hci_core.c
> > > > +++ b/net/bluetooth/hci_core.c
> > > > @@ -2419,7 +2419,7 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
> > > >
> > > >       hdev = kzalloc(alloc_size, GFP_KERNEL);
> > > >       if (!hdev)
> > > > -             return NULL;
> > > > +             return ERR_PTR(-ENOMEM);
> > > >
> > >
> > > This will break all callers of hci_alloc_dev(). All callers expect NULL
> > > in case of an error, so you will leave them with wrong pointer.
> >
> > You are right. All callers of hci_alloc_dev() need to be able to handle
> > the error pointer. I shall send a V2 with all the callers of hci_alloc_dev
> > handling the ERR_PTR.
> >
> > > Also, allocation functionS return an error only in case of ENOMEM, so
> > > initial code is fine, IMO
> > >
>
> If there just a single error like ENOMEM then Id say this is fine,
> just as it is fine for kzalloc.
>
> > I think it makes the memory allocation error handling look to be a bit
> > different from what we usually do while allocating memory which is,
> > returning an error or an error pointer. Here we are returning a NULL
> > without any context, making it a bit unreadable. So I think returning
> > an error pointer is better. If I am not mistaken, this also complies with
> > the return convention:
> > https://www.kernel.org/doc/htmldocs/kernel-hacking/convention-returns.html
>
> Not sure if that would apply to code that is basically a wrapper of kzalloc.

I got you.
> > > Thanks,
> > > --Pavel Skripkin
> >
> >
> > Thanks,
> >   -- Khalid Masum
>
>
>
> --
> Luiz Augusto von Dentz

Thanks,
  -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
