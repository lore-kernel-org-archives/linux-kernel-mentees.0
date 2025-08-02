Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB3259C80
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  2 Aug 2025 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754162766; cv=none; b=TX87mTtmKEaIKU4lQPry6Enoh9LhyjThH94hzzd5KT4wBa5dV55wFrnccQNfjuJ6vdJ78+OJzrPmDEK8BKswktmbiZKVBalH1U43scVHQDqY978uYSKm+muvaQFM+URIL2SZV4z9Oo740Vm6JRg+GkDYN7O2lAI4IDhiCHk8s5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754162766; c=relaxed/simple;
	bh=z+5KRxYc5UqnilO3In24UU4dyirhMN0G97cy/9xmtoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bL5nysqLphfSpNjEpnPRcR4j2h7wtvUhYASsK54JgIheYNS0n89OPBIXgUk02qmq/ajTWwlV1VyubbjxVtmtAFVB83LPzse6Sa45Eb+8wpoLnH3N/9O1KX7LIsuE1rVxSg89TO3DmQojpOSf//FXpwxqfZnfbc54zKli4KtKPs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=iRCZSP1O; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="iRCZSP1O"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b4233978326so1475978a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 02 Aug 2025 12:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1754162764; x=1754767564; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CaTaCEwiy5ye/b7edAgdJni69arTuyowWyDQz6ouBQQ=;
        b=iRCZSP1OABz/A2N3/8jLRnDvs88A5UvfyDd2khhXGdNkcHj1X76Gd1J53cynOKnldi
         7q9jWctAfDVdWLwbclRT3adCdhhIDVcdPt57T2uQaK8jSk5Mxpe/eknzJbooG3ygGHnS
         ACj+ChJiKdOvfjLug4Kyr5498f0K38USX5XCkfQDlrLl6RNwdFmyctqPYCsEmSQq2GFb
         Uty0C4rc8WXp2kwU7Z/dHMh7+qmylGreSQk/TuIRuZJdKVqryKhGRQsrv+sV01fZ9zkb
         6r1VQhdZFYxIWpb/QHkEX0nb+8uhhc00tHIMnp7pgEMqSJjy9Mr1T+NIrqrgqVLuGf4N
         blOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754162764; x=1754767564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaTaCEwiy5ye/b7edAgdJni69arTuyowWyDQz6ouBQQ=;
        b=a7QoKI+9zomLqXtXFm4vfD5Rg+9F37ehATPpJZW6CXdGeg9+aMXoCrgtFCFHajD/mG
         1egzvdBYI6ZRAhk/ODZBkPCLRhhmwsoKPSlGk7kM6Jfr7ElIQdEv7aOCGwdwpX9Zs+CF
         Wn2JRGVl0lHwkunq0ns4P6KfGPhWdo0LdNy4UfDRBH7z2lcuSD+94awdBIasdFqG/wYc
         mWRX5zXgEk4GJz4Ahrwu90t7IXuhxvYElUDP082v/rvchfiJofOi/soRZK13juU07lNf
         B3eFsiOLxz1MNgj21zRi+8tolImlndrILp1aU7bjJZk59CtDILaroFfZnvYQdBwBQMuD
         1j/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDgpCsg8+0BA0cMVIqh1ap4yuGsN5cKhEtPXL+HVuOPuZQG45lqBEgNERfTvVC5/AwworTMyLVAuoEAkurdidO7mmAHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy8FVHwlz6CinHh4I6r0DAqQYwyLLp7ba/NrJZzWy1O6CJ1qSW
	8A55G9bRVq5NlZu/EomddKwUf2kB1eF9q5QmIF+NxMlQ06Qy1EoE0uwbYFXGjoBPO0RDWJL81DV
	eLYXsW4Q=
X-Gm-Gg: ASbGncsVfs8tOwLniGKU5ICAis9gZafvUXJDZxnGGCQBEO2G4jjmZeqK2qaI8FSjlH8
	MerpCKHWtBM5NvueYzUjIo/tODRggoIJLmhD2I2mXWv+0knxGp99FbCVi5C5mh/wDAYZGST2132
	uC0h0R484rMML0cSsZnrI8bMqPXVFHx9g8cWGeSaXnEiK0xGJ2R++BozhU+FnjWi48do8fHcdVL
	unDr3JLrmwzUN7Eaiy6JJ1K8CqrKZ6Ng9iPaUdIPKxgWUIcVb0VMLRWq6QfAIFgZ2ov5sFWFCE9
	SrLQa+RFOX1OtoHaMdyR/LOoQ/cAW9GtLTfuLrnD6QSEY9RPQcLjQki8fERxmh782tmtyc4shRK
	zZ9NZfT3XblJSFt9c4NUgRX+p8i3lrpiVXf8=
X-Google-Smtp-Source: AGHT+IGlEGRhwr4gr8Z2C6l17HnHwUs58sjegA3GcEnBznTqiAkjnii/hJFGH6edhQsfKk84gJlxdw==
X-Received: by 2002:a17:90b:6ce:b0:315:c77b:37d6 with SMTP id 98e67ed59e1d1-321162c7400mr5456322a91.23.1754162764043;
        Sat, 02 Aug 2025 12:26:04 -0700 (PDT)
Received: from mystery-machine.local ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3207eba6bb8sm7887583a91.4.2025.08.02.12.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 12:26:03 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
Date: Sat, 02 Aug 2025 13:25:47 -0600
Subject: [PATCH 2/2] accel/rocket: Fix undeclared const rocket_pm_ops
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-fix-rockchip-npu-build-v1-2-fb0f0dacb3fe@brighamcampbell.com>
References: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
In-Reply-To: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Brigham Campbell <me@brighamcampbell.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=me@brighamcampbell.com;
 h=from:subject:message-id; bh=z+5KRxYc5UqnilO3In24UU4dyirhMN0G97cy/9xmtoA=;
 b=owGbwMvMwCUWLsWS0KCyxZPxtFoSQ0ZfmttLvbj5zpsCrVsrf13/u/D0Iq8zjQ9rJi7bO1/xh
 NC0vObWjlIWBjEuBlkxRRaVW7PUL062fnQwgn8CzBxWJpAhDFycAjARBh5Ghq4JJYxNU1q9X7wp
 bjhzzWd532QVb1/Ljc93ySnfThC182BkOGLs/ars5/3PS6XmiIYWOsovjXy98ebZ4Le3D4pmdsR
 HsgAA
X-Developer-Key: i=me@brighamcampbell.com; a=openpgp;
 fpr=24DA9A27D1933BE2C1580F90571A04608024B449

Fix sparse warning regarding an undeclared const rocket_pm_ops, which is
used in rocket_drv.c.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508030021.uwdr4P08-lkp@intel.com/
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/accel/rocket/rocket_drv.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index f50634935b605c542cce16a2b91c1e43ec16bc81..2c673bb99ccc1d90e2dafdc89e9a5c6df216a309 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -9,6 +9,8 @@
 
 #include "rocket_device.h"
 
+extern const struct dev_pm_ops rocket_pm_ops;
+
 struct rocket_iommu_domain {
 	struct iommu_domain *domain;
 	struct kref kref;

-- 
2.50.1

