Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0669FE75438
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Oct 2023 09:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72ABE812CE;
	Tue,  3 Oct 2023 09:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72ABE812CE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ZzsIv8Eb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYWWL4PWgNMx; Tue,  3 Oct 2023 09:20:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2C07E812BA;
	Tue,  3 Oct 2023 09:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C07E812BA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BB79C0039;
	Tue,  3 Oct 2023 09:20:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28D80C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 09:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11692417B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 09:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11692417B2
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=ZzsIv8Eb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSIZrmvClD-A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 09:20:07 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02olkn20813.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe13::813])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88A30400F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 09:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88A30400F2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dijsCvoDkAuI1dsavzn8GEQqV6Mz2c33BW9Ze0ec4E9NwMyvVNl/HQdVIPOxr1/4UVtRyM0ydc3ejiGsDmEAVCq5nkVaLzDdSRvg7xfhbn/M+lD0RM9+KZUUcTmO6ihu/8m7ml20TH3R3E6lIbQI5JaHudSwrnsgnvPy11vqzrmB53LjGtFYFZyDVr56krJetQ4L6f+3LepPuCRKoY0p/jrgEIOY+GNDGEOP6EKu6HX+llSZy/jg3L+qvGFjH9FN2JUYCA+38GbYz7V91VZABdxr3e5Ns/YG2IFeHbNJ3j2xR5v1YzhfiaNoMnwOCsvP/Mu1z8BHP6nK5eCzoGZ02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aU13WxGoeZ3UkrKW4GhNFwIziBrhwOwTWxguu4BOxFU=;
 b=AElo9gd+2mqTdd63M47UaNVwkZdvWu39io3c5ZAXs5lJgwtB3cTGWHkoedffOM5rUvZdwUgkVyFXrEf+XoHJD68l0JImnmIuJzplBnduvYIn9BAcVUBxfE6XtrkCpTkaqQqs95+2uueeuA8jGYoGQkaOAyapM1oN3ZOueZ8vCeBdmuZa7tA1a3HBej69Uz7hTMCmmuSS0Fv3pG1LhSh3Uq4l0oqRc4OuopxcyfCFX/JPKD6RuDm5EkKTNNKsuecMMBHJuyxd+0wU0lvTVhvtsPvKTt9UKaVGVHUZNanQPeDLSuCBQuE3nRg4V/x9iHvOPY4LL1To1lEk/EcxGEfAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aU13WxGoeZ3UkrKW4GhNFwIziBrhwOwTWxguu4BOxFU=;
 b=ZzsIv8EbAxdRqz/I4kwkW2T9OS6yyVxZb6ffrwLLVMTQ1C+/AvsZJmKs8PLbkaLOU17c8C4Ydi2Tn1SSmC8hfYUJpGUw0dTGJnR2SQRCTsqvoyo30lz9MFEEv+taU453zI1GNni6kJTXgpD4TdUtG45vTMUT/DTSc+2kEkkTcpPMoiu5gB4cbnK96jpHL78tQk32zSiD24g3rv+kwE5kFVRSlLiIJTg9J6KkMeTzuHgFDsQLK6ksJoaCX/SRTjxSm6LGSi7BGsTZ2Bh+AK7D6pEgQeJrXpcOmsRMyC5xpNAEOtNx02zzN8Fy3QtZi3aF5kDyfcBocNOLE0MGkGYE9w==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by AS8P193MB1638.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:38f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Tue, 3 Oct
 2023 09:20:03 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3164:ae5c:78f7:23ad]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3164:ae5c:78f7:23ad%4]) with mapi id 15.20.6838.029; Tue, 3 Oct 2023
 09:20:03 +0000
From: Juntong Deng <juntong.deng@outlook.com>
To: akpm@linux-foundation.org, willy@infradead.org, vbabka@suse.cz,
 lstoakes@gmail.com
Subject: [PATCH] pagevec: Add remaining space check before adding folio to
 batch.
Date: Tue,  3 Oct 2023 17:18:52 +0800
Message-ID: <VI1P193MB0752429AFF2B87041B0D9E2799C4A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
X-TMN: [ktcgpE5rbGJUQZFyha+t+kdh8cY6Zsjf]
X-ClientProxiedBy: AM0PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:208:122::17) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <20231003091852.13164-1-juntong.deng@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|AS8P193MB1638:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e426c2-a224-42b7-ca8e-08dbc3f1ecb6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z5M0bEGPouTMCY+5gEiUtBt8oNAoFhb2uePagvg+7BHdwvSejN8dEnqhmIp8//wK9NhFbeqWyIXqULxMAo9HF4b4mgGFhhhTQfa0oaRBhwzyGPNHoKWbCkP/TWHHdlxmfo7/KLhBFnXwFHQyZwXnTNVQImRQncYV6cxQa+o9XXACxJb7BJelkwwzAuw0WQtHoxxqpToPEQGsvpWLAan51HdDv9Lkg5942zhbtobkJcgCa5tUW3Jpw0IW69sG4Twe+QFCjf0MNAUtFcygjcYHhhH4YSIpWEsD8piRBEXt2aKHWbteI6MrvNhX1gpRR58BQN7BUkKPkH8Z6Uw+FiTJG2voW2TKO6iHVfwrvScey70Rws+e6T4ij0XmVR1vcY2g1B0nncY3Ey8a4t5DUwGXC+uUYyRsT8jQNjQREntM4DJ7e/oIRXAc9h6lsjp7B2ZZSbF/5DvttNe1OPrySBMVZeDMPgTbGU52EdtxRs1tDqK5IEyhKjK6LFKqQ79RSfp7aCDj5J3dSrzzSYykngO6uOJF2EI3i063F3M4YJEu4GAWv52ve6o1PiNJCmEYJCTF9suEcIZKxR4Mb/mvRvc6XR/2dUXhWNaCV8kM0PG1SCNgbZH9GVFBvxBWpx8EYSScdo39BLZWbv4g7eVTvoyD4NQbAIwf3ZrQMl9aRtB1QoGMFVk3YAdfqRhK7p1mI4sMfBScHOjgNPZM6IpN2dUgM6Zeep7SvVS+H8/MzHx9VVK835C74xCvDCuC65nBHgX6AnAnqS/WXjZaQzMcTZEUx3QMvHPdyfFAg3B9Q8EvSgp6lRM4YSmps1Xlufr39t9tqAHbOtGWgPsHguDOXJeb2rEBCqq93G6+cLUWsNxKX2eagqxMaXvZ95moe27mcWAdrfyITXseYzRfDAmZo3EB1k5gCC1rAofS2dbv4/bOZow=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zbxB0qlIdRTGEAKmw7Lz/+P9oZjrGJpwzpgOlMQwqmic1sGYBqRzFsGYMyJg?=
 =?us-ascii?Q?T1nt1ox6ItpQZ/piwD3kd1zquqDJmwx5yUIZ4nTX80fwO+pRDCQOyVIlL7VE?=
 =?us-ascii?Q?2zwhGwaYjoLGVpw9j9gkRTl80m8UWjTHiDRmsDNQjeoWQ1aq5Ptp2Fydr1cU?=
 =?us-ascii?Q?Apu/5dfIwQimfWXsViDa8nJUQU6m7hXgW0pBgZy8eBrMAhnVfF1aZZ35E7P9?=
 =?us-ascii?Q?GYKSLEREoJ+ARq3NQ5qXaduDQhuv6fnZEVM3vMrcecsA7z8mR4NSNPHCcE/R?=
 =?us-ascii?Q?pwIdTqKrOwG9ADOp1tHgVeTS4EoZUDw5VfRwlWMzu/F7D21uHYN9cIiEJDJr?=
 =?us-ascii?Q?SxOnRSUDCFOwNjyDnE83+TyIzmUy8dao5owzMCNJYw1VSZQmAk8tyGqTnYdh?=
 =?us-ascii?Q?kwi3l4LPTQ3DBecJ+mFyvXcIU7NFgOM1ea/E76ghHj38L5mnZLsAbDJIytIN?=
 =?us-ascii?Q?U8uwXV9qUURoJ9vbMwGbhf4M+Itj6FCZduCUwkNkfHjWi2fVTU951j+gacSD?=
 =?us-ascii?Q?Lna6IrdiQn0PmyHHmGrZhpqLaD0TB2eo6daSIYqy6LRiLvSEFHZz6v5TqfnA?=
 =?us-ascii?Q?RGWfksRYGCxDakcBqKfGJ7egspydbCNvnO8USOUEmo2OYn/rpP3QNLvpZjNd?=
 =?us-ascii?Q?x+8pZz+mCPZfu2wg5MhP0lgBMSXO8mczy8llg2BY2Lc+gSBtE4CA5qpo24di?=
 =?us-ascii?Q?cVn4rEnZVCbWAUR614f1ghE9qtMe3+tyi/Q8eMMILhGaXpYNqe1bK5rN7h+l?=
 =?us-ascii?Q?x8A8dAo2TXFPMAdMmCFyIICYBx4zVzEadH+1rG6agAgXFQErr8PtB3KDPt+Y?=
 =?us-ascii?Q?iEhCDAcvU3RqIqLsnRk78Jj3JjK1aUyhZsjr/M+4GJx88tuqCLm6/GyAKn8V?=
 =?us-ascii?Q?Fp0T4URohAT0JJg1T5S4fwQ7J+4UF8Tlr0ALcZ8/EVJYumvIl1AWRrbcQvS7?=
 =?us-ascii?Q?tfJXSeUnfKZdX4ri5uNDGf+Dh0jGV2XTFumtuISDmFNcXQ2E3b69PXbbOwsl?=
 =?us-ascii?Q?z5K7GjPv8LT5VVWkOR+xw19olx+CLs3JTaIL97jQriV7hP8gq1kijLtyIuIn?=
 =?us-ascii?Q?6PrksLGP3v9ScZI+opyI3uc+yIoaDJckMzdY03Pz+8pBT9TBehNlDTQG7+65?=
 =?us-ascii?Q?AQhQjOkfeR9mANpzyeMaEI4M5U84U6VtU9w7P+9bPMP6vIha23L21UsOaGv8?=
 =?us-ascii?Q?FncB9gqExT8/WfoPKZt0qXs/IDgZ7QRXqPI/h2Q8G4bwKc8XGpW5QMUYRk0?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e426c2-a224-42b7-ca8e-08dbc3f1ecb6
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 09:20:03.4439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB1638
Cc: syzbot+e295147e14b474e4ad70@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

Currently there is no check for remaining space before adding folio to
batch, which means that folios can still be added via folio_batch_add()
when the batch is full and cause errors.

The following is related bug reported by Syzbot:

UBSAN: array-index-out-of-bounds in ./include/linux/pagevec.h:74:2
index 255 is out of range for type 'struct folio *[15]'

Checking the remaining space before adding folio to the batch can
solve this bug.

Reported-by: syzbot+e295147e14b474e4ad70@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e295147e14b474e4ad70
Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
---
 include/linux/pagevec.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
index 87cc678adc85..208f9a99889f 100644
--- a/include/linux/pagevec.h
+++ b/include/linux/pagevec.h
@@ -71,7 +71,9 @@ static inline unsigned int folio_batch_space(struct folio_batch *fbatch)
 static inline unsigned folio_batch_add(struct folio_batch *fbatch,
 		struct folio *folio)
 {
-	fbatch->folios[fbatch->nr++] = folio;
+	if (folio_batch_space(fbatch))
+		fbatch->folios[fbatch->nr++] = folio;
+
 	return folio_batch_space(fbatch);
 }
 
-- 
2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
