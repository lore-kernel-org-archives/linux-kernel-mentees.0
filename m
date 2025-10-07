Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120A12EA16B
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863378; cv=none; b=JcJlvbTwKMnRxpDF50ZeoZt44SrvCSEBupZx9ZeyViE2EBTpIF9LQY9l99fvCPRGyDf+ZjT5XN/v472T46cEDTXBqFkz//mQJcRYPpG5lGBESdkXmBx1U7Nf1Hg/ynLWQGrEA3XL7auZAUieWm260Nb3M6tEL3GCa5lDTI/85sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863378; c=relaxed/simple;
	bh=CloW7FhMBhnWY7ih3iN8vM0ZFn5kYPF7XeKW8uvATJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/NKxLzJmn1V3c0prjZM7HD3H+9tPrOnUO7oah4b1FNEOFEMONOGxN3XV9qjhz5a6gwRKlPpkBSWYFMX9rBQNGlrQPYuaIRyF9nuGbm8dtDqAz5Z6gwsaujaj3bN7EuSLMSgD7mM5XCg7YkTTN0NLWBLRmKswxjX5gc2o/HYJDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFiYq5qx; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFiYq5qx"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b6271ea39f4so4073384a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 11:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863376; x=1760468176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMcgMtnQhy1DPy++ljFQ5B7lhaXeK21GW1cVMqM8xVY=;
        b=fFiYq5qxrcPwTkABFkwNaWpI9YiRh/nYBK2RILtDyHZTueDE4OwTf0/2z2Nin8fsBv
         jMupqd/9F5cMMzQb+cEtueittyIY+2+lnmAtMk8Du62W7Py5UGupwjsOwNGJgasbWcIi
         zK4XMdC3oG/so2LP+jIRxCes/U/MwXJCY2LPiSfYRHNJ0fiS1l4IdYXLy2WN2OoD8KtO
         hLckMxArnRRXMQVZP3IzZduxgMw+dX2QL1fmiSBktHC/18NeOr6t78uE5KINJYMn+JY/
         QgZ9zJ+V4WMfVMudoz0ZjsEAfaAzPq4yFwE1rSju09Hm2JoOamjELCvR7WIz4H3Em5Dz
         JKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863376; x=1760468176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMcgMtnQhy1DPy++ljFQ5B7lhaXeK21GW1cVMqM8xVY=;
        b=LgRqWyWeywWfFKRVoicOG9pC+6fdcdXChR9XXSpMFQPTphZC5VfzckfQY3ijSIxQ9G
         EaVFxiQbJkLf5Gpte71hsLkCJGt0R8tjj/CE3ssOeKZzhleZy79Yv+UiBeJJWWiAE3hq
         84Sxeu6ck7vb6N4gwjWC5dlCVflU+Ru7WRDOKN3DlZNNQP/sNZxGWAQGJZJbkGfysKUD
         trP5liAbGfjYuXBA88V1Udwgk2flDoRMLebHgF/Whl52Tmsg4OAtjnzB9qIJbJMmXXXG
         ro/rKcBYu3KGF55CLUIU9clOfC9BZE+N/GAquMVzWp35Zax0QcPjtrQUuI7E8fC0QwBp
         WcAg==
X-Forwarded-Encrypted: i=1; AJvYcCXrquFG3qY8ZdpeehkkXJISiXswdqDzF2WTOpo4ZVWZJyeYx64GuQ/Tu8YurSBOvTlv5Ku9vuZZPVfqEB8I//X7TDBRmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFVqVTebE/emYAyMP6b8s9PgK3vtk8hmJl1NjuF/sfBD0vt3MI
	NESnIy3IRjzAc9RyLMfa67PjtEr0AKPm2I9MRQVv+/85DzI8NtNAhmqr
X-Gm-Gg: ASbGncvcD7uMgTsFnIXkvA0/KTYpR0xoo++A4gHzQYVRoY9Wm38jr1nWi7LPKG99SC2
	/TP/N209hQrDz7QQ0cwFG+kMUi2Yz127IaIKoqCV6wGQv5J457QX7qPzyrn44+Rg0OUnxxxmqgO
	oeoemgJkv72dI4IzWVSGvi9I/GVyGq2DsRI/nF/vuq4A2dcAXwSBI8S0iBm2RJAb0vFUZkDFVns
	iXv+dQ4WPEztJrR6l8fcS5dmF7QUnAAjIrHq81vCF9JLh4xHT6FX0YCqOG23Yhp41wPQOlAEdIc
	iplCy+XJeUW0oBKTIeqQqPumJ5+veIQDnPKTKBH4qKfYKh55F6fqz6hxufF9AwJo5a0HN/WtmZ9
	rFCAgMMUr+Nue0SCz2zKnZQesZaRT1dTM70bb8hKHC7ct9Y2Q9tiivoJtpUbg5vKITQ==
X-Google-Smtp-Source: AGHT+IFcXfO6RvhF3YXlYYvUUUIceGO4XmoS0wX/IMzMllJDL9x+dTFS2NyLyCwMy0EW7eslfVVevA==
X-Received: by 2002:a17:903:8cc:b0:27d:69cc:990 with SMTP id d9443c01a7336-29027402f43mr9430955ad.49.1759863376259;
        Tue, 07 Oct 2025 11:56:16 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:56:15 -0700 (PDT)
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
Subject: [PATCH 8/8] Documentation/rtla: rename common_osnoise_options.rst
Date: Wed,  8 Oct 2025 00:24:57 +0530
Message-ID: <20251007185508.40908-9-krishnagopi487@gmail.com>
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

common_osnoise_options.rst is intended to be included by other rtla
documents and is not meant to be built as a standalone document.

Rename common_osnoise_options.rst to common_osnoise_options.txt to
maintain consistency with other common_*.txt files and prevent Sphinx
from building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../{common_osnoise_options.rst => common_osnoise_options.txt}  | 0
 Documentation/tools/rtla/rtla-hwnoise.rst                       | 2 +-
 Documentation/tools/rtla/rtla-osnoise-hist.rst                  | 2 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst                   | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/tools/rtla/{common_osnoise_options.rst => common_osnoise_options.txt} (100%)

diff --git a/Documentation/tools/rtla/common_osnoise_options.rst b/Documentation/tools/rtla/common_osnoise_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_osnoise_options.rst
rename to Documentation/tools/rtla/common_osnoise_options.txt
diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/tools/rtla/rtla-hwnoise.rst
index 60a237de1e2d..26512b15fe7b 100644
--- a/Documentation/tools/rtla/rtla-hwnoise.rst
+++ b/Documentation/tools/rtla/rtla-hwnoise.rst
@@ -29,7 +29,7 @@ collection of the tracer output.
 
 OPTIONS
 =======
-.. include:: common_osnoise_options.rst
+.. include:: common_osnoise_options.txt
 
 .. include:: common_top_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentation/tools/rtla/rtla-osnoise-hist.rst
index 55616085275e..007521c865d9 100644
--- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
@@ -24,7 +24,7 @@ collection of the tracer output.
 
 OPTIONS
 =======
-.. include:: common_osnoise_options.rst
+.. include:: common_osnoise_options.txt
 
 .. include:: common_hist_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentation/tools/rtla/rtla-osnoise-top.rst
index 8a852949df21..6ccadae38945 100644
--- a/Documentation/tools/rtla/rtla-osnoise-top.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
@@ -26,7 +26,7 @@ collection of the tracer output.
 
 OPTIONS
 =======
-.. include:: common_osnoise_options.rst
+.. include:: common_osnoise_options.txt
 
 .. include:: common_top_options.txt
 
-- 
2.43.0

