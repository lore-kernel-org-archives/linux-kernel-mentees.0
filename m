Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723C4C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 22:23:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36503206E9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 22:23:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="hf2g2+js";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="lpf8aldr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36503206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 019B12262F;
	Mon, 20 Jul 2020 22:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0afbf1DYCxz; Mon, 20 Jul 2020 22:23:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 44E7A20465;
	Mon, 20 Jul 2020 22:23:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3ACB4C0894;
	Mon, 20 Jul 2020 22:23:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0BA4C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 22:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CCD678835E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 22:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCE-S3eMC-7r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 22:23:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2486888389
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 22:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595283795; x=1626819795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KBq5TieBJ7Bge6Kciydx5wKad/vehBZAPCB+X9VKwrI=;
 b=hf2g2+jse452W57BTJJScCP4sSigfB0d7Iex8nLwalPwoF+AdbRWy12Q
 q9XYT8hrO87oLzsgRWI9K83s7jJ3Zw3TU0bg6iHMxwtimmQ0yjWgeW1/U
 MPAC/8kqmbzyJjd+DM9oETd+b/T+X01by2o/jUHKOGNWftXqs/Hkg9eN/
 zp09C+1EWw9cxU6tiTTqfEl2Y4htLYri3MDWP1IvaCU2EehUHpu5jk72V
 KmE4EsBDLRFpomtotqTakw1YoMBWtOV85WmqdoQgKo8QLqoa+q3WD8yXb
 sFfmHub3WHjfp2eS4XG28UFcg+pJpkF2qJuJXUMMLN1wnbNbQwEIAyWeU w==;
IronPort-SDR: qngjZkVhIEGACus5j99psBzgu3QdMCfLxYE00bOqwFkdTvzTA0CynyWsKni7HzUh1Z6ngzV6Iv
 E7d/QSsi29EZaf4PvqykAQCYt/diQ9fi+Kp1M+4pMiK42NP1N/6DmUB51Rnrc19qNPJjUuqj+C
 laTbxN4HZplF/mtlwIgbCopBKTvHY8Jx9F5BJ9ZH9Cdyod3NelZ4zE+Mz7LQg+1axE5gVlFkSp
 E4iiBQi734t291wnCV1W6OEsQVSegfFsqadLngqYe+uaYLO+k2WSMLdcX6+egbgUGtgbWsbcXj
 gIs=
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="88397410"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jul 2020 15:23:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 20 Jul 2020 15:23:13 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 20 Jul 2020 15:23:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvKMnNwgjYaH1sHmk4WQadPIMTXMRXWIOX+uUx3DYyVe88MSx6RPwHr48ZQ326SiwcfQQnlpj2am1eiH6OGvCrTFSw+bflhRPjIf4b2U2TqCiA59x0UoSljleJ4a3NR4fIoZxK++N8g28K2iIRKbMJD71E9cnrPXIdO49gahJkydfQCFjp9/44cwWFDazlC0IXty5r4PWieaPUxUVwHP722CM1Sv26At/2/iTA76HHumWycQooUfJCjJTBFrSbLrZzIvz19XGrRpb+G7GP6XOLNX9C57tVpWbFyXeWjgZrkmzWFeXJBCLhe2jD6po6Uw4Fm5QRfRcMgZ3KcKl59z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icEE2gecJX+QvQweDC3hpVqu8IL1yXK5J2ctKWqjdKE=;
 b=dohOVpf4h4U9epYedqAP5Qk2UM4Dv+63KKefm1AsVEzFDMY4184nZHEUKaHFwCXMTTMJ5nOV+W97RRSjSVTNeJ1xwXByH09CAPVuwViIbzm/6dbk6/2Y0/0TV78TYIhZ8w3nsEhE+URmn66fTYxMT7z7/jFQ+WfwMH2g4Z7MP7YS32FGwlQGH5F+Xsj/jieW7JifxrXamK6us0gAe9l3OKYFpacZWNrZt8Aa0OKIqpRaj7QE7mt350G2z5ZRQya5jTDg/ne0PEtJ5vMAgokWQcyJzeyQHyJNkCLrvd+P+9Flf24C29XqDF+lmwx482LHmWSP9ekZuN890fqIPUcgZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icEE2gecJX+QvQweDC3hpVqu8IL1yXK5J2ctKWqjdKE=;
 b=lpf8aldrOriecYVqJdBEFly/l7RMo1fzRlzsyRoOFU+yElpa11BSTX9JacZjRzaJd+jNMIh/OMmtPDrB6xWDCVx1xe98hVt7SYXCYi8RDt1T8HIGVz9xtI/S8a2PpF42xileIx5yyUqxACa3mknpUa6v68VdWf//TpvZ3YgLv7M=
Received: from SN6PR11MB2848.namprd11.prod.outlook.com (2603:10b6:805:5d::20)
 by SN6PR11MB3517.namprd11.prod.outlook.com (2603:10b6:805:dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24; Mon, 20 Jul
 2020 22:23:09 +0000
Received: from SN6PR11MB2848.namprd11.prod.outlook.com
 ([fe80::14d2:e9a7:be92:6dbb]) by SN6PR11MB2848.namprd11.prod.outlook.com
 ([fe80::14d2:e9a7:be92:6dbb%7]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 22:23:09 +0000
To: <vaibhavgupta40@gmail.com>, <helgaas@kernel.org>, <bhelgaas@google.com>,
 <bjorn@helgaas.com>, <vaibhav.varodek@gmail.com>, <aradford@gmail.com>,
 <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <aacraid@microsemi.com>,
 <hare@suse.com>, <linuxdrivers@attotech.com>, <john.garry@huawei.com>,
 <don.brace@microsemi.com>, <james.smart@broadcom.com>,
 <dick.kennedy@broadcom.com>, <kashyap.desai@broadcom.com>,
 <sumit.saxena@broadcom.com>, <shivasharan.srikanteshwara@broadcom.com>,
 <sathya.prakash@broadcom.com>, <sreekanth.reddy@broadcom.com>,
 <suganath-prabu.subramani@broadcom.com>, <jinpu.wang@cloud.ionos.com>
Thread-Topic: [PATCH v2 11/15] scsi: hpsa: use generic power management
Thread-Index: AQHWXpsPj+PmluvQUUS87R/oE7A5jakRCnCA
Date: Mon, 20 Jul 2020 22:23:09 +0000
Message-ID: <SN6PR11MB28485B659DDF20AEA09753A2E17B0@SN6PR11MB2848.namprd11.prod.outlook.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-12-vaibhavgupta40@gmail.com>
In-Reply-To: <20200720133427.454400-12-vaibhavgupta40@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [76.30.208.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 386e9487-c8d2-4f8d-6de9-08d82cfb7b9f
x-ms-traffictypediagnostic: SN6PR11MB3517:
x-microsoft-antispam-prvs: <SN6PR11MB351723490A15834C41B1FB66E17B0@SN6PR11MB3517.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J3m3rkoyqQOMFdgK8pHfpbJkXCZ2/K2atu7WX2Xld9r9QoCB4EkhdLs7MjxX6yGvwMzpJ/LGRmCRAop6sy6WqqLiObZvrErBp66dsY001rxXrU73CN0Mn4vhKtG0bOIAP0jwJvS5yJCIGYkQNbs9hbOWoxJMsK0iDmRGzxKkhhwPvqNYvtI0OCb5Zgmjq3Cu5A2tjEQrzec4P6J96FBNcXoxqbJtLVjGsTDA83cSfg3akx+vE9C7U+6h3uj5oHK/O/C574iLM52vOmAlAdRjAX4JcOITnWLI/clQbXaIiw3O34JIUlvv5+nzupQXMhbKq7SGBNBIWQosnRn2FBV3X9C6tKjou5ToBYmNL9dlsi46FRuCVrX/BmB5vjU23huvS2hyW3yjq2MNzRTmoWeDaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2848.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(396003)(376002)(39860400002)(136003)(71200400001)(54906003)(110136005)(33656002)(83380400001)(52536014)(2906002)(55016002)(9686003)(4326008)(478600001)(66446008)(64756008)(316002)(5660300002)(4744005)(8676002)(66476007)(66946007)(26005)(76116006)(66556008)(86362001)(7416002)(8936002)(7696005)(186003)(6506007)(41533002)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: TrMu1DgXAg3v06jxCnq91iHNUi9niVL0CXLvpEujIqDnWgapu3QA0+lPWUTgzYxV0mditOpnIzGSRgSxaAMBWH2lbHygPseVbfba4REfSyJTHsh9FTnoampt2Q6nQlspSGEw6kYLisBPd9vYw1eyfOCrrAVupmhPs8E5VGNohdUYScWRBO6CGJDoFxHHUR7cllK9tea6jeC33uBgpmR9awQQqBmNqv2sXiaGQ5LPZhZgr4Qr9h4TJaZtnHL9l+t4xMxvVi0McyA02z8JJCenfEmdwOYITvszacmoqGOhyE1BnQdCbmNthmtz0XqG+xSN4OrhoI4Di3LuoJCga3PkcU4SVB+FIVl275UALR2s7/XCLCTxEbG+H3RMn/1OiNZlr0QRf0HiX0+1dDwHGxpjCTer2JhCpb99SapHj5BhJb3kGnoIJ+8meq8KHGhaKxllf8l8v5u4ykhRZkgHXBzhMunPRMQXviEKY4bAyz54AEM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2848.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386e9487-c8d2-4f8d-6de9-08d82cfb7b9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 22:23:09.3335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZnJbVawbAQM4gztVRhNusFdDN0MDZ7dWeeqqvT1w8RbO7RuW8S0ooDyZ0RRDcNCIPm97S3U3IOR0/Ihjrgh8zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3517
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 11/15] scsi: hpsa: use generic
	power management
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
From: "Don.Brace--- via Linux-kernel-mentees"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Don.Brace@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Drivers using legacy PM have to manage PCI states and device's PM states themselves. They also need to take care of configuration registers.

With improved and powerful support of generic PM, PCI Core takes care of above mentioned, device-independent, jobs.

Change function parameter in both .suspend() and .resume() to "struct device*" type. The function body remains unchanged as it was empty.
Also, bind callbacks with "static const struct dev_pm_ops" variable.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Acked-by: Don Brace <don.brace@microsemi.com>
Compile-tested: no compile/sparse issues found.
Tested-by: Don Brace <don.brace@microsemi.com>
   (for hpsa driver)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
