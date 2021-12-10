Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C673C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Dec 2021 07:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F08E361331;
	Fri, 10 Dec 2021 07:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5LBaX5EzEAo; Fri, 10 Dec 2021 07:09:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F1D7D6132C;
	Fri, 10 Dec 2021 07:09:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5A32C002F;
	Fri, 10 Dec 2021 07:09:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A37EDC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Dec 2021 07:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D4E58508D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Dec 2021 07:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=tekridagun.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNfHNipVjtix
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Dec 2021 07:09:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail0.tekridagun.com (unknown [161.35.237.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BD3985076
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Dec 2021 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default;
 d=tekridagun.com; 
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 i=info@tekridagun.com;
 bh=/rlj4MzvdYEOZJKcYsnPMgiSbCbxQfPHALI3g2Y1Yt0=;
 b=x+cJbe+IvNUJ3CUOKtgnDpJYPhnyONAm4ToHs8UVw2yQokZRJpR4/PE2FZl4Oaq/fwUEwDD1czLn
 lOoubW/7yvkSuVhQJLqADWwnwh7iDBgv3W3VAabbD0kIipadLSukq0975Ds+aBekXPHy+lAt2JAh
 osS3NBQ7CuS1TXCpjZ4=
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: =?UTF-8?B?U2lwYXJpxZ8gU29yZ3VsYW1hICMxMTAzMjAxOQ==?=
Date: 10 Dec 2021 02:09:35 -0500
Message-ID: <20211210020935.B3F720C6723B4342@tekridagun.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_0012_210AD8EE.22D1ECF6"
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
From: Immanuel Weghorst via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Immanuel Weghorst <info@tekridagun.com>
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0012_210AD8EE.22D1ECF6
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;"><p>Querida linux-kernel-mentees,</p><p>Sat&#=
305;n alma departman&#305;m size iki kez yazd&#305; ancak sizden cevap alam=
ad&#305;m.</p><p>Size bir hat&#305;rlatma olarak tekrar yaz&#305;yorum.</p>=
<p>L&uuml;tfen sipari&#351; i&ccedil;in ekteki sorguyu bulun ve fiyatlar&#3=
05;n&#305;z&#305; en k&#305;sa s&uuml;rede yorumlay&#305;n.</p><p>Sayg&#305=
;lar&#305;m&#305;zla,<br><br><strong>Immanuel Weghorst</strong><br><strong>=
MARKETING DIRECTOR<br><br></strong></p>
<h3 style=3D'margin: 0px; color: rgb(0, 0, 0); text-transform: none; line-h=
eight: 1.1; text-indent: 0px; letter-spacing: normal; font-family: Tahoma, =
"Lucida Grande", "Trebuchet MS", Verdana, Helvetica, sans-serif; font-size:=
 1.1em; font-style: normal; font-weight: 700; word-spacing: 0px; white-spac=
e: normal; position: relative; box-sizing: border-box; orphans: 2; widows: =
2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; fo=
nt-variant-caps: normal; -webkit-text-stroke-width:=20
0px; text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial;'><img width=3D"187" height=3D"143" style=3D"w=
idth: 274px; height: 143px;" src=3D"C:\Users\Administrator\Desktop\Magema_A=
_Rubix-Company_Logo.png"></h3>
<p style=3D'margin: 0px; color: rgb(0, 0, 0); text-transform: none; line-he=
ight: 1.1; text-indent: 0px; letter-spacing: normal; font-family: Tahoma, "=
Lucida Grande", "Trebuchet MS", Verdana, Helvetica, sans-serif; font-size: =
1.1em; font-style: normal; font-weight: 700; word-spacing: 0px; white-space=
: normal; position: relative; box-sizing: border-box; orphans: 2; widows: 2=
; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; fon=
t-variant-caps: normal; -webkit-text-stroke-width:=20
0px; text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial;'><br></p>
<p class=3D"bodytext" style=3D'margin: 0px 0px 25px; padding: 0px; border: =
0px currentColor; border-image: none; color: rgb(85, 85, 85); text-transfor=
m: none; text-indent: 0px; letter-spacing: normal; font-family: "Open Sans"=
, sans-serif; font-size: 15px; font-style: normal; font-weight: 400; word-s=
pacing: 0px; white-space: normal; position: relative; box-sizing: border-bo=
x !important; orphans: 2; widows: 2; font-variant-ligatures: normal; font-v=
ariant-caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;'><strong><font color=3D"#000000">Magema B.V. Rotte=
rdam</font></strong> &nbsp; <strong>&nbsp;<br style=3D"margin: 0px; padding=
: 0px; border: 0px currentColor; border-image: none; position: relative; bo=
x-sizing: border-box !important;">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong=
><span>&nbsp;</span>
&nbsp;&nbsp;<br style=3D"margin: 0px; padding: 0px; border: 0px currentColo=
r; border-image: none; position: relative; box-sizing: border-box !importan=
t;">Kiotoweg 715<br style=3D"margin: 0px; padding: 0px; border: 0px current=
Color; border-image: none; position: relative; box-sizing: border-box !impo=
rtant;">3047&nbsp;BG Rotterdam</p>
<p class=3D"bodytext" style=3D'margin: 0px 0px 25px; padding: 0px; border: =
0px currentColor; border-image: none; color: rgb(85, 85, 85); text-transfor=
m: none; text-indent: 0px; letter-spacing: normal; font-family: "Open Sans"=
, sans-serif; font-size: 15px; font-style: normal; font-weight: 400; word-s=
pacing: 0px; white-space: normal; position: relative; box-sizing: border-bo=
x !important; orphans: 2; widows: 2; font-variant-ligatures: normal; font-v=
ariant-caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;'>T (+31)(0)10-4153322<br style=3D"margin: 0px; pad=
ding: 0px; border: 0px currentColor; border-image: none; position: relative=
; box-sizing: border-box !important;">F (+31)(0)10-4159892</p>
<p class=3D"bodytext" style=3D'margin: 0px 0px 25px; padding: 0px; border: =
0px currentColor; border-image: none; color: rgb(85, 85, 85); text-transfor=
m: none; text-indent: 0px; letter-spacing: normal; font-family: "Open Sans"=
, sans-serif; font-size: 15px; font-style: normal; font-weight: 400; word-s=
pacing: 0px; white-space: normal; position: relative; box-sizing: border-bo=
x !important; orphans: 2; widows: 2; font-variant-ligatures: normal; font-v=
ariant-caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;'>E-mail:<span>&nbsp;</span><a style=3D"margin: 0px=
; padding: 0px; border: 0px currentColor; border-image: none; color: rgb(11=
4, 205, 244); text-decoration: none; position: relative; box-sizing: border=
-box !important;" href=3D"mailto:rotterdam@magema.com">rotterdam@magema.com=
</a></p>
<p class=3D"bodytext" style=3D'margin: 0px 0px 25px; padding: 0px; border: =
0px currentColor; border-image: none; color: rgb(85, 85, 85); text-transfor=
m: none; text-indent: 0px; letter-spacing: normal; font-family: "Open Sans"=
, sans-serif; font-size: 15px; font-style: normal; font-weight: 400; word-s=
pacing: 0px; white-space: normal; position: relative; box-sizing: border-bo=
x !important; orphans: 2; widows: 2; font-variant-ligatures: normal; font-v=
ariant-caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;'>KvK 28068151<br style=3D"margin: 0px; padding: 0p=
x; border: 0px currentColor; border-image: none; position: relative; box-si=
zing: border-box !important;">BTW NL 0056.71.450 B01&nbsp;<br><br>*********=
************************************** ************************************=
*********** *******<br><span style=3D"font-size: 13pt;"><font color=3D"#555=
555" style=3D"background-color: rgb(228, 193, 27);">
<strong style=3D"font-size: 14pt;">G&#304;ZL&#304;L&#304;K B&#304;LD&#304;R=
&#304;M&#304;</strong></font></span></p>
<p class=3D"bodytext" style=3D'margin: 0px 0px 25px; padding: 0px; border: =
0px currentColor; border-image: none; text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: "Open Sans", sans-serif; font-size:=
 15px; font-weight: 400; word-spacing: 0px; white-space: normal; position: =
relative; box-sizing: border-box !important; orphans: 2; widows: 2; font-va=
riant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-wid=
th: 0px; text-decoration-thickness: initial;=20
text-decoration-style: initial; text-decoration-color: initial;'><font colo=
r=3D"#000000"><em>Ki&#351;iye &ouml;zel bir &#351;ey de&#287;ildir. Puede c=
ontener informaci&oacute;n confidencial, patent veya yasal ayr&#305;cal&#30=
5;k.</em></font></p>
<p class=3D"bodytext" style=3D'margin: 0px 0px 25px; padding: 0px; border: =
0px currentColor; border-image: none; text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: "Open Sans", sans-serif; font-size:=
 15px; font-weight: 400; word-spacing: 0px; white-space: normal; position: =
relative; box-sizing: border-box !important; orphans: 2; widows: 2; font-va=
riant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-wid=
th: 0px; text-decoration-thickness: initial;=20
text-decoration-style: initial; text-decoration-color: initial;'><font colo=
r=3D"#000000"><em>Bu hatan&#305;n giderilmesi i&ccedil;in, bir <a href=3D"m=
ailto:email.rotterdam@magema.com"><font color=3D"#14d0eb">email.rotterdam@m=
agema.com</font></a></em><em> adresinden kopyalanabilir. Debe,</em> <em>
do&#287;rudan veya dolayl&#305; belge, usar, a&ccedil;&#305;klay&#305;c&#30=
5;, da&#287;&#305;t&#305;c&#305;, imprimir veya kopyalay&#305;c&#305; ningu=
na parte de este mensaje si no es el destinatario previsto. LI-TAK &Uuml;R&=
Uuml;NLER&#304; ve yedek par&ccedil;a hizmetleri, t&uuml;m g&uuml;nlerin en=
 iyi ileti&#351;im bilgilerini ve ileti&#351;im bilgilerini i&ccedil;erir.<=
/em></font></p>
<p class=3D"bodytext" style=3D'margin: 0px 0px 25px; padding: 0px; border: =
0px currentColor; border-image: none; text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: "Open Sans", sans-serif; font-size:=
 15px; font-weight: 400; word-spacing: 0px; white-space: normal; position: =
relative; box-sizing: border-box !important; orphans: 2; widows: 2; font-va=
riant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-wid=
th: 0px; text-decoration-thickness: initial;=20
text-decoration-style: initial; text-decoration-color: initial;'><font colo=
r=3D"#000000"><em>
LI-TAK &Uuml;R&Uuml;NLER&#304; hi&ccedil;bir es responsable de la bula&#351=
;may&#305;p completa y adecuada de la informaci&oacute;n contenida en esta =
comunicaci&oacute;n ni de cualquier retraso en su recepci&oacute;n. Este co=
rreo elektr&oacute;nico fue analizado para detekt&ouml;r&uuml; la presencia=
 de vir&uuml;s bilgilendirici. En el desafortunado caso de infecci&oacute;n=
, LI-TAK &Uuml;R&Uuml;NLER&#304; hi&ccedil;bir acepta ninguna responsabilid=
ad.</em></font></p>
<p class=3D"bodytext" style=3D'margin: 0px 0px 25px; padding: 0px; border: =
0px currentColor; border-image: none; text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: "Open Sans", sans-serif; font-size:=
 15px; font-weight: 400; word-spacing: 0px; white-space: normal; position: =
relative; box-sizing: border-box !important; orphans: 2; widows: 2; font-va=
riant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-wid=
th: 0px; text-decoration-thickness: initial;=20
text-decoration-style: initial; text-decoration-color: initial;'><font colo=
r=3D"#000000"><em>Bu konudaki g&ouml;r&uuml;&#351;lerin ifade edilmesi, bir=
eysel, bireysel, ba&#287;&#305;ms&#305;z, ba&#287;&#305;ms&#305;z, ba&#287;=
&#305;ms&#305;z, otomatik olarak onaylan&#305;r.<br><br><strong>***********=
************************************ **************************************=
********* *******</strong></em></font></p></body></html>
------=_NextPart_000_0012_210AD8EE.22D1ECF6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

------=_NextPart_000_0012_210AD8EE.22D1ECF6--
