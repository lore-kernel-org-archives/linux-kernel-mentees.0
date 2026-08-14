Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D9489894
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Aug 2026 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786730098; cv=none; b=s7E5QoR3v1OxpKBzWUY6JhMUk0+e/bnolyUfysqkUeb7Pzro5VGbYnzdFvyc0kO52U4Sg9pVF/2O+qyJ/cuzZbiwtJb1NpSUzM2LsWpz3dnq+O+w++Y+W9kMLRHGOHcibIGToNrj23fAp8/2lg66gJMBfeRUTPGz8AJXdFwRYt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786730098; c=relaxed/simple;
	bh=Gytm2vBeZorxYJyVN7QlG9nHNUrB3j8irWdN57s46Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9Yd28ioVLLVIm1hOwEG6i9FT4tJWLhlGijd1QmzHxYnx6cimBLkx0NjMuEHp9cB3IvWXW/CRp4k4L+M+O3W1vaV5PpCVcy7z6cX5FvebfBiuKnToqY/ZlEUmGcOFzTzj5ByxzySnkiK6jHJr9nEIAPubD27uGmA583Q/4w+bnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eC24Jchh; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eC24Jchh"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedf318752so886820a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Aug 2026 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786730096; x=1787334896; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/kOURHIJRc19iLa4xa55l8prRTy60NCsC9eHTfO2q2M=;
        b=eC24JchhXVata9gHc7SM5bvMCo2lbU2aOcphZnWGoUswAZXttnFidoX8X2GurzIbEx
         YQxtOxqYU9GInswf6R/k2havA+BX4j/czwLHha0Ow2hf+Q4IZFs129N76Q3wBcbYDiMO
         UwtzqyLx9Z2y4qo0ZVcU+/H0tlnGcPKEEHhKaT+4KARNWUrdyGnWCXY1Qx+VHoPjBWCe
         06Eyj3Rvul5FrSZlG4Cwslpi7VIwIBEvdbxICx8GKTB94yb+kvxsSAuReGf4KdICB8+a
         SqYtbPtJPk9N3SbW511YbuSIY5ONdMF6XwoAgO3VOOmarl6QgAvvmT3C/x5PM0ouzwj8
         whqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786730096; x=1787334896;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kOURHIJRc19iLa4xa55l8prRTy60NCsC9eHTfO2q2M=;
        b=bUVKcLVCki51ucGtTocw3dus54MmBSoY2pAkdClFfZg8QhDHM/MaFMdbIHmlVIqY5X
         K11NSFcLz//rjaaxsW6eRt37mUgHl2VxAz2yf5fQqp77oAJh+KUqwMFbGaiPwQDagJhW
         fFwPoN5l+GhwKzLy2fyVIgdWts//I9ANNF/Lf/PIWQDZ2hN0C+vThZKwzoLWHY8CLTUe
         XMobUth1eOt9yKoAFZvedyU9VhHu0mUkTYRqoOMfamyLm3QKGOywA03pBblCZNukpBxX
         fdAiWS0r5YXQgQgenCte2gA9ZRYYTJ5UQnUobqh6t+NKu0wsVcbAhg403LZbSLxdXex7
         44dA==
X-Forwarded-Encrypted: i=1; AHgh+RowD2SHzZIT46MMEJsUjMniuUrNKHc+akGoC+qmsrJvRqx++NxXpbRw0ot3TIPszf7a3JuYwWeNmzTrcbdnSZ+nP56McA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9Ia6sq5KmaNhB2NUQx1TyxgShZkNI2jwgd6jH6H4DQvAqEkKq
	KJX1Rk70v0brodjqN7ipBYlKO8YjqlLjjsGJE6c6wmW2eqSPy4xzSpw=
X-Gm-Gg: AR+sD10NqzNcQuaq/V8HMIyP37MqQK8d6MxR2kwQxImt3+AquuqZVYlKWfwOS3vpE2n
	1BVXC7kN2OqqTrwwJfvHNuMLlM6yL125RhNC7OBYunr6kg7HjNRG2qOtzE1lVi60XqqmhVBQusa
	LO8/l6HDDXUolYLEpC6+LZu+3xHzJJKLIdjsOK7zh+PNXWDIozsKEhZy9xV8sfuSdfKMA6ABkVs
	JsAV3Qg6TKG9OKLMT8EbPFqGage936EgSjgwLDRYmcNArK8t/FU49HaJnsvqA9MDwCtTX5JJSIa
	khH7qESqOrATGQGd9/NLSe5mZ0Hu7xPW5PVzO8P93/66Pp2lYXFignlpVaHZp1eDNQkxeci8Smp
	kDqGLYm6U5Yp9aIpz4q06/bKCOYbD5FcQ6tLTQ0kjWtb2bHLMk0Q47X7ZsRAMs+WgBxm7Pqyd+2
	nXDmuPmb6oXdiXfJcXlhEuGHWYiAD9wy1RKCoXInSES76R07Qkr6IyvEAW+HmrEUZ2mmzQ90DE1
	SS8ZQUHYMzD1o2L5vW2X8Gg8J6YSzFuhXHoBUn6
X-Received: by 2002:a05:6a20:c90b:b0:3b3:fc6:622d with SMTP id adf61e73a8af0-3cc71ddfe6emr9097217637.38.1786730095658;
        Fri, 14 Aug 2026 10:54:55 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887ee70sm11128710c88.11.2026.08.14.10.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 10:54:55 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 1/2] dt-bindings: trivial-devices: add Aosong AM2315 and AM2320 chips
Date: Fri, 14 Aug 2026 14:50:19 -0300
Message-ID: <cf3671822902e82c133563e2169334dd8c41ceb1.1786725567.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786725567.git.nico.antinori.7@gmail.com>
References: <cover.1786725567.git.nico.antinori.7@gmail.com>
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

