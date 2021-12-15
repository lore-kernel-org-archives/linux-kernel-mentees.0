Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457DBC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Dec 2021 06:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE549607D1;
	Wed, 15 Dec 2021 06:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9utVm4qUVbU; Wed, 15 Dec 2021 06:42:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 113BA60648;
	Wed, 15 Dec 2021 06:42:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E459EC002F;
	Wed, 15 Dec 2021 06:42:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87D77C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Dec 2021 06:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8484281750
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Dec 2021 06:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=nan-steel.co
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzXz2SqRGg4Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Dec 2021 06:42:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail0.nan-steel.co (unknown [159.65.205.112])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF191814B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Dec 2021 06:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=nan-steel.co;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 i=info@nan-steel.co;
 bh=m/mWyQmxdmVhKKG+lcJCsmKKjYaBdyHmh4gyLGu5ad8=;
 b=yOiCcvPYTTmpNktWH410bTMHFBmvnhNQImulHnAfRzhkXaIqJlNS5gIw8Iowrk7NOoceJn7nqB0H
 67cY6kxV9fYMYQ6Dl4TOmCQiATr/E02K8TKfK17KTzfLXvAor/ZYcg3FGSKAFA3qhbOfejTf+lPv
 szlBowUi+XdXYx0FxhM=
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: =?UTF-8?B?U2lwYXJpxZ8gU29yZ3VsYW1hICMxMTAzMjAxOQ==?=
Date: 15 Dec 2021 00:42:38 -0600
Message-ID: <20211215004238.D104685B4AB62817@nan-steel.co>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_0012_3080E909.0B366C52"
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
From: =?UTF-8?B?QWtpaGlybyDDh2lla28=?= via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: =?UTF-8?B?QWtpaGlybyDDh2lla28=?= <info@nan-steel.co>
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0012_3080E909.0B366C52
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;">
<p>Say&#305;n linux-kernel-mentees,</p><p>Sat&#305;n alma departman&#305;m =
size iki kez yazd&#305; ancak sizden cevap alamad&#305;m.</p><p>Size bir ha=
t&#305;rlatma olarak tekrar yaz&#305;yorum.</p><p>L&uuml;tfen sipari&#351; =
i&ccedil;in ekteki sorguyu bulun ve fiyatlar&#305;n&#305;z&#305; en k&#305;=
sa s&uuml;rede yorumlay&#305;n.</p><p>Sayg&#305;lar&#305;m&#305;zla,<br><br=
>Akihiro &Ccedil;ieko<br><strong>PAZARLAMA D&#304;REKT&Ouml;R&Uuml;<br><br>=
<br>
<img width=3D"440" height=3D"60" style=3D"width: 278px; height: 71px;" src=
=3D"C:\Users\Administrator\Desktop\Weldalloy-Caplugs-logo.jpg"><br><br>ADDR=
ESS<br>9 General Macarthur Place,<br>Redbank, Queensland 4301, Australia<br=
>PHONE NUMBER<br>Tel: +61 7 3277 2300<br>EMAIL<br><a href=3D"mailto:sales@w=
eldalloy.com">sales@weldalloy.com</a></strong></p>


</body></html>
------=_NextPart_000_0012_3080E909.0B366C52
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

------=_NextPart_000_0012_3080E909.0B366C52--
