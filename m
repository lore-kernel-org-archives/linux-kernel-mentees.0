Return-Path: <SRS0=QLdQ=3E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3F0C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 15:48:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EAA524656
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 15:48:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="usbrjaHT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EAA524656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 50C13204AD;
	Wed, 15 Jan 2020 15:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQGmQrY9WBZj; Wed, 15 Jan 2020 15:48:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 760062002C;
	Wed, 15 Jan 2020 15:48:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62623C1D83;
	Wed, 15 Jan 2020 15:48:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B273FC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AEB7F8702A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Csqx5UxcirrW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:47:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C0FF86D41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:47:58 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m2so11642629otq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 07:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ilVXlccIzQKwAZB4Z6h6iuKbcrKSnYqM64tYSFmmHT0=;
 b=usbrjaHTxYyp00JfyzM3KR6KLIDz0nAnhdxjs6vH3azZpp3o6+ErwcXDq0AIVyFWOB
 idRZbrmEEe1fm9JoMlnt016ivdhXc8qzYyTIpPK7J2fLJralhgOpVatnfiwuhxfdOEAs
 DiPWxAom0wNJWBrum47YEezYGmp3iRnsiXpr9JvE4K7Zq9AVS26Tn1g+NurE4zCXwct1
 sYSejHPw5fRNFAJ8FPEkAQ4P4GWmXfcUTc+tjWdRT3vzNM4P7rQh+LJ2XYBaDLXJp6RK
 ko5MHSTax/z4ktCK9o3E6VNBueObnuVw6FJmC16JHORKxQ9rv4HUDdseGQ5CzZSKtk5+
 oSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ilVXlccIzQKwAZB4Z6h6iuKbcrKSnYqM64tYSFmmHT0=;
 b=Ia4VTPt9KAWnN3SrYgO/cYfI4vnJZFlGS0VvLnJK5SIkJZS5nED6AK/wvvoSygfu/C
 KH+4N9eK5GD4vxe9hGVeWcHRwb5fTfFpWskG9utTBtbSE5Hg6YiVfHk/2n0NElh3/sdc
 EKP9boZKUtRxKwhjXKKPwlwTYRljwss4nOcYRuNrgsDpLKuYqiR6svY3G8aO/LjSKzdb
 V6++c5TfTwJRO7uizcl4UvVk09LVb/Xiw2CK0rKLDQFiiHs8/x+0R5C1P6gZKDWeT9GE
 w4LsOUDS2U0vIE3q/NC65c7OK6LCnLd2qG4RBJdcWEHx478XPgIfty+rRNkzFdxxBr6U
 REAA==
X-Gm-Message-State: APjAAAV6lxHaMxig8HEmA/JBdCzWbdsPqtvrylIhbsH7ZaBtJg0d5GIj
 vv0qvFUp6q5yvNGkRDnJ65h39Nj/5rFTMTJTJQ4=
X-Google-Smtp-Source: APXvYqzYBAceFg/OddEAdGD0tzP9ldtUOajIec7RUFyS4DHU4xpXu9K+ET09n64mXTNpZ/Gv1ROQd5F5Y8QHj/KEh4o=
X-Received: by 2002:a05:6830:1141:: with SMTP id
 x1mr3238772otq.120.1579103277426; 
 Wed, 15 Jan 2020 07:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20200115141840.10553-1-madhuparnabhowmik04@gmail.com>
 <20200115150545.j5gu7lm3l3ouv7l4@debian>
In-Reply-To: <20200115150545.j5gu7lm3l3ouv7l4@debian>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Wed, 15 Jan 2020 21:17:46 +0530
Message-ID: <CAF65HP3nP1J9U6yBhjf9LqRqXA34ASfNs0gfo+66BhO87WwYAw@mail.gmail.com>
To: Wei Liu <wei.liu@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, paul@xen.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] net: xen-netback: hash.c: Use
	built-in RCU list checking
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
Content-Type: multipart/mixed; boundary="===============4056137611182560415=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4056137611182560415==
Content-Type: multipart/alternative; boundary="000000000000ea2d81059c2fa183"

--000000000000ea2d81059c2fa183
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 15, 2020 at 8:35 PM Wei Liu <wei.liu@kernel.org> wrote:

> On Wed, Jan 15, 2020 at 07:48:40PM +0530, madhuparnabhowmik04@gmail.com
> wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >
> > list_for_each_entry_rcu has built-in RCU and lock checking.
> > Pass cond argument to list_for_each_entry_rcu.
> >
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>
> You seem to have dropped the second hunk which modified
> xenvif_flush_hash, is that a mistake?
>

I am sorry again, Yes I forgot to add the second hunk.
I will send the final patch with both the hunks in a while.

Thank you,
Madhuparna

Wei.
>
> > ---
> >  drivers/net/xen-netback/hash.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/xen-netback/hash.c
> b/drivers/net/xen-netback/hash.c
> > index 10d580c3dea3..3f9783f70a75 100644
> > --- a/drivers/net/xen-netback/hash.c
> > +++ b/drivers/net/xen-netback/hash.c
> > @@ -51,7 +51,8 @@ static void xenvif_add_hash(struct xenvif *vif, const
> u8 *tag,
> >
> >       found = false;
> >       oldest = NULL;
> > -     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
> > +     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
> > +                             lockdep_is_held(&vif->hash.cache.lock)) {
> >               /* Make sure we don't add duplicate entries */
> >               if (entry->len == len &&
> >                   memcmp(entry->tag, tag, len) == 0)
> > --
> > 2.17.1
> >
>

--000000000000ea2d81059c2fa183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 15, 2020 at 8:35 PM Wei L=
iu &lt;<a href=3D"mailto:wei.liu@kernel.org">wei.liu@kernel.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jan =
15, 2020 at 07:48:40PM +0530, <a href=3D"mailto:madhuparnabhowmik04@gmail.c=
om" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> wrote:<br>
&gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik04@gma=
il.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt; <br>
&gt; list_for_each_entry_rcu has built-in RCU and lock checking.<br>
&gt; Pass cond argument to list_for_each_entry_rcu.<br>
&gt; <br>
&gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhow=
mik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br=
>
<br>
You seem to have dropped the second hunk which modified<br>
xenvif_flush_hash, is that a mistake?<br></blockquote><div>=C2=A0</div><div=
>I am sorry again, Yes I forgot to add the second hunk.</div><div>I will se=
nd the final patch with both the hunks in a while.</div><div><br></div><div=
>Thank you,</div><div>Madhuparna</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Wei.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/net/xen-netback/hash.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/=
hash.c<br>
&gt; index 10d580c3dea3..3f9783f70a75 100644<br>
&gt; --- a/drivers/net/xen-netback/hash.c<br>
&gt; +++ b/drivers/net/xen-netback/hash.c<br>
&gt; @@ -51,7 +51,8 @@ static void xenvif_add_hash(struct xenvif *vif, cons=
t u8 *tag,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0found =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oldest =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list_for_each_entry_rcu(entry, &amp;vif-&gt;hash.=
cache.list, link) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_rcu(entry, &amp;vif-&gt;hash.=
cache.list, link,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lockdep_is_held(&amp;vif-&gt;hash.cache.=
lock)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Make sure we =
don&#39;t add duplicate entries */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (entry-&gt;le=
n =3D=3D len &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0me=
mcmp(entry-&gt;tag, tag, len) =3D=3D 0)<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div></div>

--000000000000ea2d81059c2fa183--

--===============4056137611182560415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4056137611182560415==--
