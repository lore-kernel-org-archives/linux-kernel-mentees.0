Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA9B219A7D
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Oct 2025 01:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759543006; cv=none; b=H9d8umEX/aTQWapt4eNA22UKZHAhwSyBLJM+3gCzUiLkZV+2q7u8E4+1A6H5VPtqGjhwxwCQSi/sdGThccO2RHBScewF07SLov6yhXlcpyht33Myv5eVMpCiM7+BLzGiMvvPfRjyNl7R9YBey81T3tuq9rtCCpXLOkDQDhWDRw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759543006; c=relaxed/simple;
	bh=9CQjQxJsutgII4B2do5o6K9A2olhaHHOafQzFjMKQdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twOU2wXar92ggTB/Zgrgwj1s08Ay8bV4lhKkHg9kEiZNJ1Ng2J938ZhuliMUcYgbZWF2sz4VPlRuHpH6z8qyzygHrZ4/IhiWpmhTFYojIwWKW2NCJzKwzhi/ZnmKWXwn2Hkz2qOzT4cFGdI1/oBeaeomM8YbPZnXe7mOd1xPbhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmPRsZAj; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmPRsZAj"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-b5565f0488bso1872515a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 18:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759543004; x=1760147804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rK2RcAWNzYWhY12ieZZB4A3XwiOU33LzfFmZAdexkYc=;
        b=AmPRsZAjiPMVYsLsBotRNxbHhdY+2gdQJi5FKH1XMWnN/BaH8RuekxztuAKCUd5SqS
         A7c37krm2wO+bxJGK01Ac7W8TGYsEHTA8XS2fXxVvhiKkci9OmObwzeGxp3WZbxP2XKy
         UAM2IqVyTAJkHEDKKRIYzZKZfB0VZJsxmyc14+I7jSY9N8VoJZ16IZ/a7HCkiDeam7Jz
         vL1XrjRDPs9s/7E6EZNdW/gVSOmzMl1JzcoOICb7SGEsK6WWYcbDXS9OoXaX9AzaUDC4
         RSNgRu7peXqp0Au4SAz5Jnf8VUOKKtKaJHhCOfcIUbQpZ4zHXcC5NuOHGv4+QJmKcZSk
         aT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759543004; x=1760147804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rK2RcAWNzYWhY12ieZZB4A3XwiOU33LzfFmZAdexkYc=;
        b=hhIfLIZqRzdx5QUSF85t5zLDqypfwqk6u77msOABeYGiC6Kc7oux+AU9FbkFU0aO4T
         xCI2rVR+pr4LdVyeHbIF431ldESUDkFvm9b/ItmqoPwYpPlg5GOMKXrHIXxtwh8JsT6P
         FZ70orwnK3auzNC1DoycZxH4B6X2B/EbQ5ncMLOKbC7j6eN1X9rHpcxKT1zVfBniAG3L
         sIhxn8KQa0BrqSDSyMDFJ1DHTivwfww+C/tWnf+amEAfGiNSf6k5Z/xGbhQ4C7KRMXNe
         aXNCPeS3ZaUa9J9lArkAWcNea1rL3NeUhmu9+/tH+qJ71XvKzJyLVkyqHq47bpDwTgsz
         D6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVuOb7K4XZGAt/US4SZ1cluDrj5x8Mgec5qNre1eNm9M0O/eO/w/wh/lGNw8Yo0v6NpMyqhy/kJqu1p1BD+fLv3PwB9YQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz68mgZ070X3maozXuwxZBm2F11eW4mK9nEJIIPeF+ugXoq4yvc
	zv75kb/xMUJEaaY8vIlS0BnDrNUzT+wYDrVQxFeXwvMYsqX2TKl0nyjm
X-Gm-Gg: ASbGncszBGES0ZvAYbElW1pCHa4XN87TF4DiGdQCeg0PFoM5HF9LHOBvSVq670I4Ztv
	Id41+9KoH895fIGA3fSzwq3bE2XARKhoosFMxEz60PqZda9/vbceGUEnSDp7UR5oHtCK6CR8UEd
	40sUj9ys76UZVvHfdCe5z5wBZwj6l+nftOhZUItzvjbIHpQ5CFy01ix2LIQIK7C4b3sUbgV8T0k
	jRQpMDpdbuzTZqpBQJT9o+jbDVZZZy5Yh0ohQct96YIAX+hb1aZ+6tVb5QgIDjjQSX2smsMscEE
	WnhJBUfyxMevcV2MMvYP+0sbrTSh7u6txJTHxzB0lcp5m83Yq1SyVE5T1sdPnlmZN9t0xLkLO0H
	xB232L7JrdoxBZgaD40nfgObW7kef8pzu7dGHO2vHDIisUtriFMA4mMYij4U92Z9Flg==
X-Google-Smtp-Source: AGHT+IGLZrZ8Iq9T39sC4XilbTFNhZxJLoEviq80CK6g39OUwc/4C5+482Wqw0HUfzPUahIppnFM0A==
X-Received: by 2002:a17:903:ac3:b0:267:9931:dbfb with SMTP id d9443c01a7336-28e9a664f4dmr62292785ad.54.1759543004557;
        Fri, 03 Oct 2025 18:56:44 -0700 (PDT)
Received: from Ubuntu24.. ([157.33.197.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d134859sm63197485ad.57.2025.10.03.18.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 18:56:44 -0700 (PDT)
From: Shrikant Raskar <raskar.shree97@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	matt@ranostay.sg,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shrikant Raskar <raskar.shree97@gmail.com>
Subject: [PATCH 1/2] dt-bindings: iio: max30100: Add pulse-width property
Date: Sat,  4 Oct 2025 07:26:22 +0530
Message-ID: <20251004015623.7019-2-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251004015623.7019-1-raskar.shree97@gmail.com>
References: <20251004015623.7019-1-raskar.shree97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX30100 sensor supports multiple LED pulse widths (200us, 400us,
800us, 1600us). These settings affect measurement resolution and power
consumption. Until now, the driver always defaulted to 1600us.

Introduce a new device tree property `maxim,pulse-width` that allows
users to select the desired pulse width in microseconds from device
tree.

Valid values are: 200, 400, 800, 1600.

This prepares for driver changes that read this property and configure
the SPO2 register accordingly.

Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
---
 .../devicetree/bindings/iio/health/maxim,max30100.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml b/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
index 967778fb0ce8..55aaf2ff919b 100644
--- a/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
+++ b/Documentation/devicetree/bindings/iio/health/maxim,max30100.yaml
@@ -27,6 +27,11 @@ properties:
       LED current whilst the engine is running. First indexed value is
       the configuration for the RED LED, and second value is for the IR LED.
 
+  maxim,pulse-width:
+    maxItems: 1
+    description: Pulse width in microseconds
+    enum: [200, 400, 800, 1600]
+
 additionalProperties: false
 
 required:
@@ -44,6 +49,7 @@ examples:
             compatible = "maxim,max30100";
             reg = <0x57>;
             maxim,led-current-microamp = <24000 50000>;
+            maxim,pulse-width = <1600>;
             interrupt-parent = <&gpio1>;
             interrupts = <16 2>;
         };
-- 
2.43.0

