Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3360EB8FDD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Sep 2023 14:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 787C2820FA;
	Wed,  6 Sep 2023 14:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 787C2820FA
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=claudiocambra.com header.i=@claudiocambra.com header.a=rsa-sha256 header.s=sig1 header.b=qot7WPym
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcZ_0p48iaMQ; Wed,  6 Sep 2023 14:37:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2CF31820E9;
	Wed,  6 Sep 2023 14:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CF31820E9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CD09C0071;
	Wed,  6 Sep 2023 14:37:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09ABFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 14:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B691360EFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 14:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B691360EFE
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=claudiocambra.com header.i=@claudiocambra.com
 header.a=rsa-sha256 header.s=sig1 header.b=qot7WPym
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DGgznxGbGvu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 14:37:50 +0000 (UTC)
X-Greylist: delayed 573 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 06 Sep 2023 14:37:49 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF61D60E4B
Received: from pv50p00im-ztdg10011201.me.com (pv50p00im-ztdg10011201.me.com
 [17.58.6.39]) by smtp3.osuosl.org (Postfix) with ESMTPS id CF61D60E4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=claudiocambra.com;
 s=sig1; t=1694010494;
 bh=AaRc3mMsr8uRyqgPIujCCQ/LoqhOzGj7mkw/qGVUYvo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=qot7WPymvuwFj+OlrVZyZC3DoY/FRwqfQ+3WxcbIL4cUTbkakJbzTcB/bp1eXozZg
 X9pntqH13fcOurFqD4hv0+jpnt/ZBK9pbAferowtlVkAe+kpLqcm9dkavK/pFvC6N0
 lnOwdoGh5OgvlD8NPqK3W7HX3uwHg4JDktU5TswWJJgzbcobGzf8efvVd+eQh8cxHZ
 R1AQZTTvW5rUoeF8zH2rGmlkWN7d2g6hpF6m6gRk5do+6rTDMZ7hPrOv3EXdbvgXJ2
 ZBOMtoOaI9WT/gQAJqcHekt1ddPEndVeqogOAMKhEOVeWRflLD7dWnksyMqSYFhXzh
 1SSWihFQurA5Q==
Received: from localhost.localdomain (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10011201.me.com (Postfix) with ESMTPSA id 896356801FC;
 Wed,  6 Sep 2023 14:28:10 +0000 (UTC)
From: Claudio Cambra <developer@claudiocambra.com>
To: skhan@linuxfoundation.org, ivan.orlov0322@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] docs/gpu: fix docs compile error for i915
Date: Wed,  6 Sep 2023 22:27:47 +0800
Message-ID: <20230906142746.93411-2-developer@claudiocambra.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Proofpoint-GUID: kGJWdrJrYEXPy6-Q0WNuhlvTyFeG0nx7
X-Proofpoint-ORIG-GUID: kGJWdrJrYEXPy6-Q0WNuhlvTyFeG0nx7
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxlogscore=613 mlxscore=0 clxscore=1030 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2309060125
Cc: Claudio Cambra <developer@claudiocambra.com>
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

Compile error was caused by improper doc comment whitespacing

Extra task for "Documentation task"
Linux kernel Bug Fixing Fall Unpaid 2023

Signed-off-by: Claudio Cambra <developer@claudiocambra.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index ddd146265beb..fa70defcb5b2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -26,6 +26,7 @@
  * The kernel driver is only responsible for loading the HuC firmware and
  * triggering its security authentication. This is done differently depending
  * on the platform:
+ *
  * - older platforms (from Gen9 to most Gen12s): the load is performed via DMA
  *   and the authentication via GuC
  * - DG2: load and authentication are both performed via GSC.
@@ -33,6 +34,7 @@
  *   not-DG2 older platforms), while the authentication is done in 2-steps,
  *   a first auth for clear-media workloads via GuC and a second one for all
  *   workloads via GSC.
+ *
  * On platforms where the GuC does the authentication, to correctly do so the
  * HuC binary must be loaded before the GuC one.
  * Loading the HuC is optional; however, not using the HuC might negatively
-- 
2.41.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
