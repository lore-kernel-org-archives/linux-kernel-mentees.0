Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8346E776FD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Oct 2023 19:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2671B4175B;
	Tue,  3 Oct 2023 19:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2671B4175B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=rH/Xwo9g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=GZRnziqu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7BFU9xfE9mD; Tue,  3 Oct 2023 19:16:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 70EE440AB6;
	Tue,  3 Oct 2023 19:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70EE440AB6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47ED1C0039;
	Tue,  3 Oct 2023 19:16:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C504BC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 19:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CE8960EF1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 19:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CE8960EF1
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=rH/Xwo9g; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=GZRnziqu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weKxYMPaVGk4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 19:16:23 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24F7860B9E
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 19:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F7860B9E
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 393I4JGT013147; Tue, 3 Oct 2023 19:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=PnFea/4emJci+uePO+JOlz2DjMtEPOk6D8bc7EhiBFI=;
 b=rH/Xwo9g00kwViRiTNX+9L/7AmXVmoAnnnSzOAMo08z6/uyj0h3sQs7gaj//ck0tVGuI
 OGJpQnmaFbFlFPLmqtP1PS0MoF0Jj1gecov9jpYY7V2MAKHxtfOMNEROtwJoFdrpQ1eA
 SueXRTGgAFW101mPmwN7Mmptn8etDpvH/Ibke5iOuXEim3uDt/453PBWFVCpkO9QZ4Y5
 KaShbJrytP3DOUgSQDtgpN+wj+sG58BLFGQJpWddI7xL30JxPX/yKRxPvupRkND1Nk+V
 i1wp0R3I3XXmicuB+evZXLuaT23xAkyaMclRMzQq/T0sYTsd/xj6dB1/TXif5ClNoAx0 eg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tea3edhjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Oct 2023 19:16:17 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 393IPDbW000378; Tue, 3 Oct 2023 19:16:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3tea46eqa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Oct 2023 19:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9a61DVDwkb5G+alO7mijMamLa4eRSJkX2DG4/Q/cyNWTv6RX/UnuheyydHoUgxbSLPE5jaB7tkU9qCvGK3egtbG1IDWpXGe/3C2f2sIS6pbu34x+ojDjXtm8JMoLJ0wSQo1aDtVpNeDuwWr0cOX83im05pA6/wFXUnMwb/gcIV7unGJjIX8X2p4QKBnwShyvav+3LaGVT8F/Fl44zlDavblNTpxwvsVZyWH16uTy8XmRIW8FLbU2HM592LnPg66xBWJmEIA8W+gx9NPNdITotPku4PLnmxraDLXCe+Bp4GPhL92wAr2f4vxAj3u9ER9pbi9MaducALpcLeF49OP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnFea/4emJci+uePO+JOlz2DjMtEPOk6D8bc7EhiBFI=;
 b=XlI+RE0pziDrRQbCYkOmc3bHGDtWlC3hCku+fNd++SZ7ZFZzD1t8D8xRPaxadQ4uZHzfJHaq9IRaj39PGHtEIKZTmUaQAp1hbtQQdPjbH90ACuWAPJddkPHvC29Aw/5PjXo0ngSuBlv4bq7HDKQGxj/GNiR2VrKvzvfucmietcK5aZ8vD6wx+g2zFv4aH9lTX8sx+ZMsZZ+EhkppkTLDT2WzixFsLRYQK26dUn8LSvZF/dhHVZiK/khFQw5CUvvabWj96c8BljR53zUKbf45t2XQeIepyBbXHnNlJuLHw1/FgnnboHXRDXORbodLY0lype0HHLt5wtjo5lP9PeZYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnFea/4emJci+uePO+JOlz2DjMtEPOk6D8bc7EhiBFI=;
 b=GZRnziqubuTVgiagDATlkg4id/xNorCXNCGm+mSUmCTRScAjnYeODIXZ6Ldv9vp1WeI8iqQXBKv45mfYjmwzMAwLjTl7n+09RcWrCqvGKVWzaVb6HbRJJXaRNtfAU2D/oAbVlxP0pKAKDJaE6KeOxB/nS8363mGgooY4YvU355g=
Received: from MW5PR10MB5738.namprd10.prod.outlook.com (2603:10b6:303:19b::14)
 by SJ0PR10MB5632.namprd10.prod.outlook.com (2603:10b6:a03:3df::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Tue, 3 Oct
 2023 19:16:14 +0000
Received: from MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::5943:cf66:5683:21be]) by MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::5943:cf66:5683:21be%4]) with mapi id 15.20.6792.024; Tue, 3 Oct 2023
 19:16:14 +0000
Message-ID: <423182d1-3d75-4a73-9011-da24658a40cc@oracle.com>
Date: Tue, 3 Oct 2023 14:16:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jfs : fs array-index-out-of-bounds in txCommit
Content-Language: en-US
To: Manas Ghandat <ghandatmanas@gmail.com>, shaggy@kernel.org
References: <20230919155542.4354-1-ghandatmanas@gmail.com>
From: Dave Kleikamp <dave.kleikamp@oracle.com>
In-Reply-To: <20230919155542.4354-1-ghandatmanas@gmail.com>
X-ClientProxiedBy: CH2PR18CA0060.namprd18.prod.outlook.com
 (2603:10b6:610:55::40) To MW5PR10MB5738.namprd10.prod.outlook.com
 (2603:10b6:303:19b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5738:EE_|SJ0PR10MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: aa689654-1127-412b-5a73-08dbc4453600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDBGeXJjME03UEIrS1NGRkpGdFRlZnJnbDBGL1MvWU9NK2tSTHlvUWVkcVhi?=
 =?utf-8?B?UVZJci9qZHJWOHgxWHJtNEZBMzV4dUNjRE1WMk5yb2F3OFg2K1ZjVWlWTlhp?=
 =?utf-8?B?cWtiNjRRMEN6VXdCMTd4Z2tOWDF0WnZycHNqdlB4bklCci9hOVIyUUJGNkFY?=
 =?utf-8?B?UUo1SzNST1NGUDFoR0JyY0RzWVNSdzV0VFlhOEFMQk5RQjVyb1FGbHpGUStX?=
 =?utf-8?B?d1h2WDlSZGYyVjJBK2llcjY4THJYbFI2ZVludE5mcE9BUUd1c2dMaTFnTERE?=
 =?utf-8?B?eEo5VDFXMTFTR2xPYllkR09MOEZsRTNpOGxlRGwySFRSbnY1M0xoS0lDRjdw?=
 =?utf-8?B?dVFLd2E5Y2RKV1N1NGlFd2pnaGJ6c0oxUEVRQUVvWlFhemhQVXhqV0dCblVU?=
 =?utf-8?B?WHJ0RnQzY0N6WnYyTWtwRytQaTdOSzRaTDF0bkZIWjYzem50cjFmR2xnQ1lL?=
 =?utf-8?B?bjQ4UUszOHRFa2l6RFFTZ1Mvczd6YWY1S283OGxwUDRidlQzNWJIT0JyWVNy?=
 =?utf-8?B?Ny9IYXNkcDc0MHFwZytvbG8vNW81elJwajFhTVZ1WGwrNEQrdlA1SWlSbWR3?=
 =?utf-8?B?OXU4VXVzeVZYUVV5UHZNNmlkNDkyTnV2RjdpakxMeUc0bnhQOGFobXdma2N0?=
 =?utf-8?B?RVBubEQ3ZW9pYnpmZnFINmNsT2hiQXpPWmxvcm90VFhRVksrTlFjSTJSdCtL?=
 =?utf-8?B?ajhRN1FSbVovb1pSRVR5YlJveWl6QUlKb28ySStSbEZDWWZRSVBaNnMxbXhN?=
 =?utf-8?B?THdUU2tNYldYcDdubHdWRVZnaFE1elVNWHdnd2grQ21MRm4rU2pvUHJYbDc5?=
 =?utf-8?B?SGptNCs2RGRPbUVJUndZclZ3K1lKdTI3TGl5a0Z0am1QeGszQ1VvZVNqZmlq?=
 =?utf-8?B?eTdqb1FuT2czU2dNL1E0M0JWNzMyZm1PU0hQRmxlZXc4cmNCR1BIdTc5ODZi?=
 =?utf-8?B?L1ZVRUh1NGUzc3FYVVNHMEU2UysyRmhuTS9oMFBVaVVJUzFjbkZ0dWxNNUoz?=
 =?utf-8?B?aEdZWnYzM3ZFV3pBTG1VdHZhTGVoNW94emZ4VWZsU1JRY0FEc3llSkVmMzlP?=
 =?utf-8?B?WXMwWXZocEsxRzJYQnNMUXozV0wvcEZyaHY3a0lud1podUZiLzRTUitadHd0?=
 =?utf-8?B?Q05GQm1XWE1USzhDRVRWc1JsSzFiZDlnOUR4SHFadWgrbkpSc2Y4TGx6REo3?=
 =?utf-8?B?ekpiakZjbUlXSFdRVHUzcHYwV3VIOHpjcVpRWDhqamhlT3JnY1BhK0RPUXda?=
 =?utf-8?B?UnBodkNIYzJHbE43S0FHUkw5R2g5ZFVpOFpXVDErS0hQNjFzTDY0dDcwVjJi?=
 =?utf-8?B?Rkd6SUFPQVBNa0dUMk9hL3lPd2pNRWdzZEJ2U0RtZkk0K293SnVtSTlmWkVj?=
 =?utf-8?B?eWZOaGpsdVpXMWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR10MB5738.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(2906002)(38100700002)(83380400001)(5660300002)(2616005)(966005)(66946007)(66556008)(66476007)(6666004)(6486002)(6506007)(4326008)(6512007)(26005)(44832011)(8676002)(41300700001)(316002)(478600001)(8936002)(86362001)(31696002)(36756003)(31686004)(99710200001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUp6NGR3NHU5ZEg1YnlWa1c5SGZTQ3N1MEtsWVJOaTloUUdHYTJVbFpITFB6?=
 =?utf-8?B?MU9KeC9xNEZhNGUvdmFSTEpYYkVGZ25rMDl5OTJVeUtaSkttdjVUaGRPWUNk?=
 =?utf-8?B?clgzMzVvSVZscjVTNFpiZXk3Z3BZa0d0djdkY3lsUnhtSjdpaUx0Ri83Mklv?=
 =?utf-8?B?QnFwUjhneU5wZzhXc0duMFFLWkcxd3JKUWxUcmtNaTdzZG1NdTIzMjZxc25o?=
 =?utf-8?B?UzRSOGE5d0pPWXhLYWU2WGY3a1l5MVY0NmwrWHVqK1NKZVF1RHlyNXJRSVMx?=
 =?utf-8?B?dElZb29jNlV6dldNZUN1TXRGbWhkK2JtU0R1MTlUS2JVeTdOdUQrT1J1Y0Zh?=
 =?utf-8?B?MXFxcDNxZWJWTTFMYURNNi95bjJjVVZYWWJYdEExeXp6Mlo4Y3kvS0xKcURk?=
 =?utf-8?B?STByQTdJSmlRc2VPMWZrRE1uR2s0M1J0MkxaSXdFaFVNMWY3RmIvMVdySW1w?=
 =?utf-8?B?L1R4NEVSNWZ5WmJSTGpEUVE3Zmg4NlhLYTRnTFJ6RjJKU1V4OVZHaVZWeFBa?=
 =?utf-8?B?M0ZidGZBSEFCWExBbWhXRG50THAzQnV4VUEvQ0RYRlU1YS9XMnBtSzFDT2pS?=
 =?utf-8?B?RVlTSmhuVXFvTGM0UDdXTHN3Z01CWTNqRjh0cXFzRCt5M0YyUThnMHMvOGJU?=
 =?utf-8?B?NU1SNEZqNk0vbEdsN3pIZCtNeU1PTW5uTzI3VG9ZYjhqWmFsamVqOTBnemwy?=
 =?utf-8?B?Vk84dzRBOU0vZ0hJNi9uL2NSUDArQkh6Q1kyWURCYTc2STJSbERDR0lnRGxK?=
 =?utf-8?B?aURlQVZhb2ZSdEJZVFV1aXJ3TUZwZyt3RGFQa0UzWElVcjBwWUwzWFRWbWtI?=
 =?utf-8?B?S2xrV3lCNE5lOCtzaWlXdzBLZTZJVUQvWDNjbG90dkVXWnhRRDhsSi9nNXNs?=
 =?utf-8?B?aEx5MnpaQjYvRTN4Ujd3VWZXTk9tYjF3enlsZkdQRi91ckg4cjhyU25Xc2Ur?=
 =?utf-8?B?YnpxZDlKTE8zQWhFeGlMaTUrTnRaMWozdmVBZVV1L3lkY0ZFQ3g5ZG54QzFu?=
 =?utf-8?B?d2ZWUDd3WnA5VFB3d0N3NGc4VS9CRDdtcnlCVmFiMHVhYXFkVGlCYW1URWRs?=
 =?utf-8?B?TGtPUTcrTE1LUVFYeklIRjc4VDBuSVEvNm50bjhwR2tobGdHZEZmK3NCVTlv?=
 =?utf-8?B?SzR0eEZoU29XUXJFOUdQSkUzYXpBQ3AySWlZRTM5WXVQaWpGTTljd0lXL2Uz?=
 =?utf-8?B?b1dsRVFqT0M4dDZaTDRYMVg0NXJYQ0w3TitGTytJMzlYcW5yeE44SGQzdSs3?=
 =?utf-8?B?Ymtjb0hyTGs3NXpjZU8remptUWRPZ0FNY0tjTXhxM2EzU2E1dDdGNkVuSkl1?=
 =?utf-8?B?dTR1alAzbk1ydG1hSlErOUpkSU50YTBZYmo1dm5vQlRuOGpPYXdMTGJBK0xF?=
 =?utf-8?B?TmlERGhOTWlDOUxsM0M3SWNEeU1oV1djQlJhRHZtdDFHSHBPRGdPZTJhRHVl?=
 =?utf-8?B?SWczWTZrVFRWWEdVcVM0NHBIdXhYY293cnpnZSs3WFVHTEVycFVWQzlrdWJK?=
 =?utf-8?B?TW5nNktXQWprWlk4ZDN5VzdJcXZ2YTk4UVBvS01Bb0MzY25yVko3U0wxTC8z?=
 =?utf-8?B?NVJtT3YwVFZSZFlzRkJWRnM3WVlMOWRXWDdPOWFsMWd4Z0FKU2J4OW50SnBG?=
 =?utf-8?B?ODl6QkU0ZXNRczYreDV5STdDMXJWNE4vUk1KVjlmVVpQNmpBaEhsMnFnbWlw?=
 =?utf-8?B?TThMbHVueXdWQlRRYXNNM2s4WU9pZTNpK2lXMTRLWG16Zis0YWxvd0U3RzBn?=
 =?utf-8?B?d2U5RzFBc0x1alQ0dVFnVDE2K004R1FpQVVYcGhabjdFS2dFN2lKamxWRHpH?=
 =?utf-8?B?UkRhRkgwazZOVzlnL1lwVXNqNFFpT1hSdWJYN29xNFlPV3lIR1psb1MrOTBv?=
 =?utf-8?B?dFhlTVlIK3p6Q0szSFNXL3RjVjRUWW5HMCtoaFc5MWNuUVVham9NWUNIeUlR?=
 =?utf-8?B?Uy9Pa2w4MFAxa0tEdEZLdktqUko4ZWp0RkdGbGxKOG5lcVg3aUplcWwyTS9y?=
 =?utf-8?B?ZmZiTWh3R2tRZGo4Zi9ndGZGU1lCV1hkRTFqZEgvS2R0c0hKRjRjVUx3MzQ4?=
 =?utf-8?B?ZkFJTFJKVndYeVV0UTRvdTMvKzlUcTF2MUJFU0hnTnhxbGVkK2d2bXY0RERV?=
 =?utf-8?B?ZXFEb2dVODhUZVF3UERpTnN5SjNVQk9hSzR6eGljNnZ2M2VnQkZhSEtVc2ty?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Y0huSDIwQS9NLzlYU01ycVh6b0RPTzFTVDROeC9CbnRpUFpKVjFIaTRLOURQ?=
 =?utf-8?B?ekd5MDQ5SlEyd2tOeHlLbkphcWFyM2tzUlhsczdTdHZOV1FJZ21ZTWFINzdx?=
 =?utf-8?B?ZUNwV3JxOWxVLytMYkVJUURmdHJKTHlHc3h4ZTQxcFZEN1JtNFoweG02Mjha?=
 =?utf-8?B?WklTOGJjL0hWeHlpS0JBei9Yb3J5Y05rZktZdWxubmhiaklVSC85dmJ0WDFZ?=
 =?utf-8?B?aDJoZHppSnBML2t3VGEwNUVsOW5hT25XVTVSaWpIMlBKV1BLR0gwUXAxK011?=
 =?utf-8?B?azNVZGtZZE4ybnpYSE56ZXYxK1dranJQNWtPdFJBRFE0dzhJWUIyRUp4cVNC?=
 =?utf-8?B?THc3M0toSEVob1R2UmlicUxINWxBNlJ4cjdiWTNtRVFKbDZNMkl6SzVXQWkv?=
 =?utf-8?B?dlY5ZkZzbTVnaFRDVnhVZjd4ZTVRbHgxbFdkSXp3clp0MGhZbC85VmpjSTFW?=
 =?utf-8?B?VFRuQXBCRXFaWmV0QUZwYkIzUGI0Q3k2WEdJSDZjR0drTXhEVVpWSVpZY3pD?=
 =?utf-8?B?ZldSUTdubEdTQ2Z0anV1ZDJSNVNXcTdBN0JKVVgxQnlCM2xyMm0zS2hsVm9p?=
 =?utf-8?B?dzZvc0o5NllMQTFFWUZlZFRUWmViOW00THVtK0kyQmlFN3drSm52TE5WTWZF?=
 =?utf-8?B?cFlnWDkzZ2VuVHhTcytscDRNbG5OTWNRT2dWNDc3eTltbkh3ZWg4dHpqKzcw?=
 =?utf-8?B?eEV0cHA2YTBpSkVNU2hNSmVZdmdkTG5meFdsd0R2V3BnK25XNitLb1F0Vk4v?=
 =?utf-8?B?R3dYaFB6amViWi9Xc1ZXYTFTTHN2aUIxYVNEaDh0THUwYThIUU5uYUVkVWFV?=
 =?utf-8?B?UjVSNDl5emhXKzVjSzdTWE96SWtiMnpTUHdCYlNZcXlEMzdKNVlNYVN6cWVn?=
 =?utf-8?B?eW9JcHdSSk5jQ3BSdm83WCtEaUYzUCtVSEhLbTVGcmFRVXNYSGRTckw3VVN3?=
 =?utf-8?B?b1N6RlZacDVBV25pZFYxTHZNa3I4aU5DajBTbWNVZjNBR1RSTHpXVXE5TGhC?=
 =?utf-8?B?VHBTVGM2L3MwUktIYlU0b3l0Umh5Q0VrTnJJYXg3MGZKTkpqS1QzK2t6NTBq?=
 =?utf-8?B?KzVsL20xZWpOdXBpYUJMaS9YNmdWeXhKWTJtNHRRZXgyVkRDbXNaU2dmeUxt?=
 =?utf-8?B?bk8xZXorWFF5enlKeGpRQ0FQYUtYcHl4ZkVEV3V2bnU4UXJtOXBITzhhK0RB?=
 =?utf-8?B?SHh4QkhQT1BZcVNIWm1iZDhrek1QUlhYb0QxQy9IVzFlL2MzdzJYUy9DTTBm?=
 =?utf-8?B?REdUVW1RVnFqUFc5N0kxend3eW9JTVBCekdlTGJDNEk2dC9taEd2VXJuNzlz?=
 =?utf-8?Q?wllPhOxyv70DXhK9/S29zekObeiSHTUdOg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa689654-1127-412b-5a73-08dbc4453600
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5738.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 19:16:14.2149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KU9N8sESTcjzTHuqPaCc7xr/VG2YCe1ZLBSV7Gnexhsv8baIJMv/sRnzxQ2zdb0Om4NR8O1pKblks44LiQq3CLLRiv2FlCbvIiVpDjDdDoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5632
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_16,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310030143
X-Proofpoint-ORIG-GUID: zZuGbXjBg3otNF5N4QlqG3LFC69iSyFM
X-Proofpoint-GUID: zZuGbXjBg3otNF5N4QlqG3LFC69iSyFM
Cc: syzbot+0558d19c373e44da3c18@syzkaller.appspotmail.com,
 jfs-discussion@lists.sourceforge.net,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 9/19/23 10:55AM, Manas Ghandat wrote:
> Currently there is no check for out of bound access for xad in the
> struct xtpage_t. Added the required check at various places for the same

This won't work for the same reason I mentioned here:
https://lore.kernel.org/lkml/36683767-ad6c-477b-8b46-f10be2ad55d2@oracle.com/

The size of the xad array can be either XTROOTMAXSLOT or XTPAGEMAXSLOT 
depending on whether it is the root, imbedded in the inode, or not. It 
is currently declared with the smaller value so we can use xtpage_t 
within the inode.

I had promised to address this, but haven't gotten to it yet. I'll try 
to carve out some time to do that.

Thanks,
Shaggy

> 
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> Reported-by: syzbot+0558d19c373e44da3c18@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0558d19c373e44da3c18
> Fixes: df0cc57e057f
> ---
>   fs/jfs/jfs_txnmgr.c | 4 ++++
>   fs/jfs/jfs_xtree.c  | 6 ++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
> index ce4b4760fcb1..6c6640942bed 100644
> --- a/fs/jfs/jfs_txnmgr.c
> +++ b/fs/jfs/jfs_txnmgr.c
> @@ -1722,6 +1722,10 @@ static void xtLog(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
>   			jfs_err("xtLog: lwm > next");
>   			goto out;
>   		}
> +		if (lwm >= XTROOTMAXSLOT) {
> +			jfs_err("xtLog: lwm out of range");
> +			goto out;
> +		}
>   		tlck->flag |= tlckUPDATEMAP;
>   		xadlock->flag = mlckALLOCXADLIST;
>   		xadlock->count = next - lwm;
> diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
> index 2d304cee884c..57569c52663e 100644
> --- a/fs/jfs/jfs_xtree.c
> +++ b/fs/jfs/jfs_xtree.c
> @@ -357,6 +357,9 @@ static int xtSearch(struct inode *ip, s64 xoff,	s64 *nextp,
>   		for (base = XTENTRYSTART; lim; lim >>= 1) {
>   			index = base + (lim >> 1);
>   
> +			if (index >= XTROOTMAXSLOT)
> +				goto out;
> +
>   			XT_CMP(cmp, xoff, &p->xad[index], t64);
>   			if (cmp == 0) {
>   				/*
> @@ -618,6 +621,9 @@ int xtInsert(tid_t tid,		/* transaction id */
>   		memmove(&p->xad[index + 1], &p->xad[index],
>   			(nextindex - index) * sizeof(xad_t));
>   
> +	if (index >= XTROOTMAXSLOT)
> +		goto out;
> +
>   	/* insert the new entry: mark the entry NEW */
>   	xad = &p->xad[index];
>   	XT_PUTENTRY(xad, xflag, xoff, xlen, xaddr);
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
