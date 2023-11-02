Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7F8C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Nov 2023 04:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63BB570595;
	Thu,  2 Nov 2023 04:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63BB570595
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=FA8Hg3Z+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OEM7iJopARA; Thu,  2 Nov 2023 04:10:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 13D25705A3;
	Thu,  2 Nov 2023 04:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D25705A3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3288AC0DD3;
	Thu,  2 Nov 2023 04:10:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32657C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 913B84EE6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 913B84EE6E
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=FA8Hg3Z+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ASXxFstF2QYW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:37 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01olkn0813.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::813])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2B224EE86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2B224EE86
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKb4SRmxA6I3nvMSF+R0JLcgNcImiJE2rKf9m+KTDYOwPBs8F7Zr/G45a/BHWCw/gB1ZuStHXtjwSkqGizI51vfeX5YcJAxlxxkTbor+iVaZZVazuUhpVnXQPsedVDZzNWe4QJZQ7afPJy7JU0hdgOGZb+a0AspQtLrhdFTQ8t2JAoXQ+nrlT7i0oF71qI3deZ0Sb9VtGe+TLrJFi3XFIIq65qSU5r2RkI+aH0HdAB2X6b0V0LOPAetsH7Oc6uPqADzpigzG5OgTlAqzQg+AOES8mxAYQSlDssr01dXJNTXi4OKp16aUjn7wbEJzbj1Qyeb3hR5IurMFXhVFLTGNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uc5vsEu7OhZHqKrkUwNVd+nJqpbzW3IxrMNjLdrTwS4=;
 b=XOAPpDL6JSHXevQrQxyUeR/cxDa1wflUPOIftQM/M9WDdmc0KwLbH6oAtwsLZc2i/v62gXzyoQ8kga8GDQPHOrYkf6uohEui1kyLwGzPlt8ZhUKGwHK/6neYenBPDtewhwtnb5rNit/TpU4vVpGhLQw3mRv5OACzWvOD4Oww3m3Dm+Ikpv6Cy0BSIgXodgx8YdRe9+eV+6Vul2r7vrChgUUFRbNTyo/NTDLZUB5U6miuWeTtbsEJVvseY88wSXOUZWog3hUuD3HfvBoE15jny2SGRtr8hOaRx6NH3gHuxGPUpyL208ANyvH1UfqGsvI4/ihplYQqQDo7dGDOlBdKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uc5vsEu7OhZHqKrkUwNVd+nJqpbzW3IxrMNjLdrTwS4=;
 b=FA8Hg3Z+Bk2HeHzdpOxUqvk5vCPSLnuoGPDavQtB8HuN+UPo4a/M/I49nXDx9u7mrxYLOAcdRHruEufBzmJdUbGW8LyhVMZ0i959pgMpKR7uuUbOs7qpW3IPohogYVyUwtqffVtGqvIMHfba+0RHwils+DUCKVJ/BjuVYPD8ojDbl12hZ1sivFevVXAAoNXHKzWP4FdilAkvK/N5w5kC9sBMA6KKt7+CglyE8oY+ZnNpBhEAx1CqgwwsL9aLOAvOzhzcRa30+Tyi8KSmkPJoiYuCTArWxvj1di6Ii5IdDRqGJnAyiy39+fJbxYoeBBVFPLR70IgHNRnZLD+1PLeVSg==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by GV1PR10MB5868.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:57::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 04:10:34 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 04:10:34 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au
Subject: [PATCH 7/7] crypto: Fixes uninitialized skcipher_walk use in
 aria_gfni_avx512_glue
Date: Thu,  2 Nov 2023 09:39:31 +0530
Message-ID: <DB3PR10MB68357FC2BB716211CB846DBFE8A6A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231102040931.1556061-1-yuran.pereira@hotmail.com>
References: <DB3PR10MB683562E7BD2DC73A48BEA3C8E8A6A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <20231102040931.1556061-1-yuran.pereira@hotmail.com>
X-TMN: [o36x/O7uf/nht7Ig5bRnI78OlfKLR1hS]
X-ClientProxiedBy: JN3P275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:70::14)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231102040931.1556061-7-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|GV1PR10MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba7efec-bbbb-456b-100e-08dbdb59a94f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oyy60I2u8CRqhb7c52SHBJgS896bopYObtB+JvUU5lEcGta/aO7Rve/9/DgIUw9TOWrMtR80SfjC71V0GhOjbMONdJwHLH6O8Wn0mbl45DZNnNXD55BLgzUYxqW6GXYVw02C5iz2ySVemrgWRxdy38/4rXlut6efzWQyR3lHhxS40k5WUEmmHkgXrlkRknWTR9j28dqtTysvtZKd2bi+1DMLt7M5G3f/sT0d7uAHFQM4RsyhB2d9Cf/GGNKRcD7vv6h458SDEIr2T6EnpeLiLneDXX94kSd7NY/uLnNfxCaa5YH0DBBxjz8Lm+rGB0HKsc3dYXy5JGCV2QqTDRMwvXffaRv56z5+9oDNwrFdgyrd0pv5zucndwykKiH1o7bzZGEeJ2Wg/3Oh6HowgU6XOpCNqrsY2tI01gYker/xWD5tymtnfz0z8vN+fDCW0EpVbHj8wDa5MZ8mmPG3Tm6is1fqGfoJ3Y06d0bzFOx/h4EVas9F+cZHLwLlaA4Hf6Tw8ZnbX5X0L2Xjflr4OS1jsJArWJy3A9oQFg1jJd+/6Bxu1SvsD8elkugrJpIQrGi6Y3x0w9M0Ue+nRULULdR6r3l/3tlansg+81qWcgT16Wd+2Gx/Jd/HbZ7J3TZSxJch
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3mnrAZBn3Jfe+bYhCiGDBLIi05dNocamSJHC0POx9kmIcripDyqGkcU5Fn9i?=
 =?us-ascii?Q?Z9ns+iRaXLkYLLxdXsnFsnQs00rdal/iezOdwxt9iIJKiEq4l4+FFuKSEevJ?=
 =?us-ascii?Q?DjDu+KEfP0vKNjF2JX0mFnAUmM8xea0KjT7pjNhuty5kPk5dpN+sCsSgUiHo?=
 =?us-ascii?Q?Nn1ihw7bWnT8hXaGwTOs7w1D9c+wOqvZYxjFTZaD6lsQO8g7NBH2IbKpl68U?=
 =?us-ascii?Q?Kpwien9NxZaAq6iy2usgWg030i4z4UjWXadEbYTIi23LZXsQa/YFHB/DPQBI?=
 =?us-ascii?Q?HmEOVRo/nfCvRxm30/kDnbf5BX+FEMN34opAv35tIrH2yHBet3dtCCoxBflm?=
 =?us-ascii?Q?gcVJ7t0YqBX+u55at6rAiJa79HllameLi96UNrf3pO+4YEi+XyLc+Di++9a2?=
 =?us-ascii?Q?hhRZAW2nwz0YmHXkt5g6vQCu71LaNSsJSE/ow850Dt2ccwVRmXhoGzaVKtTp?=
 =?us-ascii?Q?EWB4r63BjYRL30chrcait6M1T/wjBAnqxRH5GjEKB/BRxR8CF3oERaVGSeHc?=
 =?us-ascii?Q?aFluDXdyXURFvvHdd/y2OSU9/tw7Tk++58oWW41lk/Jjrff/5UKHjcr9S3v5?=
 =?us-ascii?Q?EW466iDN2QlYS7376SwZsKuaMwwRcgqy2cTXpczR6yeg3stbwgX8wF7S1Wau?=
 =?us-ascii?Q?AcPmHmHJlv8hJ7NUbF/g/jVWNCXo3wgxb6NEW17A3gz63fun6ctMrn62t9Se?=
 =?us-ascii?Q?I0Cub1y3j83lMHmtzbgCfi0YLTvNDv5FV9vitM6yik0Uce+KuqUPV0HZli3W?=
 =?us-ascii?Q?qK9HCAf2w8+zv61olEAmdHhW/BI6OUsrHrCu7rvxoG+CZxi4zGOIdDX5yXJr?=
 =?us-ascii?Q?7Jjhqln7BG0f3mr5rsdH5KP9yQzRcf98i10T9ui/14oanZXPi4epznJMmYn3?=
 =?us-ascii?Q?GhgjmC8hEzfssJycuOgCMBdV06CIL6M+HWjTfCr6i6jX2LV94GEL3JlY0vq8?=
 =?us-ascii?Q?kRmZjtPXXY+Uc2vCUBelyYlPiCqgce4VoAOCLPeHq60dnFs0BGY24aIeZTu0?=
 =?us-ascii?Q?9onsEDO20ImW82LPs2YyBoveW5BPuvncCYsSOT5vDfLr408d/nTyN8EuVT5g?=
 =?us-ascii?Q?eKjK/s2xCaIHYftB3S9ZmbsfHhAEn1G1Ix6W1yZdYFbRcjDFboB9EtJBGoI6?=
 =?us-ascii?Q?eawc7W8DwzswYvuVS+uNCuTroRIZe+vWIaVQuEAyeZN0Fncoq+weiJOj9Z70?=
 =?us-ascii?Q?oZV6bkLmbsEAyZ/e2lzX1/MK8eRiLIv02l0NmjxkFbHfylKd1xVU86cEobg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba7efec-bbbb-456b-100e-08dbdb59a94f
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 04:10:34.7547 (UTC)
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

In `aria_avx512_ctr_encrypt`, `struct skcipher_walk *walk` is not fully
initialized before its use.

Although the call to `skcipher_walk_virt()` and subsequent functions
that this function calls seem to initialize some fields of this struct,

there is a chance that `skcipher_walk_virt()` returns
without fully clearing or properly initializing the `->flags` field
which means that the following flags:
`SKCIPHER_WALK_DIFF`, `SKCIPHER_WALK_COPY`, `SKCIPHER_WALK_SLOW`
could be storing junk values by the time `skcipher_walk_done()` is called.

This could lead to buggy or undefined behaviour since these flags
are checked in `skcipher_walk_done()`:

```C
int skcipher_walk_done(struct skcipher_walk *walk, int err)
{
	...
    if (likely(!(walk->flags & (SKCIPHER_WALK_PHYS |
        SKCIPHER_WALK_SLOW |
        SKCIPHER_WALK_COPY |
        SKCIPHER_WALK_DIFF)))) {
    ...
}
```

To prevent this, this patch ensures that instances of
`struct skcipher_walk` are correctly initialized prior to their use.

Addresses-Coverity-IDs: 15916159 ("Unintialized scalar variable")
Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 arch/x86/crypto/aria_gfni_avx512_glue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/crypto/aria_gfni_avx512_glue.c b/arch/x86/crypto/aria_gfni_avx512_glue.c
index f4a2208d2638..cf689cc880df 100644
--- a/arch/x86/crypto/aria_gfni_avx512_glue.c
+++ b/arch/x86/crypto/aria_gfni_avx512_glue.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/types.h>
+#include <linux/string.h>
 
 #include "ecb_cbc_helpers.h"
 #include "aria-avx.h"
@@ -81,6 +82,7 @@ static int aria_avx512_ctr_encrypt(struct skcipher_request *req)
 	unsigned int nbytes;
 	int err;
 
+	memset(&walk, 0, sizeof(walk));
 	err = skcipher_walk_virt(&walk, req, false);
 
 	while ((nbytes = walk.nbytes) > 0) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
