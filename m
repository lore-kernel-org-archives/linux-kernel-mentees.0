Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CF8C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Dec 2021 06:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A945684B42;
	Fri, 17 Dec 2021 06:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNr__s0CJPZf; Fri, 17 Dec 2021 06:45:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D042683F90;
	Fri, 17 Dec 2021 06:45:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADED1C002F;
	Fri, 17 Dec 2021 06:45:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5125BC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Dec 2021 06:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DC4B84B42
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Dec 2021 06:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gaL94C5u8dQ3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Dec 2021 06:45:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail0.tech-marksales.com (unknown [161.35.230.166])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E526C83F90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Dec 2021 06:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default;
 d=tech-marksales.com; 
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 i=info@tech-marksales.com;
 bh=X2Mg03Q+xkSljdaU23ZXVCh9rRkWLNGM9+sBQnGL7A4=;
 b=t1woTQsG0iV2aIvw+anRpFGr9c6YO1XFnuBbGPJV0wahM+0YYIT3ihjuCulu4Shtu/+pi2tgEHsk
 qlt3xhlMZbHbxfzEMryP9TzKjbXVg4t3MVi2p1SW90aPtdNSiX+jVZ/nN4yDBXA3Je6Ji7pMvkSE
 UAQZVKV3Y/uOB7lPPIw=
From: "Eymen" <info@tech-marksales.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Sorgu EP40111671A
Date: 17 Dec 2021 00:35:41 -0600
Message-ID: <20211217003541.14DC556F5431683B@tech-marksales.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_0012_3F44CD51.79CE23E6"
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

This is a multi-part message in MIME format.

------=_NextPart_000_0012_3F44CD51.79CE23E6
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em; font-size: 14pt;"><div class=3D"v1pre" style=
=3D"margin: 0px; padding: 0px; font-family: monospace; font-size: 11pt;"><s=
pan style=3D"font-family: helvetica , arial , sans-serif;"><font face=3D"Co=
urier New"><div class=3D"v1pre" style=3D"margin: 0px; padding: 0px; font-fa=
mily: monospace; font-size: 11pt;"><span style=3D"font-family: helvetica , =
arial , sans-serif;"><span class=3D"matching-text-highlight"><span style=3D=
"font-family: helvetica , arial , sans-serif;">
<font face=3D"Courier New">Say&#305;n linux-kernel-mentees,<br><br></font><=
/span></span></span></div><div class=3D"v1pre" style=3D"margin: 0px; paddin=
g: 0px; font-family: monospace; font-size: 11pt;"><span style=3D"font-famil=
y: helvetica , arial , sans-serif;"><span class=3D"matching-text-highlight"=
><span style=3D"font-family: helvetica , arial , sans-serif;"><font face=3D=
"Courier New">Ekli yeni sipari&#351;imizi bulun</font></span></span></span>=
</div>
<div class=3D"v1pre" style=3D"margin: 0px; padding: 0px; font-family: monos=
pace; font-size: 11pt;"><span style=3D"font-family: helvetica , arial , san=
s-serif;"><span class=3D"matching-text-highlight"><span style=3D"font-famil=
y: helvetica , arial , sans-serif;"><font face=3D"Courier New">yard&#305;m =
eder misin l&uuml;tfen</font></span></span></span></div><div class=3D"v1pre=
" style=3D"margin: 0px; padding: 0px; font-family: monospace; font-size: 11=
pt;"><span style=3D"font-family: helvetica , arial , sans-serif;">
<span class=3D"matching-text-highlight"><span style=3D"font-family: helveti=
ca , arial , sans-serif;"><font face=3D"Courier New"><br>&#350;&uuml;kran</=
font></span></span></span></div><div class=3D"v1pre" style=3D"margin: 0px; =
padding: 0px; font-family: monospace; font-size: 11pt;"><br></div></font><d=
iv class=3D"v1pre" style=3D"margin: 0px; padding: 0px; font-family: monospa=
ce; font-size: 11pt;"></div></span><div class=3D"v1pre" style=3D"margin: 0p=
x; padding: 0px; font-family: monospace; font-size: 11pt;"></div>
</div><div class=3D"v1pre" style=3D"margin: 0px; padding: 0px; font-family:=
 monospace;"><span style=3D"font-family: georgia , palatino , serif;"><font=
 color=3D"#bc8043" face=3D"Courier New" style=3D"font-size: 11pt;"><strong =
style=3D"font-size: 13pt;">Eymen</strong></font></span><br><span style=3D"f=
ont-family: georgia , palatino , serif; font-size: 9pt;"><em><u><strong sty=
le=3D"font-size: 12pt;"><font color=3D"#7128d7">Ass Manager</font></strong>=
</u><br></em><strong style=3D"font-size: 11pt;">
<font style=3D"background-color: rgb(219, 42, 36);">Thermo Electric Instrum=
entation B.V.</font></strong><br><em>PO Box 85,<br>2740 AB Waddinxveen<br>T=
he Netherlands</em><br><strong>Tel:</strong> <strong><em>+31 85 760 7300</e=
m></strong><br><strong>Fax:</strong> <strong><em>+31 85 760 7301</em></stro=
ng><br><strong>Email</strong>:&nbsp;<span style=3D"color: rgb(0, 0, 255);">=

<a style=3D"color: rgb(0, 0, 255);" href=3D"mailto:info@te-instrumentation.=
com" target=3D"_blank" data-cke-pa-onclick=3D"parent.window.location.href=
=3D'mailto:info@te-instrumentation.com'; return false;" data-cke-saved-href=
=3D"mailto:info@te-instrumentation.com">info@te-instrumentation.com</a><br>=
</span><br><em>
This message is intended for the use of the person or organization to which=
 it was sent and may contain confidential information. If you received this=
 message by mistake, we apologize for the inconvenience and would appreciat=
e it if you could let us know and delete the message from your system. We w=
ould like to remind you that any unauthorized distribution, use and / or st=
orage of the data you received by mistake is considered a violation of the =
provisions of Legislative Decree No. 196/2067=20
"Law governing the protection of personal data". .</em></span></div><div cl=
ass=3D"v1pre" style=3D"margin: 0px; padding: 0px; font-family: monospace;">=
<br></div><div class=3D"v1pre" style=3D"margin: 0px; padding: 0px; font-fam=
ily: monospace;"><span style=3D'font-family: "arial black" , sans-serif;'><=
span style=3D"font-size: small;"><strong><br></strong></span></span></div><=
/body></html>
------=_NextPart_000_0012_3F44CD51.79CE23E6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

------=_NextPart_000_0012_3F44CD51.79CE23E6--
