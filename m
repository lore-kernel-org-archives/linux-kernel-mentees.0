Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584CB182B4
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  3 Feb 2025 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620215; cv=none; b=pm/mHDk8oWy7pX3ivocjWit3IeHW4KEuB+c5JNecWcbWjW8TYbUzfXfaf/nTyKr2GNoqe3+ZGNdHe+WeCJmOwCbJ/SmN47T8EzqlclaA1riVzbRXhxE49dGXoDh9zxBrHJS/BDG2o/8UbPh00+inaJ6t0y/kaX7hlRJuGptYXRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620215; c=relaxed/simple;
	bh=eQkf/AWZN3jzhqGCXubTSBoFaaW6MkWDOMXPv8rUKBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iy+1EnVJqKj/dIv/KgqjAxC0/6ZAtkiMZ1ZHNRHLANbBmIZeJVw7gMR7i9n91vBsuyMu/41sEVTbNXJjYG/4EstygHG08YH2IQ879foQyNBNj60Y3f4fjSw/NL1Atk5iUNM1/1CQSWQDyhWAN41rrFt89SQAj8E6gs82njaRkhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGEAqgLF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGEAqgLF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2156e078563so71888745ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 03 Feb 2025 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738620213; x=1739225013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JE3w8CBwpnkwJfGW6YGEzRWKwSkPHA+eGHDpFXNygB0=;
        b=NGEAqgLFYfOp5vHYIQiq1Tn+u3UBgiLfR5fqej0UaxvxCx52oRP4fNX/hANsMrVJ4M
         /gw5lPWTeKSuw4hpM4nUkGfQ1pijEFNqbTzvlAU+3hDrqSDPaz9uS1oUFzCHjomLOOyk
         jtWAB0ZLZAvDjTkhX/E0ZpB5vVdeWotBR07Gykce6YQga/ePn5/UZUPTceNE8HurzU4O
         llDOpRSMafmmal0XrHxaQLIn2tsgL4gAc+P1yvpc7e/3QeUjbDLMArS/71W06h98PGhg
         v8yexbfcDVYD7AlIDEl2Oe9s1WXkS1SKLjABH5pWwH8FIwVUVPMEGOpirzRpb97sTrNx
         ZvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738620213; x=1739225013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JE3w8CBwpnkwJfGW6YGEzRWKwSkPHA+eGHDpFXNygB0=;
        b=BA91lbD6KdUD6bheqrzuEhQx24vArQpJ4cxGF7wxxQpM4q27IWlNElZJSK/K1fRYdf
         ZFLVxA/lcvMgzSWz/P/AnP1qDioBs+exEOn/ZhlDtKa7KC133uM4eX2GQnJClPJqFAZb
         /QDUtTvvuOw/3snqGeWt07xoP0BdardvGjy2ZAbpGp8SbZrd8+zdcxpohhFnfMgSgQu5
         t+7XPdVO4LDdrMLrB3j1WFS75xG4gMg80IPiy3Ws0aP0deU1JzG1IOGev+A4yTzhMLec
         U6Zjlw/DApZogmDQP1lpwh/UU95ejMvge+MCtUqoMUjJFJERQCxRMGn+PvPon/FFnfY+
         YCtg==
X-Forwarded-Encrypted: i=1; AJvYcCXpG5nsm+rCplWcI5tuzglOQbv8vGWAR2haTlN6R1tpaqmuKHDHY3t2u1Q0fQ9DQlwLQ7P2/sVPY64xhx/LUGWK38uR2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8PwST5Y8QPUaaPu/oJ/B2nJ/yyMktHCASST5PdyYOPB08gTu1
	b8VyNAgUIg9rUOuuJYPgFH0VUoecKWOefZWgDtu3ekugnm16KctY
X-Gm-Gg: ASbGncs8ew1eDe19mlR2UkrG48UUMB5pOWgf/ueBfiS5p5XkO0JM1ry38Hm8WX+r7hu
	5uWduKz/H9TCJgZAQ5Sg9SXX/OVQ16zL6EsydumvW9ZgmyzveIJEFzAmPfExFYdVsCWj9sSzL2W
	4VcVDnWak7OEBmqoGESrch/gHuoJrW4zPrPl6jCrfd+zFooyqsvfK2G/OtLizbtOJGM4hc6TQN1
	W+ujurs/FCJRYockydNCjwqOfNX1uf5gqVezV2chjvsMnK+7Znl/RH1Ov8YOkC5yiswzE0Yjmkc
	bntq6jefSvUOP9kss/Ue22kPTKyi8VywuDZM
X-Google-Smtp-Source: AGHT+IHe6FsR3L8EPqDxhFZj159t6h+b0jL85Yxblu8f7CFj23++P7uPXtt9a6hYivFEpLpcpCMBRw==
X-Received: by 2002:a17:902:cec2:b0:216:4cc2:b1e0 with SMTP id d9443c01a7336-21dd7c63b82mr352514925ad.20.1738620213476;
        Mon, 03 Feb 2025 14:03:33 -0800 (PST)
Received: from localhost.localdomain ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ec091sm81837245ad.112.2025.02.03.14.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:03:32 -0800 (PST)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Subject: [PATCH] drivers/base/bus.c: fix spelling of "subsystem"
Date: Tue,  4 Feb 2025 03:33:09 +0530
Message-ID: <20250203220312.1052986-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling, "subystem" -> "subsystem"

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 drivers/base/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 6b9e65a42cd2..5ea3b03af9ba 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -1291,7 +1291,7 @@ EXPORT_SYMBOL_GPL(subsys_system_register);
  * @groups: default attributes for the root device
  *
  * All 'virtual' subsystems have a /sys/devices/system/<name> root device
- * with the name of the subystem.  The root device can carry subsystem-wide
+ * with the name of the subsystem.  The root device can carry subsystem-wide
  * attributes.  All registered devices are below this single root device.
  * There's no restriction on device naming.  This is for kernel software
  * constructs which need sysfs interface.
-- 
2.47.1

