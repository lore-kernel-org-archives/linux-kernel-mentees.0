Return-Path: <SRS0=PtQN=OQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6073C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Sep 2021 19:58:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9747960F9E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Sep 2021 19:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9747960F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F41B40227;
	Sun, 26 Sep 2021 19:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5x0nYFzQGOL; Sun, 26 Sep 2021 19:58:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 632B740109;
	Sun, 26 Sep 2021 19:58:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4538BC000F;
	Sun, 26 Sep 2021 19:58:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A0EAC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Sep 2021 19:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7BE740300
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Sep 2021 19:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=live.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dvss9vPQwXMT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Sep 2021 19:58:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn20808.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::808])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B44364029E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Sep 2021 19:58:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv8fFqp3pg6azUyKsvl2cARoEtqDLWeVqK36hqdGwBBdrHaVQfoRgjb1tgYRZ42KBJ5tenajNfSIVPrV8IjqvuCdFIBEY0lzJXkaebM826DbJEw7KtvZWjsBzvp9w2wVlm4k7K4qqh6nUQTFPG33TKv2I5V5zmN+1bavERhRB69ttQT0PR8gNxZr8OvPrsL09j4/HghimANJ81ppv3vrltZDS8vKf8H/SyL4/uPYIeCSF1V3w3qDiNvPr1HUjyGapeRYB94wdbjoFgnyB2t6y3AL+SwwtvBwIqf8O2R44XG3sDeHQzEhZ7SRLE8A7OEjEy7ATHTnPwQtYrSIvPMDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgPnvMf6OtEOOQqpvh1tbfYj4KHopL1lGQFxGfRO3N4=;
 b=lSlrW4yacohkT0bzAVjdIlTAyOGRtptUoSW44YLLjtxHTrcxhgdWg0DML8dx0ohi2h3+I96YZi5mHgjc+3JBIs2cZcRqGidRK5fT6TBJBpaTKJsBLEyJom9YSvbLKyRDRLTx9X/E3VX+NZJoK/U7hCvP4/Y4ug2+Mv96DQ8V6EJ9YspZ7U9ak7BAJprO8kbjO3sWw6Eh3RPCzERAyEXjRmuBC65T2Uncrld6jh2uIjJ0rFdshr86MmrmSETHBKJCNsGpbec0TKhuFWHGjQ7Su2eLvAm3D5ov6j4d6qYTb6M5ocHJ0oYN8XMi+pk8/1FXG7debLUKpFmAPkxZcxVkDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgPnvMf6OtEOOQqpvh1tbfYj4KHopL1lGQFxGfRO3N4=;
 b=ugLmmP78V+vIWBY2a+12IoBIdjcq0kZBOZaAezYQFY0bohMPEOTb5v78IaL9lYutR1BxQyn9MFB7kTkmEpXHjXqfaB3zZUWJ9dG1Ypg5SeaDY541HULdefdyAfQdN5ODwpldlMiiEbGycTiKxPA3Ix+wXIN2RsU8NXywpui+KWsN8l38dSB9C8lQhGl58k8qp+JyEfH2MPsja+rW1fpJI1H7fvUgf3S3hHeMZYaH5yD3HBFB6bzrxM9rbt+YtbYXKpRjwLHYAIxKpH+KNHPvM1ccWDp/UgF3fIo7c4cebnhYayghINZvVK3a2WO1zM6fNNXsy8ugtl6AB4sBAfc1Ew==
Received: from DM6PR05MB4697.namprd05.prod.outlook.com (2603:10b6:5:18::13) by
 DM6PR05MB4347.namprd05.prod.outlook.com (2603:10b6:5:96::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.10; Sun, 26 Sep 2021 19:58:13 +0000
Received: from DM6PR05MB4697.namprd05.prod.outlook.com
 ([fe80::4cbf:e707:d07b:89f6]) by DM6PR05MB4697.namprd05.prod.outlook.com
 ([fe80::4cbf:e707:d07b:89f6%6]) with mapi id 15.20.4566.012; Sun, 26 Sep 2021
 19:58:13 +0000
From: unlvsur unlvsur <unlvsur@live.com>
To: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: C++ Linux Kernel Module with C++20 concepts fast_io library
Thread-Topic: C++ Linux Kernel Module with C++20 concepts fast_io library
Thread-Index: AQHXsxBs2q6WD5SeIEKKIUL0/lDq2Q==
Date: Sun, 26 Sep 2021 19:58:13 +0000
Message-ID: <DM6PR05MB469733699016D89F268FB699D6A69@DM6PR05MB4697.namprd05.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [WmEB1zuSUUsOyD+b/ZwNBz/25eXY4Y0K]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d0830df-37c2-4285-2f59-08d98127f943
x-ms-traffictypediagnostic: DM6PR05MB4347:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zcSaRXWh8skd2jT09QQq8IFCViCiJdKouEZ3e4QXWctfoTKVKU3OKCKXINqmCYBeRpagCy/ei4GV80AlYuVqqgi0Gff2EEe8FNnO5uBCCNBxFoFaakDjIPC32sDekaQebP2UEsDUZxwPL8CEemQbwzHNgerKBBM1oljE7zh7QYbH/OfbVTacMd9TPzNggDkzBGMCZV6NnM4CVeod0MD+6GKVY7C7PeIop8EdzGtuRNEsM8/nv/sqrdgAwi3NXsaCZs2dc1lZiolEmV90+gxkCVvVt1lRKjatmyiNERng7+OGCZiO8AnZF9f33iE04PWDAJ2/pfW2L1DctNb5TwR5DY9woeFagApsDquMt3BeUzp5/alCzuJDuxeMdnZN4fj/hqBFvv2gMICdcJI4zboYek2DXGjRvdu0gSGAnfWE7WagvgBw99T898IuXKldAV0Bf8Cd8KHUKPacYh/eCGhmgid9SK68fPR314KA/yPbSTJCdqId7pdLXy7V5LxAXK1r
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 6dci2A6IXBuNc505OrMcYDcMI3kgUuErPvOfNgEqkVqEAF2iQqv2XCwYst9lYmHOXwI5jCsQlNG/OzKXZqtIUgBuxyP00nPbI4msmKemlVl8qG7Ku/w0MQrJPtZi7qYTWfgKoYd3gSroMLm/tDsPvA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-8-msonline-outlook-e6bda.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR05MB4697.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0830df-37c2-4285-2f59-08d98127f943
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2021 19:58:13.4283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB4347
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
Content-Type: multipart/mixed; boundary="===============1010303200123056344=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1010303200123056344==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR05MB469733699016D89F268FB699D6A69DM6PR05MB4697namp_"

--_000_DM6PR05MB469733699016D89F268FB699D6A69DM6PR05MB4697namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am here to insult Linux Kernel Losers
I create this just to fuck you.

https://youtu.be/Ahe3qjPe5FU
Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s


--_000_DM6PR05MB469733699016D89F268FB699D6A69DM6PR05MB4697namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I am here to insult Linux Kernel Losers</p>
<p class=3D"MsoNormal">I create this just to fuck you.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">https://youtu.be/Ahe3qjPe5FU</p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR05MB469733699016D89F268FB699D6A69DM6PR05MB4697namp_--

--===============1010303200123056344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1010303200123056344==--
