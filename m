Return-Path: <SRS0=awrY=A5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E4BC433F8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jul 2020 07:00:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FDFD20724
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jul 2020 07:00:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTZca6CW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FDFD20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 28BF186493;
	Sat, 18 Jul 2020 07:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6unJOzqNhbFe; Sat, 18 Jul 2020 07:00:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6577C86362;
	Sat, 18 Jul 2020 07:00:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D488C0890;
	Sat, 18 Jul 2020 07:00:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E073C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 07:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 394BA20427
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 07:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVBNcrVt8nhk
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 07:00:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by silver.osuosl.org (Postfix) with ESMTPS id CE77C2038B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 07:00:42 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id t6so6349047plo.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=GyGCIuKekWr3Ka7WIEyTTDDXTRM0BTd2I5tUSUxdRSI=;
 b=YTZca6CWOihhiJ1g6MW5GkxdQDbgTL1JVHpMukJKUcqTyh5HGPiJgq60eQqUF5cxJ7
 IYwg8QctWwy9Qor5r7onWaOSCZODbBGspkEFjVYsXulB/+3v61RlYNnpt/yo69obyrxE
 XkSbNQh2PUZGBpB3Ytg4WB7DYR29b23Sylc5UXatjssjYwkOXt4EC/daIyPMwSgyBldk
 dmBwLNpZaWLCzVdKqSZhFI+VWpYXumpx5AyD/oBpyH1rKTl4nXneSXCYpDrtybYC9YkK
 yRascEZ6Rh5lRgBqrc0aK/V89b7XceDh1UO6KfcGVbDRL8emLmMj/9NCgR/lWvOWyiXp
 VQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=GyGCIuKekWr3Ka7WIEyTTDDXTRM0BTd2I5tUSUxdRSI=;
 b=ZEtIwM3+ULaN9+7cuYXayiS59fKGJNazUCrlXjG1sxsRSPKbA2lpjoQje1NovfocbH
 FSs+8AsQD4CQ6nK8R4lYOs3Wsr+PJGc28mX3GPCV9Dc96WTjRHNNMLiepJN933yLAtsD
 q4wWWrr9sFLrMc+4X14sbg/ZHRIgmfyuTi/yzVn0kbdJnsF1eS26OX0VeLcHhTD086cN
 7IgVV5QiAAcQwZf0IA/sTK9se/fZwjob0Q+Vpl+BPMt0VHCdoZGLy00qABp5XVyBFLsU
 YfCOcyY+ZXmP+InYzdUYEoeLme6VGpvGzRCRulQ7g7lSvVOTNMMhXPnsLx9VvoDIQHzG
 +hSQ==
X-Gm-Message-State: AOAM530/4aiRRZJkITxyZfEOBh6hUAp5pKduVLbJzY6H+tTiOEsWIdbV
 rUnxxnSDLvEuwjA82cwobIT2xeM1QGNts1eAsuc=
X-Google-Smtp-Source: ABdhPJzPVpkyjv4snpAI/ySmSdnO1O4nav+Iio0YeaJaRRHmoAq6qyxxJOCI6x/tsb9jltSkiwfu5oBcQInpzZI3g6A=
X-Received: by 2002:a17:90b:4c8b:: with SMTP id
 my11mr13363604pjb.153.1595055642264; 
 Sat, 18 Jul 2020 00:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
 <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
 <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
 <CAKXUXMx8RcQrihaYvryhm4N8X4BATLpPmRnDkm6nCmhznugd0g@mail.gmail.com>
 <CAD1=X6m2Lp-KE-xHN1uE7egZRp5-gkXbGVC4f5EUjyMfJ12rHQ@mail.gmail.com>
 <alpine.DEB.2.21.2007150706410.13346@felia>
In-Reply-To: <alpine.DEB.2.21.2007150706410.13346@felia>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Sat, 18 Jul 2020 12:30:30 +0530
Message-ID: <CAD1=X6kv+PxEu8CBaEHORyVcgQz33obgheJ8FtTu30vG6VOaGQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, 
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
Content-Type: multipart/mixed; boundary="===============5226358234279183547=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5226358234279183547==
Content-Type: multipart/alternative; boundary="000000000000f4482205aab1d4e4"

--000000000000f4482205aab1d4e4
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 15, 2020 at 11:02 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
>
> On Tue, 14 Jul 2020, Mrinal Pandey wrote:
>
> >
> >
> > On Sat, Jul 11, 2020 at 3:17 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> wrote:
> >
> > >> For Issue 5: Can you provide me (and the CC: the list) the list of
> > >> false positives (the commit hashes) you found for issue 5 on
> > >> EXPORT_SYMBOL?
> > >
> > >
> > > Here are the commit hashes for which the warning is issued:
> > > 54505a1e2083
> > > 75d75b7a4d54
> > > 8084c99b9af6
> > > bfdaf029c9c9
> > > dfd402a4c4ba
> > >
> > >> Can you also provide a short rationale/explanation for
> > >> each case that you considered a false positive?
> > >
> > >
> > > In each case the `EXPORT_SYMBOL()` is correctly written and the
> variable/function to be exported
> > > is also inside the parentheses, still, we get the warning. Please let
> me know if I am wrong here.
> >
> > I checked those warnings. Some of the patches are good cases to check if
> we can improve the heuristics on
> > EXPORT_SYMBOL().
> >
> > E.g., commit bfdaf029c9c9 ("ia64: turn csum_partial_copy_from_user()
> into csum_and_copy_from_user()") looks
> > sound to me, and checkpatch.pl should not really warn about that.
> >
> > Mrinal, maybe you can find out why checkpatch.pl believes that this
> case is wrong and needs to be warned
> > about?
> >
> >
> > Sir,
> >
> > Commit `54505a1e2083`, `8084c99b9af6` and `bfdaf029c9c9` have style
> issues. The documentation says to use
> > `EXPORT_SYMBOL()` just after the closing bracket `}` of the function, it
> is exporting. In these commits `EXPORT
> > SYMBOL()`
> > is either defined at a point later or has been defined after leaving a
> blank line which is totally unneeded.
> >
>
> Possibly, a new line is okay; I think we would some statistics on the
> overall use of EXPORT_SYMBOL() to see if a new line is generally accepted
> or if it is really a rare case (<3%) and checkpatch.pl should keep
> warning about that.
>

Sir,

I checked 2000 uses of EXPORT_SYMBOL, the total usages being 15800 approx.
and only 74 of them used a blank line.
That's 0.037% so probably checkpatch.pl is correct there. There are cases
where multiple exports are written together but these are also only
117 out of 2000.

>
> > However, commits `dfd402a4c4ba` and `75d75b7a4d54` look fine to me and
> have one thing in common, the
> > `EXPORT_SYMBOL()` in these is used inside of a macro. checkpatch
> shouldn't warn about these.
> >
>
> That is probably tricky to handle with checkpatch.pl, though.
>

I will let you know if I find something that works here. This is probably
the only case that is worth noticing.

>
> > I have noticed checkpatch denoting wrong line numbers for certain files
> for several commits.
> > For example, for the above commit
> > `bfdaf029c9c9`, the following warning is issued:
> >
> > WARNING: EXPORT_SYMBOL(foo); should immediately follow its
> function/variable
> > #74: FILE: arch/ia64/lib/csum_partial_copy.c:122:
> > +EXPORT_SYMBOL(csum_and_copy_from_user);
> >
> > but the file arch/ia64/lib/csum_partial_copy.c is only 113 lines long.
> > Please let me know if you can reproduce this.
>
> Can you find out how the line number is computed?
>
> Of course, checkpatch.pl is running on the patch, not on any specific
> file. So, in general, you really do not know how long the file was that
> the author based the patch on.
>
> In our case, you need to check the state of the file at the commit above.
>
> I checked that and it seemed correct to me, line 122 refers to
> EXPORT_SYMBOL. So, I do not see the bug here.
>
> Yes, the file is checked at that point in the commit and everything seems
to be correct. I was checking the
the current version of the file and that's why couldn't get line 122.

>
>
> Lukas
>

--000000000000f4482205aab1d4e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 15, 2020 at 11:02 AM Luka=
s Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
<br>
On Tue, 14 Jul 2020, Mrinal Pandey wrote:<br>
<br>
&gt; <br>
&gt; <br>
&gt; On Sat, Jul 11, 2020 at 3:17 AM Lukas Bulwahn &lt;<a href=3D"mailto:lu=
kas.bulwahn@gmail.com" target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt; wr=
ote:<br>
&gt; <br>
&gt; &gt;&gt; For Issue 5: Can you provide me (and the CC: the list) the li=
st of<br>
&gt; &gt;&gt; false positives (the commit hashes) you found for issue 5 on<=
br>
&gt; &gt;&gt; EXPORT_SYMBOL?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Here are the commit hashes for which the warning is issued:<br>
&gt; &gt; 54505a1e2083<br>
&gt; &gt; 75d75b7a4d54<br>
&gt; &gt; 8084c99b9af6<br>
&gt; &gt; bfdaf029c9c9<br>
&gt; &gt; dfd402a4c4ba<br>
&gt; &gt;<br>
&gt; &gt;&gt; Can you also provide a short rationale/explanation for<br>
&gt; &gt;&gt; each case that you considered a false positive?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; In each case the `EXPORT_SYMBOL()` is correctly written and the v=
ariable/function to be exported<br>
&gt; &gt; is also inside the parentheses, still, we get the warning. Please=
 let me know if I am wrong here.<br>
&gt; <br>
&gt; I checked those warnings. Some of the patches are good cases to check =
if we can improve the heuristics on<br>
&gt; EXPORT_SYMBOL().<br>
&gt; <br>
&gt; E.g., commit bfdaf029c9c9 (&quot;ia64: turn csum_partial_copy_from_use=
r() into csum_and_copy_from_user()&quot;) looks<br>
&gt; sound to me, and <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" t=
arget=3D"_blank">checkpatch.pl</a> should not really=C2=A0warn about that.<=
br>
&gt; <br>
&gt; Mrinal, maybe you can find out why <a href=3D"http://checkpatch.pl" re=
l=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> believes that this cas=
e is wrong and needs to be warned<br>
&gt; about?<br>
&gt; <br>
&gt; <br>
&gt; Sir,<br>
&gt; <br>
&gt; Commit `54505a1e2083`, `8084c99b9af6` and `bfdaf029c9c9` have style is=
sues. The documentation says to use<br>
&gt; `EXPORT_SYMBOL()` just after the closing bracket `}` of the function, =
it is exporting. In these commits `EXPORT<br>
&gt; SYMBOL()`<br>
&gt; is either defined at a point later or has been defined after leaving a=
 blank line which is totally unneeded.<br>
&gt;<br>
<br>
Possibly, a new line is okay; I think we would some statistics on the <br>
overall use of EXPORT_SYMBOL() to see if a new line is generally accepted <=
br>
or if it is really a rare case (&lt;3%) and <a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> should keep <br>
warning about that.<br></blockquote><div><br></div><div>Sir,</div><div><br>=
</div><div>I checked 2000 uses of EXPORT_SYMBOL, the total usages being 158=
00 approx. and only 74 of them used a blank line.</div><div>That&#39;s 0.03=
7% so probably <a href=3D"http://checkpatch.pl">checkpatch.pl</a> is correc=
t there. There are cases where multiple exports are written together but th=
ese are also only</div><div>117 out of 2000.<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; However, commits `dfd402a4c4ba` and `75d75b7a4d54` look fine to me and=
 have one thing in common, the<br>
&gt; `EXPORT_SYMBOL()` in these is used inside of a macro. checkpatch shoul=
dn&#39;t warn about these.<br>
&gt; <br>
<br>
That is probably tricky to handle with <a href=3D"http://checkpatch.pl" rel=
=3D"noreferrer" target=3D"_blank">checkpatch.pl</a>, though.<br></blockquot=
e><div><br></div><div>I will let you know if I find something that works he=
re. This is probably the only case that is worth noticing.<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I have noticed checkpatch denoting wrong line numbers for certain file=
s for several commits.<br>
&gt; For example, for the above commit<br>
&gt; `bfdaf029c9c9`, the following warning is issued:<br>
&gt; <br>
&gt; WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/va=
riable<br>
&gt; #74: FILE: arch/ia64/lib/csum_partial_copy.c:122:<br>
&gt; +EXPORT_SYMBOL(csum_and_copy_from_user);<br>
&gt; <br>
&gt; but the file arch/ia64/lib/csum_partial_copy.c is only 113 lines long.=
<br>
&gt; Please let me know if you can reproduce this.<br>
<br>
Can you find out how the line number is computed?<br>
<br>
Of course, <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_b=
lank">checkpatch.pl</a> is running on the patch, not on any specific <br>
file. So, in general, you really do not know how long the file was that <br=
>
the author based the patch on.<br>
<br>
In our case, you need to check the state of the file at the commit above.<b=
r>
<br>
I checked that and it seemed correct to me, line 122 refers to <br>
EXPORT_SYMBOL. So, I do not see the bug here.<br>
<br></blockquote><div>Yes, the file is checked at that point in the commit =
and everything seems to be correct. I was checking the <br></div><div>the c=
urrent version of the file and that&#39;s why couldn&#39;t get line 122.<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Lukas<br>
</blockquote></div></div>

--000000000000f4482205aab1d4e4--

--===============5226358234279183547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5226358234279183547==--
