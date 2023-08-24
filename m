Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE8DC6FA8F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 08:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99D3E41489;
	Thu, 24 Aug 2023 08:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99D3E41489
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Tznc5ZWr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGKy1qg_e1Qp; Thu, 24 Aug 2023 08:57:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9683841480;
	Thu, 24 Aug 2023 08:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9683841480
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73277C0039;
	Thu, 24 Aug 2023 08:57:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE8FBC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 08:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A7214191E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 08:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A7214191E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Tznc5ZWr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uE-Z-716eyQS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 08:57:38 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C4BB40117
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 08:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4BB40117
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bf092a16c9so51068745ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 01:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692867458; x=1693472258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wONcFGWq+PGpZIkK9NYcTrSr8kaoXLZnug4VTSpfpPY=;
 b=Tznc5ZWr+3NAD2cD/d5ogGrBOTq3TgjrZld+TW6mk6d+TZXYJDLL4Auc8V/6Il08eL
 CFGn6otYSEkPncaBfF/lylKc4yQdlxsoLvhlLhj55ZwSwBoapNB6oAegGg3atmr/ZwYw
 O4jgpo+1QrG+3X4XwixG0r5828IiHdmSTrb3B05pngmFwxlaxC0SK6MAnVgxWSh0SsJ6
 slWAhrUde5orpCa1ycNpOJEHZqqKPj7f7cKV/NdWsBPjPYhwk+JeRr7Fo19Wc8/O4tKt
 c8HZD2zgcCyIkRpv/3tGM7t4bgPV7gzozmyIXHsDS/kcyJNx1jMyMsA/JJn+Ezp7N4GJ
 foPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692867458; x=1693472258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wONcFGWq+PGpZIkK9NYcTrSr8kaoXLZnug4VTSpfpPY=;
 b=LpdJnL1sZ1ixDKE1grykOjlHvpLoL3Bs3kgZWOSLKqvBBR1i8UxbkYQK3Rv4sPnlCg
 eu4kCq2+IMWoX5qGXXUpHzV9eUjrNdlYyJaBNZJrPgyayiKTy3Ba4iKyPpTnVL9bD9MZ
 ah1yY7x0izxnPJ7AeRUA/e5ZcnvYpyW5lwKnBCjY8O0gW5A0i6/C67hXFXXpxffNrFOY
 aR1Jcx67LxwltMozNDvRyD9SrSrx+BNjau88f6UYj1x6HfGCRERIpPa18WD9YbPrjW04
 obcmH0uq4qzJqVDIaWRkpxOzP91d9aOKKWRIjXaGfrNyHYDBV8GWdk471l5spLeNI5NM
 0wjw==
X-Gm-Message-State: AOJu0Yyy/CWO6eFNSeBegRXVb5MyvF6dAJAlBeW60fZc8D8cf/hYvcSR
 R7uo//T4B8WnuhpgBH6mfS8=
X-Google-Smtp-Source: AGHT+IHsmAb2LrAKerZ9+R8nOBbMmaVsg9zBo6JFh36BUqIlI7RiLy51goYsL07hTZ4IdFaQPCDi+g==
X-Received: by 2002:a17:903:234e:b0:1bd:aeb3:9504 with SMTP id
 c14-20020a170903234e00b001bdaeb39504mr17985769plh.15.1692867457815; 
 Thu, 24 Aug 2023 01:57:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:1047:2379:8974:f63f:c2f8:6a5b])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170902d34600b001b8b26fa6c1sm12322673plk.115.2023.08.24.01.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 01:57:37 -0700 (PDT)
From: coolrrsh@gmail.com
To: hverkuil@xs4all.nl, mchehab@kernel.org, slark_xiao@163.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: gspca: UBSAN: shift-out-of-bounds in set_flicker
Date: Thu, 24 Aug 2023 14:27:31 +0530
Message-Id: <20230824085731.9930-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
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

Syzkaller reported the following issue:
							
UBSAN: shift-out-of-bounds in drivers/media/usb/gspca/cpia1.c:1031:27 
shift exponent 245 is too large for 32-bit type 'int'
						
When the value of the variable "sd->params.exposure.gain" exceeds the 
number of bits in an int, a shift-out-of-bounds error occurs. The error is 
generated when the variable "currentexp" is left-shifted by more than 31 
bits. In order to confirm the range is valid, the conditional expression 
was added.
				
Reported-by: syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/20230818164522.12806-1-coolrrsh@gmail.com
Link: https://syzkaller.appspot.com/bug?extid=e27f3dbdab04e43b9f73
Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>							
---
v1->v2			
Changed the patch
v2->v3				
Changed the commit message	
---
 drivers/media/usb/gspca/cpia1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
index 46ed95483e22..dafc522d5e7b 100644
--- a/drivers/media/usb/gspca/cpia1.c
+++ b/drivers/media/usb/gspca/cpia1.c
@@ -1028,6 +1028,8 @@ static int set_flicker(struct gspca_dev *gspca_dev, int on, int apply)
 			sd->params.exposure.expMode = 2;
 			sd->exposure_status = EXPOSURE_NORMAL;
 		}
+		if (sd->params.exposure.gain > 31)
+			return -1;
 		currentexp = currentexp << sd->params.exposure.gain;
 		sd->params.exposure.gain = 0;
 		/* round down current exposure to nearest value */
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
