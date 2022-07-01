Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D67C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Jul 2022 14:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC3C641049;
	Fri,  1 Jul 2022 14:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC3C641049
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=Mj1LyBSm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovJHpWJp6pvb; Fri,  1 Jul 2022 14:31:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D047440AED;
	Fri,  1 Jul 2022 14:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D047440AED
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACC6CC0032;
	Fri,  1 Jul 2022 14:31:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E52B6C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF0554249D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF0554249D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=Mj1LyBSm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKQORo1x6cGu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:31:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC1434249C
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC1434249C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 14:31:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1656685875; cv=none; d=zohomail.in; s=zohoarc; 
 b=erWTcZFPc95uCcQpwWIsuffV+kMaIdZaBX2lUFVZ6jQ0PkdyHTqc0dgxgq+SJpUEKhZ8oaW3QIf0a/ZO3ZsSMD72HA4t4cPRLHOpqqauFo9veeNn2A8crxUBVJ5JIzIaBcxO42va30l9d2W/YI01+SZ27NGn25xSVtBHlJ94jOQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1656685875;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=veI3Bj2kl/WS8P7h6+c+mQ6AYTA/bSwSuSLXsp+yw6c=; 
 b=A2oWkHKIUEIGcq9vZwEgZwueTgVJ6qaIjKwYp4DrQR1pJ9o+DXNBxHi7w2oWC+mM2ioJCGkVgWJClQpwYiJGYiesQuThFbEJz8a/aOLlYi5vA2Ifma/Y2j7kdVYOBnknzTuU/VLzeQ8jCvFgg0I/Cbnzx09xP7/ujfoQBMEFnAg=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656685875; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=veI3Bj2kl/WS8P7h6+c+mQ6AYTA/bSwSuSLXsp+yw6c=;
 b=Mj1LyBSmD4fFfVr9RLZxrfArld07QiqMwOU8nOsCvbAFUGlly4k6nsqGitBpd2Mz
 yMihqvc+n9a+fUzYM0OH6NRJBVTb/dudXgBDo6mhot4fbzIEh2L2+KJNmr92UzDQzug
 xSVhrMm8GvSg3zyn7WTeYSXwBtjx2V46W5lQwW1g=
Received: from localhost.localdomain (103.250.137.221 [103.250.137.221]) by
 mx.zoho.in with SMTPS id 1656685873410201.92961736997165;
 Fri, 1 Jul 2022 20:01:13 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Vladis Dronov <vdronov@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Harald Freudenberger <freude@linux.ibm.com>
Message-ID: <20220701142515.14800-1-code@siddh.me>
Subject: [RESEND PATCH] MAINTAINERS: Add tools/testing/crypto/chacha20-s390/
Date: Fri,  1 Jul 2022 19:55:15 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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
CC'd the maintainers in this enail which I had not
done last time.

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
