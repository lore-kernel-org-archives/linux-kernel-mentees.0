Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0CCC27C48
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Oct 2023 00:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 011B9605AF;
	Sat, 28 Oct 2023 00:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 011B9605AF
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=gyTavy1Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiCWCKU49mg9; Sat, 28 Oct 2023 00:48:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3F9CE60AEF;
	Sat, 28 Oct 2023 00:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F9CE60AEF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF4EBC0071;
	Sat, 28 Oct 2023 00:48:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AE65C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 00:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CAC582256
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 00:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CAC582256
Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=gyTavy1Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZbDY5Jm9uz2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 00:48:29 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01olkn081b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::81b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A325382254
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 00:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A325382254
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWOiHtz1qLr9YKcgAjd3nDrgkkRgFQwwFOCQ0/Obnleh0MvOuRp+YWhe663rkko2dFtMzf4XHBu4Qr8vGJP7pOXPl79/dci3+6DPan+IqlINRxoLp2eS3XHCiQsQ7dj4nq4V/ZEDBpOyR7HTl1qfUN5ZDBh76oeFRuQbs2unoFpdPI432988rr6wjf/aGXtGvs+avb4gqjsdFPAeSwL/glPqT4L58zJDK0hiFkGtqIKlkgBdZYBEFPHGmMwshdNbw6j+OOLmGtdx18JODKx8S29QgQOnOl5ohatFwDyZg4x7+iGPg2/C/Y5Z+jwvBjPpJ7DxVSrJ+SlbioLhxkcdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijryH2cwV593iFdnbobPQmBt3dXyq7smFv2RtMU1E1k=;
 b=Uyo93Vc/eaY/AlJy7rdA9WmU3+Pax3U33Bqeewzq6o5EX82Hmx3ep31HdMlDuLAAICOYyZXTQYvRh7/X01bbcxV4ZWu/E3d/Jf0YkkKah6iZocKK98hqOE6jDFKMHgwCjU9mWu9dF/t81K6lZ8PKtqTBNCWOZM5eCXipz1gVwY09nlNGa0mXNbx5ngi99sVythsCrvZedz7/QQO4WrM9mXlQNkmNPmT+AG4VFRT6MIp+Cg6GQxitWA8nXTpQtx3It7qnJsJ4gdcDt/SKXE6vRcUpHoByKyMiaWmb+A3DeigYdsMTfMg+93rKpeZUhqBiZsYhQkpcp9BbIzLQFYgZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijryH2cwV593iFdnbobPQmBt3dXyq7smFv2RtMU1E1k=;
 b=gyTavy1Q/jnE4Jh99lt7o/yrcv4B9V+7hSVFa7UDcb5RXTehBYUnUe8fVyzKdoWgY5ST4AIUiXWJsnCixi6wVtEoYB4UqdUI/3DBmgz92gBvrLwK0eOuYoKhrNrbIn/j2yHrV/jiKcorM7HJhrA9i8MEyfv3pH+ZI+PMvMauF4MMaU1vrOb7BwpT/UK5RUq5Oje3HP27ki15VaKwVeZhtYZB/7t1wwoEjZgd2iNZyrS6NOf5xRMNs2uOaUXeFVB5ka3nYgmpiG9eb/h/gL4Rxzjz/EUzvlVUqJa9F9rm++P7UiBjDfRm+AidBcli4qPvis2617KW0ENKZO+e/91zxA==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by AM9PR10MB4069.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1ff::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.20; Sat, 28 Oct
 2023 00:48:25 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%7]) with mapi id 15.20.6933.024; Sat, 28 Oct 2023
 00:48:24 +0000
Date: Sat, 28 Oct 2023 06:18:15 +0530
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Message-ID: <DB3PR10MB6835311E66539604DD442CBBE8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
References: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <dc2242cd-6522-4073-b376-edc2a9abc3d9@amd.com>
 <PH8PR12MB727953EE85D593EF25650454F9DCA@PH8PR12MB7279.namprd12.prod.outlook.com>
 <39ab34ec-209d-4176-b271-1a02e2976497@amd.com>
Content-Disposition: inline
In-Reply-To: <39ab34ec-209d-4176-b271-1a02e2976497@amd.com>
X-TMN: [gK1RKZMcW/dThrt6g92boikMWOPWyY+H]
X-ClientProxiedBy: JNAP275CA0043.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::19)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231028004815.GC1301832@nmj-network>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|AM9PR10MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d9005c-cb18-42e1-0fd6-08dbd74f974e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Jeg0ZfJ2EErjrpHeGNySrxxCumlcZEyMNUHrKeVnlSIz6QFxU235asQqzrZx/d3WAorW9vQWG8snWobN2n5KcG3szhTQySbTInU/+Alb/c9TxsHD/uHgTM1jhkDejl1e9ANMeJXfBxbfrEk6sEaLx3ST72BNKPCJlfNZ2EBE5XGdX5AD/BmxZgHfzUAezr2p1jgkD6LwlujOvX7n0CjDwMsXNldm05UnSOoG2SU73QanDU7KWXTD6nha3Vk1jjkAHogCLw4y6bNqnL7nROev+kukI4hZ1B1O8bcCs9BnSIgkztVpTlo8jyqTU5+uAcfdlIAZw9CoqhJOiL+CP5BFBcDtoUUcQ+MGANXuDD1IXghrPT9xmyNXM4XyOXzMrWk29XSJIStmxFwkgxuBx3eYSGIQ1qHS8ghzcaC/EsESoWC/OxUErbHx7T70VvC2ZZVtOctlcV9O6o0WYwePWxgXa6kBzWzRwQdV/A7BOU+Y+rMVRTZ9qCUuJgnvECsZW/8K5hrAO9v8PQ93y6CnV+m2Mp/zkivoYWl0ATMVpWswZqOsQvfZYHurAIPMFcYY6xP
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3eTqngevDhFw7wFGaYdOeLtggo+nIAWADaBHxkZKu1Y3iHAkZE1nkkIenV?=
 =?iso-8859-1?Q?1vEycrQ23J5/grnxI8LDZraJ90vjC0mR8teioTkFUcUFd2UoDGnjIYh02k?=
 =?iso-8859-1?Q?UMuhrOXQbOlflAwc+COCGgH6Npqf41Li5/Yr0PVkktEihyE8IHPZAsDTDT?=
 =?iso-8859-1?Q?Uzox1Uk2ME9MG8qG2MQ5T8lQ/YJDAwIwws6HuSl9eH/uYCWqSXbxj9P1Ek?=
 =?iso-8859-1?Q?vWSEWJYmOguLRidF0klXTejWR1HtS7YX3iVGTc7bsWk4yoCVVzQMUo9RMm?=
 =?iso-8859-1?Q?IuyFP14bxOTMROEDiIK5V15wW7zdxgGMyKrGwCWywkQzSzbhOMJHvkAUMO?=
 =?iso-8859-1?Q?eu2NEaJcgaOzROGIRgbJ9bMqkAfEKq2H+SmLQfjFlsGT/jLB83PlbXbDP7?=
 =?iso-8859-1?Q?YiABIh3Y1cBB3vHHWxn8BTMJmTPLdCvvZoX2ztOjyZdaXLpHgPslzX9W+5?=
 =?iso-8859-1?Q?x+HCeBCbydOaQpCZejrTo4DkB+DKyQGE0+kRpfrxyv320DWwBTbhTA8ADr?=
 =?iso-8859-1?Q?tiMicagJcM1Nru6pZ0bB252qdwdqzl1ZhvAmoSAZ5dSK+rDGLsFTIsM5eI?=
 =?iso-8859-1?Q?XiSwaU83x92cSnH2lYvaKsQSLlPm3xU3DRJkpnwy1y/23bTeBNIf/gB2Qs?=
 =?iso-8859-1?Q?PrFsgNncXK26tb0I5pJSxrANbbIiQc76lNSZjN98isQj6I71oubeup6Jii?=
 =?iso-8859-1?Q?WpW1wJWgyIBAkYUfuOZF577GfDMMDLjOJHKCAQe95+aH/iusZvLcOaSJbN?=
 =?iso-8859-1?Q?cNm/GYUTkztvNy5lHTOtwYknffhsHAh7LGCJZl0MKKOpM5KFghmIhZdHuw?=
 =?iso-8859-1?Q?N4q/TmKBEIm9eSYUxI41xE7BAVi4BiKbwTCRGGG6FadsB3sDeNqnoMhPir?=
 =?iso-8859-1?Q?DADdkGeRmvHgfo5zMD+zdGaujb8m3U+SIfxPLRY3SIWdR+0j5rCvIwUAfT?=
 =?iso-8859-1?Q?u8P+xiIOXu+/jfF4Z7qD04mgDWgMMavESTU/7q/8M6HKtcYkhKYgEYFsVC?=
 =?iso-8859-1?Q?mOPgvP0zjyZefvD5lYtI6D1DrT+QistTLe1aftg6a2l4JIUHFT2HuNG1Zt?=
 =?iso-8859-1?Q?OO5KGvKZg6iXQG2wz9S1Tq/T0KcqNoqCpUnuCdQlBg+xIYMgMZGt9Sxay6?=
 =?iso-8859-1?Q?R8MGeQGPd1XVS1tglR/t6ZOJfNStWsZJmxEyWv13vbmOhOPLn0EA0kFxzC?=
 =?iso-8859-1?Q?ciBts26ejuo+ULOUPjgtwSr176uS+NN/R1hKlPH+4yrZEwuAqQRK+ojjtP?=
 =?iso-8859-1?Q?eDV0U1wsqD8/eGxZEBSm2gpx48gPU9LhGiWm2yAbw=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d9005c-cb18-42e1-0fd6-08dbd74f974e
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2023 00:48:24.8400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4069
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hello,
On Fri, Oct 27, 2023 at 11:57:45AM -0400, Hamza Mahfooz wrote:
> On 10/27/23 11:55, Lakha, Bhawanpreet wrote:
> > [AMD Official Use Only - General]
> > =

> > =

> > =

> > There was a consensus to use memset instead of {0}. I remember making
> > changes related to that previously.
> =

> Hm, seems like it's used rather consistently in the DM and in DC
> though.
> =

Have you decided which one should be used?

Should I submit a v2 patch using {0} instead of memset?


Yuran Pereira
> > =

> > Bhawan
> > =

> > ------------------------------------------------------------------------
> > *From:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
> > *Sent:* October 27, 2023 11:53 AM
> > *To:* Yuran Pereira <yuran.pereira@hotmail.com>; airlied@gmail.com
> > <airlied@gmail.com>
> > *Cc:* Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Lakha, Bhawanpreet
> > <Bhawanpreet.Lakha@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira,
> > Rodrigo <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org
> > <linux-kernel@vger.kernel.org>; amd-gfx@lists.freedesktop.org
> > <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org
> > <dri-devel@lists.freedesktop.org>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>;
> > linux-kernel-mentees@lists.linuxfoundation.org
> > <linux-kernel-mentees@lists.linuxfoundation.org>
> > *Subject:* Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
> > amdgpu_dm_setup_replay
> > On 10/26/23 17:25, Yuran Pereira wrote:
> > > Since `pr_config` is not initialized after its declaration, the
> > > following operations with `replay_enable_option` may be performed
> > > when `replay_enable_option` is holding junk values which could
> > > possibly lead to undefined behaviour
> > > =

> > > ```
> > > =A0=A0=A0=A0=A0 ...
> > > =A0=A0=A0=A0=A0 pr_config.replay_enable_option |=3D pr_enable_option_=
static_screen;
> > > =A0=A0=A0=A0=A0 ...
> > > =

> > > =A0=A0=A0=A0=A0 if (!pr_config.replay_timing_sync_supported)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 pr_config.replay_enable_option &=3D ~pr_e=
nable_option_general_ui;
> > > =A0=A0=A0=A0=A0 ...
> > > ```
> > > =

> > > This patch initializes `pr_config` after its declaration to ensure th=
at
> > > it doesn't contain junk data, and prevent any undefined behaviour
> > > =

> > > Addresses-Coverity-ID: 1544428 ("Uninitialized scalar variable")
> > > Fixes: dede1fea4460 ("drm/amd/display: Add Freesync Panel DM code")
> > > Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> > > ---
> > > =A0=A0 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 3 +=
++
> > > =A0=A0 1 file changed, 3 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c=
 b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> > > index 32d3086c4cb7..40526507f50b 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> > > @@ -23,6 +23,7 @@
> > > =A0=A0=A0 *
> > > =A0=A0=A0 */
> > > +#include <linux/string.h>
> > > =A0=A0 #include "amdgpu_dm_replay.h"
> > > =A0=A0 #include "dc.h"
> > > =A0=A0 #include "dm_helpers.h"
> > > @@ -74,6 +75,8 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, s=
truct amdgpu_dm_connector *ac
> > > =A0=A0=A0=A0=A0=A0=A0 struct replay_config pr_config;
> > =

> > I would prefer setting pr_config =3D {0};
> > =

> > > =A0=A0=A0=A0=A0=A0=A0 union replay_debug_flags *debug_flags =3D NULL;
> > > +=A0=A0=A0=A0 memset(&pr_config, 0, sizeof(pr_config));
> > > +
> > > =A0=A0=A0=A0=A0=A0=A0 // For eDP, if Replay is supported, return true=
 to skip checks
> > > =A0=A0=A0=A0=A0=A0=A0 if (link->replay_settings.config.replay_support=
ed)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return true;
> > -- =

> > Hamza
> > =

> -- =

> Hamza
> =

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
