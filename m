Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8B3C0018C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Nov 2023 04:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3017A43335;
	Thu,  2 Nov 2023 04:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3017A43335
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=V6I4YWwo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVkjy90K6kOH; Thu,  2 Nov 2023 04:10:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DD7E943337;
	Thu,  2 Nov 2023 04:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7E943337
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1CE9C008C;
	Thu,  2 Nov 2023 04:10:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A35B2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65F7184D2C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65F7184D2C
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=V6I4YWwo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diepue3vc_Ur
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn20814.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::814])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 911B184D26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911B184D26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfneqyOdH5fRbvs1yriplmaZqHnguMmaBIOC6KmBPOhEry1WfZHM7fh1sxlZ5D/lC9ip4Cr0l9YWov2iCeCn0I+WfPk4uYu+nlhfDjLNuD1FOnKzey1tMPkoVF3sDAqfPumuL26ywfx5OWY5gaR8+knse1ZduxqYqOjS9UJpZRUev5oF7/shSu4Cle5g4SbHZn9Fq7E/Oxl33krgI+/hl0xwQd8EniuvKNrfPWoPM1lcmVcr6/MTJexkW64pUVIO36EP24Q4wI8IN4YDodxvR0C7NC7BSTV9DSieuzPgBAWUCfrJgeo3/JYVaJIsJKs4smoTK5q1uCdDK3tPqE6vpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W24hap0W9jjDGJfQThCIOravrPCXruxLA34CxH/jRBw=;
 b=QoVBhg9tueGgpCauKi7G7Zmz2/sJ9Fmd0z8EgW7KQVKyJhs+5mu1zzRLw02HXt2CaYvKf1dsrN01DLlFXJfFXRLQ4vLrOO720u1BgJfnT5rOUnbAsBmNRR3HbUeRDVpPzDSAjbBE+uW3hihfhAlnuitaiDlVIulnEZcMyi8dG2hDHab80GtNK1uQFsgMNVHf9KtvUPhe93cdLwNo8tmLMO3CePoX11vo+NUVc1zAG4uoZBmDi9rRAfQOVRCWXOcmZ+JNEsMvZ2ZJAMgdb+1Bavtm1Xlw7aTFi7lIsxLHAOAln80ZD5svI2mE7Cyd7UjNGXPeeOFquGyYL26eghIkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W24hap0W9jjDGJfQThCIOravrPCXruxLA34CxH/jRBw=;
 b=V6I4YWwodvX+K4EgrYtygh/6VgtW5Vi+Aye3eOHfIvx7rm6JxA0FN6O4TvHFZrea1dyTvomcz0zrsPH3eMnr834Bm8Od9ZMVHomrLlyb8aw+aUGa8zHsvPvhNG0rv4iFsKZxrwQyhFQcfVvllR61TnxbEOrlcLvzkVWVYZH7Bt8RsXqAVU6j0hBbU5JjEGJYUjEXZdZGZtm4scAsQyS2ZccD7CDWpewJrUDyOc1i0aFZmnR7KcWsWo+lMb56kvnwIXwxgYYutoPvOU0d97oowr7tg13F7jtaU2U3KLOBp+GRy+ergcm+PCH752Z9ZVIDiCsfOrRQoeq41SkdQi/VrQ==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by GV1PR10MB5868.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:57::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 04:10:23 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 04:10:23 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au
Subject: [PATCH 4/7] crypto: Fixes uninitialized skcipher_walk use in
 aesni-intel_glue
Date: Thu,  2 Nov 2023 09:39:28 +0530
Message-ID: <DB3PR10MB6835F2320CEC2E4B90F63D8BE8A6A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231102040931.1556061-1-yuran.pereira@hotmail.com>
References: <DB3PR10MB683562E7BD2DC73A48BEA3C8E8A6A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <20231102040931.1556061-1-yuran.pereira@hotmail.com>
X-TMN: [Nw9jjA4e+f03mmGHMGJxhoHhWdnsHhbv]
X-ClientProxiedBy: JN3P275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:70::14)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231102040931.1556061-4-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|GV1PR10MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5bc174-0e01-438f-2bf0-08dbdb59a2dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Rz5TB3kfH4j/k/kntVlaEbc+utdxvPeul0sky2fpnoJjLPqXsxoJLLfOKpB54CHrLr7LGP6Z0UJiN9jae6XcXHItkVpdWO+RQvFm1AIH0PIQP5raxKCv5fsNuFc0OShXTOSLBygT0dt7CCS5IqqdcmsWoOOastvdtArumYW0BFA9EDMzaCqKl2PPmnQ+IAD6dXOux2HgkFU/jU26qg0RurGMlQU0KzlS/J9084ieCJgUtk4Eic1OVVNFkfC3wL4bIV3RMEBFPDzTj/9jVlEjYK6QVmhuvwR2eZah0e+Jm2GWY65KtDhHv6EFf2EZvU/CFOwr5MZoZybjpFVROk4s1Zck1CClzaPZFeIoNDGdNXcuhaw7FfTHd4YCcyttiLRxF1sRmSBoK1lOJxQ3QMU7GMeNnc6T6cBxJHiZ5NFcya7zg0p+CfwIgQ5/FwJPEcYlufGBeX0Z4UIx9j9mnhMnw9pMGXXtXZtflNdptwQF8XHljaFK/frntev/mjNPI2XUlMmKvInSDbx0JkyO9lB+1wgOCgflFLECjuhMfmXV5JI31opfRTR5iG74McHu8YN5Cn9aERonUKrOEnms3R/tpfh7wH80XxZsOc5vkpTGnQIRWqQ5eqAke2a/Llo14Y3
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q2GtzcCIs7UQ/DnsopUK0QPcG4laFCp++HhmJQhz9lv4U1s3uC77jf5ZCQGT?=
 =?us-ascii?Q?6wVfyOaxiPNszZAhvr74d7K/4t+rswUwS5SB8gcxB3ZehpTApKAXHLT+pbQR?=
 =?us-ascii?Q?rCe2LoY0BSdQfthfFHcFIQLurXA7qlycyY+NzN/BqubnXv7y+Z5f+TxSZh9w?=
 =?us-ascii?Q?FfHkmyYfLCceOcbhtnflBMrsKwagphOcw0ent25xMmG1mx/K4HVwyVWrKAZV?=
 =?us-ascii?Q?rv32YTsRMMOvnbDFqleEHDj5RW/r2nrXAiYZ/bya+RxPR5cKo8RVbdFtGz7g?=
 =?us-ascii?Q?OtG2rPjooK9P1uWP1qmPPQXMlU7qBIph5sK+Of/ZiKB+RagPBO462YZ3ZtYT?=
 =?us-ascii?Q?9Q5/FhsbT19PuudNP436xhC0eB61iQEVT8D2a8/4shWmsQ7NQc+g+puNRFfU?=
 =?us-ascii?Q?dO7dllcNTNBjhey9QI0XEvoRTrRw7nM+D+LYimea04YFYWyejk+GKb0LCuJM?=
 =?us-ascii?Q?VEQ0figGDwZ0eukVExXVEHs87fmSaEqnnTyntHVvZr6RRYEawUrDBVKMsNvS?=
 =?us-ascii?Q?IDuoBnUCn99LWZQ9JMPUPJX69Jyr2VQDmI7VlXsHDtKNY+n8sH8gd2DHr0Gb?=
 =?us-ascii?Q?obRHDO0xA9u8UjvjAHwDGeDxxTafR9RmoAohQlM9Cpzyl5LubbIzoXBoNagE?=
 =?us-ascii?Q?LihPTG4ZRx/hEbemMeS7KTzWq2kd/MJ5sEB5kTc2PBGKRKxCBbedcj0Idpra?=
 =?us-ascii?Q?nvwqdvbPkjqh1rCJ27ONiaIvzspIR37ZVRma1vWjuOncMYbNMzOZEv2UL6QC?=
 =?us-ascii?Q?djr2O+LGqgthNagcdnJ4UrMQ+4xt1rldw8kHjKZb6IZpQGdCuFenIgz5ZeNy?=
 =?us-ascii?Q?/WD+1xQAtzfdKGTJcnp7Oi4fnkoF33lODC7g0uv3F14XEFEV1ZdI79+4EVNl?=
 =?us-ascii?Q?4NR4Wes20rQReQ5xragiAIBWC8k+bOcmQJkk9MLG3fTIJUKFgMzuFLxq5x6R?=
 =?us-ascii?Q?3iV7bUXgnXCbimfR57nNvuAJNzmmIvufGsMGHu53z0Xf28EfMyMAhgpJqG7C?=
 =?us-ascii?Q?VB7PLCCrO1e0bfACiOyEtANjEO12otpnshbR0R9mvUmHgJA528KQDqb5zrxt?=
 =?us-ascii?Q?njOwsUDaUQGNN7fhFQsHoSa6/OErf5/3WZ5cQX5vJ8GSdnqmSc/QKcy840Yb?=
 =?us-ascii?Q?HXggVPM4Dvs4Vl+FUPLYXJTfUJRbePKV4atcFoix+7lKWHuPJfBM3QFs1R3g?=
 =?us-ascii?Q?FMx/gj4nJaMdADJ6enAkIHi+JcxrDBLFcWwt6dZ0eusOZ+PiVmmJL4OdKOo?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5bc174-0e01-438f-2bf0-08dbdb59a2dd
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 04:10:23.7072 (UTC)
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

In the following functions:
 - `sm4_avx_ctr_crypt`
 - `ecb_encrypt`
 - `ecb_decrypt`
 - `cbc_encrypt`
 - `cbc_decrypt`
 - `cts_cbc_encrypt`
 - `cts_cbc_decrypt`
 - `ctr_crypt`
 - `xctr_crypt`
 - `xts_crypt`

`struct skcipher_walk *walk` is not fully initialized before its use.

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

Addresses-Coverity-IDs: 139545, 1508669 ("Unintialized scalar variable")
Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 arch/x86/crypto/aesni-intel_glue.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index 39d6a62ac627..d2c5f00a33ff 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -35,6 +35,7 @@
 #include <linux/workqueue.h>
 #include <linux/spinlock.h>
 #include <linux/static_call.h>
+#include <linux/string.h>
 
 
 #define AESNI_ALIGN	16
@@ -296,6 +297,7 @@ static int ecb_encrypt(struct skcipher_request *req)
 	unsigned int nbytes;
 	int err;
 
+	memset(&walk, 0, sizeof(walk));
 	err = skcipher_walk_virt(&walk, req, false);
 
 	while ((nbytes = walk.nbytes)) {
@@ -318,6 +320,7 @@ static int ecb_decrypt(struct skcipher_request *req)
 	unsigned int nbytes;
 	int err;
 
+	memset(&walk, 0, sizeof(walk));
 	err = skcipher_walk_virt(&walk, req, false);
 
 	while ((nbytes = walk.nbytes)) {
@@ -340,6 +343,7 @@ static int cbc_encrypt(struct skcipher_request *req)
 	unsigned int nbytes;
 	int err;
 
+	memset(&walk, 0, sizeof(walk));
 	err = skcipher_walk_virt(&walk, req, false);
 
 	while ((nbytes = walk.nbytes)) {
@@ -362,6 +366,7 @@ static int cbc_decrypt(struct skcipher_request *req)
 	unsigned int nbytes;
 	int err;
 
+	memset(&walk, 0, sizeof(walk));
 	err = skcipher_walk_virt(&walk, req, false);
 
 	while ((nbytes = walk.nbytes)) {
@@ -387,6 +392,8 @@ static int cts_cbc_encrypt(struct skcipher_request *req)
 	struct skcipher_walk walk;
 	int err;
 
+	memset(&walk, 0, sizeof(walk));
+
 	skcipher_request_set_tfm(&subreq, tfm);
 	skcipher_request_set_callback(&subreq, skcipher_request_flags(req),
 				      NULL, NULL);
@@ -443,6 +450,8 @@ static int cts_cbc_decrypt(struct skcipher_request *req)
 	struct skcipher_walk walk;
 	int err;
 
+	memset(&walk, 0, sizeof(walk));
+
 	skcipher_request_set_tfm(&subreq, tfm);
 	skcipher_request_set_callback(&subreq, skcipher_request_flags(req),
 				      NULL, NULL);
@@ -515,6 +524,7 @@ static int ctr_crypt(struct skcipher_request *req)
 	unsigned int nbytes;
 	int err;
 
+	memset(&walk, 0, sizeof(walk));
 	err = skcipher_walk_virt(&walk, req, false);
 
 	while ((nbytes = walk.nbytes) > 0) {
@@ -566,6 +576,7 @@ static int xctr_crypt(struct skcipher_request *req)
 	int err;
 	__le32 block[AES_BLOCK_SIZE / sizeof(__le32)];
 
+	memset(&walk, 0, sizeof(walk));
 	err = skcipher_walk_virt(&walk, req, false);
 
 	while ((nbytes = walk.nbytes) > 0) {
@@ -912,6 +923,7 @@ static int xts_crypt(struct skcipher_request *req, bool encrypt)
 	if (req->cryptlen < AES_BLOCK_SIZE)
 		return -EINVAL;
 
+	memset(&walk, 0, sizeof(walk));
 	err = skcipher_walk_virt(&walk, req, false);
 	if (!walk.nbytes)
 		return err;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
