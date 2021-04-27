Return-Path: <SRS0=0WDs=JY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FBCC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 17:40:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B10613C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 17:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B10613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=psu.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF4F7606DB;
	Tue, 27 Apr 2021 17:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXZOeZx9mL_M; Tue, 27 Apr 2021 17:40:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04028606AF;
	Tue, 27 Apr 2021 17:40:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5640C0023;
	Tue, 27 Apr 2021 17:40:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEB4CC001A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 17:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4C19405EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 17:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=psu.edu
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-9eodo0odCv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 17:40:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2090.outbound.protection.outlook.com [40.107.94.90])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89308405EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 17:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuvZlPAcyPaZ8mEcRwuqdDLUik7gPdbxlsHH0SmgooNjOOn8kfkxfJS/jEbI/fSyaWzgVhRECMQWo2VKA728XOZ+2TsWP+7nE4hmpgtB+0kIqmQ6twgQuiey6P5Up9JJYj/vXn4tNYNKNjcXi/MBX2tOqYxSpHEL6xBHxi7fMUZSLqWuuPGXyJsAVDD8UnMRoNIP2ZAOiJNzTxOH5/0r/Jfyf034uA0VacxQg8wcOMaJWbM5E3mqxxUiPHFS/rkdINEqVJc0EsdS3rhAkQwRZOcG0V31oW1yAqemsidyrisvuJGkkcCtnR8hL1UvLISTBh2mtgAYTxWb9TCGfLQhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARWqapAcEwqopvMnft62M1KyaFZ1gJHz8NMjuFBqDyw=;
 b=XOqBLMV3KJgBajMtkO08lgI6huE8hhDg3HaiHmgB4qqfZ3KL5quBV3effspeOSwlDJ5EAiuvrE1ctGmUZerv2fs4t5BjLczSaw4jb3+apATTSMzlGGkn7q9YrZPZTrZvDvI+kSxL/Pkx6nKc7ZN/ZWmEEdBLfIG0e73mA3c1KSATtjnAtGqN/JTNlzTFBRIPrsR/ZziXs2QRoDbeuKKQXljnjjIetPcNAhA2hXRoXaLrGAMMm8mXorfKDU+LrDEmPOSMZdvNsMaNmpP9834bIRmUOPjjLEUMwiEXHHJ9qNwzSBCYJ3mBQdGzLQOG5BHmb/cM5VLWUyWD5knWtLlNYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=psu.edu; dmarc=pass action=none header.from=psu.edu; dkim=pass
 header.d=psu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=psu.edu; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARWqapAcEwqopvMnft62M1KyaFZ1gJHz8NMjuFBqDyw=;
 b=Uu5Kd+U+YozQjJHY9sxs6AANDcAkbForCozKGZp1BARFdUSH0h5osPmIx3UkDoAwxH1VZNBQsvBcXc66lcHCuhUcLnJZNyqC4Vu61NoxsS5QS37cGPuKTyJu1PXLVvM2+fxztxvTYS1PXVqFu2GzDt9D2KUo5hYnSnrClhLRiNs=
Received: from MN2PR02MB6317.namprd02.prod.outlook.com (2603:10b6:208:185::14)
 by BL0PR02MB4417.namprd02.prod.outlook.com (2603:10b6:208:45::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Tue, 27 Apr
 2021 17:40:52 +0000
Received: from MN2PR02MB6317.namprd02.prod.outlook.com
 ([fe80::7dec:2c56:2389:5fc3]) by MN2PR02MB6317.namprd02.prod.outlook.com
 ([fe80::7dec:2c56:2389:5fc3%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 17:40:52 +0000
From: "Wang, Haizhou" <hjw5074@psu.edu>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [Mining for Maintainers] Interest in Mentorship: Haizhou Wang
Thread-Topic: [Mining for Maintainers] Interest in Mentorship: Haizhou Wang
Thread-Index: AQHXO4w1BlpRYycShkCK7VOYqWdlpA==
Date: Tue, 27 Apr 2021 17:40:51 +0000
Message-ID: <MN2PR02MB63179046EE553E7EFA594F03A5419@MN2PR02MB6317.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=psu.edu;
x-originating-ip: [2601:98a:4000:5d0:c0a8:d3b3:49fe:dc41]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72d4e1e3-18d1-4d52-4183-08d909a39a24
x-ms-traffictypediagnostic: BL0PR02MB4417:
x-microsoft-antispam-prvs: <BL0PR02MB44176A343F0A1FDEBBE325BEA5419@BL0PR02MB4417.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ARYIwvyEEc6THaI3R8P9/6eVFmIJDmMLENpNYO4DLYrKM3Cw/+w5W+k/owgdIrMKCKBdVnGpE+Y/48lY7Z6ciDtO2RueaoJhsn97XVKoS2u7P9Mj49sSObwe69fafUoyiJvgs/jYtIND50m2GDd0uI7sh2xXgPNEHvL2tixVqOuTEXwqG+3D6uEULl8ydHLgiGpnpmoLrMtdeWltMlmoMVixsAFGq266KMa/vG6q3XokdFohJWpPiXcSyCxgHqaK2KD+KKayP7xZqRwgEKT56/y2KpBZhYTdf6EEOp5ebOpXAcSRInZ4Umnoak5wT9F8oASjx/tPpwN//3/97jrl2Jzivx+EZ3CgKK4rnW7YsUEjPykzFP4AryL+pgV+pUPV5ecd/o8QsCug9/q86Hu1Rt0JHmzR4bW03aBUs9rviejBUZ7lzRLw5XtRYPQ5AZkwthQa1tHISjPMoxmMb9hTR6ChWfDJXeV17kfEhsmqDwVMJvHRSaJDamD9TLvlFzknjoZCF20RH09UBubOUR3dkLeOOuWF1YnhmFHh3uJ+gFfWd+0hZlOHPa5dZBUvpqur7FBZf+7ihqiB+6mfYAgC2Gq1Ex0Y3oAoJOC0dn5yw1Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR02MB6317.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(6506007)(7696005)(75432002)(8676002)(38100700002)(52536014)(2906002)(4326008)(478600001)(76116006)(122000001)(316002)(66476007)(186003)(9686003)(55016002)(4744005)(786003)(83380400001)(6916009)(8936002)(5660300002)(66946007)(66556008)(71200400001)(66446008)(86362001)(64756008)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?h+TjXZcy1Lprm70yfI56kraVu+1CPBRxxXEdOner9x7UsWDrmvSln3L7nC?=
 =?iso-8859-1?Q?imJAhjSlqgNGRZxHNiY7AsLYhZLHJ1xitSEWgVJIqhph79yAWH+/HPGGk3?=
 =?iso-8859-1?Q?yev5q/+whBIELqP2Pud6gFzsRzbH65lSYgf+lwGKlPtpOHLn7sIOZr/qTX?=
 =?iso-8859-1?Q?40EvUBe75cYfpfMgBLvFrEBmICyyKI3uemRV2WEvKeQpQxerxiEBEPJL87?=
 =?iso-8859-1?Q?y/e1jHNiiJEaJ+HxXCxgKVlrgfO3vzrd+J7cpMOzVAhaw0604pHG3c/y+F?=
 =?iso-8859-1?Q?Ce5fheavqBwVLYfIvlJn5z2xANqCS5VWQk58kIPjXCq+REqhH1PkNZPKuV?=
 =?iso-8859-1?Q?NS4/9mBzNYvpkQNNfF/QOKqhsTKbhQs8eEnDk8dTLLo0+a+QHCeh9xSO3a?=
 =?iso-8859-1?Q?0sPfyxn99DjdqsIhSt4fql8C9wdLHVCfaC2B8smudCZKK+clvd58fQ7rMa?=
 =?iso-8859-1?Q?ElEcbQ0umQt92eZMUh5dO6Sq9rt70FnAZcQwTTZjcssbUqKI4wEqdL4wAz?=
 =?iso-8859-1?Q?XUL+WBJsAOgbtNn7nF053QqmxujEH/y9CWBD2BLlmrnnvfLk4tNs5K3yXd?=
 =?iso-8859-1?Q?JMAJ4OX0WuFV/QqvzRU+5XSBxRaXTdxUwG6pa3XeYd1SMu4LLg8sbek8B3?=
 =?iso-8859-1?Q?D24QYOKw1pXVp5I2C49bdA2+cdHHbgYafryc7pJ8cK6R7qhmQzIu8PijUi?=
 =?iso-8859-1?Q?JU7kvorM2+NuUL2O6kynsRMwI2eAxhMgBzu2EhGXZlgbqptmoziLTgWitl?=
 =?iso-8859-1?Q?0+K0/+oTxK0YUsEKXj0hl6CNOOHYwWlhS7/Rtn2DIT3sEyBwZUKL8dTGW4?=
 =?iso-8859-1?Q?IyBfJRBLN7/hnshtPRDHsWiuj5dgtXDRYQvPeQ/UD+3EjyvWcn+5P+qlXS?=
 =?iso-8859-1?Q?hC59gMi3TYFl6u/aitMmzoV8LVXkUE16V06g6MQD1hWb+TbPu9psc4GVkd?=
 =?iso-8859-1?Q?PsKBh4mxurhr2AXmdarER90IW0RORKCqRSXALhyhMBem5BqcFATrrvNcr+?=
 =?iso-8859-1?Q?yQDX2dA5iUP9eyyhCuiMfKfPve7X68wwFz4JAh3j1cSO0VB8ta4tny+oC6?=
 =?iso-8859-1?Q?8XoWNo9aT/YZI9zjir1rfx1YM0LDZYqqj4+Zhk4Tdl2EwcUilYv8m4Jpa5?=
 =?iso-8859-1?Q?/OJP4Mq9lovTrCH4jQ4Vqqymaj9dfmQBVZV24o0wvo/Eq+v2CCdhMX52ts?=
 =?iso-8859-1?Q?NXpxTay4qseV5Kd+Fjp6PZp7EW637nTy9m7iVtnlKM66EHaoy0Sfmf55sr?=
 =?iso-8859-1?Q?hBt9MA1z9mkl+DMqlhCODv2K3UK7z80nbCBfWmAxW4X6ocmaDDjn3QSlZe?=
 =?iso-8859-1?Q?YijyLlPT0Ixf914creEtKgWRvVrKkc4I4MLfCwZSZtPi702qkyZN8WaOD5?=
 =?iso-8859-1?Q?iLia2prShKR3Zx17KJKzCvsd99t4YiDURsW/kCm4bF/qgvccaKXG8=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: psu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB6317.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d4e1e3-18d1-4d52-4183-08d909a39a24
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 17:40:51.8643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7cf48d45-3ddb-4389-a9c1-c115526eb52e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GcsfdLk8Vde8whSVOOnRiN9NYv7+EZI+HHUT6igVFWBjL5cSIOFPHtQeNxwEP0s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4417
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Lukas,

This is Haizhou. I am interested in the mentorship: Mining for Maintainers. Please provide me with the required technical tasks for the mentee
selection.

I have submitted the submission request via lists.linuxfoundation.org. The registration through the official web page is already done last week. Let me know if you cannot find it.

Haizhou Wang
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
