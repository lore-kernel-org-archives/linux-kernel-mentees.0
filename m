Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93708257431
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785112; cv=none; b=jsSElAE2M5Al24MkEns9/uQIjAH7RhO8okJttEWcqePEV6RnQBBR/DMrWm2YDtQSxPOPmIlBTEreRKB8U29YftxPWp7SnIKfJzLAqqvXZQbDGdDPo4Caaqr3HegumZM/48f0M+myOHDPaN71W9/aLcYAC9UQ6D0I5cJLUA6mrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785112; c=relaxed/simple;
	bh=EjjfiB9cBHAXSvDlgStQBwBw5SyzbG3m02xMWWjm2PU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IQiUcXEITTtpFtr0KolFBlsiJ1/MJu+lzb5Sg9AP/9KwwebLykiyR51w7BALkdh4sjblE/GwN/E6SrKM1YiW36cwk1334fMDYHKKTPtFoJPBp2km9TcSF6wT0Un8IUrSoP1fBkGlmWcZOqY+popTEIdkQZb8L7m03XuOMGSVrQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4ebeTbS; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4ebeTbS"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75FB9811DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hD3ge-w2J_8x for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 18:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8F6D811B1
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8F6D811B1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W4ebeTbS
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D8F6D811B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:05:04 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso2437b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 10:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764785104; x=1765389904; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r8aUKLL0U4HpZQYQ2ev6PbF/etF9iGnebdLww9uoN2Q=;
        b=W4ebeTbSLQ70BHT1Ut/1e8D4ZSaIkqFR5H+gwYwUAezQA0yyM1SYj/eXdtAX2BE6ot
         8aOCFFzyRwRu79Weip4DDrYHNc5XdOs5vwplyd19q878xr0mSL9TJ8u4o119BHeJQ4MI
         UlychIPGmMHztnFF1yT6sceoZ6BwTfqsE25V9uC5XmDf+TpM9gUilo6viEpwS9Rqpmbx
         ECk8U9kb7l2AOcZR5cuOhmam5gegbnxlKcKhL0tSTnE7QDm4xVs4SAew4HqsnFecy4sv
         9VXSHhpqvwOMedy7jslX8vOAN6vYq3zdRU/asRpZEeVdMGplaiOLD7AWkWL2bQgWeIe3
         SDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764785104; x=1765389904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8aUKLL0U4HpZQYQ2ev6PbF/etF9iGnebdLww9uoN2Q=;
        b=SObXCZVe0JNG5F08M4F81e0+0sdxYU79BwTotMavClh/NuICr/fOBvcBdBD0ZYPfcT
         Ec06ABu4Xy2m5krF0Y0pQey+zOceUGfob4RTBLrhUzyAOGI1D3nrzG/Z8wiCKkZJ4Oqe
         qtUJwnjO1Trio6v/tIsW77jvLxu929OmbgAk6Uhs8bsJhg0L25227i8RcfQFold4POpZ
         CoO+DR2lkqgoBSw9qAUxEcAmCzmMr1e0iOWQ3AJDTD8nPRZzIJWAz/Pd8bxTCiYLwHrw
         zYQIJsOiu43AMOFX8q+/y696SfhbAoeBItpKaKjLKj8QFsWb2L1QB40K3KTVHDdshs/N
         c2OA==
X-Gm-Message-State: AOJu0YwHJrJyYNrJjMAdQrWxOnC8MOGHmwMqsGa1PH9de/bYyGMFZtTx
	Zqeuu9dHA6uhJ01zgqobaCZoF4bXgkrMGCH9eP4MLnrHOgCA0sFqyi2+exzbJIiP
X-Gm-Gg: ASbGnctXYNOjTtmc7cLw0Qai+SRQn1dGa9vtW3BmQq/M7rb9aGG5zLO+UYt5wjCjrH5
	nXIF8/E9muNFKLo1HYnee6zKYDj7ypyCSh/fBoEecUTE3/2vNydRd3QObbuIlcO4wPIAsJiC0wE
	DQfqPLBAyrQof+hSNVL3aVsUZZo+7vLenl1uKZ9EYp/6pdHnPDdLdVi0qaq87GXPDe2T9kca1br
	ihGPvC+qs6LlWmRVPm44let49ZYAp2gZOrF0/7V71Iq5qvzTvvEmw4TMZHo2MjDRQWl/ZiWAUqh
	+vPxEwx7+pG//Xmxa6q9m+0aH1FEVxMYiifH3wPuaXkTaXS+S814GOQxT/QsM5lch2tzFFm0+Ip
	jxxMsp7xSeYutKDcVi8Qqnlmj4sZ7FZPQ9/jw5c858Z29gel601mlsxBYrn2NHkf0Pq12zuIhOJ
	xfJTo0ZbgOGW+TRqhhKhEVG7/npqR8pg==
X-Google-Smtp-Source: AGHT+IFEixLGV3A8+6jlL7a/8Uv2OMwWRqulw8eWOs24wopjQE6qdYvBYZM9hQQi+wS8cPkdVKqjPA==
X-Received: by 2002:a05:6a20:3944:b0:342:1265:158f with SMTP id adf61e73a8af0-3640387a27bmr191416637.51.1764785103491;
        Wed, 03 Dec 2025 10:05:03 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b68367sm21135011b3a.12.2025.12.03.10.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:05:03 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: remoteproc: Fix dead link to Keystone DSP GPIO binding
Date: Wed,  3 Dec 2025 23:33:37 +0530
Message-Id: <20251203180337.50831-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old text binding 'gpio-dsp-keystone.txt' was replaced by a DT schema in
commit aff0a1701b020c8e6b172f28828fd4f3e6eed41a
("dt-bindings: gpio: Convert ti,keystone-dsp-gpio to DT schema").

Update the reference to point to the new file.

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 .../devicetree/bindings/remoteproc/ti,keystone-rproc.txt        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
index 463a97c11eff..91f0a3b0c0b2 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
@@ -66,7 +66,7 @@ The following are the mandatory properties:
 - kick-gpios: 		Should specify the gpio device needed for the virtio IPC
 			stack. This will be used to interrupt the remote processor.
 			The gpio device to be used is as per the bindings in,
-			Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
+			Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml
 
 SoC-specific Required properties:
 ---------------------------------
-- 
2.34.1

