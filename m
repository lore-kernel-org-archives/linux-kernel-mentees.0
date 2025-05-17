Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2DF2A1AA
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 02:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447583; cv=none; b=er4Xc3gyjBdUCasf/0vtlBN4IV+3bj4fFiWx+7KRnu4ZS/lMfc0TQ24j+8sP4OHndUH0ur8iaWpYQPflU04ye8JT4jF8EoOHJ0kpcl7h4hv/NcLIxmdJK1LwLxEI689TsZ8ZOq6odoXIGYnZav/gutbZn1bPlPNSh7Befy7zrD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447583; c=relaxed/simple;
	bh=2qHvh4pIm6qldHk5sjMMLAC004kNNTi8X3pMpMlPwKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cAwt7/FpR23IYbA0Emj8z22lsypYBboOIUv0BFM4SUoLe+gb7WU2MRHx6q7eGni8Gt1QnjIFkmC/6JV+EmwAkA2TahVpTLGj8LTKaV1z8GA98Gd6X4CoQBWtzdR4pFqMBWKjXxiy0ucfdlFz5cdHhcsUBnZs9co+gbSDp/YJ3CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzZ5vuwg; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzZ5vuwg"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f54e4f2989so59425356d6.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 19:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747447580; x=1748052380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BKXLeL3ukBspnW2IUVVrIXJnVabhkRXsrkb89rHps2U=;
        b=CzZ5vuwgtH93wx2lU/0tlqPqI67Z+/XZvZsnpf3fEbtFbou/B2E+4WDS1sIgtm9S8z
         vUvCgZirKK1VrAYJq+pXe0jT89RLKUAmWeydTWG4AKkKcWrXdPyrUBdH8815bnCDXjzF
         pIV0CNQpPh9F5dABFVIFjQLYgVMELzs/rsXamN+tVVZ/7G9esZ1h/gbiTY2a+jKVfWxM
         tWYgeh6nUvkLHWwVqPq7WbAWY89TiypXjS71CiYZJlkz4A2RVQo7ezceCWvIHaRqybsm
         0xpnuiLk+4yC+QfCq0u2t9toU+q2c/0sSIuzBAV/JyMf1P+qSs6/aiigi1ZtFrShE3Ug
         fR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747447580; x=1748052380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKXLeL3ukBspnW2IUVVrIXJnVabhkRXsrkb89rHps2U=;
        b=IfFap+KiMuWaX6VMN6SIs6Hp8Qw2xvYJnkkWR9DrM+D6sz1RkWYOri4WDttmoeFoCT
         ki4ASLVyBCnerPPDPffwOqL8SVImSAqEkbs0bow558ojIWid6jlG5x0Az8LSstEPB3Yd
         vT7+Lo+1F12Lmr+On7J6fhIVsWwPnEPzgtt/l7Zzg9JsvwedeoU23bRRjW6EVrwZFo28
         DJOZBhTBicbIOn9ZisWfhvUSOEll4Xl3resk/o3kZLrYh0UAW29qGy7/d+t998/xCVxc
         wp9XcxEONo1PXedFL7L1wyFtMT4eAq3yeDiJkSP41ggqvImp5YHdhquiMdlFyutdOVqc
         pKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtSB0Zw77ipP+hm0NqZ13Qgc5niiCR+5HtLFw58GBAoOyYD+6VDah6oNXIz8WSVbkwoFBzX6Gu68N0TJGSjMqTe6LwPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzvq7KOd3Z0CfBk1Pv69Ib+uc8rxSx1NyGaAyJOAAXlHxsAHt9
	1jmO51pp8ebF+8AFnBDx1a5BcwTDJA7nIg72YQ4dSYMDlfBgfPBw8p4=
X-Gm-Gg: ASbGncvbjYIOInK21KmitfOl2B2dRpdQ9DooSAxeFDGrvAkLWFLrnZwGS5vAUkILP1N
	+5ub0H4xRgfgC4RAuyKeVvMzEXFTkNXatcOMI+khrNaCxeHaILaOJoyIpq6chckWmTLKzrt8ZsA
	lIMkRvcU8o1pGeXVUHkcf8VNSkkTOCU8tm5dIj+pyarzPPkoU09NzZk1O64GjmpSApVE8d2kvS7
	wpF4zcwWbJePGRtnO9t5to3iPr/JE4rkaXj8VXcn69ZnD2O8S5oYDar9LIG4BBd7ujxFkbHnEgL
	QF0ekUdEiN0q/eHRW7+htNxZ47V2QKNcf7XumCjlv3c9o0Rn18lvq0Ex2Y9tJKNMXT6TvBJ0MH2
	Z
X-Google-Smtp-Source: AGHT+IGpr4M6tPFJTIRklSzJoum9VgP6uUrsrUv4SQX78ySuBkpTAW8J4v1g4DGVFtzUXC4O5TsENg==
X-Received: by 2002:a05:6214:2681:b0:6e8:9021:9090 with SMTP id 6a1803df08f44-6f8b2c9d22fmr78053266d6.26.1747447579646;
        Fri, 16 May 2025 19:06:19 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:224f:4011:50ae:ea20:4b60:8f04])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0979851sm19250876d6.97.2025.05.16.19.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 19:06:19 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: heiko@sntech.de,
	briannorris@chromium.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 1/1] Fixing a minor typo in YAML document
Date: Sat, 17 May 2025 04:05:52 +0200
Message-Id: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A small typo in the rockchip,rk3399 YAML document ;
"less then" should become: "less than"

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 .../bindings/memory-controllers/rockchip,rk3399-dmc.yaml    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/rockchip,rk3399-dmc.yaml b/Documentation/devicetree/bindings/memory-controllers/rockchip,rk3399-dmc.yaml
index 1f58ee99b..1a96c743e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/rockchip,rk3399-dmc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/rockchip,rk3399-dmc.yaml
@@ -128,7 +128,7 @@ properties:
     minimum: 1000000  # In case anyone thought this was MHz.
     description:
       When the DRAM type is DDR3, this parameter defines the ODT disable
-      frequency in Hz. When the DDR frequency is less then ddr3_odt_dis_freq,
+      frequency in Hz. When the DDR frequency is less than ddr3_odt_dis_freq,
       the ODT on the DRAM side and controller side are both disabled.
 
   rockchip,ddr3_drv:
@@ -176,7 +176,7 @@ properties:
     minimum: 1000000  # In case anyone thought this was MHz.
     description:
       When the DRAM type is LPDDR3, this parameter defines then ODT disable
-      frequency in Hz. When DDR frequency is less then ddr3_odt_dis_freq, the
+      frequency in Hz. When DDR frequency is less than ddr3_odt_dis_freq, the
       ODT on the DRAM side and controller side are both disabled.
 
   rockchip,lpddr3_drv:
@@ -223,7 +223,7 @@ properties:
     minimum: 1000000  # In case anyone thought this was MHz.
     description:
       When the DRAM type is LPDDR4, this parameter defines the ODT disable
-      frequency in Hz. When the DDR frequency is less then ddr3_odt_dis_freq,
+      frequency in Hz. When the DDR frequency is less than ddr3_odt_dis_freq,
       the ODT on the DRAM side and controller side are both disabled.
 
   rockchip,lpddr4_drv:
-- 
2.39.5

