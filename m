Return-Path: <SRS0=lv87=AW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C87C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Jul 2020 13:40:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CFC20657
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Jul 2020 13:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7l/PpA7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84CFC20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6234089337;
	Sat, 11 Jul 2020 13:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fs2awxgpiUsB; Sat, 11 Jul 2020 13:40:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F311C8928E;
	Sat, 11 Jul 2020 13:40:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE258C077B;
	Sat, 11 Jul 2020 13:40:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54BA3C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 13:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3F6D02221F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 13:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoSVFIajEYHg
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 13:40:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 6BAF32154B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 13:40:18 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m22so3791691pgv.9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 06:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=EmkYOFziLKEeRp41RR6mzBaBzN4MFoR1xwnUW7Lrr6w=;
 b=L7l/PpA7VsaocSUleIbu3lOO43pogDlPWrrhlrncp4QmuxzyjnQdZFmFZVDR8oTcsf
 8wNaSrLIOZxl6S0gnIY6q3FFZxl7H1s6iuRVBZo/MwQQPzCMWV2oblGQBBGufDbZb/C/
 8oNPYabzRUo7qFYFinc0fDZQsreutFqcK2aunbYpaw0XiFq7gfQVhwncetmFI0uuCW+0
 z40YVXLaRke/QH7AO6LBsjq/GrPKbyyFDc0KJ9oyXUI1H0Phva9fNfdtbBFLcLRROgk7
 l+I7q/HdpX16jCD4NsUlmXa5pYn6Sp0zLRgqsTjJZQcH+N10UUjmbEqtJDO8IDHEYSpN
 oGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=EmkYOFziLKEeRp41RR6mzBaBzN4MFoR1xwnUW7Lrr6w=;
 b=er0J430kDVpwf4wq8YViM/8TxcF03S88/KpRecR8k6oxGZvap3H/GZypZk0b/wSJa1
 idDBkc7XTZvITWRFoHiL/Z2vDXOvCQ+wIhM5FWA1krZh9reJYozu8KHYB2XoZpTDVKCR
 T4oaPbXlEpJCvD3H8UndWNeTihyiTcDeYijJzpr/zykghHll9pax+v7vKaV3FgnXcVXU
 Yu2JPlvCCYYh4kTUOVMb+8634HK+2m8mbrZTvoR8napAyOhyGH+XUzAf4QjI18LB1lkY
 mtajXQh67Xx3/RyJk0ldrD3v6xhbgMb8FbwVrzq4pxTGYOxbJNomP4ycGZhn8cy0IDev
 I5Pg==
X-Gm-Message-State: AOAM531k6AoD6pgv4tp/N7K2pyI55UQpzcTO2kQaF68saSNe7aN62Qpx
 07UzfEtwgSN6QIMXjELRQQpQn3BnPML2G5gfcFD5qzKqYU0=
X-Google-Smtp-Source: ABdhPJxXs/KDx2LgXwSs1LAQKaCGBK+eDeD/2JLGItHjBIH2Q7xT6SvCF9UH32mwVP+HbWT+BgcT5WvcO0Bp8nyAHgc=
X-Received: by 2002:a63:140f:: with SMTP id u15mr50417374pgl.94.1594474817841; 
 Sat, 11 Jul 2020 06:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
 <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
 <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
 <844f8a74-0a95-216b-3785-79ab161a00e7@linuxfoundation.org>
 <CAKXUXMyXnch8EHoEvm=1MbEREfpNv-r_QPTD6=h3HKWkQj5v=w@mail.gmail.com>
In-Reply-To: <CAKXUXMyXnch8EHoEvm=1MbEREfpNv-r_QPTD6=h3HKWkQj5v=w@mail.gmail.com>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Sat, 11 Jul 2020 19:10:06 +0530
Message-ID: <CAD1=X6mOEMz=uFh8yp4ouyYg+TRttPdQY=pfAyBnQ_m=Sh0OBw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5913242491836430062=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5913242491836430062==
Content-Type: multipart/alternative; boundary="0000000000001eede805aa2a99a4"

--0000000000001eede805aa2a99a4
Content-Type: text/plain; charset="UTF-8"

Okay, sir.

On Sat, Jul 11, 2020 at 2:46 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> On Fri, Jul 10, 2020 at 10:46 PM Shuah Khan <skhan@linuxfoundation.org>
> wrote:
> >
> > On 7/10/20 5:26 AM, Mrinal Pandey wrote:
> > > On Thu, Jul 9, 2020 at 10:33 AM Lukas Bulwahn <lukas.bulwahn@gmail.com
> > > <mailto:lukas.bulwahn@gmail.com>> wrote:
> > >
> > >     On Thu, Jul 9, 2020 at 6:31 AM Mrinal Pandey <mrinalmni@gmail.com
> > >     <mailto:mrinalmni@gmail.com>> wrote:
> > >      >
> > >      > On Tue, Jul 7, 2020 at 10:24 PM Lukas Bulwahn
> > >     <lukas.bulwahn@gmail.com <mailto:lukas.bulwahn@gmail.com>> wrote:
> > >      >>
> > >      >> On Tue, Jul 7, 2020 at 10:22 AM Mrinal Pandey
> > >     <mrinalmni@gmail.com <mailto:mrinalmni@gmail.com>> wrote:
> > >      >> >
> > >      >> >
> > >      >> >
> > >      >> > On Tue, Jul 7, 2020 at 1:20 AM Lukas Bulwahn
> > >     <lukas.bulwahn@gmail.com <mailto:lukas.bulwahn@gmail.com>> wrote:
> > >      >> >>
> > >      >> >> On Mon, Jul 6, 2020 at 10:08 AM Mrinal Pandey
> > >     <mrinalmni@gmail.com <mailto:mrinalmni@gmail.com>> wrote:
> > >      >> >> >
> > >      >> >> > checkpatch.pl <http://checkpatch.pl> issues warnings on
> the
> > >     commits
> > >      >> >> > made to scripts/spelling.txt for new entries
> > >      >> >> > of typos and their fixes. This commit adjusts
> > >      >> >> > checkpatch not to complain about the same.
> > >      >> >> >
> > >      >> >> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com
> > >     <mailto:mrinalmni@gmail.com>>
> > >      >> >> > ---
> > >      >> >>
> > >      >> >> How often does that issue appear? Can you use your
> checkpatch
> > >      >> >> evaluation to show that it is relevant?
> > >      >> >
> > >      >>
> > >      >> How many commits to spelling.txt happened within the last year?
> > >      >
> > >      >
> > >      > Sir,
> > >      >
> > >      > I could find only commit to the file in the range 5.7 to
> 5.8.rc-1.
> > >      >>
> > >      >>
> > >      >> The patch might be accepted, but the reason is not that
> convincing.
> > >      >
> > >      >
> > >      > What do you suggest? Should I send it or not?
> > >      >
> > >
> > >     Let us keep that in the backlog for now, but not send it. If it is
> > >     only one single case among hundreds false positives, it is maybe
> not
> > >     the best to start with.
> > >     We might get to that one case here eventually, but let us start
> with
> > >     the more important and critical cases first.
> > >
> > >
> > >      >> Maybe you can find another class of false positives that
> happen more
> > >      >> often?
> > >      >
> > >      >
> > >      > Yes, I have a few other suggestions that I found occurring often
> > >     and I'm still evaluating to find more:
> > >      > 1. In `.h` files, when we write a function prototype, the name
> of
> > >     the function parameters are
> > >      > not required, only the data type is enough, checkpatch says to
> > >     define the name of the parameters too.
> > >      > Issues a warning like - function definition argument '<arg>'
> > >     should also have an identifier name
> > >      >
> > >
> > >     Okay, we need to discuss if that is a convention that developers
> care
> > >     about or not.
> > >
> > >
> > >      > 2. A very common warning is - Macros with complex values should
> > >     be enclosed in parentheses
> > >      > which is correct sometimes but a false positive many times, for
> > >     macros ending with `)` or
> > >      > macros like `#define var value` we probably don't need another
> > >     pair of `()`
> > >      >
> > >
> > >     Agree, this might be worth refining in checkpatch as you described.
> > >
> > >      > 3. checkpatch complains about breaking a quoted string across
> > >     lines but this is many a time
> > >      > necessary for readability and in most of the patches I saw the
> > >     strings broken.
> > >      >
> > >
> > >     Tricky to really know what the best solution is here. It is a
> tradeoff
> > >     in both directions.
> > >     Let us put that aside for now.
> > >
> > >      > 4. There are many patches where checkpatch issues false
> positives
> > >     regarding spaces before
> > >      > and after lines.
> > >      >
> > >     Why are they false positives?
> > >
> > >
> > > Sir,
> > >
> > > The warning by checkpatch says - please, no spaces at the start of a
> line
> > > but there are indeed no spaces before the line where this warning is
> issued.
> > > There are multiple commits having this issue, two of them are
> > > `acaab7335bd6` and `372b38ea5911`.
> > >
> > >
> > >      > 5. The warning - EXPORT_SYMBOL(foo); should immediately follow
> > >     its function/variable
> > >      > is falsely positive in many cases where the statement is correct
> > >     but the script fails to identify it.
> > >      >
> > >
> > >     If the script does not detect that, it sounds like a bug.
> > >     This can be improved for checkpatch.pl <http://checkpatch.pl>.
> > >
> > >      > 6. While running checkpatch on a patch the following error was
> > >     thrown to the console -
> > >      > Use of uninitialized value $1 in regexp compilation at
> > >     ./scripts/checkpatch.pl <http://checkpatch.pl> line 2653.
> > >      > This could be fixed.
> > >      >
> > >
> > >     That looks pretty sure like a bug.
> > >
> > >      > Please let me know your views on these ideas.
> > >
> > >     I suggest we look into issue 5 and 6.
> > >
> > >     For Issue 5: Can you provide me (and the CC: the list) the list of
> > >     false positives (the commit hashes) you found for issue 5 on
> > >     EXPORT_SYMBOL?
> > >
> > >
> > > Here are the commit hashes for which the warning is issued:
> > > 54505a1e2083
> > > 75d75b7a4d54
> > > 8084c99b9af6
> > > bfdaf029c9c9
> > > dfd402a4c4ba
> > >
> > >     Can you also provide a short rationale/explanation for
> > >     each case that you considered a false positive?
> > >
> > >
> > > In each case the `EXPORT_SYMBOL()` is correctly written and the
> > > variable/function to be exported
> > > is also inside the parentheses, still, we get the warning. Please let
> me
> > > know if I am wrong here.
> > >
> > >
> > >     For Issue 6: Can you provide me the commit hash that caused this
> > >     checkpatch.pl <http://checkpatch.pl> error? Then, we can reproduce
> > >     and confirm that issue
> > >     probably simply with `git format-patch -1 $SHA |
> > >     ./scripts/checkpatch.pl <http://checkpatch.pl>` and observe the
> bug
> > >     and crash ourselves?
> > >
> > >
> > > These are the commit hashes that crashed the checkpatch:
> > > 6b3e0e2e0461
> > > 19ce2321739d
> > > 059c6d68cfc5
> > >
> > >
> > >     (I added linux-kernel-mentees@lists.linuxfoundation.org
> > >     <mailto:linux-kernel-mentees@lists.linuxfoundation.org> back to
> the
> > >     recipient list.)
> > >     Also, on sending emails: you started the thread on
> > >     linux-kernel-mentees@lists.linuxfoundation.org
> > >     <mailto:linux-kernel-mentees@lists.linuxfoundation.org>. All
> further
> > >     replies
> > >     shall always include that list in To or CC, so that the email
> thread
> > >     is complete on the list.
> > >
> > >     At some point in this mail thread, you only replied to me but did
> not
> > >     have the list in the recipient list (in To or CC). That was wrong;
> > >     Please follow the rule stated above. I hope this point was already
> > >     taught on the LF Kernel Development Introduction course. Maybe you
> can
> > >     check the material once again and see if and where that was pointed
> > >     out in the course material?
> > >
> > >
> > > Sir, I apologize for not including the list in my previous replies.
> > > Unfortunately, it slipped out of my mind.
> > > I assure you it would not happen again. Also, Linux Kernel Mentorship
> > > wiki says to CC the overall
> > > program mentor Shuah Khan Ma'am on each contribution. Should I do it
> > > only on the final patches or on
> > > every mail I send?
> > >
> >
> > No worries. You are new and this is a learning process.
> >
> > Please cc me on emails. You have to reply to the list when you respond
> > to patch reviews.
> >
> > Please run get_maintainers.pl and include everybody get_maintainers.pl
> > suggests. Without doing so will add more work for you when you send
> > it to the community.
> >
>
> Mrinal, please first send these suggested patches only to me, Shuah
> and the linux-kernel-mentees list for reviewing.
>
> If I am okay with a specific patch, I will let you know to then send
> the patch to everybody get_maintainers.pl suggest, which will be for
> the patches we discuss:
>
> Andy Whitcroft <apw@canonical.com> (maintainer:CHECKPATCH)
> Joe Perches <joe@perches.com> (maintainer:CHECKPATCH)
> linux-kernel@vger.kernel.org (open list)
>
> I want to make sure that I agree with the patch before sending it to
> Andy and Joe.
>
> Lukas
>

--0000000000001eede805aa2a99a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Okay, sir.<br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sat, Jul 11, 2020 at 2:46 AM Lukas Bulwah=
n &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Fri, Jul 10, 2020 at 10:46 PM Shuah Khan &lt;<a href=3D"mailto:skhan@linuxf=
oundation.org" target=3D"_blank">skhan@linuxfoundation.org</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; On 7/10/20 5:26 AM, Mrinal Pandey wrote:<br>
&gt; &gt; On Thu, Jul 9, 2020 at 10:33 AM Lukas Bulwahn &lt;<a href=3D"mail=
to:lukas.bulwahn@gmail.com" target=3D"_blank">lukas.bulwahn@gmail.com</a><b=
r>
&gt; &gt; &lt;mailto:<a href=3D"mailto:lukas.bulwahn@gmail.com" target=3D"_=
blank">lukas.bulwahn@gmail.com</a>&gt;&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0On Thu, Jul 9, 2020 at 6:31 AM Mrinal Pandey &=
lt;<a href=3D"mailto:mrinalmni@gmail.com" target=3D"_blank">mrinalmni@gmail=
.com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mrinalmni@gmail.c=
om" target=3D"_blank">mrinalmni@gmail.com</a>&gt;&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Tue, Jul 7, 2020 at 10:24 PM Lukas Bu=
lwahn<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:lukas.bulwahn@gmail.com"=
 target=3D"_blank">lukas.bulwahn@gmail.com</a> &lt;mailto:<a href=3D"mailto=
:lukas.bulwahn@gmail.com" target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt;=
&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; On Tue, Jul 7, 2020 at 10:22 AM Mrin=
al Pandey<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:mrinalmni@gmail.com" tar=
get=3D"_blank">mrinalmni@gmail.com</a> &lt;mailto:<a href=3D"mailto:mrinalm=
ni@gmail.com" target=3D"_blank">mrinalmni@gmail.com</a>&gt;&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt; On Tue, Jul 7, 2020 at 1:20 AM =
Lukas Bulwahn<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:lukas.bulwahn@gmail.com"=
 target=3D"_blank">lukas.bulwahn@gmail.com</a> &lt;mailto:<a href=3D"mailto=
:lukas.bulwahn@gmail.com" target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt;=
&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; On Mon, Jul 6, 2020 at 10:0=
8 AM Mrinal Pandey<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:mrinalmni@gmail.com" tar=
get=3D"_blank">mrinalmni@gmail.com</a> &lt;mailto:<a href=3D"mailto:mrinalm=
ni@gmail.com" target=3D"_blank">mrinalmni@gmail.com</a>&gt;&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; &gt; <a href=3D"http://chec=
kpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> &lt;<a hr=
ef=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">http://che=
ckpatch.pl</a>&gt; issues warnings on the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0commits<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; &gt; made to scripts/spelli=
ng.txt for new entries<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; &gt; of typos and their fix=
es. This commit adjusts<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; &gt; checkpatch not to comp=
lain about the same.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; &gt; Signed-off-by: Mrinal =
Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com" target=3D"_blank">mrinalm=
ni@gmail.com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mrinalmni@gmail.c=
om" target=3D"_blank">mrinalmni@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; How often does that issue a=
ppear? Can you use your checkpatch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;&gt; evaluation to show that it =
is relevant?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; How many commits to spelling.txt hap=
pened within the last year?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Sir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I could find only commit to the file in =
the range 5.7 to 5.8.rc-1.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; The patch might be accepted, but the=
 reason is not that convincing.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; What do you suggest? Should I send it or=
 not?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Let us keep that in the backlog for now, but n=
ot send it. If it is<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0only one single case among hundreds false posi=
tives, it is maybe not<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0the best to start with.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0We might get to that one case here eventually,=
 but let us start with<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0the more important and critical cases first.<b=
r>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Maybe you can find another class of =
false positives that happen more<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; often?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Yes, I have a few other suggestions that=
 I found occurring often<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0and I&#39;m still evaluating to find more:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1. In `.h` files, when we write a functi=
on prototype, the name of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0the function parameters are<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; not required, only the data type is enou=
gh, checkpatch says to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0define the name of the parameters too.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Issues a warning like - function definit=
ion argument &#39;&lt;arg&gt;&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0should also have an identifier name<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Okay, we need to discuss if that is a conventi=
on that developers care<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0about or not.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 2. A very common warning is - Macros wit=
h complex values should<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0be enclosed in parentheses<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; which is correct sometimes but a false p=
ositive many times, for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0macros ending with `)` or<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; macros like `#define var value` we proba=
bly don&#39;t need another<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0pair of `()`<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Agree, this might be worth refining in checkpa=
tch as you described.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 3. checkpatch complains about breaking a=
 quoted string across<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0lines but this is many a time<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; necessary for readability and in most of=
 the patches I saw the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0strings broken.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Tricky to really know what the best solution i=
s here. It is a tradeoff<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0in both directions.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Let us put that aside for now.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 4. There are many patches where checkpat=
ch issues false positives<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0regarding spaces before<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; and after lines.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Why are they false positives?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Sir,<br>
&gt; &gt;<br>
&gt; &gt; The warning by checkpatch says - please, no spaces at the start o=
f a line<br>
&gt; &gt; but there are indeed no spaces before the line where this warning=
 is issued.<br>
&gt; &gt; There are multiple commits having this issue, two of them are<br>
&gt; &gt; `acaab7335bd6` and `372b38ea5911`.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 5. The warning - EXPORT_SYMBOL(foo); sho=
uld immediately follow<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0its function/variable<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; is falsely positive in many cases where =
the statement is correct<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0but the script fails to identify it.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0If the script does not detect that, it sounds =
like a bug.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0This can be improved for <a href=3D"http://che=
ckpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> &lt;<a h=
ref=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">http://ch=
eckpatch.pl</a>&gt;.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 6. While running checkpatch on a patch t=
he following error was<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0thrown to the console -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Use of uninitialized value $1 in regexp =
compilation at<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0./scripts/<a href=3D"http://checkpatch.pl" rel=
=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> &lt;<a href=3D"http://c=
heckpatch.pl" rel=3D"noreferrer" target=3D"_blank">http://checkpatch.pl</a>=
&gt; line 2653.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; This could be fixed.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0That looks pretty sure like a bug.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Please let me know your views on these i=
deas.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I suggest we look into issue 5 and 6.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0For Issue 5: Can you provide me (and the CC: t=
he list) the list of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0false positives (the commit hashes) you found =
for issue 5 on<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0EXPORT_SYMBOL?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Here are the commit hashes for which the warning is issued:<br>
&gt; &gt; 54505a1e2083<br>
&gt; &gt; 75d75b7a4d54<br>
&gt; &gt; 8084c99b9af6<br>
&gt; &gt; bfdaf029c9c9<br>
&gt; &gt; dfd402a4c4ba<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Can you also provide a short rationale/explana=
tion for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0each case that you considered a false positive=
?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; In each case the `EXPORT_SYMBOL()` is correctly written and the<b=
r>
&gt; &gt; variable/function to be exported<br>
&gt; &gt; is also inside the parentheses, still, we get the warning. Please=
 let me<br>
&gt; &gt; know if I am wrong here.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0For Issue 6: Can you provide me the commit has=
h that caused this<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://checkpatch.pl" rel=3D"norefe=
rrer" target=3D"_blank">checkpatch.pl</a> &lt;<a href=3D"http://checkpatch.=
pl" rel=3D"noreferrer" target=3D"_blank">http://checkpatch.pl</a>&gt; error=
? Then, we can reproduce<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0and confirm that issue<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0probably simply with `git format-patch -1 $SHA=
 |<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0./scripts/<a href=3D"http://checkpatch.pl" rel=
=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> &lt;<a href=3D"http://c=
heckpatch.pl" rel=3D"noreferrer" target=3D"_blank">http://checkpatch.pl</a>=
&gt;` and observe the bug<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0and crash ourselves?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; These are the commit hashes that crashed the checkpatch:<br>
&gt; &gt; 6b3e0e2e0461<br>
&gt; &gt; 19ce2321739d<br>
&gt; &gt; 059c6d68cfc5<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0(I added <a href=3D"mailto:linux-kernel-mentee=
s@lists.linuxfoundation.org" target=3D"_blank">linux-kernel-mentees@lists.l=
inuxfoundation.org</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:linux-kernel-ment=
ees@lists.linuxfoundation.org" target=3D"_blank">linux-kernel-mentees@lists=
.linuxfoundation.org</a>&gt; back to the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0recipient list.)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Also, on sending emails: you started the threa=
d on<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-kernel-mentees@lists.l=
inuxfoundation.org" target=3D"_blank">linux-kernel-mentees@lists.linuxfound=
ation.org</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:linux-kernel-ment=
ees@lists.linuxfoundation.org" target=3D"_blank">linux-kernel-mentees@lists=
.linuxfoundation.org</a>&gt;. All further<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0replies<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0shall always include that list in To or CC, so=
 that the email thread<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0is complete on the list.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0At some point in this mail thread, you only re=
plied to me but did not<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0have the list in the recipient list (in To or =
CC). That was wrong;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Please follow the rule stated above. I hope th=
is point was already<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0taught on the LF Kernel Development Introducti=
on course. Maybe you can<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0check the material once again and see if and w=
here that was pointed<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0out in the course material?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Sir, I apologize for not including the list in my previous replie=
s.<br>
&gt; &gt; Unfortunately, it slipped out of my mind.<br>
&gt; &gt; I assure you it would not happen again. Also, Linux Kernel Mentor=
ship<br>
&gt; &gt; wiki says to CC the overall<br>
&gt; &gt; program mentor Shuah Khan Ma&#39;am on each contribution. Should =
I do it<br>
&gt; &gt; only on the final patches or on<br>
&gt; &gt; every mail I send?<br>
&gt; &gt;<br>
&gt;<br>
&gt; No worries. You are new and this is a learning process.<br>
&gt;<br>
&gt; Please cc me on emails. You have to reply to the list when you respond=
<br>
&gt; to patch reviews.<br>
&gt;<br>
&gt; Please run <a href=3D"http://get_maintainers.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">get_maintainers.pl</a> and include everybody <a href=3D"htt=
p://get_maintainers.pl" rel=3D"noreferrer" target=3D"_blank">get_maintainer=
s.pl</a><br>
&gt; suggests. Without doing so will add more work for you when you send<br=
>
&gt; it to the community.<br>
&gt;<br>
<br>
Mrinal, please first send these suggested patches only to me, Shuah<br>
and the linux-kernel-mentees list for reviewing.<br>
<br>
If I am okay with a specific patch, I will let you know to then send<br>
the patch to everybody <a href=3D"http://get_maintainers.pl" rel=3D"norefer=
rer" target=3D"_blank">get_maintainers.pl</a> suggest, which will be for<br=
>
the patches we discuss:<br>
<br>
Andy Whitcroft &lt;<a href=3D"mailto:apw@canonical.com" target=3D"_blank">a=
pw@canonical.com</a>&gt; (maintainer:CHECKPATCH)<br>
Joe Perches &lt;<a href=3D"mailto:joe@perches.com" target=3D"_blank">joe@pe=
rches.com</a>&gt; (maintainer:CHECKPATCH)<br>
<a href=3D"mailto:linux-kernel@vger.kernel.org" target=3D"_blank">linux-ker=
nel@vger.kernel.org</a> (open list)<br>
<br>
I want to make sure that I agree with the patch before sending it to<br>
Andy and Joe.<br>
<br>
Lukas<br>
</blockquote></div>

--0000000000001eede805aa2a99a4--

--===============5913242491836430062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5913242491836430062==--
