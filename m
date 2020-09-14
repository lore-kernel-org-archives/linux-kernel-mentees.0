Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE27C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 15:39:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD8120756
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 15:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwCOP5Kj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD8120756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD4DA867BF;
	Mon, 14 Sep 2020 15:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNnInxZGw0pB; Mon, 14 Sep 2020 15:39:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB913867B6;
	Mon, 14 Sep 2020 15:39:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A7FCC088B;
	Mon, 14 Sep 2020 15:39:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73639C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 15:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 627F585FA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 15:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OlUjPH6sGd78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 15:39:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9025B85DF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 15:39:18 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id w25so309307otk.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/6XbLiTgcqFMsXXEIEwTPG0GP8v3uWPc0jMERcqaE4=;
 b=QwCOP5KjvwvL+hFQu45XsBBMFB2/2FSpwAUvxCtTSt8Bp8E+wl4Ar77HrgSx5hO2ZO
 TRDJhepQ28PSnAK5sy2+cOP/zGVXtRMqJqJRsEKHvK77pnOY6nyayoVoOSCHiR0QU7zN
 2CNlLsbvgiRCHDruxxrBjjGQZd2XG/nAg+Hsm4fSXkYCliylprbxfFgycNHoa0+5MIvT
 z2q6N5XLZ5ItpHm5tUhIX8L89d5MESwY+DDYgX6uG+LFdxeAVGV832LwyEsU+IUeFJay
 qic+0HiMDNSPnQM+pOhbPzCK8+hDgfpFMbeU4S5AxHemWaPOxXD6oPFpaxEDHS9r6M5i
 2OuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/6XbLiTgcqFMsXXEIEwTPG0GP8v3uWPc0jMERcqaE4=;
 b=RLWSq234HpWCo8EhbXGVLQFYxukTXn83XgfoI/NKLAnl91HKm8O3+rQjADad2Jzx9B
 wVx4JVTrIZ/3l3L4rAqjP8ZfXj8ylaoqZr37/hvw69A9SaRz2ILGpW8BpKv9XxVYW6xk
 UR5bESZkBnGxSC7P/AVIIax0QWY1I5WpJU8jy02wxF+RoNeVP2IQo2jCE5nSisbObh98
 DNs8ljmB9E8mhgow1nZfF2/ePIt3T5/VGOb0yNLjuLrAzpm2gnUhv60ZszWvfycxTnHg
 I8MhBCXHrWQjtkburymUWXmjuIKpN3h6K7yy/FadXEPaw7aRq3rl8nG8fFYDpmQn8mYB
 PyOA==
X-Gm-Message-State: AOAM533zHyqwI2gXpClVwZE8WiH4hNWRlnMHm4IV0p91iYeH3lRw6h9/
 4KkM/GOUmK+p4QJqW9VvFi0Yy6/So7gIGVBw0tw=
X-Google-Smtp-Source: ABdhPJyvrjqvfD9gRz+usFLk6EdUp5EhCcQEpmWAM4TMHH/4vJHB6hKq1V4HsWeOcq2FTxeW3B1efMrSKGtuujWKcMI=
X-Received: by 2002:a05:6830:c4:: with SMTP id
 x4mr10252754oto.30.1600097957614; 
 Mon, 14 Sep 2020 08:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
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
In-Reply-To: <alpine.DEB.2.21.2009141535010.17999@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 14 Sep 2020 21:09:01 +0530
Message-ID: <CABJPP5Aniv2kQ4wfAD9JuR_7Q5pjChasHZTAvBWOOaza4H3VSg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6532568128790493008=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6532568128790493008==
Content-Type: multipart/alternative; boundary="0000000000005e9a7b05af47d699"

--0000000000005e9a7b05af47d699
Content-Type: text/plain; charset="UTF-8"

> > The third candidate is related to the warning:
> >
> > WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal
patch author ...
> >
> > I found several such commits in which the author had used different
mail addresses in the
> > signed-off -by section, due to which this warning is generated.
> >
> > An example is Commit dc5bdb68b5b3 .
> > Git log show:
> > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ....,.
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >
> > This is infact a common scenario. I easily found another commit
207324a321a8.
> > Git log shows:
> > Author: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
> > ...
> > Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
> >
> > This warning could be avoided or at least handled better.
> >
> >
> > I would like to know if any of them can be worked on.
> >
>
> This last one might be good to look into.
>
> But what is your specific solution you have in mind?
>
> There is a file .mailmap in the repository that allows some kind of
> mapping. Maybe that is helpful.
>
> I suggest that you describe your proposed change in a clear way.
> Then, we can discuss if that change is reasonable or not.

I checked the .mailmap file and it doesn't have all the email addresses. So
it might not
be effective.

checkpatch.pl seems to compare only the email addresses to determine
whether the author
has signed off.

checkpatch, line 2673:
if ($author ne '') {
                if (same_email_addresses($1, $author)) {
                    $authorsignoff = 1;
                }
            }

This causes numerous false positives if the author uses a different mail,
which seems to be quite frequent.

A possible solution would be to compare the names, i.e. $1 and $author, and
keep its result stored
in some variable authorsignoff_byname. If the author's mail is not found,
but his name matches,
there can be a better warning message on the lines of:
"Possible missing signed-off-by line by nominal author. Author's email
$email does not match signed off email. $email2"

Or, if the warning message cannot be changed, there could be verbose
information regarding the mismatch of email.
Is this feasible?

Thanks,
Dwaipayan.

--0000000000005e9a7b05af47d699
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><font color=3D"#4c1130">&gt; &gt; The third candidate =
is related to the warning:<br>&gt; &gt;<br>&gt; &gt; WARNING:NO_AUTHOR_SIGN=
_OFF: Missing Signed-off-by: line by nominal patch author ...<br>&gt; &gt;<=
br>&gt; &gt; I found several such commits in which the author had used diff=
erent mail addresses in the<br>&gt; &gt; signed-off -by section, due to whi=
ch this warning is generated.<br>&gt; &gt;<br>&gt; &gt; An example is Commi=
t dc5bdb68b5b3 .<br>&gt; &gt; Git log show:<br>&gt; &gt; Author: Daniel Vet=
ter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch">daniel.vetter@ffwll.ch</a=
>&gt;<br>&gt; &gt; ....,.<br>&gt; &gt; Signed-off-by: Daniel Vetter &lt;<a =
href=3D"mailto:daniel.vetter@intel.com">daniel.vetter@intel.com</a>&gt;<br>=
&gt; &gt;<br>&gt; &gt; This is infact a common scenario. I easily found ano=
ther commit 207324a321a8.<br>&gt; &gt; Git log shows:<br>&gt; &gt; Author: =
Minas Harutyunyan &lt;<a href=3D"mailto:Minas.Harutyunyan@synopsys.com">Min=
as.Harutyunyan@synopsys.com</a>&gt;<br>&gt; &gt; ...<br>&gt; &gt; Signed-of=
f-by: Minas Harutyunyan &lt;<a href=3D"mailto:hminas@synopsys.com">hminas@s=
ynopsys.com</a>&gt;<br>&gt; &gt;<br>&gt; &gt; This warning could be avoided=
 or at least handled better.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; I would=
 like to know if any of them can be worked on.<br>&gt; &gt;<br>&gt;<br>&gt;=
 This last one might be good to look into.<br>&gt;<br>&gt; But what is your=
 specific solution you have in mind?<br>&gt;<br>&gt; There is a file .mailm=
ap in the repository that allows some kind of<br>&gt; mapping. Maybe that i=
s helpful.<br>&gt;<br>&gt; I suggest that you describe your proposed change=
 in a clear way.<br>&gt; Then, we can discuss if that change is reasonable =
or not.</font><br><br>I checked the .mailmap file and it doesn&#39;t have a=
ll the email addresses. So it might not<br>be effective.<br><br><a href=3D"=
http://checkpatch.pl">checkpatch.pl</a> seems to compare only the email add=
resses to determine whether the author<br>has signed off.<br><br>checkpatch=
, line 2673:<br>if ($author ne &#39;&#39;) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (same_email_addresses($1, $author)) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $auth=
orsignoff =3D 1;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><div><br></div><div>Th=
is causes numerous false positives if the author uses a different mail, whi=
ch seems to be quite frequent.</div><div><br></div><div>A possible solution=
 would be to compare the names, i.e. $1 and $author, and keep its result st=
ored</div><div>in some variable authorsignoff_byname. If the author&#39;s m=
ail is not found, but his name matches,=C2=A0</div><div>there can be a bett=
er warning message on the lines of:<br>&quot;Possible missing signed-off-by=
 line by nominal author. Author&#39;s email $email does not match signed of=
f email. $email2&quot;</div><div><br></div><div>Or, if the warning message =
cannot be changed, there could be verbose information regarding the mismatc=
h of email.</div><div>Is this feasible?=C2=A0</div><div><br></div><div>Than=
ks,</div><div>Dwaipayan.</div><div><br></div><div><br></div></div>

--0000000000005e9a7b05af47d699--

--===============6532568128790493008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6532568128790493008==--
