Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C5AC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 19:50:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F2FD20878
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 19:50:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOgV0Qpy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F2FD20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7B38A228CA;
	Mon, 12 Oct 2020 19:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRy68PLKxpCd; Mon, 12 Oct 2020 19:50:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 12AE4228B4;
	Mon, 12 Oct 2020 19:50:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB17FC07FF;
	Mon, 12 Oct 2020 19:50:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DBA7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 70D9F872E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2BjD3pIasB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:50:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8E979872D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:50:00 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id q1so17063259ilt.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 12:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HSXf5aM6XCrHARRP0Cqydi/xh9VSB3IWQk1zjuEwZ4I=;
 b=MOgV0QpypK33eR8PmyRJDwP8BMmBWtXYiRQYuogHJHrKxoSaMlU8slEZmmyvGPUktC
 TDWgZTKDSCQ7NBdOeUq9XM4Ins8NFtMybEvK23iWshN1KZRmbkIUmtIy8aQYpUWYfWF1
 YCQoJ2XmQ1FjaguFuhlULW/lNM/cgpG9RpTlHBCevqfQ9i1MY841Pvpd1wPWoO9hbJYr
 RUuwhO+oYLCQ6bc/qlKMMOTJgOYAIB/S5Mmdc7SNqQ9T8PmItd3fIRiyf+LQ4q8bKbxQ
 8s5ifIbUIItFN2uwzw7VS+sCbvgIdkKYLyVkMHWGQ4RyRKq9rGQ3JYgS4key6u4XgByb
 sGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HSXf5aM6XCrHARRP0Cqydi/xh9VSB3IWQk1zjuEwZ4I=;
 b=imbwzrCcK7FqKoZFr7NyEgqzhAZir0JXx78GEu12lj2WcV7pJx/u1c9msm3OnL9lzO
 zcsfIHqFgaQqLKBz2dEqC04JOi0eChZl6mysY8r+N3qjXb1EV3kjwF0a13HxK+bDgz8+
 qd2Mn4tBWK/B5B1Z5jLcGrhozoIuIu0ND+MBJNacsbdmS9LhyHsU8MO7aKZmipjdagUP
 speWRPR9OLRy2WpveYCG9JDGy1/8RVmVKJOMVYelWtSnyGteMlztmUBJxVg0VSpp4l4O
 cLol0An9M7hceP772AWZru1IKx66KAnJ5Iih3Z+7bXAPQjuvIz/I5mKWOjoQm0AZwd+O
 kBVQ==
X-Gm-Message-State: AOAM530bOEquku4MVy9RkEjuihO2w2VRcVAg5Zyu5aOAKnpaUYOrFU8h
 9Xmvn9j6y8BIMgdwxHMN0Jtivh+I3dp2W/juCJw=
X-Google-Smtp-Source: ABdhPJw7HrPv3Y4ZM11RVqUFBRaHuBu1AIkaaF1e1Sg1oC3hiAdhlXg9YZQmoX+2HF3+lG8313dENj7XSMFh6dCHNII=
X-Received: by 2002:a05:6e02:4af:: with SMTP id
 e15mr364836ils.64.1602532199695; 
 Mon, 12 Oct 2020 12:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201012191434.365769-1-dwaipayanray1@gmail.com>
 <CABJPP5CStDPHyV9MSgqueqfB8ZKdSgDZetXuRNbZZ1+Pk2aCdA@mail.gmail.com>
In-Reply-To: <CABJPP5CStDPHyV9MSgqueqfB8ZKdSgDZetXuRNbZZ1+Pk2aCdA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 12 Oct 2020 21:49:48 +0200
Message-ID: <CAKXUXMzwHNhsi6+6J8Ajs-ZPe4McgJ+BgMfp7Apnznj_p55z0g@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: formatted email
 should have a whitespace separating address and comment
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
Content-Type: multipart/mixed; boundary="===============7969978735784019172=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7969978735784019172==
Content-Type: multipart/alternative; boundary="00000000000081096705b17e9aac"

--00000000000081096705b17e9aac
Content-Type: text/plain; charset="UTF-8"

The commit message header should be in imperative and it should be shorter.
I think something up to sixty characters is preferred.

Lukas

On Mo., 12. Okt. 2020 at 21:31, Dwaipayan Ray <dwaipayanray1@gmail.com>
wrote:

> On Tue, Oct 13, 2020 at 12:45 AM Dwaipayan Ray <dwaipayanray1@gmail.com>
> wrote:
> >
> > commit 0c01921 ("checkpatch: add new warnings to author signoff checks.")
> > introduced new checks for author sign off. The format_email procedure
> > was modified to add comment blocks to the formatted email. But no
> > space was added between email address and the mail comment.
> >
> > This caused issues in some cases where the email was in the form
> > of "author@example.com (Comment block)". The formatted email removed
> > the space at the end of address.
> >
> > An evaluation on checkpatch brought up this case. For example,
> > on commit 1129d31b55d5 ("ima: Fix ima digest hash table key
> calculation"),
> > the following warning was reported:
> >
> > WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
> > system concerns)' might be better as 'David.Laight@aculab.com(big endian
> > system concerns)'
> >
> > Resolved this by adding a single space in between the address and comment
> > when the extracted comment is not empty.
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 124ff9432b51..6000addf1af3 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -1201,7 +1201,9 @@ sub format_email {
> >         } else {
> >                 $formatted_email = "$name$name_comment <$address>";
> >         }
> > -       $formatted_email .= "$comment";
> > +       if ("$comment" ne "") {
> > +               $formatted_email .= " $comment";
> > +       }
> >         return $formatted_email;
> >  }
> >
> > --
> > 2.27.0
> >
>
> Found this issue while looking through the checkpatch records.
>
> Investigated this after looking into Aditya's summary at
>
> https://lore.kernel.org/linux-kernel-mentees/a1675970-9eb9-bd6a-31ff-d04f88ca30e2@gmail.com/
> and definitely the space bug was affecting and causing some issues.
>
> If it's alright, could I quickly send it over to Joe?
>
> Thanks,
> Dwaipayan.
>

--00000000000081096705b17e9aac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><div dir=3D"auto">The commit message header should be i=
n imperative and it should be shorter. I think something up to sixty charac=
ters is preferred.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Lukas=
</div><br><div class=3D"gmail_quote"><div>On Mo., 12. Okt. 2020 at 21:31, D=
waipayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail.com">dwaipayanray1@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Oct=
 13, 2020 at 12:45 AM Dwaipayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gma=
il.com" target=3D"_blank">dwaipayanray1@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; commit 0c01921 (&quot;checkpatch: add new warnings to author signoff c=
hecks.&quot;)<br>
&gt; introduced new checks for author sign off. The format_email procedure<=
br>
&gt; was modified to add comment blocks to the formatted email. But no<br>
&gt; space was added between email address and the mail comment.<br>
&gt;<br>
&gt; This caused issues in some cases where the email was in the form<br>
&gt; of &quot;<a href=3D"mailto:author@example.com" target=3D"_blank">autho=
r@example.com</a> (Comment block)&quot;. The formatted email removed<br>
&gt; the space at the end of address.<br>
&gt;<br>
&gt; An evaluation on checkpatch brought up this case. For example,<br>
&gt; on commit 1129d31b55d5 (&quot;ima: Fix ima digest hash table key calcu=
lation&quot;),<br>
&gt; the following warning was reported:<br>
&gt;<br>
&gt; WARNING:BAD_SIGN_OFF: email address &#39;<a href=3D"mailto:David.Laigh=
t@aculab.com" target=3D"_blank">David.Laight@aculab.com</a> (big endian<br>
&gt; system concerns)&#39; might be better as &#39;<a href=3D"mailto:David.=
Laight@aculab.com" target=3D"_blank">David.Laight@aculab.com</a>(big endian=
<br>
&gt; system concerns)&#39;<br>
&gt;<br>
&gt; Resolved this by adding a single space in between the address and comm=
ent<br>
&gt; when the extracted comment is not empty.<br>
&gt;<br>
&gt; Signed-off-by: Dwaipayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail=
.com" target=3D"_blank">dwaipayanray1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a> | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferre=
r" target=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpat=
ch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; index 124ff9432b51..6000addf1af3 100755<br>
&gt; --- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; +++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; @@ -1201,7 +1201,9 @@ sub format_email {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$formatte=
d_email =3D &quot;$name$name_comment &lt;$address&gt;&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$formatted_email .=3D &quot;$comment&quot;=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (&quot;$comment&quot; ne &quot;&quot;) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$formatted_ema=
il .=3D &quot; $comment&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return $formatted_email;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
<br>
Found this issue while looking through the checkpatch records.<br>
<br>
Investigated this after looking into Aditya&#39;s summary at<br>
<a href=3D"https://lore.kernel.org/linux-kernel-mentees/a1675970-9eb9-bd6a-=
31ff-d04f88ca30e2@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://=
lore.kernel.org/linux-kernel-mentees/a1675970-9eb9-bd6a-31ff-d04f88ca30e2@g=
mail.com/</a><br>
and definitely the space bug was affecting and causing some issues.<br>
<br>
If it&#39;s alright, could I quickly send it over to Joe?<br>
<br>
Thanks,<br>
Dwaipayan.<br>
</blockquote></div></div>

--00000000000081096705b17e9aac--

--===============7969978735784019172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7969978735784019172==--
