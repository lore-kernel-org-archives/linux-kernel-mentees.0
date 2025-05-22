Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B4F28A3E1
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914828; cv=none; b=ClVNX65VyMTg8AyFtkJ0zWjVp2cNZQdy8L3E9EXPuXB1wTjrZO7eqZEA//Hb17jH/rKtdkH8LApTkOazWr5P2WHD8IhcSJvg9DLHPKCb6f+quxp4/tROfSSlMWV5mbgP0vw7IscxSysW3xrV/6wOzmOFCrquM1pfnqb6a295b38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914828; c=relaxed/simple;
	bh=Mg7qX4I7qYfvYCd1yjRtE6Q0z11dgZZ2/+YP6BRNSqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ILAUWFPdodKPmZZlOEzx+fgGrbxhcev+MBguKDKtlO4NQELa8Gf7k1HPOgSKXTexyVAPl/GZqv7vDzuu06GFGbPjFj0Ro3oTkJEU2WwFMC4lUQM6BBAarzFXg+VKfKPZKpVmJMb2mnTOV0Bh0oso/KJBW+G7U93v1m+J5HRtESU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+cIBB79; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+cIBB79"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-550e2b9084dso9121754e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 04:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747914825; x=1748519625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhOX9eggKzblhpKFsblCKZYMw/3b9yOOLEO13B9qp7Q=;
        b=U+cIBB79I3WZIfpdDgCxr6zYEP7LUgAwxbv0/yKxw2XQN0FpAhXXssxqPrJ3XNm1ay
         x/f7QI96rYv727ymjCVCmAAz7R5jeSxfQDvQ5wdC99+fHOWWkJ+j12OrycqtpKXgi3gf
         s49Pcd5Im6IUfgHqnlMou0WC5kkSA0kqPFBmkOJXphYOX4Gtgt2D32qiWDV7qtSKtPmt
         FX4Utfu4SBiADtZNAsT0A/+5Zk0bwKmRq4TsaCtBqDCz2uly99x92GxrMGqLL8u1Dz5d
         QktVsh+/+njo1dzbrX1QOkIbRsQ7WDQv73Ou+ETlxOai175pVmMBdX5KisPfcdYZ5J60
         kScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914825; x=1748519625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhOX9eggKzblhpKFsblCKZYMw/3b9yOOLEO13B9qp7Q=;
        b=Yf04r2XnEnqnGLGA7bwUZDp/805sAX5LfHX3ig76eakKK45gQUtvAzANxuAHl7f8kz
         qMIcS4qWP/AvIidoQTKgvQPlDPRyN8Qc59fApeE7d8+bzG+jdMk2R1uW4L3DYZMYCiZj
         beiNFpvrf61M7f9StQK/CEDw1SrCjQaw2qZgsnAsLSWOcUfpnao8IebU3fF9uaRD+R/6
         A8jfD9qUd4B+QFCT2hMMQUdG3NLW/H9dSm4A5dQ/FwFMCGFEoz1y7XAWLNKTwuyQGPBL
         BECUIFpnzbjraAI4ax1yKEYJTtHWCsO4n3FEpfZ/Fxfh48D9+G7n7i/3NDJpOuRvxS++
         MMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrP2ODHQzj+E9teZsVdF+tLkAsNO6bHzp+4r02rb1JchbnAXpMLoX2RNj5/gTbrjDXER8Q9DQAb7t4TjqZpus/FSwr/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/NV7DKBZhWNY3CfPGb1RQj3qQ46cSqpKjHDjI+ehP6kvysCfb
	PE24lJa+rn6TqaR8h8wJvMVIEdLBYWxklObUf5XuhtgKmLEHrmxZY3JQ
X-Gm-Gg: ASbGnctwDyqRZ34cyohr6PmlTPx3wr1bGjCK1vtYiBQKFlbdIiaThvQVhXuKctj/L0r
	sYVQJGhLJuuO2g0bpU/w3vNMfjFW4xjb/Ps+R0HQDi0oaGf/9zAONmFyMvijbV6YU1sLkCRTrz1
	Aq4fEl0DVeAQe3uy79+njtL38aI4c/q64zKz0pEL2jZGcs8O9KvW+Qac40ZR5A21qhnYbVUhCtZ
	+WGu9Su2ERa8f9MwZIEOjSwY4IF685WDyI/G9pO2YnptRE0RkeJ+tHElfpS55kFfurzerM0jCcj
	fSB4Ul0mU46t+vlD0Nu0fG/YWELNP0mzz3Rh1UK4/ZODoVa8988+Wwp4HJgkrBh5BkVFzrAAEI8
	k9TqIJsaCsteqexW6z0bwtZQPcyNzE8oa/1FzDrenn6RVxaM4L0dQcQef
X-Google-Smtp-Source: AGHT+IHEu6igARvex4pLKN67zsQTJTB2aQTsbDZx0BPl2mbP8nmToiz5iTopXp5wnV0hgYgTHrkRVQ==
X-Received: by 2002:a05:6512:31d6:b0:54f:c616:ee28 with SMTP id 2adb3069b0e04-550e9906d2bmr8236399e87.47.1747914824718;
        Thu, 22 May 2025 04:53:44 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-7c4-bcaf-182a-540c.rev.dnainternet.fi. [2001:14ba:53:1500:7c4:bcaf:182a:540c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e79sm3343760e87.154.2025.05.22.04.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:53:44 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	hljunggr@cisco.com,
	dave.jiang@intel.com,
	jgg@ziepe.ca,
	saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com,
	corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	W_Armin@gmx.de,
	mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH v2 4/4] docs: Fix typos, improve grammar in Userspace API
Date: Thu, 22 May 2025 14:52:55 +0300
Message-Id: <20250522115255.137450-4-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522115255.137450-1-hannelotta@gmail.com>
References: <20250522115255.137450-1-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a typo and improve wording and punctuation in
the documentation for Userspace API.

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---

Notes:
    v1 -> v2: No changes

 Documentation/userspace-api/sysfs-platform_profile.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst b/Documentation/userspace-api/sysfs-platform_profile.rst
index 7f013356118a..6613e188242a 100644
--- a/Documentation/userspace-api/sysfs-platform_profile.rst
+++ b/Documentation/userspace-api/sysfs-platform_profile.rst
@@ -18,9 +18,9 @@ API for selecting the platform profile of these automatic mechanisms.
 Note that this API is only for selecting the platform profile, it is
 NOT a goal of this API to allow monitoring the resulting performance
 characteristics. Monitoring performance is best done with device/vendor
-specific tools such as e.g. turbostat.
+specific tools, e.g. turbostat.
 
-Specifically when selecting a high performance profile the actual achieved
+Specifically, when selecting a high performance profile the actual achieved
 performance may be limited by various factors such as: the heat generated
 by other components, room temperature, free air flow at the bottom of a
 laptop, etc. It is explicitly NOT a goal of this API to let userspace know
@@ -44,7 +44,7 @@ added. Drivers which wish to introduce new profile names must:
 "Custom" profile support
 ========================
 The platform_profile class also supports profiles advertising a "custom"
-profile. This is intended to be set by drivers when the setttings in the
+profile. This is intended to be set by drivers when the settings in the
 driver have been modified in a way that a standard profile doesn't represent
 the current state.
 
-- 
2.39.5

