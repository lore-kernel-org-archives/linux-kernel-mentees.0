Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2027AC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 18:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F4D812D8;
	Wed, 13 Jul 2022 18:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F4D812D8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X2/7V5MI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MApZa9Y-6DEr; Wed, 13 Jul 2022 18:26:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C821C80AD7;
	Wed, 13 Jul 2022 18:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C821C80AD7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9446BC0035;
	Wed, 13 Jul 2022 18:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1666CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D479F4019C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D479F4019C
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X2/7V5MI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6at5_t79OfOj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:26:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F008340025
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F008340025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:26:03 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id n7so11670957ioo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 11:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Sqm7pmANsIHaXqfjwRbsObZ/W58Kx9DRWdRfmAe//4=;
 b=X2/7V5MIwLm4JpGj1aDm7zBkXaEgM/SANRxXPeGLeUFogJbcatOd8Odf/PFNuUd8D/
 r6JaJ+ndeuGAS2DmWDILAMAImaFDM8speM/BW2+5pHwjTq0tRud/brlKhCITg1rhZvbn
 aGxLV5zl3Z8ulcOQl+Lt77Q9Ptpdio3x5D8ORG6zJBn5w118f6xiU4W/eKDO9UFEYngs
 A9FYcPbXeDjA+OTCD4z9UL3AA4ohH7gtAhpUjyG/veIR85+tw0ml8YVbmT+hFXplDwY5
 /4w8+mqeaMbXIkPWSxW1O9tCet4HTNGhrIkwUZMBVzzXAfda2RtNA1kjXvbZc3+1sVHQ
 EWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Sqm7pmANsIHaXqfjwRbsObZ/W58Kx9DRWdRfmAe//4=;
 b=LmfgdgHMPYHXXvFW18JJm82G7Wzg6CxfTMt0eslC5EIGTMqq2rT7aSrTsJfRzidEQ2
 /mtbAolR4H9PskexQqSAbMFsJyRRzKzQ1V2Iqh4Sr4eORBm+Dgu1d4xF+UNhFMXRZmzC
 +ZpRT6+S7WRv1RLO/X5sM7CJqo7yIrPfVPhsy8Ahzk++JKN1e/mI08sszjCVPhc3vKdq
 NMF+5/3PQyT1rfkPMSFLf1GKlK7EwNIxHX0MFl5hTi6683s8nhn/oVH1A1aQo0Dm+bDI
 0oQ6gPfQPajqPQBZcK6N4C4rKnQ8IFw3QDRO7ltNAv9DlHFOtCACSaHSozR6j4r5FdsB
 PeQQ==
X-Gm-Message-State: AJIora95TyyiCX1dmIOAeEVfcjRfh5RZ4T5g6r4g4wCJw8kcgehRqSm1
 FHPVoTDRUzeUR36tDoL+gLxLcZ/W940hDC3a/oo=
X-Google-Smtp-Source: AGRyM1vETpob2+qvOtJHHWx50SkIdyowa/dHUC2xBLlnnVMJ2KiZlCYmH57hwc7560OGCnlULD0w0bUwWjAWsGdfrxA=
X-Received: by 2002:a05:6602:2c89:b0:67b:7e8c:11c1 with SMTP id
 i9-20020a0566022c8900b0067b7e8c11c1mr2505211iow.101.1657736763055; Wed, 13
 Jul 2022 11:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220713063204.6294-1-khalid.masum.92@gmail.com>
 <20220713063204.6294-2-khalid.masum.92@gmail.com>
 <20220713111637.7eca089c@kernel.org>
In-Reply-To: <20220713111637.7eca089c@kernel.org>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Thu, 14 Jul 2022 00:25:52 +0600
Message-ID: <CAABMjtEnPa2PWPJ0SsGVLZjGqO8V=0ajsY9A1ZAdNpmEW5sjTw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] net: kcm: Use sk_psock size for kcm_psock_cache
To: Jakub Kicinski <kuba@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Nikolay Aleksandrov <nikolay@nvidia.com>,
 syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>,
 Stefano Garzarella <sgarzare@redhat.com>
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

On Thu, Jul 14, 2022 at 12:16 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Wed, 13 Jul 2022 12:32:04 +0600 Khalid Masum wrote:
> > `struct sock` has a member `sk_user_data`, which got its memory allocated
> > in `kcm_attach` by `kcm_psock_cache` with the size of `kcm_psock`. Which
> > is not enough when the member is used as `sk_psock` causing out of bound
> > read.
> >
> > Use `sk_psock` size to allocate memory instead for `sk_user_data`.
> >
> > Reported-by: syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com
> > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
>
> Odd CC list, it looks like a netdev problem but netdev@ is not copied.

I am sorry for the inconvenience. I resent the patch with netdev in CC here:
https://lore.kernel.org/netdev/20220713181324.14228-2-khalid.masum.92@gmail.com/

> We had an other parson looking at this on netdev. Is this happening
> when legit kernel socket gets mixed with BPF sockmap?
>
> Does this fix work?
I will take a look at it.
> https://lore.kernel.org/netdev/165030056960.5073.6664402939918720250.stgit@oracle-102.nfsv4.dev/

Thanks,
Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
