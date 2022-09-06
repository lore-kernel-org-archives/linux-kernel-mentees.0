Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6384AC38145
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Sep 2022 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1FA340C3A;
	Tue,  6 Sep 2022 20:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1FA340C3A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=techviewdata-com.20210112.gappssmtp.com header.i=@techviewdata-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=UeYkgbnt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGehblVhD37l; Tue,  6 Sep 2022 20:06:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C42AA40169;
	Tue,  6 Sep 2022 20:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C42AA40169
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA537C0033;
	Tue,  6 Sep 2022 20:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0524BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Sep 2022 20:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E109860BC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Sep 2022 20:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E109860BC4
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=techviewdata-com.20210112.gappssmtp.com
 header.i=@techviewdata-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=UeYkgbnt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vD040kU0ZUrA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Sep 2022 20:06:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2E2760B61
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2E2760B61
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Sep 2022 20:06:06 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id 130so18455842ybw.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Sep 2022 13:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=techviewdata-com.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:disposition-notification-to:thread-index
 :mime-version:from:from:to:cc:subject:date;
 bh=nzgcZ4HbtvDXgfaV2LZjUTX07NbqzaYMDPcenNDrsLE=;
 b=UeYkgbnt066CbgeZgxH61NEWUZSUOA3bQXObsgUZiX+g+nqlqrAbsAImq03li79T7L
 Q4sSusoMZCa1fCIAVmoZNEwfZI0ZeeRmodzToEkqe69cpiShNyiiGMT8AUIiOYDqxW0F
 2dQUYTMFPI19XK8KwMWwo4rC+PllsR0776ezCgOOoMLiZuay0h4RdW+cZ79dts9VKa0o
 EiWLn+v+LNpn4+q1xPtPuv4hrOTySAKtzbtwx3xpAGa7LIyjK9PLVnvETKom3oKtLJZ2
 xAhNTCXkBoiNkMnfgx5LQV54jl+pZpfO8qIJznmTDTxEMoQbRvqBSgkYQIBPrRIPfICC
 5GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:disposition-notification-to:thread-index
 :mime-version:from:x-gm-message-state:from:to:cc:subject:date;
 bh=nzgcZ4HbtvDXgfaV2LZjUTX07NbqzaYMDPcenNDrsLE=;
 b=YaxJ073GHLmRCIk7HHPFnnm/bFf3sRTYDFPpZRZMjMtqe9SJJlD562DzKN7hNTX8w8
 +4ZoGF0dv8w2J1frkp96VnFAosKiQzNgL+um2puOVm6vEXinp07ugsAubSoIgQJonbYI
 1mnLAIZiAJRihZ7nCuKui5kBh5KMToyho4ubRfCtLaCVuvofmI0PbjpMukU3UZRCFJvf
 hnVQkeItp3j3pU6LJssr+DR6sIDPrwmxGWZScgKUKKwt8DPOdkXL0OcNRMPdI2IClm17
 vKwSjkSYeUe+JV6Om0Kv9G4/fIwIAunSwElkfrzr3SoNdGY6gTOm1wrCkzk4YoE/WkWf
 YRyQ==
X-Gm-Message-State: ACgBeo3RwoDC6qUhvEMo1k8Y8bSXg2NVErjyNKrz782zmnpxqywKvOBg
 2FJqG4xWivJloOtDTo73wZ4m8pYTXNN2/UYbuTddjA+opVZiso95
X-Google-Smtp-Source: AA6agR5nagNQOdf5W64LxW6l+mIaSLM1mzENzQywNNJJysnMPgGsHzMj6Ra6m+HeItgp58MvQO0m6fyy370mEqppxVg=
X-Received: by 2002:a25:e309:0:b0:695:864e:8009 with SMTP id
 z9-20020a25e309000000b00695864e8009mr263438ybd.309.1662494765354; Tue, 06 Sep
 2022 13:06:05 -0700 (PDT)
From: Casey Beeson <casey@techviewdata.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdjCKncVukPDEG29Q7GX6UmrophmlA==
Date: Tue, 6 Sep 2022 14:04:23 -0600
Message-ID: <22db1a2b4f1b086a5e2a6ae86a851ddd@mail.gmail.com>
Subject: Pulmonologists and Respiratory Therapists Contacts
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
Content-Type: multipart/mixed; boundary="===============3873196620277724456=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3873196620277724456==
Content-Type: multipart/alternative; boundary="000000000000ee133705e807b988"

--000000000000ee133705e807b988
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

--000000000000ee133705e807b988
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
span.EmailStyle18
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
ont-size:10.5pt;color:#2f5496">Hello,</span></p><p class=3D"MsoNormal" styl=
e=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=
=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">=C2=A0</span></p><p cla=
ss=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-heig=
ht:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">I =
was wondering if you would be interested in acquiring verified <b>Pulmonolo=
gists and</b> <b>Respiratory Therapists Contacts</b></span></p><p class=3D"=
MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:nor=
mal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">=C2=A0</=
span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0=
001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;co=
lor:#2f5496">Kindly let me know you are <b>Target geography,</b> so that we=
 can discuss on further details about available counts and cost.</span></p>=
<p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f54=
96">=C2=A0</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;marg=
in-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"font-si=
ze:10.5pt;color:#2f5496">Awaiting your response.</span></p><p class=3D"MsoN=
ormal" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"=
><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496">=C2=A0</span=
></p><p class=3D"MsoNormal" style=3D"margin-bottom:0cm;margin-bottom:.0001p=
t;line-height:normal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color:=
#2f5496">Regards,</span></p><p class=3D"MsoNormal" style=3D"margin-bottom:0=
cm;margin-bottom:.0001pt;line-height:normal"><span lang=3D"EN-US" style=3D"=
font-size:10.5pt;color:#2f5496">Casey Beeson</span></p><p class=3D"MsoNorma=
l" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><sp=
an lang=3D"EN-US" style=3D"font-size:10.5pt;color:#2f5496;background:white"=
>Manager =E2=80=93 Demand Generation</span></p><p class=3D"MsoNormal" style=
=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><span lang=
=3D"EN-US" style=3D"font-size:9.0pt">=C2=A0</span></p><p class=3D"MsoNormal=
" style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal"><spa=
n style=3D"font-size:9.0pt">To opt-out kindly reply with =E2=80=9Cnot inter=
ested=E2=80=9D in subject line</span></p></div></body></html>

--000000000000ee133705e807b988--

--===============3873196620277724456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3873196620277724456==--
