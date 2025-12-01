Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06144279DC3
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 22:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764628124; cv=fail; b=JAtmCQCZ8Wk8TWfzxRaTKnI31vpn8Z14KmXaIdC+nD/MhojDb25H25T+7DmC7+FomhcM6JJHHT9zkK48874dkVtK+xNGktRsg7mnBFWF7e5JqbO1XK4K3RhcPyBpEp7vEoVlHFg0F+wLHh7fjZOG0EMmi/nRCxUvrcDyix1q4w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764628124; c=relaxed/simple;
	bh=ynyV+Eq9XiesoZ3xkPkRTZ+utlzhCpgErJHY3W3Etr4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j1bkzLBn8NIYx9fiV5CzeFHp7zgyVkA8l7AORAeiU0mJ6AdBgIVT+Ql3jtfpV69zF4YtBfLK1s8wsguf8RqNId+/6gwukvjwV1lh9Q+CYFS2cZJz6Ou+KZb3RykuNHBo0TP2dV2Qk/idQmv2stsuVxCrI3PN1mcebBUc27nhHnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lLs57+2s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=beFaijjf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lLs57+2s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="beFaijjf"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1MNMbT2958956;
	Mon, 1 Dec 2025 22:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=hF4yeHZ1ZUnMGKDdAHZOpSGjvxQoOBaYXhTQ8ijf6Us=; b=
	lLs57+2sinWlfWOm7Jy9t7oGE6R8mS5ohMT+Vo9UtnpSkTZ1aorTJMiCCbhxcGFl
	Qf0Hj2sqgaYE2ppwYxyuLjBhghLphbxT1VXjgabcplxauzMGPhdaSE4tCaL9e0bH
	pXzf5H2cz11OcsUgOtW2fyGloxbi/QK3btT7nsEJpqr0clnga33bVEQys05Lbx7k
	mlDG5Cx0sjo95cLz2771Vu4ycn47wh4xxIjAvibtJ9Z0B07WssOPzGFQQl7tbZKZ
	2uNShxz7tTwq0esdcAIRDeo7I4IsriPjxeceBTTFvp7qIOvjGTKPLKA69FAsUu63
	Wlmk53Nx1ZmeYejWvb0AiQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4as86y9jkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Dec 2025 22:28:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B1Kwh4Q015015;
	Mon, 1 Dec 2025 22:28:32 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aqq98kuse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Dec 2025 22:28:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYeI0k+dH9acR3klHTzZLNB/5irFZ6kNaXK7tIlZ2w47ylx2Muu/2yVUaWaGSn/P+z9YwtP8XEC2Cv6em6ybQQgMvJagxwSrQ9doURRTNSgGLKsuQed/TJWI18uu5AR296u7g4tijS/JF4G5RXNUYD2/9105vW7/SpmU0U8II3uaY3WNJ8oLpcDxFTKBIqgaY0GVRxBBLFdBFXtf3TiYhSNvaSEvGC7hplZScg+7gsJ6nJSai9/7qPIImdUhxrI0w++qQPv4O7cDbzxOC+3cwGEBiqYU1Gb/ULkaLxu4IypEWvIXpPMl9HGOiZ8ZC6i7vXWzqw7L0a0IYjWLa25SFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF4yeHZ1ZUnMGKDdAHZOpSGjvxQoOBaYXhTQ8ijf6Us=;
 b=Bk7thN8IV6CwxIbMcG4VaL4eM71gypvOlfINezl5AcZtFTDXhpU+oPZEPx2dBrdySJmEp9ziDCnz0hsHGUwmKWjNJbjV/QRFT5VcZak2ehHZa6KnCoy8JSiiU8enXIvJN5GIcMdMF0fKE8iHZpsrC0QSmudQCDLbfWSVRLqjzuQ5pCm6DJEJUhVPQOed1k+xlOqzt+rnO4zQMsBtW7TfQFzVw2s9I5FliaL08iZ5L7lCjaftuav9dSxkbLpwFZj3g9J1vQdFU0fXeKJsfbEHv162eTuw88vWeP7l+OQnBB26GjqK3c4f9xSkwfQK8Mjs7bFaMMDBXaojh4HwfDWyrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF4yeHZ1ZUnMGKDdAHZOpSGjvxQoOBaYXhTQ8ijf6Us=;
 b=beFaijjfH58fQWMgwrYXoY1G6ZOYf2V+Auv3LkIZ7NXfhkLBDH9CVp9hGEnl4vEZuOo0ak38u3M6nZiyzYpUAd99G62NrwvNdbWBuWnxdnpzJo42QR7gH0vsQIt6Ta2otMCyYrKmjr5FIY5KmJup8Abi2vXNdIUtqk5YDOUdV9s=
Received: from IA1PR10MB8212.namprd10.prod.outlook.com (2603:10b6:208:463::20)
 by DS0PR10MB7150.namprd10.prod.outlook.com (2603:10b6:8:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 22:28:20 +0000
Received: from IA1PR10MB8212.namprd10.prod.outlook.com
 ([fe80::ee8a:bd21:f1cb:c79a]) by IA1PR10MB8212.namprd10.prod.outlook.com
 ([fe80::ee8a:bd21:f1cb:c79a%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 22:28:20 +0000
Message-ID: <ce27c52c-4342-4b0f-a5ff-cab55ea6dc4d@oracle.com>
Date: Mon, 1 Dec 2025 16:27:33 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] jfs: Initialize synclist in metapage allocation
To: SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, dsterba@suse.com, david@redhat.com,
        shivankg@amd.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
        khalid@kernel.org,
        syzbot+e87be72c9a6fe69996f5@syzkaller.appspotmail.com
References: <20251108141834.46428-1-ssranevjti@gmail.com>
 <20251108141834.46428-2-ssranevjti@gmail.com>
 <CANNWa05ecKo0MOQDUAusuDzNdyFH7gEpF-tS1-Z56Gpg_jWZ5A@mail.gmail.com>
Content-Language: en-US
From: Dave Kleikamp <dave.kleikamp@oracle.com>
In-Reply-To: <CANNWa05ecKo0MOQDUAusuDzNdyFH7gEpF-tS1-Z56Gpg_jWZ5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:610:e7::19) To IA1PR10MB8212.namprd10.prod.outlook.com
 (2603:10b6:208:463::20)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR10MB8212:EE_|DS0PR10MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b69728-46a7-46e0-bd41-08de3128eec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2dwb05IcUhXUCt6M3NwT2xxZk5UUkJXYXhIZitYa09JZUhuWE0xMkI0N1E2?=
 =?utf-8?B?UURDTjIwT2NkcEV4b0lHcm40SHIwR1VlYmVMYU9yV0xBKzJWejZ6YksvdUlI?=
 =?utf-8?B?cTR4cU5CMHRjK0wwbE5veWNES3VzN1dDSmxCZTNKc3JZTGFhcEVTOE1PTU9Z?=
 =?utf-8?B?OU5HblNWOTFPSWZTam9heWYxWW9VRUh4STNMR1kzWElLUkRVM3lEc3FYT2NJ?=
 =?utf-8?B?WVRhODNVWFpCb2V6Zzd0Zy9DM2hkRGJweC9iK3VtdncvOStScDRTbGdtZWI0?=
 =?utf-8?B?dElDSGRWcjVOU2ZEWWF3bGNycFpTS2MrR3A2YWxRMFpIMVhSbkdHWGtRcXpH?=
 =?utf-8?B?MmJwSEpaUk1DeDlrbURuQXI5TlVGZjhPYStDcElnVDF2MVNVaUZvYmIxOXVG?=
 =?utf-8?B?czZZcDRMcDhVcW5HcTV3OUJQcjNndklQQVUyQWxBQWRvT3FBR25DMjQxbGNC?=
 =?utf-8?B?U05HT1YvZDZCcjBVYlZ4QUFJNzcyTFZPRzMxU29LRmxOaVJrQ09kRnRVeVg1?=
 =?utf-8?B?NE9FelM4dFdJRStZdUNKeFFTMGZOcTJubUNsY216YzhweWpaTk1ZVHBLVDdx?=
 =?utf-8?B?YjZrZ3lMR3BTeTJiWmZIUU02cXk3S290ZXVkMGxsOHYvcGxud2UzLzBsZDdD?=
 =?utf-8?B?NWNpRndlL0RLVUxnaGMwQW9STmRJWnkzaGRndGhRblE5TC9YODN3R2h3dENa?=
 =?utf-8?B?V2ZDd2F1djVMZGhQTkJNdkVyWkRGQnNjWVpKTjlxdkk5RVl3d0FOWWY3Lys2?=
 =?utf-8?B?U1FBOURCQk5kbE9FVDRKZkh4ODFWSnB0ck5yNmdwY2R5Rm9DVmdXNktRNExI?=
 =?utf-8?B?RGJzMEViNUlPc0tteHpTb0lodUV5eDl6WmFOV3VpZTNrUGlUN3JDbTRLdDFi?=
 =?utf-8?B?Y3lqbkttbEpmZE1hS1BIdktKNWZINlF5OEhXcXVBMk1mRVNkbnRHa0owazd2?=
 =?utf-8?B?ei85eVUydkFrUzZsRTlXekxrQmprTmg3blF3NkVoekQwK2tJRmRsclBhUVBI?=
 =?utf-8?B?cFBYSDV6WG55TFBaMjFJaGJwd3E1MWZTWENUZGMvUWpDNHMvRlhmWHFON3pq?=
 =?utf-8?B?OExXN292UG50YnRtZFZDVXY2Ni9ERmFrMkFXSGZxRStGMy93di8xUGU2a1pr?=
 =?utf-8?B?V3VTcllxYUh3V3EwbENTaUdtS0tOMVBOL0w0bWlkYm9vUnNucU5KaGFqdUNo?=
 =?utf-8?B?cDBheDBVVzVKOXZuc1pkM0NoM2dMNFRGNnBZdFQxZlJoa3FaUDN3S3VFSTM5?=
 =?utf-8?B?b2VqWmJzRFlCSHl3WEVzKzV3NGxXc2FJUmk2bThhd0pzWXZURzd4VzFaUHBo?=
 =?utf-8?B?L05VNUZoTldxV3lqYmJVcUVPOHJjbzhBZmhpaDRVQi80Unk5dUxhd1dHWmE1?=
 =?utf-8?B?aDJIcDQ0NUh6dTIxeUpDMExreTVueVBaOWkraDFZLzJyRlpsZ0tWRDlod0x1?=
 =?utf-8?B?QSs3MzEvUmNmN1NqeXZoZzBvOWVsNUw1KzRVOUNNTXh6ejVZTmoxMGw4RFBn?=
 =?utf-8?B?T3MwZEU4akVzSHlxMVdWUldZR1dEZzdXWWtCZ3JTZ05kbjBjZDVLU1ptQ1cz?=
 =?utf-8?B?ajZoVG0rVFB3RmY2MDg0TlJaV0NKeDRBbzdZcXphdWlhTEI1MkJRVzk4OG5L?=
 =?utf-8?B?NzdkRWhZUXQvNkdFUkRyYS9CMkMyZ014ZWg5NEFMZklPTGJISXNLYjhVOVA2?=
 =?utf-8?B?T0lSK3g3YWNWbW5Ob1ZDcW9PRGsvMEYyMERSR3ArOXFPOFpoNTEyQjBqY2Zp?=
 =?utf-8?B?eUlWZytUWnFnUVJLKzlqY01pNmFvYUdlekY2UzR0Y3pjblFyVTdCSnJtWU0v?=
 =?utf-8?B?T0hHVzl1YmV2Z1ZxVkIyRW1XR2o5d2l6VXM1cjhTblp5WHpuOXdxUm9hY1lm?=
 =?utf-8?B?cVhPcFZ6VWs2ZjF1WnpRUFBCMFEvTXU5YXdEcElEa2VsU2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB8212.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3lzWnBYSkpzWlFDZWppUFJ0WFZjV0lqTG5NM1lnSkZ6QnF0V2dDUUs0UjJq?=
 =?utf-8?B?KzQybUZOWkErMUhCM3JseHJFRGErMjFFdEtYZ3lodDVsVVJBZVVmL25kOC9t?=
 =?utf-8?B?SmRjYmgvNElhazcvUHdTa1JJNnV3L1pjM1Y3SmdjSnd4Z0E3YXJFcmxlUEZB?=
 =?utf-8?B?VGk3akNoczNLRVBsT3lhM3RvU1ZLcjJLUTl5Yy9tQlo5UzRidVpFTC8wd0k2?=
 =?utf-8?B?SS9tRDdwME50dkx6RDhiMHFRbSs4SmMrbWRKaldENlNsRk9EVEgzV2ZjM2JS?=
 =?utf-8?B?U3FrdXFMZmwwRVZLUEIwS0U2bTY5RFdnWGczYk41RVNJa0VEZWhIaXNCMkEv?=
 =?utf-8?B?OG45TUc4R21FNnVyQ0d0ZkhWWW9IMzdMaFVxUUk1NVZibHcwV3RsaDNWb2Rs?=
 =?utf-8?B?SlBVWVVEWDZFSEVjYjFHWndxN0tqTWgyUjhFRmQ3dWVzb3BqVjlaVHl2TXEw?=
 =?utf-8?B?a0VPQUYvV1NGR0tPL3BwUnk1ZnZWVnlIdXdHdGVKK0xLSWI5YlQrVmFPdWlY?=
 =?utf-8?B?aXhHQkZ1d09FMzdYYmtVaXYxMTFHUFhaSHZMTENkUDFEOHZ4bXk5M0dORmo2?=
 =?utf-8?B?NzUyQzBiUDMvWjRHclllSWRuMmZYM1BPbC9iY21oNXRqODVDQTA2Q3hsOGhz?=
 =?utf-8?B?eWRzQ3B2cFVWR2oyWkFidDZ1N3RhbE95WTJUN2c1WWlGWmRyR051VGQwU29Y?=
 =?utf-8?B?U3pUQ0xONW9EWkRpaE1IQ1VhSkRQUVJMc1JjZmk5dkIzVnZPOWNBZUZ3ZXlm?=
 =?utf-8?B?OFgrMDU2Yk0yZGR5S29mUXlJOTJINFU3UVNEeW1YR283RmRuTlVueFdEL0or?=
 =?utf-8?B?enVKR2o1dUJPU0lkbER5bTV5b3JYRDZ4aFNmNlZLZWM3T3JOUm5tS1pQcnpt?=
 =?utf-8?B?ajFBa3gxWDZrUC9uZ2JzbTlvdTJTTWFiM2xtNHhXMmlUMFVvejdGa3ZnL3ds?=
 =?utf-8?B?bXdVMEZCM3B1K1FXbTVkRTVtVmNZMkpFTW9KbU04RGlOVjk4SDI0N3dWUEl6?=
 =?utf-8?B?VDBkVEp4d0dORXdvVHB5Tms4L3d1T2xBRUxEUDY5THREL0QvMUtJZklnT2JW?=
 =?utf-8?B?R3RSK3RZVUlsRXljcVpuVWVhOFIwMCt0RGd0bTkybG1iK1BpdFlwcFdyUUpv?=
 =?utf-8?B?S2k2RUhuSklBQUg3TXpkTGVKQllMTHhzWDN1MEFuMDRkbGpQNVJKc2wvTkVZ?=
 =?utf-8?B?anUyVTNJcjAvVnlrUnNWMTNEMEk1ZkxvUHFhbGhVUCtMd0ZLSEtEQi9GQ0pF?=
 =?utf-8?B?d21PZnQxS2x5WVhOUzcrTjhaaFNDWElUb2xmQ1Z0V002ck5BZk42OEZuUDE2?=
 =?utf-8?B?dlhaSTJCOXdaQ05jRWJCYmNMVURTTHpzcEF6N1Q1SnBNZ1JYQXJNL3pyRllX?=
 =?utf-8?B?Ulg1aUZkdVZKYnAxNkY5MERMWnpJOXZyc256YTUxZytnTENDa3ZqMGFEMGFZ?=
 =?utf-8?B?dkJWWExSb25NUEhReVVUckFCWjArYWovc0xmY1BqSXBMUEx1a1VkUDNjTnE5?=
 =?utf-8?B?cHgvb1QvNURQYnVrdGdmaUlIUzQ4QkRsejFGcHE3R2pRRlllUGphd3FWOUVl?=
 =?utf-8?B?d01NVVBEQnJBNDR0aHRkMzMyaXFnc1NaaGswbHVVbW51K0hoajFMMGxMcTlu?=
 =?utf-8?B?SFFyUzVIT3IvZmxQRHpMNHNwNnpqSkNodXZvRzNNZ09YRm55NGVHU2lvNU5s?=
 =?utf-8?B?Vm9hTjFKM1dtbm9VU1BRSkFweitTTnJyWHp6Y2ozblB2dENTZmRhblowYTE0?=
 =?utf-8?B?VFlqMFAxU0grTDkvdHFPZ2pqMHdvb1Rkalh3K29leVMvWGx1N051L1kyc0Ir?=
 =?utf-8?B?Q0JZclJCZFJ3aUMzclg1NTBzUG0wTXFMaGFCTmxLSEh3aWRuZXdwTE9vMVVW?=
 =?utf-8?B?bHcwVWllSnhPZ2x1Rll6Vm55b1Izdm1VQ0p1ZVM2VTVPQVVsZDZaTjN1ZGN3?=
 =?utf-8?B?dmhqMXNzbE1oaFZNcEphK2ZJZGhBb0YvSVB1eXQ4S0pNdGJsMDZ1RGRRdzlL?=
 =?utf-8?B?cUpBSFVUdGNXSlRXdzczKzNDcEtxMkd6QThqRElHeW9LajV3Z211M2tWY2Zm?=
 =?utf-8?B?MTlEeks5d01FRXZ5S05HM2NndUN1dDUweExJbzJYcVk2eENXMFBtTTNkNmxq?=
 =?utf-8?B?Nm1WVFRZbE1jRzN3TEpmWWo0Z2NXeklJdzYxN1VDZUdrbUFXVGZqVGZxMU1Y?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p7b64sKFK05Bzaf5zSgo3f8f2FY566oyoBetA10NKoVeAnaUthsgKmHTJdVhYT06MU/8SepgG4sGlgqWvSkBWyhW01LgRJtS5ScBTiOJnl1y32/SWBdocYOxJ3oMsQi3PauDdRp7VYLdnIuRW8BylLkk1ESS7Oqy3k3O5HpDLfwa8suXzMWpTxaFp8tFVV3gZPbHfq4ehZhZBFJb5E45BfuXDxLg6GhBikAnSshLO8JyVKdp2YCfmOH4GU3KW+ugRqF9jGvSSESGTUIDbWZRI5eJMO7s2zCeVvkFlwcmHn+OMx6s6hG/w6peVbhXxp79ToK8R2d76NFBuYm38HcWgKtHasUZVOUqtm1D5VxhXU4cS/Hdwkud0kfC6IEcF245cM5N+qHSBgqGCKr2q+yPR7EGh6fxc+u6TYy++Y24hi/6cXTz1e+ygKx34QUtZSANHFnxhdzeKKRdadgTUm+kbYnKsdcctUa8MBGc9CY7/npVbKOIQejsJGIkf9cxx1jVJEzZNJvmdRyIB8DFQtLGEDadanxdJ37+WLmhMeku3S9Xc+tXPpZXnkjunsCCeiknzUfFdT4zH4fI7VNUlRLuKyWHQiojpJruW7iQZ27/SR4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b69728-46a7-46e0-bd41-08de3128eec7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB8212.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 22:28:20.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DrirMOLb69BMNZKl5jFD55waZ/l1xuXtN770WlnneEd6erofA/ys3RBtEUL7tp74okfD+uzkMOXDjDgTV99xrTMPP8e6tdlvBXQrJWg1eF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7150
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512010181
X-Proofpoint-GUID: 2jCeCz0p_E7T16LuyN0b2hEBDViZOK1K
X-Authority-Analysis: v=2.4 cv=AaW83nXG c=1 sm=1 tr=0 ts=692e1691 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=-2JsRSa7nL-K_DRVXEQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE4MCBTYWx0ZWRfX4RNmTo2dcwi4
 2Gto2tKeFSk7Ep1vhjk6QKEQsbZssk3E8iTGDziaYcSfDbv7P4+C2O9dd80yjZ+ySh2hCCwfoJR
 VzmR22mTNtOCEEhxMq8Y35dDD8v4lGg/6kqY0tLNdj33D//vw7wkU3ePS69eVAiEhDkGDouO60/
 zlzmcpSV6kB0T45SrZjmLKE5HwIGWXi9Fo1ZwQxvNHRw70aFAadRMNYpfw2iYkPTEIkGFI1RIAD
 Ru/aotRrqiWZoGtWUp8LfQhnZAOTJMdUkCS1sgbo7+Rd8U16SaYJbcNxA99sBSCZhm3/LF9GBHV
 7qJ20pppQK2nvPfNxzctd6ellf3dytC6yz0uq2p3AYYlO4az8Zchgt9DW8CcGiIkLfXBF4AmpmN
 iDdt4QQKdzP+S/t1o/R+zXNvwem5wg==
X-Proofpoint-ORIG-GUID: 2jCeCz0p_E7T16LuyN0b2hEBDViZOK1K

On 11/22/25 8:42PM, SHAURYA RANE wrote:
> Pinging if missed

Sorry, I've been flooded with some other work and was also out on 
vacation a bit during the past month. I'm trying to catch up on a bunch 
of submitted patches now. Please be patient.

Thanks,
Shaggy

> 
> On Sat, Nov 8, 2025 at 7:48 PM <ssrane_b23@ee.vjti.ac.in> wrote:
>>
>> From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
>>
>> The synclist field in struct metapage was not being initialized during
>> allocation in alloc_metapage(), leading to list corruption when the
>> metapage is later added to a transaction's sync list.
>>
>> When diUpdatePMap() calls list_add(&mp->synclist, &tblk->synclist), if
>> the synclist field contains stale data from a previous allocation (such
>> as LIST_POISON values from a freed list node), the list debugging code
>> detects the corruption and triggers a stack segment fault.
>>
>> This issue is intermittent because it only manifests when recycled
>> memory happens to contain poison values in the synclist field. The bug
>> was discovered by syzbot, which creates specific filesystem patterns
>> that reliably trigger this uninitialized memory usage.
>>
>> Initialize the synclist field with INIT_LIST_HEAD() in alloc_metapage()
>> to ensure it's in a valid state before being used in list operations.
>> This is consistent with how the wait queue is initialized in the same
>> function.
>>
>> Reported-by: syzbot+e87be72c9a6fe69996f5@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=e87be72c9a6fe69996f5
>> Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
>>
>> ---
>> Tested:
>>   - Tested locally with syzbot reproducer, no errors observed
>> Changelog:
>> - Correct bug link
>> - Corrected patch format
>>
>>   fs/jfs/jfs_metapage.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
>> index 871cf4fb3636..77c512a0a42b 100644
>> --- a/fs/jfs/jfs_metapage.c
>> +++ b/fs/jfs/jfs_metapage.c
>> @@ -269,6 +269,7 @@ static inline struct metapage *alloc_metapage(gfp_t gfp_mask)
>>                  mp->data = NULL;
>>                  mp->clsn = 0;
>>                  mp->log = NULL;
>> +               INIT_LIST_HEAD(&mp->synclist);
>>                  init_waitqueue_head(&mp->wait);
>>          }
>>          return mp;
>> --
>> 2.34.1
>>

