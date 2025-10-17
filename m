Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ACA329C41
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698696; cv=none; b=fwA4na9bCQfoA+ffYro52iebXCVo+yEaxJBNM1vwILqg9IKvfTosRtmEJQl9pM46cgHr2+AObhG8cPrkpssaeQxCAV10LV426rDNTeAqd0YxOdAUwnfOfCdUZyeDRtqWmLUyw/OnqlJWJpaEi1jP4L+S5/kXk0ZcE9MumS9KnBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698696; c=relaxed/simple;
	bh=jYLh1g0/g+YswT19wb8sGFf9meznkL5gtg/UsZXCKQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKID6rs5PyXRSW9Kl+Ur5GcNFX19gPpYtNPaukM5KFtbxy1KuancqOw2IBbzl9AuE6C4mr6ciKes+Y9/h8GdBUA6FISeczrdKIhl7brOifQQL15RUATribPCndy5YUTC8S6Ry5iGI0iYtCkHABYwA4WjTzS4nKyR90/NOodcvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URHSjLLM; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URHSjLLM"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7833765433cso2451054b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 03:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760698694; x=1761303494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eRznc/oLGLRRb/vl90nQzjbWZjbdpkXCZdSvk3IxGA=;
        b=URHSjLLMc6p/3IN2s0UPku9JGZq+XYDqyZkmiuaIaftbX5KGX/VO+hM6/Zp4w3UlHi
         OpeB9dEgfTJOGbnsohZAXuTekYsWTcA2N3WT91UwJ+WfA2onScDkLmWDVkKK86+cpvV7
         7qudbElNwi/Y+IRY/mUNnxAj9487NEGbBQOr0jZV/659mWt3sDAmXvJI2ql3Qtnd8i/6
         AfcwacuKhLkMB6rYpSEBzRrc08zxI+I0+DZHwIdNL4AFeLn0jGT/3blnybSZG8JIpqmB
         aLEoYOB5HndfjxKBYozyosXJP2mxXl+cmT3uTSUM+Duqdka7iCD/YJ32CzwmWg/mBgnM
         dqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698694; x=1761303494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eRznc/oLGLRRb/vl90nQzjbWZjbdpkXCZdSvk3IxGA=;
        b=J0vVHL93WAx4MvSEkrApHZXlDdZj1qfqE5mDIhjD0sdrRoh3fB/14nbMYWRTiEEE5I
         T9tL7s/lgp4ykna+Fmo5/QHfkkX+F/1s8vsBoduzgGLGzTYqZTehDPudaOfH7m48ysWm
         djwHVdr8sRaGzfQVi6daiY0uyaKTGTejJgn4IDHrG7OMHASZ7hlHz3mwU0FANJHuqOLX
         vgk2E4TW0X/TmJIU3zX4SAGAflu9NtwEag07Q6TWxkIfCXM41hEjaZqEM+dTBFylLuFI
         0xofVUjY3a3S44CC7JQz2t+Y45nlPxGYg6nqGckNxt+1Kd83ixu412E0bbrqT+8RzioF
         rSFg==
X-Forwarded-Encrypted: i=1; AJvYcCUp2snxEGiJDzvyzYJfrZIDZ0R2peKRP2FQb/04cMk/2qlarcomLqxuTrWji3f2bzPmvIyMp01EQSvZisg13mqgLAP6jg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxksai1L2vZhVpNesbYxchr0VA+SXhm3EOpaVLoJ+xTwdTv9w1c
	MIDZkttKgBafXhCcaitxXKp73Qy6XJUSjRNJVTOgMwKkQg1lHfOVZlhr
X-Gm-Gg: ASbGnctjUXV2VRt0K2tFobG9rItN0EdUyF4WURe8EmmAzF5QXtWdCm+hEw7fX9ReVBa
	J2PMZ70wJXhmtQ8SFN+it4rr+n1xBRiTyPVZVAt+49O7xJuEXUNc/iAeYJJ9SBhlX6FrSbPJZMp
	oNSbC1sySvv10i+Lqag3v7VZOvAglNbbJCmNGRybbdba/152EDGbt+dJmfitmq9DJ/7pBqJ+NyI
	KQdiof83o2dHroDCAYpyPlzoCe3zwmszDA9d0KisIK6y+m8CjZpKA3yM+fUQIPEZ+7OB3da/CDx
	n92SYEYiehtzgmSuoJCdhxJDvaPXxm/PqyZPOOKlYaql2yBKxcllDlfUz7hU9jEza6Upd8iqH69
	HD2zymZZXkiafh+YRdfTb564Vwtd0ID00+7qxmku1TZCKF33g3TJ1QoB4tLD0eN0+9zooiaUKyA
	k7Yqz49Q==
X-Google-Smtp-Source: AGHT+IFqhscQ7885gKuszm90YTf0KoEGYReUi6/2alYhWRhod7rmgZECRMNtrRBswwS4tMpqwgKgtg==
X-Received: by 2002:a05:6a20:7489:b0:32b:721e:ced1 with SMTP id adf61e73a8af0-334a8617237mr4808979637.36.1760698693905;
        Fri, 17 Oct 2025 03:58:13 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b639cc8sm25407571b3a.20.2025.10.17.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:58:13 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH 0/3] docs/hwmon: Fix broken and missing Maxim chip links
Date: Fri, 17 Oct 2025 16:27:15 +0530
Message-ID: <20251017105740.17646-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes broken or missing links related to Maxim chips in several
hwmon documentation files. And updates a the links that get redirected to analog.com
to their analog.com links.

These changes remove several warnings generated by `make linkcheckdocs`.

Patches are independent and touch multiple hwmon documentation files.

Ankan Biswas (3):
  docs/hwmon: Fix broken maxim-ic.com links to analog.com
  docs/hwmon: Add missing datasheet links for Maxim chips
  docs/hwmon: Update maxim-ic.com links to analog.com

 Documentation/hwmon/ds1621.rst   | 20 ++++++++++++----
 Documentation/hwmon/jc42.rst     |  6 ++---
 Documentation/hwmon/lm75.rst     | 13 +++++++----
 Documentation/hwmon/max127.rst   |  4 +++-
 Documentation/hwmon/max15301.rst |  8 +++++--
 Documentation/hwmon/max16064.rst |  2 +-
 Documentation/hwmon/max16065.rst | 16 ++++++-------
 Documentation/hwmon/max1619.rst  |  4 ++--
 Documentation/hwmon/max16601.rst |  4 +++-
 Documentation/hwmon/max1668.rst  |  4 +++-
 Documentation/hwmon/max197.rst   |  8 +++++--
 Documentation/hwmon/max20730.rst | 16 +++++++++----
 Documentation/hwmon/max31722.rst |  8 +++++--
 Documentation/hwmon/max31730.rst |  4 +++-
 Documentation/hwmon/max31785.rst |  4 +++-
 Documentation/hwmon/max31790.rst |  4 +++-
 Documentation/hwmon/max31827.rst |  5 ++++
 Documentation/hwmon/max34440.rst | 24 ++++++++++++++-----
 Documentation/hwmon/max6620.rst  |  4 +++-
 Documentation/hwmon/max6639.rst  |  4 +++-
 Documentation/hwmon/max6650.rst  |  8 +++++--
 Documentation/hwmon/max6697.rst  | 40 ++++++++++++++++++++++++--------
 Documentation/hwmon/max77705.rst |  4 +++-
 Documentation/hwmon/max8688.rst  |  4 +++-
 Documentation/hwmon/pmbus.rst    |  4 ++--
 25 files changed, 158 insertions(+), 64 deletions(-)

-- 
2.51.0

