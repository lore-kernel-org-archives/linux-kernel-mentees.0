Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6C218AC1
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 20:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753907284; cv=none; b=beFOKC2gNVZn3uAbLwqiIizutHOCIuaPbtCsbOlMol2G5AkozjAz1mP+HmpFitqDeldmyft+mujQdAx3TZqn6zPta/C9a36W+nonMcuTJR69zxhCnOLUxCxTcn2TYtj4G3rhdOJ29cmiBJaFw6F9nMymwRwLzcuRt/wToZ0/rFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753907284; c=relaxed/simple;
	bh=Q6LIZ9VfDbEASLk+68Jb8+v6eC5UQlBlmh88PSjJ81I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cz2aMOgTxjR3BRAhKzT3NtyfMI1vpojSFNt52J3QGLTQan5kaNVKtgNBBmskj4HoOfTcbXoTqiSZ8O76oPi4HuV2/Lw+NDasHoYQ8IhoEXJgcFQDdpsad5Exu/bw2KbkOM0plHJBpW1bCn4i7BudC/haDsn5+ybri5cECjKH+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoWMHdXN; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoWMHdXN"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76bc68cc9e4so232379b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 13:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753907282; x=1754512082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgDycgduAUnq/4+6cJh6R3cHxik209mhVrzWhFm9578=;
        b=LoWMHdXNMGZoTygp3mXOT0qzxl8Be3277MyGxgIIO1cEUzQ7g6So9yGJCVhY3Xbfuj
         jatf8eHA81yqJzZldDmxuQO/PY/hhZpCEhzwYtjJXwpLQt78w/cNnqlf1mb17yAd5F3a
         yWmYZT6MeWXjYqIq0w+6xRGD+1VRV+6ztXD9X9nqvu6I6yETaBNxrDcdsoOe0LwWN7bE
         b6QpiKu2YIzCTP89zfffP2FMqTk57fu20UJpi0Xkh/34APHnGO3bz4Z+/LA3GhR5wWrD
         iM641DOXk26f+8anjFJVa1ePMEONxxLq57cVhl+Iflq32WbvOt+ARlp9r3tx6o/6Aifv
         /Lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753907282; x=1754512082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgDycgduAUnq/4+6cJh6R3cHxik209mhVrzWhFm9578=;
        b=BZsBVkfayP1FaXbhyb3SlGFBhiUN5uL7Mbw3adhqC1tGBDo/AF56V+a/axVr33cLCe
         4Q3Tkfbab200xR0X2rGK+yjfW4swZY4TIccmJR9wPUlLwQC5NsduIzUOS0zlsHypxsaV
         9Pe9DkNjN+l/U1Mp5R+OW+c+GOJA1JCbiDoTe5DkegxbKW0q3qo/v64MzcyAf84Ir+BQ
         Tx9ojX35F2uljrH9vdSntqLHUjoxMxefeld7BrsdvWWaOYKZ55715REciP9PBZh8hBh3
         g+Oo37sk9lYOK+4Wn7x4i/llNV/hXsMk+imJt+NROQo84S5BM1+EAjwrXiNU59Iqzj4I
         Sbmw==
X-Forwarded-Encrypted: i=1; AJvYcCWcfgf+APPMHOeIgW/DnBoshYcveFt7Yi9KTHLil3VqerMHorjPzxvGChTbNR1ZmHLfdVVjtzhQIPVZHqB67wlY+XVdpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyb9xT2WO4/wMu3ydmHu+5qxEVTfh/BChiGiDWrfRSLt+n535A
	NHy6L+2ADm1GZCXdTkrgNSoiGohnfky2L/2MzWvJ+3+XbW2qhuA2/fju
X-Gm-Gg: ASbGncskq+OMQpbb+B8/sOpWscfxc7VXMLu0trLYfPp/4C81zZByIRG5MIMzIEnCTGK
	hLSfExZiYUdGTCBMCrVG9JGLfYXSzR343g68hi9z5v4UMAqKYHGxKOqoJkeI66vjkNdcgoMlxWV
	m4IZL7EjvBhHw5ehwJTmmDbaOSxG/Ra9vKff7cRRk/KITORISUUdbGNermxBtAGRJVFZD9HFPwE
	ch7uD4aW0KvlipqV7IV5El92Y/D8uPZgZYE9MRUbPlQES/E6qO9gZmhHSfBgGp1YAnPG5AGjJ8A
	q7lKCYcLZRQu/szLXqQul2MIBY414odkCtRQVeuYQ772HdQ0SaPzgPbj/HLGQXplNlT+WyX/khq
	9YEXd+MA8vp1EAHGCsy6PAcCjYPQ3fChzEcgt1SHg
X-Google-Smtp-Source: AGHT+IGLjgh/EtllwpcMQugZfIpJCA620ysg4LhMRyO7EP5nKjIvcOaz4ACdWsWsKJ6bRdSt2resVw==
X-Received: by 2002:a05:6a00:a06:b0:730:9946:5973 with SMTP id d2e1a72fcca58-76ab0924273mr7083720b3a.5.1753907281917;
        Wed, 30 Jul 2025 13:28:01 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bc5d321c5sm812199b3a.113.2025.07.30.13.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 13:28:01 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: skhan@linuxfoundation.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	christophe.leroy@csgroup.eu,
	npiggin@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] docs/powerpc: add htm.rst to toctree to fix warning
Date: Wed, 30 Jul 2025 20:27:52 +0000
Message-Id: <20250730202752.8508-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The htm.rst file was not included in any toctree, leading to a Sphinx
warning when building documentation.

Include it in Documentation/arch/powerpc/index.rst to fix the warning.

Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 Documentation/arch/powerpc/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..ae0280383315 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -36,7 +36,7 @@ powerpc
     vas-api
     vcpudispatch_stats
     vmemmap_dedup
-
+    htm
     features
 
 .. only::  subproject and html
-- 
2.34.1

