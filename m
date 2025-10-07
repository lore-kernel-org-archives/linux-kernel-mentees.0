Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2022E7F27
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 18:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863338; cv=none; b=lcm5KHKk5bUA9Sa1VklMkK76euQWZtm2frUoeAYoDtT2uY2BjrhlDrzDSTP3UPfWySFHn2iBs+mmDT6LlaSIhfGrWteqKVRvP6yAvVlmhMfINaWIq9cRIkpBfUMl8INkEv4e5a3IGnfJnSE9ErC+sTEBuANzHCX0gHQJ4oIJQxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863338; c=relaxed/simple;
	bh=KWXkMIAyDYXJL9ZYFoRhKKia2rw51cLLtwlRksRSZ8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwjXChRHbXHmSO+u8CUHIVOc/CcavMF63wFQFevACAWHUgRBLkAWb/6gX5eUj1LOkQGPWdZ2CqvDNj+fv4j0rcvG9zMay4DctEBZmhI0I+jcW7qAU27Xcu5GO35LOyhXRqkbc8+4e07C6bFZiIDRLkcFPrmUt6e0akLRogFjLoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFnG4Out; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFnG4Out"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7811fa91774so5000928b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863335; x=1760468135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiI8ma/H7AR+p7UC+KuFxeAt/GicErH37Q1yChqPrPA=;
        b=ZFnG4OutpLQMyf6yKw8nMqiLc/KRE3mzF44y5ldd6lserxPQmsCvuWekX4BDH8ROl8
         VYxUve7gd6zwAZybAV+3xSW/YsYzkISqMdsnboiwdGanby3se6NGJtPXBAgoqBtO8KN6
         GI16uWbMzb/YvgZGh/29fsNn/plkt+ADW4nN6z4zdvPjVqg62yeJlK/CCsFugK3S2Hei
         DW8A0UGJM/mPuhpx4bGg9m7OoCAh3XDDojzsbrU6BZYibaVzz4WIQKn0hH7uioTkLsqp
         9pbcdTNG8ycZlbJfg3GhMkU27MIURvMG1rzZpvGW1LGoKPFSTcupk/bB84aRy/iUn1ca
         4koA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863335; x=1760468135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiI8ma/H7AR+p7UC+KuFxeAt/GicErH37Q1yChqPrPA=;
        b=VpJZ28sGmQKUt4nzrpGB94t7YwqRkkYLb+tUgbF3TwB+d0CCAqI9PfMSZc7KCN0EsJ
         ypOkLRBoAQsWAMj21t25D+Wk/k/+fVRWoWhFSHp7qEI2AGKgk6gytI4Ch+d/xtPswLnk
         EJUaFCgpzzsBVeepRsN273m0TnARDccFq/XUQk0D9lG5snDma9vkNieWSVFiw0njjM05
         hM9dCqVdNSzwGFfPu4qf6O7eITGb7gmZ0LWXrewHhOj/00CwJ3g/YioZqbKwi5N/9DN3
         SHHL74EGOWhLCEVA+Jz40diTz2bTEoKAGd22BHkpumPVDV5OZ7HgYQa6IWSX1obWyUZC
         v9iw==
X-Forwarded-Encrypted: i=1; AJvYcCX3+RF4Wf2TdA2kkM9mQs/6L3YcTtr+37oGMU64d9U4156X5+mH7AJKaCrbxiZmEB1/Zbk8ZmCKTPMrd1quT+FHQP5OqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPSqrf2PZkZ6+XtoZfybnHPK8ejyVHn19Pmn/+gzUxyqru+TuO
	e+YsvdrtAAQ63bd78PYVW6kG7CCiuKcEqKyKczVQXazPXrNZ9TzmtkX1
X-Gm-Gg: ASbGnctcex5ri/RTJIM9UzfHweETcoHN6XTeptVAjeuYBTbvD1h41FXVG/vlvCUT892
	FYsNZyAAG8x6WhzW+srSokkZiL4ZF2hU+DFWKrKg6YCBHQxL0SBd8ZM/Eg1XYyWMw5EGXEtAea5
	S/T8dnebIDNYStk21qkS2nzgrO1Fgkk0rkmVmduV1A70W42NMeuJFzbwvw3z1F0cqbvTjJpU/QF
	1d1wGHRFNlfV90nWcT9G8OAYZQhEYC8r/AR0hxI97lp1AfJvQC7N4I2Ku770ADorAKkxj2uX0EU
	4/W2QRBefSvJbzQ9TqWDn3hoZieQxu7A4KwcJCrUfj21cUugPF3YukNk0xjMQ3b2FWvuOaZwyoQ
	+h7I2jKAaHARrosgw3gaa6/0zI8Jv5hpTiV25wswUGWlz5yvrbPyQmoQ0o36MIQpI0g==
X-Google-Smtp-Source: AGHT+IG2yzS46KJ17xC1D58qrOL2bjUkWL0tVGQSAERrzK3lQkukSFgqqZhPfcQE1JCH0nzmhBPy4A==
X-Received: by 2002:a17:903:8cd:b0:269:8d85:2249 with SMTP id d9443c01a7336-29027240d03mr7980115ad.22.1759863334954;
        Tue, 07 Oct 2025 11:55:34 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:55:34 -0700 (PDT)
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
Subject: [PATCH 1/8] Documentation/rtla: rename common_appendix.rst
Date: Wed,  8 Oct 2025 00:24:50 +0530
Message-ID: <20251007185508.40908-2-krishnagopi487@gmail.com>
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

common_appendix.rst is intended to be included by other rtla documents
and is not meant to be built as a standalone document.

Rename common_appendix.rst to common_appendix.txt to maintain
consistency with other common_*.txt files and prevent Sphinx from
building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../tools/rtla/{common_appendix.rst => common_appendix.txt}     | 0
 Documentation/tools/rtla/rtla-hwnoise.rst                       | 2 +-
 Documentation/tools/rtla/rtla-osnoise-hist.rst                  | 2 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst                   | 2 +-
 Documentation/tools/rtla/rtla-osnoise.rst                       | 2 +-
 Documentation/tools/rtla/rtla-timerlat-hist.rst                 | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                  | 2 +-
 Documentation/tools/rtla/rtla-timerlat.rst                      | 2 +-
 Documentation/tools/rtla/rtla.rst                               | 2 +-
 9 files changed, 8 insertions(+), 8 deletions(-)
 rename Documentation/tools/rtla/{common_appendix.rst => common_appendix.txt} (100%)

diff --git a/Documentation/tools/rtla/common_appendix.rst b/Documentation/tools/rtla/common_appendix.txt
similarity index 100%
rename from Documentation/tools/rtla/common_appendix.rst
rename to Documentation/tools/rtla/common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/tools/rtla/rtla-hwnoise.rst
index cc2721315552..102654cc0c78 100644
--- a/Documentation/tools/rtla/rtla-hwnoise.rst
+++ b/Documentation/tools/rtla/rtla-hwnoise.rst
@@ -106,4 +106,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentation/tools/rtla/rtla-osnoise-hist.rst
index a11c485f127a..991c11d6210d 100644
--- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
@@ -65,4 +65,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentation/tools/rtla/rtla-osnoise-top.rst
index c7bc716b2899..58321322d24e 100644
--- a/Documentation/tools/rtla/rtla-osnoise-top.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
@@ -60,4 +60,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise.rst b/Documentation/tools/rtla/rtla-osnoise.rst
index c129b206ce34..997a981fe397 100644
--- a/Documentation/tools/rtla/rtla-osnoise.rst
+++ b/Documentation/tools/rtla/rtla-osnoise.rst
@@ -56,4 +56,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 547dfc7ace58..20c1315c21c6 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -110,4 +110,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 3740fd386ea8..c620ab16f849 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -133,4 +133,4 @@ AUTHOR
 ------
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat.rst b/Documentation/tools/rtla/rtla-timerlat.rst
index 20e2d259467f..e66d2588a416 100644
--- a/Documentation/tools/rtla/rtla-timerlat.rst
+++ b/Documentation/tools/rtla/rtla-timerlat.rst
@@ -51,4 +51,4 @@ AUTHOR
 ======
 Written by Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
diff --git a/Documentation/tools/rtla/rtla.rst b/Documentation/tools/rtla/rtla.rst
index fc0d233efcd5..2a5fb7004ad4 100644
--- a/Documentation/tools/rtla/rtla.rst
+++ b/Documentation/tools/rtla/rtla.rst
@@ -45,4 +45,4 @@ AUTHOR
 ======
 Daniel Bristot de Oliveira <bristot@kernel.org>
 
-.. include:: common_appendix.rst
+.. include:: common_appendix.txt
-- 
2.43.0

