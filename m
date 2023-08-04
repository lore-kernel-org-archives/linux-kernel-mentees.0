Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FBCC04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 20:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFA8460FA2;
	Fri,  4 Aug 2023 20:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFA8460FA2
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QQcJz9uC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0E9rbFY1WmMW; Fri,  4 Aug 2023 20:07:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C898560EF2;
	Fri,  4 Aug 2023 20:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C898560EF2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A26A7C0071;
	Fri,  4 Aug 2023 20:07:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB0E4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 20:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1CF760BFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 20:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1CF760BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPTWG6tfNIF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 20:07:18 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1ECA960773
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 20:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ECA960773
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-267fcd6985cso1666921a91.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Aug 2023 13:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691179637; x=1691784437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9KXDwNu6aYrXX0sYCTUcQetgCxUApoq2fXsL5SXF8OE=;
 b=QQcJz9uCjbag3hM391nlRlQLmZBvvnS+vaGXe2qOCoj40pUkuIMTHsCYlmPsvXPOnf
 Bvd7j2y3NN+ZcmUPVAWVZggjSCRtbfCIDzxCrAHd/Asg5dSnfMKmgFvThGbeWwgci281
 tffCY4q8Uff/3XdMlijRwnYUvAUjvs4vsbdt/UoH/x2yq9i18ZkJG19EEBbOA8Douc1e
 SZWaV1HWjuxpRq5Fo6R8mBcJFiy7h7vGkn3OnuLb9kVV08soes8nSI3O/RD50hxL8ScW
 ZOA6OlmKjE0sZDvDGXOC9w71yFrBApzpyH4+/FDUIyw/8qtFqLIYDU+FijqlIHe7Pptp
 QtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691179637; x=1691784437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9KXDwNu6aYrXX0sYCTUcQetgCxUApoq2fXsL5SXF8OE=;
 b=RXwkZq4IJTvONWLYBiDI+2ZVYuDWYdKSlSWd9dOU7P3UVVIJS7C6xqrpqUwsWcLrpL
 Oho4sFmTvgJUMW3vLJT5DBh6KLGI4b2RKod33odxHzmCNxKkQLoI3p8/ZonCPrk+zHoB
 jL7H6IKW7+8w3eorUznO8k5tqx8xEtyRewWieGk6GMi2xthx3XzitLErZEA0IAzhVsT+
 sZaceRs3uReRpVm3Vs1lGR7i1KPyPwkXzwj0tUuVOFIrIXpklng1pk63QBCky+Ftv5LO
 c1qwbvzrdSD/QExyGu2lxgFPOj8fYjBDoINClJLTr/tQ3fYd7lKD0Nxq0U8ko94uIDD4
 2dUw==
X-Gm-Message-State: AOJu0YwNCT9HEaPFssMEig90y9+Ts/K61aroXppCG5puCYQvuAvupD1F
 iT0qToL1Aeh/eQQLhGOSzqs=
X-Google-Smtp-Source: AGHT+IFvx1XZlGEz6pMwJWkfglH5KDZBXPOJzoBmZBez6tvBB1Nv+7/cZdn3eekdoJKXI5GzGsYp3w==
X-Received: by 2002:a17:90b:f8a:b0:268:2f2:cc89 with SMTP id
 ft10-20020a17090b0f8a00b0026802f2cc89mr2804820pjb.4.1691179637364; 
 Fri, 04 Aug 2023 13:07:17 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1056:ada3:1859:30f6:c95a:3e44])
 by smtp.gmail.com with ESMTPSA id
 ge13-20020a17090b0e0d00b0024e4f169931sm4534070pjb.2.2023.08.04.13.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 13:07:16 -0700 (PDT)
From: coolrrsh@gmail.com
To: broonie@kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] fixes warning
Date: Sat,  5 Aug 2023 01:37:10 +0530
Message-Id: <20230804200711.65750-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

Typecasting the interrupt number from "unsigned int" to "signed int" to compare with 0(signed int by default).
Declaring interrupt number as "signed int" would violate kernel standards. So typecasting is the possible approach.
The fix is for spi-mpc512x. 

This fixes warning such as:
drivers/spi/spi-mpc512x-psc.c:493:5-13: WARNING: Unsigned expression compared with zero: mps -> irq < 0

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
 drivers/spi/spi-mpc512x-psc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
index 99aeef2..50a4f31 100644
--- a/drivers/spi/spi-mpc512x-psc.c
+++ b/drivers/spi/spi-mpc512x-psc.c
@@ -490,7 +490,7 @@ static int mpc512x_psc_spi_of_probe(struct platform_device *pdev)
 		(struct mpc512x_psc_fifo *)(tempp + sizeof(struct mpc52xx_psc));
 
 	mps->irq = platform_get_irq(pdev, 0);
-	if (mps->irq < 0)
+	if ((int)mps->irq < 0)
 		return mps->irq;
 
 	ret = devm_request_irq(dev, mps->irq, mpc512x_psc_spi_isr, IRQF_SHARED,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
