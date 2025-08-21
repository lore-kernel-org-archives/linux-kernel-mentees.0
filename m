Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664612D47EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755745311; cv=none; b=JA+SGx67bZBbMRXxw/CEaUolP/OhDkNbdbP8XZ3f3fhnCfkPF4CFXoDHLPN3X4GMyrlxmaOGGCweviliqahiwkPg+dPz2/Ec77LGOfKJfWHF/liAzkRtEaEvZ502RojDXNASYVQlYZnEm7wnbA1cDILGI6T4HnYpDl4W7kDNrGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755745311; c=relaxed/simple;
	bh=Jcs8Ws3m0JKE+7LCfB29ysWJC1gnGoNZf1A7NqIoPzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVkDa7wzeJzuHam4vQSSrJh4pvV/wmE+ssO4uKqaE8YZcrt0rrwLkRVXrXrk1GjMyjOrOwoPZ7J/ahy8tExF1BU+ANpyPXN3YHWsPZUxOBQJ/zzcxyNTodvhpc/Zg8AKJv5hJDRwEOk7T0KtgeTiavSyCfvHQX3GBQnXWPqoFtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvrWigcL; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvrWigcL"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ECF583F7A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zT4xZxYQyzhS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 03:01:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BF6483F77
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BF6483F77
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RvrWigcL
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7BF6483F77
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:01:49 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2445806df50so4565415ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 20:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755745309; x=1756350109; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dchl2bUxkqbgVtu+uy7PwD6R4U4jQS+j2652EoPkofQ=;
        b=RvrWigcLBrY4GVNf+cuP1jaY0bwZRhHcJYDMXrDlYDTABsL6lO7GvGGQ/JETXlpCFW
         r6RgP8fzL4llpylsOR8eSgGPNUcZQHDHq/GeOLo0S17QEi++fTHdozNEv6nV2wO6DS+F
         zLGbIoaMlLonerOu6JuY0MR662CVOqCxX3leb7BPPEk+Kx4aGT2UuAVg52RljGB7k+BK
         lZmE4oYepzBhTKflccd/dmQI/F0iYFs1B4MzVVaVXYLV0zbp6zEVdyDM+S6nILE+KUp0
         IjYdKknmDRALZB5h8PzZMhgpPZRMjI9GQD1uN6LGe2sHhzM1Y/RJrpAKCjVFPMw7mBYj
         W6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755745309; x=1756350109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dchl2bUxkqbgVtu+uy7PwD6R4U4jQS+j2652EoPkofQ=;
        b=Iy4IGhySdDhCRz9/tCqneRfPr9PpJp0605bqssBslwo4e5Ac+ccG1avnFPaQ0ONUWJ
         CP4UIFz7BZ55NxhBUhBS4hh05fLQiQiQJbdcbx1bz/qTrvNcWbTfffEvL5rtbjkMnywO
         jAQsqNovz7L0ZzUDkpOzFbl52ycRuf4YEFfP1GX66j/QK+5LeXR/sk8EX+obZFEZaT+W
         UFmeS0skhgyHISKVvaR1o0qnVn3Z2WLEUEAFmw45m82jzolWJsE+P35AKvvYv+g37qo2
         PuXRjzkvmqIPPuf2II9piSHCSnCMUGAzT641XaZ/5ua+GiD/Ehmek6oHIH6DDBckM7ug
         Pf4w==
X-Forwarded-Encrypted: i=1; AJvYcCVluXNCbeuE4Qg/slcy7tvxfn1S90mSK6I9bZotuSV1eelaMyTkKJ4hfwZ8JS0HPyo9NOkCK9/4Snu51YXTotmmENTzOQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy9AmxJLEQhJazBtYwb8XDdkNCxMx8UOycFj+2UL7jN15c/cXOe
	cgZv/6eDiwyhPaHN6mRIfQtJ1wxUeJpl/lbD3QhAA4v/CgE8S1EJv+RL
X-Gm-Gg: ASbGncuMmsZgUND+O2lSm+2oDO9qNWYZz5Fd58HPCryoS56Am7uuC8Fbq1jns6VHmC7
	Nix00CuvdsDYsrsD2EqAeGe77mCkZZuZyGPr0VRl1O2uN79goro2uhOoA74ugOLBW+wEUJ557TO
	ACyiPkFXgBpBTYZLDGwuF1C+9av9YX6JJ3woWCGgCluQDlNQl8/u4S3B/ZOGh0lJGvD9xxw/7uy
	3jKlilX6NNKKzt9spkuJxFLwkWZYl4zom+AP8jtL/XJ1PssBKrJBBR/vpl2OYy7dCMPq2mqwzLa
	5vLwhhP3jFGuvxACruLeW4l0P8j4BhRM0bPeB0LgcX1D69QgjgoKFbmPgLNboeJaubwtFymdb7i
	ntURhPEqPP/Qu+baK/apcX9X+BNQ=
X-Google-Smtp-Source: AGHT+IHsGc+xADnS1KQl1Eq0/IUY+3ItHxMypYdEF+dKr5ceq+9PZoCw5+c5P8t1BY/0NJT8/0dLRg==
X-Received: by 2002:a17:903:384c:b0:242:e0f1:f4bf with SMTP id d9443c01a7336-245fec053e8mr11669045ad.18.1755745308564;
        Wed, 20 Aug 2025 20:01:48 -0700 (PDT)
Received: from lkmp.. ([49.37.161.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c73f2sm40160695ad.94.2025.08.20.20.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:01:48 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	corbet@lwn.net
Cc: tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	harry.wentland@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	rakuram.e96@gmail.com,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [PATCH v2 2/2] docs: gpu: Fix spelling in gpu documentation
Date: Thu, 21 Aug 2025 08:29:56 +0530
Message-ID: <20250821025957.22546-3-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821025957.22546-1-rakuram.e96@gmail.com>
References: <20250821025957.22546-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed following typos reported by Codespell

1. complection ==> completion
   implementions ==> implementations
In Documentation/gpu/todo.rst

2. unpriviledged ==> unprivileged
In Documentation/gpu/drm-uapi.rst

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 Documentation/gpu/todo.rst     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 843facf01b2d..7435664a1ffe 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -535,7 +535,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..1d064e617699 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -319,7 +319,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -854,7 +854,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.43.0

