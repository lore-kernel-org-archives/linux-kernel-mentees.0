Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFDD2D0631
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032190; cv=none; b=b3ELdy3WitwmXQsT8zns0Z9TAfusGeluI0BP2hmyglzTpB4Icc70r8PuXtuJr0jEMW09JZVHybamExE+jAlZYTAhsbYTRR0p/Aey4xdgrkPMqJF0dwiwq3etl1QI5ofg5OQrIDb3IO46Nl/1rko4mQErSame8SNXqlXBDk8xR6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032190; c=relaxed/simple;
	bh=b50XDWuSoO4DukBYvfUq+UKIaGiKlcxo42yLKr/QuqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=liTh+GD7Xv3MAWX6g3IziaKb17uM5kS1uXsGACpKRmgsRtaki0E7uEfISrDNX/1oA1LKDLmcxHwsYgZqKsL8DZevLGCBwLMikkEH/uiL4w2S2j0+d8ti+T3DPAniUU2rib/1ob8wvDPWeKcn4W7G5UM9wxMMUYXYovwTf5QFt98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzZMF0Ii; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzZMF0Ii"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E046606C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sejAAlRhJGrU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 20:56:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3B2D606BB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B2D606BB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kzZMF0Ii
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A3B2D606BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:56:28 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-76c18568e5eso6665325b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755032188; x=1755636988; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQLcr/Hc/1la2qzpBNmuXzcig5cEllMajLPohQU0lJ0=;
        b=kzZMF0IiTiuIqtDA6IPI7uzqZxSdmxECVtd/Y/Q5OuLntEuU54YUgU6D4I5OeM1kSI
         emqbc8xJCLNM5o4XX910EVpErlbQ2/wo3dZPuD0bhzWFiDgDQZehstsrOgncIe0Ol8kt
         4vSq+UlV7ICDzIhhEHeGaMSCB/nLFnSMMDk0JST4jQc5HNiN9dX7UwgevEdnaFQ0qXen
         WHKEEv0Phot+QZFv3Xkx4tY2cOWYz2MgKePcZym8FLs6PdMMhie5prmMiiIGr5p1hFlm
         7AIC1o28+VnnhBXJn4qgUn+gOLs1EqVc5W4tRUfw3oldaAJwvZKJf+Zg+zo+fJ9HC4Md
         3qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755032188; x=1755636988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQLcr/Hc/1la2qzpBNmuXzcig5cEllMajLPohQU0lJ0=;
        b=cSkxEtvQb+gfy8edfZavmuxx3qu5/RxazqvKa7NCXoM4oPFLzMvg/t8CScw61CwSzn
         IdI8g7E3uN+btKJfRkGEtzSKbB3xxgH1Wg/GvAUwQnR4PNVMFCgtigKeXCNTh6jYEzDl
         I5U6kefd2y4ZfYNuzm7g0XCJavSCgncqm9+n4VXlkXMHs2eSgc6JT2bwwAEGW5BS298j
         I6lw7m6QWbTzLB1IxzJG6bhBBb0IPCGzEvmZkMoeD/UZ0UhTSHQ1kUJUOz9KT0EhtfrI
         Z27SjJQMu1d4g50vB6ERUHfOl2qRIJ+kZrYl0KOS97uHdDS+htN5PazjwB5fb4Xk/3/h
         HhfA==
X-Gm-Message-State: AOJu0YxE5DU/WeBRRUrmD+kU/Mp8A9+T8hi4qzSW+JSjmhY0rsl6vBdr
	Q3bopa6OPU3MKiOVCElHX5PB9ZOSeiVcnYOU2k/qgWpEMXVRbtFP6bOI
X-Gm-Gg: ASbGncs38NDufDkaF7pxZoQmO7EZ4btSizf4GetdsXGfVKE/q34BnfbddLxJAyyH3Uu
	4/zRcYBAoyfZWBdv1FJ9gYZJTE2VLafM0b4Rra7Z3LhbYW8AG9eOxFqoxHwJzQqjqCqPdq6mnMI
	pQoMx6+QXS3Vo8WYazV5d5LNm/MkW4FtGTtjo99DuQjSSdY+5zOwrT4Yitt5ib4U5W6pwOZm1xU
	HKFJ6THS3umRrZfnozXxVrvONaxct8sXc860Gi3+CDBbeAnjQEigzbHAbMKTGYxxNuotl9sBlTF
	Kg/bk+6n4m//zzvdTnklNY+YlSgBOMyudoqnRDF7bqtOCOOfeFij+vQS2veMK6PNznZiwqFH9vX
	wuxvK7U7NKVi8+w/S5lmeLtj3FSp/t9A=
X-Google-Smtp-Source: AGHT+IHj3Rc8NkX4woDnqtbsC29mLapjLaI43gJrsz3K6HVsCx7MUVlry0TFBrHh8QOjrERbBRqLwA==
X-Received: by 2002:a17:90b:1c0e:b0:312:1ae9:152b with SMTP id 98e67ed59e1d1-321d0ea6458mr520513a91.23.1755032187823;
        Tue, 12 Aug 2025 13:56:27 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cccsm76048a91.18.2025.08.12.13.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:56:27 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 6/9] docs: damon: fixed spelling mistakes in documentation
Date: Wed, 13 Aug 2025 02:19:49 +0530
Message-Id: <20250812204952.73136-4-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812204952.73136-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typos

- directores -> directories

in `Documentation/admin-guide/mm/damon/usage.rst`, and

- multipled -> multiplied

in `Documentation/mm/damon/design.rst`.

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/mm/damon/usage.rst | 2 +-
 Documentation/mm/damon/design.rst            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index ff3a2dda1f02..5cd42d428c89 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -357,7 +357,7 @@ The directory for the :ref:`quotas <damon_design_damos_quotas>` of the given
 DAMON-based operation scheme.
 
 Under ``quotas`` directory, four files (``ms``, ``bytes``,
-``reset_interval_ms``, ``effective_bytes``) and two directores (``weights`` and
+``reset_interval_ms``, ``effective_bytes``) and two directories (``weights`` and
 ``goals``) exist.
 
 You can set the ``time quota`` in milliseconds, ``size quota`` in bytes, and
diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 03f8137256f5..de95cc74b0fe 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -364,7 +364,7 @@ The tuning is turned off by default, and need to be set explicitly by the user.
 As a rule of thumbs and the Parreto principle, 4% access samples ratio target
 is recommended.  Note that Parreto principle (80/20 rule) has applied twice.
 That is, assumes 4% (20% of 20%) DAMON-observed access events ratio (source)
-to capture 64% (80% multipled by 80%) real access events (outcomes).
+to capture 64% (80% multiplied by 80%) real access events (outcomes).
 
 To know how user-space can use this feature via :ref:`DAMON sysfs interface
 <sysfs_interface>`, refer to :ref:`intervals_goal <sysfs_scheme>` part of
-- 
2.34.1

