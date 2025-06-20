Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE92BF3EB
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750442591; cv=none; b=HCQ41jhSwXtG6hm5SzVGB4tjRdv2Suo9JT6Jy2x3sFUkkqTueB1bfzF60Pn7W71jCssuY9NRU9H7E+E4Hb64fDzuawgoWPEgS/dgHxprdJ/A+O4kncq0e1CoH5efRhFl1nsxxGP04ULPOcz8EzGba5srj5oAhICgJHTetPCQA54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750442591; c=relaxed/simple;
	bh=jFX7Zn97NNqcIpZJHQJ1GlN7HXgR2NyfxKF/YU5EaSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TGgOe6bhU3JFDeoUTg+MJb/rfZTOIswBEVoNss/5vSzLZnJsJpaxCvQEpgZ/sXwaDQhYcFKDveLlCm/tqMe8qUmjHDOf0F614fvGM1cq3EsCIbJYzi9S6q0tq6JxredYczvdx8L/benTsBZGaEbvSvi73nufUHIv+DHmpzhdMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=aNsjkc5c; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="aNsjkc5c"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748764d8540so2111883b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1750442589; x=1751047389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LASqD0oWUo5WFt/+IQjzZizw1Tgw6LTsbm7AdZ6Fm7Q=;
        b=aNsjkc5c1vBUuoc9+VfmKwAPCFC0vNlCJQPSnYa7gXrKL/iBq/U0W18c4nU6VP4QQ5
         IG/aiD+mHclmcbMzlq0dcmWHy5sszaAtoq/b2PElVXweXrOUdpspbhG55PsrvjPEbE86
         CdWwLMXC+vgJRCG4EGqVimCcwCY4UdAnr/EnmPfZdI9YLyl25KWbweY50N/gMSxy01q1
         VsuXbCYmBETZDdvGnUMTQEI0wC7xRRvy26gooP5QR7E9XtkF+fZmE5vuMQjw6EPoEigR
         S6GNzV+Vnio4snvvAcfTxYadzfAnyQclW6Sf7egE+m33HrAL+EQEKYeM5TCq/R3gPtoU
         +yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750442589; x=1751047389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LASqD0oWUo5WFt/+IQjzZizw1Tgw6LTsbm7AdZ6Fm7Q=;
        b=DO6nukbCtpWyc0ipkiMtgpaSAkPa3CjTFHYxi736SHa+bqK2fGSqJgCkARFRvUMliN
         DuBhhShJTUO/HwogLhcofnZKj4574D0NZNc9AU6KIJywphGWwWRXbDwA+DCmqfbCNcKx
         gxlsbCwaqizrqeQLSPeMScMsjd/sZwhVGNS7GyoJZAIpbqbGYIP+uJpIjMAYP2JSYlvs
         cuRgNaIvzV6ZJDG6VdTc+Q8RWkhJ8o+4PBV1D1aBkrWOsErt1VrpAAeDNgRC80zyOrGQ
         ZIoV+z5ATCAoJUjlXDulJiz2HjdSthGONQFC2J68LENEiXgiHOpQ+yU6ksLiri8oIXlJ
         a2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXhI6OVfLSVHbV+LZx+Y8rVRrFTHX952kO3gQ3PQmtfB2+D0NIc6aPYOIEaIB6mtkj94ymFxByPakWsbct7LWF4pQGSLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMUOw9XyPO7FMUs58EGk4hK91HkJN1A2tmr0oVJ9hN4xhhutTV
	SKvcCHltBP7OMSN6gHgeEZj/ueOS/rUWl1viaoUM+4Jho8MBHh6ntmKhCdWDaRPWRr8=
X-Gm-Gg: ASbGnctwXRMgL80WTZaH/uCX2PoVYPnL4e1X1wyxdpure0d0lxC4/hUvZm3Ab+Vr3dz
	JHO8+Y0gAMaSuPccdjbpC/9qP7doj0W/haUGXFfEmSGpsGcpGeV81s9LuKUAdtKLQYTqR4jKfpy
	UnV785Iu9JNaqBFlKZL4xBt1gDlWFez5jtxCl8F52vegjeV2F1vbVRcDN2iPZbWMP2HKAqNs3kS
	s+dkwZgt4Y09T153bj1i8gzoVyO8Mv4d2KytbtM8FJp8Jxc7riXF60nxY0J3lbF/EhTqPxziAPV
	oBrtHGsuseJzVMKHEbLKjOKp+vIQUGTKe5w1bA2GUx/8cQdvdrdqpcGSpNfuyoOWe0zhEpcDgzb
	o2Cpr6Dl9ZY+i4JVraw==
X-Google-Smtp-Source: AGHT+IFlM8cNRiBkGT187wOeWcfkfeb30/gPkHi7Ft0d5GjTVFgLhRQpzSohSUSYFxFeTwX7y0TLjg==
X-Received: by 2002:a05:6a20:72a5:b0:203:bb65:995a with SMTP id adf61e73a8af0-22026f007fcmr6414483637.30.1750442589385;
        Fri, 20 Jun 2025 11:03:09 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1256f03sm2131724a12.51.2025.06.20.11.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:03:08 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] Fix typo in drm docs
Date: Fri, 20 Jun 2025 12:02:58 -0600
Message-ID: <20250620180258.132160-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in Documentation/gpu/introduction.rst

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/gpu/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b94..39b4c943fa00 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -32,7 +32,7 @@ member, only the structure.
 
 Except in special situations (to separate locked from unlocked variants)
 locking requirements for functions aren't documented in the kerneldoc.
-Instead locking should be check at runtime using e.g.
+Instead locking should be checked at runtime using e.g.
 ``WARN_ON(!mutex_is_locked(...));``. Since it's much easier to ignore
 documentation than runtime noise this provides more value. And on top of
 that runtime checks do need to be updated when the locking rules change,
-- 
2.49.0

