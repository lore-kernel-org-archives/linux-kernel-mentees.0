Return-Path: <SRS0=qNgb=MY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23462C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 22:13:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B0D61040
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 22:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6B0D61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77BFA8380B;
	Sun,  1 Aug 2021 22:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4XZWXXdGwm6; Sun,  1 Aug 2021 22:13:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8FB2C8380E;
	Sun,  1 Aug 2021 22:13:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E9C6C0010;
	Sun,  1 Aug 2021 22:13:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03815C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E77A28380E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6zCwcL86tjp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:13:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43B538380B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:13:00 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id x192so25674888ybe.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Aug 2021 15:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Vc6o5RqNoXYHLsYtnB8tTQMP2EVK4S2YkOCKjQFivI=;
 b=NxHSIWU/cfNPwq+GpV7uvnbzRjTwgHkFCmHrBk4xFoe2zDige0/q8fvXu7iJpZCtk9
 fDzGq2vo61ukhyIZ/KhXiuwxnGkLvm8evUbsAzdTg6Mt4DsqQ6pWhi9xG0twXuvNZSo4
 JL7tKm1orxhaDcVWzfUyqovU3Kn1BHX1loTgkaG79O5Jub4nHjN3Ptxp6tIKzMy1B3Eb
 wNOgizfLKlgbVbvce4TY+KWsqp/KCEmySFCEVZ7KlYMxuJ6nA815i8H4iZeQWDJgB8rB
 dNlZ4oqJBhaCSn7iE7H3Ocs5MW5/6Tc4MX0M3S//GPtfLKpyzN0qMhwdJ7KnlAss0hzK
 o1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Vc6o5RqNoXYHLsYtnB8tTQMP2EVK4S2YkOCKjQFivI=;
 b=NcyxozyLids7d9zIp/jkeKr4HavMwQVey9evmoMsOlJaT5julxcx4WTpsc6dUH8SpH
 kX9wRztTVcGKNoWbRhxkqs74CCU2BS9AukjU3j7l0Pqq1EfEYA+TqMoDembGiDARJKWG
 Q2olXxdODP9vhvfKbWsh/TUpB6Bsdj5JZTejRSpJBMz/gRcsTrBvKT2e8h5m0ozVkhoj
 GDofA5Q3vcGomphh/vjVpGDXiEX9tvgy3rz/Jfvf7JPfM80C6m8CF8xpBj0K1RyvPcsA
 NPEC3r+JPUazfoZhr8k+St1qpt4WBIO4gxfAIkJZJUQ6hojEqfFK5lMB0DCF6kpuZ0DQ
 yI6g==
X-Gm-Message-State: AOAM533Rao3mMY2fiBuLsNyV6nRRIzSCWul1VkhPfBXbRVOjMPywoF/k
 ShXpStFKLdr6WltieoEI8RK9AkMMZfX+9qitHkI=
X-Google-Smtp-Source: ABdhPJyFl3a5ER6+P2BFG3Sne2i98Py3pICOcgG83yC/XNjHRsqzYDdAirBteSXywUIiHdgNDQNnjX5ikXZU/ekW/NA=
X-Received: by 2002:a25:a565:: with SMTP id h92mr16727379ybi.423.1627855979229; 
 Sun, 01 Aug 2021 15:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210801220453.17028-1-rahulbalaji78@gmail.com>
 <CADywMdoYoWhR69d4DZEkYdemY5mGUv-hpd5+aeaS9v+KABw5TQ@mail.gmail.com>
In-Reply-To: <CADywMdoYoWhR69d4DZEkYdemY5mGUv-hpd5+aeaS9v+KABw5TQ@mail.gmail.com>
From: Rahul Balaji <rahulbalaji78@gmail.com>
Date: Mon, 2 Aug 2021 02:12:48 +0400
Message-ID: <CADywMdo5CFaUTnM6+ET1eqoxSo=6Wo0WJA+qQ3tQbW5e1y=emA@mail.gmail.com>
Subject: Re: [PATCH] drivers: mtd: ubi: fixed a semicolon style issue in
 block.c
To: lukas.bulwahn@gmail.com
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============5171251744545764770=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5171251744545764770==
Content-Type: multipart/alternative; boundary="0000000000006337c805c886c160"

--0000000000006337c805c886c160
Content-Type: text/plain; charset="UTF-8"

sorry for that slight misunderstanding. i thought the first patch meant
only a small test patch for the first file. I will send the other changes
shortly too.

Thank you for your understanding.

yours sincerely,
Rahul.



On Mon, Aug 2, 2021 at 2:10 AM Rahul Balaji <rahulbalaji78@gmail.com> wrote:

> respected mentor,
>
> I have sent the first patch only as per the task. please do give me your
> confirmation so that i can proceed further with the other patches too
>
> Thank you,
> sincerely,
> rahul.
>
> On Mon, Aug 2, 2021 at 2:06 AM Rahul Balaji <rahulbalaji78@gmail.com>
> wrote:
>
>> fixed a small coding style issue in using semicolon.
>>
>> signed-off-by: Rahul Balaji <rahulbalaji78@gmail.com>
>> ---
>>  drivers/mtd/ubi/block.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
>> index e003b4b44ffa..e0402c2f8959 100644
>> --- a/drivers/mtd/ubi/block.c
>> +++ b/drivers/mtd/ubi/block.c
>> @@ -405,7 +405,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
>>         ret = blk_mq_alloc_tag_set(&dev->tag_set);
>>         if (ret) {
>>                 dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set
>> failed");
>> -               goto out_free_dev;;
>> +               goto out_free_dev;
>>         }
>>
>>
>> --
>> 2.25.1
>>
>>

--0000000000006337c805c886c160
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">sorry for that slight misunderstanding. i thought the firs=
t patch meant only a small test patch for the first file. I will send the o=
ther changes shortly too.=C2=A0<div><br></div><div>Thank you for your under=
standing.</div><div><br></div><div>yours sincerely,</div><div>Rahul.</div><=
div><br></div><div><div><br></div></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 2:10 AM Rahu=
l Balaji &lt;<a href=3D"mailto:rahulbalaji78@gmail.com">rahulbalaji78@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr">respected mentor,<div><br></div><div>I have sent the f=
irst patch only as per the task. please do give me your confirmation so tha=
t i can proceed further with the other patches too</div><div><br></div><div=
>Thank you,</div><div>sincerely,</div><div>rahul.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 =
at 2:06 AM Rahul Balaji &lt;<a href=3D"mailto:rahulbalaji78@gmail.com" targ=
et=3D"_blank">rahulbalaji78@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">fixed a small coding style issue in us=
ing semicolon.<br>
<br>
signed-off-by: Rahul Balaji &lt;<a href=3D"mailto:rahulbalaji78@gmail.com" =
target=3D"_blank">rahulbalaji78@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/mtd/ubi/block.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c<br>
index e003b4b44ffa..e0402c2f8959 100644<br>
--- a/drivers/mtd/ubi/block.c<br>
+++ b/drivers/mtd/ubi/block.c<br>
@@ -405,7 +405,7 @@ int ubiblock_create(struct ubi_volume_info *vi)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D blk_mq_alloc_tag_set(&amp;dev-&gt;tag_s=
et);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(disk_to_dev=
(dev-&gt;gd), &quot;blk_mq_alloc_tag_set failed&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_free_dev;;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_free_dev;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>
</blockquote></div>

--0000000000006337c805c886c160--

--===============5171251744545764770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5171251744545764770==--
