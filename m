Return-Path: <SRS0=Q5UI=MQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_KAM_HTML_FONT_INVALID,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CA6C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 05:01:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D7960E9C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 05:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66D7960E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EA66400AE;
	Sat, 24 Jul 2021 05:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3vFCq7lx3phs; Sat, 24 Jul 2021 05:01:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 16FC640025;
	Sat, 24 Jul 2021 05:01:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF7B3C001A;
	Sat, 24 Jul 2021 05:01:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74212C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 05:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BEDD400AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 05:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVuFk50S27i1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 05:01:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 880AD40025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 05:01:15 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id c3so3488499ilh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 22:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xVxYqcfr2AzWBGfOQj7mUqjnlGUO9S+gJmf9hG6Kz5Q=;
 b=ET3vSIJA3W1MA7FYjwei3dJy43cCTE6Rwfuhmkk9IpsuvbFXxBnQ/ZuheRkHezHHY8
 HhdktBMrNfk6iNmKNOJbOHL3fHUV4g2Q0ECi/M+Vg4Y5O3vvyoleeA+cUbxpjdNBDP6J
 nids1+huK8zqCME2/tHyEhR+/T7vAwRbR5MBeO/30uGKgCQ/SAbklBZ4hzs6BgNEcmDV
 9fSGquAc3gno9x48Ue534WMmUWG25LU0xjb26AOPiUu5LA8gloOAfef09Sht+zLyiux+
 fbneYSOmc/HLQRnONuBGVlDx/yOnTgCxQwOCnWiuhT9mts5pDgHhnKD5hUNXZ+mfWfWS
 3rNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xVxYqcfr2AzWBGfOQj7mUqjnlGUO9S+gJmf9hG6Kz5Q=;
 b=Y2kqkXMszo/6lscCfX65kM0pip5sjd/IMeOkkhGnHhMcWFTyDEVqks6EWfG+JJsSdB
 zOW6DE5kHLgluJRLouOLwfbh88AuTlUFrlWReTrJt/ZAbe2IQWndhVnHlz4uSTiUPE0O
 T7zMq8PcznE5DKiX0RSkzYiYmp02p2OYNcSqLUMZ5jpqeZgsztk5U1AoW0SbEhH1WTRu
 79Figk6q7GwtMps/HzOAa7/H9ob74wA5q+wHAKX052v6F3OBz+HpLDcsEEt6VuzVEpy1
 /yelLGwfE+kCpOSTItM3T1Mk6Jw24D9M6qswDcXAQWGv3RkmM60t3DLIT5zkXfNvnHjn
 hf6Q==
X-Gm-Message-State: AOAM5324tvO3hBGHMmy3bfJfNQn+QHe9gQaa5z6ecDYYpfhVeLbyAcOX
 Va209o7s13kAPN3aXA2uIBq7RI1fQHoDOykBkfawgS9ScFGRGw==
X-Google-Smtp-Source: ABdhPJx/K4OofuYYm6RMyOsiYGe0Mmqto5haEl6yE8P6meDUvHvclFHlp2LNWSEjZIAXV8SHbRwIRQGvKilvq6boMfw=
X-Received: by 2002:a05:6e02:d41:: with SMTP id
 h1mr5348737ilj.191.1627102874502; 
 Fri, 23 Jul 2021 22:01:14 -0700 (PDT)
MIME-Version: 1.0
From: Abhinav Dubey <abhinavbhardwaj510@gmail.com>
Date: Sat, 24 Jul 2021 10:31:03 +0530
Message-ID: <CAFn3W_mBWQBjnWseFRgRb+YADtEH9HwMNbynswDvhXjkjYRUQA@mail.gmail.com>
Subject: Mentee Task 1 Completed
To: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============6742304792497447223=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6742304792497447223==
Content-Type: multipart/alternative; boundary="000000000000d90dd005c7d76859"

--000000000000d90dd005c7d76859
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

--000000000000d90dd005c7d76859
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
" target=3D"_blank" style=3D"text-decoration-line:none"><span style=3D"font=
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
a href=3D"mailto:crope@iki.fi" target=3D"_blank" style=3D"text-decoration-l=
ine:none"><span style=3D"font-size:11pt;font-family:Arial;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;text=
-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">cr=
ope@iki.fi</span></a><span style=3D"font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt;<=
/span></p><span style=3D"color:rgb(80,0,80)"><br><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">BROADCOM BNXT_EN 50 GIGABIT ETHERNET DRIVER</span></=
p></span><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">Michael Chan &lt;=
</span><a href=3D"mailto:michael.chan@broadcom.com" target=3D"_blank" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:Ar=
ial;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;text-decoration-line:underline;vertical-align:baseline;whi=
te-space:pre-wrap">michael.chan@broadcom.com</span></a><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">&gt;</span></p><span style=3D"color:rgb(80,0,8=
0)"><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">DRM DRIVER FOR VIR=
TUALBOX VIRTUAL GPU</span></p></span><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">Hans de Goede &lt;</span><a href=3D"mailto:hdegoede@redhat.com" =
target=3D"_blank" style=3D"text-decoration-line:none"><span style=3D"font-s=
ize:11pt;font-family:Arial;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;text-decoration-line:underline;vert=
ical-align:baseline;white-space:pre-wrap">hdegoede@redhat.com</span></a><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">&gt;</span></p><span style=3D=
"color:rgb(80,0,80)"><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">I=
NTEL KEEM BAY DRM DRIVER</span></p></span><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">Anitha Chrisanthus &lt;</span><a href=3D"mailto:anitha.chri=
santhus@intel.com" target=3D"_blank" style=3D"text-decoration-line:none"><s=
pan style=3D"font-size:11pt;font-family:Arial;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;text-decoration-=
line:underline;vertical-align:baseline;white-space:pre-wrap">anitha.chrisan=
thus@intel.com</span></a><span style=3D"font-size:11pt;font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&=
gt;</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">Edmund Dea &=
lt;</span><a href=3D"mailto:edmund.j.dea@intel.com" target=3D"_blank" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:Ar=
ial;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;text-decoration-line:underline;vertical-align:baseline;whi=
te-space:pre-wrap">edmund.j.dea@intel.com</span></a><span style=3D"font-siz=
e:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">LICENSES and SPDX stuff</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">Thomas Gleixner &lt;</span><a href=3D"mailto:t=
glx@linutronix.de" target=3D"_blank" style=3D"text-decoration-line:none"><s=
pan style=3D"font-size:11pt;font-family:Arial;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;text-decoration-=
line:underline;vertical-align:baseline;white-space:pre-wrap">tglx@linutroni=
x.de</span></a><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt;</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">Greg Kroah-Hartman &lt=
;</span><a href=3D"mailto:gregkh@linuxfoundation.org" target=3D"_blank" sty=
le=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:=
Arial;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;text-decoration-line:underline;vertical-align:baseline;w=
hite-space:pre-wrap">gregkh@linuxfoundation.org</span></a><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">M68K ON APPLE MACINTOSH</span></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-alig=
n:baseline;white-space:pre-wrap">Joshua Thompson &lt;</span><a href=3D"mail=
to:funaho@jurai.org" target=3D"_blank" style=3D"text-decoration-line:none">=
<span style=3D"font-size:11pt;font-family:Arial;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;text-decoratio=
n-line:underline;vertical-align:baseline;white-space:pre-wrap">funaho@jurai=
.org</span></a><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt;</span>=
</p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">MEMBARRIER SUPPORT=
</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">Mathieu Desnoye=
rs &lt;</span><a href=3D"mailto:mathieu.desnoyers@efficios.com" target=3D"_=
blank" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;fo=
nt-family:Arial;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;text-decoration-line:underline;vertical-align:=
baseline;white-space:pre-wrap">mathieu.desnoyers@efficios.com</span></a><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">&gt;</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">Paul E. McKenney &lt;</span><a href=3D"m=
ailto:paulmck@kernel.org" target=3D"_blank" style=3D"text-decoration-line:n=
one"><span style=3D"font-size:11pt;font-family:Arial;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;text-deco=
ration-line:underline;vertical-align:baseline;white-space:pre-wrap">paulmck=
@kernel.org</span></a><span style=3D"font-size:11pt;font-family:Arial;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt;=
</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">MICROBLAZE =
ARCHITECTURE</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Mic=
hal Simek &lt;</span><a href=3D"mailto:monstr@monstr.eu" target=3D"_blank" =
style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-fami=
ly:Arial;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;text-decoration-line:underline;vertical-align:baselin=
e;white-space:pre-wrap">monstr@monstr.eu</span></a><span style=3D"font-size=
:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">RESET CONTROLLER FRAMEWORK</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">Philipp Zabel &lt;</span><a href=3D"mailto:p.z=
abel@pengutronix.de" target=3D"_blank" style=3D"text-decoration-line:none">=
<span style=3D"font-size:11pt;font-family:Arial;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;text-decoratio=
n-line:underline;vertical-align:baseline;white-space:pre-wrap">p.zabel@peng=
utronix.de</span></a><span style=3D"font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt;<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><br></p><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><b>Thanks &amp; Regards</b></p><font color=3D"#888888"><p style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt">Abhinav Dubey</p></font></=
div>

--000000000000d90dd005c7d76859--

--===============6742304792497447223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6742304792497447223==--
