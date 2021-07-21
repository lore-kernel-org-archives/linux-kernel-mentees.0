Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83135C12002
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 19:14:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19EA960698
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 19:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19EA960698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA53C608C2;
	Wed, 21 Jul 2021 19:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id as2ISwt2BqiX; Wed, 21 Jul 2021 19:14:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E8FDC6074A;
	Wed, 21 Jul 2021 19:14:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCE30C001A;
	Wed, 21 Jul 2021 19:14:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C89FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B49D6074A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x93M4bCWnPOq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:14:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CFFF606E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:14:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2F0260698
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626894891;
 bh=Pm+g3K/ZRCu7RfQR3Ai7NG6D8xupLbbp9jhnseYaP1k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B187NABYX70LbTa81NgI8A4XGn1Z3zqYC3QY5tCvCT+QIHEiccEBz9rJ8wBSzTPtD
 Z4toVTdsz9EjE24tfPae3J597OElhQQIV3YlW0v44JfiF7jY0US+L23d8K37mNu4r4
 ZG+0BLh4QirL0VAKkaay+/3AGwPxa3WT3D/SRhhTHWJgvohFT00iNsKmbr9QsIjyAO
 A1lLRvMvmFJe/0CGoi9WP/4zkajofXSTazoke2qQcKQDeUYyWbCsEX7Hl4YSWr9izY
 YcxQ+RpqvVdVUn1dcdAVjjJ9wtd+8EO3fhOWIlMtBAD+g1K557tN4f6yVyTPjZLdNm
 DycQnRYlLKfRw==
Received: by mail-qt1-f169.google.com with SMTP id c13so2647032qtd.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 12:14:51 -0700 (PDT)
X-Gm-Message-State: AOAM530Z/pNMTwL/bnPU51KMubgnBMRxIdPd7pI2y39VKqbJ1VNFIMU2
 Rt2geiSxI3Ot9BnIUuFUY6o7BLkYL/gFgjULPWM=
X-Google-Smtp-Source: ABdhPJza8nGEBrdb+MGk+LIeeJ3Z5FSza82LOqM5T1OVFeODHepbZh2fl6DAYVMWhKVGZ7aygqJ40p58a2ZmlUjS3Lw=
X-Received: by 2002:a05:622a:14d3:: with SMTP id
 u19mr21462445qtx.258.1626894891136; 
 Wed, 21 Jul 2021 12:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210721190014.2313-1-mail@anirudhrb.com>
 <20210721190014.2313-2-mail@anirudhrb.com>
In-Reply-To: <20210721190014.2313-2-mail@anirudhrb.com>
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Wed, 21 Jul 2021 12:14:37 -0700
X-Gmail-Original-Message-ID: <CAB=NE6UbB0VT+CZ0aD140LSj6DvRs==_GMxJ=isj30idnStbfQ@mail.gmail.com>
Message-ID: <CAB=NE6UbB0VT+CZ0aD140LSj6DvRs==_GMxJ=isj30idnStbfQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] firmware_loader: use -ETIMEDOUT instead of -EAGAIN
 in fw_load_sysfs_fallback
To: Anirudh Rayabharam <mail@anirudhrb.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============6065757797851006259=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6065757797851006259==
Content-Type: multipart/alternative; boundary="00000000000012c00505c7a6fcc2"

--00000000000012c00505c7a6fcc2
Content-Type: text/plain; charset="UTF-8"

But the patch still keeps it, please remove the -EAGAIN setting completely.

On Wed, Jul 21, 2021, 12:01 PM Anirudh Rayabharam <mail@anirudhrb.com>
wrote:

> The only motivation for using -EAGAIN in commit 0542ad88fbdd81bb
> ("firmware loader: Fix _request_firmware_load() return val for fw load
> abort") was to distinguish the error from -ENOMEM, and so there is no
> real reason in keeping it. Keeping -ETIMEDOU is much telling of what the
> reason for a failure is, so just use that.
>
> The rest is just trying to document a bit more of the motivations for the
> error codes, as otherwise we'd lose this information easily.
>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>  drivers/base/firmware_loader/fallback.c | 36 ++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/base/firmware_loader/fallback.c
> b/drivers/base/firmware_loader/fallback.c
> index 91899d185e31..bc25bb5d1ed6 100644
> --- a/drivers/base/firmware_loader/fallback.c
> +++ b/drivers/base/firmware_loader/fallback.c
> @@ -70,7 +70,31 @@ static inline bool fw_sysfs_loading(struct fw_priv
> *fw_priv)
>
>  static inline int fw_sysfs_wait_timeout(struct fw_priv *fw_priv,  long
> timeout)
>  {
> -       return __fw_state_wait_common(fw_priv, timeout);
> +       int ret = __fw_state_wait_common(fw_priv, timeout);
> +
> +       /*
> +        * A signal could be sent to abort a wait. Consider Android's init
> +        * gettting a SIGCHLD, which in turn was the same process issuing
> the
> +        * sysfs store call for the fallback. In such cases we want to be
> able
> +        * to tell apart in userspace when a signal caused a failure on the
> +        * wait. In such cases we'd get -ERESTARTSYS.
> +        *
> +        * Likewise though another race can happen and abort the load
> earlier.
> +        *
> +        * In either case the situation is interrupted so we just inform
> +        * userspace of that and we end things right away.
> +        *
> +        * When we really time out just tell userspace it should try again,
> +        * perhaps later.
> +        */
> +       if (ret == -ERESTARTSYS || fw_state_is_aborted(fw_priv))
> +               ret = -EINTR;
> +       else if (ret == -ETIMEDOUT)
> +               ret = -EAGAIN;
> +       else if (fw_priv->is_paged_buf && !fw_priv->data)
> +               ret = -ENOMEM;
> +
> +       return ret;
>  }
>
>  struct fw_sysfs {
> @@ -526,20 +550,12 @@ static int fw_load_sysfs_fallback(struct fw_sysfs
> *fw_sysfs, long timeout)
>         }
>
>         retval = fw_sysfs_wait_timeout(fw_priv, timeout);
> -       if (retval < 0 && retval != -ENOENT) {
> +       if (retval < 0) {
>                 mutex_lock(&fw_lock);
>                 fw_load_abort(fw_sysfs);
>                 mutex_unlock(&fw_lock);
>         }
>
> -       if (fw_state_is_aborted(fw_priv)) {
> -               if (retval == -ERESTARTSYS)
> -                       retval = -EINTR;
> -               else
> -                       retval = -EAGAIN;
> -       } else if (fw_priv->is_paged_buf && !fw_priv->data)
> -               retval = -ENOMEM;
> -
>         device_del(f_dev);
>  err_put_dev:
>         put_device(f_dev);
> --
> 2.26.2
>
>

--00000000000012c00505c7a6fcc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But the patch still keeps it, please remove the -EAGAIN s=
etting completely.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, Jul 21, 2021, 12:01 PM Anirudh Rayabharam &lt;<a =
href=3D"mailto:mail@anirudhrb.com">mail@anirudhrb.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">The only motivation for using -EAGAIN in =
commit 0542ad88fbdd81bb<br>
(&quot;firmware loader: Fix _request_firmware_load() return val for fw load=
<br>
abort&quot;) was to distinguish the error from -ENOMEM, and so there is no<=
br>
real reason in keeping it. Keeping -ETIMEDOU is much telling of what the<br=
>
reason for a failure is, so just use that.<br>
<br>
The rest is just trying to document a bit more of the motivations for the<b=
r>
error codes, as otherwise we&#39;d lose this information easily.<br>
<br>
Suggested-by: Luis Chamberlain &lt;<a href=3D"mailto:mcgrof@kernel.org" tar=
get=3D"_blank" rel=3D"noreferrer">mcgrof@kernel.org</a>&gt;<br>
Signed-off-by: Anirudh Rayabharam &lt;<a href=3D"mailto:mail@anirudhrb.com"=
 target=3D"_blank" rel=3D"noreferrer">mail@anirudhrb.com</a>&gt;<br>
---<br>
=C2=A0drivers/base/firmware_loader/fallback.c | 36 ++++++++++++++++++------=
-<br>
=C2=A01 file changed, 26 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmwar=
e_loader/fallback.c<br>
index 91899d185e31..bc25bb5d1ed6 100644<br>
--- a/drivers/base/firmware_loader/fallback.c<br>
+++ b/drivers/base/firmware_loader/fallback.c<br>
@@ -70,7 +70,31 @@ static inline bool fw_sysfs_loading(struct fw_priv *fw_p=
riv)<br>
<br>
=C2=A0static inline int fw_sysfs_wait_timeout(struct fw_priv *fw_priv,=C2=
=A0 long timeout)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return __fw_state_wait_common(fw_priv, timeout)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D __fw_state_wait_common(fw_priv, tim=
eout);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * A signal could be sent to abort a wait. Cons=
ider Android&#39;s init<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * gettting a SIGCHLD, which in turn was the sa=
me process issuing the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * sysfs store call for the fallback. In such c=
ases we want to be able<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to tell apart in userspace when a signal cau=
sed a failure on the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * wait. In such cases we&#39;d get -ERESTARTSY=
S.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Likewise though another race can happen and =
abort the load earlier.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * In either case the situation is interrupted =
so we just inform<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * userspace of that and we end things right aw=
ay.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * When we really time out just tell userspace =
it should try again,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * perhaps later.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -ERESTARTSYS || fw_state_is_abor=
ted(fw_priv))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINTR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (ret =3D=3D -ETIMEDOUT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EAGAIN;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (fw_priv-&gt;is_paged_buf &amp;&amp; !f=
w_priv-&gt;data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
=C2=A0struct fw_sysfs {<br>
@@ -526,20 +550,12 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw=
_sysfs, long timeout)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D fw_sysfs_wait_timeout(fw_priv, timeo=
ut);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval &lt; 0 &amp;&amp; retval !=3D -ENOEN=
T) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&amp;fw_=
lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fw_load_abort(fw_sy=
sfs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;f=
w_lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fw_state_is_aborted(fw_priv)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval =3D=3D -=
ERESTARTSYS)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0retval =3D -EINTR;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0retval =3D -EAGAIN;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (fw_priv-&gt;is_paged_buf &amp;&amp; =
!fw_priv-&gt;data)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D -ENOMEM;=
<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 device_del(f_dev);<br>
=C2=A0err_put_dev:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 put_device(f_dev);<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div>

--00000000000012c00505c7a6fcc2--

--===============6065757797851006259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6065757797851006259==--
