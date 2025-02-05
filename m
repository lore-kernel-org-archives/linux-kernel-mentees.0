Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF95121506B
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Feb 2025 05:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738734639; cv=none; b=vA0lwiKuUWZhRx/WXlMu+5szSHIUysQlUSIkWNPisEXrwwIp/jJedDJNC0WSsMmunZUS+FhIOy6X1dbPha1T98P07JzAfQRd1CRSnZREl1QsOW9ovrX3u/0pfYab6GcNQYOK94Q6jDCP4yodn6oG/HYa0LpQBg/rgToYnJqy+C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738734639; c=relaxed/simple;
	bh=hoKTiFNJga4k6kDkzlWvbfX/wG4hbP8zEshGLRIq03I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hT/SHylDaRSeyTi/1xzNBk5/H3AqOVwQ4Lk8gyxZekoE1jM1uAHxyRG4OqQJpQzTo3Xi6TsshV4Wz0Av34hNQAhayh78lVptpJkpOgwJEHIOCo41hfZDXV0CHoiDUzJgwQvFqG6W5gNEvSgSci/r3o8tCDukvrfjEWpqQ7OefBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCAa/LaD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCAa/LaD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2163dc5155fso112488805ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Feb 2025 21:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738734637; x=1739339437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5/8WaG5xcausJczSDu1PtwlsotHm7UZnGjCaIMeLMRQ=;
        b=nCAa/LaDuw6ZO7+MwaClxMJYt2Mw6sKfFIaSPjuUYSEWGow5ltWu0CM29/jOriyWtp
         qst8c+vA5PF/a89rk4oXNkTjkl68/o6RcZIRRF0g+uiWq3aFTFDPf4xTrhjupHhuB1TH
         4f3rRra7Jnpfaxny62o9lGIcQctQVi9SP9GuW/Cm0EbTCAhWPNHMGrRLy+OmXhMmHQZC
         BAdUP5nlNM917efG1bzAowc/P3lyGSHIy25bkXZxdmuvjABJf+NdC+TcPy0nPU3YVoVl
         7lZa3o6DR/uxYoDkF2E+/DjzO4m23jSWiQdEa7N4qEWnfNoJ+9O9nCueZiAZPW4NK43+
         HbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738734637; x=1739339437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/8WaG5xcausJczSDu1PtwlsotHm7UZnGjCaIMeLMRQ=;
        b=Dw0A0hGFKWtjnhCfh2cLcpqmJ8rKHNKl8Lzvt7zJgdjPZ0Bd2Zy3hU7c1Lj+x1qPAP
         dP3l154gEP672oK2wZkCx0wLpkJXLrAvsMmDMXTjqOI9mayEgGSSdWCpzxqUJOLHtGpI
         U4J554+a0kDSfXCiii4fUmp+qlR21yV93mNFCx9ReWJGaQIIWNa8J5n4kpypwmRXqZdU
         9P3jSRn+vJ43lpvogaIgqxAwAFPZp8hBqJdF3+DLKKQnXrVnWsEw29SrbVnrBcmrDj4g
         qOuxZIu5UtI12cvcaSvZ71GBzDQ3+IOB/bborn3pc/JW9z/Azykah7zvCpa0SETwyFAM
         93ig==
X-Forwarded-Encrypted: i=1; AJvYcCVClHBIxKnZtYjbI8xDE86bF4gRv7hJF7VUbqVNnUw6v18nFnNbN3lIZZq9ym3A53UZYvdCPsyODEYkHjxWgJbrnQtOJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMgYMHkHCL0dslgC/Pxz7xgintTTLjN+VnaEq33xQXs2SO5SI2
	AJ+FViVMI8IxJrYPQrLj9s0V0URJtOJk52vCJDJpTgdDF55kFvcLSdckL/BR
X-Gm-Gg: ASbGnct8yVeDPsIVEbL0LZXu6j7tjKxLQUnYdhniCqOADPFuMWKY/Dd3UKZbXuQz4Ez
	piJAdIEE6MHALM2bWPLR7LRarzdSWb+7Vq8T2kS7VodnUoFpsUlCgRYj8jUbZVpH4SadBHPnTfB
	sqLk+9btXqLX5QnBDC8F1Cssi6Bbo6Mxr2VDWP7CaldTXA/VfdYr+bE0PF1dMHAQ+VhYLvI9Vif
	xH3/fDw5h3aqqgGM9fgIKeC24d/SwenCNOHBDwyrWC4A81EoId926AaGgnlSJRJkWQ/ZGlkn9OB
	tW6zX++B59c+ilpRSYuNBSNoOnEhX0DpOFM=
X-Google-Smtp-Source: AGHT+IHUdRKgQ964UqJ7mPGegV4qUHNbriO8kSyM/D21jqtW+YJdW+LM/Z0c8Ulzu+ph57ZFYLEkHw==
X-Received: by 2002:a17:902:f64f:b0:215:4a4e:9262 with SMTP id d9443c01a7336-21f17dd6b37mr24252835ad.8.1738734636869;
        Tue, 04 Feb 2025 21:50:36 -0800 (PST)
Received: from vaxr-BM6660-BM6360.. ([2001:288:7001:2703:dc5d:87af:eca4:905a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f06e7d4f6sm23298345ad.112.2025.02.04.21.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 21:50:36 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: shuah@kernel.org
Cc: brauner@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] selftests: pidfd: Fix compiling warning of pidfs_setns
Date: Wed,  5 Feb 2025 13:50:31 +0800
Message-ID: <20250205055031.259710-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the compilation of pidfs_setns_test.c , a warning as the following
will pop out.

pidfd_setns_test.c: In function ‘current_nsset_setup’:
pidfd_setns_test.c:173:54: warning: implicit declaration of function \
‘ioctl’ [-Wimplicit-function-declaration]
  173 |                 self->child_pidfd_derived_nsfds[i] = \
ioctl(self->pidfd, info->pidfd_ioctl, 0);

It's caused by wrong import of header file <linux/ioctl.h>, fix it to
<sys/ioctl.h>.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 tools/testing/selftests/pidfd/pidfd_setns_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/pidfd/pidfd_setns_test.c b/tools/testing/selftests/pidfd/pidfd_setns_test.c
index 7c2a43491..3ed42f1eb 100644
--- a/tools/testing/selftests/pidfd/pidfd_setns_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_setns_test.c
@@ -16,7 +16,7 @@
 #include <unistd.h>
 #include <sys/socket.h>
 #include <sys/stat.h>
-#include <linux/ioctl.h>
+#include <sys/ioctl.h>
 
 #include "pidfd.h"
 #include "../clone3/clone3_selftests.h"
-- 
2.43.0

