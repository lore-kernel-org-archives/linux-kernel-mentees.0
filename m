Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1A430749A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764786097; cv=none; b=YNU3dOPALa+akUrm3DFZRImdkyzVtZcKBLK+X8x07wpqdU1pNmNl9gSLMD0tAgR6shtEN2JVLvGVlezVIQb7kWg/rKHi+iij/nqJWGbiHzxDgLLBW/dkrMSthk2oztWNXudzbfAVjfpEu72LwbVD6ippzkg4PFJzrZLqhaN5em0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764786097; c=relaxed/simple;
	bh=XJ1xcMRdMwOsGfdAXpF2A69QXd/Mrs7f+S0GwB+Q0zA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tK40/bAlm1tYeypIRiBcSKZYphyxpWfA58BC+bbBFyLm/u5EBESSRLMf1kifNt8OwiipFVZDaIUXQeOxWpmN9KiNZYumDuqKpeVQTMs1RQqyWoS9mTnMMzofQpSZnRJ6vaBpQzsyoVBDxl5I2DwOHjzfwkusZHcLThP8ppknkaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liA8g/9x; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liA8g/9x"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42AF48217A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gYLrzlkaa5l for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 18:21:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B245A81CDC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B245A81CDC
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=liA8g/9x
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B245A81CDC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:21:35 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29555b384acso844795ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764786094; x=1765390894; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TA5KgmV06QkZagHSOWVDNWdYVxZvmkjGyikqKY+khMg=;
        b=liA8g/9xhHCewJDO8RiQdhzuuAxpNl9VSQtaeKL6UpD/ilYeqESxvg8tyJPs59i/Kt
         Qj7Y2FL5U3wYjfHvBt3J0tQ2F9Jqad9Oh7rEHbWffCHzFeeVCsbrujHcGdHwI+cYFhma
         nQXJb5GGDCSAFCx6VMGmzmdyUZw9tcXJRKxHNCKzM+SaMgNBbbRaf7dVDnzFVJlxTc4n
         qVQ8u8lgVOJu2KqQCkSK/s2ZikF2a0rD2A+MQhSI7bydlEwSIkNPC3W0JXXY7BjMIXfH
         /nOm04OPwkwKAN4Hh7//P0UiA1l6HUpY/VGKO2JN2ONtDktgCJ/MDc1pEBdnPKOvgsPj
         B61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764786094; x=1765390894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA5KgmV06QkZagHSOWVDNWdYVxZvmkjGyikqKY+khMg=;
        b=MhTM/RpH+UmJp49cXVTJRBaTo6Bwxt3dSfl1Y7zvt0bIBIAxC06gsL0dguuPtZXKBV
         mlVXtNunl54VASoEuvGiQ7s775o4hb1dUAfUHAxeaG2JgKefIEDVmqHEEphjwem39v1a
         THE0r2ckmHbS4D2REzHj/9VslkkZkcccu9UWHzhJ6T9LE4yepl96ZBHPaH+Ll4aW8yfC
         p8Im13ZNbTmJClNgY9p4M0oN4YFU7GCzWDyy8d0K24+xT4VudX66U5nKXbyFySwy61Pm
         11V4hso1FiIh3vmgiTferJBrOzZxMU7G/uwg5s+IZOMDrpXzPe/70NNcc6n3WO7ZMW7w
         w28Q==
X-Gm-Message-State: AOJu0YyNZ3E++2jslkyj43WT0HtkQCvDTp6a43ObpYv6aAzkyPQ5555w
	vyz6zsMdzzywWMe9iCJ5aKEt02Qq7YHU7uj9lE1IShSUcwWPFxZ/6IBI8cqqRw==
X-Gm-Gg: ASbGnctYGgirGgQZV5MDVaOSyGygrxmKZlLQZGbfA6/wkuQbOj1Bue77PWESdsRGogD
	0D0/4gxYrrbqhQGBL9qYZ/69rOoWYVqfRc6A/rcVVAxOyxbLa7XRwySUnaSJtIEAOk8tKmOLfQ/
	mUF7MEvqMLItpz4r+LQ/E0OR6vSkfZbTzmmTvJlVLHFXWBMDZxLOh312qmbx9ynl9A9JEDN0rpD
	Nw6QKUmR7KSWJ9CIM8q9vgR6DeX5wGXVz4gSLacrUWBe8CpcR9Z5s2GB0XMF2CGz+wxbCMCK8LO
	rgvSykIz/dB5R6ZOHTtYxbTRnyVXyWfZOCZ+STm53Hb2DXG/qgpjI2K4+CDYx1/1NNpvJdx35Rk
	oG83ZAhrJZMbuYDd8jFl7T2LQBcuntxZbpHbzK0hI4LE6y3fZphnmyRTTsKNdwE0AlUmjIg8QyH
	ytRd3lxq+zrj4SKhTJEnA=
X-Google-Smtp-Source: AGHT+IEJzmJssgbrkH8WJ4QU3sLFJzLPnML2qy4GAU7o/LHkI5r0URBsuV/jtiXbw3XNi9hrDB5Ahw==
X-Received: by 2002:a17:903:90c:b0:27d:c542:fe25 with SMTP id d9443c01a7336-29d683afcafmr41970015ad.41.1764786094501;
        Wed, 03 Dec 2025 10:21:34 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb5c6c9sm194659425ad.97.2025.12.03.10.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:21:34 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] Documentation/rv: Fix dead link to monitor_synthesis.rst
Date: Wed,  3 Dec 2025 23:51:21 +0530
Message-Id: <20251203182121.52759-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file 'da_monitor_synthesis.rst' was renamed to 'monitor_synthesis.rst' in
commit f40a7c060207090f41998025fcd1cfad06ea2780
("Documentation/rv: Prepare monitor synthesis document for LTL inclusion").

Update the reference to point to the new filename.

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
Changelog:
- Use proper commit SHA reference syntax

 Documentation/trace/rv/da_monitor_instrumentation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst b/Documentation/trace/rv/da_monitor_instrumentation.rst
index 6c67c7b57811..b847c58a96b6 100644
--- a/Documentation/trace/rv/da_monitor_instrumentation.rst
+++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
@@ -168,4 +168,4 @@ The probes then need to be detached at the disable phase.
 
 The wip monitor is presented in::
 
-  Documentation/trace/rv/da_monitor_synthesis.rst
+  Documentation/trace/rv/monitor_synthesis.rst
-- 
2.34.1

