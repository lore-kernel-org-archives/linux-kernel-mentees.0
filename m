Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836A8C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Nov 2023 04:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D552C70595;
	Thu,  2 Nov 2023 04:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D552C70595
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=t8nlI+Ld
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z81C6VDxoWwL; Thu,  2 Nov 2023 04:05:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BB90C70594;
	Thu,  2 Nov 2023 04:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB90C70594
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9740EC0072;
	Thu,  2 Nov 2023 04:05:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00A9EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC6D1432D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC6D1432D6
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=t8nlI+Ld
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cSCkC6HG5-jU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:05:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn2082d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::82d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFD3140004
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD3140004
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nt1y25YAi4ZfgE7j1y15auD6jH+Qcq9ExCZYpfMBCgqT5/nnaYi0cXNP3SElRXwePE6sHdN1WV4D/OGw5BrRVivu+g6zwxfdml9YgcDX5udHBmmKinMp1hKJb8TAm9SUNy4ZM9mqe6If3UsMuVNL6I4ivaTjRiEr6SmrinT0gb7B4dZep0vOE/tiICtDuNSfnbRgvPKTDujN+z/IX0D/QfSCnBLm1KiL6sWRYyEFo1uD6G/t3IlkIFfTIB8AK7kH2l/cr8sA6K8T1YuMYZVh1TpqsX1wio8y7V2/b5yi/Mr6Rwct+xw1eEccJesPXHY7yQh+WVyRCrAi7pLQDuteuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMVbKqMADLfMf1icJP4qup+y1w8FjR+5CwZTL54Y4kM=;
 b=IQ//XEAw6cyUe75YP2JI3wYqfhs1HuMBLR0cqApgkgrdc3cG6vAdzrnYhaK0VqaOD6YeUcTwOGBWB8eCqKad1oF8UWTUKs0uMx/xhaIxSdhTg47Aol7b+i+c3/6pm3o0I/vGg6SrySJRvJUTrVnr/Ez0lHOj+OdEoncR0AHVXOVp/fb/AA7JM6ahiAKeZzU3ggs18wALCtJYfJJKs7PfDOtqM8f+67Xi3UTPE6qNeKe9Tz0NTi86to16GfPsC+/5u6PBIkGMWcLlWG9LHT5tPSmenww3iTkIkC0P/+S1LCxQp/52AYepfW6sAgxEkS2uf7cP28FErEiRQURtiSTyeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMVbKqMADLfMf1icJP4qup+y1w8FjR+5CwZTL54Y4kM=;
 b=t8nlI+Ldk5UWUeGmDglyflG8dKRxhHAHZzYrLn6qOfGFujBu+covTVK5RQqaor6ZDH/AKB5HapLdcSR5OF85xLxUfintpTvdSLNiD/lq2kIQE2TQa/NYbliEN4zoW0sTF1dxygSIYgjxUsjHfRwLb7Ut77E5ipl4sbqueA8quVAMdq1vzrE+QmRCQkvlqBH9RZZ78bwjNVqcgngaxgx/kxx9mgxfMWDy5xU1ZOppy5Zz+dZ33ux2GHgSY+eWr0k3EdUnSd1VwifenovnBBYi/i/9DnNs9DHM34NC0BdZ4jdoXq4HQKgEyna8w0G782LHAUWB8CsBodNSsntE8vv2aA==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by GV1PR10MB5868.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:57::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 04:05:16 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 04:05:15 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au
Subject: [PATCH 0/7] crypto: Proper Initialization of `struct skcipher_walk`
 in x86 Glue Files
Date: Thu,  2 Nov 2023 09:34:08 +0530
Message-ID: <DB3PR10MB683562E7BD2DC73A48BEA3C8E8A6A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
X-TMN: [oTbtYbz4grX2QxaO31jX1x5jGv6xJsFS]
X-ClientProxiedBy: JNAP275CA0062.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::17)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231102040408.1555688-1-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|GV1PR10MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: f71d0f58-78dc-4b53-1b10-08dbdb58eafb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7NKK0S4/FHyRflwhpn/36u51DiIGa8TnPgvE3OmxG7KRFWMiPvb3VSqgSOUOSLVCHP4W0YwSZB3OYu2zIeQh/UkJBjen0Msh/6dzxGTINULg9gWACdoKvfAflN27/dPx/0zSTFhUwu9qSAD4yYqHqrLnmAerGkRqSdgTCe9/rZhnXHVdThLBDzAOefjVtW0wQlkpxqCl8imCRHdM7pR9Xw81BOviyMVkMeEe7oi6/0rofAPBaXhy//st33W8MMQ2xFK9p6rMHPjbu57OwXRzzn81AjoosNXMP7JD6KaBJWPYzveIkeBGGlRVEfX1yY/EDo/WkidJXj5fg+tdhxkqEbK6SUo29MofX7E00v0eMWUKVKzZv65SbkFGJTR+he0Lycp2YlLb/6fC0gLl/ixKnW9WQccxE7WVUmeLkSS2L9JyQneDK1tnNp4N6mp3g+xUJWHWeIsIToXoKpkLIK7nKJKu/q7n94MusfYhodEhGJsz2kArSvbO8O+ay9kCIv/fBuVThTsLdwWhjkzbdkwQqoePqNxXbAMadpQaZRhXTtUHI0b1HZHc5qES+UZgxaRUOflwOhs1W0rTTaJWtNBeibsJ5sbdGS87VFdnRL9Nt/Im5WQ9mHY1IylQp3gNJ5IR
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tqax6LljclpeDYz0zW1HMqCgZPKxrsbM4z7GN4HuIQu+7e8Px8xFs26+HlMG?=
 =?us-ascii?Q?0JcEQt1gENT0ihzSae51WDVKCqQkh6o8wzeKlX7YlO6ZqA+etK9lN7kVfyXi?=
 =?us-ascii?Q?UGLj8qzZmcsDdLq4NnRC91YrE4Wjw5rSw6ZTx48BOjkZb0SW8srz9mMXHBB2?=
 =?us-ascii?Q?Tx3enxnf3+9vrMgmpRfUnsVPHJ/muCJlyOzOSOCG5TlWiMXlax53z0hOXR86?=
 =?us-ascii?Q?+nfkyLfltsR/lFEkEfh+E2ED6foQz0GSNDqrFbkfETghhauHQfKLF79M8Fk+?=
 =?us-ascii?Q?UzOWs3hxgQeQLmE/msoC9v1aQGlQfal/LoBKAGkwgLdBBfhDtIwMLWsat5z6?=
 =?us-ascii?Q?kMReX9CqX4MNgu/cHQuKBNTz7Rn3cZa8rK3gILs4u3JbSoZ4o7eeirnCrlJ1?=
 =?us-ascii?Q?3eazhC8suQAgkRrkPXPQ2QxmZUmy5s2ZGH96LTg4ZTONF8qwhA+7aWKKKIaw?=
 =?us-ascii?Q?2+ggg10om6fUA19oiJvoF/RS6EUOXoA2//X0CSOZnY1beQsx8UohO8J3mu1+?=
 =?us-ascii?Q?aNZfaZLEZf1ci3tPy3tgQqqnmsauNeqZ96RFLKj3dQYbTMfwQ76QXo5sFP6S?=
 =?us-ascii?Q?17imDOOkScsQqtoVymGiWTNsX1l2QfqbaT4vvtB92btItco6aSA0wcxrk0NS?=
 =?us-ascii?Q?SaNtbGnV2sevlHCLnWjHyrMVNlwXgtmsKS4LAkefmURST8CSHS/Nx56BnJBe?=
 =?us-ascii?Q?B40K6NFhl9tFL8jRH9q0K/rTFAIlOoVwB5s1uMdyJU2pMJqU8Vqhd7kbr8B3?=
 =?us-ascii?Q?EAwHZ1he/844ake1NXeOIskzBJkvCpuGtNACULJR8cQYZaVQqoN3v9Tmz1H7?=
 =?us-ascii?Q?rCrnP00rjQIM6vuxE65ESb//GRr+uxTcOq2DdT4iimvn1fRym/dEJUMRV4dX?=
 =?us-ascii?Q?hM84bhwuiWNJ0IHxauEHYGPKWlgNwsY8VIhp+YiaIv1/p6J00k1Wzw92H9bQ?=
 =?us-ascii?Q?UMV0WxGnagHaieQjdT4u8ETTKuqSK3vQR6OxncMOPSyFb7Tw56MMPkRTXDNf?=
 =?us-ascii?Q?ZhW1EAQU+a//FSUjitwkYZuGcryzJVoP7NmnAN+q21hdrtcoZ9zCseCcU8Te?=
 =?us-ascii?Q?wPBTynA1uGIyLNleFwV/ll1CeV1lQHbgqka4PvIYNnOkY+dwP9l9QA3Nlwq0?=
 =?us-ascii?Q?lpizAX49wyPr5nWpqswkPMcbColKZz8+sevWelDeum+7EXwSNlgbbk6Wz5BP?=
 =?us-ascii?Q?O5oQfGLaY6WXlw/LDh8f5veZwQMRQi7VUIm7O3tQm5dxBF6Ebr/napaYLyk?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f71d0f58-78dc-4b53-1b10-08dbdb58eafb
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 04:05:15.6001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5868
Cc: x86@kernel.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
 mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

In multiple `*_encrypt`, `*_crypt`, `*_decrypt` functions within the x86/crypto
glue files, the `skcipher_walk` structs being used are not properly initialized
prior their usage which can lead to undefined behaviour if the `flags` field of
this structure were to contain junk values at the time of its usage.

This patch series ensures that instances of `struct skcipher_walk` are correctly
initialized across different x86/crypto glue files.

Yuran Pereira (7):
  crypto: Fixes uninitialized skcipher_walk use in sm4_aesni_avx_glue
  crypto: Fixes uninitialized skcipher_walk use in des3_ede_glue
  crypto: Fixes uninitialized skcipher_walk use in chacha_glue
  crypto: Fixes uninitialized skcipher_walk use in aesni-intel_glue
  crypto: Fixes uninitialized skcipher_walk use in aria_aesni_avx2_glue
  crypto: Fixes uninitialized skcipher_walk use in aria_aesni_avx_glue
  crypto: Fixes uninitialized skcipher_walk use in aria_gfni_avx512_glue

 arch/x86/crypto/aesni-intel_glue.c      | 12 ++++++++++++
 arch/x86/crypto/aria_aesni_avx2_glue.c  |  2 ++
 arch/x86/crypto/aria_aesni_avx_glue.c   |  2 ++
 arch/x86/crypto/aria_gfni_avx512_glue.c |  2 ++
 arch/x86/crypto/chacha_glue.c           |  2 ++
 arch/x86/crypto/des3_ede_glue.c         |  4 ++++
 arch/x86/crypto/sm4_aesni_avx_glue.c    |  7 +++++++
 7 files changed, 31 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
