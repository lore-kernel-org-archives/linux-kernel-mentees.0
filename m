Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872CAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 14:57:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CA22223B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 14:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjQ3Hs/c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CA22223B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 152218A9C9;
	Tue, 14 Jul 2020 14:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yd5SKNvMu9ya; Tue, 14 Jul 2020 14:57:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 781F78A9A1;
	Tue, 14 Jul 2020 14:57:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E8D4C0888;
	Tue, 14 Jul 2020 14:57:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F5AAC0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 14:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E7A289247
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 14:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJ5ndi544_Xa
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 14:56:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 70C4388F00
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 14:56:58 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u5so7686881pfn.7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=o75durniB4i/8WtCyyRdWNaCiRx0tQShjgNTKUNBcZQ=;
 b=NjQ3Hs/c5dpjLZTXqQph6Dc1dwceUxAODLRoTq00QZa0n3WKIGZyxoq5X/JlDQF7QW
 m0UvThTPa+1Vv/CoYC8wHrtdfR/LbMdoBUvMO5tWnVia8GR6EqBg+aC+3sRoqijlvwwV
 lMuT495xyO9IvZSZ/15TuIQUK3S2dpr7y31x8/auiF8SYgkX5vmLFVz9tts8R7ZUuh3D
 dtOawBKWqI6NBrSQnnssb6ta3h01XzS6FA0VB8rKfW4Jd+1t3UB93TMuiZiKUdqAkb9l
 jg5LaiLrpPyYqb7xof5bonGDB5T1/C8MmjDxfHpzCFCWANQXApnJDJRgmNplPjg2Eeew
 BLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=o75durniB4i/8WtCyyRdWNaCiRx0tQShjgNTKUNBcZQ=;
 b=IfieypnK7SsexGhilojJyZLycrPDelC7rES6tIqoffiAyUrTRZtP3rps6RMYE9FzYu
 76q0wCuRgN6vKXOwfZI69jMeAIc1QGqZ6NK/Q7OfoIxQntsiVtOY9ElsL1Iv8lzSsvLa
 /9pl+Nn/jTLWipoGdGZMGkSRryud2p3ndzV0n/2a17n5uWuZNq+l2rsqqWn6p3yfu1f1
 WZkVK86v7+7zKwQzb2+55pfS7NLnL7zpKX/TDJ7BCWHp17z8eUsLAjD6XHRK5FCWff1n
 tnAuYep23pRUU3oQEdWzLQzcZ9hrEIpCjr5l1F6/PfppnYqNPfSk/WS3TTXCWuGW6dVJ
 ZfXg==
X-Gm-Message-State: AOAM533hXQyJHwGTyrggPPpyC+azRgUIwhaHVhyU3Tp23zhc0kjncFi8
 3BJrmfK8u79TUgaC8NwyWxo6XbMdsS1LS1r+W20=
X-Google-Smtp-Source: ABdhPJyJ5q6q4EUU3Ma0/wex6Hsj46er7ZYMLbr15y1kSc7U9BPq0eeU4yv7st5ug9IoljUyZwp28KX4ZWmXXl1pJVg=
X-Received: by 2002:a63:1a16:: with SMTP id a22mr3754772pga.142.1594738617819; 
 Tue, 14 Jul 2020 07:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
 <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
 <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
 <CAKXUXMx8RcQrihaYvryhm4N8X4BATLpPmRnDkm6nCmhznugd0g@mail.gmail.com>
In-Reply-To: <CAKXUXMx8RcQrihaYvryhm4N8X4BATLpPmRnDkm6nCmhznugd0g@mail.gmail.com>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Tue, 14 Jul 2020 20:26:46 +0530
Message-ID: <CAD1=X6m2Lp-KE-xHN1uE7egZRp5-gkXbGVC4f5EUjyMfJ12rHQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4874457960042532276=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4874457960042532276==
Content-Type: multipart/alternative; boundary="000000000000d325ad05aa680428"

--000000000000d325ad05aa680428
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 11, 2020 at 3:17 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
> >> For Issue 5: Can you provide me (and the CC: the list) the list of
> >> false positives (the commit hashes) you found for issue 5 on
> >> EXPORT_SYMBOL?
> >
> >
> > Here are the commit hashes for which the warning is issued:
> > 54505a1e2083
> > 75d75b7a4d54
> > 8084c99b9af6
> > bfdaf029c9c9
> > dfd402a4c4ba
> >
> >> Can you also provide a short rationale/explanation for
> >> each case that you considered a false positive?
> >
> >
> > In each case the `EXPORT_SYMBOL()` is correctly written and the
> variable/function to be exported
> > is also inside the parentheses, still, we get the warning. Please let me
> know if I am wrong here.
>
> I checked those warnings. Some of the patches are good cases to check if
> we can improve the heuristics on EXPORT_SYMBOL().
>
> E.g., commit bfdaf029c9c9 ("ia64: turn csum_partial_copy_from_user() into
> csum_and_copy_from_user()") looks sound to me, and checkpatch.pl should
> not really warn about that.
>
> Mrinal, maybe you can find out why checkpatch.pl believes that this case
> is wrong and needs to be warned about?
>

Sir,

Commit `54505a1e2083`, `8084c99b9af6` and `bfdaf029c9c9` have style issues.
The documentation says to use
`EXPORT_SYMBOL()` just after the closing bracket `}` of the function, it is
exporting. In these commits `EXPORT SYMBOL()`
is either defined at a point later or has been defined after leaving a
blank line which is totally unneeded.

However, commits `dfd402a4c4ba` and `75d75b7a4d54` look fine to me and have
one thing in common, the
`EXPORT_SYMBOL()` in these is used inside of a macro. checkpatch shouldn't
warn about these.

I have noticed checkpatch denoting wrong line numbers for certain files for
several commits.
For example, for the above commit
`bfdaf029c9c9`, the following warning is issued:

WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
#74: FILE: arch/ia64/lib/csum_partial_copy.c:122:
+EXPORT_SYMBOL(csum_and_copy_from_user);

but the file arch/ia64/lib/csum_partial_copy.c is only 113 lines long.
Please let me know if you can reproduce this.

Waiting for your insights.
Thank you.

>
>
> Lukas
>

--000000000000d325ad05aa680428
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 11, 2020 at 3:17 AM Lukas=
 Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div><br></div><div>&gt;&gt; For Issue 5: Can you prov=
ide me (and the CC: the list) the list of<br>&gt;&gt; false positives (the =
commit hashes) you found for issue 5 on<br>&gt;&gt; EXPORT_SYMBOL?<br>&gt;<=
br>&gt;</div><div>&gt; Here are the commit hashes for which the warning is =
issued:<br>&gt; 54505a1e2083<br>&gt; 75d75b7a4d54<br>&gt; 8084c99b9af6<br>&=
gt; bfdaf029c9c9<br>&gt; dfd402a4c4ba<br>&gt;<br>&gt;&gt; Can you also prov=
ide a short rationale/explanation for<br>&gt;&gt; each case that you consid=
ered a false positive?<br>&gt;<br>&gt;<br>&gt; In each case the `EXPORT_SYM=
BOL()` is correctly written and the variable/function to be exported<br>&gt=
; is also inside the parentheses, still, we get the warning. Please let me =
know if I am wrong here.<br><br></div><div>I checked those warnings. Some o=
f the patches are good cases to check if we can improve the heuristics on E=
XPORT_SYMBOL().</div><div><br></div><div>E.g., commit bfdaf029c9c9 (&quot;i=
a64: turn csum_partial_copy_from_user() into csum_and_copy_from_user()&quot=
;) looks sound to me, and <a href=3D"http://checkpatch.pl" target=3D"_blank=
">checkpatch.pl</a> should not really=C2=A0warn about that.</div><div><br><=
/div><div>Mrinal, maybe you can find out why <a href=3D"http://checkpatch.p=
l" target=3D"_blank">checkpatch.pl</a> believes that this case is wrong and=
 needs to be warned about?</div></div></blockquote><div><br></div><div>Sir,=
</div><div><br></div><div>Commit `54505a1e2083`, `8084c99b9af6` and `bfdaf0=
29c9c9` have style issues. The documentation says to use</div><div>`EXPORT_=
SYMBOL()` just after the closing bracket `}` of the function, it is exporti=
ng. In these commits `EXPORT SYMBOL()` <br></div><div>is either defined at =
a point later or has been defined after leaving a blank line which is total=
ly unneeded.</div><div><br></div><div>However, commits `dfd402a4c4ba` and `=
75d75b7a4d54` look fine to me and have one thing in common, the</div><div>`=
EXPORT_SYMBOL()` in these is used inside of a macro. checkpatch shouldn&#39=
;t warn about these.<br></div><div><br></div><div>I have noticed checkpatch=
 denoting wrong line numbers for certain files for several commits.<br></di=
v><div>For example, for the above commit</div><div>`bfdaf029c9c9`, the foll=
owing warning is issued:</div><div><br></div><div>WARNING: EXPORT_SYMBOL(fo=
o); should immediately follow its function/variable<br>#74: FILE: arch/ia64=
/lib/csum_partial_copy.c:122:<br>+EXPORT_SYMBOL(csum_and_copy_from_user);</=
div><div><br></div><div>but the file arch/ia64/lib/csum_partial_copy.c is o=
nly 113 lines long.</div><div>Please let me know if you can reproduce this.=
<br></div><br></div><div class=3D"gmail_quote">Waiting for your insights.<b=
r><div>Thank you.<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div><br></div><div><br></div><div>Lukas</div></div>
</blockquote></div></div>

--000000000000d325ad05aa680428--

--===============4874457960042532276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4874457960042532276==--
