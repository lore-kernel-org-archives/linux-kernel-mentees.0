Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568D743F8BE
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Aug 2026 19:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389703; cv=none; b=dB5/jqbcoYq6C6WlYFhvUe2GPbxBtroihcJbTKc0E3AogyV3kwA0RCxx8mROvjddQJCcxa8PI8/G6Hl1faH1Gd3wDMnfS/j2jrYws0XYgiVssSyu6cTqLfNmGDKQqdMbDfguAWck3qbCBDB2nY6LasrEPrDKrH4EGxuXOAYxT/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389703; c=relaxed/simple;
	bh=3yuvh37gvldMLTVcp2HWMOsJBUGMmkZte23xJK3JMSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvcuaP+X/9VUwwR5fJC4pLxAvNqK4Bu8zUF8P/GwY/bTNNXPoUUngJ7R5fnVpBcLWYlbfOVNwS/Q21zftuYStkJQCz+F5OOHrFjEFp26xvw3pcQ1CMD9Bf6aGqiCInwtIFabvsBHa3i7Hl8VXFpyzo/xh3JCJ4/qI2CORJ5XK7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/EPYsDA; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/EPYsDA"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66899fe9077so3438677d50.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Aug 2026 12:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786389700; x=1786994500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/c4cfg6jpQyViNV1y2+k/TbTPYkzleKc6CPIRjyJKA=;
        b=j/EPYsDA1yoVtxG7bkHQpLXJvBwVB7Wr4jxb9nP3gvBRmtwU/mI4rrQFThsneChT9P
         +NtjtZPvWJbhBfD1rkOI/b+M7StWVBUm0TF7Vr580Tt5DN/g9yMrF7POWsczyLwqLjVH
         Jwvd+dUbSvskakIcGMJje/dve0qmcdZPhOOD4ve82CNB2R3NkoY3JsCDwaHTpb6HzBh+
         BJ9VOENWIflg48Xp6zk59w3g9AKBhGdTYcENit7L26KY+Ge7MwCYVTWQ6Oppwj/3mz58
         V3nKYokX5PRDyY19g5XGfaXR6R/YLuv1gF97owC5WMbndE+a1nyzHKOqw/W0yry5Tys+
         3mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389700; x=1786994500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/c4cfg6jpQyViNV1y2+k/TbTPYkzleKc6CPIRjyJKA=;
        b=JdyVjl4yKuFFxv3zYp/3HD7fWN/CQCIIKB/pQj+sLEc104G5BNUCZySjGomZnjc2lj
         XZf38rQHduNiqDW23pyUAjMcOPalYvMk8D0u7oSkn3/Hlyo8FYYoKLHBwZuyekRoe+HY
         gmeYlorlUEcD//brwkn6mJs3Q/263XN4wPHCxIZgFOWcEQobYnn4qVJ4cXZXaXuMLpHk
         HK93diZLZK6VNO/tQFqyZrV9X2EhVIjTsyAKioA1IjtjFx7iwATAJ2dvKUdzUuWysCB5
         GY+befEYYjibIsF0q14TlyhLMVbDQKi7C4Z8nAI32K8rP0DgL897b9NIRhUlb+PlZS0f
         LqfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrF8GM2P8VMxZ85nB5mFlB2xNmmRmOcZUBnK5aR3WTWLbs2tF0L351nDBKJ1SPLKolzxthzGdA7jvp7DqDGUGShDkEUgA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3H9qnbtAfylY5e1nm/pACu/9mhpoM4eEb9CZBZX+7f2MxXNqF
	eK5x+Tc3IQwGfhscyv6RUbsit93F4lPV7Q7hcmaxeFoKQZwUtXBipS4G
X-Gm-Gg: AR+sD10UXgv4co26wj1XDr0y4MfIymLTU5tpm1fmRaLUmpwuIvvpYVn/jLS7tsRmjqX
	/sHBaEyj2h5h5tfTx3bNUC/XN/WQm6zdGqOL9fU6zaEvhRJeb3gElQoSKbDiY88KJjR7adEFe4n
	2HBevh4mhJAUJA7KZ+Iblhl2Tp/PyKW1pqcY3DlQGRXNmObC4hq2+xYOagfrWBfPRl1LscKcOK/
	pTOpXvSU06C05GFdJfco8s2VEu7V4ZcDanhm1IzdCEtV/moXABeqBZyUrT2lBO6K0lAG1eIEYYc
	sGZYPuEeajQGzPtMngSHUfbObGJDf+vzYnbIG/RsKEp4CEAU8fT+X9uJPJSvOn5cxDmFVjQ6BBF
	6+MDvgysb1VGw8m29OnY0gy3GhXFHs/EwzLaugsPD11nqRWIW856jK5DxRJtLp3582Hy8uwVOKx
	mgh8iGsAKdf1CjpNholB8/HJcfQRKrJtADnEyLCE/a/p2Bu1FxAl+st6pd7APE52B8NeXdj3tD3
	eE058E6Oj/d7X3kP7EOrVKvt2X81tTfn4AACAeo5X6ZyWPpxvWY/Q==
X-Received: by 2002:a53:d009:0:b0:668:7fa1:aaf0 with SMTP id 956f58d0204a3-66ad72b397bmr11972611d50.53.1786389700050;
        Mon, 10 Aug 2026 12:21:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:5c54:b9f5:beef:8bf4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acafa90basm6928863d50.16.2026.08.10.12.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:21:39 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mranostay@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] iio: proximity: move LIDAR-Lite out of trivial-devices and add Garmin fallback
Date: Mon, 10 Aug 2026 16:18:39 -0300
Message-ID: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the LIDAR-Lite v2 binding out of trivial-devices
into a dedicated schema, documenting the power-enable, power-supply
and status-output interrupt properties that trivial-devices.yaml has
no way to express.

It then adds the Garmin LIDAR-Lite v3 as a fallback compatible in a
separate patch, since it is pin-compatible with the v2 and already
matched by the driver, so no driver changes are needed.
---
Changelog:
v5:
  - split into two commits, one for moving lidar out of trivial and
  one for adding a fallback compatible for LIDAR-Lite v3;
  - minor changes at yaml like: title, description, adding irq prop;
  - improve commit msgs for covering the vendor acquisition and PWM mode;
v4: https://lore.kernel.org/all/20260714215433.41259-1-rodrigo.gobbi.7@gmail.com/
v3: https://lore.kernel.org/all/20251102221643.9966-1-rodrigo.gobbi.7@gmail.com/
v2: https://lore.kernel.org/all/20250801224112.135918-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20250701223341.36835-1-rodrigo.gobbi.7@gmail.com/
---
Rodrigo Gobbi (2):
  dt-bindings: iio: proximity: move LIDAR-Lite v2 out of trivial-devices
  dt-bindings: iio: proximity: document LIDAR-Lite v3 fallback
    compatible

 .../proximity/pulsedlight,lidar-lite-v2.yaml  | 70 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 70 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml

-- 
2.48.1

