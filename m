Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872952E9EC9
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 18:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863350; cv=none; b=m0yvfCu2AlM68Tcy+L6Gh6U3vHTx+hzSTV28kNj0obDrpO/N/TGSs+C3BvKkpzDj8KmM5t1MvNSh/JulMZzOqw8iluCxWoTNE6vJYYZNBZpTsXUHVQggi0ZZCk4ZhEWqFAWdjjmzbf23O20fVENiaeMaZqC7H80PzxXoVJpWa0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863350; c=relaxed/simple;
	bh=L9zt2+mYIjZagYVVaj6OPHVn0B0rNs3RIPv8NtxcOPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VapCFVG6bMlaEcn9yhCnsI4GnFBboK5Zvha5w5e9TXagCoC6qa1U9dbP7g1usitB19Veoi5wibbKIORUECSXv/mvuTk6WoLGpC80bKIP6aC3pClJdY3woaI6lNiNUZ2suw/KSE24SOhQVZ4yaTIKzn2ci+fGS191pdnJ2tr28hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0GXH6JB; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0GXH6JB"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so5631496b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863347; x=1760468147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEHJ86/7N3GoML0TX8U7iEmW2mKzHnR6gQNQcuV/G5Y=;
        b=Y0GXH6JBPH6SqzSVwMz/EA8nS1InuMnfw8aA1K5JTxduUwgh4Zv+ac0FcpoA1/J9VH
         r7gQcxBUs1Vgt25wcKRKNdDaCHqvKKnHzs05CxvV4s1mqetlXWoP9CgfC8xRvQ226myH
         2zHb4+CNUd14fW5+A2WY7wv59/gbYJ7RS462KXKUwjdJ0IICbXyxMhiIcH/2pcGNLydD
         tYsWo6mVAgD1RTTDXadPA5klkaNyhT9P6FcRoQWAwajTBdwldrMWk1tyRxtMtroEsMgQ
         vcc3UIJuPRE9m5wgZMI4+8fSandbElTwEeUAXVhKGHaRe8kmlm5ZtoanzJcecd8sJTqe
         9ImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863347; x=1760468147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEHJ86/7N3GoML0TX8U7iEmW2mKzHnR6gQNQcuV/G5Y=;
        b=lG0qNDppFIa7bWUaOwFNuqG9QDur0TQNfTDs1TFycR9wkX5DkDP63qoLy0y7J2PfWx
         e+MGbWoepYLbu5exJtYG/yDrYmmCdURaN01ijnmy/2aQHhE8bgMn3wEWXtxm/4CrCXXi
         kh21yLbfCq6B59p1wVz3aFVK+8czmSFNyQVysoHdLkZJjW3fdKMl+qYtkld1eD93oUi1
         7oWr8YnL6Lf/SIDXDygyb39bciz2uE0W3TfkeLPQ9Quon3lsMb/eEqxYuLjITfkRpwa6
         yM3t+pxYzvF9BtJSZ2Pxclu6Q9GKXLvNw2YC75aSutGvAKBNXazNoAL3kUdbDunYa/kl
         Cm4g==
X-Forwarded-Encrypted: i=1; AJvYcCWGtuoKzD35xfciEUzeYKBEltp9LP3mj6lPIDAv295LHwzcXXrSsH6xI3bdLj9h70mEtnkEKpuiO8zNWdIJ5+eo3TzvTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtOuxDHLKWiu6Pf4XFwU8lgjZw2RzmkiC7cRXLGxhXf+YZpMXl
	XB50zmU2yTL1Y0LPLQI4iIqjYKsa7DHdQkwyLQioznBJLYxpfMdlhHfA
X-Gm-Gg: ASbGnct7SIrbEUyf9vZrcR9WEXRJWmq7twEUA0m/qDG0HkrT0YmdTOznAnr7xPnm+oZ
	qEPVFR4zamWTKdAefszmZ67PbUmgOGXkgt61SmQnB5gRXfHgc9sQP2mbzflmJ5MOcxfb57KtGAu
	SPV8bPDa7RSggDggnADh/l1sPHK87rglnVzdMVslt2pau7wW2Si+gv9VzGODLAoU8SHykqqKWD5
	oBaRCsrkDdyhiW49TYCrHVYY3uzLLUaUlPohwVVwtWQpVU+WTFN6mOCp5LXxQNjZSj1WXbE09j1
	8q4s04wHn8Polxs4B7fB20NfDTJptjpI4XtndTjUPpKLXRjkk78NVBKk69RFc010N5ODii3L1Go
	6LYARW1BueHxviSg59Y9ovrBNwJyfMOj3HeYYE/SgtcraVbf3gxiS0mYtMF720eRzJA==
X-Google-Smtp-Source: AGHT+IFtTvflDnDVga6tSkVQUnvou1LUWOf9MCJHjvLvWiRbsFrn5VG8YDKujN10eze6W/WhgJGaUQ==
X-Received: by 2002:a17:903:19e5:b0:27e:ef35:2dbf with SMTP id d9443c01a7336-290272c1c46mr8620475ad.30.1759863346715;
        Tue, 07 Oct 2025 11:55:46 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:55:46 -0700 (PDT)
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
Subject: [PATCH 3/8] Documentation/rtla: rename common_osnoise_description.rst
Date: Wed,  8 Oct 2025 00:24:52 +0530
Message-ID: <20251007185508.40908-4-krishnagopi487@gmail.com>
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

common_osnoise_description.rst is intended to be included by other rtla
documents and is not meant to be built as a standalone document.

Rename common_osnoise_description.rst to common_osnoise_description.txt
to maintain consistency with other common_*.txt files and prevent Sphinx
from building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 ...n_osnoise_description.rst => common_osnoise_description.txt} | 0
 Documentation/tools/rtla/rtla-osnoise-hist.rst                  | 2 +-
 Documentation/tools/rtla/rtla-osnoise-top.rst                   | 2 +-
 Documentation/tools/rtla/rtla-osnoise.rst                       | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/tools/rtla/{common_osnoise_description.rst => common_osnoise_description.txt} (100%)

diff --git a/Documentation/tools/rtla/common_osnoise_description.rst b/Documentation/tools/rtla/common_osnoise_description.txt
similarity index 100%
rename from Documentation/tools/rtla/common_osnoise_description.rst
rename to Documentation/tools/rtla/common_osnoise_description.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentation/tools/rtla/rtla-osnoise-hist.rst
index a39285817566..55616085275e 100644
--- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
@@ -15,7 +15,7 @@ SYNOPSIS
 
 DESCRIPTION
 ===========
-.. include:: common_osnoise_description.rst
+.. include:: common_osnoise_description.txt
 
 The **rtla osnoise hist** tool collects all **osnoise:sample_threshold**
 occurrence in a histogram, displaying the results in a user-friendly way.
diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentation/tools/rtla/rtla-osnoise-top.rst
index 58321322d24e..ea0e9f5a5c0a 100644
--- a/Documentation/tools/rtla/rtla-osnoise-top.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
@@ -15,7 +15,7 @@ SYNOPSIS
 
 DESCRIPTION
 ===========
-.. include:: common_osnoise_description.rst
+.. include:: common_osnoise_description.txt
 
 **rtla osnoise top** collects the periodic summary from the *osnoise* tracer,
 including the counters of the occurrence of the interference source,
diff --git a/Documentation/tools/rtla/rtla-osnoise.rst b/Documentation/tools/rtla/rtla-osnoise.rst
index 997a981fe397..540d2bf6c152 100644
--- a/Documentation/tools/rtla/rtla-osnoise.rst
+++ b/Documentation/tools/rtla/rtla-osnoise.rst
@@ -14,7 +14,7 @@ SYNOPSIS
 DESCRIPTION
 ===========
 
-.. include:: common_osnoise_description.rst
+.. include:: common_osnoise_description.txt
 
 The *osnoise* tracer outputs information in two ways. It periodically prints
 a summary of the noise of the operating system, including the counters of
-- 
2.43.0

