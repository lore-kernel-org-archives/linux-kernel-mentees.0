Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F7AC83F2C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 Sep 2023 17:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD6D441DA5;
	Sat,  2 Sep 2023 17:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD6D441DA5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Rk/jRXya
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCSnQpLF7tZO; Sat,  2 Sep 2023 17:56:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0D1C541BEA;
	Sat,  2 Sep 2023 17:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1C541BEA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0FF9C0039;
	Sat,  2 Sep 2023 17:56:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11A50C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Sep 2023 17:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9C2A4002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Sep 2023 17:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9C2A4002B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Rk/jRXya
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8OzK48_EUku
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Sep 2023 17:56:24 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D0ED40004
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Sep 2023 17:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D0ED40004
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bcb89b476bso1322761fa.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 02 Sep 2023 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693677382; x=1694282182;
 darn=lists.linuxfoundation.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0PNMIT53jqnqCkdGIWqNLX3s9WsCwLdrTaQkYedVazY=;
 b=Rk/jRXya4c4iel6GzEm7L1DtalKSXFZwddew1So4Bjo+RDs4R8D/tO6krSJ+OKZRlr
 1ZXh1A4pE6sCAAWTg3EsKPydvwNsNnZat8cbVEXWd993tHXj7YTp/f6odDjEVSC5SFKh
 5p+PvtjQF9PSafxxpEkkYB18RTWVojRK+HtDSCzLImz3nD/SF1cIdMSaxCso7mnq+TYs
 GDHNDU5x9F+3kBzSjvOs9ipZEAclHB7jtO0Q7qjYEA1LgeKEmVvtXAcdijQC8aXdyw/p
 6mAYFCAAx2o2DZ9v2aL9Fy5TGJzrvtd6bdJk/EXucWmMrYgNhbBr7kaw+exstaYpBjz3
 em5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693677382; x=1694282182;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0PNMIT53jqnqCkdGIWqNLX3s9WsCwLdrTaQkYedVazY=;
 b=YLwzAxM9rmqzzqVdRrK62iAmMDKiadHZtPztDFUfhO5vJsjHhbs1hthoovJdsCaVEY
 j+q86OIbWNmBmTwvefIivpYgGiSAI9YXnqxB+RF8PdYzhQAt2SqPXGFKO8+eBYe7YlLT
 ZZWnWfaWA+j7ZFrzFgL7P7i5gtoeXkIkcVvS25AGp2ncI5hzNjzG30GAiYwf2t674dT6
 I39FFqPCKf5RsfZJg9doMjH39B6R0shvkJj6dzWRCgHLGO/Rg6FWIRmTJaz+xfP2Lfol
 V8QCdNIYWjVHl3MHNysTdYK9/37j5E7Q4LuFqoQz/toRMbO7usgH5rb7lS2OAn2fxMmH
 s+dA==
X-Gm-Message-State: AOJu0YyTxMlfdBJvvrdN04wE0JPjQuVCQnfAPfC34cdUJxkeBh1I2QLD
 Voz5GwuoNW9VzogoIIvRBax1WYOcqgQUwH+NHHM=
X-Google-Smtp-Source: AGHT+IGIskaCunEpgo6Gp1yLUnXyF6aG0RELwPvcQXWbOlQeEX8/gG9mcK91q36KZJ2dxvGNp3MJqRBtp+KGhKVaadg=
X-Received: by 2002:a2e:3c02:0:b0:2b6:e0b5:b76d with SMTP id
 j2-20020a2e3c02000000b002b6e0b5b76dmr3668012lja.45.1693677381683; Sat, 02 Sep
 2023 10:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230830074401.7696-1-coolrrsh@gmail.com>
In-Reply-To: <20230830074401.7696-1-coolrrsh@gmail.com>
From: Rajeshwar Shinde <coolrrsh@gmail.com>
Date: Sat, 2 Sep 2023 23:26:09 +0530
Message-ID: <CA+VNjV0pkR7w5Z_z8wS8WxckfSJ43sN8rGkWO6nxzYNHL4U46Q@mail.gmail.com>
Subject: Re: [PATCH v5] media: gspca: cpia1: shift-out-of-bounds in set_flicker
To: hverkuil@xs4all.nl, mchehab@kernel.org, slark_xiao@163.com, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
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
Content-Type: multipart/mixed; boundary="===============4469338752399031025=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4469338752399031025==
Content-Type: multipart/alternative; boundary="000000000000b30edf060463fe6d"

--000000000000b30edf060463fe6d
Content-Type: text/plain; charset="UTF-8"

Remainder

On Wed, 30 Aug, 2023, 1:14 pm , <coolrrsh@gmail.com> wrote:

> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
>
> Syzkaller reported the following issue:
> UBSAN: shift-out-of-bounds in drivers/media/usb/gspca/cpia1.c:1031:27
> shift exponent 245 is too large for 32-bit type 'int'
>
> When the value of the variable "sd->params.exposure.gain" exceeds the
> number of bits in an integer, a shift-out-of-bounds error is reported. It
> is triggered because the variable "currentexp" cannot be left-shifted by
> more than the number of bits in an integer. In order to avoid invalid
> range during left-shift, the conditional expression is added.
>
>
> Reported-by: syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
> Closes:
> https://lore.kernel.org/all/20230818164522.12806-1-coolrrsh@gmail.com
> Link: https://syzkaller.appspot.com/bug?extid=e27f3dbdab04e43b9f73
> Signed-off-by
> <https://syzkaller.appspot.com/bug?extid=e27f3dbdab04e43b9f73Signed-off-by>:
> Rajeshwar R Shinde <coolrrsh@gmail.com>
> ---
> v1->v2
> Changed the patch. Instead of avoiding shift operation for invalid
> input of 'exposure.gain', throw an error for invalid range.
> v2->v3
> Changed the commit message details
> v3->v4
> Removed the trailing spaces in commit message
> v4->v5
> Replaced the hardcoded value with inbuilt macro
> ---
>  drivers/media/usb/gspca/cpia1.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/usb/gspca/cpia1.c
> b/drivers/media/usb/gspca/cpia1.c
> index 46ed95483e22..5f5fa851ca64 100644
> --- a/drivers/media/usb/gspca/cpia1.c
> +++ b/drivers/media/usb/gspca/cpia1.c
> @@ -18,6 +18,7 @@
>
>  #include <linux/input.h>
>  #include <linux/sched/signal.h>
> +#include <linux/bitops.h>
>
>  #include "gspca.h"
>
> @@ -1028,6 +1029,8 @@ static int set_flicker(struct gspca_dev *gspca_dev,
> int on, int apply)
>                         sd->params.exposure.expMode = 2;
>                         sd->exposure_status = EXPOSURE_NORMAL;
>                 }
> +               if (sd->params.exposure.gain >= BITS_PER_TYPE(currentexp))
> +                       return -EINVAL;
>                 currentexp = currentexp << sd->params.exposure.gain;
>                 sd->params.exposure.gain = 0;
>                 /* round down current exposure to nearest value */
> --
> 2.25.1
>
>

--000000000000b30edf060463fe6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Remainder=C2=A0</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, 30 Aug, 2023, 1:14 pm , &lt;<a hre=
f=3D"mailto:coolrrsh@gmail.com">coolrrsh@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Rajeshwar R Shinde &lt;<a href=3D"mail=
to:coolrrsh@gmail.com" target=3D"_blank" rel=3D"noreferrer">coolrrsh@gmail.=
com</a>&gt;<br>
<br>
Syzkaller reported the following issue:<br>
UBSAN: shift-out-of-bounds in drivers/media/usb/gspca/cpia1.c:1031:27<br>
shift exponent 245 is too large for 32-bit type &#39;int&#39;<br>
<br>
When the value of the variable &quot;sd-&gt;params.exposure.gain&quot; exce=
eds the<br>
number of bits in an integer, a shift-out-of-bounds error is reported. It<b=
r>
is triggered because the variable &quot;currentexp&quot; cannot be left-shi=
fted by<br>
more than the number of bits in an integer. In order to avoid invalid<br>
range during left-shift, the conditional expression is added.<br>
<br>
<br>
Reported-by: <a href=3D"mailto:syzbot%2Be27f3dbdab04e43b9f73@syzkaller.apps=
potmail.com" target=3D"_blank" rel=3D"noreferrer">syzbot+e27f3dbdab04e43b9f=
73@syzkaller.appspotmail.com</a><br>
Closes: <a href=3D"https://lore.kernel.org/all/20230818164522.12806-1-coolr=
rsh@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore=
.kernel.org/all/20230818164522.12806-1-coolrrsh@gmail.com</a><br>
Link: <a href=3D"https://syzkaller.appspot.com/bug?extid=3De27f3dbdab04e43b=
9f73Signed-off-by" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
syzkaller.appspot.com/bug?extid=3De27f3dbdab04e43b9f73<br>
Signed-off-by</a>: Rajeshwar R Shinde &lt;<a href=3D"mailto:coolrrsh@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">coolrrsh@gmail.com</a>&gt;<br>
---<br>
v1-&gt;v2<br>
Changed the patch. Instead of avoiding shift operation for invalid<br>
input of &#39;exposure.gain&#39;, throw an error for invalid range.<br>
v2-&gt;v3<br>
Changed the commit message details<br>
v3-&gt;v4<br>
Removed the trailing spaces in commit message<br>
v4-&gt;v5<br>
Replaced the hardcoded value with inbuilt macro<br>
---<br>
=C2=A0drivers/media/usb/gspca/cpia1.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia=
1.c<br>
index 46ed95483e22..5f5fa851ca64 100644<br>
--- a/drivers/media/usb/gspca/cpia1.c<br>
+++ b/drivers/media/usb/gspca/cpia1.c<br>
@@ -18,6 +18,7 @@<br>
<br>
=C2=A0#include &lt;linux/input.h&gt;<br>
=C2=A0#include &lt;linux/sched/signal.h&gt;<br>
+#include &lt;linux/bitops.h&gt;<br>
<br>
=C2=A0#include &quot;gspca.h&quot;<br>
<br>
@@ -1028,6 +1029,8 @@ static int set_flicker(struct gspca_dev *gspca_dev, i=
nt on, int apply)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sd-&gt;params.exposure.expMode =3D 2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sd-&gt;exposure_status =3D EXPOSURE_NORMAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sd-&gt;params.e=
xposure.gain &gt;=3D BITS_PER_TYPE(currentexp))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentexp =3D curr=
entexp &lt;&lt; sd-&gt;params.exposure.gain;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sd-&gt;params.expos=
ure.gain =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* round down curre=
nt exposure to nearest value */<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000b30edf060463fe6d--

--===============4469338752399031025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4469338752399031025==--
