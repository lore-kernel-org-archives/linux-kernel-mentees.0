Return-Path: <SRS0=lv87=AW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE02C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Jul 2020 13:37:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E3D9207BC
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Jul 2020 13:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWl6sJde"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E3D9207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 67DDA89289;
	Sat, 11 Jul 2020 13:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NmWudMDhpzMG; Sat, 11 Jul 2020 13:37:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8F7EC88E43;
	Sat, 11 Jul 2020 13:37:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78719C077B;
	Sat, 11 Jul 2020 13:37:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F404C0895
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 13:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 792D787322
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 13:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xt_f44IGYFNe
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 13:37:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B209C8716A
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 13:37:18 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i14so3781606pfu.13
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 06:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=yymQWXGEqOVTJ/eMSeBqT+GO+zH7yawysvCV2pocOjE=;
 b=OWl6sJdeiRTAlUe/6IUpFSLS+v9/13NIUO1geU24PGtcEk+HhU+t+6SNxgNqzcvID+
 3vTqJFmNrZLRbdrB86Y4+pb4vuD3LPeWd/oSGbLJTU+LuwUx/RTo89nMLsVl6xXoJwAM
 lAQsApYL87CqvNK/8QqXVTj5zDudLzGPNdo7y0KeWoTzW3hDwv4j38U7D1F85XM/mbWh
 6WSoA3MebAJCPrlo/WSpoAgprBUaip3zcjSEUaoLYjw/J/jQPYOguztxlYF5ubs+X1R7
 wVrBAlM+TOG1bpZdkYqJwMigCzaxVdhJxRRIWzPF2MokdMxPWIFDcPjZ1JDSw+srgpaO
 sR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=yymQWXGEqOVTJ/eMSeBqT+GO+zH7yawysvCV2pocOjE=;
 b=Z0vEGb9ruHl80yk9fFY/ZFFmW3ww4kw5o9GiyS4+++PVtcQVCuXroF6ByMvTAKba/u
 tnsPHOfc32itVois5yUkZrObwSN6l33U1C7ET9Cof/7i+8Vp1SJGU7JOjFqwxJ8KBuqj
 9NL94Pg+K2p9SRmKZ1hj0Elre0cD/dOXE2aE3mWebHSihZdF+zBTsD8PESQ/huy4dcEF
 sQayiY9VEtN9kWPF/YlzNOQq3Mr1N3J7y0JrFVBtEv+CkE7UdqRTve5pvmZuvm0QiSQr
 wbaNOZQ0VPBbarHFJfU2rJ/oAAVA/eHDzd+p3g+wiWxm5pE3NE54AoGAdWpSDKPcY2Ee
 /UHQ==
X-Gm-Message-State: AOAM53179uFwr1QzK7lv7fQLTeKO0BpMayfs8R0FRfae4swOT8vfoS8T
 9AFZb6TIkzhE+8tW89xp5MHlu3FkfJMcIpumOWQ=
X-Google-Smtp-Source: ABdhPJyeo9gCqfzN1Nb1sd7lPAOyPLgouT0SL2iNhxfQIn1VBZ0avKNzhB1rnEps7KcX3ZDR32e1ne58xN5I0tNM2XU=
X-Received: by 2002:a63:1a16:: with SMTP id a22mr39417384pga.142.1594474638008; 
 Sat, 11 Jul 2020 06:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
 <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
 <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
 <CAKXUXMzFHnW5Yn5gwXgh3YtwCWfhFjeucMV4-JvX--2rFkFirg@mail.gmail.com>
In-Reply-To: <CAKXUXMzFHnW5Yn5gwXgh3YtwCWfhFjeucMV4-JvX--2rFkFirg@mail.gmail.com>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Sat, 11 Jul 2020 19:07:06 +0530
Message-ID: <CAD1=X6nPM2MXf3C1BUHQei57k=Nn481GRRrB3agR5vUXfDoUOg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0223110687076810263=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0223110687076810263==
Content-Type: multipart/alternative; boundary="00000000000066e78005aa2a8ecc"

--00000000000066e78005aa2a8ecc
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 11, 2020 at 3:01 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> >>
> >> For Issue 6: Can you provide me the commit hash that caused this
> >> checkpatch.pl error? Then, we can reproduce and confirm that issue
> >> probably simply with `git format-patch -1 $SHA |
> >> ./scripts/checkpatch.pl` and observe the bug and crash ourselves?
> >
> >
> > These are the commit hashes that crashed the checkpatch:
> > 6b3e0e2e0461
> > 19ce2321739d
> > 059c6d68cfc5
> >
>
> Okay, I checked the output of checkpatch.pl on those three commits and
> I can confirm that checkpatch.pl warns during its own execution with:
>
> Use of uninitialized value $1 in regexp compilation at
> ./scripts/checkpatch.pl line 2638.
>
> Mrinal, can you debug and find out why and what specifically in those
> patches cause this warning in line 2638?
>

Sir,

The block in checkpatch where this issue appears is triggered only when
someone
writes a commit message that contains diff content. This is a rare event
hence the issue
in the block shows up only for a few specific commits.

>
> Also, what is the intent and when was this introduced to
> checkpatch.pl? It could be that it never worked since it was
> introduced or that it broke due to some refactoring. Can you find what
> happened in this case here?


The code which causes the issue is:
$line =~ m@^\s+diff\b.*a/[\w/]+@ && $line =~ m@
^\s+diff\b.*a/([\w/]+)\s+b/$1\b@

I believe the intent was to use the "capture groups ( ... )" of Perl and
then use `$1`, which
would have contained the previous match, in the regex expression. Somehow,
the capture
group is used in the same expression as `$1` leading `$1` to remain
uninitialized, i.e. ([\w/]+) followed by $1.
In my opinion, the ( ... ) should be used in the previous expression
thereby initializing `$1` to the required value.
When I do this change and run the script again, the error vanishes.
Please let me know if what I say sounds reasonable so that I will continue
with sending this patch to you.

>
> Lukas
>

--00000000000066e78005aa2a8ecc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Jul 11, 2020 at 3:01 AM Lukas Bul=
wahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.com=
</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">&gt;&gt;<br>
&gt;&gt; For Issue 6: Can you provide me the commit hash that caused this<b=
r>
&gt;&gt; <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_bla=
nk">checkpatch.pl</a> error? Then, we can reproduce and confirm that issue<=
br>
&gt;&gt; probably simply with `git format-patch -1 $SHA |<br>
&gt;&gt; ./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a>` and observe the bug and crash ourselves?<b=
r>
&gt;<br>
&gt;<br>
&gt; These are the commit hashes that crashed the checkpatch:<br>
&gt; 6b3e0e2e0461<br>
&gt; 19ce2321739d<br>
&gt; 059c6d68cfc5<br>
&gt;<br>
<br>
Okay, I checked the output of <a href=3D"http://checkpatch.pl" rel=3D"noref=
errer" target=3D"_blank">checkpatch.pl</a> on those three commits and<br>
I can confirm that <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a> warns during its own execution with:<br>
<br>
Use of uninitialized value $1 in regexp compilation at<br>
./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_bl=
ank">checkpatch.pl</a> line 2638.<br>
<br>
Mrinal, can you debug and find out why and what specifically in those<br>
patches cause this warning in line 2638?<br></blockquote><div><br></div><di=
v><div>Sir,</div><div><br></div><div>The block in checkpatch where this iss=
ue appears is triggered only when someone</div><div>writes a commit message=
 that contains diff content. This is a rare event hence the issue</div><div=
>in the block shows up only for a few specific commits. <br></div></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also, what is the intent and when was this introduced to<br>
<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">check=
patch.pl</a>? It could be that it never worked since it was<br>
introduced or that it broke due to some refactoring. Can you find what<br>
happened in this case here?</blockquote><div><br></div><div>The code which =
causes the issue is:</div><div> $line =3D~ m@^\s+diff\b.*a/[\w/]+@ &amp;&am=
p; $line =3D~ m@^\s+diff\b.*a/([\w/]+)\s+b/$1\b@</div><div><br></div><div>I=
 believe the intent was to use the &quot;capture groups ( ... )&quot; of Pe=
rl and then use `$1`, which</div><div>would have contained the previous mat=
ch, in the regex expression. Somehow, the capture</div><div>group is used i=
n the same expression as `$1` leading `$1` to remain uninitialized, i.e. ([=
\w/]+) followed by $1.<br></div><div>In my opinion, the ( ... ) should be u=
sed in the previous expression thereby initializing `$1` to the required va=
lue.</div><div>When I do this change and run the script again, the error va=
nishes.</div><div>Please let me know if what I say sounds reasonable so tha=
t I will continue with sending this patch to you.<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
Lukas<br>
</blockquote></div></div>

--00000000000066e78005aa2a8ecc--

--===============0223110687076810263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0223110687076810263==--
