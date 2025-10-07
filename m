Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE57E2EAB82
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863373; cv=none; b=eD8xD88ZBBCFo2SJ8EpEusz63Zn0kL+K9RJ60i3mqieg3kzjPU7lrBJPgpwW+q1HWiKVw9/iQ5reJLs7qfqVNNDSafwXc1N/vjjrxJBiEVfos863YI9dsRZyZDKkCheP5vJIyTSVNYMVD/e8IG83SJL0u53Zq3UdLwRp+AZCsCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863373; c=relaxed/simple;
	bh=PjvGj/6WIMKxEW1Znvw9l4eMpfWYkHUzapNNIm/1GK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MtCsDzMpn4fbvN5qxLYJyOTZyarnj04N/y+Ano0gc8QV+TdyONCeAuTV0n5xNmgM5ZMfYFvk7mFAxhkro9HORj6WDlRu1jdqSxhKnvh1ZLMZw91BhjGCLp23qwG/ZBAqDnjUJ9WuIlCxBvnUZN39gfhrJaSIiGK21rTkBbo/ejU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fdtvc38X; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fdtvc38X"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27eceb38eb1so69645765ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863370; x=1760468170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUZ9lhN//CkO8fifdX7p4qPCDwEbbiKFsiRCmbfFYRY=;
        b=Fdtvc38Xryv+cBPeHtfalvl5X6lPUD2fp1N+TgNrKgSKasWrB58Zwo8H+k7HeLuJe8
         5yqjzIYAV8emZjcWSfivk7n2LL7BV3Dmt8cGQMrAB2UCxhNc1aIMHjgt1WjO2ihdK17R
         zVUiAFe34YYN+9o1oyThd5RRJfHMfrqN1u5brOAQUXxcOExw0Ir7HYgWSV50KRHpUISv
         LmsWjsqNve0xZf8Le3b/9obBGsqTChEiZTATRQk1CVB9b3Wmu5GiQ7BjiqyJAPAv/mTU
         Xa1vGGQGQIZ/l1obeWKFrAEFmWSXDGcKMQ3cKOq4yUxsSvW3FhL46AnfI6PrCkDOZxJk
         q4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863370; x=1760468170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUZ9lhN//CkO8fifdX7p4qPCDwEbbiKFsiRCmbfFYRY=;
        b=Y/GqVKfvK4sjaPxas7nWAto4z1zq7ocEY12itT9fPiD2oq/bE0jnQ+0wpwxmzHwLkI
         zoraPyPZEAvjB7l5O+nWgbg6lVoeCZ0vMlv3nhhtrUAsdkBZTlc5MtYSj+T6gCqJ7urT
         UI/vys8uVUs7MWZiiaYEYj2u/uaOEZIjFJu7ekUlVZrQa8ZCVsQVjctkhgmMFi1Depch
         xV6xYoDTbQv/RMBxLuITZGsEt5qWQddgtsmxOPFQnVOtPb89SaFTyjGvk7R4EsBsH4z3
         CQIGZlw6Pm9sk5wgewGdHhZIRaSZ14tFBvn0dyjdELl20hjPcFeJsTRmjV5PgJLckAhy
         srVw==
X-Forwarded-Encrypted: i=1; AJvYcCXeHxXkhte0Qa5dF9tKyxBZrPzwiTzzjz90prWj82FdWVyNVxcrUJVvLKambYky9aSCLmw70m/w+G+NQb2GAjIpHAGLdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGdRX2huzLb09F5xVwWF4vK3xoYbIdAS7R2vJQ+nP9SQtbizml
	lWRsJnBMT+sEZCo5D4CRrvE4NowN3tVErHoLoLRKUv2ffmqvdO4E7BF5
X-Gm-Gg: ASbGncvAm7kGhvJP1jWqwDEb6keHi9CddCaVqEMqZ2mIifGeN1LX6bh+2E/CDq7T7v8
	vB6y5PqbvG/AetXWX0ac6lSCqH/BY+tcZL8uRYOSzub9C8Lmg0ugfz36Kz6pyk0kAd20V30uQ5m
	J0MGWBrMCRmqUPHaqHKjU0zDCLjV0682aJwIvJkkT1vFp4WYcwpjNIeQWGINiKdmKd90dEW4djE
	0gfyjLMlt299ePDP2ezIKXxSyzetwqqDSKH9TYKWmCYCehA8vz0Oh1UheRv2Q79bwG8vfDrezFh
	N37XkRTQRb7ZDNeEMnKMO3ZT9ZBxl5yjcEjNQ51oUqSpCJkyf3cE9Lmji/EA9FhL/y8Way8f8DE
	FXiRIodAfYXz5tlGaQaruAA43bQoOxuspWs9vk6nyilz40+A7riYZ3ZGg8aeQOKt/60VKSFACfv
	TC
X-Google-Smtp-Source: AGHT+IEnYwwHsTgb8eOLfuclxtTGN0ot15Hmrmno3ONRkkOazFE85QNijokyUfk/dnUFfALD7cwZbw==
X-Received: by 2002:a17:902:f64a:b0:277:9193:f2da with SMTP id d9443c01a7336-29027356c8emr9333545ad.5.1759863370227;
        Tue, 07 Oct 2025 11:56:10 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:56:09 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	crwood@redhat.com,
	tglozar@redhat.com,
	costa.shul@redhat.com,
	jkacur@redhat.com,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 7/8] Documentation/rtla: rename common_top_options.rst
Date: Wed,  8 Oct 2025 00:24:56 +0530
Message-ID: <20251007185508.40908-8-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007185508.40908-1-krishnagopi487@gmail.com>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

common_top_options.rst is intended to be included by other rtla
documents and is not meant to be built as a standalone document.

Rename common_top_options.rst to common_top_options.txt to maintain
consistency with other common_*.txt files and prevent Sphinx from
building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../rtla/{common_top_options.rst => common_top_options.txt}     | 0
 Documentation/tools/rtla/rtla-hwnoise.rst                       | 2 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst                   | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                  | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/tools/rtla/{common_top_options.rst => common_top_options.txt} (100%)

diff --git a/Documentation/tools/rtla/common_top_options.rst b/Documentation/tools/rtla/common_top_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_top_options.rst
rename to Documentation/tools/rtla/common_top_options.txt
diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/tools/rtla/rtla-hwnoise.rst
index 102654cc0c78..60a237de1e2d 100644
--- a/Documentation/tools/rtla/rtla-hwnoise.rst
+++ b/Documentation/tools/rtla/rtla-hwnoise.rst
@@ -31,7 +31,7 @@ OPTIONS
 =======
 .. include:: common_osnoise_options.rst
 
-.. include:: common_top_options.rst
+.. include:: common_top_options.txt
 
 .. include:: common_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentation/tools/rtla/rtla-osnoise-top.rst
index ea0e9f5a5c0a..8a852949df21 100644
--- a/Documentation/tools/rtla/rtla-osnoise-top.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
@@ -28,7 +28,7 @@ OPTIONS
 =======
 .. include:: common_osnoise_options.rst
 
-.. include:: common_top_options.rst
+.. include:: common_top_options.txt
 
 .. include:: common_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 32d33c792dcb..7dbe625d0c42 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -28,7 +28,7 @@ OPTIONS
 
 .. include:: common_timerlat_options.txt
 
-.. include:: common_top_options.rst
+.. include:: common_top_options.txt
 
 .. include:: common_options.txt
 
-- 
2.43.0

