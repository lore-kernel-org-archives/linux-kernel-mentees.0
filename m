Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D7FC71153
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 Sep 2023 22:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B25E40571;
	Sun,  3 Sep 2023 22:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B25E40571
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=FPlKpBDb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=r62+QgwH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43UdDvBqEW4t; Sun,  3 Sep 2023 22:50:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E36584098E;
	Sun,  3 Sep 2023 22:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E36584098E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDF1BC0039;
	Sun,  3 Sep 2023 22:50:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C91DC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 22:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 488CD81E07
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 22:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 488CD81E07
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=FPlKpBDb; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=r62+QgwH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ejQ9Nx7e6AAt
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 22:50:16 +0000 (UTC)
X-Greylist: delayed 3847 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 03 Sep 2023 22:50:15 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2C7081D67
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2C7081D67
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 22:50:15 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 383KMNSY006065; Sun, 3 Sep 2023 21:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=TfUX5x2DNLsi0eTc/a1ZXc8BiDFqUB0fsnHL2Iu/VIs=;
 b=FPlKpBDbzj7rqBI7AnTcel//DfOgKQIEbKe+HHcWio581IPBx5mknFQS79vzWFs/W0ko
 Ua5l07KTckFuvT0vzyBi5SvhsGzxdbF/Kj4hnRHsP7mMiecdO4Z5KYx7WA5/f4YVBUcS
 0ESRBHyOYJHNAkkrafzZdCNgyZt/740K6uWyViM5ao7eIsgAZMaHVB8Kj9ClxyStIipK
 xX3h3/vowReTgAcqTFxQp+/GxMGkfBQ4rG9jP8TbOj8U3KPag6fh0rvIHl7liSNM9hvL
 Usj/GYi9i3Rl2E6zMTl3h9BGRfluuvyhW18pAARwpnB9JmPVqEbt1rgQlAE3i5pSLjrE Pw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3suw3csxjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 03 Sep 2023 21:45:46 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 383JYAsw016311; Sun, 3 Sep 2023 21:45:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3suug30hbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 03 Sep 2023 21:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crVW0Zp3bO2+1dAAxCiuEgN+ZW0+zDKiCsZO++7feftuMOEQwKs7nS9QhX5h9/K1SMUgG6dNKMAS3RrrJu0/e9yMlVqvtfssiKCEbnc7UEOiDi8vsobOXfSEs2nyCt7HG3yR2gSY3H0UOz5KazBoFh6jynaLWKlkcR5ZkPNb7Vw0I+0YPE5khGJ7Ut/mEuByipMfFHIooFwk1s+Jin4odO9edD/CMCuyAleyNEZ5i3xaDQDGAS4v4omgeTNbX+z4iLfc9VUNa6QZFYS6lhh55KmqAlcYCEe7f+nCpr+QJZDMbX/pBqTM10H7kFgjik1lq/RkFfxiS7ekPUr23DkKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfUX5x2DNLsi0eTc/a1ZXc8BiDFqUB0fsnHL2Iu/VIs=;
 b=WRjLOu4YQEbnZNjZhPkcFiw/SDH5fuaSu8DPefWbHQCZrMhVRszeFwM41Pekmz4D7HxrkwtqzS3p6rfXpTErY02D2BngXE4qzyHeMvFRY4MFqzW8FRigDujkITNx//FS+/SrfqDphPf2yN9CDQI4O9xEuDliOy62J3Fe+s42yqQodu+oK2PWcR/XqFoiLJu6KCUNgFki9GYDiB3wOWDdHGVHAEBupq55bfkgnbEkdiGZPt2kzT3+OrCyNEza8BekXpBn4OXyhPrS7LB9BwU0RJ7Z8oYbesrZIc626yHwOPKnkkRCinhASND0P1L5KgXnxemJem4dovqRDulxtfDXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfUX5x2DNLsi0eTc/a1ZXc8BiDFqUB0fsnHL2Iu/VIs=;
 b=r62+QgwHjv19q8jvvwhU/jtlZ8pv0BnT7BaBx66aIt+PSavvcY0/xmazJXyTTxhS92JFTEWR/rqQJ5NTUVz3SKpuQyGulfxpsfLv+Hw7X4SEzmSzkHp6x2lK8sxQWJXItEx1dt4aqxnkBz0ATd6VzUAfHQBL1TCvf3KZYxUj7eU=
Received: from MW5PR10MB5738.namprd10.prod.outlook.com (2603:10b6:303:19b::14)
 by DS7PR10MB7346.namprd10.prod.outlook.com (2603:10b6:8:eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Sun, 3 Sep
 2023 21:45:42 +0000
Received: from MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::5943:cf66:5683:21be]) by MW5PR10MB5738.namprd10.prod.outlook.com
 ([fe80::5943:cf66:5683:21be%4]) with mapi id 15.20.6745.026; Sun, 3 Sep 2023
 21:45:42 +0000
Message-ID: <82009ea8-ad86-4829-b0a7-7dacda762aad@oracle.com>
Date: Sun, 3 Sep 2023 16:45:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jfs: fix array-index-out-of-bounds in dbFindLeaf
Content-Language: en-US
To: Manas Ghandat <ghandatmanas@gmail.com>, shaggy@kernel.org,
 liushixin2@huawei.com
References: <20230829165244.460154-1-ghandatmanas@gmail.com>
 <e62dbf53-9d74-45e5-b44e-53140672b8b5@oracle.com>
 <ae6ce935-96eb-3d40-f252-54fff7eb0ea9@gmail.com>
 <f9475918-2186-49b8-b801-6f0f9e75f4fa@oracle.com>
 <5dd9b332-49e3-877d-125b-1de5b46af4d5@gmail.com>
From: Dave Kleikamp <dave.kleikamp@oracle.com>
In-Reply-To: <5dd9b332-49e3-877d-125b-1de5b46af4d5@gmail.com>
X-ClientProxiedBy: CH0PR03CA0420.namprd03.prod.outlook.com
 (2603:10b6:610:11b::25) To MW5PR10MB5738.namprd10.prod.outlook.com
 (2603:10b6:303:19b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR10MB5738:EE_|DS7PR10MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acffbc6-c155-44d9-6bf4-08dbacc71f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2ogqO6SixulE9vl6z0WA9lBfRVlFxdfa9g+FP8rqBDpoQLL7QzqmyhXz43KIdviTebbSkTF+Zfp9T/uQAeSW1Eg8HsePN3Y9acR+mFn81j0G35KUGuI/NtsckWwofe4Jb8ZupmVVid8TEvpcrDS3+lXCfyGJ/Yp3q8MFmaO+f92WkTtrDISBMcO+z1QdaxNEB29DhjLUFWUsE+OXxr2eNLmlGZzQovBvCGyP/jOhL6MskGuan5EmplUa5/nwAO3Xd92fShAGYyHRQv5MVdc2P/5gV68jY4GpNJMZAD/RfEOQ9Dt6/r2GK8L5/GA1gvq4E0CmasXoJp36LS+CM9Qnicd6070yuuKE9n36+NzQxSqMldpNEZ/wJjOJ+jftl9yXBlfFt0P29f++KjgRVIR7UMad0O0eVOdsbbhIuEya3PHvO3NGJ4d4QgGqxkD0U6Uf3IgghzF19P1VbGP912trpspPn71/YbuG5NTij4fcVbTAn+MJcPmaF0WvJ+RCzU+jIX19/nUBSmMadbVA44x778YRDzgBx4S8UXdP1h7QZHQiTb6LHIuIk1k2DpN5gGVFwefOaahngMP0aXXT9dnwCXKhIBcULFvTS94ieSopot+q4BRXE4+aZWjAyPELBtuoynJOCUsn6fXwxbYRlhgug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR10MB5738.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199024)(186009)(1800799009)(31686004)(26005)(44832011)(8936002)(6666004)(4326008)(8676002)(2616005)(5660300002)(6512007)(53546011)(6486002)(6506007)(41300700001)(478600001)(66946007)(66476007)(66556008)(86362001)(31696002)(316002)(38100700002)(36756003)(2906002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUpYcWxDTkNPY2xkTGVGd0JrRFpGbyswRHZlNVVqNTFraXRHdXZnU1FIVkoz?=
 =?utf-8?B?VjFiWGtJbnRIelVDbzF1RXlPV090M0ZsL1h2eUdIa1NFTUtKNjc1YndYZUxP?=
 =?utf-8?B?eTVnbGIycEM5V0dRWE1rcXkzcTBFUGNSbE5CcVFzQkZ4ZXhXYkVER3JtOGhl?=
 =?utf-8?B?SE1XVzRrbmpnQWhjNndHVFZETXpTTTdQVWNkSmY5UFVQSmdtUHpQamN0WmNY?=
 =?utf-8?B?NElqWjlZblZreTg1RjB2VmlYanB5N0t6eWpNSEIxbUFBR1NPdHdtMzNOcDQ1?=
 =?utf-8?B?eHZ3eTdNQlFCOG15OWxGRHFFeDZFZ0o4OU4yRFZEQzRhUVpRVVBGMTJZd2Ir?=
 =?utf-8?B?Y3UvK0MxU2tyMUJJNzZnbXN2MlRFV29iZ1FwRVFtNThDL0FHR0R5VDFSM3Jq?=
 =?utf-8?B?Vks2M3ZzWHI1ckJrbVRaVGpGYm5EOXBhd04zaTdBcmF0MkZKOS9SSXZ4WVJT?=
 =?utf-8?B?c2JEWW5MSERLQmZvTHVQR0IvTWNtbWZhNXBPWW9PMkNyV3h5Tm1ZMER5bFg2?=
 =?utf-8?B?b20wbVdkSWYraDVERENRcnIzUGs2VFdmdFNnWjZtTUU0TTF0bHlnNnlPbEhU?=
 =?utf-8?B?Z25ZcEZOanFXMnp6M0dsa2Y2OFQvT1BEMCt6d2k3OUxxRHNOL25TaFZCVzZ6?=
 =?utf-8?B?Y2lOK084cFlGK1B4cUw0S2FaTEdQblM5a05PT2twSkxRRWN1TGtEbXQ3MWV1?=
 =?utf-8?B?NnlJZVVsb3JlOW5WTmZZbk5iYjJaNXNEWmtBY0g3TDJjVFl6M1hJeitqYk42?=
 =?utf-8?B?NW5GZkR4T2lBWHdDMlp6SU5VSlJDOGhuYTRIUytJRDRmSWR5d0hoQTFpdzFv?=
 =?utf-8?B?NWhBNmxjZUVuazQ2Zk5QenpHaUw0QnJTakJzNnQvZ3pzMDE5a0xNL1g3T3po?=
 =?utf-8?B?a0ZGTktySTFXUWM5ejQ5ckRNbEd3TjV4c29FblFyV1V2QzdHT3RMU2JwWVhD?=
 =?utf-8?B?TEt1MHozNUZoNkJqaUZhemZLU2ZaeVFYU1pvR093QXdxbmw5a1RCd0VETnBi?=
 =?utf-8?B?QlM1QUR6M1puTlI5S3laSGxxZDgwRXJVUndhWkoyR3RHOFFLdnBiaUUvV2xk?=
 =?utf-8?B?RU5xQ1g3N0tnMFJWQUFFYzR2Wm1wNkpJMGJJckY4VkFCa0d0dmJ2cU1NNUJj?=
 =?utf-8?B?VDRvVHY3ZXFVbGNORjBZYXBSS3lBYkdsR3NoS1I4MUxTbDlXSDhBZVJxMGpB?=
 =?utf-8?B?czN0K2tZQzd5VjlOUTRkbkhWZE40bkZWNDd1aU1GYzZGTCtjMGF2Vk1sT3d0?=
 =?utf-8?B?SjQ4ZFVzMHcyL0d0Ni9leVdBa05aVXRJbDFYa2NJS2NNYXZlVkJQV2ZXQ1p0?=
 =?utf-8?B?aTIwdGZXdnZrenptRUtPSVNVQ3pMWWVKclN1UU0vc3VWdFE4WE1LWXVrb2JO?=
 =?utf-8?B?V0dBRnpRdEg0SHZLb1BqYmJwbFZiMXd2SmVoSURES0o1Z1hpSmNhWXFza3ZW?=
 =?utf-8?B?YVlNRDA4USsyU1Z1ZVgyd0JPR09MZUYzckxIQkkzcTRBYi9rNlA5U2FTYnkr?=
 =?utf-8?B?TG1HaHFxT2EzVG5SaXM5SCtIbE1zbzlFa1ZqZ01OZHcvMXA1LzVvTWJ2Q2ox?=
 =?utf-8?B?dmNpS3F5TCtraU9CMU5oV1NVVkRyR2wwTXFlMm9tSzg3U0tja24vekxZSlcw?=
 =?utf-8?B?ak8vNG9HNkpybndzRUdpZ0lMQnhQdnU5NUxYVFdjbE9Eb05manJoUVBMdU1W?=
 =?utf-8?B?ejA5MjJyTWRQUnpIOEJHT2dZZ2hHNTQ5QXU5cWk3NEViV25MaHZuZG5YR242?=
 =?utf-8?B?aWJ1bVZpMVV6YkdUV2dsZ3dqWm5lTEV6QTM4UFAwN0lZS2o5ODhYSGNoVFdC?=
 =?utf-8?B?ZUZhWVVPdEV2MzlncmdsNHovTmNBOG5PeEtUUitleG4xUFNPSi9UNEE1SDRT?=
 =?utf-8?B?NnZpNUlEOFNjOThQbDkxTVU0bVA1VWxkdXF1MVh3Ni9nVWsvYlJaeHhXdS9Q?=
 =?utf-8?B?UUZrZkttd2RYWmtIVmFxQU54c0FNWGtENGhrUzZZQUkyV3g1QURmblJtNFlr?=
 =?utf-8?B?bVZiNkcrSzNUSjYzaHhkQzNXUW9EN3Y4UFFwbkdtSWxoRHNSOU14dUUrN0JR?=
 =?utf-8?B?N3hydU9HSDBNSzRjYmM3ZG4yK0NScGZUUlEwaEwrYmNQdEtMOFFuMkRqUU1y?=
 =?utf-8?B?cEZwM29NMDBHeHViOUovQTRQR05VUUlxa3JObm5uOEtiV0R6eW1YdTdBaWtt?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?T3h5WG01ek5pRG5Rd0lLT1lOVlBvVTZkcTVWS2k0aFlBbDdabTRqRys1OHJm?=
 =?utf-8?B?SHVLL1FiRWdMV3FvdE54cU9WWnZIc2JCUXkxQXYyeVZKZHl1TFQ5QXJ1Rkpu?=
 =?utf-8?B?VEU1bWw0R3pGZHFrYTUwM3AvRkdZS1NjWlBVQTdzZUxETm45a29zbDhwMEpu?=
 =?utf-8?B?N20wOWhMR1E5NDA0Y0hjS290eGRwaGNTS2pmUVNIZ2JRSmtlc01LWElUVnBw?=
 =?utf-8?B?QVczQmRZNU1uemFIcUtMeURidE5oTVJ3ekt4TEJnaXlJWkxBN0Z0YVlrQzBp?=
 =?utf-8?B?bndGM01qUnVQMWFKTzE4Z0oveUxUZzFFMThSSmk5c2s1dmFwQ2hVa1J2cjZk?=
 =?utf-8?B?VTZqWTlraXFjakVMdkZvQ2h3Z1VUZ0N0eG9MTG5XazVINjhkWVhuaUY3aHIw?=
 =?utf-8?B?ay9VczVJUXd0MVNUOWNCUkRlTzFyTU5QbFlHWmx3VVZMZE9kbjZNemwwcTlm?=
 =?utf-8?B?K1lIZ29qRWRqd0FneE9nZ2JiNDN6aGZIVDhpcTZ4WmtuU0x4YVNIRm5ST0FE?=
 =?utf-8?B?MC8wUmJhTnZaQ3p6YjdmRmlPRVpXSC80MmEvUm5mZGt6ek1YaVFnYjlueEx5?=
 =?utf-8?B?Z0pwUW5QMnRKaFo0S21ORnVpV0xoeGc3cThUWU9Tbyt5cFJSL2ZvK1hNWll5?=
 =?utf-8?B?eFFYNmhJRUNWUlp4TStSVGVqYkJCQmd2Ry9HTk9YdXllUVZGbDU2WjRIb2M5?=
 =?utf-8?B?SGh0SkVObFFicjUzWlRrQzA4ZEZ0M2Z1bWRXMDhlTXhLcW1TcVFQQWZhZFh6?=
 =?utf-8?B?V3I3eHlLZmpyQkZ4Z3NyYUVsYS9BR2dPMGlyN2ZFTVd4Y0MxOWd4QTkvRGd6?=
 =?utf-8?B?VEJHTDMvZzRwMUNES01KNFBrUisrSkt2QTF2OFdqL3ZyLzQzYldkNDc5MDF0?=
 =?utf-8?B?cHdMUVFJVWdyMmY3K2hGMXMvMTNwVWg2OHdMRFZBUWFpMHpQRk11c3pSSXJP?=
 =?utf-8?B?TWVpSko1SkZEWXpsbWFyaFk0OXRqU2hRNWpqK3hPRmpaWjJ4VmF5SDBrR0Fz?=
 =?utf-8?B?bEhNTjFxU1lMRGFkcVFNS2lEV1FMcnlFV1BVM0RlKzhCOHRWQ29hOUhISG14?=
 =?utf-8?B?bGN6UDNOdld4bU1JazFrVHA5dGc3SnNmQUh1cDNDejduUmk2MDIvL09Mdk5C?=
 =?utf-8?B?MUtLQUFVTkV0SkxJS3VYYmRtdUZ0M3hUNllWbWpPZ2VHTkVIQWs0MXlKVGlV?=
 =?utf-8?B?YjFUdTQ5MVJ6aTFoeG1LaGdLOEdrV0lMM0dJYjVzTW5tY3JaUU5iYk43dnhV?=
 =?utf-8?B?cytzb01JQmRMRU5QR1BCZUJGZEVkQjdVdFZsUHR0Ti9qc3Vzd2Z1WFhMbVhs?=
 =?utf-8?B?TUJhMkZrZzZJaU1qNXpCTUxkZnYyMlFZc3BYWWFQRW11azVyOHBaZWxMRFUw?=
 =?utf-8?Q?IabFx9p+mbKR/aVIEUpV/XAnVmWLSo2g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acffbc6-c155-44d9-6bf4-08dbacc71f18
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5738.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2023 21:45:42.5406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JELznN4F6MC2hRUQ99OMg28XE/sbOlX+ZNVccJ3MXRiBriN/0aiSDG8GwE+1gX4ZGHTGUomJ4m+eJ+Uk9ow108I34RAsX0GzStC0JO+EeK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7346
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-03_19,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=909 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309030205
X-Proofpoint-GUID: lMaP8cd0dNPDju2fpv_aF2rxigCcXw27
X-Proofpoint-ORIG-GUID: lMaP8cd0dNPDju2fpv_aF2rxigCcXw27
Cc: jfs-discussion@lists.sourceforge.net,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+aea1ad91e854d0a83e04@syzkaller.appspotmail.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gOS8yLzIzIDEyOjQ1UE0sIE1hbmFzIEdoYW5kYXQgd3JvdGU6Cj4gQWN0dWFsbHkgSSB3YXMg
dGFsa2luZyBhYm91dCB0aGUgc3RyZWUgYXR0cmlidXRlIG9mIGRtdHJlZSB3aGljaCBpcyAKPiBw
cmVzZW50IGluIGJvdGggZG1hcHRyZWUgYW5kIGRtYXBjdGwuCj4gCj4gTGluayA6IAo+IGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUuMS9zb3VyY2UvZnMvamZzL2pmc19kbWFw
LmgjTDE2OAo+IAo+IFNpbmNlIGl0IGlzIGFuIGFycmF5IHdlIGNhbiBhZGQgYSBjaGVjayBmb3Ig
dGhlIHNpemUgb2YgYXJyYXkgbGlrZSB0aGUgCj4gY29kZSBiZWxvdy4KPiAKPiAKPiArwqDCoMKg
IMKgwqDCoCDCoMKgwqAgaWYgKHggKyBuID4gKHNpemVvZih0cC0+ZG10X3N0cmVlKS9zaXplb2Yo
czgpKSkKPiArwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgcmV0dXJuIC1FTk9TUEM7CgpU
aGF0IHdpbGwgYWx3YXlzIGV2YWx1YXRlIHRvIHRoZSBzYW1lIHRoaW5nICh0aGUgc2l6ZSBvZiBz
dHJlZSBpbiAKZG1hcGN0bCkuIEl0IHdvdWxkIGJlIHZhbGlkLCBzaW5jZSB0aGF0IGlzIHRoZSBs
YXJnZXIgbnVtYmVyLCBidXQgaXQgCndvdWxkbid0IGNhdGNoIGFsbCBvdmVyZmxvd3Mgb2YgZG1h
cHRyZWUncyBzdHJlZS4KCgo+IAo+IE9uIDAxLzA5LzIzIDIyOjM4LCBEYXZlIEtsZWlrYW1wIHdy
b3RlOgo+PiBPbiA4LzMxLzIzIDEwOjE5QU0sIE1hbmFzIEdoYW5kYXQgd3JvdGU6Cj4+PiBJIHdh
cyB3b25kZXJpbmcgaWYgd2UgY291bGQgaW1wbGVtZW50IGEgZ2V0X3RyZWVfc2l6ZSBtYWNybyB3
aGVyZWluIAo+Pj4gd2UgY291bGQgZmluZCB0aGUgdHJlZSBzaXplIHNvIHRoYXQgd2UgY2FuIGRv
IHRoZSBjb21wYXJpc29uLiBTSW5jZSAKPj4+IHRoZSB0cC0+ZG10X3N0cmVlIGlzIGFuIGFycmF5
IHdlIGNhbiBnZXQgaXRzIHNpemUgYW5kIGZpeCB0aGUgb3V0IG9mIAo+Pj4gYm91bmRzLiBXb3Vs
ZCB0aGlzIHRoaW5nIHdvcms/Cj4+Cj4+IGRtdHJlZV90IGlzIGEgdW5pb24gb2YgdHdvIG5lYXJs
eSBpZGVudGljYWwgc3RydWN0dXJlcyB0aGF0IGJvdGggCj4+IGNvbnRhaW4gYW4gc3RyZWUuIFRo
ZSBvbmx5IHJlYWwgZGlmZmVyZW5jZSBpbiB0aGUgc3RydWN0dXJlcyBpcyB0aGUgCj4+IHNpemUg
b2YgdGhlIHN0cmVlLCBzbyBkYkZpbmRMZWFmIGRvZXNuJ3QgcmVhbGx5IGtub3cgd2hpY2ggaXMg
YmVpbmcgCj4+IHVzZWQgYnkgdGhlIGNhbGxlci4KPj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0
CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1l
bnRlZXMK
