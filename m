Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05EB1C3BEE
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  3 Feb 2025 23:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738626043; cv=none; b=CeKvQbnVoNgfd1Yfm2XTN3iagz9CtmQnZlWpAGwavt3APiBYiOjLxAzjICyP9fhi8otEjB+faV/Qxhvd7kEKr6/l0qUgXtJdk+BtYcd3JAa2VzFE4b9q4TtBmWPE5BLrCxOTzqSl0FThNrZ1MTeP1zP3DlOaGB4Nax5+OPbqDd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738626043; c=relaxed/simple;
	bh=f3BsEEtPPUV+ajFRLRTMbIpW7jqTWCoT2L5deZD8hy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1ViGigfJ5LjG4/i6cnDELEQjhHYXzeEGEZJDnbkFBiL6+2RopqsnBaIqB0UN8Sx9TeeRdVuhrRtVn33TsK88uJvlUepHrDOgBWgMn7otOvyb+CRJe5sv1mFprbAzAaS61W88aC6kK3ICY/MTi6sih1A+mEdyZIwE7773jZ33Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzntkKxr; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzntkKxr"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46fa764aac2so42763831cf.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 03 Feb 2025 15:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738626041; x=1739230841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xkxWJ8w08nwsB8NMEk+hWG04tNJwNZf28ywWg6CGAzQ=;
        b=IzntkKxreHhHJuQ5dtSDVqPa8wSqghV4+OUAxyy5X3l3OaoXnHHlvqLSNHZn2k1l1n
         PAXcj2TifpUHLbrtKYmXSgaiHxvHgdMqobK6rNf8D4DZzqHm0cpsaNlpLD5wukZpxoE+
         QDC4SxPu71UjxT/C/JdjaDJ4Wygv9ycIcw9Ed2lmf1WO1y7ZYlGd3WP0KjoNBiCjFsOt
         2uIOU/qqdZoQXEUUVOQLjEXF01UzZnn/frfjzg92/RwjShUdQvCOkwf2I9Fi4LLWSF/i
         ADUhR1QXq7o9xDX4bb86d96MbdJEgLz6PoozyWMAs74UhgaAUe47EfX/5v9dundxnt5u
         Scxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738626041; x=1739230841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkxWJ8w08nwsB8NMEk+hWG04tNJwNZf28ywWg6CGAzQ=;
        b=cm58svIVmsDtt26IkO4/5J6xb6D6wwzD8oLXaZZvcz46nSd1GASNc+fqSNj+8mDIpS
         BhuosLGoHJ5bzFNT5DtnODn8VaIexvKgxchEHrv90JtUJ5AZuZmz9A+dERlwaU8DvIIl
         OMJhRzV3sL47aj/XaPoHARwzWCDeNnSBKNirJhq9KCp7/pqYVZ4RLsDeC+NsI0dnq3vG
         drRL2eyBP2YGqy4AIGsIj4VXRLoQIpcGhBXFGGi8hsysEFfVsv2V8kr6JPVbC1gpRhBu
         DoxXDEdhXFo/whuDDTNswctoImowzUVYC0gobcrY2VcFUp2dlQ82mW5n5Qa8gqGqesw7
         3koQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbGhzMKygB16R09pwUUXunUIymcp+UzFbeburBhhf+vFLFLdxdHP3SFp8wfjuTK4saflhjsiF547xGva2342WGHJ6U2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yydq/O96QmTt9s3qMISitUwuJey6bJcw1golXNVgUD8PTV6oka+
	uDqsn23/MLh30cH/VbGZC0pxoG/IzKqiBhSJSy8U6ay3qMjecziD
X-Gm-Gg: ASbGncuvx27PUW5kYpLKF8GlbC7giGz+N6IAqyb4+1bszNQ4oszuNJOnQ0I+RRJm13u
	PTV37uw+RZxw1ktYCMqh4XWwUSinrgeqQSNl4Cj4UZbCOQn5Oj3XEZnH6KSh66Om8DZFW+mwLFs
	Jrl9qDgERJdJ/aDercysPRnZBhtodO4WQnUUkD1HXYZOYokRNGUdAYtDCVWzVhJM6pS435TuZdM
	4Os0kAA64IHBdBLsH5jlG4+espO7qYgVonZTl69HfXu93zHMAlY8uTpatp9g2oARFK8upoBlou0
	B61leC6zQD/83m00vaAsEXqWXBL+CfWjNZ4nC8qeoUVd+pvWqDlUqRdW2cJ43LI=
X-Google-Smtp-Source: AGHT+IETJWugQz7QeyhXOvh9JlbRz1lvTUvihDHYshGyEt5A6lRN2z6punlbA1cqEUr6X+bzpD5+KA==
X-Received: by 2002:a05:622a:143:b0:466:85eb:6123 with SMTP id d75a77b69052e-46fd0ac0867mr253104261cf.22.1738626040692;
        Mon, 03 Feb 2025 15:40:40 -0800 (PST)
Received: from localhost.localdomain (pat-199-212-65-31.resnet.yorku.ca. [199.212.65.31])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf17409csm53556071cf.53.2025.02.03.15.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 15:40:40 -0800 (PST)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: linux-doc@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	corbet@lwn.net,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH] drm/doc: fix minor grammatical issues
Date: Mon,  3 Feb 2025 18:40:46 -0500
Message-ID: <20250203234046.5114-1-ImanDevel@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following grammatical issues have been fixed:
- Corrected subject-verb agreement
- Replaced incorrect noun "setup" with the correct verb form "set up."

Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
---
 Documentation/gpu/drm-kms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..6a3ae069c829 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -6,7 +6,7 @@ Drivers must initialize the mode setting core by calling
 drmm_mode_config_init() on the DRM device. The function
 initializes the :c:type:`struct drm_device <drm_device>`
 mode_config field and never fails. Once done, mode configuration must
-be setup by initializing the following fields.
+be set up by initializing the following fields.
 
 -  int min_width, min_height; int max_width, max_height;
    Minimum and maximum width and height of the frame buffers in pixel
@@ -253,7 +253,7 @@ rollback:
   should not interfere, and not get stalled due to output routing changing on
   different CRTCs.
 
-Taken all together there's two consequences for the atomic design:
+Taken all together there are two consequences for the atomic design:
 
 - The overall state is split up into per-object state structures:
   :c:type:`struct drm_plane_state <drm_plane_state>` for planes, :c:type:`struct
-- 
2.48.1

