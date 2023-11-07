Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0AAC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Nov 2023 17:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF9C421A1;
	Tue,  7 Nov 2023 17:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AF9C421A1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CRg0s6rp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWhaKR5HGDA0; Tue,  7 Nov 2023 17:33:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2B6D94176B;
	Tue,  7 Nov 2023 17:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B6D94176B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A542C0039;
	Tue,  7 Nov 2023 17:33:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75543C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43756613FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43756613FC
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CRg0s6rp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlurqEmqIfFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:25 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71004611B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71004611B4
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1cc53d0030fso47208265ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Nov 2023 09:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699378404; x=1699983204;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGp6FbeEP7POCZwSa0NT2Hip56pwTK9CjaEazRJljNE=;
 b=CRg0s6rpSfv99En5BFnameYYxyWGuMdqlB5jxwOrxAJ2u4GIFWLJRp1BialrIBum+K
 leZ+6s+67rHJTuf4U63u36FxEhuzeZ/Wmrg8AWvNsn9WwVu7f9hGkKALpmycE6Qc5vmY
 jBk4jKo1A3h8fF4jqI09/aYJNRzHYMpgmRWqjFyv+w8cgcIJyXOHoibK6VqYt5nHPwy1
 YhoT4aWPTTsFcbccahBpGVTqIjVs6W/gHysPBnXH138hkAn94hKlesQTp2Lg+8NFqsbV
 QhLZJ/0z35Is8sYJP7mx6BiMUwICU1JbYuRj+GawUXUZnRjp3QM9TYO+7fJA8z7ZbNoz
 utIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699378404; x=1699983204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGp6FbeEP7POCZwSa0NT2Hip56pwTK9CjaEazRJljNE=;
 b=WoDwntjCR390zwVWP1JWj0XOQLt3rtup/M1F4kudP4oLPPCv58jgKcxCqlp1IfNpNT
 TgvffxS2ElFpHcPrDrqAlO27bekxXKqws3qcNX1g+82n1n/vLFz1dfeFIgobNSqaFCOm
 fy/BEDl6c49XfjB78023kU/rhDZOm6hcj40T0k/D7QOITHRCP/dIoNtJFvKX/dx1RWMO
 3arbSIIoWMqLMpk9AtsSbcl9vPqMlzrPeh8wuV1k6YSanCOmxCE6FWp+hKBzVyEs3Un5
 ad3+EaKV1Rl6ILLbn5p0/CcNBUaDI7IQ1ul2se3K+xZ9OEtJqItSTbKz7JKhGfKGoluS
 oTew==
X-Gm-Message-State: AOJu0YzkgqG19IY8rKMCXmyRgXHt/9ka5YucahpeZ5w39feCWhp0vwQx
 RX+bS0elr75B3MHxzLIlWQA=
X-Google-Smtp-Source: AGHT+IFyoTnKAqiGE0RAsKm4+Fdncst5HJn/8IAbSMxXNFVYbS9Z/129XBJLfi3XnKaigy3tNLlVDA==
X-Received: by 2002:a17:903:1ca:b0:1cc:4073:88ad with SMTP id
 e10-20020a17090301ca00b001cc407388admr4217348plh.29.1699378403652; 
 Tue, 07 Nov 2023 09:33:23 -0800 (PST)
Received: from archlinux.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a170902b58d00b001c9db5e2929sm103116pls.93.2023.11.07.09.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 09:33:23 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: trivial-devices: add asair,ags02ma
Date: Tue,  7 Nov 2023 23:00:54 +0530
Message-ID: <20231107173100.62715-2-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107173100.62715-1-anshulusr@gmail.com>
References: <20231107173100.62715-1-anshulusr@gmail.com>
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

Add bindings for Asair AGS02MA TVOC sensor to trivial devices.

The sensor communicates over i2c with the default address 0x1a.
TVOC values can be read in the units of ppb and ug/m^3 at register 0x00.

Datasheet:
  https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
Product-Page:
  http://www.aosong.com/m/en/products-33.html

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index cd58179ae337..9cd67b758a88 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -47,6 +47,8 @@ properties:
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
+            # TVOC (Total Volatile Organic Compounds) i2c sensor
+          - asair,ags02ma
             # i2c serial eeprom (24cxx)
           - at,24c08
             # i2c trusted platform module (TPM)
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
