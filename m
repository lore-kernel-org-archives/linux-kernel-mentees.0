Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC03C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Jul 2022 12:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E6E60F68;
	Fri,  1 Jul 2022 12:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0E6E60F68
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M7Mb6TYV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGcEWpJbEvI4; Fri,  1 Jul 2022 12:51:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C014560D6D;
	Fri,  1 Jul 2022 12:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C014560D6D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC122C0032;
	Fri,  1 Jul 2022 12:51:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92723C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 12:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D5D440148
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 12:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D5D440148
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M7Mb6TYV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nS0Fm_h2nCIp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 12:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B833D40119
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B833D40119
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 12:51:40 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id b2so2288778plx.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 01 Jul 2022 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=LI4LxelWEjEaX1Q8c74mSsIuglj1BIMj7hPy6RZdBWU=;
 b=M7Mb6TYVMz5tzKe9yvrHm0hj4iojUpB3gA+OWfLHAU2gIBbc//BWLgsLT6vT23JrTn
 YHbbX0upeseqhLOefVXwgajhtIqy9AqCzjsA/8BSm/gkjSfv2sUOyKCgXut62IcfZA6p
 as0QZ3m2pHC8Sv/BMRYY3fWCYW4bBDpCv7TgdBrZpmeMXT+dbesyC3BKACOPMzwFIs6i
 UsogCpXFpTXNXjkBT4Z26I6Srs++42MBZC6qeyIO0JpmA8eXczIoynDwIlsyWB7YmGvw
 dmE8q+LUNIbco/H3cfISYQNMlG5BQ8R9LCKlf5+Xgjj2CKFqclsP62DZnRwI46EK7EWa
 nZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LI4LxelWEjEaX1Q8c74mSsIuglj1BIMj7hPy6RZdBWU=;
 b=2wXDzNCdZL0NYbeRuavvWGlSP+4BTfxT6PyHWJ6nskGPec0HTzZ7gpymdHZp680HpR
 cYjPH/SOh1QxKT26ADyxqOI00ImGoheQPmrc0141d1ArnA5H59uCK1Zh+XkSdg/1ulis
 ECKTuJyky69b5MVJ0OWNfBjAoJzqHr2AQ27sJJ0iKkXXQ1Y9j/hfwIE8oZefjz5dA/mh
 G4u0NMEDhWJTAeWABmg2uluGC/x58N6pnvP21H/CyxP5QizPfMHq+aWgtkJhG/DLPEEj
 nc/v6u9KbQFvPrn2L33D80jTvopBgCaPCidNsJoTaTzrPsO3VQM3qRWnwXiaJWDLt7IM
 UuvA==
X-Gm-Message-State: AJIora/1nvXEV7BoLQsGfmPOzQLFyru89TKU3wd4wYkOR7suroxb9COr
 zvVxjNQ3hb4FisqIRDx/imj+0EseajiFjg==
X-Google-Smtp-Source: AGRyM1ssIZSAjCSS/BH6CNkAGsHwBNKucbfiSDUis538OdLV97pyXbAdS1YasJb2xKooMt6CRZLLOw==
X-Received: by 2002:a17:90b:1c86:b0:1ee:e795:a6a with SMTP id
 oo6-20020a17090b1c8600b001eee7950a6amr17985059pjb.205.1656679900162; 
 Fri, 01 Jul 2022 05:51:40 -0700 (PDT)
Received: from Negi ([68.181.16.243]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm10452851plb.57.2022.07.01.05.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 05:51:39 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: [RESEND PATCH] selftests: drivers/dma-buf: Improve message in
 selftest summary
Date: Fri,  1 Jul 2022 05:50:52 -0700
Message-Id: <20220701125052.5300-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Selftest udmabuf for the dma-buf driver is skipped when the device file
(e.g. /dev/udmabuf) for the DMA buffer cannot be opened i.e. no DMA buffer
has been allocated.

This patch adds clarity to the SKIP message.

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index de1c4e6de0b2..c812080e304e 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -32,7 +32,8 @@ int main(int argc, char *argv[])
 
 	devfd = open("/dev/udmabuf", O_RDWR);
 	if (devfd < 0) {
-		printf("%s: [skip,no-udmabuf]\n", TEST_PREFIX);
+		printf("%s: [skip,no-udmabuf: Unable to access DMA buffer device file]\n",
+		       TEST_PREFIX);
 		exit(77);
 	}
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
