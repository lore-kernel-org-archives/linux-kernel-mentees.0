Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEE42E736F
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Aug 2026 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112564; cv=none; b=JqflAwn7bGZss7eOMnVnxV1mBvKjTrfRiNkdayKmlH2dAUvfXrw1+am6/mKJ3twUnesEwxfqHnGF0OyAoxNiJBb5+cYnJrd/w3RQM2G4JBuylUAKPPWrBWdVbz85o6IVAup0p3fFvaN/94T8+yVV5UYBJxUllPD5qBW4V77TgQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112564; c=relaxed/simple;
	bh=0j8TQc1XBE3NthqoJBUaOtN3D1SXokyq3y6sx30QIwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YGjiS5k56E3nRqlpRguOGEAqMoFZ2mIJAQJo5CFlQsNUPD3NJYpt7WuL+e3IXdAsQhFvVKOjbpirOD/bqQIo4oDMQ5RHzM7hi9QleP/Hybwe1PW5s+l+AiH5Yo8/E4yg3YQitGwtzLKyXdDAaiNRUkCs5zB8wirD7K/baRDDX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ho0mWUuD; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho0mWUuD"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso2494905a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Aug 2026 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786112563; x=1786717363; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAa78h1UPlEGhvqRIND/hGOzg4aWk1ci1bKFVAtltMA=;
        b=ho0mWUuDu5wv9nhoqg7W+/+Z2YMYi8Ft0GHD8gM52tWtIUui6ESuEzJjCzHBQolAIW
         wGga1CpzaWTZO3AJaCobW/dX+XlWbOrIJDozdRNYE0Ya03FlybOfhX6r+6DGjJ81mxvc
         qcJNIZx3L9kyvN//3YiLPAl+iuVT6Ud8BKnF4K5kiyXh5PztLRVoP+kXx8UPpU7RdSU8
         4CLO26reyCDYwO2FeF/CXnY4jttc7aIEBgYcJFl7DkjP7TbM/fE5POrsjfUBZRyATrlv
         3b53nScef0EpV0ThY9Ac6CEAdRLzci8NsXwWy+fuLPZCwT9TcijGj3wTtOAWFLbOoyGz
         Dxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112563; x=1786717363;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAa78h1UPlEGhvqRIND/hGOzg4aWk1ci1bKFVAtltMA=;
        b=p0jtCsY+v+hSFJU7+XPJ0S6lLnaoz0I7wYkBGF1Hih1f87ImEJkvt4mKIzs/HQtVl2
         T+dZ2dFyofUa6nehYsfSHxty0l4iuQMeglJZm9NM8VUdsFbjsgT2IPOEfaERJHsLxZFc
         ENA+L+zrMWnsseb5dp8oP4TeUFkr5aP4jhP9NOaGiIy/gj3B6N6yWgbW6ivh33frLiDz
         VzkvPJHfDlbIjxucukv5eAZ9HsaQwzxT0+1ymZugEcT4mTH80t1abiE1gWbfX77aWvHB
         4yPOZrw/uf2asPyA/N/dGQi8OurYVcvexloDycn1FowDhJX7jFAIx6KpxVR4MseLFtyR
         3MAA==
X-Forwarded-Encrypted: i=1; AHgh+Rprhmz64JUmEb5e/BK6kIJitEX5FlX0smiO8fujcyJKkYgz2kTjdTUgYYZf3XqCJUbqIavviKF/A16RwiufOlVq/zb/MQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv1GhFyrJJpMuDFXw6sFXI/EvWHBWPMIrJngrJeptYgSbWRo3f
	1NXVJWeQ7zwNcd+h/7e/JlKixZ3bTuRdejf9XQnKevp3wZl6H9ULCHc=
X-Gm-Gg: AR+sD10TFSiycoP0F7ZuMUdAYG3J7MxiPJFQvODO6IZ4twTd5AOKx4AtJ+8d1aoduYg
	hm/yXmkpfJAtm1Nc4M3BplHrHQiooOpYOdvTfoUMODdciFrCF6XrZWxKqMXn2CYxyE1bzgnkmvV
	niAzd0zF3NFuod4d4XxYM2dRdF2a36t5KQyb02LuYcMK0D1qiw1s2RMeQnLnPsGEhRw0lrp1+y1
	7PjMVxHmV24H4z576tMqWmIS0CNApiVabW9WfqcqLcTQBePc1226+wSYD26qkIa2/T8PdptQPIB
	0t4tJFAsg42nbJA7eoPO3kma9m1zuKbOLFajCtBvq6fEm+k0UlL2fA/fogjpu+WNuccY9Lkc3jG
	/iH4qJkbOL85uRQfHKTKfmeh+7eUrbOHZOwkRuJGmJ1tResVk+BWMavncObvixHwX84/T1UkrTR
	SU/R1yFM9bcSXOsVrxIVsMrAAflE8GJweubqEOrpqWrRwm60eNzoW8u4sihfNS6trb0VG7L/ll1
	hxryVXT5NlWohnuKySA90PXYDM+A7eevd71CB14
X-Received: by 2002:a05:6a20:cfa2:b0:3c4:397a:69b8 with SMTP id adf61e73a8af0-3cb85e6c93amr31913005637.21.1786112562606;
        Fri, 07 Aug 2026 07:22:42 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a7395sm8521868eec.9.2026.08.07.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:22:41 -0700 (PDT)
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
Subject: [PATCH 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED controller
Date: Fri,  7 Aug 2026 11:19:52 -0300
Message-ID: <63b7368037a4f03024152716776de23da5442cb7.1786110720.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786110720.git.nico.antinori.7@gmail.com>
References: <cover.1786110720.git.nico.antinori.7@gmail.com>
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
index b09b0ee33f5d..8430e4f4cad3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8590,6 +8590,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/chipwealth/ch1115.c
+
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
 M:	Simona Vetter <simona@ffwll.ch>
--
2.47.3

