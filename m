Return-Path: <SRS0=164v=Z4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85FCC43603
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 07:23:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8636B21835
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 07:23:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QReq/72V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8636B21835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 490BB8742D;
	Fri,  6 Dec 2019 07:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKCea2jX8Cfb; Fri,  6 Dec 2019 07:23:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE5218720A;
	Fri,  6 Dec 2019 07:23:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3CABC18DD;
	Fri,  6 Dec 2019 07:23:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CF90C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 07:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 12ECB87D75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 07:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMrTeEdaTvyU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 07:23:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5B91C881F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 07:23:13 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id a15so5044972otf.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Dec 2019 23:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9VKQjsJzIksXIY0QmBlXIv/K+XRCCEybxYQUywV5/7g=;
 b=QReq/72VG1aqx2gqa4plI+PovLKp5kbrFTr1H5cL4vSOTookiFrNdfsNBphpPj1YuC
 S6QTHofPNUx3gjx1rGEMWU1Inro3u0qkSZJyOPzRGu4/klxxAxtVaFrHT0I+Rah7L6ia
 JAfWImI5EBAU5/2ZrPHCboAMwbd+8IPeSjAlUdnV2E4voPo8MABwaDDYu3cXIn+ZsK/l
 W+tS4G9kd94ptEVjGdnqejO1oa/KH0mhnBzFtJkv1bv3vdjlCPyHCJBX1aerEXOYwsRW
 Quh5mourvc1Y3bbyxBvl/akxX524gNi/lR0E226iSoV6OOdg13kFnQdCsAWZwHVAsG3G
 HCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9VKQjsJzIksXIY0QmBlXIv/K+XRCCEybxYQUywV5/7g=;
 b=suRPp/nzPQ2CRPMgxHmkoSk8cyySp3LsV8OgljZZbDd4SnOWCGnK2fxfJ+5FMiQsC4
 AFjHWtsGjpK0qlwU77lrBEeNnCNYSXTLgS/B/NYM9Ynv1Xe1AVhcvmJ5kE0CUWgIsj7m
 ILSrsv/T6uomYb0d08dc8DUnILo5hujDHaUK9L2Jm/qNjppi9KWmjM49TEWAT56Azc0v
 7YfVWa9XoQdlZDqmi6o1J6hlLeVbI+196IYDdPfS8/5siIkJOelSQ4a6eT0ILuU5ic0z
 303l5YyEx2SYxodBiGkDzyvi4mz4tnWMT0mvWm4oB1IzSHSPPZewa1a7wSRmiU9jK9gw
 X91A==
X-Gm-Message-State: APjAAAWH7UmURHbJmZBW3exVWyp97fnSIB2T9b+8bjiZ/dk8wnKR5m7k
 J7vQcM2qetmdixoXrypAImu6gK8UB+eJ0TDsSWg=
X-Google-Smtp-Source: APXvYqx6ptcXNhgFXCdyJDZG+PGYeJ2GujXyea4QS+ZJY4GMow8Y/OBenFSuUqHoRpJLQUhn/za8xJGCv1roZdPlPgw=
X-Received: by 2002:a9d:51ca:: with SMTP id d10mr9546571oth.76.1575616992228; 
 Thu, 05 Dec 2019 23:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20191205185352.1957-1-madhuparnabhowmik04@gmail.com>
 <20191206000446.GW2889@paulmck-ThinkPad-P72>
In-Reply-To: <20191206000446.GW2889@paulmck-ThinkPad-P72>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Fri, 6 Dec 2019 12:53:01 +0530
Message-ID: <CAF65HP2e2sVjJV-foo-MT=zOxrW2dcceUXDTXO+TUvGUz=yjWQ@mail.gmail.com>
To: paulmck@kernel.org
Cc: Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, josh@joshtriplett.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] include: linux: rculist_nulls:
	Change docbook comment headers
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
Content-Type: multipart/mixed; boundary="===============1542323237780880182=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1542323237780880182==
Content-Type: multipart/alternative; boundary="0000000000001fbdd7059903ebaa"

--0000000000001fbdd7059903ebaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2019 at 5:34 AM Paul E. McKenney <paulmck@kernel.org> wrote:

> On Fri, Dec 06, 2019 at 12:23:52AM +0530, madhuparnabhowmik04@gmail.com
> wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >
> > This patch changes the docbook comment "head for your list"
> > to "head of the list".
> >
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>
> I applied both with some updates to the subject line and commit log.
> Could you please double-check for errors on my part?


 Yes, I checked, it seems alright.

Thank you,
Madhuparna


>                                                         Thanx, Paul
>
> > ---
> >  include/linux/rculist_nulls.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/rculist_nulls.h
> b/include/linux/rculist_nulls.h
> > index 517a06f36c7a..bea311c884b3 100644
> > --- a/include/linux/rculist_nulls.h
> > +++ b/include/linux/rculist_nulls.h
> > @@ -104,7 +104,7 @@ static inline void hlist_nulls_add_head_rcu(struct
> hlist_nulls_node *n,
> >   * hlist_nulls_for_each_entry_rcu - iterate over rcu list of given typ=
e
> >   * @tpos:    the type * to use as a loop cursor.
> >   * @pos:     the &struct hlist_nulls_node to use as a loop cursor.
> > - * @head:    the head for your list.
> > + * @head:    the head of the list.
> >   * @member:  the name of the hlist_nulls_node within the struct.
> >   *
> >   * The barrier() is needed to make sure compiler doesn't cache first
> element [1],
> > @@ -124,7 +124,7 @@ static inline void hlist_nulls_add_head_rcu(struct
> hlist_nulls_node *n,
> >   *   iterate over list of given type safe against removal of list entr=
y
> >   * @tpos:    the type * to use as a loop cursor.
> >   * @pos:     the &struct hlist_nulls_node to use as a loop cursor.
> > - * @head:    the head for your list.
> > + * @head:    the head of the list.
> >   * @member:  the name of the hlist_nulls_node within the struct.
> >   */
> >  #define hlist_nulls_for_each_entry_safe(tpos, pos, head, member)
>      \
> > --
> > 2.17.1
> >
>
=E1=90=A7

--0000000000001fbdd7059903ebaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 6, 2019 at 5:34 AM Paul E=
. McKenney &lt;<a href=3D"mailto:paulmck@kernel.org">paulmck@kernel.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On F=
ri, Dec 06, 2019 at 12:23:52AM +0530, <a href=3D"mailto:madhuparnabhowmik04=
@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> wrote:<br>
&gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik04@gma=
il.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt; <br>
&gt; This patch changes the docbook comment &quot;head for your list&quot;<=
br>
&gt; to &quot;head of the list&quot;.<br>
&gt; <br>
&gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhow=
mik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br=
>
<br>
I applied both with some updates to the subject line and commit log.<br>
Could you please double-check for errors on my part?</blockquote><div>=C2=
=A0</div><div>=C2=A0Yes, I checked, it seems alright.=C2=A0</div><div><br><=
/div><div>Thank you,</div><div>Madhuparna</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"> <br></blockquote><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
<br>
&gt; ---<br>
&gt;=C2=A0 include/linux/rculist_nulls.h | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nul=
ls.h<br>
&gt; index 517a06f36c7a..bea311c884b3 100644<br>
&gt; --- a/include/linux/rculist_nulls.h<br>
&gt; +++ b/include/linux/rculist_nulls.h<br>
&gt; @@ -104,7 +104,7 @@ static inline void hlist_nulls_add_head_rcu(struct=
 hlist_nulls_node *n,<br>
&gt;=C2=A0 =C2=A0* hlist_nulls_for_each_entry_rcu - iterate over rcu list o=
f given type<br>
&gt;=C2=A0 =C2=A0* @tpos:=C2=A0 =C2=A0 the type * to use as a loop cursor.<=
br>
&gt;=C2=A0 =C2=A0* @pos:=C2=A0 =C2=A0 =C2=A0the &amp;struct hlist_nulls_nod=
e to use as a loop cursor.<br>
&gt; - * @head:=C2=A0 =C2=A0 the head for your list.<br>
&gt; + * @head:=C2=A0 =C2=A0 the head of the list.<br>
&gt;=C2=A0 =C2=A0* @member:=C2=A0 the name of the hlist_nulls_node within t=
he struct.<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* The barrier() is needed to make sure compiler doesn&#39;=
t cache first element [1],<br>
&gt; @@ -124,7 +124,7 @@ static inline void hlist_nulls_add_head_rcu(struct=
 hlist_nulls_node *n,<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0iterate over list of given type safe against=
 removal of list entry<br>
&gt;=C2=A0 =C2=A0* @tpos:=C2=A0 =C2=A0 the type * to use as a loop cursor.<=
br>
&gt;=C2=A0 =C2=A0* @pos:=C2=A0 =C2=A0 =C2=A0the &amp;struct hlist_nulls_nod=
e to use as a loop cursor.<br>
&gt; - * @head:=C2=A0 =C2=A0 the head for your list.<br>
&gt; + * @head:=C2=A0 =C2=A0 the head of the list.<br>
&gt;=C2=A0 =C2=A0* @member:=C2=A0 the name of the hlist_nulls_node within t=
he struct.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #define hlist_nulls_for_each_entry_safe(tpos, pos, head, member)=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div></div><div hspace=3D"streak-pt-mark" style=3D"max-height=
:1px"><img alt=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=
=3D"https://mailfoogae.appspot.com/t?sender=3DabWFkaHVwYXJuYWJob3dtaWswNEBn=
bWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D2898abe1-2c32-4cb4-a621-66=
d629dc236d"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div>

--0000000000001fbdd7059903ebaa--

--===============1542323237780880182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1542323237780880182==--
