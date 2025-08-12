Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4522C15B5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755031831; cv=none; b=Y8EY1u5qfB4mHRfB9JEIMzL0y3d/mu41vi9x8AWTpbjaMSsN1YV2+lk0qNAmTSodBOkspJSHPdgOZ9uLNdxggvH7ePlWpZ5PH8FNtQ/sGhA7CRZOnRIgJygtrBdguRygyi06aV3AocvzmfIMtR6OqbXHQFubN3l/HlHaYkcjsJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755031831; c=relaxed/simple;
	bh=al/6/16eT2vH4AdQRcPEwqIs5sRmNDd6EAUnIiSPUlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ehLZ9xm/dnMnSxhA0TiKwZjkQAHXBCDP2kx7ZaEHPzxPFgw7L5QxJDzv7kygac61xCtLPpUM9jZGHAiD7FNhxumiligbk7EWijRilqw3NsIImXQHJQR2RsoGcoe3dqmBiMqisCtiVUFeMMhU0jgUZy5/mK9SsfLx7Nv+1pskvn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmjXlcdH; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmjXlcdH"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26E168424A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqSOpAfLNwc8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 20:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A77E83E08
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A77E83E08
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DmjXlcdH
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8A77E83E08
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:50:29 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76bc68cc9e4so6121001b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 13:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755031829; x=1755636629; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsA3iRJ7B2vjUVSq+560Moe0TKpjqqTO4eEiulS8O4Q=;
        b=DmjXlcdHKjXaxLzGVaaV61ZQ3PyJqCz9q/E5jZkUN7xvaAJNFBlkwt3d2lI5wEUVvx
         MTzusqpx+hhoTj2fqNBGxdR8vhxuWxvpkpX3dBS7OFrQc4mGfbmoxu88ybnwctJsd7jY
         dAOPeLxYbnBIyEdWwi0Sxp/wnXDIfAQ+SBofAN9GCA1jJNe5ctef/2YtZ2AKBBXTpPL2
         41pmd6SwDBJpRlpdfbmVWr3cE7B/fjgIQtqD/o8xBpjJqDyXKD9jM13GAdbZQkaL95eV
         zbS3TvtwOR+agr/nZsF++olKiQ+3mFPW7nR5Ywzrf93JYby6iD7XkuJAGdmRZb1zMDFl
         xGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755031829; x=1755636629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsA3iRJ7B2vjUVSq+560Moe0TKpjqqTO4eEiulS8O4Q=;
        b=UyZaLSXhQOItldBPvp4NS9ZDGUyfAdsy8Yrau1xVO7c5lL5pIwa2ibZJUYeSb1ldsH
         RcbxerpZYX/XRv8e5PJf0xkGGWEKQ7hY+S7TI7DxqYAd5ViTa4Hkwfw8QhaDimE5ZXdU
         sUZ99JkXV7vDW0qvI8TLDF0eKgIqRoLwy/sztVOAv3f2698ksb37ebPW7fSqzOydfihF
         ifIodPqIHYTgcKZJKMxhJG2Pk49GToU7scfpBk48NwzV1wvtd8F/uBs6sK//+MBxeTwj
         d7B9tFD9RPl2Ol/sZ0J9g7t7fVFLQawa9aUSOaqRpscuMFrOkY1wN7HjqLC9kf/Yx07u
         Wwyg==
X-Gm-Message-State: AOJu0YxEYnSo91Nc9aIYslvuFjxAOree4WqpFJZRFCuGWGwqg58bIHzn
	K+PyOLAP9o41T+YirH+cj3+HfWSzLShAujZ/IB+pZyECyI+Rs5CUs4G1
X-Gm-Gg: ASbGncsqMW6xfr+8+jeochH3gzZ1S+xO9Jhcj38aWllR8mYTn8xZXfTGjTTta3AJKwn
	InYub2PDd48VHVPYlrfUC5jm6oNvdB9zOQ10zawEzxNmV1iitJ3jcfLoNvLgH3/XRlJnbUab5kZ
	oC1Z/0TmvvD8UCefJ8hy4psEpLtS8jI1ZzvgcXr8kkzTNp9VclF5SSZ/dp940367rRRxFQD+jCX
	qHJDlCLJKqSMmfJyXxi/RTGnmrqjh0MO0KOiQls3Tc7ycU+cbMKDtLKBvT9FRyQ3aVHPtSJvk4U
	E5dBSdIEvwab36EoF+d3HOj753ynxPoTdFF/ng7RC9brnJXOkXaJLTNfIf5RwsJ9mpXaWTDKDxW
	sfomKov/ZOajs20Megx1qMVTSeSbgjic=
X-Google-Smtp-Source: AGHT+IEMd5X/NZITl5GMZS7P8hBm4ung6Q7CDxTJj+kP/B5/fg8CbQ4kXJWN3De5dPmu9AkDHSjDnQ==
X-Received: by 2002:a17:90b:3b46:b0:313:15fe:4c13 with SMTP id 98e67ed59e1d1-321d0eb205dmr607962a91.27.1755031828829;
        Tue, 12 Aug 2025 13:50:28 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cccsm76048a91.18.2025.08.12.13.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:50:28 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 3/9] docs: cgroup: fixed spelling mistakes in documentation
Date: Wed, 13 Aug 2025 02:19:46 +0530
Message-Id: <20250812204952.73136-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812201523.69221-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- Availablity -> Availability

in `Documentation/admin-guide/cgroup-v2.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index d9d3cc7df348..51c0bc4c2dc5 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -435,8 +435,8 @@ both cgroups.
 Controlling Controllers
 -----------------------
 
-Availablity
-~~~~~~~~~~~
+Availability
+~~~~~~~~~~~~
 
 A controller is available in a cgroup when it is supported by the kernel (i.e.,
 compiled in, not disabled and not attached to a v1 hierarchy) and listed in the
-- 
2.34.1

