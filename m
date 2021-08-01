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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895A6C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 22:10:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26EFF61040
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 22:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26EFF61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3C94031F;
	Sun,  1 Aug 2021 22:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTA9rSG6lLxs; Sun,  1 Aug 2021 22:10:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 034FA402EC;
	Sun,  1 Aug 2021 22:10:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFF24C0010;
	Sun,  1 Aug 2021 22:10:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD681C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9677583529
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Su6-5ICktPT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:10:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80B048308A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 22:10:21 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id w17so25519942ybl.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Aug 2021 15:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+s49s5s/FDdGRP5nKDA7on29vQlrqvzDGJhI2XcyFCc=;
 b=Tw1UomE+hWkIEUWdQaZboBloYionSnGueRy9VR2G4vAecKGDvhuVkzcqYiUYPrd5zD
 MQLVuoEl/aM7orXcrpc+r5ud6CUjAa802sBuZkUTDt3obWFSCLcF1b76xuuZly0yOCvZ
 zIfAhnxBS54hYcZqYS7Uaflu2Pxcf0csyzbLmgQ7wm4LAazsQwSly1As5RFZhcpalmGN
 KS6aKusaSChOenEoMOEfV9bDcXpaW6rBm+yMcMCrvAHJX44y5lTA8agQXFkEaX4n624D
 Se7xQKFqh2b+46FWp7lyDo9lU9eMg7rXnCBUfn6F/m4PbbtF7i2Virty4fB9XhCPctFe
 5uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+s49s5s/FDdGRP5nKDA7on29vQlrqvzDGJhI2XcyFCc=;
 b=gsH0Y1q3BaDn1sTakchWQe8xkWh53ewEJ7+fpuQOUs5cetkY2swmUOeevbImmewjRh
 kJmGmKjEBA+m4O96AtwpRswMl6UmKpG1GUTnRBdoxYLvr1Br+IiYhEcPuAl9FRMmTkEr
 x6XtZFm0yLxnaeojiGy+zQhRlX8Ug+GCGNdsrelMljsBxK7r65zIy6s1D17L396J+0i3
 TExFRyfe5IeQNiBtqLUYvYY1Uvl6HTFDZZAShu5YXIqOTWv+Gs6nKopw/SohlvAVpXs4
 QvlsGlay6EksQSBYV6faKUWtwzdSACX5VuSpefV+o3/vqiBgOmXNVjLGdUUm0P1neagF
 FmOw==
X-Gm-Message-State: AOAM5323YIm+3rkQ6XcTapvCJnhJoA34GCGC+kQfAHk89sr+xCuAzuAV
 VOkZjMc+xS4xAVUDWH2ieh6v0gF1f1wCroZS00I=
X-Google-Smtp-Source: ABdhPJx/yFFZSZGgdbJVtE6WeKAs/Eo/vof6gKaK4F080pLzHrqxEyAUR0Mv441sb6nZb8LJ8rceN8dDJVij+02sqYA=
X-Received: by 2002:a25:be44:: with SMTP id d4mr4119531ybm.461.1627855820486; 
 Sun, 01 Aug 2021 15:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210801220453.17028-1-rahulbalaji78@gmail.com>
In-Reply-To: <20210801220453.17028-1-rahulbalaji78@gmail.com>
From: Rahul Balaji <rahulbalaji78@gmail.com>
Date: Mon, 2 Aug 2021 02:10:09 +0400
Message-ID: <CADywMdoYoWhR69d4DZEkYdemY5mGUv-hpd5+aeaS9v+KABw5TQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2408487406210363634=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2408487406210363634==
Content-Type: multipart/alternative; boundary="000000000000ecfafa05c886b776"

--000000000000ecfafa05c886b776
Content-Type: text/plain; charset="UTF-8"

respected mentor,

I have sent the first patch only as per the task. please do give me your
confirmation so that i can proceed further with the other patches too

Thank you,
sincerely,
rahul.

On Mon, Aug 2, 2021 at 2:06 AM Rahul Balaji <rahulbalaji78@gmail.com> wrote:

> fixed a small coding style issue in using semicolon.
>
> signed-off-by: Rahul Balaji <rahulbalaji78@gmail.com>
> ---
>  drivers/mtd/ubi/block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index e003b4b44ffa..e0402c2f8959 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -405,7 +405,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
>         ret = blk_mq_alloc_tag_set(&dev->tag_set);
>         if (ret) {
>                 dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set
> failed");
> -               goto out_free_dev;;
> +               goto out_free_dev;
>         }
>
>
> --
> 2.25.1
>
>

--000000000000ecfafa05c886b776
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">respected mentor,<div><br></div><div>I have sent the first=
 patch only as per the task. please do give me your confirmation so that i =
can proceed further with the other patches too</div><div><br></div><div>Tha=
nk you,</div><div>sincerely,</div><div>rahul.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 2=
:06 AM Rahul Balaji &lt;<a href=3D"mailto:rahulbalaji78@gmail.com">rahulbal=
aji78@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">fixed a small coding style issue in using semicolon.<br>
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

--000000000000ecfafa05c886b776--

--===============2408487406210363634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2408487406210363634==--
