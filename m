Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7113C091
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNYQDtzI"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F16481E12
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 09:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F16481E12
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VNYQDtzI
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DjVFkcKjKT5
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 09:59:47 +0000 (UTC)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C1C53817B5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 09:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1C53817B5
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-28035cf6a30so4163210a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 01:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700560787; x=1701165587; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5d4Ds0rhXmcTPF46DSZlqdSRg4RbFJSILxJbeSUaSV4=;
        b=VNYQDtzIU7AkJwV4CFznr0DS+7qFXr1c0DvXquWKy+dMu/l8tdT3ZC7kp+HGQed+Db
         m9+1Be5XEUafVhhvyan+nsOywvizmGb3D0SGmWlaL1/uj9qDpBqGrS+WcValJIcf/q/4
         cBS+QQzZkedrURGFEOO+C2HgDXVuBTy5tHXvv5aJ/fJCXmpS+yPV+n118LpELbrJaraR
         Dkdy+f0wiUYrMzLJDAogq5ffCYLmPOTwq6xvDBeg5CkbsUYaBOt6iTISTUwZcdd6uVYt
         I8xmWwBv0hkd9gGRhmwZCgH8W59nmx3xFw5UdpEzmmwPv7fetXF2OBuNLBPID4Br1DK7
         O20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560787; x=1701165587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5d4Ds0rhXmcTPF46DSZlqdSRg4RbFJSILxJbeSUaSV4=;
        b=NC5TtFSwGmBnayGLHiIIrPjpKgbL3Kkg0kBRqIsTCvXc3enPWOa3KIrh3VmTJwrozV
         2qDFmJFd3VnsFHTyuD5HbPjZ+5KPsOI6xl7jA1dNoeHLG7bgGUqR9DLmTY+eQNmhhD0F
         M+W9f/gAUpmUsbJPjPmSkKn7S3luiyt6whLBgbkJRwuPidmjp51XsfiWOXknOWHzDqqo
         yl67AnQCFe4nNafvESPmMyo9TcO6fRInvaNDOzI/OtskNX70Lc56VaKdPMQhp0imgZ76
         5ekSp27GHFgeJRsQ98gORYDaxhPDvqCY2yUcQ67Tl35zmDJZSDXkB1aTXNZ9mKC8I/Cu
         mVAw==
X-Gm-Message-State: AOJu0Yz1agBtQuBKGn0ieJ8QvjeA1FosqZoKnL8yLHcZwaz9bF8jq7f2
	jy7Yr7kmOkr+tnvKDPWTx2E=
X-Google-Smtp-Source: AGHT+IHHtZmZtyzuep8YXNg8hIFWSpcLETd1D1fo9yHbLdwHxHjfhMaLnlNufFjT6FRT1en/zL49/w==
X-Received: by 2002:a17:90b:3144:b0:27d:3439:c141 with SMTP id ip4-20020a17090b314400b0027d3439c141mr7544085pjb.39.1700560786964;
        Tue, 21 Nov 2023 01:59:46 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id c14-20020a170903234e00b001cf68e1c5a1sm2047415plh.4.2023.11.21.01.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 01:59:46 -0800 (PST)
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
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add aosong
Date: Tue, 21 Nov 2023 15:27:57 +0530
Message-ID: <20231121095800.2180870-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.1
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

Changes for v3:
- no updates

v2: https://lore.kernel.org/lkml/20231115125810.1394854-1-anshulusr@gmail.com/

Changes for v2:
- Changed vendor prefix from asair to aosong

v1: https://lore.kernel.org/lkml/20231107173100.62715-1-anshulusr@gmail.com/
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
2.42.1

