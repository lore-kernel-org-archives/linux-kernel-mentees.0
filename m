Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BA9C83F15
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Aug 2023 07:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA62418A6;
	Wed, 30 Aug 2023 07:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AA62418A6
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=L1lBMNMk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzwsXDIDoEDE; Wed, 30 Aug 2023 07:38:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CD87941874;
	Wed, 30 Aug 2023 07:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD87941874
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 802E7C0071;
	Wed, 30 Aug 2023 07:38:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77A05C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 07:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FC9560B8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 07:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC9560B8C
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=L1lBMNMk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7Lxh4G3hf11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 07:38:46 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C72260743
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 07:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C72260743
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-522dd6b6438so6913068a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Aug 2023 00:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693381124; x=1693985924;
 darn=lists.linuxfoundation.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1dk7xGJK83hyWjcpCyzJn8lRhHcIoe+hesClBIBXzv8=;
 b=L1lBMNMk+0e1gzzdB1emQqAy6SLl1Lg2hHiugrm+KrOb6O8sRApj0JfQPbn8fGoSsF
 LAUwhLTbfBAJliddwkEaLkoExR6sc9F9qQZJ2y1m75pf0E/h/zMK0EaUFn3zzrl819Yq
 5NP2eUfJFg1PYNQzMd0UVR3j3PzLqxgjzEJTT59K9WdtE50BMVsZpsjynbW/aF0hjKd9
 5+MCHE+l58rg02UcGmnYlJCvr3PXAEk2cO4WksY0cojDzMQONgbikaBXJzXFWBfbx7Sc
 MGgVw7s3v/mVaXTEHoWM3Km7U6XxFwDcqSWHamSEVTULJYzDPs6rygBt2eOoMhwQWfO3
 Vtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693381124; x=1693985924;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1dk7xGJK83hyWjcpCyzJn8lRhHcIoe+hesClBIBXzv8=;
 b=iIWQCO44Xsh4PBTEaIaRXO8VHRk8EcE2v/T85e1/CZ8tL53pebkAoZcBvCcdIG8P0K
 V2esSXHZbW7DYs3TVGMZbBLuGmEFWKvcSRlvukCT+GLVZbkbAAweNrBYQNuauLouj8T/
 Oe4GR1gfMPR2WFlfbD69jYbjqc02V40+PEWUIpRM03dHz0Z4dIyK4yHIcIgePHmxvE9L
 RP6jB8hUYWANyDbwgWh7yg7W8P5waKGIKt1enImKtyrMGEA6jSJaFUCeClimKoxLeYIF
 hj1O/FOSrGh5MM10kU7Qi/H9Bm1BcHLbIakbyxOCo9b7Zu+vEMxOTfTmplyk9H0VZjBX
 vgUA==
X-Gm-Message-State: AOJu0YwRcCcIhseyoUzBx1wiumlLHZtOg4OJDHK//OVzpb5tLYz676Bp
 k3CNiV33rW1eXorqCXO/mRz+mo5tibilJV8eYCY=
X-Google-Smtp-Source: AGHT+IG4Gk/uaC5KyIQThpYGpJugqeHYPw0OlozhZRjMmnXMLV3PgkmVNw9y5anF/uSkzsKCRzVHSq+8t0he1qHwXDA=
X-Received: by 2002:a05:6402:1510:b0:52a:46a7:4592 with SMTP id
 f16-20020a056402151000b0052a46a74592mr1236120edw.3.1693381123739; Wed, 30 Aug
 2023 00:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230827185348.34768-1-coolrrsh@gmail.com>
In-Reply-To: <20230827185348.34768-1-coolrrsh@gmail.com>
From: Rajeshwar Shinde <coolrrsh@gmail.com>
Date: Wed, 30 Aug 2023 13:08:32 +0530
Message-ID: <CA+VNjV2Z9WogdAuucaFEzPKUX5iyJEm1iRSm=sr_4dX+DqFKbw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7546608192584158672=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7546608192584158672==
Content-Type: multipart/alternative; boundary="00000000000059932606041f045a"

--00000000000059932606041f045a
Content-Type: text/plain; charset="UTF-8"

remainder

On Mon, 28 Aug 2023 at 00:23, <coolrrsh@gmail.com> wrote:

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

--00000000000059932606041f045a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">remainder<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 28 Aug 2023 at 00:23, &lt;<a href=3D"=
mailto:coolrrsh@gmail.com">coolrrsh@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">From: Rajeshwar R Shinde &lt;<=
a href=3D"mailto:coolrrsh@gmail.com" target=3D"_blank">coolrrsh@gmail.com</=
a>&gt;<br>
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
potmail.com" target=3D"_blank">syzbot+e27f3dbdab04e43b9f73@syzkaller.appspo=
tmail.com</a><br>
Closes: <a href=3D"https://lore.kernel.org/all/20230818164522.12806-1-coolr=
rsh@gmail.com" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org=
/all/20230818164522.12806-1-coolrrsh@gmail.com</a><br>
Link: <a href=3D"https://syzkaller.appspot.com/bug?extid=3De27f3dbdab04e43b=
9f73Signed-off-by" rel=3D"noreferrer" target=3D"_blank">https://syzkaller.a=
ppspot.com/bug?extid=3De27f3dbdab04e43b9f73<br>
Signed-off-by</a>: Rajeshwar R Shinde &lt;<a href=3D"mailto:coolrrsh@gmail.=
com" target=3D"_blank">coolrrsh@gmail.com</a>&gt;<br>
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

--00000000000059932606041f045a--

--===============7546608192584158672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7546608192584158672==--
