Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1D8C47257
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 22:57:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 639AB2166E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 22:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="j/cqKE2I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 639AB2166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 273DB88B5F;
	Thu, 30 Apr 2020 22:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WerxTtAUU2uM; Thu, 30 Apr 2020 22:57:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B84DD88B52;
	Thu, 30 Apr 2020 22:57:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA803C0864;
	Thu, 30 Apr 2020 22:57:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A16A5C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 22:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8A8FF883C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 22:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUiJe7PpYSii
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 22:57:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 07E418832D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 22:57:10 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id fb4so3958832qvb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 15:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JwaXAKuRd0apGvpDhNCHAFUyDcZ/LeyJTl3LHyQWiwI=;
 b=j/cqKE2I9ySEFXVhi1aXMr5JuwvMm7JmEKZQt9D1LKparoBCiIz9P+hclLYO3dpOK6
 wEnlqwAeq1CjQyzGb7mYaSuxL1S5DmlqXLKRy9DU9YesLL6oQFLCHrGATgtWl0lZjuHA
 8f9Pu+RFSIvkBO1IzH+dfKLlUDQf0/f33yIRIep/p4XsfICyiHk5vYhzM/NZ77znJjeD
 M7aDOETzdkccWELfAyjE1Y2SnynbI0ZnmBaOoUDGuop4Ziv9AVMSsXOxlWn6e+QbQhHm
 S8XwlhdU7DYpNR04zkVp8pzbtjtBKFN1AhOSlbH98Xeua0/yvQ3JaFsRNB2cqLYmokso
 E4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JwaXAKuRd0apGvpDhNCHAFUyDcZ/LeyJTl3LHyQWiwI=;
 b=J3W+h1KEBsSkEt07Kedbb+0SPrnDKk1Rx2ZPaLffGRHXWq3nFpBGRRQb92Y2xxqLd/
 L/7nKN44IpzG4D5DwQ0/QnUkWZHPE/xDglE1nDHAKnilGIbEnSMowHXCiGV3yxkSHCuL
 t+i5cDU7fYunUKc4N8zzhFYaTgTO0kC+nX9mvBXig7CpV4VdUFd5AQEWO4ijYe+ZQj2W
 OXZEw78y+7O0lglIY7dKHv69Wjmfx1bOBmdlSo2oB3/o42C42PvoB9wg5dQTR9GYB3qZ
 IgFXsPwr1voQbSQDBuDuIX9HX6D31MuEb/Yr/J+5too7IdYabkzpIsdTFhIOjcXOlnI0
 fT0w==
X-Gm-Message-State: AGi0PuYzETr8afpPM1cAwzZX3mLi2MThnzkyPc/toHaG3PbCFiDAr61X
 QSkmCUV3FimRD4IGrrgBxHysHQ==
X-Google-Smtp-Source: APiQypLmKZaE8wkTc6wcMU+OIG30tDXPV6fy6mEI5P2ZFUFQRWrRo5Vo6qL0nK17U8rkzEV1qNLerw==
X-Received: by 2002:a0c:fd8c:: with SMTP id p12mr1343371qvr.163.1588287428897; 
 Thu, 30 Apr 2020 15:57:08 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id x194sm1258439qkb.131.2020.04.30.15.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 15:57:08 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: linux-doc@vger.kernel.org
Date: Thu, 30 Apr 2020 19:57:03 -0300
Message-Id: <20200430225703.113909-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: corbet@lwn.net, brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] doc: misc-device: add uaccee to
	toctree(index)
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

This fixes:

Documentation/misc-devices/uacce.rst: WARNING: document isn't included in any toctree

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 Documentation/misc-devices/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index c1dcd2628911..1ecc05fbe6f4 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -21,4 +21,5 @@ fit into other categories.
    lis3lv02d
    max6875
    mic/index
+   uacce
    xilinx_sdfec
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
