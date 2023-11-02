Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F0FC4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Nov 2023 04:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CB070597;
	Thu,  2 Nov 2023 04:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28CB070597
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=rgGMeSlO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0GYwMEvl1U7; Thu,  2 Nov 2023 04:10:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0BE51705A4;
	Thu,  2 Nov 2023 04:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE51705A4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB11EC0072;
	Thu,  2 Nov 2023 04:10:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A474DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D20A384D26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D20A384D26
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=rgGMeSlO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CgM9COqvGvu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn20814.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::814])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D9B384D2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D9B384D2B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeNIs+BpAoCRBLVZGPPJrBsMiA5CxJUck7B0ZTy8V0GnhHluVK3hQqtR2mKXcA7FAdubIl+cDd2XFA+NleGc9M76qCaJfFRPI3UpofBlL2r0yxnEzLfSDy2udjuIGeCquVXb5xotjFReVCx47ZB23m0NA4YNWElguNaP6klkNs3VlqOnFrK3diSdijH511JN4s9ahUtOXKjdNiIPKcnKpsf/Gp2UuvX5CE+FzFXqBDYg4ydgKUhbxuUVmB5pRliDy/jNcDm1V2qtyq/p7MJgM0hlCCNWcILMDO5L0mLN8fhskw3qXpMaeOC74rxlKlvrUd8z4b6sW+C2dVu00U7yTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVgUGACtvY7WDUA2hHugJ5W8C6yESqMEAaFLZ1yJWzc=;
 b=ik0bdU/BNswuTXh2afH/H1lsHK1AknEVHHbM7hvIBSZjDr/FV2LvOSYOnerlvCWlbJrKfr8WWfbOwy4h/GHQLdyNiMQ6hLPyp+h+J0Tedxd3SPOOfdHU0n6mASFqCMowtGxqGhNcejeCdytLDVxqoWDa97hYEcLus4byp2vsMR35HQTXvVsGNMppDWwnso960DwQfuxwq0nuzFb4x/dSq5ObIbNSY6JbfDPhpd4UgfXafh79MJL9+0rS275IUVLBZtHnSdlt5qsCIAG6psUdUoTq+ROvkY5WTEoPEZ520q1E8/yDHGW/fpChK6nT3aoV8zeJNhDmpFKOrLGwDM7vCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVgUGACtvY7WDUA2hHugJ5W8C6yESqMEAaFLZ1yJWzc=;
 b=rgGMeSlO3rhUMHvdlH+16VSgMMAP3Rap62TsL9krF/iEj+exMyspWd2JnQ5uSpdpsq+XfbSPEpo4FEcfAD9psC+6Dr5PbZtb7FUabNr0aK2rssLogMkxSDzZvYQj+SNEhuDuxUdmr9Qngj2OMtKbNxCQwhoiL4bvniwxBLxxpyRo//uuNNofEKa9HHk4rc3tU/5J+846AkhWNFYPZSYyxXabgR7XsyJTEAOfdJ6wqjqE1u5XzvRB+KjC3XuNRhUXqX++kAC6tDUs2LQaQrPPC8DjsxBiRGHqCrIyrIqd6xv8I4FEnM5UFeYIIWhQDUu9PQnvO07nEwfihUS2BPkuDg==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by GV1PR10MB5868.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:57::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 04:10:27 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 04:10:27 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au
Subject: [PATCH 5/7] crypto: Fixes uninitialized skcipher_walk use in
 aria_aesni_avx2_glue
Date: Thu,  2 Nov 2023 09:39:29 +0530
Message-ID: <DB3PR10MB68352FC6A4C266DBF7ECEBD4E8A6A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231102040931.1556061-1-yuran.pereira@hotmail.com>
References: <DB3PR10MB683562E7BD2DC73A48BEA3C8E8A6A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <20231102040931.1556061-1-yuran.pereira@hotmail.com>
X-TMN: [7tSm00vf8YSkeSkPCo63A419TA4evxex]
X-ClientProxiedBy: JN3P275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:70::14)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231102040931.1556061-5-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|GV1PR10MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f3d836-d820-4e3c-da47-08dbdb59a4f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/Pb3e3Q+LurF8MF7/MF7wZpHA+hLNP77ggyVwuysWq5R1ukJLktt2nlMJXIxCmAR8cHQL74kpjlDfeKm1CNFYwlRceGJr6GcLdr88v4FZ6zosnbGkt0oljUk7NpwxXG4IdonTQcKnx5HCBqLRVGqrdmenhx6xSD7ZZzbrkKcuh7Kcmwwz+S51PGxPdV6fxal785z5HIWVRGovlKRGfQ/iQW1MBS3lv3NIK134R9trB8i1ajims8lj6byndMQ/Fbjc6gG4g0kfJFWl4A/i4cw2hOFPu9rNrbQka6Sea/REsmycNW308xKWTgWc1VooCqrTimNVIM2mcrjFaq00xaRH2Hn33yVdsafXHqTgePm+Ys5YGl8wdRfY+vJ6qL9EOz1+qPuYnqqZglcpbKvkzJ7tICzpUAcBIfJrwWEOBGkehA7BQBO41KR9flzK0C0S/aTDO0fIyeuBIr+dUEOTXRpVRb0b7f+vcBh0l7hRaJdIrW851pcfIUWCqIOlvXKbNo3YLvk+D4OkFQ2GyJq077luiPKPhUekelfWJzFvGSsPYp6nrKOsPdXhOxF7Lvw6YLL/a5dcOo/uDLIUTDurk71WalcJ8PyZ3dPeX7gepmuOTLHM+/lHzvSZRcjMwtoljM
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+M65OmRVKqTw+dHqAFB9ugBeT82L1jnq7sDEnbYhTtOoIGmRV9yIsM1KxLO5?=
 =?us-ascii?Q?KZMZRAlTUYW5Eh0YlqCvJ8vILiqzr5L9pof6z3WcZVLgzXfpZuHfD2aHkjH/?=
 =?us-ascii?Q?weHbjO08AkKTbL+JXt+ECwcSlCHW3Ox03+f4JFqSs4vjmrkOvL7X8Wq+YOty?=
 =?us-ascii?Q?80IJsS48VDitPZslsCqcZ0b+4o2riw7zRBeh1RRB4t8XOhLnx4eCv3HYouNI?=
 =?us-ascii?Q?vwXcREunAhP5UflHhIbONLpCZZDJGpB45EajeZP1eRR3Xa4qUr0lO3jHYpns?=
 =?us-ascii?Q?dwynyObjfSouyCBtWIj3l0AkEZ00++bnfHY4vhdXJVc8ngDOiR+kJqXh9Kfs?=
 =?us-ascii?Q?eHqygUTZCIxysCjctdcP+SecWtaqiO7g9BTndAyWoZvmvh7A1XlAZJ+yA9Uk?=
 =?us-ascii?Q?52hxOiB/50FOZWEqpWJHrFe7/EGVXv/Wc4SUMw7Xe8Wr7UMUyKvDubUfY9Lf?=
 =?us-ascii?Q?FN/ff7+JdhnVh7ERgFgiakxoIDTrqVNTYxdExDpzlQfU//BjZtb5GkC4ZX/3?=
 =?us-ascii?Q?Knj1fbvHV5MZHGRUH6eIJ+FMFnuZPUI9f3NimzMkApYLj9lFh9VUHrg8iNWC?=
 =?us-ascii?Q?MvjdtaVPaZmkRj8dFtvCrsUa9Ej04cpOjB+hdlKm21aIzNwC6+7HS9iOkWy9?=
 =?us-ascii?Q?aXkUyM6hc+huw+OP0E4JHSubeMBiu0AY7JDOuz62ZxJU3LDZJaZHknNZ3dDo?=
 =?us-ascii?Q?5m+IAE3CIjsYsZ+54yRHeIKVQMvyosMtrnB3ZQfTNH80Tcp2frMy+ehadekh?=
 =?us-ascii?Q?OzHytT1jkHhANTlzLE2B5nWPZnlZ20xuWw+bGfHpDdV1i/sYPp/PigqRdfA1?=
 =?us-ascii?Q?V5Hg0P88WMBNCTU4lemFaPLwDgHRdpzu03KV0y1A6P8S/oH/YZTGZrDvmmUC?=
 =?us-ascii?Q?sBymyXEUo5dxa0fT3wNzLZD7VvuKCkwyPH42HMsa7T8mKOzlHMBY2ACFr4Ey?=
 =?us-ascii?Q?NfUjToNpN/FoLfOpewHAHqBJHRnzN2nwbBz4/Qtucp4bgpw2F9hERLStUcga?=
 =?us-ascii?Q?nA2u20qEBnAobXHv8LmoSVLrnEJBXGzamy+oDLSmMiswzUJJsMMHLBAVm9JH?=
 =?us-ascii?Q?vUMw/noEU5N7PwGFLl2FMxjJ8GP1EsWtMF/1wCHlYEE4qwi1odb1EVfHzAg5?=
 =?us-ascii?Q?PRWJvEhXwbe7Vbli/3nM5gVIcN9pBLt/C6FgTlWsrJKRs0zuudS9rhjy9pWF?=
 =?us-ascii?Q?9ddL3vPT+ZE3OSJnkmKjVA9ForMch4ZjbsLyod3c9r8NkqpGcP/G69flgZk?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f3d836-d820-4e3c-da47-08dbdb59a4f0
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 04:10:27.2100 (UTC)
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

In `aria_avx2_ctr_encrypt()`, `struct skcipher_walk *walk` is not fully
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

Addresses-Coverity-IDs: 1521842 ("Unintialized scalar variable")
Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 arch/x86/crypto/aria_aesni_avx2_glue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/crypto/aria_aesni_avx2_glue.c b/arch/x86/crypto/aria_aesni_avx2_glue.c
index 87a11804fc77..d5a8077f9f96 100644
--- a/arch/x86/crypto/aria_aesni_avx2_glue.c
+++ b/arch/x86/crypto/aria_aesni_avx2_glue.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/types.h>
+#include <linux/string.h>
 
 #include "ecb_cbc_helpers.h"
 #include "aria-avx.h"
@@ -94,6 +95,7 @@ static int aria_avx2_ctr_encrypt(struct skcipher_request *req)
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
