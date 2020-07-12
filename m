Return-Path: <SRS0=cUZQ=AX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE24C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 19:36:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A9D9206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 19:36:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E++vVKLm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A9D9206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 66DB586EEA;
	Sun, 12 Jul 2020 19:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1wVshJg4FgMv; Sun, 12 Jul 2020 19:36:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4209E86ED4;
	Sun, 12 Jul 2020 19:36:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28809C088E;
	Sun, 12 Jul 2020 19:36:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 156A1C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 19:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0CA2488AE4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 19:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hr97eMjM-6G4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 19:36:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A97E388AAC
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 19:36:42 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id a12so11223431ion.13
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kBymcoAPhSivUl8ecZGsJA2x6cQ1QwvbsWHHQcLluPQ=;
 b=E++vVKLmWKfi9CgjGrTKoh6bH27SaGVLPsvNS5kWq+Zh7mTfHpFByX0COtzvROIyK/
 m4MKr1Ii1JB/Eh01RASTOEMa+5J9y9n0O5m19MCll/2TOE5A6bOzECFepB2USUM5O+do
 xr+qyjBg2XHO7gML4oSpBo6ApmhLYt+BQUL8dztsnj+ozMv0uFZkmxisFxrmi1HrbWgy
 O1udXVsjYJn0ZT0yvaC6l46CNnUyy8s1bPF3MLMLMXCpldGDzNZdRPzF1r0Ir2B7b/CF
 G3w7qiHoem8jDmwXJshWysDKzKwFxJSOsgEX55J4zHZWgxFsN1/5R3GThr/8oCEx9hNT
 sN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kBymcoAPhSivUl8ecZGsJA2x6cQ1QwvbsWHHQcLluPQ=;
 b=C7W1AG3ExQigQpqD9pa8isiZaJdZYyycdyrxF9GwZUkIZiXBaLntmPcD3tg/Yvav2g
 wDoY0N+JzSxj1BXGMXiIx9EPJL0rYhFISt3Wz048y4TDj45hZ8KFvApZh8L02EiKHvNv
 fMz681iCp82oluXwDOSGHdX0K4IrlCYRXYCqS2tgtWGPf+MdZHvBT27a9uWWD8acj471
 O755ZYspDKKeXigv8tUJQmk5cPKRy0GXqGo0SUf+65m3qzQOtj96Z9xP2Hf649lOvujC
 Khv8th+O9KfvLpbGH1u3zmZjP1Zz2lQUk9Wec96+Jm45L7Gf/5S7tezHpxlGiO1LrhVf
 cyag==
X-Gm-Message-State: AOAM530JB0Prwt6qHnwle32uxwClmJS42QLw68Xw9Ut25ElWerWhoe1m
 elp0Xr/wV1jO5LaKgccmlhG5ZRuePrqbobOE78k=
X-Google-Smtp-Source: ABdhPJzOdllQEaWYMu2QRfdxOJmK6NEMLVtwVmv3hZsVNfJ14eMnO9hTqxXq9NDtsjequWahArq8vbYio2zXwp7+gLY=
X-Received: by 2002:a05:6638:d52:: with SMTP id
 d18mr92374068jak.21.1594582601905; 
 Sun, 12 Jul 2020 12:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200711154415.34w6ndu24uodj3ba@mrinalpandey>
 <CAKXUXMwE+23QnzLyNegXmSSdUeXC8Wv8ZzrBke7KON35kRqfqg@mail.gmail.com>
 <CAD1=X6kLBAAMqMH+bZipagmVq4XHx4LOVB=yUb1J870NgXMCUg@mail.gmail.com>
 <CAKXUXMzXiHCk9bJYK84WhL7FKRqV7YKmQ8_EJZgU_wTjiui8Tg@mail.gmail.com>
 <20200712121956.3hspxlqh4oawm5pc@mrinalpandey>
In-Reply-To: <20200712121956.3hspxlqh4oawm5pc@mrinalpandey>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 12 Jul 2020 19:36:31 +0200
Message-ID: <CAKXUXMyZBj609MhAWZ0kKD9+keqV857pFFJo3oZS0NGksT_42w@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix the usage of
	capture group ( ... )
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
Content-Type: multipart/mixed; boundary="===============1497485043324002074=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1497485043324002074==
Content-Type: multipart/alternative; boundary="0000000000008d3be805aa43b18e"

--0000000000008d3be805aa43b18e
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 12, 2020 at 2:20 PM Mrinal Pandey <mrinalmni@gmail.com> wrote:

> On 20/07/12 09:18AM, Lukas Bulwahn wrote:
> > On Sun, Jul 12, 2020 at 7:18 AM Mrinal Pandey <mrinalmni@gmail.com>
> wrote:
> >
> > > On Sun, Jul 12, 2020 at 12:44 AM Lukas Bulwahn <
> lukas.bulwahn@gmail.com>
> > > wrote:
> > >
> > >>
> > >>
> > >> On Sat, Jul 11, 2020 at 5:44 PM Mrinal Pandey <mrinalmni@gmail.com>
> > >> wrote:
> > >>
> > >>> The usage of "capture group (...)" in the immediate condition after
> `&&`
> > >>> results in `$1` being uninitialized. This eventually crashes the
> script.
> > >>>
> > >>>
> > >> It does not really crash it, right? It just emits a warning.
> > >>
> > >
> > > Sir,
> > >
> > > Yes. I will modify the line accordingly.
> > >
> > >>
> > >>
> > >>> Fix this by placing the capture group in the condition before `&&`.
> > >>> Thus, `$1` can be initialized to the text it matches thereby setting
> it
> > >>> to the desired and required value.
> > >>>
> > >>>
> > >> Maybe you can look when this bug was introduced?
> > >>
> > >
> > > The bug was first introduced with the commit `e518e9a59ec3` when the
> block
> > > was
> > > added to the script. It has been like that since then.
> > > Should I add this detail too in the commit message?
> > >
> >
> > Yes, please do.
> >
> > Commits are referred to with its hash shortened to 12 characters and the
> > commit message header in the following format:
> >
> > Commit e518e9a59ec3 ("checkpatch: emit an error when there's a diff in a
> > changelog")
> >
> >
> > Further note:
> > - can you also explain what the author intended to do?
> > - can you describe in one sentence how you discovered this bug?
> > - use checkpatch.pl on your own patch.
> >
> > Please rework the commit message and resend to this list, Shuah and me.
> >
> > I think if that patch is then okay, we have a quick look and then you can
> > send it out to the general list.
> >
> Sir,
>
> Please let me know if the commit message could be further improved or
> this is what you seek.
> I ran my patch through checkpatch and it says that the patch has no
> obvious style problems.
> I hope I wasn't supposed to include patch version history on this patch,
> please correct me if I am wrong.
>
> Thank you.
> >
> > Lukas
> >
> > >
>
> The usage of "capture group (...)" in the immediate condition after `&&`
> results in `$1` being uninitialized. This issues a warning "Use of
> uninitialized value $1 in regexp compilation at ./scripts/checkpatch.pl
> line 2638".
>
> I noticed this bug while running checkpatch on the set of commits from
> v5.7 to v5.8-rc1 of the kernel. The warning was thrown on the commits
> which had a diff content in their commit message.
>
>  Just drop " . The warning was thrown" and say:

  I noticed this bug while running checkpatch on the set of commits from
v5.7 to v5.8-rc1 of the kernel on the commits with a diff content in their
commit message.

> This bug was introduced in the script by Commit e518e9a59ec3
> ("checkpatch: emit an error when there's a diff in a changelog"). It has
> been in the script since then.
>
>
s/Commit/commit


> The author intended to store the match made by capture group in variable
> `$1`. This should have contained the name of the file as `[\w/]+` matched.
> However, this couldn't be accomplished due to usage of capture group and
> `$1` in the same RegEx.
>
>
s/RegEx/regular expression/


> Fix this by placing the capture group in the condition before `&&`.
> Thus, `$1` can be initialized to the text which capture group matches
> thereby setting it to the desired and required value.
>
> s/which/that/


Fix those minor points and send the patch to lkml and the maintainers (CC:
me, Shuah, and the list).

Read through the instructions for sending patches and follow all the
guidelines.

Lukas

Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4c820607540b..e73e998d582a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2636,8 +2636,8 @@ sub process {
>
>  # Check if the commit log has what seems like a diff which can confuse
> patch
>                 if ($in_commit_log && !$commit_log_has_diff &&
> -                   (($line =~ m@^\s+diff\b.*a/[\w/]+@ &&
> -                     $line =~ m@^\s+diff\b.*a/([\w/]+)\s+b/$1\b@) ||
> +                   (($line =~ m@^\s+diff\b.*a/([\w/]+)@ &&
> +                     $line =~ m@^\s+diff\b.*a/[\w/]+\s+b/$1\b@) ||
>                      $line =~ m@^\s*(?:\-\-\-\s+a/|\+\+\+\s+b/)@ ||
>                      $line =~ m/^\s*\@\@ \-\d+,\d+ \+\d+,\d+ \@\@/)) {
>                         ERROR("DIFF_IN_COMMIT_MSG",
> --
> 2.25.1
>
>

--0000000000008d3be805aa43b18e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 12, 2020 at 2:20 PM Mrina=
l Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com">mrinalmni@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2=
0/07/12 09:18AM, Lukas Bulwahn wrote:<br>
&gt; On Sun, Jul 12, 2020 at 7:18 AM Mrinal Pandey &lt;<a href=3D"mailto:mr=
inalmni@gmail.com" target=3D"_blank">mrinalmni@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Sun, Jul 12, 2020 at 12:44 AM Lukas Bulwahn &lt;<a href=3D"mai=
lto:lukas.bulwahn@gmail.com" target=3D"_blank">lukas.bulwahn@gmail.com</a>&=
gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Sat, Jul 11, 2020 at 5:44 PM Mrinal Pandey &lt;<a href=3D"=
mailto:mrinalmni@gmail.com" target=3D"_blank">mrinalmni@gmail.com</a>&gt;<b=
r>
&gt; &gt;&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; The usage of &quot;capture group (...)&quot; in the immed=
iate condition after `&amp;&amp;`<br>
&gt; &gt;&gt;&gt; results in `$1` being uninitialized. This eventually cras=
hes the script.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; It does not really crash it, right? It just emits a warning.<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Sir,<br>
&gt; &gt;<br>
&gt; &gt; Yes. I will modify the line accordingly.<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; Fix this by placing the capture group in the condition be=
fore `&amp;&amp;`.<br>
&gt; &gt;&gt;&gt; Thus, `$1` can be initialized to the text it matches ther=
eby setting it<br>
&gt; &gt;&gt;&gt; to the desired and required value.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; Maybe you can look when this bug was introduced?<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; The bug was first introduced with the commit `e518e9a59ec3` when =
the block<br>
&gt; &gt; was<br>
&gt; &gt; added to the script. It has been like that since then.<br>
&gt; &gt; Should I add this detail too in the commit message?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes, please do.<br>
&gt; <br>
&gt; Commits are referred to with its hash shortened to 12 characters and t=
he<br>
&gt; commit message header in the following format:<br>
&gt; <br>
&gt; Commit e518e9a59ec3 (&quot;checkpatch: emit an error when there&#39;s =
a diff in a<br>
&gt; changelog&quot;)<br>
&gt; <br>
&gt; <br>
&gt; Further note:<br>
&gt; - can you also explain what the author intended to do?<br>
&gt; - can you describe in one sentence how you discovered this bug?<br>
&gt; - use <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_b=
lank">checkpatch.pl</a> on your own patch.<br>
&gt; <br>
&gt; Please rework the commit message and resend to this list, Shuah and me=
.<br>
&gt; <br>
&gt; I think if that patch is then okay, we have a quick look and then you =
can<br>
&gt; send it out to the general list.<br>
&gt;<br>
Sir,<br>
<br>
Please let me know if the commit message could be further improved or<br>
this is what you seek.<br>
I ran my patch through checkpatch and it says that the patch has no<br>
obvious style problems.<br>
I hope I wasn&#39;t supposed to include patch version history on this patch=
,<br>
please correct me if I am wrong.<br>
<br>
Thank you.<br>
&gt; <br>
&gt; Lukas<br>
&gt; <br>
&gt; &gt;<br>
<br>
The usage of &quot;capture group (...)&quot; in the immediate condition aft=
er `&amp;&amp;`<br>
results in `$1` being uninitialized. This issues a warning &quot;Use of<br>
uninitialized value $1 in regexp compilation at ./scripts/<a href=3D"http:/=
/checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
line 2638&quot;.<br>
<br>
I noticed this bug while running checkpatch on the set of commits from<br>
v5.7 to v5.8-rc1 of the kernel. The warning was thrown on the commits<br>
which had a diff content in their commit message.<br>
<br></blockquote><div>=C2=A0Just drop &quot;

. The warning was thrown&quot; and say:</div><div><br></div><div>=C2=A0 I n=
oticed this bug while running checkpatch on the set of commits from<br>
v5.7 to v5.8-rc1 of the kernel on the commits with a diff content in their =
commit message.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
This bug was introduced in the script by Commit e518e9a59ec3<br>
(&quot;checkpatch: emit an error when there&#39;s a diff in a changelog&quo=
t;). It has<br>
been in the script since then.<br>
<br></blockquote><div><br></div><div>s/Commit/commit</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
The author intended to store the match made by capture group in variable<br=
>
`$1`. This should have contained the name of the file as `[\w/]+` matched.<=
br>
However, this couldn&#39;t be accomplished due to usage of capture group an=
d<br>
`$1` in the same RegEx.<br>
<br></blockquote><div><br></div><div>s/RegEx/regular expression/</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Fix this by placing the capture group in the condition before `&amp;&amp;`.=
<br>
Thus, `$1` can be initialized to the text which capture group matches<br>
thereby setting it to the desired and required value.<br>
<br></blockquote><div>s/which/that/</div><div><br></div><div><br></div><div=
>Fix those minor points and send the patch to lkml and the maintainers (CC:=
 me, Shuah, and the list).</div><div><br></div><div>Read through the instru=
ctions for sending patches and follow all the guidelines.</div><div><br></d=
iv><div>Lukas</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Signed-off-by: Mrinal Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com" tar=
get=3D"_blank">mrinalmni@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
index 4c820607540b..e73e998d582a 100755<br>
--- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
+++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
@@ -2636,8 +2636,8 @@ sub process {<br>
<br>
=C2=A0# Check if the commit log has what seems like a diff which can confus=
e patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($in_commit_log =
&amp;&amp; !$commit_log_has_diff &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(($li=
ne =3D~ m@^\s+diff\b.*a/[\w/]+@ &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0$line =3D~ m@^\s+diff\b.*a/([\w/]+)\s+b/$1\b@) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(($li=
ne =3D~ m@^\s+diff\b.*a/([\w/]+)@ &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0$line =3D~ m@^\s+diff\b.*a/[\w/]+\s+b/$1\b@) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0$line =3D~ m@^\s*(?:\-\-\-\s+a/|\+\+\+\s+b/)@ ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0$line =3D~ m/^\s*\@\@ \-\d+,\d+ \+\d+,\d+ \@\@/)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ERROR(&quot;DIFF_IN_COMMIT_MSG&quot;,<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000008d3be805aa43b18e--

--===============1497485043324002074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1497485043324002074==--
