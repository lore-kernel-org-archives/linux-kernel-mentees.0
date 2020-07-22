Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F246CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 22:15:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADAD5205CB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 22:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="gamC+AK0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADAD5205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 81B1B233B8;
	Wed, 22 Jul 2020 22:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmN2+5Ir0wUz; Wed, 22 Jul 2020 22:15:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 680F022F22;
	Wed, 22 Jul 2020 22:15:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C4D3C004E;
	Wed, 22 Jul 2020 22:15:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E075AC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 22:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C5CFF86F53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 22:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Qakf70XQNGM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 22:15:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CDBBA86F37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 22:15:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tp8DQotAgsoFBw+tQnQubo2EQXSYTq84pAIq/QYhkYWu2fiNYEP9diNu1aB+aidBe5/NgeBsdoD2wCzsDlDh9TxhxGSvnI+/JAYoqulAwMElJ6Xi8irpjOc84U/F1bGCXbEiGQyJQfhZq1KGFuhi6DhwdYJTPXxrqZMS0BSqBcjFGvVoqNicypqcV8NBPJcO1uVPw3V39ljnxC2gaXpVaw+U1MbZLkFhJcWbNfxkvPNjz4gywIou/tPyOQ3GbJ7wOZfyeztiPFZlGKynwn5yM/IUx0tHSm+mwV7WTtkvVeHWLGR0wsDjRCJHI/bBnDpnOAktokm9Fhh61/fzUxitOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAMV4IQ2N8MFoBjq1fxTdiRbZ9pX5hBYulo3izQvEEs=;
 b=NfRrSQNX4KV+b0sPqwLJyOZkYlTnK3cct4xK7jmMY9B9hdwdG8h7/MUhnNmGQkm26TPOsnFwEhdvi5MDbPceTdDQwy85eTkcIfzjxuwL1B/neGjW6synan71BWGuHYDQrV31UVX8S51yVDQ+/O1gX7YIPapLHDigAULWhTO5sSu5GIB8q5DEz8GzQKNsrcUtQmAcDolzbbKfAGLsg+tv4XHlJAxIUKfPxlkXe5dM+6LiE/Jf8DqS9xa1KmLXdQuMgFn96dEp9gyGCe5OT7yDkWFvkbvRvQCRFegLyMveahapWCA+dVd9OQBoFLuvzrpuckmw94s09N6mZF4c+B9CKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAMV4IQ2N8MFoBjq1fxTdiRbZ9pX5hBYulo3izQvEEs=;
 b=gamC+AK0JMQBDmJSdzO7on0FUmlGBy1zhlTMkBiLIQ32/vv3xq+KRby8pquL91O0zoSyofvMZlCl4pJpxJtnrE5izaPBZqkl+lCxzhVKxcdQfK8GzyvXHHayY7beij6r+Sqz1LVXNyZtnYd/lvaZeHqCeob3zzIvsWM+YcK/XPs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2590.namprd12.prod.outlook.com (2603:10b6:802:2e::17)
 by SN1PR12MB2592.namprd12.prod.outlook.com (2603:10b6:802:24::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24; Wed, 22 Jul
 2020 18:40:16 +0000
Received: from SN1PR12MB2590.namprd12.prod.outlook.com
 ([fe80::c179:ec27:4476:8e05]) by SN1PR12MB2590.namprd12.prod.outlook.com
 ([fe80::c179:ec27:4476:8e05%7]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 18:40:16 +0000
Date: Wed, 22 Jul 2020 13:40:06 -0500
From: John Allen <john.allen@amd.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200722184006.GA976732@mojo.amd.com>
References: <95db9ba2-ffbb-ca92-6a70-1ee401920eed@amd.com>
 <20200722093057.98551-1-vaibhavgupta40@gmail.com>
Content-Disposition: inline
In-Reply-To: <20200722093057.98551-1-vaibhavgupta40@gmail.com>
X-ClientProxiedBy: SA9PR11CA0002.namprd11.prod.outlook.com
 (2603:10b6:806:6e::7) To SN1PR12MB2590.namprd12.prod.outlook.com
 (2603:10b6:802:2e::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mojo.amd.com (165.204.77.1) by
 SA9PR11CA0002.namprd11.prod.outlook.com (2603:10b6:806:6e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.19 via Frontend Transport; Wed, 22 Jul 2020 18:40:15 +0000
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1439e25b-6e23-4b0a-7ec6-08d82e6ead42
X-MS-TrafficTypeDiagnostic: SN1PR12MB2592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2592225EE6CA41E67952CDBC9A790@SN1PR12MB2592.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ShKx+JT1Qz6fGEY+/BQaT6PAC7yJ+VhjRIUr0yitcnkNUfL2PZvg6VLFOMuc+aG+UgkfG/UO+RKX8FV+0bD3F154+/y2gUvwAbn/JEmKOh318/nxI+g3LfuPntQ8AgpTX1D9CHi1TYToHLk6C+srWCvY3gnoliEqgNtZ3jqySYGWbhcZoUUPFniaDqwAVeersZf0x7huHJk89ge/lUfJ+3XhJiWZrizj1Ve9YbVm5qxSlXzz0pH4zZLzxRjcaUwk+z3cnT2IcYpSGSrOn4UME5snxrnWC+/9i2nGQUcobgtBUaXqOROOwlbez48m19A5Yb/g0tJGLFJJRj0mawQTJ9nI7F/m1FegWBWvKSq0qEjp4qau0z3c9LIAVs3Nh04B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2590.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(956004)(1076003)(54906003)(316002)(4326008)(2906002)(6916009)(16526019)(478600001)(86362001)(186003)(8676002)(33656002)(4744005)(66476007)(66556008)(55016002)(66946007)(5660300002)(8936002)(7416002)(44832011)(26005)(6666004)(7696005)(52116002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: bomdCZ1g5XptjciVFkNeY8Qckkt6Om3xhBDfqGUccJTYrfCi2mJg1IzlrS0Q4hOIuHTRwYLQJZQLlQQ9EPeAAe+SwPqA2z7OGrQxQu5QfZEB3i2C65HxwbRxw4SPV57wSB/xgkndGXkaRTqnp+y366BC/S/KN10r9BtApSr4b+W9F0Fh/d1Jgvi2bqzohyqAiljhhxPdbR/ZMw+YA0KoBFfpWKfs1EQBh+hZbHM2iFTjI3tb4iP7a0fhCMb86wVIi9J8ovIu0SB2Zk/ORHOq+Y6WrDltWmzGNVANWnJQG3BhV9mJYU7Qaz2g49ZRXXMK40r77ll6gm2NVccmWX734UXeey6zxfLT2cty5RS12mbeQyjzbFAJ5yCM0embbD9dwZA5kgHvIcJ16SEvTk6wKM596bHnlX8wxlOooQLV/jDUHJjfj6qGOkmU0EHFHmHMV8r90ZKmN2xSsk1fU9AvSLr8Y/CsrV4nd1jE8dj0wNQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1439e25b-6e23-4b0a-7ec6-08d82e6ead42
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2590.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 18:40:16.3360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gStoGkqsQFoq0bC3jMwZgBK30OMeJaNml+7bZ8JPX5sBUAnXp4peA2fAeFYGp9AeWojszcnI0ujRtuIOg9uYng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2592
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, linux-crypto@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] crypto: ccp: sp-pci: use
	generic power management
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

On Wed, Jul 22, 2020 at 03:00:58PM +0530, Vaibhav Gupta wrote:
> Drivers using legacy power management .suspen()/.resume() callbacks
> have to manage PCI states and device's PM states themselves. They also
> need to take care of standard configuration registers.
> 
> Switch to generic power management framework using a single
> "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> This also avoids the need for the driver to directly call most of the PCI
> helper functions and device power state control functions as through
> the generic framework, PCI Core takes care of the necessary operations,
> and drivers are required to do only device-specific jobs.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Acked-by: John Allen <john.allen@amd.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
