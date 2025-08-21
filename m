Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630BD1F3B8A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 17:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755796755; cv=none; b=sLLhz2w9wYVzrNpCUjclvGJSKwoYsjfRe6QQX5v0ybl5H+EOAWcO5SSRQSWh1WP5vaSEHDyzqXVRHErRxz2hIKV8Owq64Tp1H0m0qaTd/Je/+VZQa5GwOfF65dfS2Dviywn3awyMjmdW7vWYmsuWAdA5tJu1x8Er+SefNRVpDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755796755; c=relaxed/simple;
	bh=kJOoCHsdPAISSR4HcFlHZ0fIcM/ZbT9tK9WAAjen35Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aElcM0QiErqTIUB0tvLoTfjJqvf9Fmx8Jam2EUql8qHXbSFBtcNU0H/+F6M2MV1y8g6S+iEJAJIvsqbMmgv4SbRyIbjuIzpYKm9mj7x2D16cPHZPcGLEjrbhS0kT2OJmLQId26Zu4Mg/aqIKbQRs3v6InDL+wdFHamaCF1Cy0EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9ne+pc+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9ne+pc+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e2e613e90so1011947b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755796753; x=1756401553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tcYrZ6OBHDvhQxq+aUNrUDX0E+CGMcdoNU7ZBepwhNQ=;
        b=Y9ne+pc+Bdw9xn6qsT6I/a1baYguf9SHk5BaYHDtsP3Xl5pGyG7SfqRN7rP7pXcdaj
         Y3pjEY/ERXfExFXOm1m0zYELHrgqJTJSkZsPgd5c54QQB8YGy7WnyudY5++3tN/LsEGG
         VMn41iMZ8F6lGOyviwFo9QsvH0ulT7jIEZf0LM/BnAb2jxvybTU4eELj7DdrDMJh1qH1
         kXm4tGM1728Nwm8EyLKRq6LM1TDU7fUkw4wnX5Q0X6fIt7ysiD7vUAmYh3OgM5p9BsrD
         9LVIW1qEHH1+LV2KrDFKsL32udRDYMu0S10wBnBlDWCHd4jCineQ+nYRJNVriRCateXd
         8jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755796754; x=1756401554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcYrZ6OBHDvhQxq+aUNrUDX0E+CGMcdoNU7ZBepwhNQ=;
        b=nTnEJbMaIhEaAFwz9BkZk4JA/8RETMHEb8tbo8q2Z2kqqShMNbl7Qp0QbZ3rkKdgDm
         cJOV99Gb7hQu57nxwvJu7cMVT5M67gShqB5bwb+zljKnvz71VdP+gUXhpQfUUnhWaqpw
         jGCCDBS/+nBHZmchb4udN6T/OPrqWy1CinWqMa5mOvPZ6lCYElrTbFOlm7YZB5q4VPmm
         NsehzTd7paarb77km3UpYazy9X40oJM3/31+i03ooI7vmtMuS7m5vkUXfUxnNXuAAuK9
         IiaZ66cfDVFqf8htn1OY1s1iN5H9+PkWakwsHhxBuIYWrQQeunYYK00npg3KAgLSgmpO
         7KEg==
X-Forwarded-Encrypted: i=1; AJvYcCW4/aizz+tpmcOTMGtIJV49LedXcTf1RgOonco0A6u26mppLXiiL9y29OhckRNORT+ZXUmai2G9tVGSOdmYHEkYhLPnjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/cApSlGJqD/19CZHAAWaZUc+cje7RKTIZuiIRq/PxxYUCW8YO
	hPt+bHTb1v7BOyXJRAExWfniF5cF0fipuPRnY5rhV8NX59qOlBws4yzYmAF12+tH
X-Gm-Gg: ASbGnctDuWjmA7BRPGoC0tFxOqXupvm7BOc8bDpBeMNk9F4YOlh5L2hYbaU48s7JrXV
	a1KpqzV/AD7idZ45GW9oSNlqSlRhr4lvZKLVtO0gzPeajICC0UxuSzfjLoGXzHRz6vmxGTa8gB4
	aJTVjYeUkwZyqHoYl6X6e0SOkrEjoI8tMmQOf/pEmrrtVyFVNqbpOq841V05OnFBiuvFgJie2sC
	m+DEEb/vB0Fb/7hZEhG3kLNH3mMGrVm+a2wKX+ehia64EWyMa9YYgb5Ba0DtC3VJcjtoQP68r5p
	SBSwFrlan8MXdLKPWP/5MtVVkv2KpXhiiRIbmeDEUUDhK0V0KVEllEOxNbipyFHaBaS/MJ2y7DA
	GXSJ7s5V0eTGtZRm+twKUDjPE6L/xtQ==
X-Google-Smtp-Source: AGHT+IHBucu8OwcgFnbMcDmdfHatcMrjkcrIifXC+JFyAq9nGFkI3xdW1Hyw9uXfRdw3ENPPJJZBMQ==
X-Received: by 2002:a05:6a00:3e01:b0:748:e9e4:d970 with SMTP id d2e1a72fcca58-7702fa091a4mr233913b3a.1.1755796753292;
        Thu, 21 Aug 2025 10:19:13 -0700 (PDT)
Received: from archlinux ([205.254.163.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d14e531sm8626591b3a.50.2025.08.21.10.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 10:19:12 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] fs/namespace: describe @pinned parameter in do_lock_mount()
Date: Thu, 21 Aug 2025 22:49:05 +0530
Message-ID: <20250821171905.10251-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a description for the @pinned parameter in do_lock_mount() to suppress
a compiler warning. No functional changes

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 fs/namespace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/namespace.c b/fs/namespace.c
index 0a5fec7065d7..52394a2ebaf3 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2738,6 +2738,9 @@ static int attach_recursive_mnt(struct mount *source_mnt,
 /**
  * do_lock_mount - lock mount and mountpoint
  * @path:    target path
+ * @pinned:  holds a reference to the mountpoint pinned during the
+ *           mount operation to prevent it from being unmounted or
+ *           moved concurrently
  * @beneath: whether the intention is to mount beneath @path
  *
  * Follow the mount stack on @path until the top mount @mnt is found. If
-- 
2.50.1

