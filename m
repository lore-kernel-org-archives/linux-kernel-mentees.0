Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495AFCE7A95
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Sep 2023 13:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5E7D41577;
	Mon, 25 Sep 2023 13:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5E7D41577
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=dMjEWmm9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82dpgWUz84WG; Mon, 25 Sep 2023 13:49:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BA73740185;
	Mon, 25 Sep 2023 13:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA73740185
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9490BC0039;
	Mon, 25 Sep 2023 13:49:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12878C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 13:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC6AB41577
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 13:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC6AB41577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UiRShbnYSwll
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 13:49:18 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02olkn2081c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe16::81c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FCD540185
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 13:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FCD540185
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfYa8WauShdUdEvulzlwYDnvrS1O54NjxlQd7zZwzcwBk4oDgfVgqlsQG+wRXYlEFkkuHeHXlX29YMCht5/gHOYEsZbui4zkGffaItacsRGg/ahfhRE5EY20suua/K3KUC7AiqNfPw3hgmNiuEzWkXdfCgF0PVzF4RS6RgUT9pOCqLgqphjfPkC8OFcoOoRxcbDgjA3Hob45TwIijm8fA/2suIAtXeRFv9tJXWdgCpfN5LYvcaUUPcQnnL4ypTCb2kCetZJ+wGIzYl+2YxHvnQJ5uwWdlURsncrhT0fKCU8Nl+Dmb4z/tOwpKiQcN8J3ywiSbQBa1/NlKoqM/OuIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuqiSa766LRRK8Mhw7oz0wQ7NCzjhOgJY1nFgKBOevY=;
 b=W3p3+JENHHmmFvFja5G0Wglu0xfOzyzUUnSMl0z426yB6OMOx4An+4y+W0eHx1kjs9P2zYoxwhi2RfEdhMnVRVzO2rvfiFIkMCOK+eIm44K2APIEsrM1PMtHF8mNhgAPe/tGGbJyEqXtrEZRork+uxPka3XTpDnjorgE8cfell/I0YBME5+DwS14JEj52HyRdpQNVUiAtirrDpf2/5CLHJmQbx1jvgPy5zT4rGwHWSMF8G63SOo978M/29CTpTH5KOJmJ3u24Y7gH3xH7UiCEj7coXG86n9Gg8eWKKSUcF8P/nmIOGJrF2v5/4PCpXLUWHUmPmO9Pgid6wk3aGFbrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuqiSa766LRRK8Mhw7oz0wQ7NCzjhOgJY1nFgKBOevY=;
 b=dMjEWmm9qJ8JhkkH7Viv5EKi2Et1RMKi5bPYemFnN6hr2oBRfW5Gru11aQfp8TpLP8dwtxJrfNKJknrWp2Tf1CidJvsJYSxZpQrm6rJeRKyCoyArfrksC/O1yzJmCvJd43fiJemeWLkSRKCYXxO270Q5AIv/XxjeKntrhfvNXdiAJQ4ie6iuQZ4FwZTG1jfOadpmtyNHIRHHur36XRcvCF5+wyByE8ZMRloS5WHrgXzxlevAa6VOkTaYplTznz+8cmrTPeY0a8atB2fgnahFXcYicBpb1EWwlyMAlh+zYz4b4bRD4S2SZnS+GKdR7B8YhIqTELx1dVPzGHMjBzhAww==
Received: from PAXP192MB1278.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1a0::14)
 by DB9P192MB1324.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:26a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 13:49:14 +0000
Received: from PAXP192MB1278.EURP192.PROD.OUTLOOK.COM
 ([fe80::96b5:b07f:1856:4593]) by PAXP192MB1278.EURP192.PROD.OUTLOOK.COM
 ([fe80::96b5:b07f:1856:4593%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 13:49:14 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: axboe@kernel.dk
Subject: [PATCH] drivers/block: Updates loop_set_size comment
Date: Mon, 25 Sep 2023 19:18:39 +0530
Message-ID: <PAXP192MB1278B70E2258023496F97F2FE8FCA@PAXP192MB1278.EURP192.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
X-TMN: [K2lhH7PZIeGMuu0qlv0zWDZS7JfOpoNC]
X-ClientProxiedBy: JNAP275CA0061.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::19)
 To PAXP192MB1278.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1a0::14)
X-Microsoft-Original-Message-ID: <20230925134839.1132789-1-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1278:EE_|DB9P192MB1324:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c13824-73b9-4bf1-6f66-08dbbdce344e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v/qZWrrj6qAZ567v5ujX7DiFecEPECd0gxK8zcngi657ab4o3k2DlX0RM4dYZTfAAwrfvhWnOGwTSNOPnvCcC11Ab7dMHiG0ePHUmwOxgDCuA4g5QdbA0CDnMAGdOayKdUZIUVhoYs21XdSpnCiWQVL1MdjNGsAhvPW3CGsZ3pHdyLb8w+EpRjXcl2JWMbzy0+qYpMLobhVU5na1dkWrKRLlKIZ+oWIdLs1zBijB8r/sKPa2zQYhCCVFiRpFH40qP6ikc1yP3yQ/2vaIIQguK0hPz8ysLy0uWnN8C9ZghJMNN1YLMyAEW1krgXylPP24cP1Pue82fA21xqviV+4JMek+JqrAXPBD7201Al5TTWdFg90gRpgHGyUfU0cno1rm6bvziEN23cpQgUOcak9gDppoEq++2B8Spof9HiSAT/uvuTt5g9PODOsMvMyT2avSXXN1ZDS41U3D6UutmJjdLPRbIc4gmN/JmyzS5GVfALQuyk0oW5QsJKt5UpM2pekMiu7HfL20eqnwJlBP+2hQDX1HxzFRa+CVwFHTl4xCDY0ktGGqx/TKRxMqywq9drAkoXnmS0BCj8xYnWRRNQvVcJvsdGpoHnvo1pYZBfTM+cU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6dgAg5bVsIpO7pJoASBRT4Keh55Mb7m6AhxymsoUOJC19EzZi3vRD1llNBji?=
 =?us-ascii?Q?QSilpVraS3PJoXCVIqQ7KtJC4SlWD84BVLmTs94OMm7XUiYlQG1j9sylywe4?=
 =?us-ascii?Q?uiVQhUwXKYmun0Ze9hluOkHh8XmedHVkqXs6Qie5qYLYs2a2oqFOox4cyegb?=
 =?us-ascii?Q?aILpPQvA6kQWhrQSLCYJcef8HwBJ8ePsAVN7tk2MX4QOndZ7grUokRcAIfrr?=
 =?us-ascii?Q?H4FbjnTe3wMS9RjR+DimCvy6aGp7KPA4pFeLybhnySPKfkE72gSj/svxs3fY?=
 =?us-ascii?Q?9/a+4/de85OEzjXme5sgya2dGJIo+GA0M6KmxAiMgDm5IjuE4oaqrX991Dab?=
 =?us-ascii?Q?88BJRyxJxidLXHMuMmzB5LZd71bzwmnwA2Zra8wSBfysAsvSvfc3Vu7nOSt4?=
 =?us-ascii?Q?Fgm/Fm9PZ+adNcESkblzp46DWtrX51bIfCFfoW/0Baf7ihEftQEtA/9yLvIN?=
 =?us-ascii?Q?sQy7PhUuTTIQvIrFalKYwDwqIIedN6slVCOql+TGn5z/mNx5ZZuiH39dCVhL?=
 =?us-ascii?Q?Ov9ikI9jl34WzQjdyvADf/aXZwvlx6Ivh08ZRHcOclFBbH9fSsgbqZLmLff6?=
 =?us-ascii?Q?AUgBouKFZN7hKWrUG31lSPvIJJvopGe7F+dxJssu0qS7iQPJdHprvj+K4cc3?=
 =?us-ascii?Q?W5BYdh/kJQke1IS0iHRUibrBbCyTlqU+V7ahzaUCue5VCOF0UjQ3gTsme1cv?=
 =?us-ascii?Q?FvK/nWNUihrsBj6GZEsrSCOqmrwIkxO3/Ofwoyi66eESXON8QxiOfNwOZbnw?=
 =?us-ascii?Q?yjFd0MsSvbq7FiaaXDNkWR6rTDp/q6dqgpWNUkwFYrgy0+aWE00GcbKqr/5U?=
 =?us-ascii?Q?jAvzadp7fWdLNfrUimHYbr/o3VHCeDHuYfcwt/jXjtmy2M7nAG/qrwrxblqd?=
 =?us-ascii?Q?K3RYaaUzsfk9tXR93xxxhcp/oGX0QNUrc7aL5rw5/3LAU+EIddKwJhRl5QtT?=
 =?us-ascii?Q?ruqrvGBe9ueo0eH0IUdiZhAHGY76mkfda4VuZFXdV4h/PmkUqJ8CyIhrOaYL?=
 =?us-ascii?Q?D5ml8M7yz6qcwloipKaaVfAtXaSutrt0pFLmbDi2XY/bbbDMLjfa8WWeDm9m?=
 =?us-ascii?Q?SzL7hNNIJOuqWdMpxs+ao2xBIIjRbQw0B1uEncfOFYoj7PmfmDWFHv7zuwYW?=
 =?us-ascii?Q?/fBGz6PmPlxYl76VQYrANknD9QFWNUgiSWFkxEgingzL8Jd4jVYA8+KsCozG?=
 =?us-ascii?Q?gxBZUsbqcKJDS7/0xx3Iov99VAGkk0IISCLsvwrhMGKyypwu3v7+qkNwmOQ?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c13824-73b9-4bf1-6f66-08dbbdce344e
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1278.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 13:49:14.7116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1324
Cc: linux-block@vger.kernel.org, Yuran Pereira <yuran.pereira@hotmail.com>,
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

Since loop_validate_size() has been removed, there is no longer a need
to validate the size passed to loop_set_size(). This patch removes
the comment from loop_set_size() that states otherwise.

Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 drivers/block/loop.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 9f2d412fc560..68b8684ca16f 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -228,9 +228,6 @@ static void __loop_update_dio(struct loop_device *lo, bool dio)
  * loop_set_size() - sets device size and notifies userspace
  * @lo: struct loop_device to set the size for
  * @size: new size of the loop device
- *
- * Callers must validate that the size passed into this function fits into
- * a sector_t, eg using loop_validate_size()
  */
 static void loop_set_size(struct loop_device *lo, loff_t size)
 {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
