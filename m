Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8102AE95A62
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 17:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F3982F99;
	Sat,  7 Oct 2023 17:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3F3982F99
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=ibAhP68t
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJU7sLMHik3s; Sat,  7 Oct 2023 17:39:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8153682F14;
	Sat,  7 Oct 2023 17:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8153682F14
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64827C0039;
	Sat,  7 Oct 2023 17:39:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7584C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 17:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9129C40128
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 17:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9129C40128
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=ibAhP68t
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6VSnTSU6vqD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 17:39:06 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03olkn2082a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::82a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DB5A400CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 17:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DB5A400CE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTf0IfQ2WUeipmcOPJRKzFFjYdG4b8BBVUbMT8YAVsZJ0xkBAQpuYYWKKhEhVD6sAeaOvYlZchTBS+pao7C2buKQV40vvm0jhzEmYGRMWivYp1wrsM5MOVtRCPH6d1Anx1wsGX7P8siRxZXsjmUfMrQSPRap3f2tewE+FKMDHF/LI3UQhIkXcCPGoBRWA/MUgPZWn8M9tol67rXT+KbD3KwG4+RtuXxX7N6PpgesbKUTSYaFQh8iAdtZ0Pe8dfyBEuHohYgd0rw77W/erOPiuPlfUzA6+ArrGxPvsqEhhFaAe24OvecwFSLccXw/cTUUJztYVs3A37lMwZYTqZem5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12EvdEFmL6/zi3i+t0TrKA2F5mSMUmhk9+9EyCcMrOI=;
 b=Gx7AMJAufF72nqMiQCZv7I8vPHnRPFCcGQkicEbW6xefy1rrsWhkk8NAuZDGSMK4cPvZmTerwVEPWLLKawdkZLr9NSAoR7XyuxHcuQDzjvc2Q9ZNf9Is86G2a5SwJfRQwTQlY7lvd6aoTMgxmT0IMfhLaQuFIiPHWjJpLic7cVx6F9dWITnEh+jiSoyB/MFCaihEyextizqr++z8jAye03GN05Wu7euxiTO76bkDlHhtPuIZqFSmzM+qMmQjGaYYUcYM7gNLDwteFsfOwMGa7NN9GYPqP8xzNLUn+7mMI4mWXCOkJ1TTrn7BI/QYxzlD9RetePDzE4AdsTULsfAStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12EvdEFmL6/zi3i+t0TrKA2F5mSMUmhk9+9EyCcMrOI=;
 b=ibAhP68teFXLRmWTLoyEUP+JBOFgaYQ9fceWXvUoAoSqZvhUhPoqM5qKICGvBFhXOr2ywHHN7QJKdgJ6oasacbTTpYunpiv7mPF6OpgbBBWmjRS/jGXo9bM2Wdj3cPoor61KoILkISIupe6BpCy8/SFw2HOp/OLtz6rshe095AaWWKnkdd8lth4j2eZob257LGTS+ZmsxT7j62gFwTQQOVOnkeNy3wPS+ioLDSOkyFJHGEZ2V9tHqRVU3UMEdwaWoPG+9sP5A+S49jWgMzouj/pu+FZjc3V/KfouIF9sXY5s2xhj2rqDa/Kqp3Odamc9HEL86MaIF0tgccl6YgYnpw==
Received: from AM9P192MB1267.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3a7::7)
 by DU0P192MB1545.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:349::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Sat, 7 Oct
 2023 17:39:01 +0000
Received: from AM9P192MB1267.EURP192.PROD.OUTLOOK.COM
 ([fe80::628d:d050:3672:a203]) by AM9P192MB1267.EURP192.PROD.OUTLOOK.COM
 ([fe80::628d:d050:3672:a203%7]) with mapi id 15.20.6838.033; Sat, 7 Oct 2023
 17:39:01 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] Bluetooth: hci_conn_failed: Fixes memory leak
Thread-Topic: [PATCH] Bluetooth: hci_conn_failed: Fixes memory leak
Thread-Index: AQHZ+RLtW/b784HxfEKhHQ3+HoD6ELA+NFAAgABQIEk=
Date: Sat, 7 Oct 2023 17:39:01 +0000
Message-ID: <AM9P192MB1267C58F299DF86A5EEFE39EE8C8A@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
References: <AM9P192MB12672AA34A0480B522D23741E8C8A@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
 <2023100727-passive-untidy-8df4@gregkh>
In-Reply-To: <2023100727-passive-untidy-8df4@gregkh>
Accept-Language: pt-PT, en-US
Content-Language: pt-PT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [n8x/OrWKWPfmvfw9C0U334ucIVzprDl+]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P192MB1267:EE_|DU0P192MB1545:EE_
x-ms-office365-filtering-correlation-id: b6c4fe5f-394f-4dd2-04c7-08dbc75c4b00
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VWpuFI5iWnescrJMgvmLbOa2ibsaNPxwt5WGFedvAB1N7SkGrM2NkAmk6gEamm0N1qBnaH04PNbrzNNRe2MqHh+2/KkytYMIBI3qqwa2VYALR2aI6HmtV1AVSbFd1uB5aWtyWLBP8OHp6BDXOBjeKj0iscTDf1AgVJBigAHijF+66TVdKKVErSxHBlBhO5xDMQPiSJN77Ycxz0FkA/3A5j62as7bWcJCGDztmJRN1IcYnpwL3xgL/KD8tTUv5QMmEdgp24TFgPiklXk1KsVt638Glhpx2b/nywT8sxzmgmYCuBlmpaaTyzLG1EhTocmWmXudGY3neBlNj2mL+P/fN43KiCKIDvbkS5t7aFpxWq28lGbcU3RwVUKYU5NXmoZDEpxhFLvpbJeH0vRg0PVctig1fauxvUhkE4F2Yi6tKn4Def3lUGrpJKpK9KVug3d6Ug0FEiI2Xhxc9CanZ5XQLkKMR+WlAZVVJde7hLMGtk3npBHuF2eVKa59qxkt4JFD9fxGhT2DQR0ZGSum6KWKwO30TLBVGqOj0NfQ1/55INKgmYznL7R1dSpPwz4QjFFT
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3RS/kkQmcjeeUrYRXPL27oiuTefJAe0D0bXJkiVA4r9b1eV+ow7GKMC7CJMm?=
 =?us-ascii?Q?BdCRDRI3MT8T5PapvwJk4KhGlFMq+3g04MBDVL9iex5pM8Ko/ACNj+9bFYL4?=
 =?us-ascii?Q?DJ83PReH05a5d4w9g5gd+CziI5zOyIsNOGMBgx5QZK42NnuQPpBrqZZdVfG+?=
 =?us-ascii?Q?vHUglXACGPdoddRPWEkaMKf9LECb2odJYEbVCJa7OW3MLSPfimc7RVm9/eoY?=
 =?us-ascii?Q?oa4not24jyq6RkhXrHWsgoEIfXTS2JR/htQfDnUdesxbVUA3pljzzvxNG6PX?=
 =?us-ascii?Q?jt5RLGa7z2WnI20AIIvvGFbcJ5gFBsE4znlGOcoFJ7Jo7M7ZhLVTBEAdyylh?=
 =?us-ascii?Q?ft56PBQA+fl7XwV6us2SkTorlsP+V7tuGwW1I4yXHMex2jFxExPevQreKL13?=
 =?us-ascii?Q?SyQsWfhv8pIFJ4EIlUvWCcLhyXsQ8r2l6AzMdpRIF7dovdLkw8g/LilKf513?=
 =?us-ascii?Q?3a1RBVIpTHW0+ou2c1bWod7qsXCDGT/154Tpf8wPx15Y94TnsEdzC4IQQ7Ag?=
 =?us-ascii?Q?ZN8faj0H2Dl7aSukQYNVUCzmwRQ/iC2Tss0fQ04FWypVDf3Myn8ZmjvtJxSH?=
 =?us-ascii?Q?DNSv7zUskb36nkRBphWbi8S+uZ8K/udt0yg0vJnGW2rgoUTFqqXeBABsuYQ3?=
 =?us-ascii?Q?4m6ZJmPaJ/6Mhx8UXjsjxKWzzfo/LViX53ZLeQsbkuALKlwKEI6oG1n22SaJ?=
 =?us-ascii?Q?8tUERe8mlLEHTmvnROIws5SJZJDB6jpE+DdmYfywpO6q0PDsyhuzSj8rtPeq?=
 =?us-ascii?Q?mdnigr0kvXuAiww1BH0AOo2PNBpeL+lpSD32tky5EJsXSt/axvj/0kytjFAj?=
 =?us-ascii?Q?zLgeXYWT178nM2o3IWxwLZG+RYbZu2hG6CH33qHsEoZZdz0+iuIPen/cTVVg?=
 =?us-ascii?Q?+dhIg1ZkE5sjqOk90/XQTkpkKYWoB4vVYaK8uJ6n8Pa5yrQUUlhDWlo5boC5?=
 =?us-ascii?Q?156c/CfK1xpQ4p6mFDWt4Lmo/SvPGPsk7LirGXXvE0ww2ambXWfy5tDnFQG1?=
 =?us-ascii?Q?C0rsrSzB2CcG0YBEmoN9gSQDR3+h4qt4MTiDQmqHqZOkxjQPiJflHuOexeQ/?=
 =?us-ascii?Q?/KfxH0VRI9hI7fzEMbI1CWxSfoEjf6U/FdE9+9SIAleCRL2Un772g0HlodjG?=
 =?us-ascii?Q?es7jMadu6qUZpKlELoVFRMjGeCuEoYI2jFeA4asrk5KbZij5eiJW+dQe2eXA?=
 =?us-ascii?Q?fMG0EdRGqgB3+MTjHpq5ELjaxv0Y3WjmriJRbQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1267.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c4fe5f-394f-4dd2-04c7-08dbc75c4b00
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2023 17:39:01.2162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB1545
Cc: "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>,
 "marcel@holtmann.org" <marcel@holtmann.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
 "syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com"
 <syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
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
Content-Type: multipart/mixed; boundary="===============2784053585047837787=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2784053585047837787==
Content-Language: pt-PT
Content-Type: multipart/alternative;
	boundary="_000_AM9P192MB1267C58F299DF86A5EEFE39EE8C8AAM9P192MB1267EURP_"

--_000_AM9P192MB1267C58F299DF86A5EEFE39EE8C8AAM9P192MB1267EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Greg,
My apologies, I just noticed that my patch is based on the mainline tree. I=
'll re-submit one based on the Bluetooth tree and I'll ensure to include th=
e commit id that it's fixing.

Thanks,
Yuran Pereira
________________________________
De: Greg KH <gregkh@linuxfoundation.org>
Enviado: 7 de outubro de 2023 11:41
Para: Yuran Pereira <yuran.pereira@hotmail.com>
Cc: marcel@holtmann.org <marcel@holtmann.org>; johan.hedberg@gmail.com <joh=
an.hedberg@gmail.com>; linux-kernel@vger.kernel.org <linux-kernel@vger.kern=
el.org>; linux-bluetooth@vger.kernel.org <linux-bluetooth@vger.kernel.org>;=
 luiz.dentz@gmail.com <luiz.dentz@gmail.com>; syzbot+39ec16ff6cc18b1d066d@s=
yzkaller.appspotmail.com <syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail=
.com>; linux-kernel-mentees@lists.linuxfoundation.org <linux-kernel-mentees=
@lists.linuxfoundation.org>
Assunto: Re: [PATCH] Bluetooth: hci_conn_failed: Fixes memory leak

On Sat, Oct 07, 2023 at 05:09:01PM +0530, Yuran Pereira wrote:
> The hci_conn_failed() function currently calls hci_connect_cfm(), which
> indirectly leads to the allocation of an l2cap_conn struct in l2cap_conn_=
add().
> This operation results in a memory leak, as the l2cap_conn structure
> becomes unreferenced.
>
> To address this issue and prevent the memory leak, this patch modifies
> hci_conn_failed() to replace the call to hci_connect_cfm() with a
> call to hci_disconn_cfm().
>
> Reported-by: syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>  net/bluetooth/hci_conn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What commit id does this fix?

thanks,

greg k-h

--_000_AM9P192MB1267C58F299DF86A5EEFE39EE8C8AAM9P192MB1267EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Hello Greg,&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
My apologies, I just noticed that my patch is based on the mainline tree. I=
'll re-submit one based on the Bluetooth tree and I'll ensure to include th=
e commit id that it's fixing.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Yuran Pereira</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>De:</b> Greg KH &lt;gregkh@linu=
xfoundation.org&gt;<br>
<b>Enviado:</b> 7 de outubro de 2023 11:41<br>
<b>Para:</b> Yuran Pereira &lt;yuran.pereira@hotmail.com&gt;<br>
<b>Cc:</b> marcel@holtmann.org &lt;marcel@holtmann.org&gt;; johan.hedberg@g=
mail.com &lt;johan.hedberg@gmail.com&gt;; linux-kernel@vger.kernel.org &lt;=
linux-kernel@vger.kernel.org&gt;; linux-bluetooth@vger.kernel.org &lt;linux=
-bluetooth@vger.kernel.org&gt;; luiz.dentz@gmail.com &lt;luiz.dentz@gmail.c=
om&gt;;
 syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com &lt;syzbot+39ec16ff6=
cc18b1d066d@syzkaller.appspotmail.com&gt;; linux-kernel-mentees@lists.linux=
foundation.org &lt;linux-kernel-mentees@lists.linuxfoundation.org&gt;<br>
<b>Assunto:</b> Re: [PATCH] Bluetooth: hci_conn_failed: Fixes memory leak</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Sat, Oct 07, 2023 at 05:09:01PM +0530, Yuran Pe=
reira wrote:<br>
&gt; The hci_conn_failed() function currently calls hci_connect_cfm(), whic=
h<br>
&gt; indirectly leads to the allocation of an l2cap_conn struct in l2cap_co=
nn_add().<br>
&gt; This operation results in a memory leak, as the l2cap_conn structure<b=
r>
&gt; becomes unreferenced.<br>
&gt; <br>
&gt; To address this issue and prevent the memory leak, this patch modifies=
<br>
&gt; hci_conn_failed() to replace the call to hci_connect_cfm() with a<br>
&gt; call to hci_disconn_cfm().<br>
&gt; <br>
&gt; Reported-by: syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com<br>
&gt; Signed-off-by: Yuran Pereira &lt;yuran.pereira@hotmail.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; net/bluetooth/hci_conn.c | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
What commit id does this fix?<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM9P192MB1267C58F299DF86A5EEFE39EE8C8AAM9P192MB1267EURP_--

--===============2784053585047837787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2784053585047837787==--
