Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A9118031
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ocq34tlA"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A7EA414A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 13:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A7EA414A1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ocq34tlA
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zeO9fMvbj63Q
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 15 Nov 2023 13:00:16 +0000 (UTC)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EC061410E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 13:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC061410E7
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6d64c1155a8so3149374a34.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Nov 2023 05:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700053214; x=1700658014; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wDT3a72/4EK2RXUg+bwJp3dxgNq1+ZbWNBolGSQCq8U=;
        b=Ocq34tlALPTzAt1wdALDJcIfhW2l2q3xuQ50ikIVAZtrrkyKbDRUXt8JIy0Nho8ptM
         jzjdVY6IPos4cuYSycJ0c9nicBn4uFo8aeCQjU1G2+jCWVlUKyFiRnmDB+cXSsW3jml/
         VZ3ASuFmufsyw4AbL0YX7EoyQHs/g/DvwHY2fTP5LTCQq9kp1N9jdl+E3f9k7Nu2+dkU
         KKsnetMKXgDGX3ZPi2HOZLk1ojq7flBn3IOkbHs0oEayDJTwRPndThxPP/Zuh9Ca1zOQ
         42z31ppkZKNtQ5aEFeE/fI/GukI/c7mm1OR2gRkK83APmrmYiAiBPzv7nF7Ky0Yeeb/0
         AJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700053214; x=1700658014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDT3a72/4EK2RXUg+bwJp3dxgNq1+ZbWNBolGSQCq8U=;
        b=UIzATYq1jVdGRS4I2SKPkSVf9OIQwmi1cTOXIrm9JyrMfXEqh5tM1+uwFqJUKgkuLj
         pmn2lKOcUcYKmnvMFWFHlliAqHqgZCFgfL4JZtkn+L4ZQkTVAb0lLrBcVfzhQAYPR9i5
         8AnpU6/qwOYshczmgBxLZ67lA8KdXEZqhbOD5syIFHJbTRIHuaJZ6Ua2BaElA4moGcGW
         vjFz6hVBCRMU9VLN8iW8YI0gdb7eMokpDxbyWasG5499HGFs1TDckj16RCnDWmDIrlIQ
         D9qIA/Q2mBXww/I+eGtvhhwPf6XCOj/oUlh+e38aJnt1EMwOZxiUPNz6hTE659ZF6trD
         +Q0A==
X-Gm-Message-State: AOJu0YyWHTX2gkfiJBppva41uOgvEX/TpvM3kUAXSxEmIRmcmkWukNK2
	6GKdrZYqvCniGqDhepWzVzY=
X-Google-Smtp-Source: AGHT+IEPrIUX6ZzViiJXg+HhiZ1aUAYZpbVsJ3LLGoCj+Ba6zvmxvqFqsdgCHXtK315N6GkzpKzK2Q==
X-Received: by 2002:a05:6870:f14d:b0:1d5:b2ba:bc93 with SMTP id l13-20020a056870f14d00b001d5b2babc93mr15039104oac.13.1700053203762;
        Wed, 15 Nov 2023 05:00:03 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id fh42-20020a056a00392a00b006c4d128b71esm2812867pfb.98.2023.11.15.05.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:00:03 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add aosong
Date: Wed, 15 Nov 2023 18:28:06 +0530
Message-ID: <20231115125810.1394854-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aosong Electronic Co., LTD. is a supplier for MEMS sensors such as AHT20
temperature and humidity sensor under the brand name Asair

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v2:
- Changed vendor prefix from asair to aosong
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..48d4ff635562 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -117,6 +117,8 @@ patternProperties:
     description: Andes Technology Corporation
   "^anvo,.*":
     description: Anvo-Systems Dresden GmbH
+  "^aosong,.*":
+    description: Guangzhou Aosong Electronic Co., Ltd.
   "^apm,.*":
     description: Applied Micro Circuits Corporation (APM)
   "^apple,.*":
-- 
2.42.0

