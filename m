Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CB5C001E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 06:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE38461286;
	Wed, 16 Aug 2023 06:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE38461286
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HKNyqBnk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uch0gq4S50Fv; Wed, 16 Aug 2023 06:09:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8DAB660BA7;
	Wed, 16 Aug 2023 06:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DAB660BA7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 659AAC0071;
	Wed, 16 Aug 2023 06:09:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EEB0BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 06:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C9EA4154E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 06:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C9EA4154E
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HKNyqBnk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykSikBjVitdh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 06:09:03 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 713F7400CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 06:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 713F7400CE
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so12859466a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692166141; x=1692770941;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yJ4imLUo9z5T+RXX+UwN0RW/ZnlTkJyLrdircn+T2GY=;
 b=HKNyqBnkar+Pwhl569NhDC1KN0s6b1Ide5CKEh5bp9PFl/Vp6VitkXn7OOx1qKRdQk
 kxbUG6ojeeZtu2fm6XsLU3nAF6PVt1rziGlyeQQW4sLqCnM5wB9vRYW/dhZE77CSWW2h
 BPiorFytWUuo5uj9HlA8wh8iu0Wu9xpl5FWBcF+WOvPFaujQHuC4Z1leGWNLQUtlkPoe
 N0jlPP7QaZpa+RCs/CjJJJj0QrNI+/n+zsXlrU/PprIBaoVi42lBU6/4810hnr3MhbN8
 awG6El5GT+oztLXmLRznyjkJZWkzLQpKJxQBM92oK/n3fouYK/S8D3hu1JX2ITnlLiR5
 cWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692166141; x=1692770941;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yJ4imLUo9z5T+RXX+UwN0RW/ZnlTkJyLrdircn+T2GY=;
 b=GhlcPfD0ibF4ULgcK80ksv6PkvxVZgcYDyzVUJe/nlnY2qb21Zvfm3oT2CZFohLUJ+
 5Py+ctagBd06WWFsubuksE66ihjr0mcNkCaXsk3JI+T4VKcATllFJGvgNOARHuxJlH3n
 U/sJLwWyqwVCwzwXRo4et+2iQHKvbj6u6xcVbhwY5/GPwW3RoH75iYl+hMDkuMZvwTDI
 G8ksI2MtjMXChUK4OARZQ7coiRZ6UALuWFrlJgVRYRDxlQeDi+KJQFyxhWqdgLP/vEWS
 Q1HbkgmxHQwsFjCnJugrXcacTvFhTC1rsLvxmFH4JQyQqcK4B7+cb4GV9iK7l/0pSktS
 M/gQ==
X-Gm-Message-State: AOJu0YyTsVziK49xkDed5NurCC9vCrfF7tQxLO8RT75sS64VYjDyM05N
 uxfzpnJTv0/VtJjE1jACcwLMUJdU8TF3J6REEN8=
X-Google-Smtp-Source: AGHT+IHtZapTBo/31eshoTK9HNboHiv/ES/X87YAP1JspPXbYw1HriDHkFGY4TqC7505znFhKuol6lX0xIw2cDJAnZw=
X-Received: by 2002:a05:6402:2793:b0:51f:ef58:da87 with SMTP id
 b19-20020a056402279300b0051fef58da87mr4042900ede.2.1692166141180; Tue, 15 Aug
 2023 23:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230813141207.150336-1-coolrrsh@gmail.com>
In-Reply-To: <20230813141207.150336-1-coolrrsh@gmail.com>
From: Rajeshwar Shinde <coolrrsh@gmail.com>
Date: Wed, 16 Aug 2023 11:38:48 +0530
Message-ID: <CA+VNjV1=xVyRkvB6RAnLySAOzS=X1XiJihrtiMx3Jmifpdq9ng@mail.gmail.com>
Subject: Re: [PATCH v2] spi: spi-mpc512x-psc: Fix an unsigned comparison that
 can never be negative
To: broonie@kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============9035889931291337747=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============9035889931291337747==
Content-Type: multipart/alternative; boundary="000000000000bf0240060304212e"

--000000000000bf0240060304212e
Content-Type: text/plain; charset="UTF-8"

Please verify this patch.
Thanks & Regards


On Sun, 13 Aug, 2023, 7:42 pm , <coolrrsh@gmail.com> wrote:

> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
>
> In struct mpc512x_psc_spi, the variable 'irq' is declared as an unsigned
> int.
> The comparison of variable 'irq'  with signed int operand is incorrect.
> Also,
> the return value from the call to platform_get_irq(pdev,0) is int and it
> is
> assigned to an unsigned int variable 'irq', thus redeclaring the type of
> variable 'irq' to signed int.
>
> This fixes warning such as:
> drivers/spi/spi-mpc512x-psc.c:493:5-13:
> WARNING: Unsigned expression compared with zero: mps -> irq < 0
>
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
>
> ---
> v1->v2
> changed the commit message
>
> ---
>  drivers/spi/spi-mpc512x-psc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
> index 99aeef28a..5cecca1be 100644
> --- a/drivers/spi/spi-mpc512x-psc.c
> +++ b/drivers/spi/spi-mpc512x-psc.c
> @@ -53,7 +53,7 @@ struct mpc512x_psc_spi {
>         int type;
>         void __iomem *psc;
>         struct mpc512x_psc_fifo __iomem *fifo;
> -       unsigned int irq;
> +       int irq;
>         u8 bits_per_word;
>         u32 mclk_rate;
>
> --
> 2.25.1
>
>

--000000000000bf0240060304212e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Please verify this patch.</div><div dir=
=3D"auto">Thanks &amp; Regards=C2=A0<br><div dir=3D"auto"><br></div></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sun, 13 Aug, 2023, 7:42 pm , &lt;<a href=3D"mailto:coolrrsh@gmail.com">co=
olrrsh@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fro=
m: Rajeshwar R Shinde &lt;<a href=3D"mailto:coolrrsh@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">coolrrsh@gmail.com</a>&gt;<br>
<br>
In struct mpc512x_psc_spi, the variable &#39;irq&#39; is declared as an uns=
igned int.<br>
The comparison of variable &#39;irq&#39;=C2=A0 with signed int operand is i=
ncorrect. Also,<br>
the return value from the call to platform_get_irq(pdev,0) is int and it is=
 <br>
assigned to an unsigned int variable &#39;irq&#39;, thus redeclaring the ty=
pe of <br>
variable &#39;irq&#39; to signed int.<br>
<br>
This fixes warning such as:<br>
drivers/spi/spi-mpc512x-psc.c:493:5-13: <br>
WARNING: Unsigned expression compared with zero: mps -&gt; irq &lt; 0<br>
<br>
Signed-off-by: Rajeshwar R Shinde &lt;<a href=3D"mailto:coolrrsh@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">coolrrsh@gmail.com</a>&gt;<br>
<br>
---<br>
v1-&gt;v2<br>
changed the commit message<br>
<br>
---<br>
=C2=A0drivers/spi/spi-mpc512x-psc.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c<=
br>
index 99aeef28a..5cecca1be 100644<br>
--- a/drivers/spi/spi-mpc512x-psc.c<br>
+++ b/drivers/spi/spi-mpc512x-psc.c<br>
@@ -53,7 +53,7 @@ struct mpc512x_psc_spi {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int type;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem *psc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mpc512x_psc_fifo __iomem *fifo;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 bits_per_word;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 mclk_rate;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000bf0240060304212e--

--===============9035889931291337747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============9035889931291337747==--
