Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB28DC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 15:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3873540119;
	Mon, 15 Aug 2022 15:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3873540119
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MoGWcK2k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALLjwjbFECkK; Mon, 15 Aug 2022 15:18:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0825A40447;
	Mon, 15 Aug 2022 15:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0825A40447
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C56FBC0033;
	Mon, 15 Aug 2022 15:18:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C593BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55B61408E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55B61408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ypjot6N4edx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:18:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2746C40119
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2746C40119
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYVIgIkRt9dLglfSVOiwYt3mE8hoznE8et5GxV/pSFxDgR7luAgCoorj9aRlBAwaz2oq4sx05U3pY76zgi8z0q+sX2xdezmbzXWXPZwzyQz2wT0RQJR+4WS0MV35Qypsv6m7jkzQmzGjNNwYHEnmEc6C0urNr0hb7mIPM8Md1opgX3KGCdcHj0STzHK9Dj+e4Y19s1qg5dlxngV5OoRYy5kn7a05xzfbRd0B+eU4nm7EeFkNvHx8YvG60baRPpUS4EhRqpYQN1cXo2khISwGZD3x2cRzjAfLBQWKd3hIpkncovUP+EGdKql1Gp4yImXaO1djcOPV3X1h3TOreQITUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cn7EMQcyBNQmt/6N+rvZro/PQUXV3kPOSmbMlbB2fGk=;
 b=VftiLZ25b0nyuXdROK6DeHqF686r2+rdjgaXm1IV/ZJwgFQnm/yxWdKdkkkD5YYywoa2NMxWU2JT0aws/Lvu9psgt3vFv2lnNyfgYNkvLtrELCHEvtNrLnVuuDrtWy5EftgeC/2BF7yu+0OwmWElrOz2yDp0SF5McMghMXgB7dRMoi4Dyonb0tPa+VPxZuxdNqT0n/pRXcjJ1naet3GL+nHsdNH+VBwXczb2iA3xjJSpRvQfmxh0zbuIpfWgI9MXGZTkewpIZ/SZ7oovJ5bWVO1GFfdin50UXu0ORjVo80ujyakqK60QoPXrfP6FT9f4fBBS4hOMrSnCNeDn1MPRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn7EMQcyBNQmt/6N+rvZro/PQUXV3kPOSmbMlbB2fGk=;
 b=MoGWcK2kH2E5gDlQEHHOzWKGbOzBUVSaPvNy3p2qvRTzzcbBfr3eur/K/GMaSC7C94J/0tVeitRbCCG9O4fSvCbZjY3O6MpDjE4yASSZDRPI+lbAniXLzyhzSGUNo4XItEOLC0Tygv8T77kfnoLNazaiuOkEDTiFv22xtN+TAGw=
Received: from SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12)
 by BYAPR12MB3110.namprd12.prod.outlook.com (2603:10b6:a03:d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 15:17:57 +0000
Received: from SJ1PR12MB6194.namprd12.prod.outlook.com
 ([fe80::bc88:3db6:f931:98fc]) by SJ1PR12MB6194.namprd12.prod.outlook.com
 ([fe80::bc88:3db6:f931:98fc%5]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 15:17:57 +0000
To: Khalid Masum <khalid.masum.92@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: RE: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Thread-Topic: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Thread-Index: AQHYsHTWuO318jhUpE6H84biXg/lfq2v+0DggAAWYACAAADcQA==
Date: Mon, 15 Aug 2022 15:17:57 +0000
Message-ID: <SJ1PR12MB6194C83D51101ACD97B55F0295689@SJ1PR12MB6194.namprd12.prod.outlook.com>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
In-Reply-To: <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=473a2d11-e256-40f4-80bc-480dadcde3b9;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-15T15:14:23Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c661f133-1706-4d35-55fd-08da7ed1557b
x-ms-traffictypediagnostic: BYAPR12MB3110:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a1hBPteBWI4VyPQdQoXwHeY0gp58lpWCmRb94a9FAmzVN8n6ivYc2hibEOhMFNQrbnLEcQkPnXZryekPcvgEjY8+AjPt6uzkIAsAJwIz0wbKgzRgDaHTPabADoKBfDXxKt5mht7X3HOz16lz/9GcVotJY7oNDtu5ZFuXd/yxplmj4Qb9pgqoTEyXiCrS9wW8o7Q7FH/0Grxgpgrf/VNAcDIQIBDU0hIFrpxVhiEFpOifefoZ/zWfq/ttffJGfc18s4CDlEraYiH58uRdjkGtRomDsb/N+RJEhDbOBqkiaDFLPAvg0tWIVqIPSN8CzUbyMhNyvLaTDERNUO2YI3h5HYQGDnBJxTuLxWecY+7dRKNeM2qEGud1ohwHP/TWSh6cjnAsGYrAI59SmDm0QIsukX1NI2/fwvp7X3sGtVknPZ8VvG5QHES81XVMvUDicisnf57yQ2XdMTATy6PWGqeUnjdN4EiAL939vkqSzX3jHBzhcAT08L7oi9R8NHPWS37DYViwbrR60m/fMZKd445NPwcnrBrlWQtRB4we56ZVmpZIwXf3Ba3SkW3eo/VsTz7RYN3BWHMN8+L8QvO76Jr6Xubhfn7QBe3D13zAY1gK398pu95D9kmAM2JmUON63HGOaKp6Y8vsG/CXFoQblWJRucT81vsDzGShXUMsR7QgPNltSKQurBorUHj4hqXdFGrUy7dsIaChQCO1Zts8B3CXwZJ/3kEnXlvw/YBzmqaLrWzJQzIGK8RCDW36P7AfIsSxBEtpJmX6XOpGPrxWmR0zd7AHrgyTHXgae1R38PBULWc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR12MB6194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(4326008)(5660300002)(8676002)(83380400001)(54906003)(26005)(316002)(41300700001)(71200400001)(186003)(33656002)(52536014)(7696005)(64756008)(76116006)(66556008)(9686003)(8936002)(53546011)(66446008)(110136005)(6506007)(478600001)(66946007)(86362001)(66476007)(2906002)(122000001)(38100700002)(55016003)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akFLYVplaGhhc2hYZ2tqaDBnV1krb2swNDVRSVo5RHpzS3lVNEFiblZYaTMr?=
 =?utf-8?B?K29pNERrMmYwUFV2ZDhybnBJWTFORVN1NEZlTk8xMEpEZ0dBNjh3T0w4M3Vt?=
 =?utf-8?B?UUZLdW53QWMrTi9Dbk8rMnZuTUtiY000YWxPTmJtZkVjV2VCY3hhYlBFQ0Iv?=
 =?utf-8?B?QW1qaGpCMWtvejdyejVKakdCVlA2RnloeWtNNEt6WHZWSWZvOVYyN2xKR0w0?=
 =?utf-8?B?S1ZGL0tCK0w4Y2FOYXJ3aU9aNW10aHA0ZFk5RE5ZeUJrYlh2KzliTkpCODll?=
 =?utf-8?B?L3BBZkNNOTZMMVkrZ2hIdUo0ZWU0WkxQY3pWYWJ1Y2pIb1RSUEQrWmtPc3VD?=
 =?utf-8?B?akZaL285My9JblQ1NFVvelJxeGphNDZQNFpaUVduUnI4a2NZNVY5UE1tOVpi?=
 =?utf-8?B?dFVqN1dJNXRheDlzOVRhZEhrT0ZIWGE3dkZmM0orelk4cWZpV1d1ZVVLbzYw?=
 =?utf-8?B?aHkyNE8zNGRNUGlINDdlSkNPREp5UEJ5RE5ob3c4bDBrYUdmeE55T0ppczky?=
 =?utf-8?B?dWJ3dFFXSkZ5NXliS3VZcjNJMDlWdnhBWnFVcWtZZElrSnpjbFdkSHorZXNs?=
 =?utf-8?B?QmEzNVh4YytRY2tMaFRaaVJCK1NkQ0pQSWxkQkkyWnpaOUxHVEdGQ3JGN2I4?=
 =?utf-8?B?MmNPOWpqVjV1ZkFadEFQWjA4YktRV0oyVzBmdVBlR0JwUFZoaHBjcDJtUFZ6?=
 =?utf-8?B?WUVqbjBGb3podGpPeFZqalA2cm05cFgvT0RJZjRLSTZDckdKbzJYNGVIZWdF?=
 =?utf-8?B?VUhNM2pCUGdLbWdjdzRoR2J5V2Exd1I5MzJYNlNyNW1JUWowMXdaRWhtVGFS?=
 =?utf-8?B?cFdRZU1UWnNrSTIwSE5vOXRsVHl4dG9Ia2NoNTZXd3JMOFkzWlZJUU5tSkda?=
 =?utf-8?B?Y08rVUpLZHFiY3lDMjNSekFucEZ6SFgvU1ZzNDlsVktRQTRpQ2VvMzd1aEV3?=
 =?utf-8?B?b1EvL0hEU0NzTEx6SEZHQnUvank0aVdlNTRMbXZHNnh1Yi8zVE1YTFgwQmRW?=
 =?utf-8?B?eXFrRUZlbFhIQ3E5cjZMY0JobG5pZGl2QTRKWW9CSEdraDh1YVVwSXM5Qkl2?=
 =?utf-8?B?czRHcElKZ0tvQjJTR1BlcEZzS0wxU0ErOUtCNjZKb1Q0OGtwSytoMzMvVjNk?=
 =?utf-8?B?cC9nTXQwb3FSSFVUYThFWm1ST1FIQ25mdUNBUzNqTzdMTGpRUjRFQzZ6ZGpn?=
 =?utf-8?B?SWVIU0FYQWZ4RmJDVFhXMlJBeXkrZ09FejhPZjJpc0ZNZVVVRHB6bEpRWWoy?=
 =?utf-8?B?M3kyUGF6SzBEQktzNzRTVFVRSDRrem9aSGtKN01NRWJ4cDRQY2dQQU9YKzlT?=
 =?utf-8?B?VXFiOThIWC9GcmtaRHhFelpQdU9wb1JoWW9KNzBhTlVuQjBLbEl3YUNpdUEw?=
 =?utf-8?B?ajZuV0t6ZDErOGI2L2hlc0M0NzZjSE5DcXhBVVc3WnpMbE9KTitZL20vRTgz?=
 =?utf-8?B?Z0NOQ015K25WNEZSSUFqZmpTcHlIZVNyWVdqd2VrdmxiN0t5dVJkcXdxR1Yr?=
 =?utf-8?B?ZnNrajkrOEdIcGgwOVBtRkswaU1BT2crblRJb0s2c2w4SFA3b3FQYzNEREI4?=
 =?utf-8?B?VzdlRkRERGJJQ1BhY0JLSG9oQnR0ODJVZHBmdnNSN0ZoV3lUbVFLZHNGVTIy?=
 =?utf-8?B?KzBNbDhkMVZXRmpTZzZOMDlSQ3QzK3FacUV1RXI1L0lxeEJ3VjVRdzI3eno2?=
 =?utf-8?B?aUthbkZyd3d1TXhweG1OckJlai91eWtEUHhwdVlpN29yd1hoTEVDanZHSlpq?=
 =?utf-8?B?Skd2WHRmTVorZTE3K0lqM1J6M2NRRzRCS2dBVDAydEdUb0pKSlY5NWlkOWV2?=
 =?utf-8?B?QXlLU202enBHMzBsajdwZHlzL0laNlNNTTR1cDk0QmtuK2U1R085TlVvYW1Q?=
 =?utf-8?B?cmUwNUx4OHAwTnZQTldDK0JWUHRjMURQVmJlVzhMWGdaeE95elZxRVJZMXZG?=
 =?utf-8?B?TC96azRMRHI4MERjZDFUVmMrYmNLYmhmN3NNcVlQMzYwQjVBOEE2R2p2MmZr?=
 =?utf-8?B?V0JIWmlNbFBvUW4vQVU3V1NVZFZscSsvOFZDem1MWWh5aHdiVWExam1qb0xZ?=
 =?utf-8?B?VUx3S200Rmk5dzVDdmwzbEc2Z2l2YmNNVGRvR1FrbVh4eTAwckI4cE5WZ3dE?=
 =?utf-8?Q?r4os=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c661f133-1706-4d35-55fd-08da7ed1557b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 15:17:57.3288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0GKj57mHAynYdQ80VoQcsPxL4r0UqD1gbPnTrQKwdFVHEZjrgUlVuShjV5xGGBZQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3110
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
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
From: "Dong, Ruijing via Linux-kernel-mentees"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: "Dong, Ruijing" <Ruijing.Dong@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

[AMD Official Use Only - General]

If the condition was met and it came to execute vcn_4_0_stop_dpg_mode, then it would never have a chance to go for /*wait for vcn idle*/, isn't it?
I still didn't see obvious purpose of this change.

                if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
     ==>              r = vcn_v4_0_stop_dpg_mode(adev, i);
                         continue;
                 }

                 /* wait for vcn idle */
                 r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE, 0x7);

Thanks
Ruijing

-----Original Message-----
From: Khalid Masum <khalid.masum.92@gmail.com>
Sent: Monday, August 15, 2022 11:11 AM
To: Dong, Ruijing <Ruijing.Dong@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; linux-kernel-mentees@lists.linuxfoundation.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Zhu, James <James.Zhu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>; Wan Jiabing <wanjiabing@vivo.com>; Liu, Leo <Leo.Liu@amd.com>
Subject: Re: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in vcn_v4_0_stop

On 8/15/22 20:15, Dong, Ruijing wrote:
> [AMD Official Use Only - General]
>
> Sorry, which "r" value was overwritten?  I didn't see the point of making this change.
>
> Thanks
> Ruijing
>
> -----Original Message-----
> From: Khalid Masum <khalid.masum.92@gmail.com>
> Sent: Monday, August 15, 2022 3:01 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> linux-kernel@vger.kernel.org;
> linux-kernel-mentees@lists.linuxfoundation.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Zhu, James
> <James.Zhu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>; Dong, Ruijing
> <Ruijing.Dong@amd.com>; Wan Jiabing <wanjiabing@vivo.com>; Liu, Leo
> <Leo.Liu@amd.com>; Khalid Masum <khalid.masum.92@gmail.com>
> Subject: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment
> in vcn_v4_0_stop
>
> The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten before it can be used. Remove this assignment.
>
> Addresses-Coverity: 1504988 ("Unused value")
> Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index ca14c3ef742e..80b8a2c66b36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
>                  fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
>
>                  if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
> -                       r = vcn_v4_0_stop_dpg_mode(adev, i);
> +                       vcn_v4_0_stop_dpg_mode(adev, i);
>                          continue;
>                  }
>
> --
> 2.37.1
>

After value is overwritten soon right after the diff.

See:
drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c

static int vcn_v4_0_stop(struct amdgpu_device *adev) {
         volatile struct amdgpu_vcn4_fw_shared *fw_shared; ...

         for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
                 fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
                 fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;

                 if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
                         r = vcn_v4_0_stop_dpg_mode(adev, i);
                         continue;
                 }

                 /* wait for vcn idle */
                 r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE, 0x7);

Here, any value assigned to r is overwritten before it could be used. So the assignment in the true branch of the if statement here can be removed.

Thanks,
   -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
