Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78973C83F11
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Aug 2023 13:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 035BE402E8;
	Sun, 27 Aug 2023 13:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 035BE402E8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TkXJhscQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TsaqM0QLxEBd; Sun, 27 Aug 2023 13:50:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C7ACF40323;
	Sun, 27 Aug 2023 13:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7ACF40323
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F2EFC0071;
	Sun, 27 Aug 2023 13:50:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C18AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 13:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAA08812B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 13:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAA08812B1
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TkXJhscQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a64iT3971m64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 13:50:13 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F01B18127C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 13:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F01B18127C
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5256d74dab9so3279106a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Aug 2023 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693144211; x=1693749011;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AvX5n6+o6iZ5rRAlpgQKtcIXB66UaQ/AS97agnleQ9w=;
 b=TkXJhscQg7APFcnLhNcb0hF71eEbpFCNlQvbooGOgdXZnyZVZjwQ3BANfWGsidr4TV
 FX0PFaMfRbKxNRKq83qMpoRWFKOuEeb4VvpZVeBltczndQpIt627VxMFKBKy1R+h4L4b
 4q8kq/dVyNjtAUV1LiBBeMrY67bg08yL3ZxuTUKTsf53X6UvjwfKviWEFIDHw6UfBt5f
 IFNadAhmST/rayWD1zXVN4IAHFxn6DRU9P5H4d1kHT3enmDm86FBNlEW+Tb83QT/2bCv
 QkxhP4UUHOTDOURsLxQu63Ng1Fn7rqo89Xi8HSD9iuJD8qIOKQHTAAx97J4Gu3RHaLEV
 oASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693144211; x=1693749011;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AvX5n6+o6iZ5rRAlpgQKtcIXB66UaQ/AS97agnleQ9w=;
 b=LkaIXqrkDSK6sYEj8bs5bcVKtmCRkiFVNDblxPIX3muds+ZEWgA6Z9fq6Ex8gyqlxY
 XNOMLT//2izyORt1mYdlmmn4jP77tkzYr50+uGlQdmTDM8fh+yKk1ghnCF0kTAHNVAaA
 ZkA20eDgUeyIpWsZbfm9ykyZM+wlQle4mxPnghZiEwLh3IrPtKm/b9NAwabR4aY/zE4t
 H++Q8ywtp45yz1Sl/YhUYb5t5YvsM/kpuuERwEUqWUO6OHsoOH30Mwb6QfClMcE94ofP
 cG5UA7O/c9KdRnLo/2bfds8xjYRokfGpGijbC255XAuVW0ZBTGUl8MjZrk0QJYMGgmyP
 cWVA==
X-Gm-Message-State: AOJu0Yw63m/Jjps/I5yER4gvTGTsDT8th2NxY3Qh9moccCW7YDGqVbI/
 QQNMdpdYbQQ3jp/D14SbajHuyTFZZQCo7x/3Tf8=
X-Google-Smtp-Source: AGHT+IEhQTjBUycCwkyrc3HGBOmXkX9aN+95RY12e1F2MoYDDmXEQNZT0whSCQYh6FZ/R041Jd8FxDQa4ZuED/49AlU=
X-Received: by 2002:aa7:d502:0:b0:521:7ab6:b95d with SMTP id
 y2-20020aa7d502000000b005217ab6b95dmr19394174edq.29.1693144210761; Sun, 27
 Aug 2023 06:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230813132203.139580-1-coolrrsh@gmail.com>
In-Reply-To: <20230813132203.139580-1-coolrrsh@gmail.com>
From: Rajeshwar Shinde <coolrrsh@gmail.com>
Date: Sun, 27 Aug 2023 19:19:58 +0530
Message-ID: <CA+VNjV3rGD9jLors2dySK2aKUO+Ywa9YTi9AG1OXFWvdUC5X5Q@mail.gmail.com>
Subject: Re: [PATCH] dma: device: Remove redundant code
To: fenghua.yu@intel.com, dave.jiang@intel.com, vkoul@kernel.org, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============4910113363076080245=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4910113363076080245==
Content-Type: multipart/alternative; boundary="0000000000003c69f90603e7dbc8"

--0000000000003c69f90603e7dbc8
Content-Type: text/plain; charset="UTF-8"

Remainder

On Sun, 13 Aug, 2023, 6:52 pm , <coolrrsh@gmail.com> wrote:

> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
>
> dma_alloc_coherent function already zeroes the array 'addr'.
> So, memset function call is not needed.
>
> This fixes warning such as:
> drivers/dma/idxd/device.c:783:8-26:
> WARNING: dma_alloc_coherent used in addr already zeroes out memory,
> so memset is not needed.
>
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> ---
>  drivers/dma/idxd/device.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
> index 5abbcc61c528..7c74bc60f582 100644
> --- a/drivers/dma/idxd/device.c
> +++ b/drivers/dma/idxd/device.c
> @@ -786,8 +786,6 @@ static int idxd_device_evl_setup(struct idxd_device
> *idxd)
>                 goto err_alloc;
>         }
>
> -       memset(addr, 0, size);
> -
>         spin_lock(&evl->lock);
>         evl->log = addr;
>         evl->dma = dma_addr;
> --
> 2.25.1
>
>

--0000000000003c69f90603e7dbc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Remainder=C2=A0</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sun, 13 Aug, 2023, 6:52 pm , &lt;<a hre=
f=3D"mailto:coolrrsh@gmail.com">coolrrsh@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Rajeshwar R Shinde &lt;<a href=3D"mail=
to:coolrrsh@gmail.com" target=3D"_blank" rel=3D"noreferrer">coolrrsh@gmail.=
com</a>&gt;<br>
<br>
dma_alloc_coherent function already zeroes the array &#39;addr&#39;.<br>
So, memset function call is not needed. <br>
<br>
This fixes warning such as:<br>
drivers/dma/idxd/device.c:783:8-26:<br>
WARNING: dma_alloc_coherent used in addr already zeroes out memory,<br>
so memset is not needed.<br>
<br>
Signed-off-by: Rajeshwar R Shinde &lt;<a href=3D"mailto:coolrrsh@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">coolrrsh@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/dma/idxd/device.c | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c<br>
index 5abbcc61c528..7c74bc60f582 100644<br>
--- a/drivers/dma/idxd/device.c<br>
+++ b/drivers/dma/idxd/device.c<br>
@@ -786,8 +786,6 @@ static int idxd_device_evl_setup(struct idxd_device *id=
xd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_alloc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(addr, 0, size);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock(&amp;evl-&gt;lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 evl-&gt;log =3D addr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 evl-&gt;dma =3D dma_addr;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000003c69f90603e7dbc8--

--===============4910113363076080245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4910113363076080245==--
