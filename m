Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EC7C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 07:02:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12F8520714
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 07:02:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVU4e4AA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12F8520714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BFABF86D94;
	Fri, 24 Jul 2020 07:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGYTRslVX4ov; Fri, 24 Jul 2020 07:02:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B8D5186910;
	Fri, 24 Jul 2020 07:02:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B220DC004D;
	Fri, 24 Jul 2020 07:02:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70DEDC004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 07:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 55B76883D4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 07:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BggjI6XvsVK
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 07:02:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0D7CD882E0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 07:02:47 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w2so4716453pgg.10
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=u+b+JO91iJDMESVyeyBSMdUzjBEwfWK0uA3dcdJVx5E=;
 b=FVU4e4AA9wla2nRLVwXhw4HyHR939b1eU9guVe8ZTiF7XiHkKQdzgN9JCb6F1Ezpq3
 iM0DA5+oUaje2V+L5WOIA8ql9CDAIpg7Jq31h0pXoHZdggq1d8gUQ18aGUfFfIunEPLu
 DCkC0B/dMIHYXHsZ+OuKDHiO1emlgbT2VQjwL8C6Xvp5yeTiWHjN4T4wO1LNrGv38IVo
 ysJHfhkeb/y4FNg2l/1p4/7hirwH2o3U9Omd3cKrSfSwxRNuIhx39VxijJnAQ7L3TbgJ
 YlbMvfVy6/Emm+Mafjn6/EGxFiGiSpHHMzHqUR0ENZ/XnK0gYzBNxIPEdk2peIqIGLEM
 c4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=u+b+JO91iJDMESVyeyBSMdUzjBEwfWK0uA3dcdJVx5E=;
 b=IFKKGbllE4u43/aasW1huoCQv7WXD9w/VYgQs2Y8XUY3C1TOsET0iFnQFAI8ge222h
 sVBY/zzgfy860Iy3aPERFNTEJFFfapa+eK+dP98Cs2L3+GcjsEjT6HE5qD7bajuzk/vp
 syNaKJPQcGCtKXw21htDkgiahzxiEbaGdAWhAbudL7RJ37mae63kuW7CN49QO9gODokL
 wTHKwKMzK4RxJvu3RJOCWdoJZh01vFwTVq3/9pIIgd6VYqWXPGZ/7Bfg4w6t4KidhSJ3
 kkyvv+JCZ+B+YtjpvbO7DEkcs3bsqnpo5uswo65xHIBX/lOKQ821+ZWzxFle2gQVBuGe
 SfIg==
X-Gm-Message-State: AOAM530A6XnHBTUTCgxdWxo0w8NEdIG2YBV4V9vaqWA6AUYlcoNPOvDn
 M8h9u3UIPLBfg1Ywq9eNSdkIU8aJx/DpPDdN9NA=
X-Google-Smtp-Source: ABdhPJytgnUaMdXv0TyTcGVuODUcxAnClJHBXeJii1Nhzwjb0rBIlKwI4nH9QK0fVI9IYLLGDgblSLX7iZ/JaYIhMgU=
X-Received: by 2002:a05:6a00:228e:: with SMTP id
 f14mr5385470pfe.122.1595574166367; 
 Fri, 24 Jul 2020 00:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200721054419.kab7i6l6zkioddh5@mrinalpandey>
 <alpine.DEB.2.21.2007221207260.10005@felia>
In-Reply-To: <alpine.DEB.2.21.2007221207260.10005@felia>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Fri, 24 Jul 2020 12:32:34 +0530
Message-ID: <CAD1=X6mvdYOfGg__UNHKAskf8Oe17p9V2Rj8jEaRY1CbstoTCw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license
	check for scripts
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
Content-Type: multipart/mixed; boundary="===============1857306802082969244=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1857306802082969244==
Content-Type: multipart/alternative; boundary="00000000000066310d05ab2a8fe9"

--00000000000066310d05ab2a8fe9
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 22, 2020 at 3:51 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
>
> On Tue, 21 Jul 2020, Mrinal Pandey wrote:
>
> > In all the scripts, the SPDX license should be on the second line,
> > the first line being the shebang, but checkpatch issues a warning
> > "Misplaced SPDX-License-Identifier tag - use line 1 instead" for the
> > scripts that have SPDX license in the second line.
> >
>
> That what you wrote is actually wrong. Checkpatch only wrongly warns if
> the first line is not included in the diff, right? Otherwise, it does not
> warn as intended.
>

Sir,

Yes. I would modify the description accordingly.

>
> > However, this warning is not issued when checkpatch is run on a file.
> > The case for files has been handled gracefully by checking first line of
> > the file to be a shebang and then setting `$checklicenseline` to `2`but
> > this doesn't work when we don't have shebang in diff content of a patch
> > and `$checklicenseline` continues to be `1` in such cases. Therefore,
> > checkpatch expects the line `1` to contain the SPDX license when it
> > should have been `2` instead.
> >
>
> It is described very complicated here. Maybe think about rephrasing it, so
> it becomes more clear.
>

> > I noticed this false positive while running checkpatch on the set of
> > commits from v5.7 to v5.8-rc1 of the kernel on the commits which modified
> > a script file.
> >
>
> How about naming the commits and providing a statistics how often that
> happens?
>
> > This false positive exists in checkpatch since commit a8da38a9cf0e
> > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> > when the corresponding rule was first commited.
> >
> > Fix this by setting `$checklicenseline` to `2` whenever the file or diff
> > content we are checking comes from a script instead of checking first
> > line to be a shebang, thus, informing checkpatch that the SPDX license
> > should be expected on the second line.
> >
>
> Well, now the critical part:
>
> It seems that this now makes the situation worse compared to before.
>
> I quickly ran this evaluation:
>
> $ cat first-line.sh
> #!/bin/bash
>
> for file in $(git ls-files)
> do
>         firstline="$(head --silent -n 1 $file)"
>         echo "$file: $firstline"
> done
>
> $ sh ./first-line.sh > first-lines
>
> $ grep "#!" first-lines | wc -l
> 810
>
> $ grep "#!" first-lines | sed 's/^\(.*[^\]*\):.*$/\1/' | grep -v "\."
>
> $ grep "#!" first-lines | sed 's/^\(.*[^\]*\):.*$/\1/' | grep -v "\." | wc
> -l
> 120
>
> $ grep "#!" first-lines | sed 's/^\(.*[^\]*\):.*$/\1/' | rev | cut -d"/"
> -f1 | rev | grep  "\." | cut -d"." -f2 | sort | uniq -c | sort -nr
>     509 sh
>      91 tc
>      45 pl
>      37 py
>       6 awk
>       1 config
>
> So, in 120 cases you actually would now warn on line 1 where the should be
> a shebang as intended.
>
> Also, I cross-checked .yaml files:
>
> $ grep "\.yaml:" first-lines | grep "SPDX-License-Identifier"  | wc -l
> 1035
>
> $ grep "\.yaml:" first-lines | wc -l
> 1037
>
>
> So, for yaml, SPDX is actually in line 1.
>

Yes, I should remove the `yaml` files from this check.

>
>
> I guess you need to think about this a bit more.
>

If I am correct now we have an issue with all those files which are scripts
without an extension.
In this case, the earlier logic which I removed was working fine(now I get
an idea of why it was like
that in the first place). I think the best way is to keep both my suggested
change and the logic that
already exists so that we can at least avoid those false positives when we
know the extension without
essentially duplicating the logic.
Checking for files with no extension, no shebang and only SPDX in diff is
tricky since we can't actually open the file.
Please let me know your views.

Thank you.

>
>
> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 4c820607540b..bdd2f9a80891 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3166,10 +3166,11 @@ sub process {
> >               }
> >
> >  # check for using SPDX license tag at beginning of files
> > +             if ($realfile =~ /.*\.\(py\|sh\|pl\|awk\|tc\|yaml\)/) {
> > +                     $checklicenseline = 2;
> > +             }
> >               if ($realline == $checklicenseline) {
> > -                     if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
> > -                             $checklicenseline = 2;
> > -                     } elsif ($rawline =~ /^\+/) {
> > +                     if ($rawline =~ /^\+/) {
> >                               my $comment = "";
> >                               if ($realfile =~ /\.(h|s|S)$/) {
> >                                       $comment = '/*';
> > --
> > 2.25.1
> >
> >
>

--00000000000066310d05ab2a8fe9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 22, 2020 at 3:51 PM Lukas=
 Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
<br>
On Tue, 21 Jul 2020, Mrinal Pandey wrote:<br>
<br>
&gt; In all the scripts, the SPDX license should be on the second line,<br>
&gt; the first line being the shebang, but checkpatch issues a warning<br>
&gt; &quot;Misplaced SPDX-License-Identifier tag - use line 1 instead&quot;=
 for the<br>
&gt; scripts that have SPDX license in the second line.<br>
&gt;<br>
<br>
That what you wrote is actually wrong. Checkpatch only wrongly warns if <br=
>
the first line is not included in the diff, right? Otherwise, it does not <=
br>
warn as intended.<br></blockquote><div><br></div><div>Sir,</div><div><br></=
div><div>Yes. I would modify the description accordingly.<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; However, this warning is not issued when checkpatch is run on a file.<=
br>
&gt; The case for files has been handled gracefully by checking first line =
of<br>
&gt; the file to be a shebang and then setting `$checklicenseline` to `2`bu=
t<br>
&gt; this doesn&#39;t work when we don&#39;t have shebang in diff content o=
f a patch<br>
&gt; and `$checklicenseline` continues to be `1` in such cases. Therefore,<=
br>
&gt; checkpatch expects the line `1` to contain the SPDX license when it<br=
>
&gt; should have been `2` instead.<br>
&gt;<br>
<br>
It is described very complicated here. Maybe think about rephrasing it, so =
<br>
it becomes more clear.<br></blockquote><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
&gt; I noticed this false positive while running checkpatch on the set of<b=
r>
&gt; commits from v5.7 to v5.8-rc1 of the kernel on the commits which modif=
ied<br>
&gt; a script file.<br>
&gt;<br>
<br>
How about naming the commits and providing a statistics how often that <br>
happens?<br>
<br>
&gt; This false positive exists in checkpatch since commit a8da38a9cf0e<br>
&gt; (&quot;checkpatch: add test for SPDX-License-Identifier on wrong line =
#&quot;)<br>
&gt; when the corresponding rule was first commited.<br>
&gt; <br>
&gt; Fix this by setting `$checklicenseline` to `2` whenever the file or di=
ff<br>
&gt; content we are checking comes from a script instead of checking first<=
br>
&gt; line to be a shebang, thus, informing checkpatch that the SPDX license=
<br>
&gt; should be expected on the second line.<br>
&gt;<br>
<br>
Well, now the critical part:<br>
<br>
It seems that this now makes the situation worse compared to before.<br>
<br>
I quickly ran this evaluation:<br>
<br>
$ cat first-line.sh <br>
#!/bin/bash<br>
<br>
for file in $(git ls-files)<br>
do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 firstline=3D&quot;$(head --silent -n 1 $file)&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$file: $firstline&quot;<br>
done<br>
<br>
$ sh ./first-line.sh &gt; first-lines<br>
<br>
$ grep &quot;#!&quot; first-lines | wc -l<br>
810<br>
<br>
$ grep &quot;#!&quot; first-lines | sed &#39;s/^\(.*[^\]*\):.*$/\1/&#39; | =
grep -v &quot;\.&quot;<br>
<br>
$ grep &quot;#!&quot; first-lines | sed &#39;s/^\(.*[^\]*\):.*$/\1/&#39; | =
grep -v &quot;\.&quot; | wc <br>
-l<br>
120<br>
<br>
$ grep &quot;#!&quot; first-lines | sed &#39;s/^\(.*[^\]*\):.*$/\1/&#39; | =
rev | cut -d&quot;/&quot; <br>
-f1 | rev | grep=C2=A0 &quot;\.&quot; | cut -d&quot;.&quot; -f2 | sort | un=
iq -c | sort -nr<br>
=C2=A0 =C2=A0 509 sh<br>
=C2=A0 =C2=A0 =C2=A091 tc<br>
=C2=A0 =C2=A0 =C2=A045 pl<br>
=C2=A0 =C2=A0 =C2=A037 py<br>
=C2=A0 =C2=A0 =C2=A0 6 awk<br>
=C2=A0 =C2=A0 =C2=A0 1 config<br>
<br>
So, in 120 cases you actually would now warn on line 1 where the should be<=
br>
a shebang as intended.<br>
<br>
Also, I cross-checked .yaml files:<br>
<br>
$ grep &quot;\.yaml:&quot; first-lines | grep &quot;SPDX-License-Identifier=
&quot;=C2=A0 | wc -l<br>
1035<br>
<br>
$ grep &quot;\.yaml:&quot; first-lines | wc -l<br>
1037<br>
<br>
<br>
So, for yaml, SPDX is actually in line 1.<br></blockquote><div><br></div><d=
iv>Yes, I should remove the `yaml` files from this check. <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
I guess you need to think about this a bit more.<br></blockquote><div><br><=
/div><div>If I am correct now we have an issue with all those files which a=
re scripts without an extension.</div><div>In this case, the earlier logic =
which I removed was working fine(now I get an idea of why it was like</div>=
<div>that in the first place). I think the best way is to keep both my sugg=
ested change and the logic that</div><div>already exists so that we can at =
least avoid those false positives when we know the extension without</div><=
div>essentially duplicating the logic.</div><div>Checking for files with no=
 extension, no shebang and only SPDX in diff is tricky since we can&#39;t a=
ctually open the file.<br></div><div>Please let me know your views.</div><d=
iv><br></div><div>Thank you.<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
<br>
&gt; Signed-off-by: Mrinal Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com=
" target=3D"_blank">mrinalmni@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a> | 7 ++++---<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferre=
r" target=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpat=
ch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; index 4c820607540b..bdd2f9a80891 100755<br>
&gt; --- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; +++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; @@ -3166,10 +3166,11 @@ sub process {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # check for using SPDX license tag at beginning of files<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($realfile =3D~ /.=
*\.\(py\|sh\|pl\|awk\|tc\|yaml\)/) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$checklicenseline =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($realline =
=3D=3D $checklicenseline) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$checklicenseline =3D 2;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0} elsif ($rawline =3D~ /^\+/) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if ($rawline =3D~ /^\+/) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $comment =3D &quot;&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($realfile =3D~ /\.(h|s|S)$/) {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$comme=
nt =3D &#39;/*&#39;;<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--00000000000066310d05ab2a8fe9--

--===============1857306802082969244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1857306802082969244==--
