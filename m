Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9749C242909
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 12:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400261; cv=none; b=d/9Vo8SVedarNzc+bKMcM+A8WgH8dGoG6ja5JW0bH7lQkMOSR0RFbVPqs+r+4vYF3tX3iHU58xOwrQk3GXoW2anKfzpRC4vb2qX8Px2pXzPiVn9XkpEcpWis99bQM5cQALSYSgoIKlUD0mW98hgYrf0BP1wFVsOW82FgO7vO7Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400261; c=relaxed/simple;
	bh=+FSC98TIvnpgQW12nqD/3kXRZ0Fs9oV3gTLvM68micU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WEJPmkM8gjn/hdm36KmEBZZIX7rIUIXqoOzu99tBDwBqpNfReCldCxRpZJiCyZCKkDtKJX34TDvjFn9re4gz+vTN0raVBqQ8bw8vrnoxsTllvBKI9sqonBIP5bvPfBcTl3jMTf10yC9ggl6A5VRo6sIpo0tJDfeDrsIAwqxSh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS8P/In/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS8P/In/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso12292165e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 05:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747400258; x=1748005058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VW89Tj8c9PUVGNCzuX2ZlyTNAUa8vPwg+B5bpWF7mn4=;
        b=CS8P/In/Y2YjdaWFSci/5t+rIAMcaYy5wAFrnGytWYr4gCEB8Y9lIIMfLOgxRx1G+t
         sUbhHROTu9RyZrDJh1wvYu7p1upUvPZ1cw13MpB1BXu9uDk2uQj2r8B05iyzJDaw7PSz
         Mh33qYqhCei5cl57mcShNuDyhSyMLZOH9FIUNwL8V8GXH69Wf9H+6qvyVTGFvqpm0N53
         Pd8GtySQfkkrjPOfPm4AEK5ufmfkUeV0GHBbRX96c47tB97tENcjd875aj7puZd+5TAJ
         QzovC9B3jGXKNFjNoN5VnFKwL6y8kA8AgruFMJMT8vfIgLcfBDW7rhIwS8gtfl29dlK4
         ZZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747400258; x=1748005058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VW89Tj8c9PUVGNCzuX2ZlyTNAUa8vPwg+B5bpWF7mn4=;
        b=WcNF5F5u0KvSwViMiZaDrapE3REyw0jIvWaYNygcyFCx5M0wqKik2qZMTQVRLxLl8a
         qfk5RbdqVjYpuliHXCECq1ER6QmmVgPtgsarFVA+LDydkzpBgXV8g0ZZTy6RmLe4aXgM
         hac5Ena9VPmZcyurHZMCz1dA2UxJiNVPAkue7WIkVpzwvWun9MxmRBREfrlw7cnJPkWK
         I/3F+mw4gIHpxF61cMBRtYnigE2DEpw4Jmn2Q4rOlLSJTOI7EUfh4IJMioVgXHYcUMNH
         WmRh03x3JVfQ6QHloUn3CIo/fvk5GBQFK9/gPa/pc9K/t+NbgJRLVdvCPP92j34bXJ5E
         3VZg==
X-Gm-Message-State: AOJu0YyMvBvQEZ40GKYEmxTb4yIf538z52rs8uBMtzmYlZdZKFJjwze3
	CKyptmfp4TsczExmUcqhmRm2OMO7F/p8QpiXnfcJ85cxojC/XqJy8cKCKjlt2/payAjf60jT
X-Gm-Gg: ASbGncsPz2ZOgkLlw/kXpij2yLug3lt4/kBqtdOji6XGtujDVaxA2nxNN+3pC/QCIAO
	mgeSWCvKwrY106H/3vGH0mDNS5/Mo3o9nQAHlPCbhdHdVHv/DQd9lvWoshVPTGnGlrfPEt0EIA6
	frumtKeAUK931FvXB6oXOKJMXXDHvf+pIXPKZYLZjnrpuic5PN17GVk0vJC69CIRLw6QW9T02II
	/Jv59g8DjacMY9GZ6EmGaa99lB/6y3zzKO+CzCwAhwqHS9zc+/IRNouVkauKJ66Hc/efOHwaX28
	5ip6A+a1AMBWQPDs4muJTP9DL4UdJskTLx2Oc10pIqz+QQmzhtmxVwtzFTvAO3YxDZKnXBzbSpj
	nSETmJ4vqrGagS9SN6UzbajI6cj82pX4nji1kigbUyg8e
X-Google-Smtp-Source: AGHT+IG0G1UCWDav1n+DgzbFKo/1bZ6LmsukOQf7dpPE+qHxbbihNA8ofnaXhsPLIKr+h/EAOWcePg==
X-Received: by 2002:a05:6000:1881:b0:3a1:f635:1136 with SMTP id ffacd0b85a97d-3a35fead113mr2208312f8f.28.1747400257319;
        Fri, 16 May 2025 05:57:37 -0700 (PDT)
Received: from localhost.localdomain (host86-152-218-15.range86-152.btcentralplus.com. [86.152.218.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d119sm2777040f8f.92.2025.05.16.05.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 05:57:36 -0700 (PDT)
From: Thomas Thelen <tommythelen@gmail.com>
To: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Thelen <tommythelen@gmail.com>
Subject: [PATCH] Fix spelling error for 'Celsius'
Date: Fri, 16 May 2025 05:56:12 -0700
Message-ID: <20250516125733.5778-1-tommythelen@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Thomas Thelen <tommythelen@gmail.com>
---
 .../devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
index 19bb1f324183..f28de8cd983a 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
@@ -160,7 +160,7 @@ properties:
       SOCTHERM hardware will assert the thermal trigger signal to the Power
       Management IC, which can be configured to reset or shutdown the device.
       It is an array of pairs where each pair represents a tsensor ID followed
-      by a temperature in milli Celcius. In the absence of this property the
+      by a temperature in milli Celsius. In the absence of this property the
       critical trip point will be used for thermtrip temperature.
 
       Note:
-- 
2.48.1

