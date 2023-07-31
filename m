Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FACEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 01:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF49815CE;
	Mon, 31 Jul 2023 01:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAF49815CE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CIMHYVIL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytBMwg1zDx-q; Mon, 31 Jul 2023 01:29:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 834C581815;
	Mon, 31 Jul 2023 01:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834C581815
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E522C0072;
	Mon, 31 Jul 2023 01:29:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 604F8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35CEE6101A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35CEE6101A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CIMHYVIL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZv8mnBCu5_J
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:29:51 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F2A160F5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F2A160F5E
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-563d3e4f73cso2182175a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 18:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690766990; x=1691371790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xIIhCDOH7Yz5qlTpKDXtZZdnWeyGOEAV1deFecuA5Bk=;
 b=CIMHYVILe2Ga9K6PB29WGrUwogEpNfAI7k3CSKpE0izeGeu8/SbFoosF95BUu2DCsx
 JIB03K673qERBb7DmlesQTmPnwqNekjJgmLl4poc4fJ8Xrpf7Vv6zofSocLGa+hTKJEe
 tp8ZpygEwFs9xQ2VKk0m/VYYxlUlFie4AvCeLh+285B+aaSZfp3jrDyYGjNV2eM+IFCp
 NuuCt/aWv95SnxXDenDbb5sdaxKqLOmyzIS7inIh0xrIsfN3BLs8pz1mlhxejez3zC1C
 NKbfK0rzDVia3XNWtO7FikMzlTKFIeUqqyzygJ06vKXErfk6xQdfojA/q5tiIFnamii1
 so9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690766990; x=1691371790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xIIhCDOH7Yz5qlTpKDXtZZdnWeyGOEAV1deFecuA5Bk=;
 b=IcdMM7RYM3dJc0mHaOhO+86VjT3kTuxm3wCxYRRqYriKXAcDtYxwwzjCBL6ZX+rA16
 WhQNuAdjQA0O8gWBKEM7rWQYrvMqco8DUMma6+ehND4j8YuYX5yvqUltWj1E2jPLhkvi
 7TYk0d5zAg6L8St/n+T5bWkOjK09ypZAY9Xxk5NXvbsSgbfhrbs6MYyCwT93JIfXuc+V
 qj20FPdW9BTRNsdsjsJWUlxVxqFKDcRyK117EZLzOShDgiPqZUyu0BCNyvPqnM5VztxL
 3UabVoc0FgEIJGxuJlXn5B/n4l1w89aqLq6vf796N13T5mk60u1qaD07J7KMUOKjCLcj
 8oPQ==
X-Gm-Message-State: ABy/qLZJfjmzpNH2jc62L0csVbbVXUKbe0npSnOP35Z7qPwGR1idw4sW
 Jh9f+cK5fj2CrPasxT3bHAo=
X-Google-Smtp-Source: APBJJlHZ6HcObPOdibXv5PwgRtX5UYPrYVpL9EBylHOssbj0fI2JjX1oSSInlzrjssBpbInxGRzJ8g==
X-Received: by 2002:a05:6a20:840b:b0:137:514a:9835 with SMTP id
 c11-20020a056a20840b00b00137514a9835mr10050395pzd.9.1690766990276; 
 Sun, 30 Jul 2023 18:29:50 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a170902b7c500b001b891259eddsm7141277plz.197.2023.07.30.18.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 18:29:49 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: kvalo@kernel.org
Subject: [PATCH] ath6kl: Replace zero-length arrays with DECLARE_FLEX_ARRAY()
 helper
Date: Sun, 30 Jul 2023 18:29:41 -0700
Message-Id: <20230731012941.21875-1-rauji.raut@gmail.com>
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

Because zero-length arrays are obsolete, replacing them with
C99 flexible-array members.
Instead of defining a zero-length array, use the new
DECLARE_FLEX_ARRAY() auxiliary macro.

This fixes warnings such as:
./drivers/net/wireless/ath/ath6kl/usb.c:109:8-12: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/net/wireless/ath/ath6kl/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath6kl/usb.c b/drivers/net/wireless/ath/ath6kl/usb.c
index 5220809841a6..bb3771a3897c 100644
--- a/drivers/net/wireless/ath/ath6kl/usb.c
+++ b/drivers/net/wireless/ath/ath6kl/usb.c
@@ -106,7 +106,7 @@ struct ath6kl_usb_ctrl_diag_cmd_write {
 	__le32 cmd;
 	__le32 address;
 	__le32 value;
-	__le32 _pad[1];
+	DECLARE_FLEX_ARRAY(__le32, _pad);
 } __packed;
 
 struct ath6kl_usb_ctrl_diag_cmd_read {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
