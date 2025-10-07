Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C419EEC2
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 18:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863361; cv=none; b=SeU8voUd3QM71oRJqfnT5yK9JzxHaW8CJXERDagTeiSQnJcKc0wt3EsXDh5hDh9P7XRE16q5gXkZmj2DlgybmP0SyWgJWQcD2KafKImf4buMci6NgLdjdBHLCe3wZR8DZMc+n8Xl1iWNhdT69BrBOVSbX8ewriqBwfZhE1VHCzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863361; c=relaxed/simple;
	bh=7qc17epEtnYxEg2yWgO7/TgP9PveePfwhICF8dRD2Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGFe+9ipX/S8NJT+HPvb9WGkr3CxLNbbdtsjkxxJd6A9wIz89lD6XRWFf7FIpfIaGD18HBmDX+ZLRqlfplpIJqztfJuuPHUR/n2jGRCTzpf6dmwQ3zf1hCsdWGcPYzMCwgzWqHysCwWGci9Tq3k9QXV2Gtc1UMi7wBMA8KyfXM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwLGQr4B; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwLGQr4B"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6093f8f71dso4371711a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 11:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863359; x=1760468159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Th+qgyzrC6DFJ5YiHB/fxAmD0CanOMB/q/4DLPRUk/0=;
        b=GwLGQr4BEGNJyvvl2c29pKKaZMIIsqq5+3YbedLtlbpmWoKnPnTlRBYJwERtS9zKj3
         X1FJCFRBuT60NBDzJ2NBtagpBz6Y+0sUmt0Z0BuYpUBNa1fuAWB+a3LqKZN/iPN1pt+w
         RwBtbSveoo7+HCMMcdLw1e9MJF4Ure6yRgtrLMlS1iOxkUtpnkb77z79g9nCrHBtd8jO
         9pmhXwQ8szIsty0i1ZwYGJGrWm5Z4lvj5Q/qf+PQSfnxTqSi/bSwRbMIOSYsrUFQMvWj
         01U/mToI1TazAqLDhAcu9Vj0TQJHYNv5Tq/Fqb0AzO8tm0OmKQSePzyQmLhwBVJ3jR7w
         6vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863359; x=1760468159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Th+qgyzrC6DFJ5YiHB/fxAmD0CanOMB/q/4DLPRUk/0=;
        b=hsIdD+zOct+noCRicJL1onRamjCYW563R5Txhh/kF9RzunXCAtixRdPJ1KgbS0307c
         qKnzCEq1mXkv7g/dzOsDOuY+gWDAvKA2K4A/HxhQderxqyPH+T33acUNwIUV+S+Ukdhx
         1jkjIH6MRH4OYiWF45kQsypL5epoNi82SVIlXG6NO1dpI+MWcba3FIh9w+oluSEF00vO
         l5YmGYYkAG5K/oKreDkhO6DWdCjrigiVmMIxbwxCop4D8/Xo0NxD90Fg2yQBOLCBltXJ
         2bJvs6C4sHisfbr0d3ACWOyWtMGkE+hHickk6UeYYqzFkj1binXgJqnJiU5queONcH4S
         JZ6A==
X-Forwarded-Encrypted: i=1; AJvYcCXO808vSUHo1Ck3DKWqDrXvMD37e7g2eg2Rq1bG3ouEAKe8jtJimiKGG2Fo3EYU/f4OjLYif/BNNKaWANJB4SDabldcTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6B0aEo7zCeA6nGzqoCJXmskYfEU531QS1QwsyYPLrNAf8OPOv
	OAAGnxNYv7iOxH8q4b16GTJMAX15yUXfJ1Nf3CMLCdaSCp/6RxDCkdPG
X-Gm-Gg: ASbGncuTFtGVKZ59E+N5nHcmFDTyIDpRVt5oJl1D0Y9V4ghMQGauTCbRFNbT+FLmod+
	u2L7Zx+MQma064gFeksC4mXYNFrmaJa5f/v3JHgZORoWPeZl3cX4mvNAHnJeMAhdUKsHOocN4DP
	5p2YzKaDAoqbVwpzvVBgnpIrIDUxt5uGyeuOfmCMT/oQUdqUUaQ9bMw4Mg4d97VQX5ONUOwcumg
	1wsk/upu2Fds+dmKFg5A9reS0QqoqEmNDyQahf6VqK14T5K2E0wTuqswA/4tH5rLmCi+FJtlZ0L
	QSoAvuOM5v2dkkSR7ZYP4w9mGoNx6Og2q+GT2YOA5mSb9t4V6grZrTSfxdDndmv5GoMj1ENBZnR
	z7SEGMuWTlqvZWGuY3ivHswccUW7abkuUJTqcgcbZsmO43jbUxbQPRxyKiwYcuEHBbg==
X-Google-Smtp-Source: AGHT+IGVJBbirPc9aOMKvG+rVBGZMOOpzMCZyulcVVdBkwZg3df1u62SnhBExhwRgvHQnIuMqy2w6w==
X-Received: by 2002:a17:903:1aa5:b0:269:96db:94f with SMTP id d9443c01a7336-290273ffec4mr9774255ad.49.1759863358733;
        Tue, 07 Oct 2025 11:55:58 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:55:58 -0700 (PDT)
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
Subject: [PATCH 5/8] Documentation/rtla: rename common_timerlat_description.rst
Date: Wed,  8 Oct 2025 00:24:54 +0530
Message-ID: <20251007185508.40908-6-krishnagopi487@gmail.com>
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

common_timerlat_description.rst is intended to be included by other rtla
documents and is not meant to be built as a standalone document.

Rename common_timerlat_description.rst to
common_timerlat_description.txt to maintain consistency with other
common_*.txt files and prevent Sphinx from building it as a standalone
document. Update all include references accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 ...timerlat_description.rst => common_timerlat_description.txt} | 0
 Documentation/tools/rtla/rtla-timerlat-hist.rst                 | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                  | 2 +-
 Documentation/tools/rtla/rtla-timerlat.rst                      | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/tools/rtla/{common_timerlat_description.rst => common_timerlat_description.txt} (100%)

diff --git a/Documentation/tools/rtla/common_timerlat_description.rst b/Documentation/tools/rtla/common_timerlat_description.txt
similarity index 100%
rename from Documentation/tools/rtla/common_timerlat_description.rst
rename to Documentation/tools/rtla/common_timerlat_description.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index ae1638bb9a99..61b5b55be96e 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -16,7 +16,7 @@ SYNOPSIS
 DESCRIPTION
 ===========
 
-.. include:: common_timerlat_description.rst
+.. include:: common_timerlat_description.txt
 
 The **rtla timerlat hist** displays a histogram of each tracer event
 occurrence. This tool uses the periodic information, and the
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 19cb5d203845..6f09f30c74f0 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -16,7 +16,7 @@ SYNOPSIS
 DESCRIPTION
 ===========
 
-.. include:: common_timerlat_description.rst
+.. include:: common_timerlat_description.txt
 
 The **rtla timerlat top** displays a summary of the periodic output
 from the *timerlat* tracer. It also provides information for each
diff --git a/Documentation/tools/rtla/rtla-timerlat.rst b/Documentation/tools/rtla/rtla-timerlat.rst
index e66d2588a416..ce9f57e038c3 100644
--- a/Documentation/tools/rtla/rtla-timerlat.rst
+++ b/Documentation/tools/rtla/rtla-timerlat.rst
@@ -14,7 +14,7 @@ SYNOPSIS
 DESCRIPTION
 ===========
 
-.. include:: common_timerlat_description.rst
+.. include:: common_timerlat_description.txt
 
 The **rtla timerlat top** mode displays a summary of the periodic output
 from the *timerlat* tracer. The **rtla timerlat hist** mode displays
-- 
2.43.0

