Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089C2357A4A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Aug 2026 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236348; cv=none; b=szpmvgYykU1sVO1uVt0wWTN+iZe484uEwcnwxpYORzOP+65Y4J6qV4wNkIU5QT8ifPH2YDWKbR/pfG4A4NuBhaJms9C2alN2BHftFHAOauWQh4e+BFvrSeHhsVifk2ML8ksvqWu/8uoP/HA8uHWw3IvzM9ElC919BZhc0/gyrFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236348; c=relaxed/simple;
	bh=oIAsE/e03p+TOGVzlvCWR9X1duR52+pknj+r+YshhDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j2+ltVCS227o6hmvxca1blcC2Y35B81FP22DJPzmETKPKtLGV9jibuQNfvq3VM4rRanmQJZDHNoOiQeoG/E4okh/aLVpDQkiGB6g4fUnv5G1vQcdMdQGMDZYgQ8hnyaJBM3M14awrl1dl+tVQ1igk9PmU54Nlbij0jzXkW93UuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCTbNy0G; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCTbNy0G"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c30d9adfa7so992254e0c.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Aug 2026 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787236346; x=1787841146; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gm+SgYfIRbiDZdeJlutFSVssEPZa9jM7xptJ+k84VM=;
        b=BCTbNy0GTJUBs++PUOkbmoxl9Pomt5pESc6keWvKHqsjedz9KotiO/4Qv06eRf8Z35
         XQai5h2ZG5TBp35ccwDjN7Ng68BIiLQejtSoPirakoXJD7gWBH2+WFphHVEF4Qxb5e2V
         U7PDridz4CdB6p34tlD6ekkbPkStjvJ+aRb6WMSl3dznTBjRPfAK9hc2KVidNEWK7b7p
         wqq0ww1M5t5XlXnEw1igdVWUgVDKXIOm/6YXQXrPqvJphCAsjdgV0EmSDLqgAeZjfqhc
         +RWe+RD2gUhJeyg/Xmwu0mIL5ljOQ/dLjaQkLbPqnhJaVx8B+cE7v0Yv+5Z9r1cWLdJA
         nY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236346; x=1787841146;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gm+SgYfIRbiDZdeJlutFSVssEPZa9jM7xptJ+k84VM=;
        b=RtVHQTn9wT0I5K71lidQhh1+ZzjHo/dZhQAFsUwwtNVZbEtFsRezhnpbQT+Ve+On3P
         W/RSqGieR9zMFhBd7zunDVF6On0d43qsgiG2gmiFz/rnzvO9Hw+CxbCZpAgmufj7Su8t
         b4k7Ph/NYmEBk5Y4zISIW7tukpdKsk7EvVEoPykrowywlbKlUMVN2ebfAy85V83Oz9xi
         V/PNx/ECZcHfT30d6VSgV1hcUtRJXeZ7ksycvUvWjy33qrD1Gug0Rr7TVzfSX6sXGClq
         Za8Qcg7WsuU/nKwPjppTWl+XF1foa+PrCnlV9TKGijG605PfTK6Er6lrR23cExHJwksl
         Dbhw==
X-Forwarded-Encrypted: i=1; AHgh+Rom7ryuBhpJI9Z+CUTDuHACthX57aK5Vm9ZrFu7x5tLLc31BR0A8fRpOUqxE4WRn5owDs3tnuM65CjZjjTB8YXqCbAVUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YziUbpalit/ttmswPKHZy8+TIymQ4Mdb1Nja6oCTVFey0mHhnX1
	oyOVqcDaUS3gEmBIuKe8l5izMb/iJzhqAMUSf85ENRq0ZJu5hmUGmTc=
X-Gm-Gg: AR+sD10SvNvkFL5eUmNlj+kGz2CW0dmv83OxMW0Oz7OL8a0v+7jrsYq2Cc/ZLVCpFIT
	HfjbIiS65pzAYe8u3x5PnuFtCPhKHtGWzDHz0ltUUqpBdge+tCIMgrTqvO8urly0nsihMj11LF8
	/NSv92gzpvrGwMAVk9Q3gNUSIHGxY4lARGaDxKms/2qs5XYunqpWTP3oe2DPKj0Yd7BQhU2mjQ/
	fGS4v2e1OzkHQrx0qBjnR4kTU1CiJ80ly9AQ+2S1nwU7AE5dy8LRbk/OZ1Vl92nK1Tu9Kpwa1Hm
	YsSv7GE3WvqQgz84ZmZzsaVOASPbYjVYATV0Yan2akZptAxCPDGas1XlT+lq2QPtt41zUj0A8Gh
	+Uk+troGkbAE6TJWS6oG1u/zzfWNQHIqAnGxAuSQulUrDxTn9yS9ERmWzcxG4BGtO7YQQfToKtY
	OSBfJCvar+R7pTvt9/7g+xQmS0aXZ0xMG6WGzzSwrM5youromuneQhUFhHBgHP4+DT3J7AAEvcm
	WkfnFm9G5vuJG6xKdHGIvWKsfY5eWceopsWaCz9
X-Received: by 2002:a05:6122:3129:b0:5c5:ac11:9731 with SMTP id 71dfb90a1353d-5c5e3e4c415mr4869914e0c.8.1787236345866;
        Thu, 20 Aug 2026 07:32:25 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e25e3459sm6393922e0c.4.2026.08.20.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:32:25 -0700 (PDT)
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
Subject: [PATCH v4 0/2] add support for Aosong AM2320
Date: Thu, 20 Aug 2026 11:31:08 -0300
Message-ID: <cover.1786973355.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
communication protocol and measurement conversions.

This patch series adds am2320 to the i2c_device_id table, creates
of_device_id table and adds both am2315 and am2320 to
trivial-devices.yml dt bindings.

v4:
- Addressed minor styling issues in driver's C code pointed by Andy Shevchenko
  (carried "Reviewed-by: Andy Shevchenko <...> from v3)
- Adapted commit message pointed by Marcelo Schmitt (carried
  "Reviewed-by: Marcelo Schmitt <...>" from v3)
- Carried Acked-by: "Krzysztof Kozlowski <...>: from v3 dt-bindings patch
  since bindings patch did not change.

Note: I carried tags from v3 because reviewers declared the tag after
pointing things that were resolved in v4 (and the dt-bindings one
because the patch did not change from v3 to v4). If this is a mistake
please let me know.

v3: [3]
- Added "aosong,am2315" and "aosong,am2320" to trivial-devices.yml.
- Added of_device_id table.
- Replaced using a constant for driver's name with chip_info struct.
- Separated code changes and dt-bindings changes in two commits.

v2: [2]
 - Generalized KConfig description text.

v1: [1]

[1] https://lore.kernel.org/all/20260805183733.1000550-1-nico.antinori.7@gmail.com/T/#u
[2] https://lore.kernel.org/all/20260810183337.451812-1-nico.antinori.7@gmail.com/T/#u
[3] https://lore.kernel.org/all/cover.1786725567.git.nico.antinori.7@gmail.com/

Nicolás Antinori (2):
  dt-bindings: trivial-devices: add Aosong AM2315 and AM2320 chips
  iio: humidity: am2315: add support for am2320

 .../devicetree/bindings/trivial-devices.yaml  |  2 ++
 drivers/iio/humidity/Kconfig                  |  8 +++--
 drivers/iio/humidity/am2315.c                 | 34 ++++++++++++++++---
 3 files changed, 36 insertions(+), 8 deletions(-)

--
2.47.3

