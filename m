Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43F527B50F
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Nov 2025 06:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762583552; cv=none; b=QOfLWiwXi5TdlRpBSR91xMadyb8hjVhqMdLJitvqN5CZYVxOSUCF17gnKddAPLEwjyrwhvNInkR18A6UQpx7rfp1XdBXD61a8ObPuRX2SJQSTXsDJcyk0l2tqbWsWkEEU5a6oVsb4Q9ZRjQ/n9z/dsfzatgkWbBbIIpeG97AZRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762583552; c=relaxed/simple;
	bh=jvhC2lR8nByGDVs4vKZHsLg3Cys5Kb+V8qSzQTSD0gY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rE/ZgZvm5Fy3BjFFmSVioOPCt1Gsgs+267JH3bIQ1IkkNfj+MkbNv55+csCn2YdAwVPARutueK/+kVI8YmSRxGgWVHerRV3NuNzFYuizOHrSputuXWdu6QWbJHLgbWPEUljIS8uvm6wa/pEiokDihjd+oOH90uvfhEvXfH50Cjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S13Se8V5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S13Se8V5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4710665e7deso6674535e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Nov 2025 22:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762583549; x=1763188349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZXbx0Pm3o5USAhmQ+ef+lR3wziCD+RuaTHOuJKX2OE=;
        b=S13Se8V5jcAPNoJcCPRtHNsVXXYDCf/5QjfB4jEC7WEe/pCUTVe7JY/kR4aU/Sw8Es
         0geIslulsOeIoE3EV8cmipY8ads5Pv3d8/eHqJcAYsdvCukl/jDGOVChkjclN0kkwiZp
         yoZeMo8q7exsYLuWp3mEYcIX5hD0auJfzmMvLkOadRcnyQZd+dPC6nzSNeH401INaAvb
         Um6aWY/HTtGSOx5XZyNtL9X4188RNOHmGhzftHSkGtEzpkAGlLKw4u3GylJOLVocxxoP
         bqIkqbjg0/i39RimbA58xLQ1z2troTCPXZ6acLOFb2qdjXO8BqBUvGz2JIVLLAWtmhzQ
         cKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762583549; x=1763188349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZXbx0Pm3o5USAhmQ+ef+lR3wziCD+RuaTHOuJKX2OE=;
        b=nrlpfW6y8MXUvRUR/10Q9RKavgtfoQIdn7DnEeMnjUD3xjyBHUCr7lq21TeKfWKfOH
         c08vSZOEwCU70/KrIjjOiBYtism9pJ608xOZxKUp2FCuZuT2/H4KdtMxRFFZ1sD2BEfD
         15atXlfASPRWdOKzjemQqhl/mfgboxcgEgurIn3QmGcaaMQ9dZAE6qHLQPGkYgT/saNO
         jfZ9e7GSpQ6l6lkHGc8XtMrvU9z3ju8VljabREV5wvE5YtYXr5bQHQTjIkRCF6FA2n5F
         phtZHlRvNbXIVUffX8wD7EuhOImoMjpb4T9oIKfeGqMkEOuojtSxghd+IKlGhydjhoa2
         lBAA==
X-Forwarded-Encrypted: i=1; AJvYcCWJeF9ZOLdxgP8dfu4jbMhOyZiTcc5hA27gYVGUovBhu0AL1lbHXT6xT2IGGpy3zBb9ZxK2ILtDsAwkvz8X9vPDd1XD2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyG6C2ZX9skgFpUkMHp1TCtH/n7raSrCGCq4Y51tGuAdSmb+e7x
	wRmnGDoja1cPD/6h6XOdwYTxbzZH+Z8yaT5MWIFdWy5id5uYrIKq3ENAXD3DJlt5
X-Gm-Gg: ASbGncuSdKyqLpi6ohYQOmZyOQXPHYxRzS5tZBGvObPzzxsznrLwDvMFn89B6AF4NQG
	NWIALRNcb4yyS/s8XxuoLrg3mtV/invatrPkM3SIsAvQnKOY9IPV4iCe11kbA1kw7EnPP7DysJf
	NV+R6FHklg1vtnpaorpnFDFv8cdw1IiDB1W1kNfcSPOre3P91N0G/BI/cREhI/26pIohokNzPkv
	e6gSH9+xLeUODbOCFXwf86sFuJu5cB/ZYG5qMFvlKuD0AVcKvxy7xpDz7ZXwx+7OWfWmlW0IsO4
	R7rs1RXtRWibBrvA1oy3TLUo715Uyyep44rpYZrz7eMOX1dj9z+/QjKomdIu8TErefGvVpTG6W6
	1K59XG/m0KFDszk1v0cYXhn7SzhcbaMFEkkLg7ed5JoyqmUYBDXMLG3qzLKhwiCQKQCbr0SAO
X-Google-Smtp-Source: AGHT+IFTag1jpZGPvIP6mbTkBpcQrZLk+xfLiNvvxeilGJXEuapETNQO/3imuMjYbH8fw8G2ifcwOg==
X-Received: by 2002:a05:600c:524a:b0:477:76b0:1e73 with SMTP id 5b1f17b1804b1-47776b01f65mr1356505e9.41.1762583548733;
        Fri, 07 Nov 2025 22:32:28 -0800 (PST)
Received: from pc.. ([105.163.158.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm10715849f8f.41.2025.11.07.22.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 22:32:26 -0800 (PST)
From: Erick Karanja <karanja99erick@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vivek Pernamitta <quic_vpernami@quicinc.com>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] bus: arm-cci: Fix device node reference leak in cci_probe_ports()
Date: Sat,  8 Nov 2025 09:32:19 +0300
Message-ID: <20251108063219.550810-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although the reference to the  child node cp is
assigned later in the iteration, when an early break
occurs, the reference to child node needs to be
released.

Fixes: ed69bdd8fd9b2 ("drivers: bus: add ARM CCI support")
Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/bus/arm-cci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index b8184a903583..1f84a5528073 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -461,8 +461,10 @@ static int cci_probe_ports(struct device_node *np)
 
 		i = nb_ace + nb_ace_lite;
 
-		if (i >= nb_cci_ports)
+		if (i >= nb_cci_ports) {
+			of_node_put(cp);
 			break;
+		}
 
 		if (of_property_read_string(cp, "interface-type",
 					&match_str)) {
-- 
2.43.0

