Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A135B62F
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jul 2026 05:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475871; cv=none; b=garqoS9mcz+LuLAd2CtDF8b73f0dhOPQaEp6FCItD73i3kW2WU2vXdvja34mtS6pCp3D+uAjvRDFPFGtg2i0NfHPAZ7QFtcB2fAFG/ofKkx6eXPQDHebgoXfUqXA5gXQAfwp5i9BxX1xYFHc6rp9gWs1326rU43HCritPX9n/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475871; c=relaxed/simple;
	bh=6vY8NDrgvGnvBWnzXnTiMiRP7yvJ++bDYFqiPWAdZCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rEuXVhDNEiallnAwL3p0w5vi0XF47IpfI3tDxc3UfnvgxzK7jFyheoavklkyr7idxtemJsmDL2YbFfIamc7ChaQAVZS01xmFQXuJd4xeltIQPA0BOVq5eBv8ZE5WHgtz+nifaKK6oTi10iUsjjA4SZsKQyTNObif4nKLhFcB7zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/+9XdCL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/+9XdCL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f752b3423so410021f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Jul 2026 22:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785475868; x=1786080668; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUyp9U7dXdiG+QsLynyvNf4in1b+6GPKTpacp6ZUx0c=;
        b=k/+9XdCLn2gF+XWiTTteI+3S/Ua68BllZRbAjlUysrWzSHYmhwS935cF1xszhO3Cik
         r7V03IQ5EqHaNCYJcw5PZnr4PiwN6OO5jDGVgIVZi96IZGQX4plzVJuS9so3dAafUen4
         zEK4p5oyDmhkmG7BslW9y1y1O2tMi5hGLcTHfour/Y2lH8w4YagKCPmZLA9yikmd3FKS
         thT9NgEOPdypDhSawKO4jcyCgftUXr2aaRNDmWVkuMIzX5SIgkok1d9Nj+BTLrEStH9T
         6LjiKz5u48ck9qABy7Xb7JPv1t+il7kNQmjh0ug1IwAh3TV8brXtDmE3WoBnmHuk1wiI
         +jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785475868; x=1786080668;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WUyp9U7dXdiG+QsLynyvNf4in1b+6GPKTpacp6ZUx0c=;
        b=JG2hyw78kAbiysYQeAfKDN62+As6BSDQFjlFMViGu3DoDEZGj7KNmHqe7RjnAKzw8a
         bxnRc0cSn5E9GwENpfXFsnuDHHQYewZybkYNktJNL4V89McMJVDyMqZry0MNSyhnYluD
         6dnrMChLZI2GW+bwd1lmuhJbh4Ii7PdIvZufh9qMMXot7437YRCz5h4GquKmfrINAU5R
         KAnXlKRMm+ah3siudAizwq2hWTC33doetiYiH7fOhhrsYk0uBtolq9DvEmb4idT66ZAW
         ue4pqGA6WcWD+Ap40Zp03nxoBNDpEU/tsTVKoTbDUhI/AodvPuuhI9MR+rj7S0LDILQR
         DKRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoojvrYGnroLPwz3+BpESswfuzjf14Fyqd4un0wzZz+XOKRrcWAh+90/vpcxJXLu47h9F+8GkH5YusN3fdaLN2KvEI9Jg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpyL7bJ/3NOIDUbM8kur3duZjMigetbUKrdGPmlA9NYHitB7su
	ex5PpczyNHy8NIZ38xDguhSfdCe8NuJtvUxEZzQ4XtgKw+VMrZ1yoY55
X-Gm-Gg: AR+sD10hGcIpv2KtxCiNGQ9uEC07L+D6ZJHXv1zbLBgmLdXpAMAox3kOWb59T+WUXaY
	YeQeDEpL1c6a1WpytovGaJOY4MHtrLQa/thNvExlfzZmNN6vuNOWkktSEDLR6oQIhpgzxsQD8Eo
	nI4yGKghFJqGrLbD1VCd316s8uEURYpU26tNYXzSgG+DIiCJpEdxLYQjK4VHLjcPFxrTQvDrjLS
	SlcW04IInlaos4XhxmWfzVuAJ3T7bfy3z+KXWq1gd8has8fbQoqjMmmUEAkIye0l0PJJl4u0KHB
	tI498aivifJjKhqA4cc3ph2uJ1DKSc5jk5Tosqseq/XOmZ6or7sLaLl4tWra4jGrF87DMqQm299
	PlF5R6Xas9cgZberNe9WxPvcspcjfIFPIEVs7dfLCqfIw9oebIWGNF+z69dYR0ER3gBxLY/uIw+
	ppJaZpOGOlf7TSbJdW7KoHe1iDD/s2Gxm3Ug8zVlyR0m1uXZLYlIi9PtaEpOtmv1ZPPKPFnWlFg
	SrfbCdLuZI5xF2nIqYp0gjUuFXInZfUnsGMUAaZbiZg4P1qoBeKCqZfBDU/JD0=
X-Received: by 2002:a05:6000:40dc:b0:47f:9d0e:f8f with SMTP id ffacd0b85a97d-47fd2aea087mr1700034f8f.26.1785475867744;
        Thu, 30 Jul 2026 22:31:07 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a5a4sm345470f8f.20.2026.07.30.22.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:31:07 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] ttm: Add error handling for ttm_pool_mgr_init()
Date: Fri, 31 Jul 2026 07:30:36 +0200
Message-ID: <20260731053047.24503-1-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ttm_pool_mgr_init() function can fail, but its return value was
previously ignored in ttm_global_init(). This could leave the pool
manager in an invalid state while the system continues initialization.

Fix this by checking the return code and jumping to the error path
on failure.

Assisted-by: OpenCode:1.17.8-Big Pickle
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index d3bfb9a696a7..c880a0430363 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -96,7 +96,10 @@ static int ttm_global_init(void)
 		>> PAGE_SHIFT;
 	num_dma32 = min(num_dma32, 2UL << (30 - PAGE_SHIFT));
 
-	ttm_pool_mgr_init(num_pages);
+	ret = ttm_pool_mgr_init(num_pages);
+	if (ret)
+		goto out;
+
 	ttm_tt_mgr_init(num_pages, num_dma32);
 
 	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32 |
-- 
2.55.0

