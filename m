Return-Path: <SRS0=BNRj=NA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA85AC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 21:17:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6738F6056B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 21:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6738F6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 319B86077D;
	Mon,  9 Aug 2021 21:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10qJ5cQ5C5oY; Mon,  9 Aug 2021 21:17:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 46E4D60732;
	Mon,  9 Aug 2021 21:17:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 169F0C001A;
	Mon,  9 Aug 2021 21:17:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48D66C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 21:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 333094023B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 21:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PABFYVx0eyW1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 21:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C743C400E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 21:17:41 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id a93so32205678ybi.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Aug 2021 14:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xLYdD5ejXltJkrkU406s8mZujbhYIEDJU8fyToMocT0=;
 b=dLu2B3jXAgHYP46jpplDOETau6gKg072oQBF/wbUPibv3tpOodn8hFGFWaD1ve9fXE
 4q65BnWLHn/6ipoqvYorc+Ht03BY+VM1VJpVx74pFfbcsN7iMkTaaxBQO8Fgg8W2NZkZ
 jIkIXT5BR3dBhHOaxAfoQ7NHaVEnT9/KqTc7AolLAga+jXF3AV50Auu+8qRNrRd/8H2X
 MoYvz4jxaawHeOLAypi5AccYRJFiVT5ilttcaMWUMl4tshO2Jz7o3Y0QZtu9J/c1ACyo
 cRLOwb5qOIGFsc/zLh0yMmksC4E0vVXg//k/iEHw6QHoNgWs7UeHypMjZtnVIb9uaMbU
 r6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xLYdD5ejXltJkrkU406s8mZujbhYIEDJU8fyToMocT0=;
 b=mYHxXsnGXCa+UsGGSO1afakorDCa/RDM2Ex2nu1DAJn+/G0jvVB6nXrAoZFwvYA9M0
 psze+T27BBuwtYQvftUPr5xNyvc/K513tXIXZKZRyu3kMBE5Kw/l54buBtv6MJgBnyQN
 3+EVw2QZmZP6883iwIYFZv73FXdi/DcTjGGOjPhM55QsMWlSwixUlINRbUH/PhNwi1Ql
 Qmd/nsGayXKlyEcpPKpvjd8fU9TLegcih9yVH8dx0Ov/N4FxEO6yd3U4layQd6tKqtb6
 w15pvIJ1VoOCpJSOV8u1zehgQvpLGqMCh6eM0NMhh32g2GNFslqWIMAzwSddKvaDtyHv
 ZdAg==
X-Gm-Message-State: AOAM533i2I5cr1aINvWNwuZxH3MPHAd37r2A2+c+ZDMssb1U2orBdjqh
 lRJ4kdqQt6K4rtwddcq/zs/Tq4iFHEZoNnrWYDo=
X-Google-Smtp-Source: ABdhPJxiXTvKe9FBK4XzlLVJDfr0oEQwRPNopu5yqZ62C3KPdp6AVU+Ic4PTKwNbVMzqMBalk9DAw47dQBfuUXEEP7I=
X-Received: by 2002:a05:6902:134c:: with SMTP id
 g12mr33358943ybu.251.1628543860624; 
 Mon, 09 Aug 2021 14:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210803141049.80422-1-rahulbalaji78@gmail.com>
In-Reply-To: <20210803141049.80422-1-rahulbalaji78@gmail.com>
From: Rahul Balaji <rahulbalaji78@gmail.com>
Date: Tue, 10 Aug 2021 01:17:30 +0400
Message-ID: <CADywMdpJjb8En5dh0mRVmRYEstZ6-ZsUM4X28dx71HB2oWkZoA@mail.gmail.com>
Subject: Re: [PATCH v2] Task2: checkpatch.pl documentation mentorship: Remove
 semicolon warnings
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="===============4284602853294284528=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4284602853294284528==
Content-Type: multipart/alternative; boundary="00000000000050522905c926ea58"

--00000000000050522905c926ea58
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Aug 2021, 6:11 pm Rahul Balaji, <rahulbalaji78@gmail.com> wrote:

> Signed-off-by: Rahul Balaji <rahulbalaji78@gmail.com>
>
> no functional changes.

 drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
>  drivers/mtd/ubi/block.c               | 2 +-
>  fs/block_dev.c                        | 2 +-
>  include/trace/events/iocost.h         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 5b27845075a1..d476940ee97c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -339,7 +339,7 @@ nouveau_gem_set_domain(struct drm_gem_object *gem,
> uint32_t read_domains,
>         struct ttm_buffer_object *bo = &nvbo->bo;
>         uint32_t domains = valid_domains & nvbo->valid_domains &
>                 (write_domains ? write_domains : read_domains);
> -       uint32_t pref_domains = 0;;
> +       uint32_t pref_domains = 0;
>
>         if (!domains)
>                 return -EINVAL;
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
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 9ef4f1fc2cb0..61b938fa5d5b 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -1268,7 +1268,7 @@ static int blkdev_get_whole(struct block_device
> *bdev, fmode_t mode)
>         if (test_bit(GD_NEED_PART_SCAN, &disk->state))
>                 bdev_disk_changed(disk, false);
>         bdev->bd_openers++;
> -       return 0;;
> +       return 0;
>  }
>
>  static void blkdev_put_whole(struct block_device *bdev, fmode_t mode)
> diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h
> index e282ce02fa2d..6d1626e7a4ce 100644
> --- a/include/trace/events/iocost.h
> +++ b/include/trace/events/iocost.h
> @@ -160,7 +160,7 @@ TRACE_EVENT(iocost_ioc_vrate_adj,
>
>         TP_fast_assign(
>                 __assign_str(devname, ioc_name(ioc));
> -               __entry->old_vrate = atomic64_read(&ioc->vtime_rate);;
> +               __entry->old_vrate = atomic64_read(&ioc->vtime_rate);
>                 __entry->new_vrate = new_vrate;
>                 __entry->busy_level = ioc->busy_level;
>                 __entry->read_missed_ppm = missed_ppm[READ];
> --
> 2.25.1
>


Respected mentors,

Please do find the changes in the same mail quoted as above.

Regards,
Rahul.

>

--00000000000050522905c926ea58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 3 Aug 2021, 6:11 pm Rahul Balaji, &lt;<a href=
=3D"mailto:rahulbalaji78@gmail.com">rahulbalaji78@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Rahul Balaji &lt;<a =
href=3D"mailto:rahulbalaji78@gmail.com" target=3D"_blank" rel=3D"noreferrer=
">rahulbalaji78@gmail.com</a>&gt;<br>
<br>
no functional changes.</blockquote></div></div><div dir=3D"auto"></div><div=
 dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
=C2=A0drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-<br>
=C2=A0drivers/mtd/ubi/block.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A0fs/block_dev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0include/trace/events/iocost.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
=C2=A04 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouvea=
u/nouveau_gem.c<br>
index 5b27845075a1..d476940ee97c 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c<br>
@@ -339,7 +339,7 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint=
32_t read_domains,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ttm_buffer_object *bo =3D &amp;nvbo-&gt;=
bo;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t domains =3D valid_domains &amp; nvbo-&=
gt;valid_domains &amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (write_domains ? wr=
ite_domains : read_domains);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t pref_domains =3D 0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t pref_domains =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!domains)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
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
diff --git a/fs/block_dev.c b/fs/block_dev.c<br>
index 9ef4f1fc2cb0..61b938fa5d5b 100644<br>
--- a/fs/block_dev.c<br>
+++ b/fs/block_dev.c<br>
@@ -1268,7 +1268,7 @@ static int blkdev_get_whole(struct block_device *bdev=
, fmode_t mode)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (test_bit(GD_NEED_PART_SCAN, &amp;disk-&gt;s=
tate))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bdev_disk_changed(d=
isk, false);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bdev-&gt;bd_openers++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static void blkdev_put_whole(struct block_device *bdev, fmode_t mode)=
<br>
diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h<=
br>
index e282ce02fa2d..6d1626e7a4ce 100644<br>
--- a/include/trace/events/iocost.h<br>
+++ b/include/trace/events/iocost.h<br>
@@ -160,7 +160,7 @@ TRACE_EVENT(iocost_ioc_vrate_adj,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TP_fast_assign(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __assign_str(devnam=
e, ioc_name(ioc));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__entry-&gt;old_vra=
te =3D atomic64_read(&amp;ioc-&gt;vtime_rate);;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__entry-&gt;old_vra=
te =3D atomic64_read(&amp;ioc-&gt;vtime_rate);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __entry-&gt;new_vra=
te =3D new_vrate;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __entry-&gt;busy_le=
vel =3D ioc-&gt;busy_level;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __entry-&gt;read_mi=
ssed_ppm =3D missed_ppm[READ];<br>
-- <br>
2.25.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Respected mentors,</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Please do find the changes in the same mail qu=
oted as above.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,<=
/div><div dir=3D"auto">Rahul.</div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000050522905c926ea58--

--===============4284602853294284528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4284602853294284528==--
