Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0A29AAEA
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Jul 2025 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960355; cv=none; b=QrSsSZWn+r3DEfo0radtligLK2egq5tYdDJISZt4nHILlGVymNlaTS9NhEMu7+V/t4EEKDxOCLGr7vl/q/6xQWMY5hfk80dIvXQfQqqLAd3YZA+Yrm9B48dwGZizaw6ldVPEPACWWOVus61AEUNez0TgvinC2x6NUKqtNliNIec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960355; c=relaxed/simple;
	bh=NXVzBmkzjs0qIwDBa1nvJlJYPXA8UdnEYWrKccWXZxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWE8Yf6uDBH9QlK2xz+Yin72pWrZgRYouoOC+ySa8IXM3xx5LGlDpHywmIobwjHtndaNrSE3YaWuXCGX5/fFrqRU5uoKmFqDhDKMRC3E8XHDgcuMj/sPT1zjmWJFiQIIKKwCrnlD72IkzyhNO+7LASU8vZ+ZjvgQZoxYniGz2rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=ZsUpHXKs; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="ZsUpHXKs"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74b56b1d301so2280366b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 08 Jul 2025 00:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751960353; x=1752565153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRg4Q6pPPZIs4EHGk7HynlZtava7RS7MLv1CsBp8mUo=;
        b=ZsUpHXKsGdyuCanQTyffaiOooKkx0khXiZfO2hwAlzLdE5pjc+8K2PLhaXyE+I+Ipc
         Xg3OlOSKtVs/cZbHnvFLHjhd3NsZrkESISDlmqmpTvB5DE0h6dMphSvMeXMOtGc9BjzV
         ws3v0eu4q7fr04NGDVVbBZuiRgXKJZ7ymXdnFYO+5ZE25jgpL9hqvpApyyLmjWUgEECA
         gGu5GFMj/mRHi1xu26yyAlDS52h//HbvD5rJzgTmiTk8syPETMEYa6FTU5pA7GNtHK1t
         kn3enZagl/OMPVCqQepv0EC7y8aisTm+cy+H0S772Ryx6nu3iYOWThzv1p+8YHEx1uCh
         XVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960353; x=1752565153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRg4Q6pPPZIs4EHGk7HynlZtava7RS7MLv1CsBp8mUo=;
        b=PQrZB/ILM9RRChVEIDOcm1Kxud9FVCTK7CfZco64sSh5QpTWLLmeSHFlv1zcbLz3TJ
         h+t6hZjotu0n1OGNr6Y0W7QYOo24cykUTgOmQhg9XmCHcceFGy09dbnx5tuG9lmLFqP8
         5Nitr//yQob0y1eT9jtg+vAKY35xr9sV2aUhzxqf9Zy3frgYrCffrJhJn8bHuDlnlXf/
         rvkkt5YQW23EmlF5dTRcey14nqBHHdvo0aRbEwtGMOiP6gJ6pG/thsKClaOMjEPt/AFM
         3nbMDZ+K55ru5NfyxaxLoGJOhMnYj266eF0J012ZlCvuQ9MDHm+8CQ4AUOGN9COVWX7p
         IurA==
X-Forwarded-Encrypted: i=1; AJvYcCUAJk4JkE+kxKR58CV+EC/9YnImbQdmm+jFOfTpx7GVKRxNts7AaDpfbc5lqEgPVDenjUtp/gsO3WRQnLjbUxBLKrGKVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLTHiQsdqRZf5rrmrIYvyuiU6V+XtH5cwLIRmRS9IYtfdPyN10
	ebHgFCUTIwjplJlnuq6M1m67HaM3gNg8eEnXT6OVzKmpFOAWEQTC5gSiroXDYH38f04=
X-Gm-Gg: ASbGncsDu3O8UHCdwt12od4nPyqX0eDGVP7q9GFA37PpS1lsDzCTkC1lvcts0R+qYEW
	9+7Zxq4mwvr4bETM+fLxEtbzbSF4QhvIKRIkj49xBOGwaNS3xU7SwelY3YwWY2O7NR2qYer9LJ2
	AJd6MMVnXiHwiFbFr1mPbm8NBEI8b3MlqszOL0yWk2xrRDcrIqtwFwHM4MMVDJnZmeHwsgNqJjf
	aTknXGDkwclDapkt49xjju63ATj6fPqsujnm+QOuqsR7+8CMfgk/ZZ7dXHSZ+Xq9Owt6XMJf5Zu
	aTgi9eTRhtiklWt4MmMoW6nyBfc6QwNfJ3L4XSuX5OKjG9eRKbBGrFFHARIU2ZUt5/i/2gzXmgB
	o8GvuFEKHRAwMe/1Toxnr6vG1RVSl
X-Google-Smtp-Source: AGHT+IEnB2D8Zt2lhCwV3+7VTxWI7MKuZHKxw4k42U2GFJK7fV9zJULR3jSg0DBPKK8gXEtouNDbPQ==
X-Received: by 2002:a05:6a21:204:b0:226:d189:bbd9 with SMTP id adf61e73a8af0-226d189bc3amr13874192637.18.1751960352969;
        Tue, 08 Jul 2025 00:39:12 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:39:12 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 3/3] drm: docs: Update task from drm TODO list
Date: Tue,  8 Jul 2025 01:39:00 -0600
Message-ID: <20250708073901.90027-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708073901.90027-1-me@brighamcampbell.com>
References: <20250708073901.90027-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update TODO item from drm documentation to contain more applicable
information regarding the removal of deprecated MIPI DSI functions and
no longer reference functions which have already been removed from the
kernel.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/gpu/todo.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..92db80793bba 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -497,19 +497,19 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Intermediate
 
-Transition away from using mipi_dsi_*_write_seq()
--------------------------------------------------
+Transition away from using deprecated MIPI DSI functions
+--------------------------------------------------------
 
-The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
-non-intuitive because, if there are errors, they return out of the *caller's*
-function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
-and mipi_dsi_dcs_write_seq_multi() macros instead.
+There are many functions defined in ``drm_mipi_dsi.c`` which have been
+deprecated. Each deprecated function was deprecated in favor of its `multi`
+variant (e.g. `mipi_dsi_generic_write()` and `mipi_dsi_generic_write_multi()`).
+The `multi` variant of a function includes improved error handling and logic
+which makes it more convenient to make several calls in a row, as most MIPI
+drivers do.
 
-Once all callers are transitioned, the macros and the functions that they call,
-mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
-probably be removed. Alternatively, if people feel like the _multi() variants
-are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
-variants but change them not to return out of the caller.
+Drivers should be updated to use undeprecated functions. Once all usages of the
+deprecated MIPI DSI functions have been removed, their definitions may be
+removed from ``drm_mipi_dsi.c``.
 
 Contact: Douglas Anderson <dianders@chromium.org>
 
-- 
2.49.0

