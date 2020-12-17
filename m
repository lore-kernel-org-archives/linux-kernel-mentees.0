Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B2EC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 12:42:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FB923884
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 12:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FB923884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE3AD8718D;
	Thu, 17 Dec 2020 12:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YiDk98j+S9dx; Thu, 17 Dec 2020 12:42:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D335087032;
	Thu, 17 Dec 2020 12:42:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF73BC0893;
	Thu, 17 Dec 2020 12:42:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72C35C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6093087529
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23ABH-IPZl5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:42:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4356387356
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:42:09 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id p187so27355630iod.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 04:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BASUbRgYk38Lj+117f5othDsD/70Q9PpN0vIIPAFC/Q=;
 b=ZmmDeWRYVn7ZMKlPyLeV9B/np+FZwWvKuTnX+iuhkeCoXNevGghr3jJiM0ucJabmrb
 LeoPrhwdQ3AFguryxytwZpEy9LHB+93uhkcbIAtxEU0a9T30UjxUOLh8A7hLux3DxYN8
 GFUtENGj4+szRwfI/jSRDF6T3ovD9syEV1GjMB9hgKLuhSvd6Za/8EgYmYsmS/Uwak4T
 zCJQyciD6zzJ4QuhEK53fJjrE1dGACl6ZtlZJsl4uV68HaRb8HP7V5FNrrvULo9a/H4f
 gLCFlR5CCLvR3//clyr/5VqKSs88NYx6vYdze3q0tp8feQDlsUsVZj4exyFBvs8UiOSV
 YT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BASUbRgYk38Lj+117f5othDsD/70Q9PpN0vIIPAFC/Q=;
 b=XHo2mL/+IsTKQQsjNDDmrVLnb9z3B0aeZR0rCRVa4cX77HeW/IOSBFNL20HEoqFXez
 TnSpt5TA4sIqWRVzRvlahVIlf2Jd4d8wMhsCi2VH3tQebInZZ0COJkB5wfgbDmoAIvU1
 cxoe0h3UBDD6vp7ZYgcdjyBxIc2SEPxUoB0hvgHGwZZmoeCQJaBaJi9otETPmgsPW5th
 jZfeVzVjBn2oPUoCJbHYU7Y6HkyH5AHOYs3+q9DxU0v/4TZKC0X/RDsmA0NBBW6J0FuY
 2UFfXiB3KKLeJ3fg2XUNThFeUaLdFiECYLIrsTsPJK+9tKxOtEvL1kc9YDvIZ3BP26xK
 Me+w==
X-Gm-Message-State: AOAM533JUdCd5NMNJxi1tEeJ8GSvlQbPegGMrZeydRJldpj0VP2+hllN
 w16BuMbWL+XqfKuIu5thzITSX51sOkPOPPNBt3mFwDk0gFk=
X-Google-Smtp-Source: ABdhPJx55N7vwXZsSOFaOEMXVrk+8KtsdjcvSN1wmEk+yix1NtiOyiVr2Q1DHQB/zBuV0XfQ75sTj9kANJw/9UPKSio=
X-Received: by 2002:a6b:6d1a:: with SMTP id a26mr46563936iod.158.1608208928428; 
 Thu, 17 Dec 2020 04:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20201216123121.16466-1-yashsri421@gmail.com>
 <CAKXUXMx+Jogibwf_WbC7RQ0jD2+uU=XvpF4JxSWtz+3C_bRWSg@mail.gmail.com>
 <53238abd-2fdc-e9fb-bef5-4b583ccb14e2@gmail.com>
 <CAKXUXMwo-xeYb9mHFXKN8j6BU9X7iNe68pkJ+zdGay7p+KxK7w@mail.gmail.com>
 <a0629979-751c-711b-47c5-6cdf7d4b869a@gmail.com>
 <6c6d56a3-134d-acc4-a126-c42a02652dfc@gmail.com>
In-Reply-To: <6c6d56a3-134d-acc4-a126-c42a02652dfc@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 17 Dec 2020 13:42:03 +0100
Message-ID: <CAKXUXMyzFbAPdMG-5WHn+PcMk9HRo3s=Xe0HamtMmXCzSvCqAA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
 for COMMIT_LOG_LONG_LINE with URLs
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
Content-Type: multipart/mixed; boundary="===============5658855632680283417=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5658855632680283417==
Content-Type: multipart/alternative; boundary="000000000000e757ce05b6a85170"

--000000000000e757ce05b6a85170
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 12:12 PM Aditya <yashsri421@gmail.com> wrote:

> On 16/12/20 9:59 pm, Aditya wrote:
> > On 16/12/20 6:27 pm, Lukas Bulwahn wrote:
> >> On Wed, Dec 16, 2020 at 1:54 PM Aditya <yashsri421@gmail.com> wrote:
> >>>
> >>> On 16/12/20 6:05 pm, Lukas Bulwahn wrote:
> >>>> On Wed, Dec 16, 2020 at 1:32 PM Aditya Srivastava <
> yashsri421@gmail.com> wrote:
> >>>>>
> >>>>> Currently checkpatch warns for long line in commit messages even for
> >>>>> URL lines.
> >>>>>
> >>>>> An evaluation over v4.13..v5.8 showed that out of ~11000 warnings for
> >>>>> this class, around 790 are due to the line containing link.
> >>>>>
> >>>>> E.g. running checkpatch on commit 3cde818cd02b ("ASoC: topology:
> >>>>> Consolidate how dtexts and dvalues are freed") reports this warning:
> >>>>>
> >>>>> WARNING: Possible unwrapped commit description (prefer a maximum 75
> chars per line)
> >>>>>
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.html
> >>>>>
> >>>>> Avoid giving users warning for character limit, instead suggest them
> to
> >>>>> prefix the URLs with "Link:"
> >>>>>
> >>>>
> >>>> Looks good to me. This might be also a good one for a fix option.
> >>>>
> >>>
> >>> I agree. Should I add the fix in this patch itself?
> >>>
> >>
> >> No, make two patches and send them as a patch series to the mailing
> list.
> >>
> > Hi Lukas
> > So, I generated a list of lines, which are URLs and reported by
> > COMMIT_LOG_LONG_LINE here:
> >
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task6/links/long_line_links.txt
> >
> > These occur in different forms:
> >
> > 1) A large part of these occur as \s*(http|https).
> >
> > 2) These also occur as [1]: https, [2]: https, etc
> >
> > 3) BugLink: https:// (e.g.: BugLink:
> > http://lkml.kernel.org/r/20180426045223.GA15307@dragonet.kaist.ac.kr)
> >
> > 4) References: https:// (e.g.: References:
> >
> http://mid.mail-archive.com/alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi
> )
> >
> > 5) Link to v1: (E.g.: Link to v1:
> >
> https://patchwork.freedesktop.org/patch/msgid/20190228210939.83386-6-sean@poorly.run
> )
> >
> > 6) Datasheet (e.g.
> > Datasheet:
> http://www.winbond.com/resource-files/w25n01gv%20revl%20050918%20unsecured.pdf
> )
> >
> > 7) URL enclosed within brackets (E.g.:
> > (
> https://syzkaller.appspot.com/bug?id=ad7e0351fbc90535558514a71cd3edc11681997a)
> .)
> >
> > 8) Link within sentences (E.g.: suite can be found at
> > https://github.com/Cyan4973/xxHash/blob/cf46e0c/xxhsum.c#L664)
> >
> > etc.
> >
> > Among these I guess we can fix occurrences like 1st by prefixing with
> > "Link:". But I am not sure about the rest.
> >
> > What do you think?
> >
>
> I think we can only fix the lines with ^\s*(http|https|ftp) and should
> just give warning for the others. The user can then decide how they
> want to fix.
>
> Or should we give warning also for ^\s*(http|https|ftp) only?
>
> I guess we can send this patch to Joe and see what he thinks. This
> might give us a better idea for the fix.
>
> What do you think?
>
>
Agree. If we summarize the use of hyperlinks in commit messages properly,
we might also ask on the ksummit-discuss list for some feedback on
"standardizing the use of hyperlinks in commit messages beyond Link-tags".

All those examples show that there are various different preferences but
really no common agreed way that everyone uses.

Let us start the discussion with Joe and then see.

Lukas

--000000000000e757ce05b6a85170
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 12:12 PM Adit=
ya &lt;<a href=3D"mailto:yashsri421@gmail.com">yashsri421@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16/12=
/20 9:59 pm, Aditya wrote:<br>
&gt; On 16/12/20 6:27 pm, Lukas Bulwahn wrote:<br>
&gt;&gt; On Wed, Dec 16, 2020 at 1:54 PM Aditya &lt;<a href=3D"mailto:yashs=
ri421@gmail.com" target=3D"_blank">yashsri421@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 16/12/20 6:05 pm, Lukas Bulwahn wrote:<br>
&gt;&gt;&gt;&gt; On Wed, Dec 16, 2020 at 1:32 PM Aditya Srivastava &lt;<a h=
ref=3D"mailto:yashsri421@gmail.com" target=3D"_blank">yashsri421@gmail.com<=
/a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Currently checkpatch warns for long line in commit mes=
sages even for<br>
&gt;&gt;&gt;&gt;&gt; URL lines.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; An evaluation over v4.13..v5.8 showed that out of ~110=
00 warnings for<br>
&gt;&gt;&gt;&gt;&gt; this class, around 790 are due to the line containing =
link.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; E.g. running checkpatch on commit 3cde818cd02b (&quot;=
ASoC: topology:<br>
&gt;&gt;&gt;&gt;&gt; Consolidate how dtexts and dvalues are freed&quot;) re=
ports this warning:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; WARNING: Possible unwrapped commit description (prefer=
 a maximum 75 chars per line)<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"https://mailman.alsa-project.org/pipermail/=
alsa-devel/2019-January/144761.html" rel=3D"noreferrer" target=3D"_blank">h=
ttps://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.ht=
ml</a><br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Avoid giving users warning for character limit, instea=
d suggest them to<br>
&gt;&gt;&gt;&gt;&gt; prefix the URLs with &quot;Link:&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Looks good to me. This might be also a good one for a fix =
option.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I agree. Should I add the fix in this patch itself?<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; No, make two patches and send them as a patch series to the mailin=
g list.<br>
&gt;&gt;<br>
&gt; Hi Lukas<br>
&gt; So, I generated a list of lines, which are URLs and reported by<br>
&gt; COMMIT_LOG_LONG_LINE here:<br>
&gt; <a href=3D"https://github.com/AdityaSrivast/kernel-tasks/blob/master/T=
ask6/links/long_line_links.txt" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/AdityaSrivast/kernel-tasks/blob/master/Task6/links/long_line_l=
inks.txt</a><br>
&gt; <br>
&gt; These occur in different forms:<br>
&gt; <br>
&gt; 1) A large part of these occur as \s*(http|https).<br>
&gt; <br>
&gt; 2) These also occur as [1]: https, [2]: https, etc<br>
&gt; <br>
&gt; 3) BugLink: https:// (e.g.: BugLink:<br>
&gt; <a href=3D"http://lkml.kernel.org/r/20180426045223.GA15307@dragonet.ka=
ist.ac.kr" rel=3D"noreferrer" target=3D"_blank">http://lkml.kernel.org/r/20=
180426045223.GA15307@dragonet.kaist.ac.kr</a>)<br>
&gt; <br>
&gt; 4) References: https:// (e.g.: References:<br>
&gt; <a href=3D"http://mid.mail-archive.com/alpine.DEB.2.20.1905262211270.2=
4390@whs-18.cs.helsinki.fi" rel=3D"noreferrer" target=3D"_blank">http://mid=
.mail-archive.com/alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi=
</a>)<br>
&gt; <br>
&gt; 5) Link to v1: (E.g.: Link to v1:<br>
&gt; <a href=3D"https://patchwork.freedesktop.org/patch/msgid/2019022821093=
9.83386-6-sean@poorly.run" rel=3D"noreferrer" target=3D"_blank">https://pat=
chwork.freedesktop.org/patch/msgid/20190228210939.83386-6-sean@poorly.run</=
a>)<br>
&gt; <br>
&gt; 6) Datasheet (e.g.<br>
&gt; Datasheet:<a href=3D"http://www.winbond.com/resource-files/w25n01gv%20=
revl%20050918%20unsecured.pdf" rel=3D"noreferrer" target=3D"_blank">http://=
www.winbond.com/resource-files/w25n01gv%20revl%20050918%20unsecured.pdf</a>=
)<br>
&gt; <br>
&gt; 7) URL enclosed within brackets (E.g.:<br>
&gt; (<a href=3D"https://syzkaller.appspot.com/bug?id=3Dad7e0351fbc90535558=
514a71cd3edc11681997a)" rel=3D"noreferrer" target=3D"_blank">https://syzkal=
ler.appspot.com/bug?id=3Dad7e0351fbc90535558514a71cd3edc11681997a)</a>.)<br=
>
&gt; <br>
&gt; 8) Link within sentences (E.g.: suite can be found at<br>
&gt; <a href=3D"https://github.com/Cyan4973/xxHash/blob/cf46e0c/xxhsum.c#L6=
64" rel=3D"noreferrer" target=3D"_blank">https://github.com/Cyan4973/xxHash=
/blob/cf46e0c/xxhsum.c#L664</a>)<br>
&gt; <br>
&gt; etc.<br>
&gt; <br>
&gt; Among these I guess we can fix occurrences like 1st by prefixing with<=
br>
&gt; &quot;Link:&quot;. But I am not sure about the rest.<br>
&gt; <br>
&gt; What do you think?<br>
&gt; <br>
<br>
I think we can only fix the lines with ^\s*(http|https|ftp) and should<br>
just give warning for the others. The user can then decide how they<br>
want to fix.<br>
<br>
Or should we give warning also for ^\s*(http|https|ftp) only?<br>
<br>
I guess we can send this patch to Joe and see what he thinks. This<br>
might give us a better idea for the fix.<br>
<br>
What do you think?<br>
<br></blockquote><div><br></div><div>Agree. If we summarize the use of hype=
rlinks in commit messages properly, we might also ask on the ksummit-discus=
s list for some feedback on &quot;standardizing the use of hyperlinks in co=
mmit messages beyond Link-tags&quot;.</div><div><br></div><div>All those ex=
amples show that there are various different preferences but really no comm=
on agreed=C2=A0way that=C2=A0everyone uses.</div><div><br></div><div>Let us=
 start the discussion with Joe and then see.</div><div><br></div><div>Lukas=
</div></div></div>

--000000000000e757ce05b6a85170--

--===============5658855632680283417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5658855632680283417==--
