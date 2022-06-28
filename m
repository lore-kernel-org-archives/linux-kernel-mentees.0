Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C55C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jun 2022 06:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B486B415B0;
	Tue, 28 Jun 2022 06:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B486B415B0
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=IwR5aSq0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVzb2W3ObWFW; Tue, 28 Jun 2022 06:47:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8D82F4154A;
	Tue, 28 Jun 2022 06:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D82F4154A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E5CCC0039;
	Tue, 28 Jun 2022 06:47:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4ABD8C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 06:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 118B7831A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 06:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 118B7831A5
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=IwR5aSq0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vyEB4647I2c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 06:47:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E72830E6
Received: from sender-of-o52.zoho.in (sender-of-o52.zoho.in [103.117.158.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6E72830E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 06:47:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1656398840; cv=none; d=zohomail.in; s=zohoarc; 
 b=elbxiBPgCFU3Q1HeSZO3T8aGAHTd7WBPWTrQUtxH99UOQQGLfonylpAqEMnGaIDrFkx1synYywGZACJw7PgHKxxO9hlGJKeerQQCm/hKb1JPoOOMzoyYiqgRj3EK8UyrRbV6eG+v9UthpEgczMsTUiYzdIoIot9+8bU4Q6GlCzE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1656398840;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=HRFI+eRTirvZRFeTRPwa50gFz5/7YOJxbkzkaz1APeo=; 
 b=UD7QxIJjRGdKPD2/0fdixEKyX7I8dLW/lSOmSrR9WClyT+GMpSadNyOMElXveJlBDkuuqkxi8PLxfqL1AdjXpXU9egqqqVl4CKObe087P891gOOuRn2Nvf/us3Y/OcAWVePlFFY4+InQZxeE8QsXWyODIiV4rOXkZKuIvc7BB+U=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656398840; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=HRFI+eRTirvZRFeTRPwa50gFz5/7YOJxbkzkaz1APeo=;
 b=IwR5aSq0pFdUwm9fE5cj4I1c+7n4CBylMdgFHnPZL55IuDKWZaR/7Lemx8vDSMLZ
 sUNrNz6su04MiJ53GAkTSRKaMnfTSYQLdJyJXZ0VNzot50G3mLVIv8HlVkaWzg2OGhO
 FN9M0IxMSWe8cUV0SXdXlWw9Jf1cSVXponQ5TpzA=
Received: from localhost.localdomain (103.249.233.51 [103.249.233.51]) by
 mx.zoho.in with SMTPS id 1656398838723609.1768701113493;
 Tue, 28 Jun 2022 12:17:18 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Message-ID: <20220628064621.14427-1-code@siddh.me>
Subject: [PATCH] MAINTAINERS: Add tools/testing/crypto/chacha20-s390/
Date: Tue, 28 Jun 2022 12:16:21 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-ZohoMailClient: External
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

This adds the maintainers' information for the
s390 ChaCha20 self-test module.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe5daf141501..0fcacd715b1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17438,6 +17438,14 @@ F:	Documentation/s390/
 F:	arch/s390/
 F:	drivers/s390/
 
+S390 CHACHA20 SELFTEST
+M:	Vladis Dronov <vdronov@redhat.com>
+M:	Herbert Xu <herbert@gondor.apana.org.au>
+R:	Harald Freudenberger <freude@linux.ibm.com>
+L:	linux-s390@vger.kernel.org
+S:	Supported
+F:	tools/testing/crypto/chacha20-s390/
+
 S390 COMMON I/O LAYER
 M:	Vineeth Vijayan <vneethv@linux.ibm.com>
 M:	Peter Oberparleiter <oberpar@linux.ibm.com>
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
