Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BCD2E173B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Jul 2026 01:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288957; cv=fail; b=nl2VXMfqQeXP5YRi2IRaA7Y2/aYKwpCOBuPYyB8RE/SbK11t0KZTbIp6PVEni4kc2skjj6ZfMBZ2Km4U8WGGARkmBzToZmfjYNQHKKFVzG7eqc0KLirFEZQDVDZKqPQk8qCUHcu4WVFZiI6xhnzNMra6t2Q+kNCqY1MwOj3cQRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288957; c=relaxed/simple;
	bh=z2JoPsr5zLYTmGGbVfu0ulcN0mhdnNV7eRx7ko++/nA=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=qut4fTwonNgTQQsJxjI/NKbe3KUMo2CSfJiSiBpCUcUbnDZYK8jbozp/LKlgWYgGlY4ChvZbP0i4bAulMFFpL2MlZqjeEzP+K9Wwrz43x7rfcMQ0u+fqLZYmp8fueBDoTYpFQImFsgGnwO9sq3eYbHgQWrfHBNscihSPUdzM938=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mp0nFaNJ; arc=fail smtp.client-ip=40.93.198.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mp0nFaNJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6HCZzwbUgg0smj8TSGnSOxHYrFnnGabspItYV5Hu83wbBEV4NYBdkoO07i7ZdmKYVus8cjz6CAFNfB6IS5QI8+dZgvAFIMfFtz7lTUSbpwbVv5SVITcuGuZtaQzrrWRUG0EjZnBK/JVXtIJ+g4sPgTZeOIsDOJwdsUf6KTKDtYCZG/ArBOPEr2QrnFiPNUalKf27Jw+0e6OKZG4nI4cnbedLDyjFJ2acBIY4+H0E961/PQHOVarjfzQ+ha6lSFZCea3NySp0eQmdY6ewfk6hT9CIxj7O/3LjKShR2MYIEy8MQL6goFXYYwxmODs5UrlnDtp4BTKucRJyYKyvWDTzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtXCLFo4pE46hvuhYj9H7G/TlWXfVuPDTvP4kbTnOXo=;
 b=bgo+y/K3wwauj7y4hwt26jOuBNedEo96LxptUok/qTXfmHrRWY3ls0U4xYrEPkR65ooNRoXtYFqMe2mzwVG2A76hYoONczkWmMGshLQ5PkcfNe1PxlYZv0g6tECmW1//1+D7xz9ZB+HhaoBCs3f4aQa0HBwj/D+g4vR7UELcGQiPKih8vEzZZHDZfmdhIqvi3HRimf7Hz/7ZLMoZq/dbfA0d3U/w3sN1yHrQr6CBR4SNLEJyjNyN6eVqNLpCvcpEsh//1/MPAywavQXCPc0qy4Y15fPl52kLFqR+MNfkd4qPdtkNfE6lYgbpSC6uhgUeN0l+xvZigarvKeHK4FEKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtXCLFo4pE46hvuhYj9H7G/TlWXfVuPDTvP4kbTnOXo=;
 b=Mp0nFaNJqT95e+mnFN0H/oagswfiQinN6CPw5F8LcVF7zeIFZ7ec26do7OuJzKddh5C/0KiYy+oMlb5Fm2MMtJxVaZPf5UUIvVHEu27oDUfqlejlsqCHx4PIT3vl28W/9+dxwjWQkd4FEt6hPdTnhmK/u713LOPaZl1B0k8wRXTx5Y3D07h2XNPEtInHIMfNCp48aW9HqAWutBaRns40BYLkKsRnu67urdthwg3SFPbtu6sUjjjF52Nqmq2NMsW1XVfC2NYyhil0fQjjHrnSKeGri8Hb9lXOmt2/1odAEx9AniQ4XE8701NXWSPniJJhpPXcaRtEDtzmBOxuCs22LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:35:49 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 01:35:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 21:35:47 -0400
Message-Id: <DKAO44AM2YD0.M3P8OW4H5EHG@nvidia.com>
Cc: "Baolin Wang" <baolin.wang@linux.alibaba.com>, "  Liam R . Howlett  "
 <liam@infradead.org>, "Nico Pache" <npache@redhat.com>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry Song"
 <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama Arif"
 <usama.arif@linux.dev>, "Shuah Khan" <skhan@linuxfoundation.org>
To: "Jakov Novak" <jakovnovak30@gmail.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v2] mm/khugepaged: replace mutex_lock/mutex_unlock usage
 with guard macro
X-Mailer: aerc 0.21.0
References: <20260728204636.20998-2-jakovnovak30@gmail.com>
In-Reply-To: <20260728204636.20998-2-jakovnovak30@gmail.com>
X-ClientProxiedBy: BL1PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::27) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH7PR12MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: c83884d5-91a1-4ce4-f830-08deed11b792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SJNaC1/U7tgG4S75Bk+K5qZmeQVMlJ3uKjNqlQtjQ5Y4o9zg9tm2gL2PDwg0+iWOD+iX97a8JYgdX6ArOkoamF+eKXtmNelYeUXosH8L0kolvgZG/OnFYmJm6qVqR1g5MEqbsKQjfjWic52cWIxABjhorJDNSyqAzXYZUIoZf7PPpiypRTRGKqXmnI++ycTfrHr0PpHbAfFe1iNdpOwpWZjg3jE/3Mvcta0sIxP7/8CMyaX+Qae1iXWPy3Dv0eyO+9p71aSe2X1JJOsCsRQkIGX7Z9rSjlKOSbEj8a860l3uA1L3sPnSPxUbwVDhN0QvRxP3wyn2rYVLLVHp8WAYVlx8T/3e8i6Dt5l0NK38moqywHelGxmFYsUwS+qQzRyv/q8/JhgU5S5GBKmbPPG3ju9tb/j0/+Wo/m+qE1zK6oOQuqZrZhDhYBkDU5cL3DaeI6mvxq6zBQ4M1gHflISWI3WVNB8CX9IBy2Tyj2Jz0dnKpW0ueRicQxKJPDwRH5nGfa25v4aBZSsOovLdQDImD2SqzyEktD3KTgH5SI3ufD6CCJIALoOJ3PX6GlcHnjCfxhMAntZnk9xDwJI1YCs70elkEZLNz7vVzuIyLG4Je30s6k0mx0DuNoEnRwvEREhpaI4nAcfUB0JLIixdFAGkzP+2JSl+8tAhdxk62uK/TOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUVwRER4VVI1UWtELy90b1NNWHh0aklJMkc5Y21ZY2M0Mm1QK1JMVHV2Skc2?=
 =?utf-8?B?QjQ4M3lxQjVVSFp6aU9IbURmWXMvT2hVMW80MzlEWDY4USt6Nk1CVGNCYUc5?=
 =?utf-8?B?ZTZmNGcxZU1TeUc0a2wvM01MQ0FjeXZBUkZvNXpsajRoWVhoZkFOV0ZQeUlW?=
 =?utf-8?B?TWZQT2g2NlNpTVZ0bCt5YXhEcU4yODdsSHU1bCtQOEVVSkYrNG9waDdIQ2VW?=
 =?utf-8?B?K3ZSK01lSnBPbmV6TWpjQVU1ZDB4Z1B2QmJCTFo4R0NjTU43cThIQ3NGbGNZ?=
 =?utf-8?B?Wmtyd0pzNkxyYWV3QnB6NXVpUjhNSzRNK05FeURWTHBncmoreEtScnA1dkwz?=
 =?utf-8?B?UFB4aE9tN29rSnZESUs4bmgxcWg3TFBkRVd1eHdWUEsxQVAzS2tDK2UxcEFR?=
 =?utf-8?B?ZFJiaGxBcGdBTk1RVDJ0UjVUbEo5clJiSDAvOEx4SDlJTjhPSVpiZU52WEhJ?=
 =?utf-8?B?d1ZOTkVZSlFYRUtuVHRaKy8rd0VuNFZIRVJPeGdRMGxnR29wdTcxVWt4YXNX?=
 =?utf-8?B?OHRZOVpIMG1MVzRDSkcvN04ycHdGWjBtRmN1K0pqaXdkeFBIL1ZSOXcrQ2lw?=
 =?utf-8?B?VG9jdGNLaVM2VmJPck9xMXhYRDF1ZGhQS3NRMTg4TFpydmxaUzFta29MV2NX?=
 =?utf-8?B?eDdWcXlWYnFYTmdGcG9JVWJpSi9aOHloWWdOM0VNT2VDNE5YZjAzSWNDOUlX?=
 =?utf-8?B?elpCdTVuUm42VWJNdjRzcklyM2Jka3hBTW81QVg0VTByV1lPTStQemQ5cEtm?=
 =?utf-8?B?RnZsRHI0WFcvejBQc09qdC9oRGwwWFRCWmQ0cnk1WVVBWmhNVS9rYUNFdFlV?=
 =?utf-8?B?STR0dXpTSGJWTFZPc0FOakk2QzlDL08zdUs2aHVQVUlUTXhxYUlTUGRrSTBz?=
 =?utf-8?B?ZXFBVjltNGJmSEN6TDJCdWlXUEFmNmJjS0tTMFAwUVdUR1c2RlIvcG9HMlRi?=
 =?utf-8?B?Um84TUlzM2Q5V3ZLZ3BYKzZDZlNlTjFLUXR2Q1dqM2oxU0s5SnBQcmc3bGgy?=
 =?utf-8?B?Tm5LSlk2dm1RdlI0c09jYTROZVgwRnlFV0ZiaUpGTUZJL2ZyalZOQjFjbkhy?=
 =?utf-8?B?b0ZpR0ExeXUxbEIzTFR3cmt0WFJDekZBT1Q5R09xaTlseWgvbU0za2x1enZO?=
 =?utf-8?B?MGxGaThrdHpMUUtxVitUUFdwR3ZmaHF4aDlKaVU2ZWtYeW9kVDMrRWdOMFJL?=
 =?utf-8?B?VHVCK0h5U1d1VDRtdFBlUGJxWUYxbWFLOE4yYysrWWxxMGxrVlJPMHBlaXNI?=
 =?utf-8?B?bmVSWTNRL1R1cHZ6UFRheFFxaWRNdXRWL1NqS3oyZ0o5QXA0NnBVUlJQQkIy?=
 =?utf-8?B?ZzJXMG5pM3ZzZnVpMVB2UHVXeUV2SkRHSTJod1djZlB0VXZpWUwxdG9EaENV?=
 =?utf-8?B?Ym4xeVBhSi9KZHl5R1p2eTNJMVd5bHFFMkFDdGtWeE1yZzN1ZjFwbGlFQTg1?=
 =?utf-8?B?NXV6ODJaeU1UVDJoakk2bEtyTnZNejNTam1QTjAwdUZQUC9BV3BBL2RrM0RQ?=
 =?utf-8?B?YmdHN1A3cnEySmZGR25jZFI2aWJWMEhYNFVSMVR3dllxTzRydnZaNWZLdy90?=
 =?utf-8?B?cmVLbFlTRDhBeXZpYzd1M3hRYXdKQTV1QWI0NklaVUlsQmVnbEVwcThRanQw?=
 =?utf-8?B?RDVCR0cxaVZpZk0yQjNMNmdBK1ZTaVN3bzNOMkhIbmdtaHN0a1ZTK3NtSHV4?=
 =?utf-8?B?aENQa1dKaGJPc1Q5VW9uOFF5SDcyUWhmNzdsZXZIdlZkakF4TVJUZGNqY3ho?=
 =?utf-8?B?eG9jcWdpVDNiSzJma0k0cUxmcytXLzFxTVo4aGJ0L1kzYWtYZTNIRFBJbDdK?=
 =?utf-8?B?N3ROWEljbkZzMTdDQnd3WlhTbGNXd3h2cGZONlU2M2ZSRzZkQVFyRnB1MkNv?=
 =?utf-8?B?SG9XNHlsK0pyenRCcGhPek01elhCRTNJeWtDeU5YRXhkV29DTm9Oa2hEU0d3?=
 =?utf-8?B?aDJKLzh4alEzYXRTdXB5dFJQN0hOOFpUYW9raXBHeDVRenFodVBNeTBFRkdr?=
 =?utf-8?B?MVVCM1ZzeXJMdHV5TjVhbGY1MzZpSG5DY2hYZHRPOW9ZN1RDdGRiRUFtSFJu?=
 =?utf-8?B?R0RoTmlLVk9zbHlSMjJkSmJocXZ5d0JnSE10TEtpNFp4MDhlQ1hoMFpqN09X?=
 =?utf-8?B?V1ZDNlh3dnc5bHdJR2RlTVd6ZktiUTdCekpzcEZNMUxTWlVXeFAxVkw1RU9N?=
 =?utf-8?B?M0Z1T2FOVkZ5aHllTUhWSUJWSWpVZFFPaGwxcDNoMWNzelFtZjI1OXUwNUw5?=
 =?utf-8?B?bzV5K0trbHpYZXFoYjc0YUgrQStQUVB5Z1Y4WnN4S0tpMkppeUN5OWpHY2lr?=
 =?utf-8?Q?Id4q+/4PD+RNxsep77?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83884d5-91a1-4ce4-f830-08deed11b792
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:35:48.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JadipSZ5yzKTgQ9M8SeLMcINyUj6mFK6LJ8kjyxlQMO2nksDhWIiUTSMQTLJi6d9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6858

On Tue Jul 28, 2026 at 4:46 PM EDT, Jakov Novak wrote:
> Currently, khugepaged locks the khugepaged_mutex in two functions:
> start_stop_khugepaged and khugepaged_min_free_kbytes_update. Remove
> mutex_lock/mutex_unlock usage in these functions and replace it with the
> guard macro. This makes the code more readable (removing a goto statement=
)
> and makes it harder to introduce bugs in the future.
> No functional changes introduced.
>
> Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> v2:
>   - Added #include <linux/cleanup.h> to the includes at the top of the fi=
le
>   - Moved err declaration to the scope where it's used in
>     start_stop_khugepaged
>   - Made default case return 0 instead of err in start_stop_khugepaged
>
>  mm/khugepaged.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 617bca76db49..7890bd3e2a9d 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -23,6 +23,7 @@
>  #include <linux/ksm.h>
>  #include <linux/pgalloc.h>
>  #include <linux/backing-dev.h>
> +#include <linux/cleanup.h>
> =20
>  #include <asm/tlb.h>
>  #include "internal.h"
> @@ -3111,18 +3112,17 @@ void set_recommended_min_free_kbytes(void)
> =20
>  int start_stop_khugepaged(void)
>  {
> -	int err =3D 0;
> -
> -	mutex_lock(&khugepaged_mutex);
> +	guard(mutex)(&khugepaged_mutex);
>  	if (hugepage_enabled()) {
>  		if (!khugepaged_thread)
>  			khugepaged_thread =3D kthread_run(khugepaged, NULL,
>  							"khugepaged");
>  		if (IS_ERR(khugepaged_thread)) {
> +			int err;

A new line here?

>  			pr_err("khugepaged: kthread_run(khugepaged) failed\n");
>  			err =3D PTR_ERR(khugepaged_thread);
>  			khugepaged_thread =3D NULL;
> -			goto fail;
> +			return err;
>  		}
> =20
>  		if (!list_empty(&khugepaged_scan.mm_head))

Otherwise, LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>



--=20
Best Regards,
Yan, Zi

