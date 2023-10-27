Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B59AC25B48
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Oct 2023 21:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C03A04F316;
	Fri, 27 Oct 2023 21:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03A04F316
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exposhowvisitor-com.20230601.gappssmtp.com header.i=@exposhowvisitor-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=DXCIxach
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGvLvPv8BwQ6; Fri, 27 Oct 2023 21:03:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6098A4F314;
	Fri, 27 Oct 2023 21:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6098A4F314
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A6C0C0071;
	Fri, 27 Oct 2023 21:03:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25BD0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 21:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E694040223
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 21:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E694040223
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=exposhowvisitor-com.20230601.gappssmtp.com
 header.i=@exposhowvisitor-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=DXCIxach
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqvTGvqKyxzC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 21:03:05 +0000 (UTC)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A076400F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 21:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A076400F3
Received: by mail-pf1-x444.google.com with SMTP id
 d2e1a72fcca58-6ba172c5f3dso2451284b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exposhowvisitor-com.20230601.gappssmtp.com; s=20230601; t=1698440585;
 x=1699045385; darn=lists.linuxfoundation.org; 
 h=disposition-notification-to:content-language:thread-index
 :importance:mime-version:message-id:date:subject:to:from:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bb2/fbbBKTIWVZAw7qOAJR1kD39+J0QYG2e6Qgtc5fI=;
 b=DXCIxachtfc+2L8uQ9XeAcXpKd/I8EpakR9jcI5UlPU64wJI6YfazBbE7usdWX4c6d
 U7NVcmQgf/LFILjpksBe2722NRNQlON7IDWWNGOfx1+UlVV7yKfHizKL+UegEpepXPPV
 nDeL9FY2uEMCnKFyviwZgh8+IWzaYRhqBEWxFApnfNTHtJ5ssQgIPjvGXG2xefdgPjPg
 mctBpXYwNyDovs6IF2NywPptSno2noJMdZgwD+zSh964LhKE2vE8H1r6rnRSm2LEn3QL
 +cyP31z6Wx1G7J5reWKvXwFwx/G2IIRbLVAifzs2MMwBvBdI6d+9HsZRGHoPrMZpN5kz
 tKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698440585; x=1699045385;
 h=disposition-notification-to:content-language:thread-index
 :importance:mime-version:message-id:date:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bb2/fbbBKTIWVZAw7qOAJR1kD39+J0QYG2e6Qgtc5fI=;
 b=o6OzbdKH8YfY0a+QE5m0VwoKg7OwvsqlCBuYN9SikaqegxbCGNsCGWhx1WLWZBpkvy
 eN4OKZNjqXPMynDmUMXrP/keoBNnhugK4CniqUGn5/Kbjcso1E6Ko+pc2E+hTSHj26hb
 uNZ6nRy43i/Ut4YroNx2osgVIPAZMFDGbGolndqDSn6ID5uj2wkVBpxoBJIVXXxJa13R
 4PfNkyf1QnGQQU9k57GfnVVaHsTAZ6BtPDmeaOTW2Z5r/BddkmuWdyPP6nnpbw/Bx5O0
 iint1E6+uXcbhje2sKY6KR21Ug5FV/r4gbVp4dMaOJf4XyKGQTfXAeZBbUcNii69su6h
 Gssw==
X-Gm-Message-State: AOJu0Yzd2rofZTGtUQxmHV1+BAT+48/iuYuS/DJK6noC3qQTTnRXNW+i
 krwIexmEqIzUXH9zjjzhd0HZdhAZpQ+6JnKm+NWSWw==
X-Google-Smtp-Source: AGHT+IFMUX0r0v8pfyQbqERHf2j5eMJWX4Y6NDm/Lksy7OBVQ4fSrWKhjI/76o360QDJXHYuQ07Xlw==
X-Received: by 2002:a05:6a20:8e1f:b0:174:210c:34b0 with SMTP id
 y31-20020a056a208e1f00b00174210c34b0mr5042868pzj.0.1698440584747; 
 Fri, 27 Oct 2023 14:03:04 -0700 (PDT)
Received: from DESKTOPOU5BQRD ([2406:7400:56:42e5:6da4:e4fc:28ff:1350])
 by smtp.gmail.com with ESMTPSA id
 fb2-20020a056a002d8200b006930db1e6d1sm1799855pfb.203.2023.10.27.14.03.03
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Oct 2023 14:03:04 -0700 (PDT)
From: "Kristi Florence" <kristi.f@exposhowvisitor.com>
To: <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Lists.Linuxfoundation.Org
Date: Fri, 27 Oct 2023 16:03:01 -0500
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAEBWjqY46N1LtPvTJFk2bqDCgAAAGAAAAAAAAABAVo6mOOjdS7T70yRZNm6gRIAwAAEAAAAA@exposhowvisitor.com>
MIME-Version: 1.0
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 16.0
Importance: High
Thread-Index: AdoJGPhVHGPZrTJpRKer5O7WLVS3tQ==
Content-Language: en-in
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
Content-Type: multipart/mixed; boundary="===============6645590090217441632=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multipart message in MIME format.

--===============6645590090217441632==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_237A_01DA08EF.10ECEEE0"
Content-Language: en-in

This is a multipart message in MIME format.

------=_NextPart_000_237A_01DA08EF.10ECEEE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

=20

I just wanted to make sure you saw my last email and follow up again to =
see
if you have any updates regarding my email.

=20

Kindly let me know if you are interested in this.

=20

Thanks, and I look forward to hearing from you.

Kristi

  _____ =20

From: Kristi Florence=20
Sent: Thursday, October 26, 2023, 10:30 AM
To: linux-kernel-mentees@lists.linuxfoundation.org
<mailto:linux-kernel-mentees@lists.linuxfoundation.org>=20
Subject: Lists.Linuxfoundation.Org


Hi!



I=92m connecting to see if you would be interested in grabbing the 2023 =
SHPE
(Society of Hispanic Professional Engineers) National Convention =
Attendees
List.



Attendees are Mechanical Engineers, Computer Scientists, Computer =
Engineers,
Electrical Engineers, Civil Engineers, Industrial Engineers, =
Bioengineers &
Biomedical Engineers, Chemical Engineers, Aerospace, Aeronautical &
Astronautical Engineers, Environmental Engineers, Systems Engineering
Professionals, Materials Scientist Engineers, Software Engineers, =
Hispanic
Scientists, Mathematicians, and more!



Kindly review, and if you=92re interested, please reply to this email, =
and I
shall revert with pricing, counts, and other deliverables.



Regards,

Kristi Florence =96 Event Database Coordinator



If you do not wish to receive future emails from us, reply with =
=93End=94.




------=_NextPart_000_237A_01DA08EF.10ECEEE0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta name=3DGenerator =
content=3D"Microsoft Word 15 (filtered medium)"><!--[if =
!mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Cambria;
	panose-1:2 4 5 3 5 4 6 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
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
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-priority:1;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-IN =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>Hi,<o:p></o:p></spa=
n></p><p class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>I just wanted to =
make sure you saw my last email and follow up again to see if you have =
any updates regarding my email.<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>Kindly let me know =
if you are interested in this.<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>Thanks, and I look =
forward to hearing from you.<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>Kristi</span><span =
style=3D'font-family:"Cambria",serif'><o:p></o:p></span></p><div =
class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><span =
style=3D'font-family:"Cambria",serif'><hr size=3D2 width=3D"100%" =
align=3Dcenter></span></div><p class=3DMsoNoSpacing><b><span =
style=3D'font-family:"Cambria",serif'>From:</span></b><span =
style=3D'font-family:"Cambria",serif'> Kristi Florence <br><b>Sent:</b> =
Thursday, October 26, 2023, 10:30 AM<br><b>To:</b> <a =
href=3D"mailto:linux-kernel-mentees@lists.linuxfoundation.org">linux-kern=
el-mentees@lists.linuxfoundation.org</a><br><b>Subject:</b> =
Lists.Linuxfoundation.Org<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-family:"Cambria",serif'><br><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Hi!<br><br> <br><br>I&#146;m connecting to see =
if you would be interested in grabbing the 2023 SHPE (Society of =
Hispanic Professional Engineers) National Convention Attendees =
List.<br><br> <br><br>Attendees are Mechanical Engineers, Computer =
Scientists, Computer Engineers, Electrical Engineers, Civil Engineers, =
Industrial Engineers, Bioengineers & Biomedical Engineers, Chemical =
Engineers, Aerospace, Aeronautical & Astronautical Engineers, =
Environmental Engineers, Systems Engineering Professionals, Materials =
Scientist Engineers, Software Engineers, Hispanic Scientists, =
Mathematicians, and more!<br><br> <br><br>Kindly review, and if =
you&#146;re interested, please reply to this email, and I shall revert =
with pricing, counts, and other deliverables.<br><br> =
<br><br>Regards,<br><br>Kristi Florence &#150; Event Database =
Coordinator<br><br> <br><br>If you do not wish to receive future emails =
from us, reply with &#147;End&#148;.<br><br></span></span><span =
style=3D'mso-fareast-language:EN-US'><o:p></o:p></span></p></div></body><=
/html>
------=_NextPart_000_237A_01DA08EF.10ECEEE0--


--===============6645590090217441632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6645590090217441632==--

