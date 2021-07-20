Return-Path: <SRS0=NgQV=MM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0498C07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 05:37:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D9296113A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 05:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D9296113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 016CD60804;
	Tue, 20 Jul 2021 05:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRJoHLzJMj8p; Tue, 20 Jul 2021 05:37:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2589E60731;
	Tue, 20 Jul 2021 05:37:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF7C8C0010;
	Tue, 20 Jul 2021 05:37:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19622C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC3556076C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aofEfhFor5i7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:37:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::800])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3D7560731
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiUpf6ucQpVsoU+jk5CSZuXTXzZAtckdtIOJmToOFgCep2h7GSgV0gxlqZkmZGy7/SB9FWtC17fxCuM+NuM40YBAsT+E/6Izv/NRUYfeIzzLY3AlkidItL6NQOrMi951w63XLm86ljIJmk+eANzkvuIQ0FpOOE9FtsHh0+OCXzU/eRdyDuFL63AvxCyUwzOckQNguwMhJFrUjfkV/anoxrAPjwGaPrz0E1bXOlENtzs3CCELVumA5/yOCK+To5vuOsUMB/tGoH+MyJRAaxBmOVScCiPL3R2FtQpb11Bc5Vyc7NZjnuycApO6aT20H+CcOd7wyrG/JsRRgL3fz6wqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8/T5j0wzKZL8Y0uGjI0BXM/DgL+gVAvSwIzdT5dF+k=;
 b=f120+1EqdV67PdTRuMrBsh/c48+NNGdbE7pbQEX3yzO+fSeUi5jKvN6jHYgxcCjKZP2Ifn8Y+eNxbXlC5eS1MW3Hez1uyGUelKsi8tpnbUPLE9X/5ArQnAlpjg4claOSDQ8jccd6EnT5apTnyUTMLVwnY6t+7vuHQ48ODrPyRgeJHhy6CWDF/pBe7p3qyBcR9NO1Kb7x73Zrp/3euwR6ktyI53nWjXPZOrTuNJVJZeLIgJ4TArTnyUpv6viOsqmuf1h6NjmmVsueU8PR3lOYzPy+8ikOViw7LZtCN7kopxOgdFtb30bxuiCDxlOruRFpPXVolKmwccKLUj4Ymo7yww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8/T5j0wzKZL8Y0uGjI0BXM/DgL+gVAvSwIzdT5dF+k=;
 b=lGPyFSewGUqdKch32/L6jlBMBIUDatdFbcxPLjEEggb82L098XAN/PU7oT/04HcK73P81oOH+zYDy/q27uC+6fbeee5w0wiZICZlDBOg013feM+trQ8DsXM6e32ITnp45lOQBmvzhVXQavrsv9Lt0gqaofspFO+21wXJxzZIgEF3T5sSwCJM4ocNhU4WxS00ETLKJ/R+Z5abvRh0OWGZGKbSXmXLaLRYe7T7foXakN5R1RUeXzTPpaCqoibydWLr2l051ainAwrGRl8dpzS5mSNa0HdkUsduJnE8o/Mf9OSwuYoFtFhbY9yycQo/uczfvkK9R48NLuT9kvmAL25F1w==
Received: from BN8NAM04FT005.eop-NAM04.prod.protection.outlook.com
 (2a01:111:e400:7e85::52) by
 BN8NAM04HT055.eop-NAM04.prod.protection.outlook.com (2a01:111:e400:7e85::170)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 05:37:06 +0000
Received: from SN6PR07MB5456.namprd07.prod.outlook.com
 (2a01:111:e400:7e85::43) by BN8NAM04FT005.mail.protection.outlook.com
 (2a01:111:e400:7e85::408) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 05:37:06 +0000
Received: from SN6PR07MB5456.namprd07.prod.outlook.com
 ([fe80::5526:6ce:2a7c:ea4d]) by SN6PR07MB5456.namprd07.prod.outlook.com
 ([fe80::5526:6ce:2a7c:ea4d%7]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 05:37:05 +0000
From: Ameya Deshpande <ameyanrd@outlook.com>
To: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>
Subject: Linux Kernel: Checkpatch Documentation
Thread-Topic: Linux Kernel: Checkpatch Documentation
Thread-Index: AQHXfSUcI+WkvmuC4EiqXqVzL5ZqoQ==
Date: Tue, 20 Jul 2021 05:37:05 +0000
Message-ID: <SN6PR07MB54564D3A83E09F186DB1D3B3D5E29@SN6PR07MB5456.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:51482644C118450740C64ABA648F52B8E25CEEE79A182235A98564AE0B1E73AE;
 UpperCasedChecksum:E186E8AC9ED57E2E107A8843A267A454F39D02E070C35CEF7C2FDD61FF9E9F28;
 SizeAsReceived:6796; Count:41
x-tmn: [iRuEUE/5/cscgYR0tBEv4PH38YBQFGVoZn4n5p2l3wg=]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: ae571be8-9081-405b-ba78-08d94b4068ec
x-ms-traffictypediagnostic: BN8NAM04HT055:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xyinDxxXKK1QSKbwm1WuMOUVQnoc+Uo5SfmMoL/jEb70u+xJ5DKRgzhAgxTBgxmxccjay0aUwAnARJked7d61NYfKHaZuFDKAGjkCi0yA8qKwEd06OnorGn6X9HXnn5hrqs5h8g+GbTZfFBPiNPGL3tEXgG+Q8VpEB5/kRzeqgxaIJfBco6Myk05kjw9n/8b8ih2mx6mOk/gcQ+e2ZpJEi+f1hX1pvQ2mk3Gjh1CiK71OhYOuaJO3pg5FShYvXgOiIwLmO9X9bHXIuirLxQE1fdjFXcHtjGkFvyT+ezualnuETEiUaaK1SmgVbJdYHo/QZDVGUUmZ4mz3IZBRIyJf1W8Hu1e5mkwpCBFu5o9gUbzyC+HgwZt8rG5x0ZzuVhegiv3iB6TrB59pi/CmlkVXHPcnRFH2P5AEvbJ+QmhG/yOgUO9z2DfelMsmuCC+m/o
x-ms-exchange-antispam-messagedata: B/FyJJ5iDmMmakll+dRkSg7uDhFbkd6SbSrKMtJX8shZ6QgneUXv33PatfZc5SKOLEcONrnkgQzNOcUlAhLy/GxRQTWjdUJ22kRU1q169IbZa66myMVC9EE45lOg3u54O47npIcHNjUni4Axf2RQWA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM04FT005.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ae571be8-9081-405b-ba78-08d94b4068ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 05:37:05.9161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM04HT055
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
Content-Type: multipart/mixed; boundary="===============8242738736475160757=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8242738736475160757==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR07MB54564D3A83E09F186DB1D3B3D5E29SN6PR07MB5456namp_"

--_000_SN6PR07MB54564D3A83E09F186DB1D3B3D5E29SN6PR07MB5456namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Greeting!

My name is Ameya Deshpande, CSE undergraduate at NITK Surathkal.
I am an open-source enthusiast and have experience contributing to
open-source organizations like Wireshark and ns-3.

I have some experience working with Linux Kernel development (IPv6
networking), and always excited to learn more.

I am interested in the Checkpatch Documentation mentorship program
and I would like to work on the tasks for the mentee selection.

Thanks,
Ameya Deshpande

--_000_SN6PR07MB54564D3A83E09F186DB1D3B3D5E29SN6PR07MB5456namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Greeting!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
My name is Ameya Deshpande, CSE undergraduate at NITK Surathkal.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am an open-source enthusiast and have experience contributing to</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
open-source organizations like Wireshark and ns-3.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have some experience working with Linux Kernel development (IPv6</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
networking), and always excited to learn more.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am interested in the Checkpatch Documentation mentorship program</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
and I would like to work on the tasks for the mentee selection.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Ameya Deshpande<br>
</div>
</body>
</html>

--_000_SN6PR07MB54564D3A83E09F186DB1D3B3D5E29SN6PR07MB5456namp_--

--===============8242738736475160757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8242738736475160757==--
