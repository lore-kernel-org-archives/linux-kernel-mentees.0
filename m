Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139A36606A
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 29 Aug 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985503; cv=none; b=RlXjDzPxijym9STCQMk9mr9yN1sq12GflmUIyQV0WeJcX9RhpgWZSvkhvUfSCr508JP4YDxhEXp4cr6G6m+ZtAeoEt84T/mEipMw5HpLWIUIJJ+EsIyNp0ZJsnXJZ84vR4spNLEn7kVNpy2nTKxHzW+nFT9FNUTNWAYpfxMgNXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985503; c=relaxed/simple;
	bh=jP2B8Oq/SxivmT2+4bp6q/xxtMABghG2HFb3rq1F3l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3yzgYFohGaO50I3pDfnZqrxfboDtTvm6lf6wicaAt1TDB8Sn3mOg6NvAimbE62gB0Tm2rUZhz4FjAvGUBy7Ud+cbcxy8EaKWOjoog2NtDVxE3//wQ64nE3X8GBw6Ufqwh1GFFUKjPAdIiCXX8ESnfZoZ8CurLvRzsxL1ZzduGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jq8u14f5; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jq8u14f5"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398b3c37877so142828a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 28 Aug 2026 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787985501; x=1788590301; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5O2ZS9+ansg0/IUrCuwtyZKXd4BjLxjahxk05rb1blQ=;
        b=Jq8u14f5tkXAJ/3hit4avgXTiyNBkRSse1ohCbohhi8Hks+8EqRfG654Bp5NTuZkfu
         uHtPAAox1b9JVgMrhKBpDxNB7tmGVaZ7ND2XIupek/abq+J4E6rpACx41Ia4NlrAmjVs
         4J9dLuDSvgSqljnZvaIFBTxZIIp8yASnarFbSYKbyiR3NfpKiyaDt2R/mDN2EAmTBK1Y
         mAaLD3eIcAXKL2NoGp4DTxF4LkK/iZgBzWU6BkfSZBKoCzTHaEDJOMWCN6vS4g1/+P5F
         oQKRZz+1jeKusc79hrhEd5vjkz9tEVOlJ5D7TJVHevJSjZu30HuXZvMZFnbdTEasvT+Q
         nS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787985501; x=1788590301;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5O2ZS9+ansg0/IUrCuwtyZKXd4BjLxjahxk05rb1blQ=;
        b=metlutbV45/98ltIU+zbJfZS/lLQRMOcF6Jz7FXta5Qxz37Ms2+NLFX/nG7A3/x8LJ
         qeXs1TPOL9SV5UJk0fJw5KB852Dq0p+Wb1Zv9ItgegwC4m8js51WdNex9St4uy3ql30b
         /Ff8/ABrI+MwJS7xHjDFXbI9m/ELY5BTEKsZjljeiKc7gFAqNNco1y9jSIYcV6ECTnlB
         DkBoIgOuwYZSkcItjyj7O7Rb3rRuSH/jXDc1twMW2kYoki9HnM/LVur9KQdLgBserUA5
         z+mAjBkK6lBMYbr/Iw5bdYSDXKfaXjxFqugQuOU6SJgI3FKDCaoE/Rb7e/OJJlK5QZIs
         SUnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2wMlV1teHXBnC8kJ2T/jdJ7TFmH5DlnmHmK6oh3u406DKoz1rGAN1TsLV+bbYrIyp/xDygnOXGoWfWpA/39eJ4pvs+w==@lists.linux.dev
X-Gm-Message-State: AFuF++maMJ5V2aSAg2EeTf5m2WgbsZGUKv7MEkXmktEYtSCo1QESw5Fy
	Y9NfzVwr4D2VbD05PYGaZ46EO2ScL49UJFjXsJRCNzbQpeFCIwWIXbo=
X-Gm-Gg: AYBFou2IybOeJKMYru6oCa2r6dbY4JBxSgtIHlz/uQyRVR19SYdWE62zgzRh847wTl1
	ldxas7g3P5jLpZy/P7K2ZilUj/5mkqwIfDXbDJA1RuCvvyFg3P8tgAv+2Fe1idnqLnizDruR1ME
	Qg/9QdyxaEq/5i1nQEB6Zp7R50opMtl4Ul/Ah5zfFZ7NZyuzKD46heH2m3usQ5syRH1flk+D9nV
	/5BN9QmPht52MekfhrKSUOnsdOG++AWhNzWikVelVyD6kzIJYMwAIU4vkjcRwd1ppNyKlQualfj
	/PQAIjEPE1VIC4ANNOx1DddAi1X57dRcZGdtxha4wdVzXbCZHzcknDrtsJMPGw//MFNZbhYGFma
	ezIlziut7y1uZzf13E2E3bW4aXFH96alR9QWRUjLxzCSrJHvbMmc7GWFlYkVcJAxjgfDZKSJZKE
	h7Wh5vnGLt8Uf2Yx1/S8oHi1LJv0uGAj0ak92eaGT4WqWnWjbo/xrDP21G4pFpHPQPDDtzS6As/
	tdAuY5yuV23q/9tXe9wpFZBkRi8Qz+dCfMUu8q0eOUeQpBZCw==
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr22749011a91.13.1787985501343;
        Fri, 28 Aug 2026 23:38:21 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm10957539c88.2.2026.08.28.23.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:38:20 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Sat, 29 Aug 2026 03:32:15 -0300
Message-ID: <b02861a81badc32b414147f36e0c429969aae225.1787973729.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787973729.git.nico.antinori.7@gmail.com>
References: <cover.1787973729.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entry for the Chipwealth CH1115 dot matrix OLED
controller.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59d60df34dfa..dff105e5f01b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8581,6 +8581,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/chipwealth/ch1115-i2c.c
+
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
 M:	Simona Vetter <simona@ffwll.ch>
--
2.47.3

