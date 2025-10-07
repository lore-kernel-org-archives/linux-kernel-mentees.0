Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B789D2EA15D
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 18:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863343; cv=none; b=rZld/e6lIkv9G5yHcThbF4a18VRiEU8p6RC2jIKgiaJMf04jI1+ZvxxQvSocHXM/IyCkvhKRnwBq6aAozONUCd2Zx0hvZguU/JJMIGBQ0tGiJM90wdFbiZmO9Wnde/vR9++JpAoApPOzyQ6UKwsL8FAf1ilU4UClAfpkCytJjM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863343; c=relaxed/simple;
	bh=Yj6qFGpRJNJDFP2ncNEzgdlCNrxdDvojcj05gRJtzaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqkepuVHvJ24wm4FHIuvqdLfWTgrD+ijqU/bE0gtzlIRP84Q6A9s7+M3bwMObBrp5EX7UVpmW0blpGPrJdOLWV01KXty9rL/mm5dJ5GUCzwqEtRKRRVIZWozN/S/hYGt+Ay+IdgKlmbxRy4mO2O2vLwvfljq/3t8uwVOwBl7/yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDj+Bz+C; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDj+Bz+C"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b63148d25c3so130912a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 11:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863341; x=1760468141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoECoCP08BHgzCQ48qCknodyteaa9PDghFpXIE55+JE=;
        b=SDj+Bz+CWvzq0hlC2IHi2xkiQszhrMr7NK3Rnn2bJNNSD4CYaF8XiVAtlYiYIUU2pj
         XVXsrM26XIEd7bCRCp0N3c8VIoog5DyjROnSmxiWCaKhxG3drCVkfqaBiAP0wAJ0lr0r
         R5942QRSJIec3VsKvn1KGDYZ4idZbUFs7FkjyiJxPI1WHJm9s08i5GWIDzI/ddZYEGGp
         iwE7Hvyjwm1Q/H1mlF604LJiwezz0NYLxr8IP5BDkhNFs9AQ3AmBsnYACSha8UplDN1i
         imfTmxDP6MEsjpMMZt+rOLmiQwnbtAxjpobwnTnk6ZkIN8zL03Mzu+xU7u9z9Ep3GvDk
         yGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863341; x=1760468141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoECoCP08BHgzCQ48qCknodyteaa9PDghFpXIE55+JE=;
        b=cUsl8WiZiRdEQLslF3T9G7bqfhr09Tm8Oqct7fFNZSuXbkly7UVzM+BSniM5ZciXjP
         ZPxPRuA8W+IiIN68xu0JyF6xDCgQn/qTQ9Sr+gyxUjEFifwxrH9PIjw6XWct4MgUd0nQ
         dBsXXLdO2Odm01c9Jtd3ZGLlhZkHKsfW5aug7wB5tjibCr3PTO9ynpJ8E1qm84O6z5AR
         OH5kxU0hGJIP2FZ13Eg8bZRRlGKoaxzuxSf10796uYFZQuTi46WBx/7PLf5+Rl7YApa+
         UUkP3W92hTtx1Alv8un7BQG3EdJIaJ2mN008wJu78x61Kq9mJt+f80zgEbmS0ugScKxX
         +Qmg==
X-Forwarded-Encrypted: i=1; AJvYcCUDoLIzVw92MOMm84Igy6ZnKrP8LKjt7rz5qHaAsIWUrTCVz5hMN/0qizYVdc7umafOSPug41Os4SoHiP/Rd1+q2cdMmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWp9FMk1XQTH+ELj8RHPN9TGou/FwJ+27zWl/0Keo/FJ1NbohK
	8fzBF1lMdPgdVPX1wwE0X6ehDam52ta8Tv3hm5j11h+3HqyuX2S1XEfR
X-Gm-Gg: ASbGncvJ5GSTBM/3cvOuTMexmB+eS24bCprhk5q/UQ8/JFld3/AqkpABn89c9VJMIOi
	e4oVa1ff8LmlOfc6zRlyjN+ht5hCetgKkX0oSt5SoovD7GvIdVYRLF98KMbLphYMGGK+jTPtJuu
	0x2oZ/ihPWZTIB3Gtc2dqi8n+aMuEzutR2kl5z4Q0q7x8nfCm+4U0qarsvy/tZXxI0pSEylPLbr
	h54zG2Kju/LjJ1IQpLg8VAmzhHw4LV5RpEupblZnLXLO5JQOUBLgjfSg9gmHGf8VtMTNCFXb/yi
	9tN8X4bbOZAm/ntxpGLHHrjxFImJGaiwhFMPjVin30ZRle75iM3zuuTC92ectQFDNWM5ziZAGCx
	fLPPp57oSkP/X3qRNCGOrNXQvhBBzWJUUiZspk1/pyy8MhSBnhnKEN5+Kx3iCCadGdg==
X-Google-Smtp-Source: AGHT+IFJamQeAOOdQ9dqsKsLUKxoiyUO82ESK8nEp/zyoxNnQPXrmUGH61Q/EWQgGDEZfqVMdB2aHA==
X-Received: by 2002:a17:903:1aa3:b0:24b:1585:6350 with SMTP id d9443c01a7336-29027e78f7dmr3818745ad.11.1759863340793;
        Tue, 07 Oct 2025 11:55:40 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:55:40 -0700 (PDT)
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
Subject: [PATCH 2/8] Documentation/rtla: rename common_hist_options.rst
Date: Wed,  8 Oct 2025 00:24:51 +0530
Message-ID: <20251007185508.40908-3-krishnagopi487@gmail.com>
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

common_hist_options.rst is intended to be included by other rtla documents
and is not meant to be built as a standalone document.

Rename common_hist_options.rst to common_hist_options.txt to maintain
consistency with other common_*.txt files and prevent Sphinx from
building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../rtla/{common_hist_options.rst => common_hist_options.txt}   | 0
 Documentation/tools/rtla/rtla-osnoise-hist.rst                  | 2 +-
 Documentation/tools/rtla/rtla-timerlat-hist.rst                 | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/tools/rtla/{common_hist_options.rst => common_hist_options.txt} (100%)

diff --git a/Documentation/tools/rtla/common_hist_options.rst b/Documentation/tools/rtla/common_hist_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_hist_options.rst
rename to Documentation/tools/rtla/common_hist_options.txt
diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentation/tools/rtla/rtla-osnoise-hist.rst
index 991c11d6210d..a39285817566 100644
--- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
+++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
@@ -26,7 +26,7 @@ OPTIONS
 =======
 .. include:: common_osnoise_options.rst
 
-.. include:: common_hist_options.rst
+.. include:: common_hist_options.txt
 
 .. include:: common_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 20c1315c21c6..43f99bf0f1d7 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -27,7 +27,7 @@ OPTIONS
 
 .. include:: common_timerlat_options.rst
 
-.. include:: common_hist_options.rst
+.. include:: common_hist_options.txt
 
 .. include:: common_options.txt
 
-- 
2.43.0

