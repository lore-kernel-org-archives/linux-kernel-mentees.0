Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E668C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 11:27:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01CDB20772
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 11:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYSyrVFG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01CDB20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE31C8898B;
	Fri, 10 Jul 2020 11:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8MlGcHLcX2b; Fri, 10 Jul 2020 11:27:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9E82688970;
	Fri, 10 Jul 2020 11:27:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 915D7C0890;
	Fri, 10 Jul 2020 11:27:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FB4BC016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 11:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4686789647
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 11:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DCfm+4FsyQgG
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 11:27:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D1D0F8963F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 11:27:02 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id g67so2402055pgc.8
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 04:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=FLGHiXL3JF/Kab4+eRozL5Ks+9EOQURQNLu8vNw+/r4=;
 b=kYSyrVFGKGlpiFLQkp/1AZYSuFi5iQb8vtCfkmY8DpPvVmoodmYHI9EJux+8s5l477
 Nhz9Kg0jkkzy9CHT5kOKP9bUdkcRQjwQzF583wKcL9UrfycEWG04VpgwWAzH4mMbV9RW
 ewHup7JCbrJJ90SzL0BofcSPd/lt8Kj0pFJRWdYTKYtbiqCgQtsEcHDlBSqAh2NpCtuL
 nopmTmHz4xcN07mZorwg7NgD3Jm/GEZruXXY4qZ/wmfpNmkpHJ9M+asV+mBOIuFRAtTw
 8UGDx44NF9LwKLyg0d57XWrAuvtlUjfFRZNFLJ2hA5E3B0AsfsGVJz0CU/POoerT87Hl
 +DzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=FLGHiXL3JF/Kab4+eRozL5Ks+9EOQURQNLu8vNw+/r4=;
 b=kgIPQKYEZsfyxSRZ8c1Vt9uBJ483+iG0TwsbFuNPGkwLc+2MULtcZPbQlQxNdO/aDo
 xQvBGe+8sdmk2LmAuN6PsVWvZX1sNZr3+gm1Cmv5gSTjlUpXdWmBvUjMdk7fJWnEurVq
 rqgrHrNdJy+EdK8eON2Av/7ucVPiTdmOqlBgF2pZ0rpSa/cwpiV6MPXo74V6s7MObcEz
 uyk0nGuhIP3mu06TyZ9if5lSTV+5So07XYjfph6pzZs5eWmlthyoadkWhPcSubUzvtpX
 nBcDhoL01J8/5DrZg5TsA+lVQGi8r0bvw0V3rrklfxrxZ3AuB9bXTu8SXtAY501m6E8x
 J5+w==
X-Gm-Message-State: AOAM532QV3TvelRHKNbeCRkJn0a4ywfBitMutUdF9jW7ppfK1gOeqmkO
 KihNK27jF9c56BmIwrtXWNHmadKFWDdmeD30Ezk=
X-Google-Smtp-Source: ABdhPJy2WquoBqTIf/F3rkQkAsk0CwSwaxAnB/L50VkW5L2CVciJ0mzvq7NpieW30vIJpVyG0fkgbF2b2gJP2sH3PtI=
X-Received: by 2002:a62:2b0c:: with SMTP id r12mr63683771pfr.122.1594380422198; 
 Fri, 10 Jul 2020 04:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
 <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
In-Reply-To: <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Fri, 10 Jul 2020 16:56:50 +0530
Message-ID: <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Adjust spelling
	check false positive
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
Content-Type: multipart/mixed; boundary="===============1359944522955017136=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1359944522955017136==
Content-Type: multipart/alternative; boundary="000000000000b3bbd005aa149e12"

--000000000000b3bbd005aa149e12
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 9, 2020 at 10:33 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> On Thu, Jul 9, 2020 at 6:31 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:
> >
> > On Tue, Jul 7, 2020 at 10:24 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> wrote:
> >>
> >> On Tue, Jul 7, 2020 at 10:22 AM Mrinal Pandey <mrinalmni@gmail.com>
> wrote:
> >> >
> >> >
> >> >
> >> > On Tue, Jul 7, 2020 at 1:20 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> wrote:
> >> >>
> >> >> On Mon, Jul 6, 2020 at 10:08 AM Mrinal Pandey <mrinalmni@gmail.com>
> wrote:
> >> >> >
> >> >> > checkpatch.pl issues warnings on the commits
> >> >> > made to scripts/spelling.txt for new entries
> >> >> > of typos and their fixes. This commit adjusts
> >> >> > checkpatch not to complain about the same.
> >> >> >
> >> >> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> >> >> > ---
> >> >>
> >> >> How often does that issue appear? Can you use your checkpatch
> >> >> evaluation to show that it is relevant?
> >> >
> >>
> >> How many commits to spelling.txt happened within the last year?
> >
> >
> > Sir,
> >
> > I could find only commit to the file in the range 5.7 to 5.8.rc-1.
> >>
> >>
> >> The patch might be accepted, but the reason is not that convincing.
> >
> >
> > What do you suggest? Should I send it or not?
> >
>
> Let us keep that in the backlog for now, but not send it. If it is
> only one single case among hundreds false positives, it is maybe not
> the best to start with.
> We might get to that one case here eventually, but let us start with
> the more important and critical cases first.
>

> >> Maybe you can find another class of false positives that happen more
> >> often?
> >
> >
> > Yes, I have a few other suggestions that I found occurring often and I'm
> still evaluating to find more:
> > 1. In `.h` files, when we write a function prototype, the name of the
> function parameters are
> > not required, only the data type is enough, checkpatch says to define
> the name of the parameters too.
> > Issues a warning like - function definition argument '<arg>' should also
> have an identifier name
> >
>
> Okay, we need to discuss if that is a convention that developers care
> about or not.
>

> > 2. A very common warning is - Macros with complex values should be
> enclosed in parentheses
> > which is correct sometimes but a false positive many times, for macros
> ending with `)` or
> > macros like `#define var value` we probably don't need another pair of
> `()`
> >
>
> Agree, this might be worth refining in checkpatch as you described.
>
> > 3. checkpatch complains about breaking a quoted string across lines but
> this is many a time
> > necessary for readability and in most of the patches I saw the strings
> broken.
> >
>
> Tricky to really know what the best solution is here. It is a tradeoff
> in both directions.
> Let us put that aside for now.
>
> > 4. There are many patches where checkpatch issues false positives
> regarding spaces before
> > and after lines.
> >
> Why are they false positives?
>

Sir,

The warning by checkpatch says - please, no spaces at the start of a line
but there are indeed no spaces before the line where this warning is issued.
There are multiple commits having this issue, two of them are
`acaab7335bd6` and `372b38ea5911`.

>
> > 5. The warning - EXPORT_SYMBOL(foo); should immediately follow its
> function/variable
> > is falsely positive in many cases where the statement is correct but the
> script fails to identify it.
> >
>
> If the script does not detect that, it sounds like a bug.
> This can be improved for checkpatch.pl.
>
> > 6. While running checkpatch on a patch the following error was thrown to
> the console -
> > Use of uninitialized value $1 in regexp compilation at ./scripts/
> checkpatch.pl line 2653.
> > This could be fixed.
> >
>
> That looks pretty sure like a bug.
>
> > Please let me know your views on these ideas.
>
> I suggest we look into issue 5 and 6.
>
> For Issue 5: Can you provide me (and the CC: the list) the list of
> false positives (the commit hashes) you found for issue 5 on
> EXPORT_SYMBOL?


Here are the commit hashes for which the warning is issued:
54505a1e2083
75d75b7a4d54
8084c99b9af6
bfdaf029c9c9
dfd402a4c4ba

Can you also provide a short rationale/explanation for
> each case that you considered a false positive?
>

In each case the `EXPORT_SYMBOL()` is correctly written and the
variable/function to be exported
is also inside the parentheses, still, we get the warning. Please let me
know if I am wrong here.

>
> For Issue 6: Can you provide me the commit hash that caused this
> checkpatch.pl error? Then, we can reproduce and confirm that issue
> probably simply with `git format-patch -1 $SHA |
> ./scripts/checkpatch.pl` and observe the bug and crash ourselves?
>

These are the commit hashes that crashed the checkpatch:
6b3e0e2e0461
19ce2321739d
059c6d68cfc5


>
> (I added linux-kernel-mentees@lists.linuxfoundation.org back to the
> recipient list.)
> Also, on sending emails: you started the thread on
> linux-kernel-mentees@lists.linuxfoundation.org. All further replies
> shall always include that list in To or CC, so that the email thread
> is complete on the list.
>
> At some point in this mail thread, you only replied to me but did not
> have the list in the recipient list (in To or CC). That was wrong;
> Please follow the rule stated above. I hope this point was already
> taught on the LF Kernel Development Introduction course. Maybe you can
> check the material once again and see if and where that was pointed
> out in the course material?
>

Sir, I apologize for not including the list in my previous replies.
Unfortunately, it slipped out of my mind.
I assure you it would not happen again. Also, Linux Kernel Mentorship wiki
says to CC the overall
program mentor Shuah Khan Ma'am on each contribution. Should I do it only
on the final patches or on
every mail I send?

Thank you.

>
> Thanks, waiting for response,
>
> Lukas
>

--000000000000b3bbd005aa149e12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jul 9, 2020 at 10:33 AM Lukas Bul=
wahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Thu, Jul 9, 2020 at 6:31 AM Mrinal Pandey &lt=
;<a href=3D"mailto:mrinalmni@gmail.com" target=3D"_blank">mrinalmni@gmail.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Jul 7, 2020 at 10:24 PM Lukas Bulwahn &lt;<a href=3D"mailto:lu=
kas.bulwahn@gmail.com" target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jul 7, 2020 at 10:22 AM Mrinal Pandey &lt;<a href=3D"mailt=
o:mrinalmni@gmail.com" target=3D"_blank">mrinalmni@gmail.com</a>&gt; wrote:=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, Jul 7, 2020 at 1:20 AM Lukas Bulwahn &lt;<a href=3D"m=
ailto:lukas.bulwahn@gmail.com" target=3D"_blank">lukas.bulwahn@gmail.com</a=
>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Mon, Jul 6, 2020 at 10:08 AM Mrinal Pandey &lt;<a href=
=3D"mailto:mrinalmni@gmail.com" target=3D"_blank">mrinalmni@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" =
target=3D"_blank">checkpatch.pl</a> issues warnings on the commits<br>
&gt;&gt; &gt;&gt; &gt; made to scripts/spelling.txt for new entries<br>
&gt;&gt; &gt;&gt; &gt; of typos and their fixes. This commit adjusts<br>
&gt;&gt; &gt;&gt; &gt; checkpatch not to complain about the same.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Signed-off-by: Mrinal Pandey &lt;<a href=3D"mailto:m=
rinalmni@gmail.com" target=3D"_blank">mrinalmni@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; How often does that issue appear? Can you use your checkp=
atch<br>
&gt;&gt; &gt;&gt; evaluation to show that it is relevant?<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; How many commits to spelling.txt happened within the last year?<br=
>
&gt;<br>
&gt;<br>
&gt; Sir,<br>
&gt;<br>
&gt; I could find only commit to the file in the range 5.7 to 5.8.rc-1.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; The patch might be accepted, but the reason is not that convincing=
.<br>
&gt;<br>
&gt;<br>
&gt; What do you suggest? Should I send it or not?<br>
&gt;<br>
<br>
Let us keep that in the backlog for now, but not send it. If it is<br>
only one single case among hundreds false positives, it is maybe not<br>
the best to start with.<br>
We might get to that one case here eventually, but let us start with<br>
the more important and critical cases first.<br></blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt; Maybe you can find another class of false positives that happen mo=
re<br>
&gt;&gt; often?<br>
&gt;<br>
&gt;<br>
&gt; Yes, I have a few other suggestions that I found occurring often and I=
&#39;m still evaluating to find more:<br>
&gt; 1. In `.h` files, when we write a function prototype, the name of the =
function parameters are<br>
&gt; not required, only the data type is enough, checkpatch says to define =
the name of the parameters too.<br>
&gt; Issues a warning like - function definition argument &#39;&lt;arg&gt;&=
#39; should also have an identifier name<br>
&gt;<br>
<br>
Okay, we need to discuss if that is a convention that developers care<br>
about or not.<br></blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
&gt; 2. A very common warning is - Macros with complex values should be enc=
losed in parentheses<br>
&gt; which is correct sometimes but a false positive many times, for macros=
 ending with `)` or<br>
&gt; macros like `#define var value` we probably don&#39;t need another pai=
r of `()`<br>
&gt;<br>
<br>
Agree, this might be worth refining in checkpatch as you described.<br>
<br>
&gt; 3. checkpatch complains about breaking a quoted string across lines bu=
t this is many a time<br>
&gt; necessary for readability and in most of the patches I saw the strings=
 broken.<br>
&gt;<br>
<br>
Tricky to really know what the best solution is here. It is a tradeoff<br>
in both directions.<br>
Let us put that aside for now.<br>
<br>
&gt; 4. There are many patches where checkpatch issues false positives rega=
rding spaces before<br>
&gt; and after lines.<br>
&gt;<br>
Why are they false positives?<br></blockquote><div><br></div><div>Sir,</div=
><div><br></div><div>The warning by checkpatch says - please, no spaces at =
the start of a line</div><div>but there are indeed no spaces before the lin=
e where this warning is issued.</div><div>There are multiple commits having=
 this issue, two of them are `acaab7335bd6` and `372b38ea5911`.<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; 5. The warning - EXPORT_SYMBOL(foo); should immediately follow its fun=
ction/variable<br>
&gt; is falsely positive in many cases where the statement is correct but t=
he script fails to identify it.<br>
&gt;<br>
<br>
If the script does not detect that, it sounds like a bug.<br>
This can be improved for <a href=3D"http://checkpatch.pl" rel=3D"noreferrer=
" target=3D"_blank">checkpatch.pl</a>.<br>
<br>
&gt; 6. While running checkpatch on a patch the following error was thrown =
to the console -<br>
&gt; Use of uninitialized value $1 in regexp compilation at ./scripts/<a hr=
ef=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch=
.pl</a> line 2653.<br>
&gt; This could be fixed.<br>
&gt;<br>
<br>
That looks pretty sure like a bug.<br>
<br>
&gt; Please let me know your views on these ideas.<br>
<br>
I suggest we look into issue 5 and 6.<br>
<br>
For Issue 5: Can you provide me (and the CC: the list) the list of<br>
false positives (the commit hashes) you found for issue 5 on<br>
EXPORT_SYMBOL?</blockquote><div><br></div><div><div>Here are the commit has=
hes for which the warning is issued:</div><div>54505a1e2083<br>75d75b7a4d54=
<br>8084c99b9af6<br>bfdaf029c9c9<br>dfd402a4c4ba</div><div><br></div></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Can you also provide a sh=
ort rationale/explanation for<br>
each case that you considered a false positive?<br></blockquote><div><br></=
div><div>In each case the `EXPORT_SYMBOL()` is correctly written and the va=
riable/function to be exported</div><div>is also inside the parentheses, st=
ill, we get the warning. Please let me know if I am wrong here.</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
For Issue 6: Can you provide me the commit hash that caused this<br>
<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">check=
patch.pl</a> error? Then, we can reproduce and confirm that issue<br>
probably simply with `git format-patch -1 $SHA |<br>
./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_bl=
ank">checkpatch.pl</a>` and observe the bug and crash ourselves?<br></block=
quote><div><br></div><div>These are the commit hashes that crashed the chec=
kpatch:<br></div><div>6b3e0e2e0461<br>19ce2321739d<br>059c6d68cfc5<br>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
(I added <a href=3D"mailto:linux-kernel-mentees@lists.linuxfoundation.org" =
target=3D"_blank">linux-kernel-mentees@lists.linuxfoundation.org</a> back t=
o the<br>
recipient list.)<br>
Also, on sending emails: you started the thread on<br>
<a href=3D"mailto:linux-kernel-mentees@lists.linuxfoundation.org" target=3D=
"_blank">linux-kernel-mentees@lists.linuxfoundation.org</a>. All further re=
plies<br>
shall always include that list in To or CC, so that the email thread<br>
is complete on the list.<br>
<br>
At some point in this mail thread, you only replied to me but did not<br>
have the list in the recipient list (in To or CC). That was wrong;<br>
Please follow the rule stated above. I hope this point was already<br>
taught on the LF Kernel Development Introduction course. Maybe you can<br>
check the material once again and see if and where that was pointed<br>
out in the course material?<br></blockquote><div><br></div><div>Sir, I apol=
ogize for not including the list in my previous replies. Unfortunately, it =
slipped out of my mind.<br></div><div>I assure you it would not happen agai=
n. Also, Linux Kernel Mentorship wiki says to CC the overall</div><div>prog=
ram mentor Shuah Khan Ma&#39;am on each contribution. Should I do it only o=
n the final patches or on</div><div>every mail I send?</div><div><br></div>=
<div>Thank you.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks, waiting for response,<br>
<br>
Lukas<br>
</blockquote></div></div>

--000000000000b3bbd005aa149e12--

--===============1359944522955017136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1359944522955017136==--
