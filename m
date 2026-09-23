Received: from mail-vs2-f25.google.com (mail-vs2-f25.google.com [74.125.227.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E259B673
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202992; cv=none; b=WXWqB6QFhoEMwcEtDb5qkDHjeJSfUrjO6u3lskkPIJ2Czu656MwtZX0kgXiizd2fUT4sbNMd4PVMJlTLzKvo8Kj2tPhj0IgJJrIxoiEF+bE0pNLVuG0KecxD8XU4Ulwb8PSLkRHnW8XIaeyO8N5FH7Mif07ISvZGsqXWngzFwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202992; c=relaxed/simple;
	bh=hko1Wr/P+mWTP60B1SdiXSjPWfGT6Bm7y3xjnUp5+yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syix5+RQ65EBEC/wbuMVznZeBH9IbwaBHLOLkUlqulAPE0R4wenw2keDyeLLkedG6gPBMdQb2ZCy1wv3z54+ZwtRDL3oH6O5v5fatTzIrDSkzMsI/pPoIC7rsnRkv5W4w8QHxm+7rPohrC3idhWaULqOtuuJCYk3r9hKYTFrqPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Equmowrm; arc=none smtp.client-ip=74.125.227.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Equmowrm"
Received: by mail-vs2-f25.google.com with SMTP id 71dfb90a1353d-5c67e5059fbso475938e0c.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202989; x=1790807789; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jqAh36LRZFOSOGvgNmY+eEB5gitwvA40LvfMFJdUpDA=;
        b=EqumowrmvfGZx7Y0eIfmYQd/pEjD85j/GzUxrXh8XDg9G4EV5F4gh9++o2HSp27ij0
         9SxUpIJjpLuBTGNmGfU7GFhR5NLsr2ZX64/rKX+USV4fXivEEAvWh/lk8CXVla8KJZ3A
         YWsBiT7gs7fE22Se/Vlt7KLkZOqXGMtJX3EsO1irdoJ9BiuuEs4c5tvXTRQQDCFqTtf5
         w2G3RnyG4LJUHoczXnMPmaxd5h2nWu4CjGs4BjyGrfSedn9mUjTEYSh4rX0PfBa4WYP2
         /MrJDgctzRMAvChJVqRRiA0w0z6MLTSSg1Vnen96Mukke04b4+C0T63FyCnSOL3uu2nJ
         XIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202989; x=1790807789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqAh36LRZFOSOGvgNmY+eEB5gitwvA40LvfMFJdUpDA=;
        b=Sm/0aG5kwUqzgpOWYnfnKoXOGYAAeQT8AVLPck24qbEZeP9Ey/Kd7EtfA579YMycXp
         /uoXqBlOoD5K7NUM3EmHRAEoPDu5JOpaqd9CtCF2DcC1SFCjDMFzK+7YEvJpetnHQLlc
         sLQOozCLpsud7js7GwSQ/eMfpqcOfCvRmFzzrp4Q6E22I75aVKcsrjeg1sIlnIJ83EMN
         SMv9P0862zNtRsAEpTtYiA7B+4SBJ+S7tX7r+KOC2jIISMpXC1PnsuHEdUcpl4ItxzLp
         ShmnEzVYLN97Mvsfx4qwweMgENtZ1Pf4RpMctH4Y1hAwKu1CdCNVfOQNCM5ytKfugvrC
         rEaw==
X-Forwarded-Encrypted: i=1; AKwUvBz6+1X4EA/swhtgdWDRfVFOFD74A4YS+WpAPrBmqP7elfSjCQDq45ZX+hIcykMpVST10OXVIhm/5DJC6UDKeg8NkrDxaQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lclqG/0nRMy0qZo8bHQzOc7nFltAZFNiEOGvQsL2vfyPlixP/C
	1zIx3ZEzPG8mlnBe97zPQROiBwdQg5LWSiCeLZC737vR2EDKEDKY53A=
X-Gm-Gg: AYBFou3RhPaGkVSkwE5hoIq7bKcQB6ARwZOslxI/l4LdLJgoGzsYHLeogf18CjyULTW
	9T/e6ywbrDjm6Wz4r6ZHVP565xqouleVw5ip0rXEJXdwAq9x4ATHyuhFiXTRFpW9tBo0VvEvV5y
	WoTEqsOdiodJ6mMzrIfD1JX/ZuPDT5NWWQ7o+R17CPqcaQkcB8cWF7eabTMrG5xp7cxEnIRdQzM
	VFv1rj/sKsxXPaOqKvsnI6HbDo+eEZ61GAIMwesHHexehm1FLHLgtUxwhcM6nzSqATYhKe+mFVV
	QdxiveIT2DPPK+vI+hi9IAAxSyK2vir5aTTggel829tA7fRyAXi9qTnBBkG0BX12NHfTrThjhu6
	k5VwdA2tbrvcLQWoBu1P+kuQ7fl5cGAx7qWTdBDbk17wm/4Mg9NKJhx5u1cT3q3biBfIDYJLH+d
	zoAAkm2UvIQbEZMKqvZbmFQncN8PekcNJzpf0cSPZ6x41cpJWcA3qEFTEwm+kzer78KZ1H9XUnW
	xXmK0TzVZ5CGs0Oam9ZDWcMw9mgrwKyzw9oH8Mehrx6BLOGsg==
X-Received: by 2002:a05:6102:2914:b0:7a6:e08f:9fa with SMTP id ada2fe7eead31-7af1cc992f3mr537802137.13.1790202989138;
        Wed, 23 Sep 2026 15:36:29 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm5162983e0c.9.2026.09.23.15.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:36:24 -0700 (PDT)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v5 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Wed, 23 Sep 2026 19:35:15 -0300
Message-ID: <5ba56a096d825fef6b291f4cddfdc5f0caef9dbb.1790200427.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790200427.git.nico.antinori.7@gmail.com>
References: <cover.1790200427.git.nico.antinori.7@gmail.com>
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
index 054178b88dcb..0a3c3e6f0af1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8665,6 +8665,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/tiny/ch1115-i2c.c
+
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
 M:	Simona Vetter <simona@ffwll.ch>
--
2.47.3

