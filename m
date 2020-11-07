Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDB0C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 18:43:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A8220888
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 18:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prPaU/ys"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A8220888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 323AD8716C;
	Sat,  7 Nov 2020 18:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsMpilnUS+Jo; Sat,  7 Nov 2020 18:43:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5BC998712C;
	Sat,  7 Nov 2020 18:43:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45F8EC088B;
	Sat,  7 Nov 2020 18:43:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29A7BC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 135238693D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vsSZFhWernqv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:43:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CA27E85582
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:43:30 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t13so4587293ilp.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 10:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/5Og3sdSBO6BuNxTmVTLgcgY0wkp6td0eexZm2XJcKY=;
 b=prPaU/ysolfOqOVDd8LEpDJlYbdF+Xc6XmEEsTKHSeA6sgCU0k90BJoKjAWBMYhTiX
 sg2+k7YP0iPnXo2oPAthXygz429zpw0ZIaKC1gYjwt/3YayKN5R64UHnOq09kvaP65mF
 XQiRiXpzrLD7Al/7cl/V7Wv17CibaxW+G/HPw/j4HkrIpCBmqoeu/pJmEWLyRpNcbVHP
 nwMSzxDnIm4OqxCI0DY1aactywaSEWvOm3xtd4l4Ltcoe9CBx9wuyv9vyoLE1CplrNx+
 nEbjGpbXDVCQOB8AM0M7xlpXW1QloXS+SpCkysYyFJL+fXjDc7GceDR1dUs+8nshgM6H
 xptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5Og3sdSBO6BuNxTmVTLgcgY0wkp6td0eexZm2XJcKY=;
 b=YrRpIG4lMFridXa8PnvxbdY23TzBLTz4V7xQzvzx7pPP3vtRA6dAkCM9LHsazMs6il
 ax90ORV/jVK8LC2ryLwlAMHmX/5nscMjHkZahIkXCtxnxApxKZLiJZFwhchepWL3m2n4
 nwopJhK1kQyFPECt/bfE3mYt6sw0Z/u6vnKnUplwi69AQ6v1oq+kHyv48qMrmva1bKuF
 SidTfwmD2bf0wq/jBItz29jWGxgTZIZRpTdDCB/mJQCdMmKQSlxyB+nqTvySrspxmicH
 MgWhwBrMfEBpek0ThmTm0XB9I6VWiMI/sVyeI8+uKRJtfaVNO3g3TQ59X+t/NNDGteFx
 i+zA==
X-Gm-Message-State: AOAM532psgHCklIT5luVYvmTdfQ/POhaNzM1IBEY6FM8lZo+9R+9iz0e
 BWw5zXTBTXns4Eq4Gyen8LJWrL+1bvalNDCb9trfOdL9
X-Google-Smtp-Source: ABdhPJzRE6E8N4UfpuPkEJHGrLgL/WOArxodVMvM/IjIoQ9pn0j33843lOjqrxnwlrfJ2bdVV6gEzNjVNO/HYYGlHpk=
X-Received: by 2002:a92:2c06:: with SMTP id t6mr5292024ile.125.1604774610077; 
 Sat, 07 Nov 2020 10:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20201107121742.27144-1-yashsri421@gmail.com>
 <2837bf55-4bab-ffcc-843c-318c7de26ff4@gmail.com>
In-Reply-To: <2837bf55-4bab-ffcc-843c-318c7de26ff4@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 7 Nov 2020 19:43:18 +0100
Message-ID: <CAKXUXMxix-9oWtpbS1kAK+PY7hsNuKs7_z3GDvDyJHRadSZYNw@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for COMMIT_LOG_LONG_LINE
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
Content-Type: multipart/mixed; boundary="===============8132065773631072705=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8132065773631072705==
Content-Type: multipart/alternative; boundary="000000000000940a9305b388b4ee"

--000000000000940a9305b388b4ee
Content-Type: text/plain; charset="UTF-8"

On Sa., 7. Nov. 2020 at 15:49, Aditya <yashsri421@gmail.com> wrote:

> On 7/11/20 5:47 pm, Aditya Srivastava wrote:
> > Currently, when a line exceeds 75 characters in a commit message,
> > checkpatch.pl gives a warning corresponding to the same.
> >
> > E.g., running checkpatch on commit a1af2afbd244 ("drm/nouveau/volt:Fix
> > for some cards having 0 maximum voltage") we get this warning:
> >
> > WARNING: Possible unwrapped commit description (prefer a maximum 75
> > chars per line)
> >
> > Some, mostly Fermi, vbioses appear to have zero max voltage. That causes
> Nouveau to not parse voltage entries, thus users not being able to set
> higher clocks.
> >
> > Provide a fix by consuming first 70 chars of the corresponding line,
> > then stop at the next whitespace, and substitute it with the consumed
> > chars and a newline char.
> >
> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 5a1096a4e220..ee665208ef02 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2881,8 +2881,11 @@ sub process {
> >                     $line =~ /^\s*(?:Fixes:|Link:)/i ||
> >                                       # A Fixes: or Link: line
> >                     $commit_log_possible_stack_dump)) {
> > -                     WARN("COMMIT_LOG_LONG_LINE",
> > -                          "Possible unwrapped commit description
> (prefer a maximum 75 chars per line)\n" . $herecurr);
> > +                     if (WARN("COMMIT_LOG_LONG_LINE",
> > +                              "Possible unwrapped commit description
> (prefer a maximum 75 chars per line)\n" . $herecurr) &&
> > +                         $fix) {
> > +                             $fixed[$fixlinenr] =~
> s/(.{70}[^\s]*)\s+/$1\n/g;
> > +                     }
> >                       $commit_log_long_line = 1;
> >               }
> >
> >
>

Why do you not implement a proper word wrap function?

A single commit tells us very little if this rule in checkpatch.pl really
is a good rule or not. A proper evaluation of typical cases of long commit
lines would help much more to improve this rule.

Lukas


> Changes made in v2:
> - Changing newline at whitespace instead of abrupt termination
> - The special line cases such as 'Link', 'Fixes' or code addition
> lines, etc. seem to be already excluded from this warning in the
> if-block statements above the warning statement.
>
>
> Thanks
> Aditya
>

--000000000000940a9305b388b4ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Sa.=
, 7. Nov. 2020 at 15:49, Aditya &lt;<a href=3D"mailto:yashsri421@gmail.com"=
>yashsri421@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">On 7/11/20 5:47 pm, Aditya Srivastava wrote:<br>
&gt; Currently, when a line exceeds 75 characters in a commit message,<br>
&gt; <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">=
checkpatch.pl</a> gives a warning corresponding to the same.<br>
&gt; <br>
&gt; E.g., running checkpatch on commit a1af2afbd244 (&quot;drm/nouveau/vol=
t:Fix<br>
&gt; for some cards having 0 maximum voltage&quot;) we get this warning:<br=
>
&gt; <br>
&gt; WARNING: Possible unwrapped commit description (prefer a maximum 75<br=
>
&gt; chars per line)<br>
&gt; <br>
&gt; Some, mostly Fermi, vbioses appear to have zero max voltage. That caus=
es Nouveau to not parse voltage entries, thus users not being able to set h=
igher clocks.<br>
&gt; <br>
&gt; Provide a fix by consuming first 70 chars of the corresponding line,<b=
r>
&gt; then stop at the next whitespace, and substitute it with the consumed<=
br>
&gt; chars and a newline char.<br>
&gt; <br>
&gt; Signed-off-by: Aditya Srivastava &lt;<a href=3D"mailto:yashsri421@gmai=
l.com" target=3D"_blank">yashsri421@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a> | 7 +++++--<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferre=
r" target=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpat=
ch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; index 5a1096a4e220..ee665208ef02 100755<br>
&gt; --- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; +++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; @@ -2881,8 +2881,11 @@ sub process {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$line =3D~ /^\s*(?:Fixes:|Link:)/i ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# A Fi=
xes: or Link: line<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$commit_log_possible_stack_dump)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0WARN(&quot;COMMIT_LOG_LONG_LINE&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;Possible unwrapped commit description (prefer a=
 maximum 75 chars per line)\n&quot; . $herecurr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (WARN(&quot;COMMIT_LOG_LONG_LINE&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Possible unwrapped commit descrip=
tion (prefer a maximum 75 chars per line)\n&quot; . $herecurr) &amp;&amp;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0$fix) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$fixed[$fixlinenr] =3D~ s/(.{70}[^\s]*)\=
s+/$1\n/g;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0$commit_log_long_line =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; <br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Why do you not i=
mplement a proper word wrap function?</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">A single commit tells us very little if this rule in <a href=
=3D"http://checkpatch.pl">checkpatch.pl</a> really is a good rule or not. A=
 proper evaluation of typical cases of long commit lines would help much mo=
re to improve this rule.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Lukas</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Changes made in v2:<br>
- Changing newline at whitespace instead of abrupt termination<br>
- The special line cases such as &#39;Link&#39;, &#39;Fixes&#39; or code ad=
dition<br>
lines, etc. seem to be already excluded from this warning in the<br>
if-block statements above the warning statement.<br>
<br>
<br>
Thanks<br>
Aditya<br>
</blockquote></div></div>

--000000000000940a9305b388b4ee--

--===============8132065773631072705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8132065773631072705==--
