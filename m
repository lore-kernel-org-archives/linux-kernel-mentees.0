Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441AD2E9EC2
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863354; cv=none; b=dWLHlG1PY2qNSREjiXRtfjZi69JtxYdhmQ0CcWmJ7wzMUOaKDhRgBbU0dXa6vtTsSRsRkvZswh+El80QHYYvN/nk0GdomEuWy0YcTelRYRYXOEGS6w5uvqH14uRsEnbhSZ+YWH485CLaFk2y+lfgkhaHCAXmCxxUhduquzq1zFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863354; c=relaxed/simple;
	bh=Rho7sTxAMEoPP252qGZTMQFycx1DLensjGuRyl7y578=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZFzm/FinP7hv07ssqVB5N9vYhrMmVnwqhKYkXVuKbeBnK7vREkPXFoN8XT7cUqIyM04ZBUW9S2SBsiddsr5kIW+VBJ3oYRDN2kOeMkWtsrD8q7ya7jYeUHke0ZL+2+IBIeKtNaZ1giodxq9pM64NkUaaYeGXd2jtNGDxdqZXX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gevUlw3j; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gevUlw3j"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2698e4795ebso64766175ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863353; x=1760468153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gegn0k8zkFLs9RL1dCuvg0v6JbgbJ0VquvE3LZNQOk4=;
        b=gevUlw3jZ+co0daH1QBL+/XnhkNdtOE0zng/LL52p43vTd4sOPmAMIo5tDVCp7vpfV
         HWJ8zVYtz80v+tRhbKmxMk7EqSWtAD2IoWqoSQSKMrle1WKMON0SO3JMqfW5wQ1swiYY
         XxHGb+IXZRLSL/YgCaBwaRGb0yXhqj6REvVw+ry1x5cdTXSBew6uoTffQBQrT6NvxYck
         lipTtfRbXjDy6C8VbBP97++9VZTYngj6Nfle5ezvgGgtbMUVTgDq5qCoTH2cHp0BVePc
         fju09LAUn/QJf/6UaU0J2bygJ5ZvNmU/r8dGarqvzNll3t3KzNSRqzO7lWMkaEkV3xiK
         AvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863353; x=1760468153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gegn0k8zkFLs9RL1dCuvg0v6JbgbJ0VquvE3LZNQOk4=;
        b=GeMoJnDoYvlXJn3WPqBcZIdRyaWOycsz5FgBHP0ZcWBShOSwX39XAjw6Hq1iniuUef
         6h3XKeVfovlMyrqckQbcS45Zgg9J1GBmKsILJPHj0VG4JvYVhOnf+CbWOOseALA2I1cY
         sl36V5p/G+tScevo0UDq7DdPEAck4VRmK/Nd1oamBGGeX6IcOvdTmheXVBnhJDD2lGJg
         HOxsxB0WZB+X3zPoB2efEY1Hr7Jzg4EzHNtpG/fWCBa3lRRli0xn4ldkGYtIefh4FLrC
         xWuGqMtT40xewJB4f4TJmlpnZ9zBtTZCBRRjjBdEiK/W813C4CjBJ6vNdvuxVzzMowYc
         N6pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf86vr00eWuhD/47hnkjToD8/wFb7PZ0IxBxBBiKBdssmAB1InLAB+XsdG3Xi5hxx7wpsCrXNX7n20OrklboOXn8+VYg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7as0IOsx7fjXq2R4XLMpUp1nr4ISy8alDGUiaRNu4xZn8zuT1
	IZz2Y+MW5M3u1PomltK0c4U/t5SAO3sc1Vn9BIrq4v4z0dTjalK61AUt
X-Gm-Gg: ASbGnctuTPEpbSWEz7+1RnMdXgyiEfIBVFMcERYbbGB5+clVN/AQABt+S19odk8rqUb
	V8e7nFEM3uSSVni7hyHAapSxJIG3eBHJDDmgokFZDaHEU8977CnLTX0S/O0dOckk3wGBBnYVPz9
	3jzBM2oqwbukH1d8tKR6eKsTtctQROQeLd3SbcyjZdyohenqq4caF8qVRUfpk2mNgbEaUIsDubq
	G1fKhDvRokMb3+8wafd1DnhujJQIkRkG12lbvFGDLL9hz2zv3WXINegAfp0tfoyEC6HxFL/t4lc
	utzc9KwsFnheAJ5SsiVPic7Bdldm8LlEHw1wTXPXHt7B2YAe/HuJ8Z41IIDLHcnsyeqA5DbT7F9
	LjkG1lX4hqX/BMtSVrH3Qj0aS4k0kbUCplPH8RLMS99SrulF6J7T8ABdgwAf3Qn5FVQ==
X-Google-Smtp-Source: AGHT+IGZN1Y9M2N/Vee1Ssvvb0MHNlIZBYsHqgiNh9gBqOHOlpsRP+9huQ4wVymhKKzzErwqk8uQ8A==
X-Received: by 2002:a17:903:1a8f:b0:252:5220:46b4 with SMTP id d9443c01a7336-290273ef076mr7414175ad.37.1759863352634;
        Tue, 07 Oct 2025 11:55:52 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:55:52 -0700 (PDT)
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
Subject: [PATCH 4/8] Documentation/rtla: rename common_timerlat_aa.rst
Date: Wed,  8 Oct 2025 00:24:53 +0530
Message-ID: <20251007185508.40908-5-krishnagopi487@gmail.com>
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

common_timerlat_aa.rst is intended to be included by other rtla documents
and is not meant to be built as a standalone document.

Rename common_timerlat_aa.rst to common_timerlat_aa.txt to maintain
consistency with other common_*.txt files and prevent Sphinx from
building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../rtla/{common_timerlat_aa.rst => common_timerlat_aa.txt}     | 0
 Documentation/tools/rtla/rtla-timerlat-hist.rst                 | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                  | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/tools/rtla/{common_timerlat_aa.rst => common_timerlat_aa.txt} (100%)

diff --git a/Documentation/tools/rtla/common_timerlat_aa.rst b/Documentation/tools/rtla/common_timerlat_aa.txt
similarity index 100%
rename from Documentation/tools/rtla/common_timerlat_aa.rst
rename to Documentation/tools/rtla/common_timerlat_aa.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 43f99bf0f1d7..ae1638bb9a99 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -31,7 +31,7 @@ OPTIONS
 
 .. include:: common_options.txt
 
-.. include:: common_timerlat_aa.rst
+.. include:: common_timerlat_aa.txt
 
 EXAMPLE
 =======
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index c620ab16f849..19cb5d203845 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -32,7 +32,7 @@ OPTIONS
 
 .. include:: common_options.txt
 
-.. include:: common_timerlat_aa.rst
+.. include:: common_timerlat_aa.txt
 
 **--aa-only** *us*
 
-- 
2.43.0

