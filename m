Return-Path: <SRS0=ph3B=K7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C081EC4743E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Jun 2021 21:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58315613EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Jun 2021 21:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58315613EF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 216DA401EB;
	Sat,  5 Jun 2021 21:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kIDQq9C4YJvz; Sat,  5 Jun 2021 21:40:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1BDB400E1;
	Sat,  5 Jun 2021 21:40:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9439C000E;
	Sat,  5 Jun 2021 21:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14AF5C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 21:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 019F983ADE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 21:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=fb.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOIKp4PjAKYB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 21:40:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D18E783A68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 21:40:23 +0000 (UTC)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 155LYfGa006029; Sat, 5 Jun 2021 14:40:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=di57h0aHNTJFxt1anjxrCr2WZUF5FkRAPZG4kZufXPY=;
 b=Is40yTGNYIlin2M8NHVdNGbJcNHNJuDUjTxjjf8HRmPZmChUkpqnvLwFahKqh6hI6pmB
 pQd1LoAGl67c/6FBX1JFesGGWdOKzBTduXl7kO6cR7kSKibWpuf0jMF65NVm+RxTSlps
 yF2Gg1Xu9Gvp6HjrnLtGaoQSb8vhswXHmhU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 390713221j-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 05 Jun 2021 14:40:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 5 Jun 2021 14:40:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8I7cOOw/dT32bsYAsiQBlyo7U3dsIn/K3wq5sPbMqfKQ+AmkL48xbcqZ2HHSaocCG0H2Xpqd1OLPjbpM5UrvaVa4h1lAMx0KXzUtkL/okPawBN8wBWJi+CIPCojj6JnGBTsDcGLcFdptuNsCOdFQi4C8lNsMGbM7WFJ44i4JlCaVyPXWfDdGVlMveli5zi3HXEPm1r5WuQLAigq+aBBHznViPGGn01gDek8/ukXHI4lv4/LYoMMm6PgzNX0y1BOqZRi5cimqYAcmuErUcBIVnuF/1069Ww47e2jEFQPN3JliSWQ7TJETjJihUPbtT1uuiOhBL/Y4ITOPKquDXg30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgkOenJjt730CqLRMb4iaXWewRAaOXqGc6a295SZ5MM=;
 b=W5uYkSz7/wV8mnxKxn93wovgEjelorgk4/uQ1eE5MxcziwpU3Ps4E9TZpLyv4PdtbHy+AHBfmCCbpQDWNaQMiQZhg/NJBdIJAypNFPszudsiiHzVb6YznJbboNVX5/VJtOwNg0GjfxO091HdbJ4locuu00nNyCDLP/1cNAdE9gKI/lTEb7jJ5B7XFj3DtDZCmO8+jPaTNSyN8FW32vh8/pN+eQriAoCxETL2NiALWW/BcGuaVMiJvtEQVW4x386XzHbxConPYakCBYBR5QFvhiRtYkLE0FsBncnP+rb8npFwjAWBB/wDLpeZ1TWPhtn1+M8soLfT1rq4ml4XwgYurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none; linuxfoundation.org; dmarc=none action=none header.from=fb.com; 
Received: from SN6PR1501MB2064.namprd15.prod.outlook.com (52.132.118.155) by
 SN6PR15MB2256.namprd15.prod.outlook.com (52.132.125.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.24; Sat, 5 Jun 2021 21:40:00 +0000
Received: from SN6PR1501MB2064.namprd15.prod.outlook.com
 ([fe80::d886:b658:e2eb:a906]) by SN6PR1501MB2064.namprd15.prod.outlook.com
 ([fe80::d886:b658:e2eb:a906%5]) with mapi id 15.20.4195.026; Sat, 5 Jun 2021
 21:40:00 +0000
Subject: Re: [PATCH v4] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <000000000000c2987605be907e41@google.com>
 <20210602212726.7-1-fuzzybritches0@gmail.com> <YLhd8BL3HGItbXmx@kroah.com>
 <87609-531187-curtm@phaethon> <6a392b66-6f26-4532-d25f-6b09770ce366@fb.com>
 <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
Message-ID: <f045d171-15ff-8755-bcb7-4e20ca79b28a@fb.com>
Date: Sat, 5 Jun 2021 14:39:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <CAADnVQKexxZQw0yK_7rmFOdaYabaFpi2EmF6RGs5bXvFHtUQaA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2620:10d:c090:400::5:8c03]
X-ClientProxiedBy: BYAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:74::15) To SN6PR1501MB2064.namprd15.prod.outlook.com
 (2603:10b6:805:d::27)
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2620:10d:c085:21c1::1a79] (2620:10d:c090:400::5:8c03) by
 BYAPR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:74::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Sat, 5 Jun 2021 21:39:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6484aa65-42f2-44b8-9dfe-08d9286a787e
X-MS-TrafficTypeDiagnostic: SN6PR15MB2256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR15MB22562D3CD2ADCD644F0B5BECD33A9@SN6PR15MB2256.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6gdZGVHfNFgESn93oIqf9IOutt0Uy/vYJXLma1kywiLkWeuZxNg7BhfcQ/JTsjaTsSBROud6ZtyahbnZQr+9KMCm0fOHrl/zNTHroyBTTfZ0Naa6cb/+quX5vb5zNl+mlYGgrX6iWd5YtxGxUwl+wHi8YGgLiYuPdPtOzbLplo7XbCHAeNmrtQGWOaDNOLlOvpfUs8Um06aBamrc15j2ffdZu5AW53YkKXFxySdoy3lmBv4wYzxE6TdJeYCCiFC9MaeJ3nRL2GsH8aZLhXOlBR3sA1bcfoSNl32c43hdbc7QiEkskJG+pR620MoX/ZUSOHnxLZreO29KPMuFmoJsLkKXbnENUzwL0uMx5BQQ0HOT5excXiE+gzYE2QPLG7Knd4xH2fozLECfmXRtp4P8Aq8boaqoYCA9PSSwfTWG45LDP8eOeulreH2iCt1zuze2qQBfFHluvkkGQVGJDPEM4qjblhWKF0a7UceSN/6IDnAnZA/TMHo6gKq2w35eAJoSOa1XKKiFMm0U0I+QdjeN+hjzDA908tSW69ajHHzpEOaA6rSC9F1UKSdPlllFqaV4c4eS10rf5DwZUaP21qcWsZtV6qdKqZNYxEXA0fXt8isaaOjSSGY4d5Co8wkrxXXkwOlr7Agpcsa19vUfCpAWVq79gF8AuBg0245k65c88KSAFJEwR8oFZtU4ohaLiv1WvVUdMQBmz4KmwLQ6FQ/eeMdRflZkfD3VUQvHINAGhBLDinMDwYe6PIJs/O09nJh1kjTRBNB5zengTUWy2OsoQ3zXPyYebVmc+TxvxOat2en7qOqUp6d5eO7ICj35OjV5TMbWzX1xIMbzp1ugXWNih974TXnK7m5Fb/d8aFtLphc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR1501MB2064.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(316002)(54906003)(7416002)(38100700002)(2616005)(6916009)(66476007)(66556008)(66946007)(52116002)(2906002)(478600001)(53546011)(4326008)(8676002)(8936002)(16526019)(966005)(5660300002)(6486002)(31686004)(83380400001)(186003)(31696002)(36756003)(86362001)(99710200001)(101420200003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFZkWFhlYUF0U0tDTGptTWtxOWorT0JKeS9PbUxaRDRQQ09yZzFBd2QrMjhU?=
 =?utf-8?B?U2M4eFlwVmFXbmE1QzIrcE5uV1pycE9ldlRVZ053UVo2emdINXZwa3hrK1A5?=
 =?utf-8?B?TVBQRmZMRzV2OXVjaXRpOTB4WjMrV2F4TDl6alRYVDhZSzMyVUUweDBCbXR2?=
 =?utf-8?B?SFl1TXdWbGZuQks0alQvRnY2WkpQMlkzc04zb1BMaDM1UDM0R05JU1U4UEtu?=
 =?utf-8?B?bVBlcm9OajIyS0Q3dGt3aFdjeGZDZ1lySkFKaFJNVG5ROEhqQkFKQ1VrUC9j?=
 =?utf-8?B?c0lxUHRnZHo0TU9nSWRtQkZZeWVwZEFWbzBUZXV2eDhEM0xsa2pMUmdTVWdD?=
 =?utf-8?B?dUdOVVB2ZjRwVWM0TTBiL0QvMkdldmc5R1MyaHIzbnV6cU5YdXVOeS9PMXRT?=
 =?utf-8?B?M2pJUXJ1WWtRVmtjajBpL0V3eStQYjhFdG0vNlNHcXA5bXN4Z1NNWDZ0ZThT?=
 =?utf-8?B?blZ4aGJjdVUwVHczOUdSSlR3L1ZDYVJDT3VYa3ZMOGQrVkpsdmpyWGl2SDF6?=
 =?utf-8?B?eHJ5VjZVbUl4QWE3TytUWDB3Qk9Rc1hYb2FMVXdMeGZKcjdCSmNxNlczaWdE?=
 =?utf-8?B?OVNkZjdIVXZDMVh0ZzVqTWVZVEJzWVExd244dHJyM1BpMktiR3JOaUFqQnNB?=
 =?utf-8?B?dVQ1WU1PNTVnWWlFOWt3Z3NSYllpMXZQZGE1YytyMlk2bWQyR1R2Zk1waDI5?=
 =?utf-8?B?QkJzVUVmTVpBRkVnUmNiWXYvaWlDOUVFemkyRWxhNlZJUHMycW5COWp0cEp2?=
 =?utf-8?B?MVBGei9qTTN1a0xMcGE3RmJrUGEyT3JvQVBpM0VNMzd5RWlqNnF0UzIvUndQ?=
 =?utf-8?B?ak1aanFrdFBuSUtoYmNEbFg5K3ZRZHd0VGR4aWw5TEhZVnJJeW1qWDB1Nng5?=
 =?utf-8?B?RlFIeitQalljbmd6eFRoWDRpazZMMGpjR00rWTg5ZHZFZ0drRWxjaGlrdUd1?=
 =?utf-8?B?YUg4SnJJS1JnVmNaZ3ZoRGVBQUovTVIwd0tVL3NZZUI5WHZKeUZNcUpYOGJm?=
 =?utf-8?B?R0IvWVRrZml4N3VVK0szQ0FYa2RrcnZ5TC80cGFhUzlINUpjNkhhazFvaWo5?=
 =?utf-8?B?YW9ObW5RT2lZZ0xZc21rbFAySTVlaUF4c3RaN1UwWlQvOU5XMldBSFlIa3JE?=
 =?utf-8?B?WE5keFpiM3JyRHY2YzRTblU3TXcrbGZVV2pRcXZ4aG1WV3VEeGxydlNsWGgw?=
 =?utf-8?B?MTVtdVA2THlmYmFSM1FXMHJCRy9ZQU5NTVVzMjlWemREVmVzQ0RvZHlpaU4w?=
 =?utf-8?B?dE52T0FiUUNnN0s3SmllM2xYRlA4OG0xSy9RSlE1WUpBMkhYWHdOQXltem94?=
 =?utf-8?B?RXJzcW5vOG5CaTFtN2NOZW1zZm5ScXVrQXg0aEtOeW1zU1hXWFpjdjZld0tj?=
 =?utf-8?B?T1hONmZnQ0xhbzZ4M2JiMW41M3piZUNwQTJrWDFoSzVEZlYxdzdza2FLeHdL?=
 =?utf-8?B?cG9hYStQS0N6QUcyVXZBWUplUml6U1hmRUxvZEhuazhCdFQyaHFNaE1Qa1Nq?=
 =?utf-8?B?b1MrSGxLRFJiekR0WCs4aThwdzJtL0ZRK3ptbnFJQVBOVWdkNmFzRVhWck9y?=
 =?utf-8?B?MlgwL1kzekVpV1ZBMzNpd1FxOTg0SW5pcHpOdCt3bGdZbGw5c2FQU1puK0lr?=
 =?utf-8?B?a2Z6SnhDREpBUlRKRUxDOHBrMURmTWV2R3ZwWk1FVlM3TlF0d2tRU243amFZ?=
 =?utf-8?B?aTcvNTF2SUlGUlRBbDl5b0s4dDgraWlWMzVMU00rYWIvUE1IWUhSdHI1K3dz?=
 =?utf-8?B?S3V5aUZEL0J4UnNjMThQMU5TYlRub3k1Mlp3VkhZTjg0Mk50V2RKdU93WFZi?=
 =?utf-8?B?dUNpZkhMT0pqUFFZOWFGQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6484aa65-42f2-44b8-9dfe-08d9286a787e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR1501MB2064.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 21:40:00.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQK1g6aLcEFMk3xEj5EUH7jDO62g62dRDwJH6zH1o2SymGypTq8sTyaESUd5lYGd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR15MB2256
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: KCezvDWmCia33BrwB4twdo11JpFM99bu
X-Proofpoint-GUID: KCezvDWmCia33BrwB4twdo11JpFM99bu
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-05_13:2021-06-04,
 2021-06-05 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106050156
X-FB-Internal: deliver
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 syzbot+bed360704c521841c85d@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 KP Singh <kpsingh@kernel.org>, nathan@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Network Development <netdev@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <kafai@fb.com>
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
From: Yonghong Song via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Yonghong Song <yhs@fb.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 6/5/21 12:10 PM, Alexei Starovoitov wrote:
> On Sat, Jun 5, 2021 at 10:55 AM Yonghong Song <yhs@fb.com> wrote:
>>
>>
>>
>> On 6/5/21 8:01 AM, Kurt Manucredo wrote:
>>> Syzbot detects a shift-out-of-bounds in ___bpf_prog_run()
>>> kernel/bpf/core.c:1414:2.
>>
>> This is not enough. We need more information on why this happens
>> so we can judge whether the patch indeed fixed the issue.
>>
>>>
>>> I propose: In adjust_scalar_min_max_vals() move boundary check up to avoid
>>> missing them and return with error when detected.
>>>
>>> Reported-and-tested-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
>>> Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
>>> ---
>>>
>>> https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
>>>
>>> Changelog:
>>> ----------
>>> v4 - Fix shift-out-of-bounds in adjust_scalar_min_max_vals.
>>>        Fix commit message.
>>> v3 - Make it clearer what the fix is for.
>>> v2 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
>>>        check in check_alu_op() in verifier.c.
>>> v1 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
>>>        check in ___bpf_prog_run().
>>>
>>> thanks
>>>
>>> kind regards
>>>
>>> Kurt
>>>
>>>    kernel/bpf/verifier.c | 30 +++++++++---------------------
>>>    1 file changed, 9 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>>> index 94ba5163d4c5..ed0eecf20de5 100644
>>> --- a/kernel/bpf/verifier.c
>>> +++ b/kernel/bpf/verifier.c
>>> @@ -7510,6 +7510,15 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
>>>        u32_min_val = src_reg.u32_min_value;
>>>        u32_max_val = src_reg.u32_max_value;
>>>
>>> +     if ((opcode == BPF_LSH || opcode == BPF_RSH || opcode == BPF_ARSH) &&
>>> +                     umax_val >= insn_bitness) {
>>> +             /* Shifts greater than 31 or 63 are undefined.
>>> +              * This includes shifts by a negative number.
>>> +              */
>>> +             verbose(env, "invalid shift %lld\n", umax_val);
>>> +             return -EINVAL;
>>> +     }
>>
>> I think your fix is good. I would like to move after
> 
> I suspect such change will break valid programs that do shift by register.

Oh yes, you are correct. We should guard it with src_known.
But this should be extremely rare with explicit shifting amount being
greater than 31/64 and if it is the case, the compiler will has a
warning.

> 
>> the following code though:
>>
>>           if (!src_known &&
>>               opcode != BPF_ADD && opcode != BPF_SUB && opcode != BPF_AND) {
>>                   __mark_reg_unknown(env, dst_reg);
>>                   return 0;
>>           }
>>
>>> +
>>>        if (alu32) {
>>>                src_known = tnum_subreg_is_const(src_reg.var_off);
>>>                if ((src_known &&
>>> @@ -7592,39 +7601,18 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
>>>                scalar_min_max_xor(dst_reg, &src_reg);
>>>                break;
>>>        case BPF_LSH:
>>> -             if (umax_val >= insn_bitness) {
>>> -                     /* Shifts greater than 31 or 63 are undefined.
>>> -                      * This includes shifts by a negative number.
>>> -                      */
>>> -                     mark_reg_unknown(env, regs, insn->dst_reg);
>>> -                     break;
>>> -             }
>>
>> I think this is what happens. For the above case, we simply
>> marks the dst reg as unknown and didn't fail verification.
>> So later on at runtime, the shift optimization will have wrong
>> shift value (> 31/64). Please correct me if this is not right
>> analysis. As I mentioned in the early please write detailed
>> analysis in commit log.
> 
> The large shift is not wrong. It's just undefined.
> syzbot has to ignore such cases.

Agree. This makes sense.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
