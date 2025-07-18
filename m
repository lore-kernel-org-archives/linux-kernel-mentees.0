Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BE5292B4F
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828270; cv=none; b=hZ9YNG4yUmqbKWGXu6nn9uwFdTZvzeL9nX00oAqC5J49Pp8x4mkb0Cbl6yAja5m1qykmo4stal/5e8a3/QdwcssPbxxZNTHhiekZZrjWCCqhlbcMj1l3Ib4u+PaAMGc10ce4odZ5rJqGH9p1b6SNXH8/vNuCCENaMnwX4j7Q1I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828270; c=relaxed/simple;
	bh=Uoj/2NsPxaTTI2japwMQ43nh93mfeyzRyN0+brvXZjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDsZgJH1ofnAjtpe3j50BFOxGMdcetmKWMSoA1vvoUVGz5rJuCGga9QSr8CerG/1Yb5j2ZKPFrlEZqYhGfpM9w17Td7LA2w5DchiVnmw9OJ6ferr679UIjEnQWksf/fKI1aC7eIjxnbbL7w9o1HNGtCCuYnK061hn8nL5D5j/XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=YQz5259n; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="YQz5259n"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso1469201f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752828267; x=1753433067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIjJ267yEtDnmiN+Y1fTBADY4HhOVJqHNJYRhatCK9Q=;
        b=YQz5259nuPB6WEn1h30T5lG7EExwLx0tRpmuVSvCtp0Lybg36fY6G0c0Uc+B5UjBNp
         twK1aKwExRgJDDCctZdly/ZRy1Y1Pk2LRwG29DT6V/QMFqUuarsrI6LSF1lBHsIdO+o5
         WpolcF+oJBWhU8KaG4mEvmqfEanxf6TSdzbA8qigo5dXJwIesb+spNPwYbGRK06Am/Ql
         nrtcJACsDTpbJgtbfxE9Rc3LhQtnxnXNn9V5J2dJ4DqbTVnlZ8+6y5Xcdg/BUUeGPN/8
         n3O1Y0skIKohgNGVDfDdp9EzPznJ0KQ7wWREgX9TSWiKiJcUuVIUX2dhJ1KNWRG3Ra0G
         JQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828267; x=1753433067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIjJ267yEtDnmiN+Y1fTBADY4HhOVJqHNJYRhatCK9Q=;
        b=qJb+yxf5IRvvya2jAc5rXSJyNioHoIfM16kiHrkYh/s1h3jfwmbV68dDmwwJR8J9Bx
         bb5ZLz6KbuZjymMunPiRz76q9/kHxzJy0nOmGzXvQ4nw4Q882kwJ1rc1ngxyRlpQQAvV
         nrW00uMn6PxxY6TyulBt2abHvqp9yWy90RNYRq6YejemfSMIdrTqemUMyHk23hHUoaWB
         GN4OxHfmkrkHde7zBn/vhKFlWK0q58lOj5tzqj7BdKFnyP/hoqS2er9+4nYZQgFlqOuM
         IW3COA8epS63CUVaDNS5rAUBHTSl0CZDhT5edSnJfG/UrsHc+a+z5YqAui53kYDa1Kxm
         jEfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQY2Szz414CrdcgBy7LDMLtoM4uS9DmvVoPdV0yzZ7G0ozUCM9G79QF+aGB1atpF89e3gcO01+RBQgzWkm4EqxqNyl7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmtLjqBSQdzfdX+em2dKggcXtEm/SnNVP8JKQvLn4jXiKpbCiL
	IVck9JouHKdQxOc/3qujoyHEUKIGXKpiz6uHOE/qw50FyhBZQenOeJ6hA1zqx0BQab4=
X-Gm-Gg: ASbGncthOj9VB+915JqwO68wNcftQmb+ZmOABg1/OhM3g/LN7qnM9Nd36fkKBkn6Q8L
	CpGeVk0hfrIoiB2ZnlAzHqFSJFaXnFXqRoYPfUI/7xaA5K/SV0cNd2IQBM6zj+8KTuZ5Nl3oxIU
	Ywv2gabr8HD3kn7p2x1VUY5U75mtv/zoRNFa27OrAtnCtygqMgrVvchasQQGIVXoqMPH+1luEXB
	OuC+9PkFVNJqs2h4qzGys8bQ6RhZQPnAqQnmuPE8vs/KKH/Jxb4gOOLoqRtTo7jz82kywrBc1md
	pmmfIp/37+qai4GrBCv/IASRIOM7+KjsvfdcaazvNness8Iz427e8/Ekicbl2UTm+ZRr9UGrsbS
	pJRQQNWQS1LsGoingFd4O+6JvecqslRK4OOAZ2ueViapIsJkq
X-Google-Smtp-Source: AGHT+IHMJeUs8RlmFkrQ9WTk0wqJZT629erQHVUIzMmI6akez7WS0GHbIEYfQ+fiZr6Q6Fy6PniGIg==
X-Received: by 2002:a05:6000:2385:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3b60e4c2194mr8115453f8f.15.1752828267262;
        Fri, 18 Jul 2025 01:44:27 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:9aa9:dd5c:bad6:e31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627962384sm58208115e9.2.2025.07.18.01.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:44:26 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
Date: Fri, 18 Jul 2025 10:43:38 +0200
Message-ID: <20250718084339.471449-2-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
References: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible string for the OrangePi RV2 board [1], which
is marketed as using the Ky X1 SoC but is in fact identical to
the SpacemiT K1 SoC [2].

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v2: No changes.
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

