Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=3.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,MIME_HTML_MOSTLY,SPF_HELO_NONE,SPF_PASS,
	T_KAM_HTML_FONT_INVALID,URIBL_RED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42339C636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 08:36:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A5B16023B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 08:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A5B16023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=students.iitmandi.ac.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3971A42448;
	Sat, 17 Jul 2021 08:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtPXVNuwI5yj; Sat, 17 Jul 2021 08:36:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1B79142441;
	Sat, 17 Jul 2021 08:36:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF771C0010;
	Sat, 17 Jul 2021 08:36:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFB25C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 08:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82535400CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 08:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=students-iitmandi-ac-in.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97IS_Krjicvm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 08:36:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BF28400C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 08:36:18 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id g19so18786424ybe.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 01:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=students-iitmandi-ac-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bNGEKyt4iz3cnMkf8SrbogcKdYyanoGXMqyTPDbDUok=;
 b=NpsovAOlfvGcG7Yd2N72FkUmdC7eN40jo2fazV+/1dIPva92cmCevQFG5G7RktY28l
 iMcEwPse5QR1e+T4TMBKm4bl2WaEOGjhqnfJ/vj0/bnSsfz6WLzFQbU1C6EGo1ybpXN2
 Dn4NIGrgGqRefzdhkADq0xn46eTDL3r5RUlb2r1tl7EhDCWR3nrs5TYny6UqvYtFN7ag
 NhWTgMCRksxP7Rw32PohebvCWAVWn0p3bWZ4FmxOClTYRJc/dhrvfhMtnhhMdkTUwxd9
 nBOe01mnaRmYFD5Zr3Pz8mQiGHc5jNBNMxG6MFi7iONjnD+mFCW5yyv90ZgnS/ClUxw4
 0YHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bNGEKyt4iz3cnMkf8SrbogcKdYyanoGXMqyTPDbDUok=;
 b=Py22Q7uaMrLsTwUMAqb84KewlhGs45eH2GJc/DSoNZSsY4dWiYglI/NtOnOcCxlJWp
 HMNt48+/hRe+MXhEr0iVgZMp41pvcWO0gsEEn05WiI1MUjoRTI1XGYx/uIA60TvG5K2i
 nzXhgQ74siPPWgs8R2rSQ8S4dntiwC/KqwsFK8IQ/LFYaQeyZ42SXwj7kxdK9HWXoNnA
 FMwwtmdHzYJfDFb7p61EzPZYyMtgd5MlRlDm/KzPRR+Ndv8a6CgXRDRIHqDQONIYx3Yr
 8RNa3xF/SB6A6sOhSDbSgGIVTRJR0FOBVpjRilL2mfbwK0hhmFDuj6jKIvQLo429kMqa
 jvEw==
X-Gm-Message-State: AOAM5334m50H4qDrlu5bHn4Kae7xda2Z1IleKg9cMYaEGhHQKMr15S2M
 6mp8kASq/3ZWcJ0AgNC+XFVAdNzRPTyyg/kaglTr+w==
X-Google-Smtp-Source: ABdhPJwPm+giUnvEuXbUXLFqucPgrwHmWYyfgXn6SKBx774H+8EPbrJl4PfaYuo0EOkodMiFpbcOw3B4fqNxY0pUy/0=
X-Received: by 2002:a25:3486:: with SMTP id
 b128mr19648784yba.523.1626510976653; 
 Sat, 17 Jul 2021 01:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQwXtjwRjYQuRot5DzSzz=s_j_tCwv+Mt8=u4zmeGqNKWOphQ@mail.gmail.com>
 <CAKXUXMwzoBHCeyusfE_sNF_TrcHRkE774zJMk3pR15-AT_WwMg@mail.gmail.com>
In-Reply-To: <CAKXUXMwzoBHCeyusfE_sNF_TrcHRkE774zJMk3pR15-AT_WwMg@mail.gmail.com>
From: Ashutosh Sharma <b18010@students.iitmandi.ac.in>
Date: Sat, 17 Jul 2021 14:06:05 +0530
Message-ID: <CAEQwXtiArkeyH6rM5z0rcvz=nnN-sL2PPD2wBPMSD7yWxO8z3Q@mail.gmail.com>
Subject: Re: Regarding LFX Mentorship
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000fcdf9905c74d9841"
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--000000000000fcdf9905c74d9841
Content-Type: multipart/alternative; boundary="000000000000fcdf9605c74d983f"

--000000000000fcdf9605c74d983f
Content-Type: text/plain; charset="UTF-8"

The Maintainers file contains the best practices to follow after making a
patch to the repository. It talks about testing that when we make changes
we should make these changes available to the community so that they can
provide their valuable feedback. The Maintainers file also talks about the
whom should we contact regarding a particular driver or security concern
and what security concerns should be made publicly available and what
concerns should be reported to the security team.

The maintainers list contains the list of the drivers and their respective
maintainers, reviewers, mailing lists and status etc.

Maintainers and Reviewers of drivers in the mentee tasks:


   1.

   ACPI PMIC DRIVERS

Maintainers:

   1.

   Rafael J. Wysock" <rjw@rjwysocki.net>
   2.

   Len Brown <lenb@kernel.org>

Reviewers:

   1.

   Andy Shevchenko <andy@kernel.org>
   2.

   Mika Westerberg <mika.westerberg@linux.intel.com>


      2. ADF7242 IEEE 802.15.4 RADIO DRIVER

Maintainer: Michael Hennerich <michael.hennerich@analog.com>

      3. AFFS FILE SYSTEM

Maintainer: David Sterba <dsterba@suse.com>

      4. DOCUMENTATION REPORTING ISSUES

            Maintainer: Thorsten Leemhuis <linux@leemhuis.info>

      5. MEDIA INPUT INFRASTRUCTURE (V4L/DVB)

            Maintainer: Mauro Carvalho Chehab <mchehab@kernel.org>

      6. P54 WIRELESS DRIVER

            Maintainer: Christian Lamparter <chunkeey@googlemail.com>

      7. SCTP PROTOCOL

            Maintainers:

   1.

   Vlad Yasevich <vyasevich@gmail.com>
   2.

   Neil Horman <nhorman@tuxdriver.com>
   3.

   Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>


       8. SOUND - DMAENGINE HELPERS

              Maintainer: Lars-Peter Clausen <lars@metafoo.de>

       9.. USB "USBNET" DRIVER FRAMEWORK

              Maintainer: Oliver Neukum <oneukum@suse.com>

       10. VIRTIO FILE SYSTEM

            Maintainers:

   1.

   Vivek Goyal <vgoyal@redhat.com>
   2.

   Stefan Hajnoczi <stefanha@redhat.com>
   3.

   Miklos Szeredi <miklos@szeredi.hu>


I have attached a pdf file for your reference as well.
Thanks and Regards
Ashutosh Sharma

On Sat, Jul 17, 2021 at 1:25 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> On Sat, Jul 17, 2021 at 9:28 AM Ashutosh Sharma
> <b18010@students.iitmandi.ac.in> wrote:
> >
> > Dear Sir,
> >
> > I am Ashutosh Sharma currently a senior studying Computer Science and
> Engineering at Indian Institute of Technology Mandi, India. Sir, I got to
> know about the Linux Kernel: Mining for Maintainers project from the LFX
> Mentorship Program website. I am really excited about the project. I have
> applied for the project on the website. Now, I am writing this email to you
> regarding the mentee tasks.
> > Sir, I have been an intern at Amazon where I worked on AWS,  Java and
> React. Other than that I have also worked as a student developer in Google
> Summer of Code 2020 under The Mifos Initiative organisation. Currently, I
> am looking for more opportunities to challenge myself and learn new skills.
> > Hoping for a positive response from your side.
> >
>
> Please always CC linux-kernel-mentees@lists.linuxfoundation.org.
>
> Thanks for your interest.
>
> For the mentee selection, please work on the following exercise:
>
> First, download the kernel git repository and compile the kernel with
> the x86-defconfig build configuration.
>
> There is a file called MAINTAINERS in the root directory of the git
> repository. Read the introduction at the beginning of the MAINTAINERS
> file and understand the content in the file and its organisation.
>
> Explain in your words: What is stored in the MAINTAINERS file?
>
> Now, search for specific MAINTAINER entries; Please answer: Who are
> the maintainers and reviewers of the following sections?
>
> ACPI PMIC DRIVERS
> ADF7242 IEEE 802.15.4 RADIO DRIVER
> AFFS FILE SYSTEM
> DOCUMENTATION REPORTING ISSUES
> MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
> P54 WIRELESS DRIVER
> SCTP PROTOCOL
> SOUND - DMAENGINE HELPERS
> USB "USBNET" DRIVER FRAMEWORK
> VIRTIO FILE SYSTEM
>
>
> Please let me know about your answers and always send your responses
> to the linux-kernel-mentees mailing list.
>
> After that first exercise, exercises 2 and 3 will follow.
>
>
> Lukas
>

--000000000000fcdf9605c74d983f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><span id=3D"gmail-docs-internal-guid-43926c2f-7ff=
f-7723-d990-15d8075085b9"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
The Maintainers file contains the best practices to follow after making a p=
atch to the repository. It talks about testing that when we make changes we=
 should make these changes available to the community so that they can prov=
ide their valuable feedback. The Maintainers file also talks about the whom=
 should we contact regarding a particular driver or security concern and wh=
at security concerns should be made publicly available and what concerns sh=
ould be reported to the security team.=C2=A0</span></p><br><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-alig=
n:baseline;white-space:pre-wrap">The maintainers list contains the list of =
the drivers and their respective maintainers, reviewers, mailing lists and =
status etc.=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:A=
rial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-=
wrap">Maintainers and Reviewers of drivers in the mentee tasks:</span></p><=
br><ol style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"=
list-style-type:decimal;font-size:11pt;font-family:Arial;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">ACPI PMIC DRIVERS</span></p></li></ol><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-left:72pt;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">Maintainers:</span><span styl=
e=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap"><span class=3D"gmail-Apple-tab-span"=
 style=3D"white-space:pre">	</span></span></p><ol style=3D"margin-top:0px;m=
argin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:lower-alpha;font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre;margin-left:72pt"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">Rafael J. Wysock&quot; &lt;<a href=3D"mailto:rjw@rjwysocki.net">rjw@rjwy=
socki.net</a>&gt;=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:lower-alpha;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre;margin-left:72pt"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">Len Brown &lt;<a href=3D"mailto:lenb@kernel.org">le=
nb@kernel.org</a>&gt;=C2=A0</span></p></li></ol><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-left:72pt;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">Reviewers:</span></p><ol style=3D"ma=
rgin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:lo=
wer-alpha;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre;margin-left:72pt"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">Andy Shevchenko &lt;<a href=3D"mailto:andy@kernel.org">and=
y@kernel.org</a>&gt;=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:lower-alpha;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre;margin-left:72pt"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"p=
resentation"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap">Mika Westerberg &lt;</span><a href=3D"mailto:mik=
a.westerberg@linux.intel.com" style=3D"text-decoration-line:none"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;text-decoration-line:underline;vertical-a=
lign:baseline;white-space:pre-wrap">mika.westerberg@linux.intel.com</span><=
/a><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">&gt;</span></p></li></ol><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02. </span><span sty=
le=3D"font-size:11pt;font-family:Arial;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">ADF724=
2 IEEE 802.15.4 RADIO DRIVER</span></p><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap"><span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre"=
>	</span></span><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Maintainer=
: Michael Hennerich &lt;</span><a href=3D"mailto:michael.hennerich@analog.c=
om" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-=
family:Arial;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;text-decoration-line:underline;vertical-align:bas=
eline;white-space:pre-wrap">michael.hennerich@analog.com</span></a><span st=
yle=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03. </=
span><span style=3D"font-size:11pt;font-family:Arial;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">AFFS FILE SYSTEM</span></p><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap"><span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</=
span></span><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">Maintainer: Da=
vid Sterba &lt;<a href=3D"mailto:dsterba@suse.com">dsterba@suse.com</a>&gt;=
</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A04. </span><span style=3D"font-size:11pt;font-fam=
ily:Arial;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre-wrap">DOCUMENTATION REPORTING ISSUES</spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Maintainer: Thorsten =
Leemhuis &lt;<a href=3D"mailto:linux@leemhuis.info">linux@leemhuis.info</a>=
&gt;</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A05. MEDIA INPUT IN=
FRASTRUCTURE (V4L/DVB)</span></p><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
-wrap">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0Maintainer: Mauro Carvalho Chehab &lt;</span><a href=3D"mailto:mcheha=
b@kernel.org" style=3D"text-decoration-line:none"><span style=3D"font-size:=
11pt;font-family:Arial;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;text-decoration-line:underline;vertical=
-align:baseline;white-space:pre-wrap">mchehab@kernel.org</span></a><span st=
yle=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A06. P54 WIRELESS DRIVER</span></p><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Maintainer: Christian Lamparter &lt;</span><a=
 href=3D"mailto:chunkeey@googlemail.com" style=3D"text-decoration-line:none=
"><span style=3D"font-size:11pt;font-family:Arial;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;text-decorat=
ion-line:underline;vertical-align:baseline;white-space:pre-wrap">chunkeey@g=
ooglemail.com</span></a><span style=3D"font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&g=
t;</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><span style=3D"font-size:11pt;font-family=
:Arial;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre-wrap">7. SCTP PROTOCOL</span></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Maintainers:</span></p><ol style=3D"mar=
gin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:low=
er-alpha;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre;margin-left:36pt"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">Vlad Yasevich &lt;</span><a href=3D"mailto:vyasevich@gmail.=
com" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;text-decoration-line:underline;vertical-align:baseline;white-space=
:pre-wrap">vyasevich@gmail.com</span></a><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">&gt;</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:lower-alpha;font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre;margin-left:36pt"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">Neil Horman &lt=
;<a href=3D"mailto:nhorman@tuxdriver.com">nhorman@tuxdriver.com</a>&gt;=C2=
=A0</span></p></li><li dir=3D"ltr" style=3D"list-style-type:lower-alpha;fon=
t-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre;margin-left:36pt"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">Marcelo Ricardo Leitner &lt;<a href=3D"mailto:marcelo.leitner@gmail.com=
">marcelo.leitner@gmail.com</a>&gt;</span></p></li></ol><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A08. </span><span style=3D"font-size:11pt;font-family:Arial;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">SOUND - DMAENGINE HELPERS</span></p><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><s=
pan style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre-wrap">Maintainer: Lars-Peter Claus=
en &lt;</span><a href=3D"mailto:lars@metafoo.de" style=3D"text-decoration-l=
ine:none"><span style=3D"font-size:11pt;font-family:Arial;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;text=
-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">la=
rs@metafoo.de</span></a><span style=3D"font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">&g=
t;</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A09.. USB &quot;USBNET&quot; DRIVER FRAMEWOR=
K</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Mai=
ntainer: Oliver Neukum &lt;</span><a href=3D"mailto:oneukum@suse.com" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:Ar=
ial;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;text-decoration-line:underline;vertical-align:baseline;whi=
te-space:pre-wrap">oneukum@suse.com</span></a><span style=3D"font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">&gt;</span></p><br><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010. </span><span sty=
le=3D"font-size:11pt;font-family:Arial;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">VIRTIO=
 FILE SYSTEM</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Mainta=
iners:</span></p><ol style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"=
ltr" style=3D"list-style-type:lower-alpha;font-size:11pt;font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre;margi=
n-left:36pt"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre-wrap">Vivek Goyal &lt;<a href=3D=
"mailto:vgoyal@redhat.com">vgoyal@redhat.com</a>&gt;=C2=A0</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:lower-alpha;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre;margin-left:36pt"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">Stefan Hajnoczi =
&lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>&gt;=C2=
=A0</span></p></li><li dir=3D"ltr" style=3D"list-style-type:lower-alpha;fon=
t-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre;margin-left:36pt"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">Miklos Szeredi &lt;<a href=3D"mailto:miklos@szeredi.hu">miklos@szeredi.=
hu</a>&gt;</span></p></li></ol><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-w=
rap">=C2=A0</span></p>I have attached a pdf file for your reference as well=
.</span></div><div><span>Thanks and Regards=C2=A0</span></div><div><span>As=
hutosh Sharma</span></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sat, Jul 17, 2021 at 1:25 PM Lukas Bulwahn &lt=
;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, =
Jul 17, 2021 at 9:28 AM Ashutosh Sharma<br>
&lt;<a href=3D"mailto:b18010@students.iitmandi.ac.in" target=3D"_blank">b18=
010@students.iitmandi.ac.in</a>&gt; wrote:<br>
&gt;<br>
&gt; Dear Sir,<br>
&gt;<br>
&gt; I am Ashutosh Sharma currently a senior studying Computer Science and =
Engineering at Indian Institute of Technology Mandi, India. Sir, I got to k=
now about the Linux Kernel: Mining for Maintainers project from the LFX Men=
torship Program website. I am really excited about the project. I have appl=
ied for the project on the website. Now, I am writing this email to you reg=
arding the mentee tasks.<br>
&gt; Sir, I have been an intern at Amazon where I worked on AWS,=C2=A0 Java=
 and React. Other than that I have also worked as a student developer in Go=
ogle Summer of Code 2020 under The Mifos Initiative organisation. Currently=
, I am looking for more opportunities to challenge myself and learn new ski=
lls.<br>
&gt; Hoping for a positive response from your side.<br>
&gt;<br>
<br>
Please always CC <a href=3D"mailto:linux-kernel-mentees@lists.linuxfoundati=
on.org" target=3D"_blank">linux-kernel-mentees@lists.linuxfoundation.org</a=
>.<br>
<br>
Thanks for your interest.<br>
<br>
For the mentee selection, please work on the following exercise:<br>
<br>
First, download the kernel git repository and compile the kernel with<br>
the x86-defconfig build configuration.<br>
<br>
There is a file called MAINTAINERS in the root directory of the git<br>
repository. Read the introduction at the beginning of the MAINTAINERS<br>
file and understand the content in the file and its organisation.<br>
<br>
Explain in your words: What is stored in the MAINTAINERS file?<br>
<br>
Now, search for specific MAINTAINER entries; Please answer: Who are<br>
the maintainers and reviewers of the following sections?<br>
<br>
ACPI PMIC DRIVERS<br>
ADF7242 IEEE 802.15.4 RADIO DRIVER<br>
AFFS FILE SYSTEM<br>
DOCUMENTATION REPORTING ISSUES<br>
MEDIA INPUT INFRASTRUCTURE (V4L/DVB)<br>
P54 WIRELESS DRIVER<br>
SCTP PROTOCOL<br>
SOUND - DMAENGINE HELPERS<br>
USB &quot;USBNET&quot; DRIVER FRAMEWORK<br>
VIRTIO FILE SYSTEM<br>
<br>
<br>
Please let me know about your answers and always send your responses<br>
to the linux-kernel-mentees mailing list.<br>
<br>
After that first exercise, exercises 2 and 3 will follow.<br>
<br>
<br>
Lukas<br>
</blockquote></div>

--000000000000fcdf9605c74d983f--
--000000000000fcdf9905c74d9841
Content-Type: application/pdf; name="ashutosh_mentee_task_1.pdf"
Content-Disposition: attachment; filename="ashutosh_mentee_task_1.pdf"
Content-Transfer-Encoding: base64
Content-ID: <f_kr7ikg4k0>
X-Attachment-Id: f_kr7ikg4k0

JVBERi0xLjQKJdPr6eEKMSAwIG9iago8PC9UaXRsZSAoVW50aXRsZWQgZG9jdW1lbnQpCi9Qcm9k
dWNlciAoU2tpYS9QREYgbTkzIEdvb2dsZSBEb2NzIFJlbmRlcmVyKT4+CmVuZG9iagozIDAgb2Jq
Cjw8L2NhIDEKL0JNIC9Ob3JtYWw+PgplbmRvYmoKNiAwIG9iago8PC9DQSAxCi9jYSAxCi9MQyAw
Ci9MSiAwCi9MVyAxLjMzMzMzMzM3Ci9NTCAxMAovU0EgdHJ1ZQovQk0gL05vcm1hbD4+CmVuZG9i
ago3IDAgb2JqCjw8L1R5cGUgL0Fubm90Ci9TdWJ0eXBlIC9MaW5rCi9GIDQKL0JvcmRlciBbMCAw
IDBdCi9SZWN0IFsyNzIuMzQ5MjQgMzgzLjM2NjA5IDQzMy43OTE2MyAzOTYuMDE1MDFdCi9BIDw8
L1R5cGUgL0FjdGlvbgovUyAvVVJJCi9VUkkgKG1haWx0bzptaWthLndlc3RlcmJlcmdAbGludXgu
aW50ZWwuY29tKT4+Pj4KZW5kb2JqCjggMCBvYmoKPDwvVHlwZSAvQW5ub3QKL1N1YnR5cGUgL0xp
bmsKL0YgNAovQm9yZGVyIFswIDAgMF0KL1JlY3QgWzI2NS45Mzc1NiAzMzkuNzI3MjkgNDIzLjEz
NDQzIDM1Mi4zNzYyMl0KL0EgPDwvVHlwZSAvQWN0aW9uCi9TIC9VUkkKL1VSSSAobWFpbHRvOm1p
Y2hhZWwuaGVubmVyaWNoQGFuYWxvZy5jb20pPj4+PgplbmRvYmoKOSAwIG9iago8PC9UeXBlIC9B
bm5vdAovU3VidHlwZSAvTGluawovRiA0Ci9Cb3JkZXIgWzAgMCAwXQovUmVjdCBbMjk1LjMxMSAy
MDguODEwOTEgNDAwLjU2ODczIDIyMS40NTk4NF0KL0EgPDwvVHlwZSAvQWN0aW9uCi9TIC9VUkkK
L1VSSSAobWFpbHRvOm1jaGVoYWJAa2VybmVsLm9yZyk+Pj4+CmVuZG9iagoxMCAwIG9iago8PC9U
eXBlIC9Bbm5vdAovU3VidHlwZSAvTGluawovRiA0Ci9Cb3JkZXIgWzAgMCAwXQovUmVjdCBbMjcy
LjA3NjA1IDE2NS4xNzIxMTkgNDA3LjI3MjQzIDE3Ny44MjEwNF0KL0EgPDwvVHlwZSAvQWN0aW9u
Ci9TIC9VUkkKL1VSSSAobWFpbHRvOmNodW5rZWV5QGdvb2dsZW1haWwuY29tKT4+Pj4KZW5kb2Jq
CjExIDAgb2JqCjw8L1R5cGUgL0Fubm90Ci9TdWJ0eXBlIC9MaW5rCi9GIDQKL0JvcmRlciBbMCAw
IDBdCi9SZWN0IFsyMjIuMzEzMzkgMTA2Ljk4NzA2MSAzMzEuODIxOTkgMTE5LjYzNTk4Nl0KL0Eg
PDwvVHlwZSAvQWN0aW9uCi9TIC9VUkkKL1VSSSAobWFpbHRvOnZ5YXNldmljaEBnbWFpbC5jb20p
Pj4+PgplbmRvYmoKMTIgMCBvYmoKPDwvRmlsdGVyIC9GbGF0ZURlY29kZQovTGVuZ3RoIDMxNjQ+
PiBzdHJlYW0KeJztXdtuHDcSfZ+v6OcAoXm/AIsAkmz5ObsC8gGbxMAiDrDe/we2OBdNj6TDruJQ
c7HHsiy5e5rFS/HwsKpYbSZNXz8b+icVO/376+q/q3olGru+8O2P1W8/TX/TVZXC+rO7n/RRM9Wv
f36eNr98+7L68NlNX/63LiGbOBkdYi3iz9Wv9MUpOdnJ26B0SsE0RXitko3FOHrQJq28jz5NJqoc
g3V+J/V16TGrZKLjl24cFWpCsIZRfDBWuSCqe1TarztrufAQVCmuLPa984kk6BI4hZaioqPqLJZq
NVU1puQYpUbvlE3G52ap1ivvTA6+drM39J/sqHmvimfrTlqr8Lb0+6fVh0c/WT89/bkye0VXKQcT
og3T01cq9mdr6nCE6Kan36d/aG29Jr3V2t/Tz0zfib7t/pp29Hf7u6+fDfSt6++/TE//WX16eqtD
SlBZ25LKgAq6KqxWzGwqV3+v3+uKpXUljLaKOtCtK7F5yu+a9WnzSePrz/WnI1XOheLy84fXfWA2
D4S7rbjazthoo3FemWDpz8tGkiJ6Feuf9LKtPpVsEo36pq2m6k2imuddYzcNyqoEG62Zted+e8ME
Y3Ta191ncGPbWk/wYkoK6fmG05tOoz7TOSU9K8sjIQ/rG1TbEI0v7vlGMOCJkID0gTJg00PYCs9Z
Rx9mNzYDmpSz2diw3Fe+oBuotv4R3RAPlAe1DRa1+5yjIe5bXKlxuu6DWHdQp6Pa4vY5qXrOR0OX
mXCoCfNKRe3fHr7o42JJB/1hnWxU55JhlbZaS2DaBElHhCiHTKIWwRJOTjhB8OREN/Bcu9suPSpk
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
4zP2PMl9Js/kpcTogvfL9epYvTGtwNRth8xEqmjl4xi5O1gFNLHI/VVyo0XjVAzslgYLhmJwH8sJ
Iux9fQ+WP+gUm+9MDpDqYNGa79IsgItDtZ/TM+yRQ/HV+qEFMYlEeG3YIbU33nZyxxy0G8njGMWB
nXh2yhOmy18ABimPmMv2NFCeDUfu2hJHdYx0/5Wkks+sk7tYO4eFKQ/svR8+JrjDDVaPcdNGkpE7
ts1ZS1HR2Xhm0lpAx3WQVsT0MDGWm+efY4uzo75LjHPZHUxH7gGT25WuMiyJZqMyqbKsGwk6r/NM
vhh3pB4Zluxt4NsKsVlLnhAW57+TU7Zx/rPTnCKIKsWsE+PAijiB9rDjVR2WSvnZJxRxgymFOHin
44jsKdLHXUJMUX1pty2chJ9NMhV9/bjx+bxkShy9JY9D6LEC7YhZMDpabRjSodEO262wlxCZ87oc
vviZVorHGJKioaP/3IjLubPKxPqCseg1O+QhMfbdxx6kZh2AR2S64zXrCzufN9yVD/tZdBBpIE8J
Nu60/kXGamutPG1SGOe5UIMRi7imru5hPD8I6XA+Km8L5whtm3TkqOoLbtmHdFhAduT5cBaQQa+Y
PH/5yBMpHQEWHc6AYZlv8EI6MIJkYAMbYZbyFMUgAOIiMp9SK1wJ5f0wRxrkmTTx1RD5Lx1iIcVi
CudzJEzE4yx+gZH49ExPUmPxgnvU64+P9cHJY7rk724atz2QI+p16RvGFbHB573GifPShEbQGnjf
Nm+ceO/6hoFxJ47Mr7BdoTEawutip29/rH77afp7IS8QZ7vy4XOsgF9trmscnkxQLjgXqO5fVzX/
xKvLf63+tXgsXCI65L2M7Dx1Z6miY55fAEIPIl8kQktaX/VVRvGkcjTTSaib1WV3GYg+8Df1drUu
PtGFKtq/cRmJnlspJKK1rgtuXi+tdXzdXuj+8kbor6v/A7xlXqwKZW5kc3RyZWFtCmVuZG9iagox
NCAwIG9iago8PC9UeXBlIC9Bbm5vdAovU3VidHlwZSAvTGluawovRiA0Ci9Cb3JkZXIgWzAgMCAw
XQovUmVjdCBbMjc2LjM1OTE2IDY3OC4yNTg1NCAzNjAuMjI4MjcgNjkwLjkwNzQ3XQovQSA8PC9U
eXBlIC9BY3Rpb24KL1MgL1VSSQovVVJJIChtYWlsdG86bGFyc0BtZXRhZm9vLmRlKT4+Pj4KZW5k
b2JqCjE1IDAgb2JqCjw8L1R5cGUgL0Fubm90Ci9TdWJ0eXBlIC9MaW5rCi9GIDQKL0JvcmRlciBb
MCAwIDBdCi9SZWN0IFsyNTQuMzQ3OTMgNjM0LjYxOTc1IDM1Ny43NjQ2OCA2NDcuMjY4NjhdCi9B
IDw8L1R5cGUgL0FjdGlvbgovUyAvVVJJCi9VUkkgKG1haWx0bzpvbmV1a3VtQHN1c2UuY29tKT4+
Pj4KZW5kb2JqCjE2IDAgb2JqCjw8L0ZpbHRlciAvRmxhdGVEZWNvZGUKL0xlbmd0aCAxMDgyPj4g
c3RyZWFtCnic7VrbitxGEH3XV+g5kN66dHVXQzB4r89OBvIBSWwI3kCc/4e0pJnVmN0jqQd57Yfd
gZlBNV33y1Fpuaf6+pnrWy7S//HY/dsNVxLLeOHLX93vP/X/1Ksh2/jb02f9KffD69eHfvry5VN3
9aD9p/9GDs6pZ7I0sPjYfaivLZyz9J6CxSTJFkXEGHJx91IPiuQglFPsOQVPJhpPUp9xZ+JARUzK
qgWWA1WuaQvXrMFFfVlnk1BiKSXXgxxzKEZJ/Tn7y1x1FHJ96K7urfIPafjL/eFjx6coiwcjde1D
rN6rWpf+8NgNJA2Ss8aqzuHP/hcivn7XH/7uPLAxU/Z6/kjgkXB36AKrVk5n79Xm5xer/Ys6zZFc
VUrTKLuEnC1RlCelVEYCc4hVwxq1meIThYJ5lBx1pjCiSEYU0pESA2Uu2WYxTEeCO6Vovn4CC9GJ
F0tNas+ZZmYSgf3iyDHYyPfIZXIDVF5ghuRj86+beck9SEnVZrcYdH46pfdq89hScE89ZD23YdRj
BHbHKVCVkyWOZTbCGJywDMKxo4zoSLiBGuFboBXOHpQK0A4o3KaA56DiLLZe0TDbsOHQ682uwh5J
KKPjPYgg9hVUC/gK24GSBDfS+6fxQkMxBR0niY+z5esra4NFstSqq5Nlvfgu8FFrPslkcVXVs1PJ
M8Vw5bdnFKzjAk6YIBmIcEQALwjPyy2hBpXG4NRYTl/WQqgeg1JUWQ+hPOGSlxq3UmA3ss2NuwEp
3bT6CRJgVSygGASJxFpHMk0nrKahJD9L3T2lX4Ah9JRWxSQJ27rCl4AuiAgwHCr7wQ6scQHGLyiM
UOICsIQaH1Fivb1RlZQB5Ca3CDTzkmYxd0s1OtwIKKvoG7j6ruAK30zhMQkNKa2IoRn54I6ChSBC
vHtZXYyIYGK9CsKJWu+xq3brFYDHfHuqvYL3FtASwFf7gVaMb5Bo6Fu6GPfUG00utqG1LeOe873U
zrAHNTXWZb/utzma92nrAwDOajjdn6aYcpFCG/AI5gU7avvch0LgPXH7cgbv2W4QAZ6AzoKQg5YS
2j1oJpatCR09eNKhtbyBhAuWILcLsaioOxQeNtgbY5E33MZBN8zdY1FG2YIGT83AmJIQfwMYg0Yh
rne4jsXT5QYoBTMJwbc1rFKHgtUOyOv+eI90/fZGLEAGlPY4fHCTgR6L4EURKvjdYcZLMGoJHAjn
0PT0aFP92ivULxo27YtWuBbD8WxeaeJHHTjJb5vnCkoOmE23oPBQD2xvEkjy94xSewG/9ZXWvqIS
iLzwrn0FIZQd2wrGf6gm0JiHQwr7GtjXjtFhYTejwgvSeL/m8SMG44KtxI8YDNwhUBeCy5XzRrD5
31a+foy+ZQt29ZCGLiLD4WHdX0qi0j926vH8wufut/XNcou8KGHqJVVIKmypenGQyuOP4/nlSfaH
7n/f3sV1CmVuZHN0cmVhbQplbmRvYmoKMiAwIG9iago8PC9UeXBlIC9QYWdlCi9SZXNvdXJjZXMg
PDwvUHJvY1NldCBbL1BERiAvVGV4dCAvSW1hZ2VCIC9JbWFnZUMgL0ltYWdlSV0KL0V4dEdTdGF0
ZSA8PC9HMyAzIDAgUgovRzYgNiAwIFI+PgovRm9udCA8PC9GNCA0IDAgUgovRjUgNSAwIFI+Pj4+
Ci9NZWRpYUJveCBbMCAwIDYxMiA3OTJdCi9Bbm5vdHMgWzcgMCBSIDggMCBSIDkgMCBSIDEwIDAg
UiAxMSAwIFJdCi9Db250ZW50cyAxMiAwIFIKL1N0cnVjdFBhcmVudHMgMAovUGFyZW50IDE3IDAg
Uj4+CmVuZG9iagoxMyAwIG9iago8PC9UeXBlIC9QYWdlCi9SZXNvdXJjZXMgPDwvUHJvY1NldCBb
L1BERiAvVGV4dCAvSW1hZ2VCIC9JbWFnZUMgL0ltYWdlSV0KL0V4dEdTdGF0ZSA8PC9HMyAzIDAg
UgovRzYgNiAwIFI+PgovRm9udCA8PC9GNSA1IDAgUj4+Pj4KL01lZGlhQm94IFswIDAgNjEyIDc5
Ml0KL0Fubm90cyBbMTQgMCBSIDE1IDAgUl0KL0NvbnRlbnRzIDE2IDAgUgovU3RydWN0UGFyZW50
cyAxCi9QYXJlbnQgMTcgMCBSPj4KZW5kb2JqCjE3IDAgb2JqCjw8L1R5cGUgL1BhZ2VzCi9Db3Vu
dCAyCi9LaWRzIFsyIDAgUiAxMyAwIFJdPj4KZW5kb2JqCjE4IDAgb2JqCjw8L1R5cGUgL0NhdGFs
b2cKL1BhZ2VzIDE3IDAgUj4+CmVuZG9iagoxOSAwIG9iago8PC9MZW5ndGgxIDIzMjI0Ci9GaWx0
ZXIgL0ZsYXRlRGVjb2RlCi9MZW5ndGggMTMxMzE+PiBzdHJlYW0KeJztfHl8lNX197n3eWafSWYm
k8xkkjAzmeyTkJCFEAjkCSQRjEBYTdBIEILgRtjEpQKuYHBB666VuCEuLZMJathqXOpS9QeuRVtr
WrEulYJW0Voz837vnYBhse+nv9/7/vG+nz5Pzvfc5Zy7nnvuvZNMiBFREkClklPq6hv4h/x9IlaN
1LNOaZo647Kt909C/F7EXzhlxqzx5l8brifibYiXTJ1RXHpJbW894hsRb5tdN7l5tq5jDeKHiBy3
zr9gXodyv7qfyHU18m+df9EK/z/HPYjykz1EhjkLO865wPjpjjyi9BVEut+dM295BznIRJR5GuTt
55x/ycJrlm7tIQoinrpo0YILLv7bqmdOIareRmQyLmqft6D/rHcvQL4L8iMXIcG52pRFVL8L8axF
F6y4+IxXDWmI96MP55+/ZP68S6+/Ooryz0R+7wXzLu4w1qkXEZ0i6vNfOO+Cds+GslWInw/52R1L
lq+IFdDviCa+IPI7lrV3fHnqxymIo0+ON0mMnZXiDyeb5IwUvIxceBll4WVUgpfRSKoE1uFlNBEv
o0a8jKbgZdRE04GzqBk4By+TZRGZaTydScr8S5adT4XnLGs/j/znz1txIUpXRXWxGKT4kDAbEiZS
zmtfBtmhOFiukONkBDfK1gotlWajHePJP5ivID0LrTZSVmwR1YEmgqaDZsVuotngzaA5IPQ5to0q
Zez3ojzko/dIi/dhOF7dvGXzzia/7Ik/3pNF7WcvG+yPf3AcFeVtvot0ZNTdrStDM9LiXHmDFnKn
UcctBpWLR7RXoSHP5KlTpqIUP3Xp3opOY2WGcSyiEYthJEjN0e0QM0hxLYWJR6cojDNGHt0Xlj76
zhhDP42xKOzPBDSTGWghS2wAc2wF2sgGTJCYSAmxH8hOiUCHRCc5gEnkBLooKfZPSpaYQslAN6UA
PeSOfU+p5AF6JaZRauwflE5eYAalAYdROtBHGUA/DQMGyAfMJH/sOwoCv8WcZAKzKQjMwSh/S7kS
8ygbmE85wALKjR2mEOXFvqFCiUVUABxOIWAxFQJLqAg4QmIpFce+pjIqAZbTCGAF8O+w2lJgJZUB
R1E5sIoqgKOBX9EYzPlXVE2jgGOpCjgO+CXV0GigRtXAWhobOwSrGgecILGOaoD1pAEbqBZ4isSJ
NCF2kCbB0v5Gp1I9sJEagKdJnEynAKfQJOBUOhXYRI3AacAvsHpOix2gGTQZOJOmAGdJhEUDT6dp
wGbY7hfUQjOAcySeQTOBZ8KW/0qtdDrwLIlzYdl/pTZqiX1O82DTn9PZdAZwvsQF1Apsp7OAC2lu
7DM6R+Iiaot9SotpHvBcmg88jxYAz5d4AbUDL6SFwCV0TuwT6qBFwKW0GLiMzo39hZbTecAVdD5w
pcSL6ALgKrow9jFdTB3AS2gp8FKJl9Ey4M9oeWw/XU4rgKslrqGLYh/RWloFvIIuBl5JlwCvkng1
XQq8hi6L/ZmupcuB64B/ovW0GngdrQF20lrgBroCeL3EG+gq4I10dayfbqJrgBvpWuDNEm+hdbEP
6ee0HngrdQJvA/6RbqcNwDvoeqTcSTcA76IbgXdLvIc2Au+lm4G/oFtiH9B9EjfRz4FddCvwfrod
+ADdgXIelPgQ3YmUh+ku4Ga6G/gI8A+0he6F93mUfoHwY3Qf8HHaBHwC+Hv6JXUBf0X3A7fSg8Aw
PQTslhihh2PvUw9tBm6jR2Lv0ZMSn6JHgU/TY8Beehy4nZ4A7gDuo530S+Au+hVwN4Vjv6NfS3yG
uoF9FAE+Sz3A52gb8Hngu/QCPQX8DT0NfJF6gS9JfJm2x96hV2gH8Le0E/gq7Y69Ta9JfJ1+Dfwv
ega4h/qAe+lZ4Bv0XOwtepOeB75FL8TepLfpN8B3JKIG4O/oJeA+egX4Hv0W+D7wDfo9vQr8A70G
/IBej+2lP0r8kPYA+2kv8E/0BvDP9GZsD30kcT+9BfyY3gb+hd4FfiLxU/pd7L/oM9oH/Jzei71O
f6X3gV/Q74EH6A/Av9EHwIP0R+Ah+hD4JfA1+or6gX+nP8Vepa/pI+A3Eg/TfuC39DHwO/oL8B/0
Sey39D19CvwnfQb8gT4HDtBfgVHgKxSjL4D/8ekn8+lfS5/+tfTpX5/g0/8uffrfT/DpX0mf/pX0
6V9Jn/6l9OlfSp/+pfTpX0qf/uUJPv2Q9OkHpU8/KH36QenTD0qfflD69IPSpx+UPv2g9OkH/uPT
/1s+/aP/sU//k/Tpf5I+vV/69H7p0/ulT/9Q+vQP/+PT/xs+fdf/wz799f/49P+rPv2w9OmHpU8/
LH36YenTD0uffvg/Pv3/O5/+0X98+n98+n98uvz0LP5pjkt+dkby86i14Onw3Qr8uh/erxaeZSZW
eTvW73lYmSux2rrEpztHc2cczb0A61Tmxj76iXe+rOcnH90OSpf0CKWrOWgHYc0OUnRxbL/IE5x/
TsQy4jT4RGDHv2N5zE897HvsKN+xVDYC3lLF6Ciw6AGsOBd6cjtzYodIgf+bxFTIhOh6dk/sIvin
sVilD8SeZlfGHkP+TbC979CCP6oM/n0K5Gehl58pH8Pr3Y29cB12vzE0naWg9+/i/QZt+DnW9q/Z
z7ATqajrSpRXjRGqjT2LXa+Arlc36vaZnoRH2Mn0sfmxxdjNMqmTh2LvYn3nwPM+SE+gTSHWp07E
vnYefNCdLFV5EaHbsKqjzMpblQm6Z1DTJHjuCzHWnVjJv2VO1qTbpzsUuwyeUo9dNg9tWkyfsQo2
mT+sWmPjsGrPwMp8Gf0Vb596hvqI7oxoTewXseewEz/NzGwXe1ZXqrtx4IrY/bFfYe5zMLtj0e/Z
8O1XYZW+Akv8iq+JrcE+NAM1/4ZlMD/LwYi/y1P5ar5aeQu7Zy32ifNgI5vgPSLwAjux7t/FOuqn
j5mLpbFT2dnsZvYVt/IFfI9yj7JNeVtl6qMY7yB27AL49ofhU17Dat7DdCi/hDWxc9kSdgf7Bevn
Yf4F/1Y1qlep/1QHdDnR/ug/Y1OwO3twXjgNPn8NxvZBeKlt8APvYM38nQ4zOxvFFrH7WZj1sy+4
iWfyqbyD384f5r9Upig3K8+qFep49Tz1dfV93bW6DYZ5hugPm6M/j/4y+kbsaax7BWcaD0ajASN6
BaziYXivt1D6e/AIfxb2g/LHsDnsLNSynK1nt7Jfst+wN9jn6CXJN5OP4XWodQlfhnG6kv+c34ra
9+Ddy9/nH/C/8m8UnZKpjFSWKvcrYaVX2av8RbWrOepwdYQ6VZ2jxjAzpbpTdDN0W3SP657THdJX
6xfoO/SfGq40XG18baBg4I9Rii6KhqM9sF0jLOlSjMR92BW2Yix2wlu+hhF5D7PwNWbBywIsF+2u
Yg2skU1mp7MzWTu7kq1jt7A72T3sAfYr9AB94Aa0PcRr+Qw+j7fzq/k6fgPfhncHf4W/y/fxA2i5
WwkqIWWEMkmZo5yhXIg+rFBWK1djZG9WHlP2KG8pnyifKgcwa251mLpSvVS9S31E3aa+oTtNdwHe
B3TP6Pp0b+h+0P2g53qvPl1frD9Xv0X/Z4PeMNLQZLjO8Lbh78YOls4K0HL/UG/BU7EGh/HHuEtd
ww4gIYOpOHveTCHMwwysir9TjRLFvCSIfLQtmaeqSUJTr6lh6K9gO6mC/YbW6LkifhnTTxH2B96v
Ps/H0jusjaWqjygX6n7LA/Q4vNFGvovvZONpG6/ms/m9cJkfsy3w8+fh5HErO48tp8fZATaaXc4q
2Rp6m6coM9jVOOM9wFVmYpPYIUIL6Ap1AU5R//JhVdhzPovep9rUn8E/9eKU0ALv9iF7lL5nOpzI
3LDKWVjjKs4eD8JLCK/XinW2BusxFR7kfP0e2sb0RIZK/Tj1Uuwk/6DPdDtgUePhST+JLlbvUz+K
VcaKsMKwynAyWAH/fQpWzMewkt2Ii9iZWOlm+JJSrOomnAgX4Ay1DmeRcOze2FWxS2JL6FXofs8K
2fesCyuiFxrV2KVfxip5j23AOjzlX/fzp57oApwNPmcels1KsR4O6C7SbdQ9ptum+7Xudf0IjPbV
OBm9hj33a/gtP5uPPf5z+pYZMTepOM2Xo72j0PZmOp+3KLtpAvPiLPkWelKJc3a8J8tRypUYvXux
nndjbRyCnzgTp5N9jDM3ejQf9RtRTiPGeS6kN2MGr2I9SFkAr12Anft7lsBG8RWoT0NJt8Nr9aFN
f8COf4hisl2F8At1bDbK+hYn7AWoYSQ1sW7MwFO4JUyhOuU1jHcWs9N4lskegl4bVmgCbjpVuo8Y
p8LolNgovljZjT0mhvQu7F5pNJYtRSsS0Y8BSmZTqSI6HW14iylqmL0pW3EXb4+tU1ZFz8f56FHM
iaZeZKgj0mpnajXjxlaPGV01qrKivKx0REnx8KLCUEF+Xm5OdlYwM+D3DctIT/Ometwpya4kp8Oe
mGCzWswmo0GvUxXOqLA+2NDmD+e0hdWc4MSJRSIenIeEeUMS2sJ+JDUcKxP2t0kx/7GSGiQXHiep
xSW1o5LM7q+m6qJCf33QH369LujvZXOmNSN8Q12wxR8+IMOTZXijDNsQDgSg4K/3LKrzh1mbvz7c
cNGizvq2OhTXbTFPCE5oNxcVUrfZgqAFobA72NHN3OOYDHB3/ehuTkYbGhX2Buvqw6nBOtGCsJJd
P29BuGlac31dWiDQUlQYZhPmB88OU3B8ODEkRWiCrCasnxA2yGr8i0VvaIO/u7Cv8/peO53dFrIu
CC6Yd2ZzWJnXIupwhFBvXdh96X7Pj1EU7pzQvG5obprSWe9Z7BfRzs51/nDftOahuQGBLS0oA7o8
u6GtswFVX49BbJzhR238mpbmMLsGVfpFT0Sv4v1rD9aLlLZz/WFTcHxwUee5bZgab2eYpl8SiHi9
2nZcWbz1/s6ZzcFAuCYt2DKvLr3bRZ3TL+lJ1fypx+YUFXbbHfGB7U5IHAxYbUMD7UfzZEiKi1Dj
9KMjy0SLgpNgEGH/fD9a0hxEn0YJaB9FnfNHQQxPC4NWeAFmZHHYNKGt0z5apAv9sC7bHvR3fkOw
gOCBL45NmTeYos+2f0MiKOzkqKkh/0g4HAqFCwqEiRgmYE7RxnEyXlFUeFEvHxnssPvBMHzUhLGd
1zK6GMMfCIgJ3tCr0dmIhNdOa47H/XR2WoS04lBLmLeJnL4jOcmzRM7aIzlH1duCsOT4L3STw8ac
oz+J9pSk+kWjwyzlX2S3x/MbZwQbp81p9td3tg2ObePMY2Lx/FFH8wZD4aQJzUoaHwzxNEXmwijP
PCosIs3WsJqNH7006gVhBUYpE5i/IWxvmxjHFnMg8JM6vQbjEKXe2CGhJdmPaoOtDI8OHRsfc0z8
mNZZOxW0V83hjTPndHaaj8lrgAPq7GwI+hs62zrn9cbWnh3024Od2/kj/JHOjvq2IxPaG9uxIS3c
cH0LOrGIjYaxchrfHWTrp3VrbP2MOc3b7bgLrZ/ZHOGMT2gb39Kdhbzm7TiqaDKVH00VMb+IUSOD
oUe4UWalbdeI1spcVSbI+PxeRjLNeCSN0fxeHk+zyzQ8RWLDVHDm49irGe5lykk21J96av83b/Tk
L8/78VWalQd/6lUfi7+6sHj1JfJ9Uf+iocuYbLxBvjHzA5ZSy2bLZmvchnWuyxz3v/Pm3MTqb4yp
RtnIBz6qlre8V5vGPPX99z8M2Mko/rrDdPQmyXDOJSVH14e02ZrpPH4Z38AVrvay/J65Oqbr5Wc9
bTTpGFlNuHk1Y6QYb9VsOlJ9ql8Nq6qaat7BHsEZxhOaYv+6tXry4eqBaqqprqn+uvVA1YgSag0E
HHpDxcisyjIlJ/rJ3W9cyHjJfjW4sT6W9cq18Xs04Ry7gwxkZrXbyRDbp5kqq8r1eQBDb6xPM+VV
lOs1AGL7tKZALvIA+VSgFujyzMXWUVSpq7GeS+fydmWhbpHxHPOnSuKpesaNJqaYTSbVYGI4bhlc
ONXpTarq1+ldOp3eaNa8GePMogqLN6PcnM0VRa+aetkuLUFv4DoV11ej1e32Ui+fp1l8TF6q1jKF
9fIszeQzsRLTWhM37eBZpELC5MeIpVrOmh8fi8kDqYdbl37dutQzMKW+ve4vGJVqOwZm8gGHs6q4
eiAUql6nGx5ad/kL64Z7BDPYq6vXvfBCt55PmNm8zVRuspVTqGVECWsMW2Y0hodhwW4nJRaNGFXz
jlgUI/VDt14dJZ4WtrQ1JJ9AQMHLAkmKonsm+uu1A09dEn2Rj2FVBb99kU2O9uh2/NDJ/QP9Yu5v
xmk+FSNv5R7NYlFyjDkWRVWYggWtmdJHl5v9o8eUm3pj/T2DXHsofThSAXqT0fyR6QuzqprM5iSe
rtpNPnOQF6p+U7H5HL5IbTeda17FL1YfMj1mftK0w3zY9L05ZZO60bTJ/KLpFfPv+D71XdN75k/4
p+rHps/NtlWmi81X8evVq0zXmzdyQ7OlnZ+rnmNaZL6IX6Ia6nijWmdqNJ9uPN3UbDZ4zMUJ5Xy0
Wm4aY65JMCjcqupNJnMy96pukyE+gJqPq5h8ndVgKNUnWEth53aFG5uMtnKLANnLBIut3Kgl5JZb
BCDpXs0uAhYjLjUq4wYz3APmraba4XRXxUe4lRUfsL99QCSk9cbGaEWoxa8aTaZSRXUpisotZnOp
whHkKEaxqpxbzbBCg9GXwBJ6ma1HnAl38FGki/X1nNFarhMW6J4xs1xXatAMa4zMuHsNZmG3xW+x
8l4+SnNiuWoQJA1CVOqzMqsoxjZipSdk/3rpgVDIXv03e7U31T6wdGBptddjh3Ehwb5/KRpvl1aH
1h5rbYOWlTQDRmWM9Xdb/MKMWuWzdJnoKIWWtpY5AowFHAEHLr6Om9lOnM4NbFf0QPSD6EfRP8KY
PMqn3zeoV/5ztSDY1Kmxv6hf6d6iQrZXG7vd0ZvxVN6LhaohyZDsTnIne0Ltuva8FfqLbSvy3rO+
G7S2mGclzMpsCS6yLnSeE1icd07hqoxrM24PWJ1BYXfDfOWCa+2p3vJpmdOCz2Y+G1SXZi4NXpF5
RfBPmX8K6kPmAltWZlawylYebDQ32uoyJwTPtbUHL7FdmnmdrTNzs/kR25bMJJPZZNNn6oOp5lRb
SqYhM2i2qcw926Ol+suXeNgSzyYP9+zg7ZSGubB6q3xpLK3IpdBEJiZnktdfXsI01oRjzkbWxcKs
D1emv6mat8quMrWowOQ5GHMzt5bkLnc3GnJzvMN9uV32sJ3bG9lBh59K4OdSi96cEfcMjTOau0kb
1TL5AJzkFPth8NCyA1QzsDT0dWtof5wvC+3HnMXnAnv+dsrEeKRljMN47B3kH0WSqjIxPGCIvRJx
itheLdFZZfM7q8ySEkXap1qCFWm2KrNHUNKgJQ8+LYMLJnm0ebStIrMC4zjJNiGzIbjZ/GimmVpb
hBtfylqTslNSykpHVpTn5Mq3onzkyDK/6tbl5AQzDfpklztFTcH1R68G/XQq83s3rbvp5rGnlW//
W9u6NQcfZS7mNkT3JV1++RWTigtHsfCeldfH6Jno59F32QfpN6+/ZFr5pDTn8DGzL/lVx/MLv/qt
ben8isyq8uzihRfs3rD6D+cxJnxWIZG6Xe4Wy7RgsalELdE1mTrghzeaDHqm49m4bRnIaILbVteI
HYwVaWa9AZ6b1mASRNShJDTxDr6Wb8SZIdU48MTgrExr7uaYlerJ2McGsH9Vw2vvl3vZQHV1NVZL
KxZCRSAZi+HD6GT1hugU9bnvvvvnOBQ7KfapOlwdR0EqZUu1RQavMV2XkeI9NW1i+qTs39s/dJhG
pjaknp6zMPWcnGtzbkn9uXezd3vaS96X06x6vS05RZ+akqvPT25JXcWv5Zv1T2Krtz5T/p6dZ2SV
jnAU2rK00PDyLC0zD5CaUb4k64csntWQIWyzJCGxfGwGowx7RjjjHxlqRkYhKyMNqYnkQ9NmBbR0
R01AS7MDPN7yQC9f8aRqsNrMhVDvQZ7kyJYcEoWQ0DSXZdiIHGO+Kc/W4rNusnJ4nRgcj5aQUm71
Ti1n5W2YjRtLGGNl+YG5bvahm011z3UvcSvu1LLFtfExXboMtr30QOsUe+vhUDy2X5wP4LJCGFi4
KWnx2A9bl4biZhgpzmBLWw7EI9spK9b3dFpG+cysBVm8NdQidjlsn0qCPT4lS1uFaebCEEtheoor
xR0QtqnXBzOlfVaOxH0d5qlner0wURgwkkZWsPZY6M09u3oblbTs6OcWu0GZ+FDrQ7tn33PLb05r
WtI4k5018vOsyua60+rL7Bb+5+F339py3dPR3uuvOS29MtXY0BBZP+eGxvRsf/q0+jHRN52lntzq
MbNLcyqz2jHktbCGXFiDi9LZg9vJHvtOa7BU3WW623a7fYvuEfNO005br9dodLGJ/BR9g3nqsC22
p/RPeV8yv2x917zP+p3hW5stPTE9WUPPk7UER3li8jPJe5KVZDFDicNqJE9wg/MbNGtigrMpoS2B
J3icwls9lZpWzsqcJGQy/OWSZ+bHeagozj3pkmuJMJMucRq0o9lznU7MfI9qcXqEBWRZDBRgxcmB
qdi2vMXD5g5bMmzTMHVYYsCo2RLLjakZg7McmnxAzG8rJhdO7ACclebyaHmuGo82LBEA0/IIG5S+
pmZAOjMnGgEJp2gMhJyDJih45IgozEf6J6lAyHBWiUZH3IKFe0zmcTJaG6jBVgX5/cIyWmX1CRpG
KUFUmiCqT9AwWCQLlQcvuNRq5igTS3optYaYDvbih0OzU1kpKQHp5pLiXs3Nv2eekZ9tjf71msXM
9dYB5tQPaMqV88bPyVUunn1mdTVj04vvvv/Jmz/AjhCKvhTdffmGiez8S9dMmLBc+Ktb4K9a4K9S
KKKFEpmPVbEyXmYfz8Y7/sj+wUwGXYouizc7Fjl0jPEkl8OZpLg4SxQzkKEYcLpyJZtTiCzmHKNJ
82eVbzWxmImZvB4xfymZWeUbPV0e3uE55OEHPcxDrpyUZDm1kO1KZoeSWXKqu6ZazhT2kurJA9WY
LYQOD8akhxNnhANVVQ63XFpG6e2olTmwrobxZOz/5WI49HoRZI+v3z3v3qkZ0U/808Y2XFgW/US3
Y+DjTRM71t80cDMf8cicirrrrh34QvwBM6Pr0P+5CFro7+Lw+kGPzVGjiPZdnlpUbsCRLEmfa1qo
32p+xvyy6VXz+2bzDKVN4TaDx9SgP914kV73lOlD9YD6g/qNXjfFMMW4UH+5er16j3qv7m793Ya7
jWaf6tSH1JCuQF9gKDAW2xrVRp0Zqx1bvtGsM5twprfoVD2HlVssRoNZMZstai+/QPPqio1VPgMz
tNu4JYetJeZDg1OtNZcNOi8xOqn2w0s9MGxxijpygo+fpoyX218wVh/xU0rs5YgpMHhgF0coWgZf
VRY/OeHH4LiOpbJJbE70NnZN9I3oN1fh8HSYXRT92cBZ7IProk+g6tU4j98Jv5HLxmynfIxRq8Nc
A9u0JutTrOVKubHcUx6s4/XGek9d0OpXivNnmNry1+Zvyn9I/4hhs/VJ/ZPWcP7e/P78BMovzm9C
xjP5H+br8zVvenkN4mtlps4QUA3ejBSYWMRsEPuBNkw12B2O3LT09JxcMyN9oj3H6dDmVLQ52BIH
c/TyBi3Rm5aTkY60JemsLZ2lI21bdk5OLsNdMUKUK12TqUZwbSTanQvRXK0WVA3Kyi3P1UaPLS/O
3ZP7Ya6SmOvLXZurUK4/tyQ3lqvmpuZ9VH1kyxg8llRPth+wD1TjDhXCBnwYF5zqH41VHmoP1Bxg
WPIEwqAvC4nNgIWSAsliN3DLPcGdIo0396jx/mjHq5myoW/h7SUND5y58oE8WHNG7rQxi4ZHPxlW
M7J2UVH0EzXn5kdnzpo1c+6ZdXcOtPC59w2vnrjh9ijnDffMKWy4+q6BH+J3KLUFc5ZCmzSPIcmd
NMe4yKj2qgyzZa8z1iV+Ztfp5WJ2GBJseqvFwsjMWU4KycVMTHzt4acWs9mSY00Q42uzWY+uaSs7
hH342DUtR+qEZR031gPi+IaNMnDMIpaDhKWttkQ/yZpWNWlFKPoJ0214q/XuqT4+7In2UU1XR6I+
NefebRMWXX2ZuKdPx652N3pqo1S6Q5v4KfvE+G3St8nqS/xTHXem6lJNvMU+O2l2SovnDn6n/k7j
HdZe0zv897o/mN6xfqL7RP+pzf6I8VX+mv5544tW3UrjdfqrjYpDWqHFLYbIpRpcVQZvW1pHGk9L
CFCqtzm+w4gNZimOySSmHN1Z2grHPaFZMy22L3QuTFnsUVlrCzrZmlTuRLco2UXBzKycbNfgeRWd
nt45cO+XrDz6yhe3RL/tZP7bL7zwttsuvPB2nnk903dGXzr4ZfT5q2Nb7tuypeveLVuE51qHG2Ml
+munLVreHTpmSmAzdAt1K3VKsbM5YVFCh1M1mxKtPiu/yRqz8hrrVCu39vJVWr7BgDlWuN6cRya7
qQTHU9XkXePc5ORznWucW517narTTjm4aLN8zcL5WlwpOEt11Gxn6fEPUpYOmdLDramT95OnRs4l
ZriqNO6cl1Jj2D2jMVwxbU5zt7l0VIv8rAXzihFwG+REO1iXmNUJ59W1tZx+ytgx04vVnDvOq6v4
ZnjtY9Evxfd8MKd29LGAP6f16R36oDHX7XAH73Te6boj97YCk8HV4OLOnbbtCS8FPg5+Zzucqc+3
zbK1226z3OF8JHO71VAb1LLqcs7JXJCzzrnOdW3mVVmmypx6fYPlVNvUxIbAeNy1snJzKq0VAXGz
qMgy6M06hyngseVaMzMzg4asTK1wufVi1yXJF+WvLFiffHXB3cm3FWzL3Ba0rWU3ua/33FXwaEG4
UO8OpGiBYHmKlu4r96WwD1NYSpkx0JR9UzbP1jwZ5dneQnmNhudpKmQlhay4kBUOC5TYmb2MBWjQ
O0kOEXn4MYkPWFJDF/eKIf8BHkeeVQdXUWipiMEXHaDB61GFnjE9S2E5mSMDDYGZrMW9gC12H8aN
2M1VbyCT5yXZrDzPOxc3woY8S5OXeRuSDDUDrfgRHxYcodalaeIy92pPXgEO43GeKS+7WSLe3+PL
isdTvTKupSFwno2NzGzIvNN2a+YLmW9n6gOZVpuqekU/nsR5j8rEya/HXVTDBo9GMp6ZXS7vrxnw
/8TiN1i1ja1lh5hCzC7vs6qUTEqBJGPaZFLZXPWQykUXUjQUnVLm1lCuW0Ohbq2istwt7iJuLTsf
gHIT3T557Ffds7waPFiilzV5Y14+2Hl5pZXP/pCIfh0a9PDitCYGY/AOGj/LL8XT2ioPfFmxVzST
xVmTmAfAOHzxlK3K6rJWiWDEKm61n3dbquShjkEfPiF+P8XhHu4+N0veT8UOMPR6Kn47J64GJczr
vHD+BZXZruRJ0SfOWP3+x++/nRf91jG3eUmJPz2HPdvS/PXB9wZYcWj6rLz0Yn+yy9E4bvZdnbtu
3DBi3HhfSnBYcvrCUxuvveXNMFaRL/Ypv1n3C/jF17V8P/lZ0JyfODrh1ISWRENqMnmUlGRyO5Nw
/3VyF/MoJoPZYPWI4U4kd5c77FbawPpwc+plaiSZucQxnJL1BuEUE6wWU7G5mKiYzYWXgISW51Fy
3M5ZyTWuTa6tLqXNtda10bXXdcilI5fd5XeVuFRXqvfiriMbamO4En5ijPz80BXrE1fcH+I3XPvX
qcK1HBBXXCG6H1upoywRj/AxLDnocMkxdYtBE1d+R7CirCLbwS/ts+Sm557qOftnp11aZTFdcQXz
qjn90ZlXhtLT3i8om1Y/4ja2p/+th6LXYXxugJeZoeZgj7xXc5/uOMdxu04x6VP11bza0cgbHZ9w
gzzvOlRLCpmTXS6zSZ/kyklOJuEgE1LkTpnCYljz/2KnNBmPbpFGdsjIjD997J18oNp+wg7ZGqiQ
10Z0MhDv9siRIqhMGb178XmPncZSfdNrJi4rYKmbZp191mO3866op799zNSV+1nfP8VXUMX3QPWj
0E8r+0AbQRZmJj03G3SmNErhw1SHzmtwmYaZHVarM6SE9EFLlVKln6hM1N+p3Kk3JYjWryo8pdxM
FlXVqSaLWbWmkVdN0blMqeZkqzVIeWqursiUZ861jqBK3ThTA53CT9FNNEwyraKL1VW6i00Xm1dZ
19F6dZ1uvWm9eZ31PXpPfUf3juk98zvWz+lzdb9uv+lz837rP+gf6mHdd4bDpn+YD1uLBj9zNjIc
UYQ7wElWHtKTEbBoImbRw2MYVKY3kTl+CBv8RFScwKrStj1nUXX+3tjkHr3ZBH6aVqqQ1Q8txUqc
qVZFZ7YYTEa90WDQ6VSVc6aXn4qSuTihBndXt9trrDWxBPJj0C4gC0gjhSVs87NU2wvbmTe+MXpT
Jw94PQMD3tQBj/xUvfXoJ5z2wVc2CD8OieSQrZSn8qUhEr5lm0WzVaGb30VsVejld3AsFs0qUg7B
sShxphefq1lErP+Im5F+Suy84uP1JPHDAorCWqJh5njpaZbY/SpLjj4e/erpbWrOwETeK+if7/PH
B2YRkQfUhvsHnfhbJv1xceOQsFmiwXC8vGHwxyKydAbVICXhKk5SvuG4+InlG48RMfxk+TarmeLf
1v1X5ZuGhC3xlKFVyvqN8sdAViOYTq8apWSizXKS8o3HxYeWH/8Ks9l8vLxJ/hjJahKL0qgzyfLt
CdaTlG86Lm45oXzLMeWb4mQWmCCq1pt0ZinpSADq/o+XbzDp4+UnORJOUr7luLhtSNgRTxmaJOUt
8nvgFoIzwjBZ9FZKRGpykv1Eczz6hfEjT+IJ5SccU741TjaBSaJqo9Vgk1qeZOeJ5nJMe38sM/4k
S7QPrVLK22QzbJScCGayGRNJ/HFamtd1orkc017xJJ1QvtN5vHyibEYieR1glkSTQ0pmeFNOUr79
X5SfGk85pnx7nJwCvaJqi93sJDdS/emeE82FnMfF3UPCafFeuI6Xd8pmOCk9CczmtCTJlgQyUv/N
8uN/JJySfJLyXQIzXC5ZvkuWnx1IP+JShjzJx8XThoR9ElOHVinlk2UzkingBktItrplSwqy/Sea
4zHt/bHN8ScoMX1olVIe5BWY7QWzuxO8FEDq8LzgieYoBI95fEPC2fGUoVVKea/4S3BgXjqYMzUx
XbaktDAHvTm+/PTj4sEh4XyJAf/x8qBhAguHoTVJ6Y5hlIvUkcX5J5q7EDzmyR4Sln8DQVnHlD8s
TgGBxQGw5GHOAIWQOrq88ERzJ/9x8fwh4RESc4d2Scr7ZTf9VB4Ec/uTgrIlE6pLj10+J7T3xzbH
n6p4St7x8tmyGdlUnQ/mzU7JpwqkNk4YdaI5UsFx8Yoh4RqJpcOPlwcNFzhhOFhGQepwEv+AZMap
4040Rxp+XLxqSDj+Z56V5cfLg8oEnloG5h+eXkbjkXrm9PoTzVEIHvPUDAlPlji28nh50CiB00eB
ZZX5RtGpSF3Q0niiOQrBY576IeEZEieMPV4eNFZgy1iw3FGBsdQkshjc/7joFJpgp++///5SO53w
nYYz9EOSeBX9jx91ufgbl//+o3vp35PXPyY+EzxJObPpVPUj8fvLf+9B+ycdF689Gv5I/H7haPp1
ghsyaDXSbwZNP5KnZNA65Jfwx8iH9BtkO6sG/w7oDBL/D+Mm7Psca7uYcFo1VPPncM4Qf5tjoDni
Gy6q2DXORW3xMIOXXz8YFv+TZe1gWKHR1DAYFt/jKB0M68S3EgfDenkWrqVl4vtsdD6W83haIr7J
Jr8tM5vakbMceUtI/I+VCiyCEhjSvCEa/iEaQmoJraBLqAOafozVBZA5B5IXAv0o3X9SzSP8x7xH
kVuKukbg9aMli2R5J9YwAbFlCAuch/R4S4fLes6XdUxH2jnQX4F+iFg7uOjVRcAFcnkPntFjueJ/
9Zz4dM9cW2tTnqCtIEwK0A/qAimkKU/0GGylWi+40yV5JCVUuj3Wh8DoMpledGvp2l3K4zSXypD8
eGSWSH68R6srlbxsTJwXj5A8YoxnG1ylvlov1IpBnBIHQ1NBN4E2gZ4B6dGgx+lDUAykKFuUByIN
PpTwMApKrHUpD8M8NOAeUAykoPUPoy8P08HBFBWterDHZBXVPyi10pQHoZUItIPWgraC9oB0tAS4
CRQDKQg9gLwHiCsPKPdH7D57rVm5j9aAuHI3JTLxcUyfcmePXY7NXT2JSaVarV25jZpAnMLKZOoD
cRR7M9RuJg7xxkjRCDmEjT3mhFI75Deg0RvQkA2osgvIZFwDCfkNPUkpovirIokOqXdZpKQ8Huix
e0qbMAoXE1PalQuxzfmU1eDDwOeDZ4CfrSzAMUO0U+tJtJeuRX01EK9RkrFr+ZRaJQWW6FPqFC8O
S0JsZSQhXs/KSF5BKXo8QfFIkUTFRuXgRsUQKfX5dyqaHPz1PSaLaN/6iD25dLdyjWLAYvQpayHl
9iXuVsyYWbPsycwek610Y61VmYluzsSw+NBGhlG+UBZ0YQQF1TqUeiWdUpB3HlxJMniDMkzyR5T7
seB9yi96ctJ9fTuVn0utW0ShqH5c3LTG9dgSSvtqTco45IaVGzEBN8rKN/bkjCql2hwlj0pAHGO8
BqE10ug7EerErHVipjoxU51oVKe4nSjXIec6yBQrl1KHsoo2gjYhLMwqOYIB3S4DWXml25VUxYOB
se/EUDKkentMCaJlnogzSYp5eqwJpTW7leWw8+UoU1NW9Lg9pUt2KgWyK4U9njSh0BGBue5W3PGp
gWKKmJLdSjoGQgxMhjIskuwL1/oQF4bsI8Z/y/eKQeJv8XfEdItvLUn+6iB/fZD/V5zH+vje+KLg
bwreX5vOP0Zhc/kHtAkhznfy5+GgfPx93itawd/j27Hb+/g+xBeAbwcvA98RCbzs6+W9PWBo+z0R
W4roLH8+EioeDPiyBwPutMGAM6W0Nps/x5/FCcDHfweeBf4s76NM8GfAPeB9fAW9DP4kr6Ax4NsG
+Qt8lzBx/jR/Ct7ax3siCaIJ4YhBsK0RvWC/ilA81lTs28V/xR/HtuDjv4zkeJG6pScny5e4E+Ux
/jBfEcnwOWvN/H7WzL6GUBftE5yc/IFIpShkY2SX37edb+QbNU+llq0VaZuVkuySopLNij/bX+Sv
9G/219r5jXAgmzjWL98ArCQ/h/WANNBGfl1ErQzXDqBPol+c1gK7ZKgN2CFDBLQfzT0kQzX8GpoK
4ihjNWgNaC3oCux6G/mloMtAPwNdLlNWgFaCVsGbdECjAxod0OiQGh3Q6IBGBzQ6pEaHrH0lSGi0
QaMNGm3QaJMabdBog0YbNNqkhmhvGzTapEYTNJqg0QSNJqnRBI0maDRBo0lqNEGjCRpNUkODhgYN
DRqa1NCgoUFDg4YmNTRoaNDQpEYJNEqgUQKNEqlRAo0SaJRAo0RqlECjBBolUsMPDT80/NDwSw0/
NPzQ8EPDLzX80PBDwy817NCwQ8MODbvUsEPDDg07NOxSwy7nZyVIaPRDox8a/dDolxr90OiHRj80
+qVGPzT6odHPV3Ure2t/A5W9UNkLlb1SZS9U9kJlL1T2SpW9UNkLlb2DXV8hB4PDbFaD1oDWgoRu
H3T7oNsH3T6p2yfNayVI6IahEYZGGBphqRGGRhgaYWiEpUYYGmFohKVGFzS6oNEFjS6p0QWNLmh0
QaNLanRJw10JEhr/vlH+21PDr2DNRuy1fC3Ll3wNfSH5aton+eXULfnPaLPkl9GVkl9KlZKvohzJ
UZ7kK8hnZBFfZWJtClzAVNBc0BLQJtBW0DMggwztAX0IivEKLVNNNEw1bDJsNTxj0G019Bt4on6q
fpN+q/4ZvW6rvl/P/bVp3Cb9KFwL3SRxDfAgCJsIsEaGang56i2Hn63AW87LNccB/8ECtqeAPVPA
thawmwpYrYmfwlTp6fxUydFw1qxZc8b59oEqc3LHwTPd+NQXbl8kZ6Svl+2Ks3wtBP4FqBu0GXQl
qBJUCioCZYN8Mq0A8s1a5mCRu0C5oADIL6qglBQcEJ0Oo7ad29jmnt/YSPzFeiQ3D3o7I7klYL2R
3KlgT0dyz/bVmthTlCtORexJzNzj4Fsjvv3I/mWcPRHx7QTbEvGVg7VGcoeDnRHJfd1Xa2OzcF8Q
qjMH+Qz0W/DpEd9siE2L+PLBQpHcHCFdgIqykZvPmmk/ePagVla8pmDENwYsM+KrEtJGyhUTz/RU
JJunAwmu9KBBB7ezZpVpFt8B3899X0D9rxhYmMd7/l4VbE92L5utmX27iu6DcK0vUmsW8tgfugd5
WPAnfZuzr/Pdg7JY9lO+u3zDfTcW9RqRfAPafZ2sIuK70t/LH9eSfGt9Jb4VRft9y32n+ub5pvta
s5Ee8Z3p2yWaSS2smT/+lK8JBU5CL7IjvlOye2UTG3yX+DRfrq/Kv0uML42Kl1tZtEuMAJXGay/E
+BZk9wobn1XZyxxageGQYaPhDMN4wxhD0JBpGGbIMLiMTqPdmGC0Gs1Go1FvVI3cSEaX+C1wSNyV
XXp5Zdar8t9dyrCdk/yHmvIqzZmR4yYfTlIaeeOM8awx3DefGs/2hw/PCPYy87Q5YV1wPAs7G6lx
5vjwqFBjryE2PVwZagwbms5o7mbsxhakhvn6XkYzm3tZTCRdkya+S9fN6Job0rYTY6nX3NDSQp6U
i2o8Nc5xjqqGupNA2yAO+Ttjz9BgRvj2xhnN4ccyWsKlIhDLaGkMXyG+abedJ3Jbfd12niBYS/N2
tYMn1k8X6WpHXQvE9ksxWHMCxChXMIgZx5NfiMGfjBdimKO4XA7UIRcQDHJmG+VIuRyzTcqpTMh1
7/PX13X7/VImm2iflNmXTUNkYDHQrevOyZFSQT9rFlKsOeiXDcuXBfl8ECnySRGGc50syMdkZeHi
H0WyB0UqjopUyLoU9qOMLy7jyjsi48qDTOh/+LSPD7GeEStXPy++vNgWrG8HtYU3XLTIE157tt/f
vXrl4Lcac9rOnr9I8Hnt4ZXB9rrw6mCdv3vE8yfJfl5kjwjWddPz9TObu5/X2usiI7QR9cF5dS09
NdXNtcfUdd3RupqrT1JYtSisWdRVU3uS7FqRXSPqqhV11Yq6arQaWVf9YmH3Tc3dRhrfMuHMOO/h
FjNsuC0t0DI+xd4xThj09jEBz+q0HSqxLWQJtYStwfFhG0hkFdUW1YosrDORlSC+oTqY5Vk9JpC2
g20ZzLIj2REcf/QXhCSExB/lNIYDM+Y0C1MJa/NOPmfLxSOzPVS/uA4/iK+QhHeoJC0/6bPiZM/K
lSuXC1gZWk7UGC6Y0RgeKf5EyGBAVW11LUgbfiRNUWRat8lU3xvrQ2YIjWArRHUiFGLij281M25d
Bt6l7zJwcVVY0ePNKF2yGzv4GhDucXxVpFhen/mqnsxscX9Z0VNcEee4rgoe8QZKxS+WK6EqeHac
a44iBDZmbyzaWNmV3VXUVSl+/fzUZiT6NoutNFK8WaEVoeVHBgLBFS0U/5tg1Hd/JD1DVtwlAqFQ
S2g5k+N14mCzI4N+dGCXD5a6XBa/4siExNOXDxaCmYjXvvKI2spBJZm5UirFC4nHjsKPD2JE/wtt
P4ScCmVuZHN0cmVhbQplbmRvYmoKMjAgMCBvYmoKPDwvVHlwZSAvRm9udERlc2NyaXB0b3IKL0Zv
bnROYW1lIC9BcmlhbC1Cb2xkTVQKL0ZsYWdzIDQKL0FzY2VudCA5MDUuMjczNDQKL0Rlc2NlbnQg
LTIxMS45MTQwNgovU3RlbVYgNzYuMTcxODc1Ci9DYXBIZWlnaHQgNzE1LjgyMDMxCi9JdGFsaWNB
bmdsZSAwCi9Gb250QkJveCBbLTYyNy45Mjk2OSAtMzc2LjQ2NDg0IDIwMDAgMTAxNy41NzgxM10K
L0ZvbnRGaWxlMiAxOSAwIFI+PgplbmRvYmoKMjEgMCBvYmoKPDwvVHlwZSAvRm9udAovRm9udERl
c2NyaXB0b3IgMjAgMCBSCi9CYXNlRm9udCAvQXJpYWwtQm9sZE1UCi9TdWJ0eXBlIC9DSURGb250
VHlwZTIKL0NJRFRvR0lETWFwIC9JZGVudGl0eQovQ0lEU3lzdGVtSW5mbyA8PC9SZWdpc3RyeSAo
QWRvYmUpCi9PcmRlcmluZyAoSWRlbnRpdHkpCi9TdXBwbGVtZW50IDA+PgovVyBbMCBbNzUwIDAg
MCAyNzcuODMyMDNdIDIwIFs1NTYuMTUyMzRdIDM2IFs3MjIuMTY3OTddIDQ4IFs4MzMuMDA3ODFd
IDU0IFs2NjYuOTkyMTkgNjEwLjgzOTg0XSA2OCA3MiA1NTYuMTUyMzQgNzUgWzYxMC44Mzk4NCAw
IDAgNTU2LjE1MjM0IDAgODg5LjE2MDE2IDYxMC44Mzk4NCA2MTAuODM5ODQgMCAwIDM4OS4xNjAx
NiA1NTYuMTUyMzQgMzMzLjAwNzgxIDYxMC44Mzk4NCAwIDc3Ny44MzIwM11dCi9EVyAwPj4KZW5k
b2JqCjIyIDAgb2JqCjw8L0ZpbHRlciAvRmxhdGVEZWNvZGUKL0xlbmd0aCAyOTk+PiBzdHJlYW0K
eJxdkctqwzAQRff6ilmmi+B3nIIx5NGCF31Qpx/gSONUUMtCVhb++8ozaQoV2OJ45g7Xd6JDc2yM
9hC9u1G26KHXRjmcxquTCGe8aCOSFJSW/kb0lkNnRRTE7Tx5HBrTj6KqAKKPUJ28m2G1U+MZH0T0
5hQ6bS6w+jy0gdurtd84oPEQi7oGhX2Y9NLZ125AiEi2blSoaz+vg+av4zRbhJQ4YTdyVDjZTqLr
zAVFFYdTQ/UcTi3QqH/1R1ade/nVOerOQnccp3G9UJITZQlRypQzZTHTkSjn2oZr+ZapYNozbZme
mPZExY6oLMndzUf26+r+E9mGjZR0FRlr2UGR8kA2UhT8kR2U6W0uT1oCWBZ1T1denQvB0jYp0SVL
bfC+cDvaRbU8PwiwmpUKZW5kc3RyZWFtCmVuZG9iago0IDAgb2JqCjw8L1R5cGUgL0ZvbnQKL1N1
YnR5cGUgL1R5cGUwCi9CYXNlRm9udCAvQXJpYWwtQm9sZE1UCi9FbmNvZGluZyAvSWRlbnRpdHkt
SAovRGVzY2VuZGFudEZvbnRzIFsyMSAwIFJdCi9Ub1VuaWNvZGUgMjIgMCBSPj4KZW5kb2JqCjIz
IDAgb2JqCjw8L0xlbmd0aDEgNDgyNzYKL0ZpbHRlciAvRmxhdGVEZWNvZGUKL0xlbmd0aCAyOTI2
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
/Oz7v9yNaYf9IPPECC5VYRCy+9ihqp7lDFQFy1fBs/avWnkQZCnSPAz0wQMO4CIe8Gi4t+2t8VNE
5Jk92Ha5i7llsc2NnSvhkgGvSMobKaxiucS2AUH0fwH9IfGACmVuZHN0cmVhbQplbmRvYmoKMjQg
MCBvYmoKPDwvVHlwZSAvRm9udERlc2NyaXB0b3IKL0ZvbnROYW1lIC9BcmlhbE1UCi9GbGFncyA0
Ci9Bc2NlbnQgOTA1LjI3MzQ0Ci9EZXNjZW50IC0yMTEuOTE0MDYKL1N0ZW1WIDQ1Ljg5ODQzOAov
Q2FwSGVpZ2h0IDcxNS44MjAzMQovSXRhbGljQW5nbGUgMAovRm9udEJCb3ggWy02NjQuNTUwNzgg
LTMyNC43MDcwMyAyMDAwIDEwMDUuODU5MzhdCi9Gb250RmlsZTIgMjMgMCBSPj4KZW5kb2JqCjI1
IDAgb2JqCjw8L1R5cGUgL0ZvbnQKL0ZvbnREZXNjcmlwdG9yIDI0IDAgUgovQmFzZUZvbnQgL0Fy
aWFsTVQKL1N1YnR5cGUgL0NJREZvbnRUeXBlMgovQ0lEVG9HSURNYXAgL0lkZW50aXR5Ci9DSURT
eXN0ZW1JbmZvIDw8L1JlZ2lzdHJ5IChBZG9iZSkKL09yZGVyaW5nIChJZGVudGl0eSkKL1N1cHBs
ZW1lbnQgMD4+Ci9XIFswIFs3NTAgMCAwIDI3Ny44MzIwMyAwIDM1NC45ODA0N10gMTEgMTIgMzMz
LjAwNzgxIDE1IFsyNzcuODMyMDMgMzMzLjAwNzgxIDI3Ny44MzIwMyAyNzcuODMyMDNdIDE5IDI4
IDU1Ni4xNTIzNCAyOSBbMjc3LjgzMjAzIDAgNTgzLjk4NDM4IDAgNTgzLjk4NDM4IDAgMTAxNS4x
MzY3MiA2NjYuOTkyMTkgNjY2Ljk5MjE5IDcyMi4xNjc5NyA3MjIuMTY3OTcgNjY2Ljk5MjE5IDYx
MC44Mzk4NCA3NzcuODMyMDMgNzIyLjE2Nzk3IDI3Ny44MzIwMyA1MDAgNjY2Ljk5MjE5IDU1Ni4x
NTIzNCA4MzMuMDA3ODEgNzIyLjE2Nzk3IDc3Ny44MzIwMyA2NjYuOTkyMTkgMCA3MjIuMTY3OTcg
NjY2Ljk5MjE5IDYxMC44Mzk4NCA3MjIuMTY3OTcgNjY2Ljk5MjE5IDk0My44NDc2NiAwIDY2Ni45
OTIxOV0gNjggNjkgNTU2LjE1MjM0IDcwIFs1MDAgNTU2LjE1MjM0IDU1Ni4xNTIzNCAyNzcuODMy
MDMgNTU2LjE1MjM0IDU1Ni4xNTIzNCAyMjIuMTY3OTcgMjIyLjE2Nzk3IDUwMCAyMjIuMTY3OTcg
ODMzLjAwNzgxXSA4MSA4MyA1NTYuMTUyMzQgODUgWzMzMy4wMDc4MSA1MDAgMjc3LjgzMjAzIDU1
Ni4xNTIzNCA1MDAgNzIyLjE2Nzk3XSA5MSA5MyA1MDBdCi9EVyAwPj4KZW5kb2JqCjI2IDAgb2Jq
Cjw8L0ZpbHRlciAvRmxhdGVEZWNvZGUKL0xlbmd0aCAzMDQ+PiBzdHJlYW0KeJxdkc9ugzAMxu95
Ch+7QwWE0m0SQuraVeKwPxrbA9DEdJFGiEJ64O0XbNZKiwTRz/lsf7KTfX2orQmQvPtBNRigM1Z7
HIeLVwgnPBsrMgnaqLAQ/VXfOpHE5GYaA/a17QZRlgDJR3wdg59gtdPDCe9E8uY1emPPsPraN5Gb
i3M/2KMNkIqqAo1drPTSute2R0gobV3r+G7CtI45N8Xn5BAkccZu1KBxdK1C39ozijKNp4LyGE8l
0Op/7wVnnTr13XpS51GdpjKtiAomSZQdifI9kcyYnolicKbikbos9bZ/1W9mnkiWslo+cBeumx04
uJRnIzlfG/aTs598x83Y1mbDxMptRsGClQXXvJeLLTYyz2He13XI6uJ9nC8tlQY7j9RYvO7dDW7O
mr9fCcWcLgplbmRzdHJlYW0KZW5kb2JqCjUgMCBvYmoKPDwvVHlwZSAvRm9udAovU3VidHlwZSAv
VHlwZTAKL0Jhc2VGb250IC9BcmlhbE1UCi9FbmNvZGluZyAvSWRlbnRpdHktSAovRGVzY2VuZGFu
dEZvbnRzIFsyNSAwIFJdCi9Ub1VuaWNvZGUgMjYgMCBSPj4KZW5kb2JqCnhyZWYKMCAyNwowMDAw
MDAwMDAwIDY1NTM1IGYgCjAwMDAwMDAwMTUgMDAwMDAgbiAKMDAwMDAwNTg5NSAwMDAwMCBuIAow
MDAwMDAwMTA3IDAwMDAwIG4gCjAwMDAwMjA3ODAgMDAwMDAgbiAKMDAwMDA1MTY2NyAwMDAwMCBu
IAowMDAwMDAwMTQ0IDAwMDAwIG4gCjAwMDAwMDAyMzAgMDAwMDAgbiAKMDAwMDAwMDQyMSAwMDAw
MCBuIAowMDAwMDAwNjA5IDAwMDAwIG4gCjAwMDAwMDA3ODUgMDAwMDAgbiAKMDAwMDAwMDk3MCAw
MDAwMCBuIAowMDAwMDAxMTUyIDAwMDAwIG4gCjAwMDAwMDYxNjcgMDAwMDAgbiAKMDAwMDAwNDM4
OCAwMDAwMCBuIAowMDAwMDA0NTY0IDAwMDAwIG4gCjAwMDAwMDQ3NDEgMDAwMDAgbiAKMDAwMDAw
NjQxMiAwMDAwMCBuIAowMDAwMDA2NDc1IDAwMDAwIG4gCjAwMDAwMDY1MjQgMDAwMDAgbiAKMDAw
MDAxOTc0MyAwMDAwMCBuIAowMDAwMDE5OTc3IDAwMDAwIG4gCjAwMDAwMjA0MTAgMDAwMDAgbiAK
MDAwMDAyMDkxNyAwMDAwMCBuIAowMDAwMDUwMjcxIDAwMDAwIG4gCjAwMDAwNTA1MDAgMDAwMDAg
biAKMDAwMDA1MTI5MiAwMDAwMCBuIAp0cmFpbGVyCjw8L1NpemUgMjcKL1Jvb3QgMTggMCBSCi9J
bmZvIDEgMCBSPj4Kc3RhcnR4cmVmCjUxNzk5CiUlRU9G
--000000000000fcdf9905c74d9841
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--000000000000fcdf9905c74d9841--
