Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E424C9010
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Aug 2026 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323127; cv=none; b=GqHJQDOTUPwMLtjTTV4YeUvc4LmPby+O/Sp3yDvuk+n0pnJD5NRSAjHcMDlYyJuiEVMSd8Y4VWw56Y+oqKUnbC1f0cMsnwnLWjVfEx/66kKQePl9tNzfLpExmVrcfivDNWU/ef0WnmZZsz3la8JlIM97HzpLsNborY0PBcmZCME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323127; c=relaxed/simple;
	bh=jP2B8Oq/SxivmT2+4bp6q/xxtMABghG2HFb3rq1F3l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gZDvgbKNlLTvbweqPNiFR4O0lT3o44bt2O8G4ZMylELDVaGzIhMTuGqOM2F1LYF6bQyNyzbiEUYYKZAeUjqYUb7xbszlhs5co8sQfWZatQKDXd2ogcNyAHwL1PItsiY2BUluu/nGGIgq364/0V5k3+/11dRalACzO5lh/RTk8OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRKfQ9xb; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRKfQ9xb"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8201447e8cdso15688737b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Aug 2026 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787323122; x=1787927922; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5O2ZS9+ansg0/IUrCuwtyZKXd4BjLxjahxk05rb1blQ=;
        b=PRKfQ9xbaPcgDYh59OrbKhsMZid/WfvZhhVnvg20kskPi4nuHzP5cx0lXLDqnTwawE
         ezHy6hUK/R74bdsQ5dfQSqoFri8bxmgqAPXhBc8IdoAj75OFY2vJksRfbr6HDbRr0ygg
         2/tjkW+tjt9iZLycRhwKMHC12Z60RvSO+lxsFKLyx+TUI7GSmEWRIQEAQsASLli5dSlJ
         KFfckygxw+xEtXjCLQ4kxaOW1DzdzOLRSMYiYKFrHyxnQZcrkP5nEgjmZBpiQZsuxEV6
         YwkTaLQppnv4PEh07ml+6hceViMaLBGb5x81+LGMDIjJiQ7nU3xbWJJnEi6PWHzhbcrq
         Vz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323122; x=1787927922;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5O2ZS9+ansg0/IUrCuwtyZKXd4BjLxjahxk05rb1blQ=;
        b=cq0W6oMhj1IuG+KpY2Mk/25szCwA7aqC1bi3MX2peEFjUMqVVp4b/m1OMZisw/Atb5
         4XUIlaeOxrDdxMwwJ/4b0Yqqc0enXCQyb46heiPXhRKlJ2Og//4UERI3/yfVNNLNKxkW
         MCuGRr3sjcs2JPMRJlJZGa8iKCWdEQox5LierTkuKfLZ5Iu32ukvV+KS7Y9TSpgfHZCP
         tFjCgKmMbygTIDITxLz0TfT1Svo2tGN0MINDLzMYSugcwSrMSJrw38c0OK6RGDmZpMeE
         63owWdxYO4EQFHrLQETkykwnKBlCtTzw9Am0zsbjC9s2rXl89pNXX3wRCvdRYAI2HNQp
         TJqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxdYk6L8UygaPCYrWBaTza9Xmz4gKpdPgeXynINNDlvDCpoQ/uZjzkK7fhOS9KcDroUgRKcCk2RFk1d784I3CWcANMWQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nBcT8RoWrPoO6lN1nYGEXIGbuYEvwFndhg8XPKi+l96Uh80uEB
	XzR+lAPzfib/K0OSiWErG2L+P2LWJvFtEsoiwuTi+ENMNtMGWLebjdg=
X-Gm-Gg: AR+sD12/EurzWcdyyAwIgTmECx3Pvk2TE5i/g1k9bCEgmy0zAynPMPudL85aN56fip2
	5JkiZvxHCHY4WqHj2E6FAjidx7hv67xFiA8L4O3Ioaf8ovEOg4fnwQG3G4C/PZkZIARXsp0j96S
	niUdbILbrudD3pTQvHxsqqmse4CBjYw2CY9rffYQ9kk7U4mrZpQaKNA+3fabZTCd5mXDJRrM8Hu
	Ac6DFcSeIgFkL411noJhBhm2Fu5MbMVr6/dHRy+cgSwdMnx7mRtgf8BHsHM2YH9jzGxuCuSwuqP
	UDn0nxXTSEoWxAsUPm/pO+hb1kHPyrgeVhKJp9TklxzbW9v1zgXbV+SaciwVM7vTrP8Z+wKTScC
	Qm/7p8sStfXtkWNqobYg4A+gtnaJYF5wOaEFhQj8TST3CnKMwsrnkqRk1sVHOpCSKYH5FtFv8Y+
	k92/IRMIw9V2Q5SREz48HsmF/KgXtm8HPVjd96mQbREljcn76Kd5yCdpouEPJyQ1qG1gJWR0n/F
	YohHCEch6nEHAtQVoOkSescHAe43EzXd146oYnw
X-Received: by 2002:a05:690c:e288:20b0:81f:d505:8ea4 with SMTP id 00721157ae682-849f449c2b8mr21855567b3.18.1787323122701;
        Fri, 21 Aug 2026 07:38:42 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845188b28f2sm41868277b3.38.2026.08.21.07.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:38:42 -0700 (PDT)
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
Subject: [PATCH v2 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Fri, 21 Aug 2026 11:34:18 -0300
Message-ID: <a56f15cab62e16df835fd702f26739a381949bec.1787321297.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787321297.git.nico.antinori.7@gmail.com>
References: <cover.1787321297.git.nico.antinori.7@gmail.com>
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

