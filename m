Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9887CC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 04:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE7181FC8;
	Fri,  4 Aug 2023 04:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE7181FC8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TjBfgpSk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7Em8990KhV3; Fri,  4 Aug 2023 04:56:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D140F8381F;
	Fri,  4 Aug 2023 04:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D140F8381F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5467C0071;
	Fri,  4 Aug 2023 04:56:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD06C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 04:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FF8B40A00
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 04:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF8B40A00
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TjBfgpSk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAod4qFD20em
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 04:56:17 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55454400A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 04:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55454400A7
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-686b9920362so1213495b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Aug 2023 21:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691124977; x=1691729777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/eHfAQPBbBkch39+4DVNDl4OjmPDthClYpWhqWwd4JE=;
 b=TjBfgpSkhP8bGjYxDPmWGrhGPMznIowaeh4SWMkAGqMzsdhQUe2aigQ0Eg2SCUGh8l
 kPjGjo4kAAc2RCm9Us/KbQF1SkMMJT8TVIc4f/h8zs+IGawEUeCLOJFSxpEIyrptbIfB
 ETAiEfBqtE/H/w4H2U6ewoUAa+e+HVhWuaHToNdRA+hWi3lWo5JA+9RtAWPJpOb6mSk8
 FUy7J3Er7AMgyQBK2UIfPwlbGn8f/OiWj1l044yc78tVUysSJteh7VTn0TEu8x2zT3LK
 tEunxS0wlCTH4C1tq8o6wWIfEHsyEk0X8pB3UaCIFFhxyFwuemyXYqsRN8Yp2nl5rNO7
 mMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691124977; x=1691729777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/eHfAQPBbBkch39+4DVNDl4OjmPDthClYpWhqWwd4JE=;
 b=RJjPi2Qs7xwJl2bIoYVQvwa/YMOUqr3eMeQTqVo+ngM7r6j5zLquG2I/mtlh1VMZRc
 lvgrx0Q6XwrSYhl2LhHKOkKhprE94Z6vWaCLZT5JRtY7TWWV20NDnAEbHAdmixjO7eft
 HTRK7RjrUGfXttFXRjNMGOoc0ofV46634nTkAeWY6TBbr2VeDR3w4m14AAJZS4prkLTN
 vrgLBZwj3bf2qeUZLJqhlzEsGxAvTeP8iOn4Y1ONgQzlz4yBoa9Y6Zdp/ZbnjbkdqyeD
 jbDqFjsyRHDmcW574LRFNXxXJM2/tIHPWwVTt/iw589l6dG9DWBXDMAJT4LJW/8KcRT2
 qCGQ==
X-Gm-Message-State: AOJu0Yzv+m+3/wvEnVeGov4SbADyDCKEdY4UmcT7EEZXQY4gCRkp6PfQ
 +QU1TJH8xfDtRxvVDODa3/TL0tYyY9NJqA==
X-Google-Smtp-Source: AGHT+IENLKZYCcOhv/BWrcaX4ZEruyz71Ke6GAWDWoyw47ImxqKKmIpDnPRLxx5DXy/ng8trLzyDbg==
X-Received: by 2002:a05:6a00:1488:b0:687:2d68:f30d with SMTP id
 v8-20020a056a00148800b006872d68f30dmr683853pfu.23.1691124976588; 
 Thu, 03 Aug 2023 21:56:16 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:9428:7df2:aef6:7a3e])
 by smtp.gmail.com with ESMTPSA id
 fe23-20020a056a002f1700b006875be41637sm669371pfb.145.2023.08.03.21.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 21:56:16 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: kvalo@kernel.org
Subject: [PATCH v2] ath6kl: replace one-element array with flexible-array
 member
Date: Thu,  3 Aug 2023 21:55:54 -0700
Message-Id: <20230804045554.6934-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
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

One-element arrays are no longer relevant, and their
place has been taken by flexible array members thus,
use a flexible-array member to replace the one-element
array in struct ath6kl_usb_ctrl_diag_cmd_write

This fixes warnings such as:
./drivers/net/wireless/ath/ath6kl/usb.c:109:8-12: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/net/wireless/ath/ath6kl/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath6kl/usb.c b/drivers/net/wireless/ath/ath6kl/usb.c
index 5220809841a6..c8ecc9e85897 100644
--- a/drivers/net/wireless/ath/ath6kl/usb.c
+++ b/drivers/net/wireless/ath/ath6kl/usb.c
@@ -106,7 +106,7 @@ struct ath6kl_usb_ctrl_diag_cmd_write {
 	__le32 cmd;
 	__le32 address;
 	__le32 value;
-	__le32 _pad[1];
+	__le32 _pad[];
 } __packed;
 
 struct ath6kl_usb_ctrl_diag_cmd_read {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
