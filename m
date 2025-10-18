Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF26225A29
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760806703; cv=none; b=PNu7rXNIFiEezYzoCk6ZIUnPiTsqiI0j1r2Se51UwY/L2j+8lKmLBWFRuuMbDE/cBBRUFAm5/ya5Tr8TtlgnCvFnaVyQ65WudPGOQW8XI5B+ZAgfS4qFkPnqosoAMCn5cHfthFKKfxZZ4U//34uq9xiGQlEDC5rUpUQXzE/qrWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760806703; c=relaxed/simple;
	bh=XmnewOa5kOv9A8PiFNHvc/4WhDeZEr902sYESOj6+cE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DLfJTA2/3FFgvsaWaDNWv51shoXd9NIodU0HOr9CWPzJPIOp++uZXAmauXia7grJrq3XMWM+TiVZcLLWmONp+C2xAtlMSvHrOQwMHtPeN0ziGKaZqAG48sgMrABs4DlZv+fwjzEEz6nO8uyK/NvjGywFKST23OQr2TH4SS/Pdc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FysOzpDm; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FysOzpDm"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-430ab5ee3e7so10099045ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 09:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760806701; x=1761411501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L7fSCgt2SjB2mGlHB+H5VapQzGA1nEVjQynnqFcyw14=;
        b=FysOzpDmh+VyMhJcJShP4VPTEwAoQ/3/Y0RLZhGHfTgfda5Ar9n3QkyJSRYxbGlGDh
         l05FSEfIy5MJlAXpt8l6hf2qPSSM+EKbU6DPHuIPuOklhEYJ6LafWKaF7x4BEEnf8jrv
         /c3z70grFtGtxcLR7P9DlF0TNOYQdO5wtRKW6w45H+crlBAG2AFoLtueDnpyiKiYFnJg
         Ar3/WJM9f6y7EHesitxdXYmT9tzaGo3+s5omn5BCe0pJB3uuxuvZ9w8+BeiT72/6ihNy
         MbQXbPKdS/jAETcJc/C0PnaHKheoIr+vdynRrJfNvg5WkdNloY8dxN0o0oWmV0wDmX8G
         t1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760806701; x=1761411501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7fSCgt2SjB2mGlHB+H5VapQzGA1nEVjQynnqFcyw14=;
        b=PbzJVhIZRychGtxjo91a4BW3jLESPzXfrd0nHnL7iY1bpl8JU38Aj5LfPnHPTfVhbH
         061vjqpGkr11OsDUzw9kccqq4DsMVGriIH4G+UNMv7c+gFOFHXboBuTuX81SNkrnCtK3
         un5Hqu+5DGMMVsMguvA4fLb/WPOVjzTmrSIPIqn54wyGZGSkxMy5muoGFSelNYId+z2Y
         MwtUMyqAQf3ZmlEdv/bB25e9l3wT+Dj0mYe83Nuc/aGA5EG9Lc/69K5NQmyslk4vhkb2
         3bb9RTHkzy8qY9UG4HpcU1a88dNmUr9pfVyIF0jZs2IaEsBXPPrnoTOv0cZP/fT80YNx
         UQzA==
X-Forwarded-Encrypted: i=1; AJvYcCXH3LdE/XGsqsW/US4SQuSotd5b38sIsNjeruIxvwo16H/leftLt3VXpxIx8UrnR9W/BsCBsFjcjN1EMs0yvgAO7/hnMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpJrHFyzbPjuu9mNt8UghMcj96lOXfkeYYAQ1QpUKMBM32j4fg
	bDeX1pLLTXhGjZ1Vn7hgGDkEVDf9lVEPoNZJBnM1QrEbqbEvTOQHfmcu
X-Gm-Gg: ASbGncsfH44vD4lFGXr7eN7jihdzwT/Ff8BmyJCbVg/Szqe6aJRgk4C95HpHCQhF1S6
	YztpgmPy3Ze4Is0zb97I5kQzP8pFRKcMuUbnoRx4K2e8hVrMPXWTnnNtWu7lEmX005eJGwFPpPB
	IN57yC48nGkzWfx29ppsaOCLHw0bp/wRxAq/cQdPZFANYEwVQ3Y16eu8nTKNDjIn1mO+slh7neL
	//akWRkLkgHb34S0ve9/3iA0l8yHct9C8ZUg3wLxPE/d41pv8bywgZnkJVm9aauT4qOZ+UMtlK1
	OipMf5k2xoaoCWdpCI+yZFtGIcycpck2IERrKq8LDw9J3shCm+xZ121J0GRqOTSQbAnSwY1vFvF
	bwtURYCI0M8CnHfUb+M3po1yMCHUsrlogX6c8GRi2wPUDfr9xtVd3V5D2KPpUMMuJaY4yQJDzPN
	PwrpCzwEfyeEa1bRtnk3fk7aebvaV++4bxUwgAOSA+voHVJzBV
X-Google-Smtp-Source: AGHT+IH1fopTouG5+V7fvyEClHqaGvkgn74QyqIeIeghW5gwvAbGx180ka2Rvu91VrM6a5ll9HGPAA==
X-Received: by 2002:a05:6e02:190d:b0:42d:84b3:ac43 with SMTP id e9e14a558f8ab-430c5241c9amr122700125ab.2.1760806701346;
        Sat, 18 Oct 2025 09:58:21 -0700 (PDT)
Received: from nairdora (108-75-189-46.lightspeed.wchtks.sbcglobal.net. [108.75.189.46])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d07b4614sm11927545ab.33.2025.10.18.09.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 09:58:20 -0700 (PDT)
From: Adrian Yip <adrian.ytw@gmail.com>
To: stable@vger.kernel.org
Cc: Adrian Yip <adrian.ytw@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH 0/4] drm/amd: Check whether secure display TA loaded successfully
Date: Sat, 18 Oct 2025 11:56:40 -0500
Message-ID: <20251018165653.1939869-1-adrian.ytw@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is a patch series of backports from a upstream commit:

    c760bcda8357 ("drm/amd: Check whether secure display TA loaded successfully")

to the following stable kernel trees:
  * 6.17.y
  * 6.12.y
  * 6.6.y
  * 6.1.y

Each patch applied without conflicts. 

Compiling tests will be done for patches as I send them in.
I have not tested backports personally, but Shuah khan has Kindly offered
  to test them.

This is my first patch, please do let me know if there are any corrections
  or criticisms, I will take them to heart.

Thank you so much Shuah for providing this opportunity! I'm very grateful for it!


Respectfully,
Adrian Yip


Mario Limonciello (1):
  drm/amd: Check whether secure display TA loaded successfully

 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.51.0

