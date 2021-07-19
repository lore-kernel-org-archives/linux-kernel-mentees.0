Return-Path: <SRS0=VrTg=ML=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_KAM_HTML_FONT_INVALID autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7512C07E9D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jul 2021 10:52:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 883D361029
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jul 2021 10:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 883D361029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5349D8248F;
	Mon, 19 Jul 2021 10:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9HvOOdVXu_p; Mon, 19 Jul 2021 10:52:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 501AE81D70;
	Mon, 19 Jul 2021 10:52:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A986C0010;
	Mon, 19 Jul 2021 10:52:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 897C1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 10:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73D1140187
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 10:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hi6RSlxS2spi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 10:52:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A81CD400C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 10:52:28 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id g22so19439449iom.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 03:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/3EiEwlac7MNsajXXrRr1MlS2QpsfbJ29gNsLoPPAoI=;
 b=EtdxcxKs2XXpL0cq62Nz3OB8kyGrNlU3lpNFP/RijBcm3S7T/eFOoY1LPCaP8H0vcT
 7SsLE1ueFtvoYbNDZRwXp2iPT3TXFbWiybESjUteDii60rncm4Kujt9a843fYX19nhwg
 hXjHbuK+SpFdXF5AUEGV/fDO6KspGqDiXYqiK/0tgUGrbuXnyNwqR/IgqdWx+NtG6kQ5
 cZHsCyDGVKD1efx2R9zdPo7g0YudgAmkTFm4Rbr/OMjcENZpXKfoDkFguauB8Kt+hm20
 S/B0YschP2rnHmg3U1TvkTeGYxaZgceKQ/XmgNdbkAAWvnKw4KEZEJsnniuzjc/LE0CQ
 LyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/3EiEwlac7MNsajXXrRr1MlS2QpsfbJ29gNsLoPPAoI=;
 b=FPH/2TD/Xl2YbtajmWgzz/0H+he+QojTuujfLTmX1tfM6fAoHSqhElHUvoQmBTZWDG
 TiiHEpvRX29Hubyf8EZsuYh3IA+VB41h+7GREciwYfcTwJs3xnWzDa018w4n3hKFpk36
 RQvJOOURtXxcEQpOYZFf8F9nGqVTwkXYIFcjedZpZ5ckz/ZNuxNbi24k39TkDVxRxvv4
 Xtw832xrtCRohpgtxR+v6peVW4lgE8sNrGyX9Jyfp7K1fqeakfcZiSwwM7e1IIVOvofn
 5kl64omekXEjFT8vXVVQdSwDo/dhOoSdAXgBMBOA/ad+qro7lLR8xm52M9Oek/Xcf7fd
 b3Aw==
X-Gm-Message-State: AOAM532c63ypJN2SwwGLbbA9tb5BRRKzXWpiAAucCj1SXWPViPULOPmc
 tkxlrT8mqextR/cxZiiWwOwLu5WyWGz1xoMlyYU=
X-Google-Smtp-Source: ABdhPJzFN3ZIQ34Hjq5RAxFCqyuUKsmnDFrwy47OHJwCT47yWCvEFZu/9BTsLYqjKLfzeK5HiyBNOe32NYEo2jLgPSo=
X-Received: by 2002:a05:6638:100b:: with SMTP id
 r11mr21309323jab.85.1626691947749; 
 Mon, 19 Jul 2021 03:52:27 -0700 (PDT)
MIME-Version: 1.0
From: Abhinav Dubey <abhinavbhardwaj510@gmail.com>
Date: Mon, 19 Jul 2021 16:22:16 +0530
Message-ID: <CAFn3W_nfbaLV=jCKadwba2rojfDZTZ8TFYLfyydTdbJGzAoptA@mail.gmail.com>
Subject: Mining Maintainers Mentorship Program - Mentee Selection Task Response
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============9061020466266570268=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============9061020466266570268==
Content-Type: multipart/alternative; boundary="000000000000b468ba05c777bbf0"

--000000000000b468ba05c777bbf0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have compiled the latest stable kernel version 5.13.2 with defconfig X86
architecture on ubuntu 20.04 vagrant VM.

The MAINTAINERS file can be divided into 3 sections to understand what it
is.


   1.

   The first section is providing instructions for people who want to
   submit patches to the kernel. According to the instructions, thorough
   testing of the patches should be done and all concerned people should be
   CCed. Variable names and formatting should be according to the existing
   coding style. There shouldn=E2=80=99t be any ambiguity as to who owns th=
e patch
   (employer or employee).



   1.

   The second section is a list of abbreviations used in the file. For
   example, M for Maintainer, R for Reviewer, S for Status of the code, B f=
or
   the URI of the web page for bug-related things, F for file directory
   pattern, L for the Mailing list, T for Tree type and location.



   1.

   The third section is the actual list of Maintainers of the different
   parts of Kernel distinguished by their areas. This list should be in
   Alphabetical order.


There were no Reviewers mentioned for the sections given in the mail,
Maintainers are mentioned below.

ACPI FAN DRIVER

Zhang Rui <rui.zhang@intel.com>

AF9013 MEDIA DRIVER

Antti Palosaari <crope@iki.fi>

BROADCOM BNXT_EN 50 GIGABIT ETHERNET DRIVER

Michael Chan <michael.chan@broadcom.com>

DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU

Hans de Goede <hdegoede@redhat.com>

INTEL KEEM BAY DRM DRIVER

Anitha Chrisanthus <anitha.chrisanthus@intel.com>

Edmund Dea <edmund.j.dea@intel.com>

LICENSES and SPDX stuff

Thomas Gleixner <tglx@linutronix.de>

Greg Kroah-Hartman <gregkh@linuxfoundation.org>

M68K ON APPLE MACINTOSH

Joshua Thompson <funaho@jurai.org>

MEMBARRIER SUPPORT

Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Paul E. McKenney <paulmck@kernel.org>

MICROBLAZE ARCHITECTURE

Michal Simek <monstr@monstr.eu>

RESET CONTROLLER FRAMEWORK

Philipp Zabel <p.zabel@pengutronix.de>


*Thanks & Regards*

Abhinav Dubey

--000000000000b468ba05c777bbf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">I have co=
mpiled the latest stable kernel version 5.13.2 with defconfig X86 architect=
ure on ubuntu 20.04 vagrant VM.=C2=A0</span></p><br><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap">The MAINTAINERS file can be divided into 3 sectio=
ns to understand what it is.</span></p><br><ol style=3D"margin-top:0px;marg=
in-bottom:0px"><li dir=3D"ltr" style=3D"margin-left:15px;list-style-type:de=
cimal;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" role=3D"presentation=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline">The first section =
is providing instructions for people who want to submit patches to the kern=
el. According to the instructions, thorough testing of the patches should b=
e done and all concerned people should be CCed. Variable names and formatti=
ng should be according to the existing coding style. There shouldn=E2=80=99=
t be any ambiguity as to who owns the patch (employer or employee).</span><=
/p></li></ol><br><ol start=3D"2" style=3D"margin-top:0px;margin-bottom:0px"=
><li dir=3D"ltr" style=3D"margin-left:15px;list-style-type:decimal;font-siz=
e:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap"><p dir=3D"ltr" role=3D"presentation" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline">The second section is a list of ab=
breviations used in the file. For example, M for Maintainer, R for Reviewer=
, S for Status of the code, B for the URI of the web page for bug-related t=
hings, F for file directory pattern, L for the Mailing list, T for Tree typ=
e and location.</span></p></li></ol><br><ol start=3D"3" style=3D"margin-top=
:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"margin-left:15px;list-styl=
e-type:decimal;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" role=3D"pre=
sentation" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline">The third s=
ection is the actual list of Maintainers of the different parts of Kernel d=
istinguished by their areas. This list should be in Alphabetical order.</sp=
an></p></li></ol><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">There=
 were no Reviewers mentioned for the sections given in the mail, Maintainer=
s are mentioned below.=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">ACPI FAN DRIVER</span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">Zhang Rui &lt;</span><a href=3D"mailto:rui.zhang@intel.com=
" style=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font=
-size:11pt;font-family:Arial;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;text-decoration-line:underline;ve=
rtical-align:baseline;white-space:pre-wrap">rui.zhang@intel.com</span></a><=
span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap">&gt;</span></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">AF9013 MEDIA DRIVER</span></p><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre-wrap">Antti Palosaari &lt;</span><=
a href=3D"mailto:crope@iki.fi" style=3D"text-decoration-line:none" target=
=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;te=
xt-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">=
crope@iki.fi</span></a><span style=3D"font-size:11pt;font-family:Arial;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt=
;</span></p><span style=3D"color:rgb(80,0,80)"><br><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">BROADCOM BNXT_EN 50 GIGABIT ETHERNET DRIVER</span>=
</p></span><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">Michael Chan &l=
t;</span><a href=3D"mailto:michael.chan@broadcom.com" style=3D"text-decorat=
ion-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:=
Arial;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;text-decoration-line:underline;vertical-align:baseline;w=
hite-space:pre-wrap">michael.chan@broadcom.com</span></a><span style=3D"fon=
t-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap">&gt;</span></p><span style=3D"color:rgb(80,0=
,80)"><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">DRM DRIVER FOR V=
IRTUALBOX VIRTUAL GPU</span></p></span><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Hans de Goede &lt;</span><a href=3D"mailto:hdegoede@redhat.com=
" style=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font=
-size:11pt;font-family:Arial;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;text-decoration-line:underline;ve=
rtical-align:baseline;white-space:pre-wrap">hdegoede@redhat.com</span></a><=
span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap">&gt;</span></p><span style=
=3D"color:rgb(80,0,80)"><br><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap=
">INTEL KEEM BAY DRM DRIVER</span></p></span><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">Anitha Chrisanthus &lt;</span><a href=3D"mailto:anitha.c=
hrisanthus@intel.com" style=3D"text-decoration-line:none" target=3D"_blank"=
><span style=3D"font-size:11pt;font-family:Arial;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;text-decorati=
on-line:underline;vertical-align:baseline;white-space:pre-wrap">anitha.chri=
santhus@intel.com</span></a><span style=3D"font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap=
">&gt;</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Edmund De=
a &lt;</span><a href=3D"mailto:edmund.j.dea@intel.com" style=3D"text-decora=
tion-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family=
:Arial;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;text-decoration-line:underline;vertical-align:baseline;=
white-space:pre-wrap">edmund.j.dea@intel.com</span></a><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">LICENSES and SPDX stuff</span></p><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap">Thomas Gleixner &lt;</span><a href=3D"mailto:=
tglx@linutronix.de" style=3D"text-decoration-line:none" target=3D"_blank"><=
span style=3D"font-size:11pt;font-family:Arial;background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;text-decoration=
-line:underline;vertical-align:baseline;white-space:pre-wrap">tglx@linutron=
ix.de</span></a><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt;</span=
></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">Greg Kroah-Hartman &l=
t;</span><a href=3D"mailto:gregkh@linuxfoundation.org" style=3D"text-decora=
tion-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family=
:Arial;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;text-decoration-line:underline;vertical-align:baseline;=
white-space:pre-wrap">gregkh@linuxfoundation.org</span></a><span style=3D"f=
ont-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-alig=
n:baseline;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap">M68K ON APPLE MACINTOSH</span></p><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">Joshua Thompson &lt;</span><a href=3D"mai=
lto:funaho@jurai.org" style=3D"text-decoration-line:none" target=3D"_blank"=
><span style=3D"font-size:11pt;font-family:Arial;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;text-decorati=
on-line:underline;vertical-align:baseline;white-space:pre-wrap">funaho@jura=
i.org</span></a><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt;</span=
></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">MEMBARRIER SUPPOR=
T</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">Mathieu Desnoy=
ers &lt;</span><a href=3D"mailto:mathieu.desnoyers@efficios.com" style=3D"t=
ext-decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;f=
ont-family:Arial;background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;text-decoration-line:underline;vertical-align=
:baseline;white-space:pre-wrap">mathieu.desnoyers@efficios.com</span></a><s=
pan style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre-wrap">&gt;</span></p><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">Paul E. McKenney &lt;</span><a href=
=3D"mailto:paulmck@kernel.org" style=3D"text-decoration-line:none" target=
=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;te=
xt-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">=
paulmck@kernel.org</span></a><span style=3D"font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">&gt;</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">MICR=
OBLAZE ARCHITECTURE</span></p><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">Michal Simek &lt;</span><a href=3D"mailto:monstr@monstr.eu" style=3D"te=
xt-decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;fo=
nt-family:Arial;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;text-decoration-line:underline;vertical-align:=
baseline;white-space:pre-wrap">monstr@monstr.eu</span></a><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">RESET CONTROLLER FRAMEWORK</span></p><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">Philipp Zabel &lt;</span><a href=3D"m=
ailto:p.zabel@pengutronix.de" style=3D"text-decoration-line:none" target=3D=
"_blank"><span style=3D"font-size:11pt;font-family:Arial;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;text-=
decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">p.z=
abel@pengutronix.de</span></a><span style=3D"font-size:11pt;font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">&gt;</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><br></p><p style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><b>Thanks &amp; Regards</b></p><p style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt">Abhinav Dubey</p></div>

--000000000000b468ba05c777bbf0--

--===============9061020466266570268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============9061020466266570268==--
