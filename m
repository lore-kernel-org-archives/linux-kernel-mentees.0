Return-Path: <SRS0=PP36=2C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A81C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Dec 2019 18:17:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 221C7214AF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Dec 2019 18:17:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="RjG14Yi+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 221C7214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hammerspace.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E71352502F;
	Thu, 12 Dec 2019 18:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4l0QchtIpDR3; Thu, 12 Dec 2019 18:17:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 660EB24E91;
	Thu, 12 Dec 2019 18:17:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 500BCC1796;
	Thu, 12 Dec 2019 18:17:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D10A7C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 18:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D721524F78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 18:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmkzBiqR9OCe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 18:17:40 +0000 (UTC)
X-Greylist: delayed 01:59:10 by SQLgrey-1.7.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2103.outbound.protection.outlook.com [40.107.92.103])
 by silver.osuosl.org (Postfix) with ESMTPS id 65B2024E91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 18:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOViPhT4CjhjNGmB/FR+PJ7oWwU5ER+2E0dWmiy04Ebg24rE44BQqeWgJdNsP7yBI+BVqQh3/V5lgtfRK8ilAarvci10mxAq2WxG0yoVN4hVRUrSVooOSf9jdY4LYP9s1OYmACk9Iw+l6FNpCfCG0EGo+DxMS9ug6Yzupem3Zp1zRFjqeHXQ51+QDTgG6RGdQn/4tr5OMKwAgKqt9BzmDPLZrnUcdvI4jP9r9+BE0xciuS3OaDvbJyhO7cYFyedrbLCIlhPAgVgk+dXjMjPZS30uzz9ZR2A4A7mVAAOEN+Oj7MwR2N+GLjkU6Sri9Xr3elmIDFhO62atJahLvdCZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXDFNXOMtyfqRJoqpL6MDqc7Wczvuf8vznYe0n4ZY+I=;
 b=J0NKy4NBS48x/HaGD0uqfRxF/kaDGwVyDfOYbYuEBL1bRK/QijTAC+8voUEZeLTzTi2OlIXRP/wOQxN4kTRgxJcYNkvJOWuP920beB7nCuu5u+rk4FVER5UU3NT38Z6Y2ygFu+FQDd1NwkVARQnhgRs+X02SZkDVycSfrgOmXijHxLrtQ+4l3kD6E8/iBJI/ae5cg+wLiPS3uOMl4SOp6ZmzIUwDLRBD9D5DdhKSElddER8g4QeOi6HNt1dPfJOO7NTtBFCf97zFmPG7C1H99f3IE/7azscASZp8Z01/JudzTivFtELf02FNt1hRy3isy/rxDod3v74hQfqfkLhqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXDFNXOMtyfqRJoqpL6MDqc7Wczvuf8vznYe0n4ZY+I=;
 b=RjG14Yi+YgeXTtGtBZWms36bB7AWuGX52AA26xjk/CBCIV9ttTyCZmaXWQaCodQfgFRvOdnud6muElqJctdKelmcjKIZJvI4StjhXznZls2dxi4Po1h5XErE0/IpA5FAllf13Ci5vunk7iBTtwoz7Hs3ONVzeMkh6Ees7zj6WLw=
Received: from DM5PR1301MB2108.namprd13.prod.outlook.com (10.174.186.34) by
 DM5PR1301MB2025.namprd13.prod.outlook.com (10.174.186.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.11; Thu, 12 Dec 2019 13:45:29 +0000
Received: from DM5PR1301MB2108.namprd13.prod.outlook.com
 ([fe80::2d23:b456:d67:f230]) by DM5PR1301MB2108.namprd13.prod.outlook.com
 ([fe80::2d23:b456:d67:f230%6]) with mapi id 15.20.2538.012; Thu, 12 Dec 2019
 13:45:29 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "paulmck@kernel.org" <paulmck@kernel.org>, "madhuparnabhowmik04@gmail.com"
 <madhuparnabhowmik04@gmail.com>
Thread-Topic: [PATCH] fs: nfs: dir.c: Fix sparse error
Thread-Index: AQHVrx1GhpnK5B8ObEWj1ayFx8ZCxae0HusAgABxqwCAAVZfAIAAn6KA
Date: Thu, 12 Dec 2019 13:45:29 +0000
Message-ID: <5614739335088d3e9baff43b752df04b84a8ad14.camel@hammerspace.com>
References: <201912110621.WJ6oENgf%lkp@intel.com>
 <20191211074842.21400-1-madhuparnabhowmik04@gmail.com>
 <20191212041406.GT2889@paulmck-ThinkPad-P72>
In-Reply-To: <20191212041406.GT2889@paulmck-ThinkPad-P72>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [68.40.189.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6730210-7e93-49c9-9ed5-08d77f098d10
x-ms-traffictypediagnostic: DM5PR1301MB2025:
x-microsoft-antispam-prvs: <DM5PR1301MB202520B52BADE4C55838DA93B8550@DM5PR1301MB2025.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39840400004)(376002)(366004)(396003)(136003)(346002)(189003)(199004)(110136005)(26005)(186003)(4744005)(36756003)(6512007)(2616005)(86362001)(5660300002)(71200400001)(508600001)(81166006)(64756008)(66556008)(66446008)(6506007)(6486002)(4001150100001)(966005)(54906003)(316002)(81156014)(76116006)(8676002)(2906002)(4326008)(66946007)(66476007)(91956017)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1301MB2025;
 H:DM5PR1301MB2108.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r3VN4tx5S580MpVCryx2gLWDwjCSz/N8JvtVFzcxoh7rq07GGy4oPZPJCL8yc+p8n8iBZeY9A7kaicK1i48gJvTgRyWcTFwMFcbAA21fXlkjueqALU0fvDSAIJGGH4nz+CnKAndPfOYGDQuBEuspVZVxh/3Lpd+1fDjkRtBzgeTzagyI91rDCxbym9bV6LavqosW/c4ZoRLw1LPSs1LCWRzGm213SWhFk8jaqBgMnqHmc0125fSQrCQEcOwiecSnLDbOfGL9PPOPIITk0H+M+qgh1q+U7M5VZdKy5wLm36xHvmMOO66MoDEGVWBcOuhVygK36Ks9WryAFpua/7IwIS5iiwB6YPvruh+8BHnYaAVQY2ptek6SGjgSfsOQIXDacCWH58CN9c3Yr5GDbAP7hFMh8b6r+h6Vx5GO5+jOZgSilmKFsYs4HUPfXCyUdNLK
x-ms-exchange-transport-forked: True
Content-ID: <E58661FD5D40E2428E504984389359BB@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6730210-7e93-49c9-9ed5-08d77f098d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 13:45:29.1725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X0vRXfpDnDQAJSpbB9qU38mIG+WGUXYUibI6BOit3hiz0hS4k6FsV0xFpe2YGOypuICz3zIVuVini8D2HLzQfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1301MB2025
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rcu@vger.kernel.org" <rcu@vger.kernel.org>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: nfs: dir.c: Fix sparse error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, 2019-12-11 at 20:14 -0800, Paul E. McKenney wrote:
> On Wed, Dec 11, 2019 at 01:18:42PM +0530, 
> madhuparnabhowmik04@gmail.com wrote:
> > This build error is because the macro list_tail_rcu() is
> > not yet present in the mainline kernel.
> > 
> > This patch is dependent on the patch : 
> > https://lore.kernel.org/linux-kernel-mentees/CAF65HP2SC89k9HJZfcLgeOMRPBKRyasCMiLo2gZgBKycjHuU6A@mail.gmail.com/T/#t
> 
> If the NFS folks are OK with it, I would be happy to take it in -rcu,
> where the list_tail_rcu() patch is currently located.
> 
> 							Thanx, Paul

That would be fine with me.

Cheers
  Trond

-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
