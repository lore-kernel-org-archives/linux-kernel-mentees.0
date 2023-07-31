Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8726EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 01:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 560116101F;
	Mon, 31 Jul 2023 01:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 560116101F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ci02DAEY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOycFwX10Y87; Mon, 31 Jul 2023 01:45:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 40A3E605D5;
	Mon, 31 Jul 2023 01:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40A3E605D5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10A6CC0072;
	Mon, 31 Jul 2023 01:45:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBE76C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0B0B4051B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0B0B4051B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ci02DAEY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJiJix6BdNyD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:45:25 +0000 (UTC)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7506F402F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 01:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7506F402F4
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-76754b9eac0so339260585a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 18:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690767924; x=1691372724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pn4weG6Y5i7gerI+k04YQwCownL4+8awy6E3to2R1SI=;
 b=ci02DAEYs27EryA4sSGbc10JH58miu0Po+CZeT2WfGoYd4ERftHkXdQmv5IGY+ifG/
 uURmQpWoPVoW9jiTCc2xlc8S/toSKf/IKlg5r5Li1CrbBHzQpd7HScCad+GkEQnP9Vyg
 BlCZiUuzFgMbIqNlJDXFdem6X9Fiqc2GrQ7xJuqCL8KZRfV6FRSdcnjjNRy2u2y922GT
 /x42h3rbdxykY2xCKKaqokKqgPvf+ybz9E2hznnQmMLgMHmj387twHcaR6JalUqZAQfg
 sftpueOY7iBk4TsoIX2UT7uR8SCMxEKPAVaWmWg7JLdl1gPqPJlGL9cGUXY7OAYk3TAA
 +wQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690767924; x=1691372724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pn4weG6Y5i7gerI+k04YQwCownL4+8awy6E3to2R1SI=;
 b=LF1zyIEg84uAUDVPqN3bmoBZSK6I1I399gGKxyH0+8UauD/aGMmpXYzPZqI7D//R7j
 xH//+tAVcVBmCbma58mK68AJbGAbGI6S32Hr6fHIr7Q1i8SV392pXVj+XkqfLoRI4qGT
 xPnDbeNIO/ee74IYt6elO0cxtAKrK2Nav6H6dM1vR3UjEVPM4SqcshHS/jX3ZoFTDkYM
 9jn8tMoP3bt3eFMl1YtDZQ7jB68oJoOhoROR/dQDDf94CnzBHpeJxBrtzSVShMfcGCcK
 RyNmfl9vskoWxQqc7oATMMCOnKK3UB8Y3Hl8Dj29eI41+WJQ2V52uDQkMEJT9FBeKWo4
 vKDw==
X-Gm-Message-State: ABy/qLa7GG2VraHitX12rCa+K5oW79Js95hluZH6flacKZ9TPjKsDxh/
 d0+zVmyQm3itBFiHvEDW9D0=
X-Google-Smtp-Source: APBJJlF/FYscW2kRo+EobwWTLlSEAarUAx7jxav57ZA3pGSbgtDGrmX4A52anGLpuMck6AuHXE6qHA==
X-Received: by 2002:ae9:c108:0:b0:767:26d:1142 with SMTP id
 z8-20020ae9c108000000b00767026d1142mr9035502qki.21.1690767924015; 
 Sun, 30 Jul 2023 18:45:24 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a62ae14000000b00672ea40b8a9sm6593135pff.170.2023.07.30.18.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 18:45:23 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: cosmin.tanislav@analog.com, lars@metafoo.de, Michael.Hennerich@analog.com,
 jic23@kernel.org
Subject: [PATCH] iio: accel: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Date: Sun, 30 Jul 2023 18:44:06 -0700
Message-Id: <20230731014406.22810-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Replacing zero-length arrays with C99 flexible-array
members since they are obsolete.
Use the new DECLARE_FLEX_ARRAY() auxiliary macro instead
of defining a zero-length array.

This fixes warnings such as:
./drivers/iio/accel/adxl367_spi.c:38:6-17: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/iio/accel/adxl367_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/accel/adxl367_spi.c b/drivers/iio/accel/adxl367_spi.c
index 118c894015a5..9dc61cb45fc5 100644
--- a/drivers/iio/accel/adxl367_spi.c
+++ b/drivers/iio/accel/adxl367_spi.c
@@ -35,7 +35,7 @@ struct adxl367_spi_state {
 	 */
 	u8			reg_write_tx_buf[1] __aligned(IIO_DMA_MINALIGN);
 	u8			reg_read_tx_buf[2];
-	u8			fifo_tx_buf[1];
+	DECLARE_FLEX_ARRAY(u8,			fifo_tx_buf);
 };
 
 static int adxl367_read_fifo(void *context, __be16 *fifo_buf,
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
