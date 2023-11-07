Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F137C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Nov 2023 17:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2114882021;
	Tue,  7 Nov 2023 17:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2114882021
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JGlAI+o+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G06rz_zdyeq6; Tue,  7 Nov 2023 17:33:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F209B81E77;
	Tue,  7 Nov 2023 17:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F209B81E77
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAAFEC0039;
	Tue,  7 Nov 2023 17:33:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E8D5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 371BA613FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 371BA613FC
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JGlAI+o+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gBLFaf7o97Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:20 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4B86611B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4B86611B4
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-280cc5f3fdcso5467143a91.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Nov 2023 09:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699378400; x=1699983200;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OfvBeM19p1hbFY3xaolUZcqgGO7w8iDi+t8l9XRgS0A=;
 b=JGlAI+o+j+8OUrv0Amwwbu11oi9ttPsxAp3Bwg6WfZHc7xQOnHSXaqZQwFbpQTW4RA
 NkBYQyjdvvTFwey+ZLjLPgrcO9zLold3T0/RbXT03O3hT/xdB2JCfhIKQK3tczymF4kW
 RY7pFByb02dcJMVINUxMLYN3mad25a9c1ekBTLUnb9Bpk7A6jcEj8atK8b1NxcYfDWbY
 Fbzp+SwPwCjg8WuFofvM0C5cUoyAInyryE5BUyffgDcTQS9ofvy2VK7Xb1YYAlyt/30Y
 NeuNxRQfaK4nyCS44bVZhltmXl5wClonMJgpjcbX28ch+33ARBkrLrMYyn86mq03tAD5
 spEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699378400; x=1699983200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OfvBeM19p1hbFY3xaolUZcqgGO7w8iDi+t8l9XRgS0A=;
 b=acdYfAs6uG6ZQTpYp+g+0u9sWvdqcgLqBewUF4SxMUDVmR72gc/AwzixhzCQnysB8S
 f37N6gm9mp6MraQUGJUaOCG/XmH3jAyZJ2k2a6Dm+8QrUNARYMjc/53a3gxZh17R2fg/
 BfmxLpaJQAE5Vmhpr27iogBxV0yK7AcAr6rWjVYAz0QmA0Bf+Va0BZnDks2Hg+sR8ORN
 5pe70BsLYjMKoZSAQYLMfkhGzTjZVECcd07oR+ICIs6QXgXrM5K6EsfHGkKpVyyBVd8a
 Jf4GMIxWo5oI8HUN1siFCWfrfnJ/4Nxk0fHJJB2CdMefc5YTTdk6ZDlLVo8WkM3lbrmE
 r9gQ==
X-Gm-Message-State: AOJu0YwP+T+skNEvFTkVrCiyD8dRv2NmJUdIULVIdHeTjfLfOGFIxTFb
 HqfD6iXlDPCVw8nu7uq/Lxs=
X-Google-Smtp-Source: AGHT+IGR3+HJYG52VcNjUg0FdvJh9y+cC7+ByeGqBIax5M2hvjKP6JYJ9GFht6qdSvm4/gNZEHkltA==
X-Received: by 2002:a17:90b:3eca:b0:280:f534:6b9c with SMTP id
 rm10-20020a17090b3eca00b00280f5346b9cmr6194419pjb.21.1699378399965; 
 Tue, 07 Nov 2023 09:33:19 -0800 (PST)
Received: from archlinux.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a170902b58d00b001c9db5e2929sm103116pls.93.2023.11.07.09.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 09:33:19 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add asair
Date: Tue,  7 Nov 2023 23:00:53 +0530
Message-ID: <20231107173100.62715-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Anshul Dalal <anshulusr@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jonathan Cameron <jic23@kernel.org>
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

Aosong Electronic Co., LTD. is a supplier for MEMS sensors such as AHT20
temperature and humidity sensor under the name Asair

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..df3204f9dda6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -143,6 +143,8 @@ patternProperties:
     description: Artesyn Embedded Technologies Inc.
   "^asahi-kasei,.*":
     description: Asahi Kasei Corp.
+  "^asair,.*":
+    description: Aosong Electronic Co., Ltd.
   "^asc,.*":
     description: All Sensors Corporation
   "^asix,.*":
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
