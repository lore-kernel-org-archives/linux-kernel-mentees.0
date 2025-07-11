Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29FD2EF670
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Jul 2025 18:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258808; cv=none; b=Xyt8L4Akw7H4YAYpbyqaMk1nNVu9fzLUvrggfqy5Pk2x+O6Ylu90SxHm8YDxtAJSY4vMawbOnnyyx5jV1Z4NTfJMnlcLUkHVHzaPsG+OMzfCGzr4yNqcz2RU3Xy7HrcnyLiNsvAphR0ueD1uJEvQQtoQt/aG8RCadFz/4pEqzAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258808; c=relaxed/simple;
	bh=c4G0nLEkAkq5XZ+dS0OGLjwmFuBAtU1HZ1+fl7Ai0jI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBnu4CRk5uli1XUTuTtpLQaJ3AiIEEvtHLvwOX0nmgCIDI4HWhfzZPqJw7nr+Bg1/d/kgznUJ6s0k9b4tRw4pWt3Tnn6lkAXO9eenW9qu1Mgy6Z8b0eVa3WBm0DQ6O7XFIOQKROLjQZ8dygVIiz2dRFE3BgMf4HPG/XzKE6aY/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=Om4lUXrS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="Om4lUXrS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453643020bdso18565435e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Jul 2025 11:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752258805; x=1752863605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ/08yx9KdEYvED/sNtpfI8PHIlJl7VHvIaa+wkBHBM=;
        b=Om4lUXrSdS9g+Pn4eRJtTngtc7ULCv10sG/+H7lQnTtEYS8rKKDcCEqSAKjnbehnA1
         EMV63e5wSJru8mkaA/j/hejNVMGN+F5KUg/KIsPFXv8eEf/F42mcUy5c0s0GEWorkZPz
         7f5feMxvVOvAtHTdWqBuo+qUDkOI/PGUIsOO+XCuO9r5gcpNu0rtrSqEsv3ViWu3v7eM
         LT9cgNmqwhPyShXP48tBp9hFbe27w6EfOGI8x494YNWOnek2QKAB6J2rmVmDgtsUXqTl
         k4GYvZn3p4/2cuB+A94Ouqa+nQP6569saPmBrDlZ+VRxHzrBYhRZBK52b04B2CUXnA/L
         Wvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258805; x=1752863605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZ/08yx9KdEYvED/sNtpfI8PHIlJl7VHvIaa+wkBHBM=;
        b=wPiCVWRMy9cIcXsddNUyFqU2iJW/2EkUTVjUeGVU/b6Hs+mPmv8j9PUBDHH37pOW+y
         +IUIAC5llwAhEtwh0AXMHZqGM8ciQsbDvnGAT3GmxSkGmG85L31j4i9IGE9PXRdaggNd
         YILpJMJsQXZu2mKZzlOv9JP4vp3E1tG38D0rvIaHWz1N6eRSIyuKzherOxiHo8hhtq9B
         kqlg8hJ8b+avkN468tKbiYFWyEn9BGjJBiN7WLB7OQrWPhQOFjHUPwVhxuPKFf+CF7x1
         Pwl2BNBbocXrgIT3ah6CHwOP7YOhTa63bzFqTA8i0M+jMhUCErEIeeD6VHj2GLRgPyMI
         xi9A==
X-Forwarded-Encrypted: i=1; AJvYcCUaMPzjhxwuRShXsuhE+bEXNONtkVp+O327zzvH3xiw/1OODefYA9jcxeLbOV/cmDtGOmtq7KgNJjnh4Xwk8NYPKzxJkA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0LmTE5XOlKYIY6TIcUhKYkmtYBID1bAlhuf3U8z1wlimKEwj/
	LiSHVe4E8EWgtLEYd/RRgeuiqRldWhs+1OqDuAUSfFTbRZaT3GPqQJcEVLFCjxIrdNI=
X-Gm-Gg: ASbGncuawPbyw/sVQjBVROOgcP5y4qcyxiYYPENCjr02fmjXsQzMS0MkX2zzNUUnmYB
	+DPWUfjRs7AarhRYHQeXvyHnWfvLfn7bhZ17ohLKt5FUkMUQzC5A0YGgbvJ6jOBXngE6XMg/y+2
	XWNSBlBwzbf/qr31L1F5r7ZMbPmQMbhrBy/IIMkj56GuRrQb35nRIjIu3TbWwasdQJ7buEJRmcC
	Zi4ocn7z6uPwkNxXhRVtLFmJ1am5dHPgVWxwcV50+RiX4EVPc340o54eODJOteMYS4JpO+CXHYI
	8vIBU8HZdhB1PXcaDsJ8gDYp5ymU57+bVgCM5gJ4OpaYrox3GXpTNqKSBoL9S2w4ca8lPfarN0r
	e5wsw+PeusNr0B571+v1XCyXMpNbWxIFIgb2qZeCKEXbOz13tTdjOReVPZ33o
X-Google-Smtp-Source: AGHT+IEvPbYDu3buwmTl0D0zspg4iHm2lPmeDh4bhM2691VW8eqw0kaZFk/7vW1I7JEp69ktUPgeng==
X-Received: by 2002:a05:600c:8b26:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-454fe0f93d6mr45409645e9.16.1752258805054;
        Fri, 11 Jul 2025 11:33:25 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:bed2:2848:b66c:32d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45601053020sm705205e9.36.2025.07.11.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 11:33:24 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
Date: Fri, 11 Jul 2025 20:32:44 +0200
Message-ID: <20250711183245.256683-2-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
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

