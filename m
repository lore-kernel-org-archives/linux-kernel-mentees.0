Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8C32F740
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781708; cv=none; b=rKjm9SwZKBIGs3aG1c1cM/Q+1ZJ58IcDgjGuKDe11abfjtcWFlx509ucPfh9SzyDT47qe2nZJ/iT0s8n93L/i8k2HqjBS9qia63hdP1MoTAJcig0g84m3vVz5PClORopfSf2q79rOBcqXgJQRC6qCgCzsB7bXgcJO+sTAkzLN4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781708; c=relaxed/simple;
	bh=xXnEx3PQpfAGB++vb471mTrg+QrHjgJwqcNS6ZzHczI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kaCM2FFkLVUHzpBd7Zfw3kXfvBOLM69poaNrvHnXKCLg1XrNiGZCwFvfsU52WP8NpiKHwhzIq0F40shVmFm2cVI578qyohiH4TJJewM2gSyYrxAHeurCw3wxmCma715eatAXNe9d4p0CHsk7yOUTzuNMowPH2OT4aUNdIDabzUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9BvQngB; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9BvQngB"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84E9560A79
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XEC4C6OZrI3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 17:08:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B487660A6E
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B487660A6E
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A9BvQngB
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B487660A6E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:08:25 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3434700be69so9738723a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 09:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764781704; x=1765386504; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pBJFyu68J6Bp7h4JVdx9Vv54SkiKMXxF2cUFb5Z/EiQ=;
        b=A9BvQngBUuVDcq0ia1NnPmt2L0iRCscfGP3KoeovctWFLUommTARvaTY0pQA4nxeUv
         df2l23Jh0xJLnyeifgiWKtm5MJ2EcrurZpBorFQ8o51Vrm/pYzffKZxK/NniRfaQmglV
         CKs+S/YgzTctX9tPiYsfK+vFmhtVgKTXQj6PjLwAjEcpv0mqAlS0twgfiDHP8+YcUnX2
         a6YObgfDfCqn1Q8SlUm6wnPeB7srAL8aQybmp65CLQ/bNUkVvrspmrS0pcisvtcpwZOv
         IVZNRAXLykYswMyWfyv+xFtf7V6T5f4sEIBQaAHM7+x7rLM6hKtjEkz6Hxeo/v4Z70Y1
         0YHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764781704; x=1765386504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBJFyu68J6Bp7h4JVdx9Vv54SkiKMXxF2cUFb5Z/EiQ=;
        b=XzBZJBgluIvuFcf+LWzdf6/iB1MZiBRIsonWAA4SL27Qg9Ni7IDztvDBSSTmI7UyY9
         qGgpjEiwvsKJo7a8D1jRR0AMtwvTLB8z2qKJQJQC0SIb6ns/zrMVHRJhNHwIYMvSDH+y
         i/8rc8o1Pi1+pDcKvd0NSvKTy/yzvIU7Ns4q5EKLwMXYPBy9UgvEiZqqzEWQTZJ4/s6B
         DMvGk1pB+x0SOCMgVvdVZJtoD6bvCQtH1zXs4ZHJMh+HspRb/VoYo9RAqxHJwAlga9K1
         XAhZrDqWIxW0g6QTJk+jyWse46/lMur7YOlu1oPHhhkCM5ms+nxMx1asPciEtubvzF7+
         DD7g==
X-Gm-Message-State: AOJu0YzwwFGIII25sSleb1t5vFruwtw+yWTVmQsN/0PPthRIhgqWUWeT
	QUcikWiHii4mk8ZwwM7cD2mE2fjHczY9NT2OJlxB56CbxMw01QdU8+u4Uz6Oxux7
X-Gm-Gg: ASbGncv992/tZ0waSqND3BX1Opca3tgU4tX2yogCsgU5q49dnQsHT0FrKPsJXJf953Y
	MDRFhHssSN3ePVo9bcKpX69YupGoLZPjzV97pgJxtHfTuxfg4p3E6+8g4Dmre0ourTgD2k4er2a
	Shhvy+BwLWMQR5WBYsMk+FLms6lmpIM3Wu8Tnnnnc7dFhLx021jFRKY0pm6GmIxublBPP+H79K4
	RjhwYQi4el0XYziCRA5N8QepAB5DlmS2SpbtdxNN+y7H353hei+MfhV1LBPqlKtHKzkgHSybeNf
	24+jcvzNv6Se6TnAaELlLzROABSazuTgcTWmvN/SG9VstWGbtHRhMmWB+CToI1YhFXCLOTe61sh
	sa21hx/G6zdsUBQe14COsitKYNRNvlAMKve7N93lxAD6KyXlDbqE4dzEsjd+29hlHIcIPp/4nVg
	QZcSpGkO8NcXjulqILoxU=
X-Google-Smtp-Source: AGHT+IEOFPrAaqKqsqkA6fVb5DGAdtJMcHhJEEPr2VDB+dUBMUwJgpBspXc6JakMLmnmqpY4L4OeTg==
X-Received: by 2002:a17:90b:5483:b0:341:194:5e82 with SMTP id 98e67ed59e1d1-34912844db6mr3091094a91.30.1764781702242;
        Wed, 03 Dec 2025 09:08:22 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-349212be927sm2144835a91.4.2025.12.03.09.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:08:21 -0800 (PST)
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
Subject: [PATCH] Documentation: remoteproc: fix deadlink
Date: Wed,  3 Dec 2025 22:37:02 +0530
Message-Id: <20251203170702.42769-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding file 'gpio-dsp-keystone.txt' has been converted to a DT schema.
The current binding is located at:

    Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml

This change was made in https://lore.kernel.org/all/20250714202850.3011952-1-robh@kernel.org/
and merged in aff0a1701b020c8e6b172f28828fd4f3e6eed41a

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

