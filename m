Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15E4357A4A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Aug 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236354; cv=none; b=rVsSQ2/3JZSEapTnijrYK7h9uKcP2CN52PWu6pIf9qyKrxy48ef0XbXk2M9qYN2HKsqMV6fLHhYtSh57gyEKLUFK/iLp2R0z4zIikeWYAk31RUHzlfsur9Jpr6cKsofhv2YSIxV8+hqs92lKEkVhlxAgfdtr5ilOMVhnVQks0t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236354; c=relaxed/simple;
	bh=a5RakhIEYhfE5aUZzebBLZ1wAm/eAbhVK1uouFMH8eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IUKbUt4fHkZTKQofqiJGxDzh/ucAypeIsvpsYeF9rUdp3BHmn02JhmYj4pTKCjccePqbNtGDrNlh6PS6LbqXt87nS2g7t65gB3jfa7FDPSjkWWWJqW/bInewzu2V7netvqdAMiI9qzwOTUCzS/RbujLzo+/ofKUZXW1sNAu8i6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4cFKcux; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4cFKcux"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bf9466412fso2090876e0c.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Aug 2026 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787236352; x=1787841152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T85RHS8VejstyEgBz1/jasjfhA3Et8B7A5u7SqIabRM=;
        b=E4cFKcux4ePY/VtDqiaSeCWpUD1ye/fn6kkyq9SzDBriividqR5Lq5V/ynXD0w1xaC
         SIRyGA0Obolj8QE7s/BXWnx0t8QUcoEtcZ7QVbYK85A/Gr71tJM1qpOhyQVHsTBHnuD6
         n+jGSFJY+MtE7xmchiQSdiiUQ5HY99RDHDuGbjUcbwZmPe4fv6JZcwE6SL3+IiHZKbY3
         Rm0N8FUpiWUOR9eSW5LzOGaeW4056TsyQfoL230kpmmAkliMomFdEQSpQ9TFxkVkwedl
         owvGnCVj8nxw3VLF8AYT6b+XHZOMZRxgbIBEMPFO36ARKnYmrn60UQj53ZvicWobvAU3
         InJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236352; x=1787841152;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T85RHS8VejstyEgBz1/jasjfhA3Et8B7A5u7SqIabRM=;
        b=j3lJ19PIBS4nCoLuZZcdZgVp/TL3kkZsEfR5xyzBGpBQz0ZSS4zqKoJR+ooeo2fYNm
         cmDKkMqZsEXnkANQNZ1knVNNhkJFXAS5DEfBeIBp9N8h/a1OPaUp+mZQPfFPI3iyJJkj
         86F502MeDmnnBxdCSwdAZ+UXhJVAVA51ZGAz0iGnP6JxsztfH8sju9689SoX+Xans4uv
         MI3eVlrauJCdQNIl9Cl8CERb00f6xH8nbfnBOi/BlqHfyTRMjdJlmhm7Lrbt0zBmshJa
         0iGxXb9fxkGbGIz7Yw0yCOH0H14brVYlvwbXTfGcVn8umI7zxEe7+GSbuLFD39HLAsA6
         kQdg==
X-Forwarded-Encrypted: i=1; AHgh+RoPaf5sReW9Mcu6lLxHzWABXuxgiWBejO1XpYxbRHjClPtyZIyLjOelt3NxvLiV5kyEmWFqRNDR1uvsHP4bPaQVV5m6oA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1oEnSGTaSKv59UH3twqDRlTfDhwYXZFpR/sSNZJDAjKgHfHou
	DrqS8S0p6ciN0duw+WzWN8XvVc4e7b1W+BS4iJYxJhtu2IBceyAtAyGcyyxG9Gk=
X-Gm-Gg: AR+sD10cipWzThdXLDtZlBhUVPfPI1tYx5WoyzmBZZPzML73/YEfErx6PfRdeGdp/a9
	Lr/EXWcodP9u4ss9cDl1Mz44OjwLssSx6Q76bTKn+L07v/b/UADuFrn14+9Fdm+O5ZIiT6b9MYW
	6Hc/BKRki1LFAMRC0CeTcoI9EZUz7XeKraVEmpyixjL1EAafFWFcf58qDUvcRk3cXZUb4R5TU+8
	hB5kSUxq4JstUcuf01+gcgepG4nlz2KbH2mUzlmL4ywakcCqrkAA87ZCWIW4VqIemz1vvvp0L6Y
	HZmo9N2Y3B5+jXUJFrY6U5xuWi5NVTGb5uC4wrc0P8QFvYPWzl6Cld0DH2qJhylkQm4c3JY4JSu
	dqnBne6B8xohEJxgc6BT6u4BNLg7vw8I9+FoXq48QwzHgtK4CdKsgd77aNI3mWoTbGh2CKcHAqA
	+tUvVSVitD1Yx30LKKiJFck3whF6OEH9CuyUNgDXhvZ38WIKUJDTGCMkH9MFlXViRtu5lNUkFZe
	lCGAPlvx3+l6w0yCnSH1VxneykAtJOVUZWW0/qM
X-Received: by 2002:a05:6122:3a16:b0:5bf:8c77:e89a with SMTP id 71dfb90a1353d-5c5e3de4dcemr5807238e0c.2.1787236351791;
        Thu, 20 Aug 2026 07:32:31 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e25e3459sm6393922e0c.4.2026.08.20.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:32:31 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: trivial-devices: add Aosong AM2315 and AM2320 chips
Date: Thu, 20 Aug 2026 11:31:09 -0300
Message-ID: <355f97d79939b0fee740f91e0d4a74b484639092.1786973355.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786973355.git.nico.antinori.7@gmail.com>
References: <cover.1786973355.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Aosong AM2315 and AM2320 are temperature and humidity sensors that do
not require configuration.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab436..92b757579eef 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -62,6 +62,8 @@ properties:
             # Aosong temperature & humidity sensors with I2C interface
           - aosong,aht10
           - aosong,aht20
+          - aosong,am2315
+          - aosong,am2320
           - aosong,dht20
             # Arduino microcontroller interface over SPI on UnoQ board
           - arduino,unoq-mcu
--
2.47.3

