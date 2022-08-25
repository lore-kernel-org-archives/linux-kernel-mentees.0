Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD4CECAA2B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Aug 2022 19:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 346C983336;
	Thu, 25 Aug 2022 19:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346C983336
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=techviewdata-com.20210112.gappssmtp.com header.i=@techviewdata-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=5SkQMTLx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdsU3d9zG6JA; Thu, 25 Aug 2022 19:46:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 90582832AA;
	Thu, 25 Aug 2022 19:46:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90582832AA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B4B6C0033;
	Thu, 25 Aug 2022 19:46:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D183C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Aug 2022 19:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D206418EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Aug 2022 19:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D206418EF
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=techviewdata-com.20210112.gappssmtp.com
 header.i=@techviewdata-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=5SkQMTLx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39wNsm1HRtcU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Aug 2022 19:46:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38F74177B
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B38F74177B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Aug 2022 19:46:30 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3376851fe13so535641387b3.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Aug 2022 12:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=techviewdata-com.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:disposition-notification-to:thread-index
 :mime-version:from:from:to:cc;
 bh=5dYxdLL0t1kcSOOWLh8Yd/NZ+4rG1mX7BIJ03rviGxo=;
 b=5SkQMTLxiMkZOUNIbamjnaGui9sDZQW2GUhuHQHthJJ+oN4yuEvOr38SsBcZoMypNn
 hvUwgDg8fAzt3hkDIxBeTSjMGXkr/q4hwOq5SSUAi9fGEGciXYEY1Zt1xTvYkSH/1Ls9
 zzESrx2kCKvPxKZ1kRADc/NrdHVEIYkoi3U19OLhPZXaN1/QsEbf4E4AJV0iHtdLSZdp
 Cy7U47gbBjuJFbJ/A96lRavnqHsmWkyfRBlr/CgJQS0VsBel9LvzORE86KCibH/GNFlV
 IhGVMMh5uWK+ymfxJ1u09dtvSK8QuqJtjzMwwOmpR4c180JEQ43x75lwHUbXoZWTpxx5
 Tnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:disposition-notification-to:thread-index
 :mime-version:from:x-gm-message-state:from:to:cc;
 bh=5dYxdLL0t1kcSOOWLh8Yd/NZ+4rG1mX7BIJ03rviGxo=;
 b=EtksrcGsH+fEw/5t9F3TJ5fC2sO6Smg7vpzLRxurHmIxQHSNuvTl7+H+zjXEKTbGDh
 j/NwPBaSWmgatEwnvThfZyaspj4PawtNIk903gDEiUd6cP1oXTzStmO3gZgRY4kXK9c9
 7ubfu6Dr0iDPPkwqI+NtvAW5VMzHpRYIBSvIEKuDJofIfklHvmo4YAAuTNtJkxRmk43A
 CF3tfQkgRZyBRD8/sQ1sOmDKXrHfoKiKAaXQiHBp8QqBaz5i3Pn0C/JvtXUaA2ZyrCbP
 ueZjrchHbUEKv43hFmhR5jrUQnTqHX/a/3C1n9hDVLHusAZG49z0ICM+9G9OExvazp95
 sBCA==
X-Gm-Message-State: ACgBeo0E5dj/5sbfAvoU7tvG6471trlzy4ip28O8/a+nYBmPrO6vI6CE
 jy0BJDkApBrUlyRT/DgDHUqXKsCCv2L3aTp1VwQdjaHHbcOgUbQZ
X-Google-Smtp-Source: AA6agR5s+OIhATUD9jTXZjO+E0b6gfB8TYvLr+H6SoqUW78ZDWtW+yb003cdUqfA3NruQQjBp83BUXes1ci8/wobtRg=
X-Received: by 2002:a81:a552:0:b0:33d:b299:8748 with SMTP id
 v18-20020a81a552000000b0033db2998748mr5339765ywg.405.1661456789465; Thu, 25
 Aug 2022 12:46:29 -0700 (PDT)
From: Casey Beeson <casey@techviewdata.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adi4usWCyPA+ge3+Tsqyv63BpWLvUQ==
Date: Thu, 25 Aug 2022 13:46:27 -0600
Message-ID: <b33f051a13ec29ab4808b95f561a4cd5@mail.gmail.com>
Subject: Hyperbaric Oxygen Therapists Contacts
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
Content-Type: multipart/mixed; boundary="===============3359898860508572087=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3359898860508572087==
Content-Type: multipart/alternative; boundary="000000000000beeeb905e7160d1b"

--000000000000beeeb905e7160d1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

--000000000000beeeb905e7160d1b
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
span.EmailStyle18
	{mso-style-type:personal-compose;
	color:#2F5496;
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
ont-size:10.5pt;color:#2f5496">Hello,</span><span style=3D"mso-fareast-lang=
uage:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;ma=
rgin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-=
size:10.5pt;color:#2f5496">=C2=A0</span><span style=3D"mso-fareast-language=
:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin=
-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size=
:10.5pt;color:#2f5496">I was wondering if you would be interested in acquir=
ing verified <b>Hyperbaric Oxygen Therapists Contacts</b></span><span style=
=3D"mso-fareast-language:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"=
margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"E=
N-US" style=3D"font-size:10.5pt;color:#2f5496">=C2=A0</span><span style=3D"=
mso-fareast-language:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"marg=
in-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US=
" style=3D"font-size:10.5pt;color:#2f5496">Kindly let me know you are <b>Ta=
rget geography,</b> so that we can discuss on further details about availab=
le counts and cost.</span><span style=3D"mso-fareast-language:EN-IN"></span=
></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001p=
t;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:=
#2f5496">=C2=A0</span><span style=3D"mso-fareast-language:EN-IN"></span></p=
><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;li=
ne-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5=
496">Awaiting your response.</span><span style=3D"mso-fareast-language:EN-I=
N"></span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bott=
om:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5=
pt;color:#2f5496">=C2=A0</span><span style=3D"mso-fareast-language:EN-IN"><=
/span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.=
0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;c=
olor:#2f5496">Regards,</span><span style=3D"mso-fareast-language:EN-IN"></s=
pan></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.00=
01pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;col=
or:#2f5496">Casey Beeson</span><span style=3D"mso-fareast-language:EN-IN"><=
/span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.=
0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;c=
olor:#2f5496;background:white">Manager =E2=80=93 Demand Generation</span><s=
pan style=3D"mso-fareast-language:EN-IN"></span></p><p class=3D"MsoNormal" =
style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span =
lang=3D"EN-US" style=3D"font-size:9.0pt">=C2=A0</span><span style=3D"mso-fa=
reast-language:EN-IN"></span></p><p class=3D"MsoNormal" style=3D"margin-bot=
tom:0cm;margin-bottom:.0001pt;line-height:normal"><span style=3D"font-size:=
9.0pt">To opt-out kindly reply with =E2=80=9Cnot interested=E2=80=9D in sub=
ject line</span><span style=3D"mso-fareast-language:EN-IN"></span></p></div=
></body></html>

--000000000000beeeb905e7160d1b--

--===============3359898860508572087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3359898860508572087==--
