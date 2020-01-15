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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8045C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 14:07:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D2DF2084D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 14:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tvUCjzBK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D2DF2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 38014865D3;
	Wed, 15 Jan 2020 14:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j45drvQFIbwp; Wed, 15 Jan 2020 14:06:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 46682865B0;
	Wed, 15 Jan 2020 14:06:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2ADA1C1D82;
	Wed, 15 Jan 2020 14:06:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0177C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 14:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8945885F4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 14:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMk8bGE1Ev6c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 14:06:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 57709842CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 14:06:50 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 59so16154484otp.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 06:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m8YdJXVqEvndwQaLeFVf9Vj1JG2td61OIczMFvSzRn8=;
 b=tvUCjzBKS4OZGt+M+tUaFM1hyXi5cCrKIkMdPiRCYJifuYTQm50mcDmT25vHqnwkqj
 LCrwmHLyylO3lAXrSJqy/YdQY889G9G+9YTTNprLUv7rrYQTHxVAbvMO+fZp8fhS0CH0
 jE+3pw9byKMF8k/4s6hkzuioaC6Imyo1UlcG981UuO8llqy125ethfh/zXFNgkK5mC+q
 RP73415h8uztf9bPdRU4zFuMQ6YSRRRyJO/5deTC/Dp/z48HEZxaNqvglDxqrIWN8W4l
 PsNVe9zXRJu+WBG9+QfI5gh4+XnN3uSdpBRhSgUkNc/8u30Ufbx1v2wHnk3yrNHEpCdl
 HBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m8YdJXVqEvndwQaLeFVf9Vj1JG2td61OIczMFvSzRn8=;
 b=ILTbqwT3sWXjE2iyKjlD5486ysDCguTeo5jCxyC9+WOgFlEclL+Hk5TQyeu42mgsh4
 I6v5DjBDvcObw95l3m8ozX+G/M8FAB24ox5FBfeOMSonZx++jiF1zqn3MEbHCSEQb+Sv
 qIKSlwlLSJGdwq7CMyHzmSiBvsCmMPDNRwSwKrmoff3mMa2AFB2OZf5b2nV3TL4EbWGw
 qbJ6scNXd0TC0JNYkYrkIoK1haVf5Iu+Dm9txwBrBcNl86frf8SMrA6HICSFgbOu69Wg
 youI1f9hzmavXbqjQy94HUa8pHjSXuHy+FgclircB28uk7tsMkagthI7omlCw1Jb2ri7
 Ubzg==
X-Gm-Message-State: APjAAAXnyGooJmHUjIAPEx/Y4jYNLKFkySE1RKtAPrbPZo/CIvpu7qk8
 a5SLwyEUpnRcje8joED9uTN1PFidVd7wPRfR4gQ=
X-Google-Smtp-Source: APXvYqygrxjPGS6mT9tBCVOZMdAaS/HYd3/ZbGljQQLQKA6OwyYyG/NZsutIW2+1noFA/lvA8nnn1dwNQ2L0xSE/efo=
X-Received: by 2002:a9d:2965:: with SMTP id d92mr2622695otb.175.1579097209166; 
 Wed, 15 Jan 2020 06:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
 <20200115135631.edr2nrfkycppxcku@debian>
In-Reply-To: <20200115135631.edr2nrfkycppxcku@debian>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Wed, 15 Jan 2020 19:36:38 +0530
Message-ID: <CAF65HP0q_KcrUP_50JxZL1xNc47=detHvdOzjBmuiqUtB3AwfA@mail.gmail.com>
To: Wei Liu <wei.liu@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, paul@xen.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: xen-netbank: hash.c: Use
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
Content-Type: multipart/mixed; boundary="===============5204231387666207094=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5204231387666207094==
Content-Type: multipart/alternative; boundary="00000000000037e1f1059c2e3836"

--00000000000037e1f1059c2e3836
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 15, 2020 at 7:26 PM Wei Liu <wei.liu@kernel.org> wrote:

> Thanks for the patch.
>
> There is a typo in the subject line. It should say xen-netback, not
> xen-netbank.
>
> Hi,

I am sorry about this, I will send this patch again.


> On Wed, Jan 15, 2020 at 06:11:28PM +0530, madhuparnabhowmik04@gmail.com
> wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >
> > list_for_each_entry_rcu has built-in RCU and lock checking.
> > Pass cond argument to list_for_each_entry_rcu.
> >
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > ---
> >  drivers/net/xen-netback/hash.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/xen-netback/hash.c
> b/drivers/net/xen-netback/hash.c
> > index 10d580c3dea3..30709bc9d170 100644
> > --- a/drivers/net/xen-netback/hash.c
> > +++ b/drivers/net/xen-netback/hash.c
> > @@ -51,7 +51,8 @@ static void xenvif_add_hash(struct xenvif *vif, const
> u8 *tag,
> >
> >       found = false;
> >       oldest = NULL;
> > -     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
> > +     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
> > +
>  lockdep_is_held(&vif->hash.cache.lock)) {
>
> There are probably too many tabs here. Indentation looks wrong.
>
> I will correct this when I resend this patch.


> The surrounding code makes it pretty clear that the lock is already held
> by the time list_for_each_entry_rcu is called, yet the checking involved
> in lockdep_is_held is not trivial, so I'm afraid I don't consider this a
> strict improvement over the existing code.
>
> Actually,  we want to make CONFIG_PROVE_LIST_RCU enabled by default.
And if the cond argument is not passed when the usage of
list_for_each_entry_rcu()
is outside of rcu_read_lock(), it will lead to a false positive.
Therefore, I think this patch is required.
Let me know if you have any objections.

Thank you,
Madhuparna


> If there is something I misunderstood, let me know.
>
> Wei.
>
> >               /* Make sure we don't add duplicate entries */
> >               if (entry->len == len &&
> >                   memcmp(entry->tag, tag, len) == 0)
> > @@ -102,7 +103,8 @@ static void xenvif_flush_hash(struct xenvif *vif)
> >
> >       spin_lock_irqsave(&vif->hash.cache.lock, flags);
> >
> > -     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
> > +     list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
> > +
>  lockdep_is_held(&vif->hash.cache.lock)) {
> >               list_del_rcu(&entry->link);
> >               vif->hash.cache.count--;
> >               kfree_rcu(entry, rcu);
> > --
> > 2.17.1
> >
>

--00000000000037e1f1059c2e3836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 15, 2020 at 7:26 PM Wei L=
iu &lt;<a href=3D"mailto:wei.liu@kernel.org">wei.liu@kernel.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks for t=
he patch.<br>
<br>
There is a typo in the subject line. It should say xen-netback, not<br>
xen-netbank.<br>
<br></blockquote><div>Hi,</div><div><br></div><div>I am sorry about this, I=
 will send this patch again.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
On Wed, Jan 15, 2020 at 06:11:28PM +0530, <a href=3D"mailto:madhuparnabhowm=
ik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> wrote:<=
br>
&gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik04@gma=
il.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt; <br>
&gt; list_for_each_entry_rcu has built-in RCU and lock checking.<br>
&gt; Pass cond argument to list_for_each_entry_rcu.<br>
&gt; <br>
&gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhow=
mik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 drivers/net/xen-netback/hash.c | 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/=
hash.c<br>
&gt; index 10d580c3dea3..30709bc9d170 100644<br>
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
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lockdep_is_held(&amp;vif-&gt;h=
ash.cache.lock)) {<br>
<br>
There are probably too many tabs here. Indentation looks wrong.<br>
<br></blockquote><div>I will correct this when I resend this patch.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
The surrounding code makes it pretty clear that the lock is already held<br=
>
by the time list_for_each_entry_rcu is called, yet the checking involved<br=
>
in lockdep_is_held is not trivial, so I&#39;m afraid I don&#39;t consider t=
his a<br>
strict improvement over the existing code.<br>
<br></blockquote><div>Actually,=C2=A0 we want to make CONFIG_PROVE_LIST_RCU=
 enabled by default.</div><div>And if the cond argument is not passed when =
the usage of list_for_each_entry_rcu()</div><div>is outside of rcu_read_loc=
k(), it will lead to a false positive.</div><div>Therefore, I think this pa=
tch is required.</div><div>Let me know if you have any objections.</div><di=
v><br></div><div>Thank you,</div><div>Madhuparna</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
If there is something I misunderstood, let me know.<br>
<br>
Wei.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Make sure we =
don&#39;t add duplicate entries */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (entry-&gt;le=
n =3D=3D len &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0me=
mcmp(entry-&gt;tag, tag, len) =3D=3D 0)<br>
&gt; @@ -102,7 +103,8 @@ static void xenvif_flush_hash(struct xenvif *vif)<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;vif-&gt;hash.cache.lo=
ck, flags);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0list_for_each_entry_rcu(entry, &amp;vif-&gt;hash.=
cache.list, link) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_rcu(entry, &amp;vif-&gt;hash.=
cache.list, link,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lockdep_is_held(&amp;vif-&gt;h=
ash.cache.lock)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_rcu(&am=
p;entry-&gt;link);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vif-&gt;hash.cac=
he.count--;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree_rcu(entry,=
 rcu);<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div></div>

--00000000000037e1f1059c2e3836--

--===============5204231387666207094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5204231387666207094==--
