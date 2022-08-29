Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453CBECAAD4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Aug 2022 20:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4BDC8145A;
	Mon, 29 Aug 2022 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4BDC8145A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=techviewdata-com.20210112.gappssmtp.com header.i=@techviewdata-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=TTWJvDZK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMos3IZYH1oI; Mon, 29 Aug 2022 20:52:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E5A2C8141C;
	Mon, 29 Aug 2022 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5A2C8141C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA061C0032;
	Mon, 29 Aug 2022 20:52:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0398C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 20:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E550605E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E550605E0
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=techviewdata-com.20210112.gappssmtp.com
 header.i=@techviewdata-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=TTWJvDZK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bL6U7tvzgui4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 20:52:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9721160B36
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9721160B36
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 20:52:23 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3376851fe13so226306777b3.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 13:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=techviewdata-com.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:disposition-notification-to:thread-index
 :mime-version:from:from:to:cc;
 bh=aMpiRtYABSxY12KMeGz3OZXruDLg3Y6a8u1cJBsZcJU=;
 b=TTWJvDZKRXCRofiOnojsZBt7p9bkFNYdukthsDLsz6XlJrXY599SyJfvxzE4mA2uNX
 QFr/lVLSy0zAdX0fAx7kGq5pa7B9Im9ztykEC4sVDI4l8Le0v+jowN1WVfQQtaZHz6Y/
 bWL3riArxBr3ltAyAPBGvKhl3YhN12YIamtVEtVqlYM4N5J12aTsbpX9ovq56HQfSby9
 hgJdj8Mp72vvDLoRKABr5KuJ6cAAmAprdnGW/kcR/DDTlUzr72kVEtgHrgJdRx1+kgrc
 u9ScdN7L5AxzWDMhfsYN5Yj07faxaETMEb5Wa9MrtxclTG0NDe9QPJFbqd4o8kKY55OU
 llMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:disposition-notification-to:thread-index
 :mime-version:from:x-gm-message-state:from:to:cc;
 bh=aMpiRtYABSxY12KMeGz3OZXruDLg3Y6a8u1cJBsZcJU=;
 b=sou1Fuxra1Ds6wUimiOAz3pyppijiiKXV+sHK9GglRdeAClNur4ExVeZvtHzNOBpVA
 EUCwcI2v+qf10ITcO//aWVz3ffI1PAH8KTSWPtj5fUacSX3Z8XlLEogjO09KR45ovAZO
 cS2bwUqhgdjqPvIwnNhjU4SmqY9taD5pWu09SvIhRuAH/pU/MUZCnAYr1vzJ99YTIt0G
 bzPPrJjO4GZNx6Ss+zKm0Sd94/H3E7Qu4ZrpbZlufRisPC2ZLeB1ob+9EPlZ/2r2zqFc
 RSGVfzi/5upw+Oe5WULzU2nnG46ELiRlzQec4kxVm9KnlW9mv4iPq4fj9Z20JHkq+yNG
 Kwjg==
X-Gm-Message-State: ACgBeo32VtG+7mIhXP91jfxaVH+slq/INhrPSvWtLl6tQHZ1vwydm5CH
 HBavVKOacrlYICW/HyIxZjLcXjsyKttymXpxmNohMEroim1ri7P3
X-Google-Smtp-Source: AA6agR4wC3nS/RgpTjh6AJ7nuC+GTj+JjzCx9AzvZ8hvCwzRiNwhrrWjYbp/r4Yf9Bbxb05K34e/YTvi1x3Ja9zsW+c=
X-Received: by 2002:a81:84d1:0:b0:340:b0ea:d1c6 with SMTP id
 u200-20020a8184d1000000b00340b0ead1c6mr10319277ywf.256.1661806342434; Mon, 29
 Aug 2022 13:52:22 -0700 (PDT)
From: Casey Beeson <casey@techviewdata.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adi75uDzgBXDiKuNQnalfAOoY17Czw==
Date: Mon, 29 Aug 2022 14:52:20 -0600
Message-ID: <2e7b5bf33e401435be78bf7e7b4ce0fd@mail.gmail.com>
Subject: RE: Hyperbaric Oxygen Therapists Contacts
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
Content-Type: multipart/mixed; boundary="===============8626622097405949602=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8626622097405949602==
Content-Type: multipart/alternative; boundary="000000000000ba029105e7677079"

--000000000000ba029105e7677079
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

*Subject:* Hyperbaric Oxygen Therapists Contacts



Hello,



I was wondering if you would be interested in acquiring verified *Hyperbari=
c
Oxygen Therapists Contacts*



Kindly let me know you are *Target geography,* so that we can discuss on
further details about available counts and cost.



Awaiting your response.



Regards,

Casey Beeson

Manager =E2=80=93 Demand Generation



To opt-out kindly reply with =E2=80=9Cnot interested=E2=80=9D in subject li=
ne

--000000000000ba029105e7677079
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
	line-height:106%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
	color:#2F5496;
	background:white;
	mso-fareast-language:EN-IN;}
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
ont-size:10.5pt;color:#2f5496;background:white">Hi,</span></p><p class=3D"M=
soNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:norm=
al"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496;background=
:white">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;=
margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"fon=
t-size:10.5pt;color:#2f5496;background:white">Hope you are doing well and s=
taying safe!</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;ma=
rgin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-=
size:10.5pt;color:#2f5496;background:white">=C2=A0</span></p><p class=3D"Ms=
oNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:norma=
l"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496;background:=
white">I haven&#39;t heard back from you yet so I just wanted to make sure =
you received my previous email, when you get a moment, could you please dro=
p me a line?</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;ma=
rgin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-=
size:10.5pt;color:#2f5496;background:white">=C2=A0</span></p><p class=3D"Ms=
oNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:norma=
l"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496;background:=
white">Please acknowledge the receipt of this email.</span></p><p class=3D"=
MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:nor=
mal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496;backgroun=
d:white">=C2=A0</span></p><p class=3D"xv1msonormal1" style=3D"margin-bottom=
:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=
=3D"font-size:10.5pt;color:#2f5496;background:white">Regards</span></p><p c=
lass=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-he=
ight:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">=
Casey</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bo=
ttom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;color:#2f5496">_______________________________________________________=
_______________________________</span></p><p class=3D"MsoNormal" style=3D"m=
argin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><b><span lang=3D=
"EN-US" style=3D"mso-fareast-language:EN-IN">Subject:</span></b><span lang=
=3D"EN-US" style=3D"mso-fareast-language:EN-IN"> Hyperbaric Oxygen Therapis=
ts Contacts</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;mar=
gin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-s=
ize:10.5pt;color:#2f5496">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"=
margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"E=
N-US" style=3D"font-size:10.5pt;color:#2f5496">Hello,</span><span style=3D"=
mso-fareast-language:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"marg=
in-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US=
" style=3D"font-size:10.5pt;color:#2f5496">=C2=A0</span><span style=3D"mso-=
fareast-language:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"margin-b=
ottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" st=
yle=3D"font-size:10.5pt;color:#2f5496">I was wondering if you would be inte=
rested in acquiring verified <b>Hyperbaric Oxygen Therapists Contacts</b></=
span><span style=3D"mso-fareast-language:EN-IN"></span></p><p class=3D"MsoN=
ormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"=
><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">=C2=A0</span=
><span style=3D"mso-fareast-language:EN-IN"></span></p><p class=3D"MsoNorma=
l" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><sp=
an lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">Kindly let me kn=
ow you are <b>Target geography,</b> so that we can discuss on further detai=
ls about available counts and cost.</span><span style=3D"mso-fareast-langua=
ge:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;marg=
in-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-si=
ze:10.5pt;color:#2f5496">=C2=A0</span><span style=3D"mso-fareast-language:E=
N-IN"></span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-b=
ottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:1=
0.5pt;color:#2f5496">Awaiting your response.</span><span style=3D"mso-farea=
st-language:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"margin-bottom=
:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=
=3D"font-size:10.5pt;color:#2f5496">=C2=A0</span><span style=3D"mso-fareast=
-language:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0=
cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"=
font-size:10.5pt;color:#2f5496">Regards,</span><span style=3D"mso-fareast-l=
anguage:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm=
;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"fo=
nt-size:10.5pt;color:#2f5496">Casey Beeson</span><span style=3D"mso-fareast=
-language:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0=
cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"=
font-size:10.5pt;color:#2f5496;background:white">Manager =E2=80=93 Demand G=
eneration</span><span style=3D"mso-fareast-language:EN-IN"></span></p><p cl=
ass=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-hei=
ght:normal"><span lang=3D"EN-US" style=3D"font-size:9.0pt">=C2=A0</span><sp=
an style=3D"mso-fareast-language:EN-IN"></span></p><p class=3D"MsoNormal" s=
tyle=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span s=
tyle=3D"font-size:9.0pt">To opt-out kindly reply with =E2=80=9Cnot interest=
ed=E2=80=9D in subject line</span></p></div></body></html>

--000000000000ba029105e7677079--

--===============8626622097405949602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8626622097405949602==--
