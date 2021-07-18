Return-Path: <SRS0=+xMb=MK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06911C636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 17:06:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872FB61184
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 17:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872FB61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A90140150;
	Sun, 18 Jul 2021 17:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evucsmywBzXk; Sun, 18 Jul 2021 17:06:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 26FDE400D4;
	Sun, 18 Jul 2021 17:06:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3285C001A;
	Sun, 18 Jul 2021 17:06:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5158AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 17:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 399364047D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSovfV48N5E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 17:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5949C403CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 17:06:18 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id cu14so9839538pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:date:from:subject:thread-topic:message-id:to
 :content-transfer-encoding;
 bh=5iEsXvp/oVMitNo5482Mm65Ow0rr5dHUFCWvOvAqBdI=;
 b=bfKEcHxhz5qq451jGNH3o8o6H0JrHoVIypc+hh8UGRyQnSGCvDb7+vVku6rsvYBKvn
 EgHiPuFlJaUmysAEvyn4eSQBsGcYPJSjoEf+LTS+RJr9nG79AGKL0RN3UYRvVbJJ6gFH
 G2ORdQptIj3HTiLxQeYoW1i/+xyTKJytdpd0gZx1x1of6RWcn3me/0THpROzbxypdBvM
 j5sSl2tXFtsD9UAfRfrsRy/vuuqbA/PetjjzVvpVBuzXTzNM/doTqui4edgx0zqEDqNF
 eSMmrNmYt6IzFX4QBl2Ib7RYdCTKLFwqKhfTdJ7GZ0sPEmIx2HbAfPXiCgUkvscZ4lZB
 nArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :message-id:to:content-transfer-encoding;
 bh=5iEsXvp/oVMitNo5482Mm65Ow0rr5dHUFCWvOvAqBdI=;
 b=j56XBlO+gCoogfarGk9cf/NDYORq5eEmq0IS6zN8dc4CdNtCdR+FsVaQY1Q6T2J6E+
 D9fPC4xh54XWR8ebE+0MxoIr+6SFysdX/D9zsIuxb3gsJBg+LljKn3mg1p9ODSZkDYgd
 Xos4ix0MOu4BRMZ7pxQtMvWVV+1qysOp17Y2NfwNv7twpdQY1lNvXs2Sz6BQXARS8rIA
 hUuMIrXs/XCvmySgGvkKpUSe5iqnRjgdx9eq5p8sg9zSCTFGgtklts3Nr51m0nkPwk4X
 y1HEbuGtveAc/Wy4jm1zzE2jNLJRu4EH68iDYCPBriMHxQ5OZl5vDQD/EqYZEni69EP/
 z1RA==
X-Gm-Message-State: AOAM5330sZci+1IdcQYKP4M/2C9t9llpI2UqS6rFr1+DR/MKFdSrzA7d
 BoQ8AnzNmPAk7aeBVFWt0Pzp22lO6DOsKPch
X-Google-Smtp-Source: ABdhPJxZ0mhPmDSGu3zNT6zCy4IbrY0uR6voGyiNyjSAeSA163SYh1+0F7/JzyoRhw/OYOp5IyUxRA==
X-Received: by 2002:a17:902:ff13:b029:129:9a0b:c2dc with SMTP id
 f19-20020a170902ff13b02901299a0bc2dcmr16329697plj.45.1626627977411; 
 Sun, 18 Jul 2021 10:06:17 -0700 (PDT)
Received: from LAPTOP-8TDFACAP ([103.91.99.48])
 by smtp.gmail.com with ESMTPSA id y35sm8976204pfa.34.2021.07.18.10.06.15
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Jul 2021 10:06:17 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 18 Jul 2021 22:36:11 +0530
From: Ankit Oscar Xalxo <ankitoscar911@gmail.com>
Subject: Participation in the Mining Maintainers mentorship program
Thread-Topic: Participation in the Mining Maintainers mentorship program
Message-ID: <8CA90EC0-CD4D-4421-A8FB-BD67AEA043BA@hxcore.ol>
To: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="===============4482617625426622429=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4482617625426622429==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Roboto;
	panose-1:2 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-IN link=3Dblue vlink=3D"#954F72" style=3D=
'word-wrap:break-word'><div class=3DWordSection1><p class=3DMsoNormal>Greet=
ings,</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><sp=
an style=3D'font-size:9.5pt;font-family:Roboto;color:#212529;background:whi=
te'>I am interested in the Mining Maintainers mentorship program and I woul=
d like to work on the tasks for the mentee selection.<o:p></o:p></span></p>=
<p class=3DMsoNormal><span style=3D'font-size:9.5pt;font-family:Roboto;colo=
r:#212529;background:white'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNorma=
l><span style=3D'font-size:9.5pt;font-family:Roboto;color:#212529;backgroun=
d:white'>Thank you.<o:p></o:p></span></p><p class=3DMsoNormal><span style=
=3D'font-size:9.5pt;font-family:Roboto;color:#212529;background:white'><o:p=
>&nbsp;</o:p></span></p><p class=3DMsoNormal><span style=3D'font-size:9.5pt=
;font-family:Roboto;color:#212529;background:white'>Yours faithfully,<o:p><=
/o:p></span></p><p class=3DMsoNormal><span style=3D'font-size:9.5pt;font-fa=
mily:Roboto;color:#212529;background:white'>Ankit Oscar Xalxo.</span></p><p=
 class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Sent from <a h=
ref=3D"https://go.microsoft.com/fwlink/?LinkId=3D550986">Mail</a> for Windo=
ws 10</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>=


--===============4482617625426622429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4482617625426622429==--
