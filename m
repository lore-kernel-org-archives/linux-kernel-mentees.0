Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55EE2F0C73
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077019; cv=none; b=H/LiCtzN6tzNwh5GmNjL+aKSG2kM5xugUS4Bh3gPPpWUSojqKE5DzkyxIhWpMEqpcKxa8Qi2yi0lhP48wLRNwLK9LBSjUyk2zbHVaHGfNq+W1Dff0jD6mUb7iIF+ftwC3fyTBFyuThOG9q1hPf3nrxqCSRBtqbVwxx1KVP+p/Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077019; c=relaxed/simple;
	bh=/rTdKk2uoMxb+q/0DRtX1FS+dFKCBJFEKFc1tSBa6tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KcDNGrnAy1Csk1vGZEuZQBSeJmbT3bEqazq7NqraR2pwGiQhDDYB+CeVVVIlbiJX0zMmBul8E7uNIzvTONPno4j8xyxATDeUr2XHA2WwhwIsrVBmbwETLSzQVJ0hdY1enWjtdbEfyqFOx3t1p3zBGACvtb8VyItg6wdg70k2/34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=XtgjwjlE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="XtgjwjlE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b913a76ba9so1419973f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755077015; x=1755681815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV/LyU13FVZD+Ygh9a2dJ4SQHfL+zi8sFF76wcqrPxw=;
        b=XtgjwjlEm6+CJDQjV54f9iaWPFpad9V7utMJCe92bqePNhwkEURHeVJS0YmDE9tfr+
         bC+tn9jvP82nFwvceXSqlFvRf4mZ4bAehyjzEwwE4A/XD6rxWKqBxf6+vmEq3h7w/daz
         ZgnHaFY5rNSVLOJook8RVrhbws6dcdna+zylFunTwnswS5dPKbUQMOTPoWG/bFgW5XmE
         qjkm2G47jZCMX4Fb4Wl7nqoUY8HKhpnwZ5pobH9QxtXxa2vdErolmZsmnfLb2gm4E4QR
         AHDdxINF0U53DL/CkD8ix043verX4eQJoHJ2DDMMeLx4xaDjQ6J/ep4sO/MOepNyjPi/
         CHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755077015; x=1755681815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KV/LyU13FVZD+Ygh9a2dJ4SQHfL+zi8sFF76wcqrPxw=;
        b=ub2MAiMd8s9N4r0RoYaBZL3xpZAK8eRLKkSj4Gymb4ctehFjLGPST3Gq61FWvCjY5C
         UlLOqqi7C2MCbdFq3MDiGL93a/wIjCf4duWOhPFxh2qFzWEgy2IiiQsQ4OTKi3+L5lEe
         WfFdI37pJGn18ZNqM8bS7+ZfJssa4zNG4AMt9iGCAOrazakDuKlrjkjK+4jlaT2OQSyV
         sMhAKXrIFl5k4Osw1c8ZoZ4dvxoiw6Kz8xI56ewodcOtHmDZq1HTa+5CvrzRxuCWE77J
         rdAvPfSzK/QyAr0CFjdyJERrKskhj9D4SDj6J7szT1OoJtcy2TE3HkkAZB8LYqsaIqdE
         Ktqg==
X-Forwarded-Encrypted: i=1; AJvYcCWFoVQjfK9IxdSSksd6vRQngCUFrhC57K8dJAQ9+eGFuvLTf074aW66gF8H9+SfUkKK1QMTefIpYv5MuASD0l6CUXe8gQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6/D9RmWN22kK5RXpIkuRUNzAKe8p+gNkga2ehnHN9PvYcFnNH
	APOMtNMG+1q9bFQ1q0nzUH56j680fjG6siUDSQLuGaVDawm7uMPXIGnb1QL2epnWFM8XUSyc/rJ
	8AE27bug=
X-Gm-Gg: ASbGncuEJzDFby9ftS14mK1G0GuJvCqWnO5TRMnc2FzhC8nlcKCmKAbY0c/fSRqcaUx
	9Zm+Bs21W3x7vdLlBjywZ6YASRUGh6KdyfFfVxsIygtQh1OIHhqlYVtD32A1yZAyBbkRqg3on7b
	4WaVSgCDTRJmpseODl5tCerLjx5quZcP6g1i6wDh50tw5+IN3bujqU1OHvm0rJivH7h3ibi1b+Z
	SyORGXJy/WQFeiXRd5KsDK37fSYzbAo5II+5TXE/ZC0ofyu2L3K8KnL07OHz3GVn94yeSyyf0wc
	ukIi2NCxoF6uxLwYpZMmQ+Ghy7/wIliKDE6lVzPKMXQvvHbD7rdvbU+RX/V1GehljM3jJabRGe1
	yhwHs/JtGTeVcWeE3BD8KizwrLBzf5fit7ANLJLYIM3OgoAHkEw==
X-Google-Smtp-Source: AGHT+IEWxoI/kRzm9XJtVKTQJfagZa2jXeR/JqY3ScAS+RcLcnu42mBz4ZP0ExrShNWcggbJ1f56TQ==
X-Received: by 2002:a05:600c:4e15:b0:456:1923:7549 with SMTP id 5b1f17b1804b1-45a16b73703mr16081835e9.26.1755077015065;
        Wed, 13 Aug 2025 02:23:35 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:d33c:e682:2af6:3c3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm47966077f8f.4.2025.08.13.02.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:23:34 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v3 1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
Date: Wed, 13 Aug 2025 11:22:39 +0200
Message-ID: <20250813092240.180333-2-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
References: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible string for the OrangePi RV2 board [1]. The board
is described as using the Ky X1 SoC, which, based on available downstream
sources and testing, appears to be identical or very closely related to
the SpacemiT K1 SoC [2].

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v3: Improved changelog
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 077b94f10dca..c56b62a6299a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - xunlong,orangepi-rv2
           - const: spacemit,k1
 
 additionalProperties: true
-- 
2.43.0

