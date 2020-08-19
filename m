Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=3.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CF2C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:30:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C4120658
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5i5p2Ch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C4120658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 89E40860AE;
	Wed, 19 Aug 2020 18:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgXQlRT825sZ; Wed, 19 Aug 2020 18:30:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F46986078;
	Wed, 19 Aug 2020 18:30:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17B9DC07FF;
	Wed, 19 Aug 2020 18:30:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03269C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DFD8687E4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4bgBuWnlJ57m
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:30:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4601F87E2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:30:10 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id j23so12454455vsq.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 11:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=pD5VTXKOlkb5ekLG8xMHSsuZ5ZDEEzmDW5+RpFXgZWw=;
 b=i5i5p2ChbVAT48ecZAoW+n0RwQNJ62NKN7/1GXE9aZ7MQ74yTtcejlX5BSDSopdbt4
 gJB5JZpaqjGNZ7YtcdFV27FogVzz5zT1qrfRUiToNbF/qOtjU5Y6rU3Vy69oO9UHNQpj
 Fg5DqX1iXqkOvt1Thgzs/7UM6AVnSnVYRZ9Y1VvuP+DhiiyX/zgWyYu90A8R+cfv+icV
 SfP0jJfDv7U8BxEHqLYhH+6PgIU+vMbXs1f4jAvt+USLMKYgpte7b8FQkYrdPM7Ft5jV
 8Rd6cYuIh4nJbOMc5mqSdSlBGrbsawUe1HZ3glME6OSsGwAXS8hCnGRL0h7t4VOVKCZu
 CmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=pD5VTXKOlkb5ekLG8xMHSsuZ5ZDEEzmDW5+RpFXgZWw=;
 b=ZsyKMOdAR7qbhOP4NC4FggW5mxL5p5uN3WcY9yCfLm7jkyo2LoRjCMxyqA7E5K3hRd
 1HPAJ0H/if4gqjocZKU/99VXts7VbKQVnbMXrQsEdqVF9Mw3q1WkYhhdH5++S7nWzbFT
 6FHLqsLVoq8i/ZIthBiQ1uxcE6xOuBJ/WxUZvgLOJfur/NNFkD2k/3Tj7LkJ4hkRGVLE
 pnVyIt7uJIEIegfN6y3UTLgjIVj0Z7EtxDrBppv2q98kYfq0L4aaldDnppkKoE75GCTn
 myVa2ounA8GIhSQetmu1wJVZhJoU15rQVKFx6PQZw+okUttBlRumjNxHy1y/akriYA9n
 t5SQ==
X-Gm-Message-State: AOAM530B3+BdQjbIx4jK1I11HsCZcXO/QBS9aUt88BV0TMxHFcNQepNP
 JnavMm58X7rm5A5NbPl9X9YSGIL5KqWi2C7Et4Y=
X-Google-Smtp-Source: ABdhPJxfCPlgGfuFdB2R//v1pBGhIjylZ/nx4cmhqJQQnTxIboRr5j7TdsP9rwu/uGJSQtPCHFEIp70fPl4vba6LxQo=
X-Received: by 2002:a67:f1c7:: with SMTP id v7mr15269044vsm.50.1597861809199; 
 Wed, 19 Aug 2020 11:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <CACFir3g8CPiN=63am0aLfEU3n9Ft5+ZQ_qJUHQGqqzj96ePHBA@mail.gmail.com>
 <CACFir3jGNRKgcmdAHYDFeLJeO2mXokG5p6yc0WPS0qwCEKNJ6Q@mail.gmail.com>
 <CAKXUXMx81VxEGEzOX1zhh7ZdGsFGASVMn2Xn9e_MMXyNKjHtRQ@mail.gmail.com>
 <CACFir3jhPhyU1kVkQdzgQ+e4Lq8aqZeT3+dZ6ZsW2b7L9RrBeA@mail.gmail.com>
 <CAKXUXMxqv_bz+FL1Nckq2FD8gMs9Ymmw3j2MukJKsmgX5ambNA@mail.gmail.com>
 <CACFir3iwBLcZoS8UqOy4qvtf8gRaQgbvhHWyCREk4XD-ap+BsQ@mail.gmail.com>
 <CAKXUXMy6waZDaEPWY8g5yyASkoVgCgz6caBqxkZpMMELWOHOcw@mail.gmail.com>
 <CACFir3jUvTFfoF5CxLw3NSAy+bfLx+9qmaJHMoSpFcC0SPsChw@mail.gmail.com>
 <CAKXUXMxJdUiR_u6Kh=5SC-i7yc0fo=2JD_syaEPmQwNHCo57ng@mail.gmail.com>
In-Reply-To: <CAKXUXMxJdUiR_u6Kh=5SC-i7yc0fo=2JD_syaEPmQwNHCo57ng@mail.gmail.com>
From: Jay Rajput <jay24rajput@gmail.com>
Date: Wed, 19 Aug 2020 23:59:58 +0530
Message-ID: <CACFir3i0jt6e=PWn64Hvwg91Lb2i2eNhhqdoPJjAZvmEVvk6Og@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Community Bridge Klever Project
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
Content-Type: multipart/mixed; boundary="===============6651909828573571258=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6651909828573571258==
Content-Type: multipart/alternative; boundary="000000000000899ddb05ad3f311b"

--000000000000899ddb05ad3f311b
Content-Type: text/plain; charset="UTF-8"

>
> The next task is to run coccinelle on the kernel sources. You will find
> documentation on how to set up and run coccinelle in the kernel
> documentation.
>
> I suggest you run coccinelle on the latest kernel source, v5.9-rc1.
>
> Lukas
>
Hello,

I ran the coccinelle, I am attaching the output in a google document.
Please have a look and let me know the further steps:
Document link:
https://docs.google.com/document/d/1ahWouti1FTenrIL92Ra6JXYlWW-9j4KK8qVdh4VvEr0/edit?usp=sharing

Thanks and Regards,
Jay Rajput

--000000000000899ddb05ad3f311b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>The nex=
t task is to run coccinelle on the kernel sources. You will find documentat=
ion on how to set up and run coccinelle in the kernel documentation.<br></d=
iv><div><br></div><div>I suggest you run coccinelle on the latest kernel so=
urce, v5.9-rc1.</div><div><br></div><div>Lukas</div></div></div></blockquot=
e><div>Hello,</div><div><br></div><div>I ran the coccinelle, I am attaching=
 the output in a google document. Please have a look and let me=C2=A0know t=
he further steps:</div><div>Document link:=C2=A0<a href=3D"https://docs.goo=
gle.com/document/d/1ahWouti1FTenrIL92Ra6JXYlWW-9j4KK8qVdh4VvEr0/edit?usp=3D=
sharing">https://docs.google.com/document/d/1ahWouti1FTenrIL92Ra6JXYlWW-9j4=
KK8qVdh4VvEr0/edit?usp=3Dsharing</a></div><div><br></div><div>Thanks and Re=
gards,</div><div>Jay Rajput</div><div>=C2=A0</div></div></div>

--000000000000899ddb05ad3f311b--

--===============6651909828573571258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6651909828573571258==--
