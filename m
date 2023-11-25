Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF97BC147
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8xDsvcR"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E8104210A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 10:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8104210A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W8xDsvcR
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id te2opG9br6nN
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 10:03:35 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 45F95420F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 10:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F95420F7
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2854757f0f8so2184637a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 02:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700906614; x=1701511414; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QSDxTyLFtsnYDHG0zEBI3s1d8zvOlEcq91cg6PyUPyY=;
        b=W8xDsvcRp+W2/PtArnfVxJC1FmWS7ONzUdmXR9Ixq+G3lchlXyu8Ni/qfFuSbOpJA9
         PgCgkyhKhZR+fo90/lxIGvwRKzMRXsFUzuYxAtSUdgoa6mmT8G2xnstM7gJ+lQbekkMs
         W9XCjyYYYeuM7ZGni3PhXZvF3yPOCfqzvnj7YeW0Qe1i3xABvpWKMYK48XH+By94lpbv
         upTOkCbc6EgB7/J0ipj9NN0PT5etOJgFc2EzeBoOQIp/Vq+OYXWquED9jx5+Au2zrsNE
         KDnUKvps8DCKgrYUzgJu4qnjDPWyCa1ohH1MEnH4K0CxZ0DG823QniRki0HfgEQPqRc2
         IglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700906614; x=1701511414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSDxTyLFtsnYDHG0zEBI3s1d8zvOlEcq91cg6PyUPyY=;
        b=Cae2oPSpvDs6txhfrw1BvqVhLVTz/G1eNaqPHo376oXnYoUY3rDvcBtluGmvx8mL5+
         FznX1gePRi7FHrUldVIcyO2BMyqZtmHegPkdX30trcfYp8hgyZVYX/MhfeAxR3hyMBgf
         1hfS3tlMUwbilejaTP1PPLb+e/svFBTarqY78GiNwcPhVMSNRZrH3A6lBqonhcDlh4Gd
         9Gx3sNzNsnI2Yv2tUh1GcNNqTXZw0oIPqZKiEogd82x+TqBlEm5Kx9HIgQbH33c7iEtr
         SiayjAraLDgIkALfSRxYxh7MzDJUME3l39eBEN724RYcKX9fRo01NZKMcKBBkyRNkgx/
         /QfA==
X-Gm-Message-State: AOJu0Yx6cKRniT6QHJEeMr7SDXqSng7QZ+eS25Ng3uZ785dIWNwsYn6p
	xT9dUc1MAF3L+7KhZ49a2X0=
X-Google-Smtp-Source: AGHT+IE8P/9A9uFEhLK2eEUUCihHCn1yCc5ffgail4ByFUf22HfJlKgVqAX//mogYWt7YzUIR8PdxA==
X-Received: by 2002:a17:90b:3ec8:b0:285:936a:86b5 with SMTP id rm8-20020a17090b3ec800b00285936a86b5mr3655332pjb.20.1700906614498;
        Sat, 25 Nov 2023 02:03:34 -0800 (PST)
Received: from archlinux.srmist.edu.in ([103.4.222.252])
        by smtp.gmail.com with ESMTPSA id h24-20020a17090adb9800b0028593e9eaadsm2049035pjv.31.2023.11.25.02.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 02:03:34 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add aosong
Date: Sat, 25 Nov 2023 15:31:36 +0530
Message-ID: <20231125100139.193584-1-anshulusr@gmail.com>
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

Changes for v4:
- no updates

v3: https://lore.kernel.org/lkml/20231121095800.2180870-1-anshulusr@gmail.com/

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

