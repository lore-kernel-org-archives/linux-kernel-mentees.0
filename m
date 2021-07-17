Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_KAM_HTML_FONT_INVALID,URIBL_RED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1873CC636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 19:11:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D3BA61103
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 19:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D3BA61103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57F734002B;
	Sat, 17 Jul 2021 19:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6npFVTIWKsS; Sat, 17 Jul 2021 19:11:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F0467400CE;
	Sat, 17 Jul 2021 19:11:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C25F1C001A;
	Sat, 17 Jul 2021 19:11:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5649EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 19:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CAB340570
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 19:11:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cWHEFXTqIUD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 19:11:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D68C940526
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 19:11:14 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id w1so11586092ilg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 12:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LCgscRGQcnFOJbKtKncTZnoZ9Al2S5epSXlApU0eZ84=;
 b=jvXRQlVPdEMricjY8mgm9ismV5u/5VMJ9PXjdf2fuaxrdslk1MozEJs+npaoILQD4T
 yFwI9+jlhOJG3SDOTRlqxFLmnblvVBCOQ6mejKn/dNjzkur0p0qcLfmvTZ3qM5+fhKPr
 rS1ZoAf0Dp4nKFt1ae8YdLIb1YzY2zFKhkKrgNoIqmsEU8YazriPvx9dDadTWpNwsyt0
 eAj01ddWV5/SPaDCty12Mv7vN+dfPLp83FAAXe9LUACFix/pugrW28Pdd7kksr2i43ss
 6B3MwgF7SvMaxAvbjEUY93PIRgHheE2F/4gjkdITudGwLdEYIBv+/dFBbFgoq3JjTK9k
 9kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LCgscRGQcnFOJbKtKncTZnoZ9Al2S5epSXlApU0eZ84=;
 b=giECdm1sxeGLEUGXwD4XAW9SAeUxWtepThnQ0PYrRAlmQ1dNqUVQJpACRmQS2/j9gF
 E0qN+OBbXKzfJkIYp21glW2iB16+qTPJpUmAepMSXynj2dNrX92okIXKsqpkCm65mFeD
 GntFKfrUvsyXpXNdYW78KbPq29LJ4bB7swPsBjad3XcIBhHZfcARAzelIBoikOyaNYND
 xHxca9z99oigIkXVBtcBjPXq79/xClcc6c2spx4f/0DaPjVaTnaDxCqa8+/w+3GJUy/m
 y81T0VXw0j7fLp78sDdCFr3cdhR2IAiryTFskC4jRoaI3PFoWShVFl6GWDKUVHlaMVzA
 GElg==
X-Gm-Message-State: AOAM533DJDu93jE32DbyPGRrPxP0UqB4afa7VRP1wrsKvYhCfnmeigJe
 FyDgjUxQo7mW5b5WnCBl2tKnh7cw7uq+QfPfXJCD9fnJ410=
X-Google-Smtp-Source: ABdhPJxb7Nv+i2G8aNjogafSnLef++hIFpPqs+p/bM6GlTWhlhdRTublmErxA9iC6vQzOZiU2lb+/C2j9kKDU8pLeLg=
X-Received: by 2002:a92:dc8e:: with SMTP id c14mr11068500iln.91.1626549073931; 
 Sat, 17 Jul 2021 12:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn3W_kg-Xk9z0qFJVVuUxzyPGevOe1w7nnammn3LvXFQq3g7Q@mail.gmail.com>
 <CAKXUXMxz2FNo9DV5Yf5ReczVUfYLcrkzLrOMTM4eZq1scWJa2w@mail.gmail.com>
In-Reply-To: <CAKXUXMxz2FNo9DV5Yf5ReczVUfYLcrkzLrOMTM4eZq1scWJa2w@mail.gmail.com>
From: Abhinav Dubey <abhinavbhardwaj510@gmail.com>
Date: Sun, 18 Jul 2021 00:41:02 +0530
Message-ID: <CAFn3W_n5awrYy1=UCVt+Ka52jzptnHRcrUEYtd3F7DjzCsUrCg@mail.gmail.com>
Subject: Re: Mining Maintainers Mentorship program - Mentee Selection tasks
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============5641472505064163151=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5641472505064163151==
Content-Type: multipart/alternative; boundary="000000000000c2f48a05c756772b"

--000000000000c2f48a05c756772b
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
Contact - abhinavbhardwaj510@gmail.com

--000000000000c2f48a05c756772b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span id=3D"m_298829808810169955gmail-doc=
s-internal-guid-adbe56f8-7fff-da54-ce10-bc96cce1ed5f"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">I have compiled the latest stable kernel versi=
on 5.13.2 with defconfig X86 architecture on ubuntu 20.04 vagrant VM.=C2=A0=
</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">The MAINTAI=
NERS file can be divided into 3 sections to understand what it is.</span></=
p><br><ol style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=
=3D"list-style-type:decimal;font-size:11pt;font-family:Arial;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">The first section is providing instructions for peop=
le who want to submit patches to the kernel. According to the instructions,=
 thorough testing of the patches should be done and all concerned people sh=
ould be CCed. Variable names and formatting should be according to the exis=
ting coding style. There shouldn=E2=80=99t be any ambiguity as to who owns =
the patch (employer or employee).</span></p></li></ol><br><ol style=3D"marg=
in-top:0px;margin-bottom:0px" start=3D"2"><li dir=3D"ltr" style=3D"list-sty=
le-type:decimal;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">The second section is a list of abbreviations used in the file. =
For example, M for Maintainer, R for Reviewer, S for Status of the code, B =
for the URI of the web page for bug-related things, F for file directory pa=
ttern, L for the Mailing list, T for Tree type and location.</span></p></li=
></ol><br><ol style=3D"margin-top:0px;margin-bottom:0px" start=3D"3"><li di=
r=3D"ltr" style=3D"list-style-type:decimal;font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">The third section is the actual list =
of Maintainers of the different parts of Kernel distinguished by their area=
s. This list should be in Alphabetical order.</span></p></li></ol><br><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre-wrap">There were no Reviewers mention=
ed for the sections given in the mail, Maintainers are mentioned below.=C2=
=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">ACPI FAN=
 DRIVER</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Zhang Ru=
i &lt;</span><a href=3D"mailto:rui.zhang@intel.com" style=3D"text-decoratio=
n-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:Ar=
ial;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;text-decoration-line:underline;vertical-align:baseline;whi=
te-space:pre-wrap">rui.zhang@intel.com</span></a><span style=3D"font-size:1=
1pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">AF9013 MEDIA DRIVER</span></p><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Antti Palosaari &lt;</span><a href=3D"mailto:crope@iki.=
fi" style=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"fo=
nt-size:11pt;font-family:Arial;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;text-decoration-line:underline;=
vertical-align:baseline;white-space:pre-wrap">crope@iki.fi</span></a><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">BROADCOM BNXT_EN 50 GIGABIT ETHERNET =
DRIVER</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Michael C=
han &lt;</span><a href=3D"mailto:michael.chan@broadcom.com" style=3D"text-d=
ecoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-f=
amily:Arial;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;text-decoration-line:underline;vertical-align:base=
line;white-space:pre-wrap">michael.chan@broadcom.com</span></a><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap">DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">Hans de Goede &lt;</sp=
an><a href=3D"mailto:hdegoede@redhat.com" style=3D"text-decoration-line:non=
e" target=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;text-decoration-line:underline;vertical-align:baseline;white-space:p=
re-wrap">hdegoede@redhat.com</span></a><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:A=
rial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-=
wrap">INTEL KEEM BAY DRM DRIVER</span></p><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">Anitha Chrisanthus &lt;</span><a href=3D"mailto:anitha.chri=
santhus@intel.com" style=3D"text-decoration-line:none" target=3D"_blank"><s=
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
lt;</span><a href=3D"mailto:edmund.j.dea@intel.com" style=3D"text-decoratio=
n-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:Ar=
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
glx@linutronix.de" style=3D"text-decoration-line:none" target=3D"_blank"><s=
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
;</span><a href=3D"mailto:gregkh@linuxfoundation.org" style=3D"text-decorat=
ion-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:=
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
to:funaho@jurai.org" style=3D"text-decoration-line:none" target=3D"_blank">=
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
rs &lt;</span><a href=3D"mailto:mathieu.desnoyers@efficios.com" style=3D"te=
xt-decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;fo=
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
ailto:paulmck@kernel.org" style=3D"text-decoration-line:none" target=3D"_bl=
ank"><span style=3D"font-size:11pt;font-family:Arial;background-color:trans=
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
hal Simek &lt;</span><a href=3D"mailto:monstr@monstr.eu" style=3D"text-deco=
ration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-fami=
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
abel@pengutronix.de" style=3D"text-decoration-line:none" target=3D"_blank">=
<span style=3D"font-size:11pt;font-family:Arial;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;text-decoratio=
n-line:underline;vertical-align:baseline;white-space:pre-wrap">p.zabel@peng=
utronix.de</span></a><span style=3D"font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&gt;<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><br></p></span><br></div><div><font face=3D"comic sans ms, sans-s=
erif"><b>Thanks &amp; Regards</b></font></div><div><font face=3D"comic sans=
 ms, sans-serif">Abhinav Dubey</font></div><div><font face=3D"comic sans ms=
, sans-serif">Contact - <a href=3D"mailto:abhinavbhardwaj510@gmail.com" tar=
get=3D"_blank" style=3D"">abhinavbhardwaj510@gmail.com</a></font></div><div=
><br></div>
</div>

--000000000000c2f48a05c756772b--

--===============5641472505064163151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5641472505064163151==--
