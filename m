Return-Path: <SRS0=D/zP=C2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0781CC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 13:09:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 696A621582
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 13:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAUzrYsg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 696A621582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0581A87606;
	Thu, 17 Sep 2020 13:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epaTuulm6J8L; Thu, 17 Sep 2020 13:09:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 50E6F875FF;
	Thu, 17 Sep 2020 13:09:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44DBEC0864;
	Thu, 17 Sep 2020 13:09:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A254C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 13:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6867987600
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 13:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRwGO2ACthtm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 13:09:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7DC13875FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 13:09:29 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id x69so2376920oia.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=An2RDFVNHCh0mUzSn4u3T8b4tHmZPQVYjNiRpRZnOGc=;
 b=pAUzrYsgXv90W4cRvCzM8ZhbtTaz2RJEoXRnPQXIYDv6rWoF+6YBz+gOQfQApse/od
 Y45e9pPqPmQHhhMcgxsvDAsmgeplqjhKmozPQFj4/44MqtvStNfkioL23/3FFZEbi08E
 /rLPow2psOBqwkUDpMSuwaL3d/SMRWZYvWvhv8mgrlt4jnyQyrRHdD/DI171MjRCKlcL
 UShDLhy8Yo9TXkv2Y+5ZSzDkzEJS9bqUe9evO9rQC/0qPAlRt+ttSYQQDTNqzWOpIVJt
 SfFZfuKUOIs+mqA85z74a5Jb3HLKRvryvgbB6s/dOQRqg4yzdJv9thp1+l31TR0Mw/Wd
 XB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=An2RDFVNHCh0mUzSn4u3T8b4tHmZPQVYjNiRpRZnOGc=;
 b=NEDiZfuqP0ppywfbm3ig1x81zCLaCSO8KKT9fXt4FH4CW9sDH8uovxKGIv47eqpAek
 qJ4GLOJ2K1aG/I7W6SaHkQowVtG5BIFklsqjm0zmrZXdV24urOYuNY5aDAkuljKUo0rk
 P3PrPVdCRFAGfWNwUw4Miqk5MOYbIPG6dz5m5HKKDzb3qAD4w010ohKVmlvQn2hhVDVT
 9O0SOWGO1YhpuDmaxwWcfPGKZvf6smEzGlns97ScPrj3OvMWskdnjwKh11g2iCQnBZ50
 svkXACvDRc3EX6OKI8La0H9yIvn++RiBptqNsMsfh79Ohv7yQnl9B3l2L37lhyJTAyzs
 JqzQ==
X-Gm-Message-State: AOAM532KBSGryv4QtD1q+07cYwOS/Qdom1eIZYmnC23Qh9u1l63JAOqn
 debLCjr706rqEYRADfOLs62iHafqt+7vjvHW/mE=
X-Google-Smtp-Source: ABdhPJwD4JNMHY63CrpjPBEDXopSFnSIHuw6vo11QIwqljku9LZE5QP/9gngx9WcR6oleS3zWYywcupi76dkUfICBGE=
X-Received: by 2002:aca:b2d7:: with SMTP id b206mr6068474oif.110.1600348168382; 
 Thu, 17 Sep 2020 06:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
 <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
 <alpine.DEB.2.21.2009140716420.7737@felia>
 <CABJPP5D87ZVTfZ4QHxp5vweTN16LQCy+rniq-uDVCvKkbYRDNg@mail.gmail.com>
 <alpine.DEB.2.21.2009141535010.17999@felia>
 <CABJPP5Aniv2kQ4wfAD9JuR_7Q5pjChasHZTAvBWOOaza4H3VSg@mail.gmail.com>
 <alpine.DEB.2.21.2009142016150.6496@felia>
 <CABJPP5DhzCHz6PM7bLzW9s1=VckN_+qnaUuYO148xSL59Q-pkA@mail.gmail.com>
 <alpine.DEB.2.21.2009160837380.10877@felia>
In-Reply-To: <alpine.DEB.2.21.2009160837380.10877@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 17 Sep 2020 18:39:10 +0530
Message-ID: <CABJPP5Dtz7VagfY+h2Qcm=XH6W7EQxXv1QReJLU9pnz2Jp_coQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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
Content-Type: multipart/mixed; boundary="===============0833352922240351334=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0833352922240351334==
Content-Type: multipart/alternative; boundary="00000000000017f02f05af8218b3"

--00000000000017f02f05af8218b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> If you do your homework, proper research what was decided in the past,
> proper evaluations what the difference of your change is, proper
> implementation, proper arguments for your change, it has high chances of
> being accepted. Many agree that checkpatch.pl can be useful, but many
> agree that it needs some improvements.
>
> It is certainly not a quick improvement, and needs some thought to make i=
t
> really better.
>
> >
> > > You can try to work that through or look for another case of potentia=
l
> > > checkpatch.pl improvement in your evaluation data.
>

Hi,
I would like to report you another finding about AUTHOR_SIGN_OFF.

I found that some commits with the same author mail and sign off mail
also threw off this warning when there were non-ascii characters in
the name.
Let me give some examples:

Commit 9d9cc58aff46 :

Author: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>
.....
Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyee=
tech.com>

As you can see, there should have been no error message, but checkpatch
gave this:

WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal
 patch author ''


Also commit 440d7a6f7390 and commit 424c85e1ffea by the same person
threw the error again. Evidently non ascii characters cause the parsing to
fail.
Both had the same chinese characters in the name.


I also found another person with the same issue.
Commit b03628b73564
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
...
Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>

Checkpatch gave the warning:
WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal
patch author '' . The string here is again empty.

Another same issue
Commit f0a087a533b3
Author: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala.com>
...
Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala.=
com>

So you see in all these cases non ascii characters are present. I looked
into checkpatch.pl .

line 2662:
        if (decode("MIME-Header", $line) =3D~ /^From:\s*(.*)/) {
           $author =3D $1;
            $author =3D encode("utf8", $author) if ($line =3D~ /=3D\?utf-8\=
?/i);
            $author =3D~ s/"//g;
            $author =3D reformat_email($author);
        }

When i looked into $line, it gave below:
From: =3D?UTF-8?q?=3DE5=3D91=3DA8=3DE7=3D90=3DB0=3DE6=3D9D=3DB0=3D20=3D28Zh=
ou=3D20Yanjie
=3D29?=3D <zhouyanjie@wanyeetech.com>

And at the end of this block, $author was equal to ''.
There seems to be a parsing problem there.

Does this seem like a proper fixable candidate?

Thanks,
Dwaipayan.

--00000000000017f02f05af8218b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><font color=3D"#4c1130">&gt; If you do your homewo=
rk, proper research what was decided in the past,<br>&gt; proper evaluation=
s what the difference of your change is, proper<br>&gt; implementation, pro=
per arguments for your change, it has high chances of<br>&gt; being accepte=
d. Many agree that <a href=3D"http://checkpatch.pl">checkpatch.pl</a> can b=
e useful, but many<br>&gt; agree that it needs some improvements.<br>&gt;<b=
r>&gt; It is certainly not a quick improvement, and needs some thought to m=
ake it<br>&gt; really better.<br>&gt;<br>&gt; &gt;<br>&gt; &gt; &gt; You ca=
n try to work that through or look for another case of potential<br>&gt; &g=
t; &gt; <a href=3D"http://checkpatch.pl">checkpatch.pl</a> improvement in y=
our evaluation data.<br>&gt;=C2=A0</font><br><div><font color=3D"#4c1130"><=
br></font></div><div><font color=3D"#000000">Hi,</font></div><div><font col=
or=3D"#000000">I would like to report you another finding about AUTHOR_SIGN=
_OFF.</font></div><div><font color=3D"#000000"><br></font></div><div><font =
color=3D"#000000">I found that some commits with the same author mail and s=
ign off mail=C2=A0</font></div><div><font color=3D"#000000">also threw=C2=
=A0</font><span style=3D"color:rgb(0,0,0)">off this warning when there were=
 non-ascii characters in</span></div><div><span style=3D"color:rgb(0,0,0)">=
the name.</span></div><div><font color=3D"#000000">Let me give some example=
s:</font></div><div><font color=3D"#000000"><br></font></div><div><font col=
or=3D"#000000">Commit=C2=A0</font>9d9cc58aff46 :</div><div><br></div><div>A=
uthor: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) &lt;<a href=3D"mailto:zhou=
yanjie@wanyeetech.com">zhouyanjie@wanyeetech.com</a>&gt;<br></div><div>....=
.</div><div>Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) &lt;<a=
 href=3D"mailto:zhouyanjie@wanyeetech.com">zhouyanjie@wanyeetech.com</a>&gt=
;<br></div><div><br></div><div>As you can see, there should have been no er=
ror message, but checkpatch</div><div>gave this:</div><div><br></div><div>W=
ARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal</div><div=
>=C2=A0patch author &#39;&#39;<br></div><div><br></div><div><br></div><div>=
Also commit=C2=A0440d7a6f7390 and commit=C2=A0424c85e1ffea by the same pers=
on=C2=A0</div><div>threw the error again. Evidently non ascii characters ca=
use the parsing to fail.</div><div>Both had the same chinese characters in =
the name.</div><div><br></div><div><br></div><div>I also found another pers=
on with the same issue.</div><div>Commit=C2=A0b03628b73564</div><div>Author=
: Niklas S=C3=B6derlund &lt;<a href=3D"mailto:niklas.soderlund%2Brenesas@ra=
gnatech.se">niklas.soderlund+renesas@ragnatech.se</a>&gt;<br></div><div>...=
</div><div>Signed-off-by: Niklas S=C3=B6derlund &lt;<a href=3D"mailto:nikla=
s.soderlund%2Brenesas@ragnatech.se">niklas.soderlund+renesas@ragnatech.se</=
a>&gt;<br></div><div><br></div><div>Checkpatch gave the warning:</div><div>=
WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal=C2=A0</d=
iv><div>patch author &#39;&#39; . The string here is again empty.<br></div>=
<div><br></div><div>Another same issue</div><div>Commit=C2=A0f0a087a533b3</=
div><div>Author:=C2=A0Vesa J=C3=A4=C3=A4skel=C3=A4inen &lt;<a href=3D"mailt=
o:vesa.jaaskelainen@vaisala.com">vesa.jaaskelainen@vaisala.com</a>&gt;</div=
><div>...</div><div>Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen &lt;<a =
href=3D"mailto:vesa.jaaskelainen@vaisala.com">vesa.jaaskelainen@vaisala.com=
</a>&gt;<br></div><div><br></div><div>So you see in all these cases non asc=
ii characters are present. I looked=C2=A0</div><div>into <a href=3D"http://=
checkpatch.pl">checkpatch.pl</a> .</div><div><br></div><div>line 2662:</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (decode(&quot;MIME-Header&quot;, $line=
) =3D~ /^From:\s*(.*)/) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$auth=
or =3D $1;=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $author =3D e=
ncode(&quot;utf8&quot;, $author) if ($line =3D~ /=3D\?utf-8\?/i);<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $author =3D~ s/&quot;//g;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $author =3D reformat_email($author);=C2=A0<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></div><div><br></div><div>When i looked=
 into $line, it gave below:</div><div>From: =3D?UTF-8?q?=3DE5=3D91=3DA8=3DE=
7=3D90=3DB0=3DE6=3D9D=3DB0=3D20=3D28Zhou=3D20Yanjie</div><div>=3D29?=3D=C2=
=A0&lt;<a href=3D"mailto:zhouyanjie@wanyeetech.com">zhouyanjie@wanyeetech.c=
om</a>&gt;<br></div><div><br></div><div>And at the end of this block, $auth=
or was equal to &#39;&#39;.</div><div>There seems to be a parsing problem t=
here.</div><div><br></div><div>Does this seem like a proper fixable candida=
te?<br></div><div><br></div><div>Thanks,</div><div>Dwaipayan.</div><div><br=
></div></div>

--00000000000017f02f05af8218b3--

--===============0833352922240351334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0833352922240351334==--
