Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DDB3BB25
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 16:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5JSesnJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 100276106D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 16:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 100276106D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E5JSesnJ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BpXFFQbRJUtE
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 15 Dec 2023 16:25:28 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1536761069
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 16:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1536761069
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d08a924fcfso6549735ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Dec 2023 08:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702657527; x=1703262327; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDqL6HCL3y7lDRDTbr/lo7FN7BFLZEzd5vvB4zRQhig=;
        b=E5JSesnJAzXMkbJCbtSei1ibl+iO/WKh1+w3tQv8umnbszNQFvFZZ9iKk8+foaI+zf
         +DzhWgpEvxVCgwOLLX3UzhFf48RAJt8AjOdv379MG1rYLyOZgxiQ6MpZ21TyHgoo/Upg
         g+Ixi7Gx8tyfWutIOIayfvJbhu0JU9JkeWaO7qe46Ai4TqLO/03l8CrqHFv99M4YxDkO
         dX48vOhfMtmxo6y6qt79waDJkLHt0ErfgPapF7UXvKs0omCBMBfgEx2kdmbEbirRTKgJ
         1807XFLX3JUf/38CwI/b0b5aBDmoD4C5ovwkCO7kNrJ62eDPCYLMvnVcWNiwhFs9zyNB
         tFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702657527; x=1703262327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDqL6HCL3y7lDRDTbr/lo7FN7BFLZEzd5vvB4zRQhig=;
        b=s0zWI2Pfz/YOQemjAjgOZCSQZt558kYtdNgOelvFD+B647lPN43LRUF6oIR/DULD6u
         7nI6FzoDDvTppaiaFADacIji0fA4pHojV4staAKw80ZG3kLe3YIadJMQO/+yOdN1wkvq
         sNNQ9cWO618gTco9FCqC6xjGqmoBmBiRb0dtoWXb4+wfZcTVU4Z8F1++aCUR9itZFAQI
         4gkSV/UqvQi6Tw4dbj0u42P6fDOp9KXiULPQ7GvPuSvB1Q5wsHzzNiFUj9flKVVbCeHz
         cuDrkE3FbxeT0GKY0tNznGsdB/rHmPAv2Wf8JTge3euo7GSSRH/5QzvZtHuKYGgJJW5A
         KxeQ==
X-Gm-Message-State: AOJu0YyY65GubdvgYVCFqBs0euhhUVAjrid7iMkL6tEZ+vVbUInquxP8
	BFhaU3z7/+DJfxk6xekBxAI=
X-Google-Smtp-Source: AGHT+IFUiy1uTHVX+IrL5elmcxSqJ1xdj2AGz7K/ki+zmPEMSFag93XQQOi50O+2ajZwgDl0R2N9zg==
X-Received: by 2002:a17:902:b948:b0:1d0:6ffd:e2eb with SMTP id h8-20020a170902b94800b001d06ffde2ebmr10020334pls.133.1702657527290;
        Fri, 15 Dec 2023 08:25:27 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:581e:798e:871c:98db:5638:a4])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902989000b001bb750189desm14468665plp.255.2023.12.15.08.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 08:25:26 -0800 (PST)
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
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add aosong
Date: Fri, 15 Dec 2023 21:53:09 +0530
Message-ID: <20231215162312.143568-1-anshulusr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aosong Electronic Co., LTD. is a supplier for MEMS sensors such as AHT20
temperature and humidity sensor under the brand name Asair

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v5,4,3:
- no updates

Changes for v2:
- Changed vendor prefix from asair to aosong

Previous versions:
v4: https://lore.kernel.org/lkml/20231125100139.193584-2-anshulusr@gmail.com/
v3: https://lore.kernel.org/lkml/20231121095800.2180870-1-anshulusr@gmail.com/
v2: https://lore.kernel.org/lkml/20231115125810.1394854-1-anshulusr@gmail.com/
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
2.43.0

