Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9B9CDB47E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Oct 2023 19:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF8D3421C1;
	Wed, 18 Oct 2023 19:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF8D3421C1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailo.com header.i=@mailo.com header.a=rsa-sha256 header.s=mailo header.b=l1gXdYSy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W_-vsm2E6_sJ; Wed, 18 Oct 2023 19:14:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 627034217C;
	Wed, 18 Oct 2023 19:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 627034217C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 388CCC0039;
	Wed, 18 Oct 2023 19:14:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 937EBC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Oct 2023 19:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DCF040AFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Oct 2023 19:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DCF040AFC
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com
 header.a=rsa-sha256 header.s=mailo header.b=l1gXdYSy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGzx1H1NQSls
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Oct 2023 19:14:22 +0000 (UTC)
Received: from mailo.com (msg-2.mailo.com [213.182.54.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06F1E4010F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Oct 2023 19:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06F1E4010F
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1697656440; bh=KGqlSDYBgWttHIyKz56cezEh4s6DnMn/uHHqAtaHZ2Q=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=l1gXdYSyRuJwtImnarUvdmkO1qFyaKI3DhuvRM1XwaJ3D60Q5CiE+Fpjieji0wWqz
 maPAA0QuWZl7fOhCq+G68H4kphX2IQZbZuAk0L5HigHfFO48t8Dpfnh1FMAKkX5MBH
 wKl0N0AM3G/dlw8n4p7j/qZMGi6f2hmnQm+qiPLs=
Received: by b221-4.in.mailobj.net [192.168.90.24] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Wed, 18 Oct 2023 21:14:00 +0200 (CEST)
X-EA-Auth: PNQy6XQwm0gdVvIHuOoPi65nI93ancTUU5UJb9uuFsXaKNI5l1yFOTyrmjbf5nkDWZG4QnGtqv6NOJZneH8bR4WWtBB5XN68
Date: Thu, 19 Oct 2023 00:43:54 +0530
From: Deepak R Varma <drv@mailo.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] accel/ivpu: Delete the TODO file
Message-ID: <ZTAucrOT69/tQK2o@runicha.com>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

The work items listed in the TODO file of this driver file are either
completed or dropped. The file is no more significant according
to the maintainers. Hence removing it from the sources.

Suggested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/accel/ivpu/TODO | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 drivers/accel/ivpu/TODO

diff --git a/drivers/accel/ivpu/TODO b/drivers/accel/ivpu/TODO
deleted file mode 100644
index 9077217ae10f..000000000000
--- a/drivers/accel/ivpu/TODO
+++ /dev/null
@@ -1,11 +0,0 @@
-- Move to threaded_irqs to mitigate potential infinite loop in ivpu_ipc_irq_handler()
-- Implement support for BLOB IDs
-- Add debugfs support to improve debugging and testing
-- Add tracing events for performance debugging
-- Implement HW based scheduling support
-- Use syncobjs for submit/sync
-- Refactor IPC protocol to improve message latency
-- Implement BO cache and MADVISE IOCTL
-- Add support for user allocated buffers using prime import and dma-buf heaps
-- Refactor struct ivpu_bo to use struct drm_gem_shmem_object
-- Add driver/device documentation
--
2.39.2



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
