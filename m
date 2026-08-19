Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18903822B4
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Aug 2026 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173084; cv=none; b=EhTSr6g4LtbP2iIg+eq8snUyWpRdvEoNd4k9x/PNrYD5bMZ6H9yaj02MEOZflL8R7nzV5bEWVnkCrZ1K13E/uiFcsAmpZJMGws9ovVarSMVSiPU2I1SNlIaxurW0llDBYRW/V6zMY/pLtAI2kj3HnG54sUeYqhNRbqz/x9/TE5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173084; c=relaxed/simple;
	bh=GswaseQEJwvFyginRUF58LUdk6xOa2hQn0m4PSIXJ7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clIWemwBG+bJDswTKEz+nnelT9o/CiK51Q04nQYQS2qJdRHZ2Q1ejoO83pzHCzJXTAy+ZxH7ancTZfIyIEl20Lc6MzcRFDBAN708hvCnaLBou68/86dHT772YZ2Yx0LEpR3GaCPVNNZLK2MqhXoxQsUXDm2YgIraRD22ulUuJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kutixor7; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kutixor7"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7466771f1caso573090137.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Aug 2026 13:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787173081; x=1787777881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I13XleUZppuMvfz8SUkNT1GjWZfu1XqD5Cn5w8LK/IU=;
        b=Kutixor7haqOPRLgr+8QkgH8oiDdNExvFddrOjZVisUyGQUnRrK9q2mgW4RgOOjTn7
         /cP/DEvXoRuSvwm3I18uV4Fqh3fGUjDgnz/JlSi3ju+sWGZx0g9nCIZFVhzH78mbHhhS
         1/SxBrX+BfdBk4RXIWOqgHv79sJZT7wSLT3XLabJeyMGNCEVXKum1IC/a5e7LWF4UbZ9
         BDmyqITg9VC54YnbMqdDFbag358f6GT41PwE/504ZeJtnb0YrO+WCQl+j+zV06Qo3V+H
         P/+GlqdqvKDxSxCO5wIj9VfO4CgDCoCkMVdgPgNGtH/CMAIHETz1wwjb4nZsHGg2L+UN
         IENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787173081; x=1787777881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I13XleUZppuMvfz8SUkNT1GjWZfu1XqD5Cn5w8LK/IU=;
        b=T0pK4AJbnPqZNOly390C6LVykSk6E1AHLaiOYJAnWPXWa0REnvMwYS4JxzM9uIS1gT
         jX6gQ5zDqX3X3kDlbu6vFVXCaxR856t3/DY22hSaRg1oLp+w9i2m7NTY9IvFf0dXs9G+
         xo4TdCWXmvFCyaT1DcZhpr0J3yur3Hb6OvKRo3DESMMQLpaGCPZONpKuVK3OmKtKCTWT
         fVEfXcCXKxVtDAtVoUf0Ktj4Nnrs+CEKMqcz/FnfhoD3LOSVjLqEwpJbTcdDjuNTzNVx
         JAnIFKGKOjVysHWlVVsWYaCizuB19cYeQqzm4/FODj/dNke9ZXg61aW7n3Nk/6qO8seg
         Zwig==
X-Forwarded-Encrypted: i=1; AHgh+RoExk/w4moD+RyVv6+wtNV9e7H7M0AUlQStGEXtvFfey8gVEqpXn5UkgnqRfj45Ww/MmhgBjASrYn0zHMGI6CxufGrLQA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yww5I6RBrgKmz1JlFdPuV2SCEsDYSNZYcEzWuTHLlKTqv58FDbH
	YWFuXpnpzTPUMEFZNySjQ6sXOUgYehu6Y435B/SHYs3t/jhNpnydovod
X-Gm-Gg: AR+sD12pnpb37FIc1gKYAJigt4c0KI9he/Qa8D+e68PlSJAZjz2UON67QcWZXPv3Xhi
	Z+hdHrmh7I2oEUhrXfvypLHGEPhIvm9L/7qyNZVHK8BQ9WFOb+HPhAYk4xt7oXd2vxfbeI2jcvM
	rpMGg4my/XZaIEcGFF8qvGgSM3Zl6DTV14y8mnqeGihIckkoOU4vjhrSOEp7qs1eyjCX9QZJM+c
	v1ZPRN/LikzFiqq+lgAL6PeCnyaeIW8zB2BfQEg4EclmVAAOyeRJ/9YmWL9RM9via/lwM1LtRqA
	8WUqNQcFJQ/IjoVLYMaFzawEDAZxMEUoW5fK2ZuUe4qDygWTPHvgVbmomnVwN8lpWLBsBZcU58C
	0PQirRDflccfGMfmXWHG6gUHFj1NV75D23waXolNFJWckD46IRt/RH9ywBrBSz0wdQnh5/Eml++
	KXVjZfHCJxj+poacjiqeH8sbp3H+nM/GUmRv7e4NvKk8NqepI+h3bxMocWH6zuH+4FLMWCn7FS2
	wM6ZymsOWssirMzplRWq1pxujX+/jZ5TRLqHN/4yEypHU23gCWch2I=
X-Received: by 2002:a05:6102:191a:b0:778:5579:c662 with SMTP id ada2fe7eead31-7785579c755mr1511551137.9.1787173081540;
        Wed, 19 Aug 2026 13:58:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:3443:53b2:2e07:b3bf])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777ddc844besm3616259137.11.2026.08.19.13.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:58:00 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matt@ranostay.sg
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] iio: proximity: move LIDAR-Lite out of trivial-devices and add Garmin fallback
Date: Wed, 19 Aug 2026 17:55:16 -0300
Message-ID: <20260819205751.166030-1-rodrigo.gobbi.7@gmail.com>
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
v6: updated Matt's email; update commit msg from patch 2;
added myself as a second maintainer as suggested; collected
Acked-by from Matt (patch 1) and Acked-by/Reviewed-by from Krzysztof;
v5: https://lore.kernel.org/all/20260810192131.153495-1-rodrigo.gobbi.7@gmail.com/
v4: https://lore.kernel.org/all/20260714215433.41259-1-rodrigo.gobbi.7@gmail.com/
v3: https://lore.kernel.org/all/20251102221643.9966-1-rodrigo.gobbi.7@gmail.com/
v2: https://lore.kernel.org/all/20250801224112.135918-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20250701223341.36835-1-rodrigo.gobbi.7@gmail.com/
---
Rodrigo Gobbi (2):
  dt-bindings: iio: proximity: move LIDAR-Lite v2 out of trivial-devices
  dt-bindings: iio: proximity: document LIDAR-Lite v3 fallback
    compatible

 .../proximity/pulsedlight,lidar-lite-v2.yaml  | 71 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml

-- 
2.48.1

