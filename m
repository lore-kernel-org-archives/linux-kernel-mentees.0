Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E24AECAAA1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Sep 2022 19:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAFC38278F;
	Fri,  9 Sep 2022 19:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAFC38278F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=techviewdata-com.20210112.gappssmtp.com header.i=@techviewdata-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jGfmN91a
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75D_J1Um9MeZ; Fri,  9 Sep 2022 19:53:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B30BB825FE;
	Fri,  9 Sep 2022 19:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B30BB825FE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AF83C0032;
	Fri,  9 Sep 2022 19:53:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5D6AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Sep 2022 19:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B273C41D47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Sep 2022 19:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B273C41D47
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=techviewdata-com.20210112.gappssmtp.com
 header.i=@techviewdata-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=jGfmN91a
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fr7Y_UreZhN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Sep 2022 19:53:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9338341CFF
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9338341CFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Sep 2022 19:53:45 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id p200so4244779yba.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Sep 2022 12:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=techviewdata-com.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:disposition-notification-to:thread-index
 :mime-version:from:from:to:cc:subject:date;
 bh=NhTdQcAgPC0zq0FqftFI3TzCsrvjfxxIZotWsU9UsFs=;
 b=jGfmN91aITwWZjOdSmqnfct5eJ3FrCvnA2oQnMbVjGhSWNpqOO1j7LsNek28YsElIO
 3r6cv0+gtqBZJRipa7yP6l5VEmRm/XfTFNRaUpAVaxLAh24k3dmTJWHARj7/TXIKwJUB
 teFvyUHD1O65lKLi9Kgx+z0UfdZaMdutz2Irp0QhwI6fOQ0APgEwMd1Ayj8qJx1F/boH
 R5xGKxanpbA9oANbrBKmX3AEwFywxhutBacSbuyOhabXjea5Wubia7emPHtGmhL2kj+1
 bB5aEgTVDC1lXjgATonj3lEYW6rGji3TRt5H/jsGV9b8kaimKMQ8bq/jkS5jAKOyt6Z5
 Klgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:disposition-notification-to:thread-index
 :mime-version:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NhTdQcAgPC0zq0FqftFI3TzCsrvjfxxIZotWsU9UsFs=;
 b=SMg0Bqv3XZCf9nDqpo5g61A49ZdhEx0ITmyPlSxKPQ6qcmHgL/pHv1KPXfcBpKgzxK
 tiBNZw9kAt6k8UMER8D9hxt/ItN+sgYeRxgVtZSanXL0TWr0HY3h8ca8nbbIO0LyPy7W
 RiBJkQXHg1xlTKE5W8QEl7nISkA1l/NPSa07JJkYeTT4qW705ZpwlQ3mYIJKoRKHKDbF
 DNllICtNQIE9QJdJRziqMWAwtCz8BHM8sCrt9CbGjRAJwMIW1dV7tSdyhX7lA1u3OOPK
 PgfWxn2R4c/N/q9vbtabiwZ6grugM7Wn73YxVLv6OZGWZwBtT33onTuMFdrWaOt5FA7a
 kI2g==
X-Gm-Message-State: ACgBeo0d6bdWnA7tPUFQYIctPA5W7FOUCAHrJrCEVcCXM+7LgKmKfJX8
 +2uBYKR1corx6aI/67gnlPprkMsp3gPVPyl6HENYYGOosMD4bBK2
X-Google-Smtp-Source: AA6agR4vljh2VC8BH7N3kbKRJ45jL2O3na4OrDvaOa6WdYC76eDMp8GJqR+Xp/g2d3UAFm2LY5vcPGGQlwkzZdgYAXA=
X-Received: by 2002:a25:5381:0:b0:6ac:fc2b:c58d with SMTP id
 h123-20020a255381000000b006acfc2bc58dmr12259973ybb.31.1662753215971; Fri, 09
 Sep 2022 12:53:35 -0700 (PDT)
From: Casey Beeson <casey@techviewdata.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdjEhFtSwNzp18A3SxmcY98K2djqHg==
Date: Fri, 9 Sep 2022 13:53:25 -0600
Message-ID: <196ee4c9ce170520bfeb3886975eaf11@mail.gmail.com>
Subject: RE: Pulmonologists and Respiratory Therapists Contacts.
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
Content-Type: multipart/mixed; boundary="===============7599325619603297685=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7599325619603297685==
Content-Type: multipart/alternative; boundary="000000000000c9947e05e843e657"

--000000000000c9947e05e843e657
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,



Hope you are doing well and staying safe!



I haven't heard back from you yet so I just wanted to make sure you
received my previous email, when you get a moment, could you please drop me
a line?



Please acknowledge the receipt of this email.



Regards

Casey

___________________________________________________________________________=
___________

*Subject:* Pulmonologists and Respiratory Therapists Contacts



Hello,



I was wondering if you would be interested in acquiring verified
*Pulmonologists
and* *Respiratory Therapists Contacts*



Kindly let me know you are *Target geography,* so that we can discuss on
further details about available counts and cost.



Awaiting your response.



Regards,

Casey Beeson

Manager =E2=80=93 Demand Generation



To opt-out kindly reply with =E2=80=9Cnot interested=E2=80=9D in subject li=
ne

--000000000000c9947e05e843e657
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dus-ascii"><meta name=3D"Generator" content=3D"Microsoft Word 15 (filtere=
d medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:105%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
p.xv1msonormal1, li.xv1msonormal1, div.xv1msonormal1
	{mso-style-name:x_v1msonormal1;
	mso-style-priority:99;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:105%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	color:#2F5496;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:595.3pt 841.9pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72"><=
div class=3D"WordSection1"><p class=3D"MsoNormal" style=3D"margin-bottom:0c=
m;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"f=
ont-size:10.5pt;color:#2f5496">Hi,</span></p><p class=3D"MsoNormal" style=
=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=
=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">=C2=A0</span></p><p cla=
ss=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-heig=
ht:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">Ho=
pe you are doing well and staying safe!</span></p><p class=3D"MsoNormal" st=
yle=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">=C2=A0</span></p><p c=
lass=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-he=
ight:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">=
I haven&#39;t heard back from you yet so I just wanted to make sure you rec=
eived my previous email, when you get a moment, could you please drop me a =
line?</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bo=
ttom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;color:#2f5496">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin=
-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" =
style=3D"font-size:10.5pt;color:#2f5496">Please acknowledge the receipt of =
this email.</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;mar=
gin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-s=
ize:10.5pt;color:#2f5496">=C2=A0</span></p><p class=3D"xv1msonormal1" style=
=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=
=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">Regards</span></p><p cl=
ass=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-hei=
ght:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">C=
asey</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bot=
tom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;color:#2f5496">________________________________________________________=
______________________________</span></p><p class=3D"MsoNormal" style=3D"ma=
rgin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><b><span lang=3D"=
EN-US">Subject:</span></b><span lang=3D"EN-US"> Pulmonologists and Respirat=
ory Therapists Contacts</span></p><p class=3D"MsoNormal" style=3D"margin-bo=
ttom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" sty=
le=3D"font-size:10.5pt;color:#2f5496">=C2=A0</span></p><p class=3D"MsoNorma=
l" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><sp=
an lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">Hello,</span></p=
><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;li=
ne-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5=
496">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;mar=
gin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-s=
ize:10.5pt;color:#2f5496">I was wondering if you would be interested in acq=
uiring verified <b>Pulmonologists and</b> <b>Respiratory Therapists Contact=
s</b></span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bo=
ttom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;color:#2f5496">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin=
-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" =
style=3D"font-size:10.5pt;color:#2f5496">Kindly let me know you are <b>Targ=
et geography,</b> so that we can discuss on further details about available=
 counts and cost.</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0=
cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"=
font-size:10.5pt;color:#2f5496">=C2=A0</span></p><p class=3D"MsoNormal" sty=
le=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lan=
g=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">Awaiting your response=
.</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom=
:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt=
;color:#2f5496">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin-bot=
tom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" styl=
e=3D"font-size:10.5pt;color:#2f5496">Regards,</span></p><p class=3D"MsoNorm=
al" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><s=
pan lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">Casey Beeson</s=
pan></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.00=
01pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;col=
or:#2f5496;background:white">Manager =E2=80=93 Demand Generation</span></p>=
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal"><span lang=3D"EN-US" style=3D"font-size:9.0pt">=C2=A0</spa=
n></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001=
pt;line-height:normal"><span style=3D"font-size:9.0pt">To opt-out kindly re=
ply with =E2=80=9Cnot interested=E2=80=9D in subject line</span></p></div><=
/body></html>

--000000000000c9947e05e843e657--

--===============7599325619603297685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7599325619603297685==--
