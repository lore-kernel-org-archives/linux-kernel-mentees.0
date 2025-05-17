Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150D61FBCB5
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747488487; cv=none; b=lWYsvVa6E+Qup61ks3zDcjH793i1P/tCcqHJAQfHiXQlNRD7lrwIjnmwGcgRSgfttnZEhCI6KjWRrU7edo6vdfWf+tc8hjYPTKY37RtgQEhgVShIEaaZDlGkUJW6u/YoYmjkLhY2GQ6gm4bSQsxx1a+YldROtDoQJbKO2mDtyss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747488487; c=relaxed/simple;
	bh=gmDEnXwRjo+bJNFszJsbjo95GO8tD4tqGQW7d1o1lDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pwgy/g22l4JydCz1erqhvAiY036Jv5ufmIc33VYw3uFppGFTb/5tVV+9RlI5G9Aw8+GGK5yFwwtgcrAg7dlzDbPa56/yQdLv3t0NwLy5/JrQ/Xqw7oRnwxWOiTFQTrcZaINmSwUj4PfGBtGPz3wGqOcs+RpypM5QOnbUsiNin7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0OmiZJM; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0OmiZJM"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-327ff195303so21911251fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 06:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747488484; x=1748093284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI7TUjGfXSmfmXazMfqv5rln70w6M1XAC14rGLg1cvE=;
        b=O0OmiZJMXNrUSCXnQrdZb/f7JVX/3aAuFACHxcJ9Bzdm29xiJ68NGwy/xtJdggL7VY
         dRDYtYBw4gCEFrNHcXeWVjo6Awh/HCLOhI7uVai4uc3bi9VlRNtBAW35dED1DujpRfJC
         GQjlREzrpF4b+Q0zJY5OZvMprf+UO7LiZ68W6tT30CwhahlaqZtQ8IaOgHZ9WzEs8evm
         jry8F09sKhKYSU1aCNPGHMPP2f8sObcjVR3tUusvUHBNDLtK/w+bMPkNEio6tSlJW7OT
         Y1JpISQ6qxSs3ER55ioTl6pKyFVgmEHRkM4Yrr2qO7AJMqKrdOKMAgYaYua/Y8Zpet4/
         jg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747488484; x=1748093284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OI7TUjGfXSmfmXazMfqv5rln70w6M1XAC14rGLg1cvE=;
        b=hWs9pwuvBzaSksvOev/PbQzMRsSpPC5gZxlyIt2c1MJAB8gwVs0S1Fm6qxJFaKmPQ3
         Oh2xlk5cCd3MD3mdLHWOHrcbmm2E0kktnG2NT30G4YAcDC5UROvktb9oS/3/qdwH3o7r
         LDTjSPutwm4BTESNyPZlfONG6eqB+p7ktoTvmkwXh7j+zVyjMXQLRJk4kG17aGfNA0VM
         PYUoKQ7tIpmrZoyGpcPHi5qXe819AdHdktYUq3QAG96/OGxtY//VR76sGsLjYRpxSlvh
         tpcCjj5nK6Fn+kDlCWMEtwB6esRc9LqOByznOL9vT4gjs+AywBOqVlJH0vmjRcu6A8tV
         ioYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3LoBHt8bI3jNA5ElBuVYuH/7+y6hhNomSXA+p4xZRopPAbMYfbe1huk0tiGGGKBSnFq5NuP8r62a0Us1E05EM8xuLKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2lj5VyvOdRA+Bs2JxCJVau+7xK9lTcDMzvKCQy9cIqU4aV84v
	ZAUFyDh14WXSoVa5xik3AKaoTxMlTr7d2N/dm7AcRstAFgJshj1SgmbG
X-Gm-Gg: ASbGnctoujCutzWqlStpimaUgNyrh4rJrMu6OedwW7MO6yshD4Z72t43djPVZKox8lA
	7FyvUnssfVOniJMbP51pttY1j2bQLFWwQ9uRCVV32JtW2l6Fv12vvvxRI/D9YICA1KHXxzS0bxz
	qJ44qykduuXDO2ba2+JiSohf3vt3k2wbAyn0B23IqrZ9eBM2Je2QsVljuM/LWZFQheCK5+XsX06
	fy5Piar55qiUFHQO+nAuabGx9VNznKoOia7115swjMWAf3wQFAr/CSpzC6051UwGIxkATnZjLHK
	8C//qVRaxGvr9MMpIikMJWlSsjsIqh/kICxRmgZ0wVGkzpwrcVL7N0ZGzUUQRUKeS+E85deF8Ni
	hOfw1J31lx/q5gbao6fWLp4zgClDYMJ1ua/p5UG/ZOukzrYx0
X-Google-Smtp-Source: AGHT+IEsSe/ClhRreVvRQ63LjMBbkjm2VIQAaZkjewE3YafWUrvnIgpv+xribKL6G3lfDQrBgN+ulA==
X-Received: by 2002:a05:651c:324b:b0:30b:f138:1b9f with SMTP id 38308e7fff4ca-3280771e454mr18580111fa.17.1747488483886;
        Sat, 17 May 2025 06:28:03 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-40ac-27de-68f1-6ee7.rev.dnainternet.fi. [2001:14ba:53:1500:40ac:27de:68f1:6ee7])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf9f9sm8663501fa.94.2025.05.17.06.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 06:28:03 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	hljunggr@cisco.com,
	dave.jiang@intel.com,
	jgg@ziepe.ca,
	saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com,
	corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	W_Armin@gmx.de,
	mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH 4/4] docs: Fix typos, improve grammar in Userspace API
Date: Sat, 17 May 2025 16:27:11 +0300
Message-Id: <20250517132711.117618-4-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250517132711.117618-1-hannelotta@gmail.com>
References: <20250517132711.117618-1-hannelotta@gmail.com>
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

