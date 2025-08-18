Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94231B120
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755536353; cv=none; b=PV1NzApVDMruHKyBGfNpaS63p6vd7VOMwZ/HrY0uEFVs77gaKhVhj00CZI+d4X8ekPG9/Xz4eWjGx7Drx0XOy/kmefzoI9XQIvM2IfI7qezU6ByHMGTDSLYauzPeDrb1Zd46GEZjDZ/TNro6yMsGVyUEYKRho/hxhHaDosdCI7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755536353; c=relaxed/simple;
	bh=hvWF7JYb/NT6NjrWsi+C2CamYyOYq1huqLf7FL8eeu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXYZwZiQuY0dwGcQ3epuWtJ67zNSxaYsfN5rRBwvph87h3WOmuoT2PkQr4zMK4DvODZm3S6tLyXQr0r8tf45JmMswlMvn5RYAOQaHM7AOxnwwPXnk8UHNjU70umQI/oNUiWw3ocFql63Aqd1gPtWD7FCK7msG7fzKXCC+22ZGr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/JFIT2T; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/JFIT2T"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9d41c3a44so723295f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 09:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755536350; x=1756141150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MNHN2y3kvvIBusi8bHgrf8v0j+ZG/qfGVDUkX4hdhAE=;
        b=e/JFIT2Tl9nAJJEwAN9dUucclKBop1KgUaswc0cZF6plWWjG9LIWo8Y3J8h8Qhc4wq
         Dx7eYazAWVDDhHfTICfY6aqDik4gXyh9SzVl+hvBF2wXkkb9V9Z8i5ka4YC+6tVCBsMZ
         VzkVZhR36qB5CjYi/f54VzdOLX7JpPqo+Zpun9qH4SbAbuZSNubZk2cxjs2yitffZ99s
         9ZvqGVfizqbVe23Q1jz/z2vk5DEnqySkCuqGwCEUY90stb4NjaXemIcS3gMiSw5v0UmS
         r8ZvKmxMUT/T6xyd2DhbFKQ6KC/pmvTl5o5LzKDFz6/LH7OuYK8hpXa1pLhzQ2p//aY+
         0Jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755536350; x=1756141150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNHN2y3kvvIBusi8bHgrf8v0j+ZG/qfGVDUkX4hdhAE=;
        b=L2RSc/gHtOErWHeLQXeCFVq0v8KfZYvt7s9DwUUm0aOUQ6HbqB1SbWLUsMztVi/C9p
         2GgoDo380hyo6AHx3ePXYvD9IqC/HVdj3DDfP47jPcV3OHRq2d/0jZQsH4nSwdSvO4zu
         iGZrXzHzCyiv5W6x0RZ1RUkLVuVouEdUJxYhuNcA0aj5DuMVb1Aagjt7w829WQ2RSoZR
         4xgxx/M7kc9S5EStrG00JKu+yGbA8LjXwarDFpxdjYsxEmQrGHcjLgrT9BoZ4v4E7eNh
         8wBc6uYKP8eF9ppHdsQcFb5NgWKNNSSgqR2n1l8N6q2DzzKxr83OGL/fNB3epb57l6f5
         Ulrg==
X-Gm-Message-State: AOJu0Yx0a5iK/2C2TZrnUXx7jhP7K0eFh2hv2d7iXan7nJW1OPEoaTxC
	7UrzLT1HSs1nSgeEwr+XPrNEhCR4G5oM6ccgS7RDiNgczL7FsZz/jvxy
X-Gm-Gg: ASbGncu966Vm+0kIZG4WOr1XzITO/xnz/qB5BGUY8iHyWZyurru1bULdlIrFclApuVn
	cMiFeRt6hXAAfXzkNMt55tqY06KgBrNgGXT4W+ysxE4WJArCDCDIpP6gxeD4ei4edbiOtGqSJmx
	ncpAe9EQBK4VLRIraRYiRPxYQri1oDWXBNFxiOf4/vdcvFNwDRF90no6Cza6gARXUamevNBIr9d
	FV8Yf+Cta0a/RFGGEDSkt2Qt0ZA0/y5cOBIVqnFAjLZMcowVX21XcO+B2XFN7H5HBWOzbnMfN1F
	7VZtv/dZkabQgoZNGzj02foJEwPtXPMYsSeAX8NTYMmp7IAgjrN0ZqO0u/EkOJEQ6dUuf1FBSZF
	AyHnrVrf20dUyYZfsmb+sjqhaUQ==
X-Google-Smtp-Source: AGHT+IHBEkadS1VQN2pE0EwEl621pfr5MUW/BtFqfQ+QCE7Wy1xjH1dzMOwSPSr00NX3rwduptkABQ==
X-Received: by 2002:a05:6000:22c4:b0:3a4:f7ae:7801 with SMTP id ffacd0b85a97d-3bb6a521e09mr4928604f8f.8.1755536350247;
        Mon, 18 Aug 2025 09:59:10 -0700 (PDT)
Received: from bhk ([41.231.66.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c07778939bsm196056f8f.46.2025.08.18.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 09:59:09 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] Improved some ftrace tests descriptions
Date: Mon, 18 Aug 2025 17:52:51 +0100
Message-ID: <20250818165856.47009-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-Changed pid to PID to make it more clear

-Changed 'restricts' to 'restrict' instead to align with imperative form

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
hello,
this is part of my Linux kernel Fall Unpaid 2025 mentorship
tasks more specifically the "kselftest task".The changes are
very minor and are only improvements and not fixes to existing
spelling/grammatical errors.

I would love to hear your feedback.
Thank you for your time and patience as always.

Regards,
Mehdi Ben Hadj Khelifa

 tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc | 2 +-
 tools/testing/selftests/ftrace/test.d/event/event-pid.tc    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc b/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc
index 9933ed24f901..aa83be738e69 100644
--- a/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc
+++ b/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
-# description: event tracing - restricts events based on pid notrace filtering
+# description: event tracing - restrict events based on PID notrace filtering
 # requires: set_event events/sched set_event_pid set_event_notrace_pid
 # flags: instance
 
diff --git a/tools/testing/selftests/ftrace/test.d/event/event-pid.tc b/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
index 7f5f97dffdc3..53d914986394 100644
--- a/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
+++ b/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
-# description: event tracing - restricts events based on pid
+# description: Event tracing - restrict events based on PID
 # requires: set_event set_event_pid events/sched
 # flags: instance
 
-- 
2.50.1

