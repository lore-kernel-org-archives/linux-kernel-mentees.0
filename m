Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6A232BF52
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jun 2026 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781437744; cv=none; b=PR88NxlftlwiYcshDKd7yvAKruK0RDlKeN1MDiR9s4Ok1Uh21SwMKb0CRBvXX9qJEutT9T6dnD+mlD1Ei1xrZyW4ymANIC0LWeuaSg4kcOKDXJYlXLUk/rIsAMavQG4wg5iCp+0C0yS8Gq/uPVRehE1YWdYorPocNLSRzfmfzG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781437744; c=relaxed/simple;
	bh=3eQMYrqcZR+H7vo5G+ve3stl2q1Lclf1qKjKDAMgdvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9ruHjn+EQ/BDWaJNi+eSsMfirLQ7G6GGEiKpc2vqdBb3sqyDagGPhbP7dMO/+BCbpjUggp/7/CKNE3SYcGs1A7S5O+ROEgYxlZG75FSAbLVZ8hX1p5J4TW7129ExvScTyk8THtV19QjTXYgfLsyGDfwirE6q5M4aehvRiPffMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ir74v5pg; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ir74v5pg"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 989F360E95
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jun 2026 11:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNSBBMFy8EVw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2026 11:49:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ayushmukkanwar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D55A060C05
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D55A060C05
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ir74v5pg
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D55A060C05
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jun 2026 11:49:02 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8426e2eff71so498252b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jun 2026 04:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781437742; x=1782042542; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nst4RlWH0dhLsxuUph3akJxwWh4r5iV9JHBzF1t7XFE=;
        b=Ir74v5pgPNpuQ1Q29yFxUvgxWTt7QNlMZD3rjDJ6Cge1bau5+bWJlqDgEbYXfOvKt+
         dNMWNCfOCKFplZFG2FYfHem5wquq4xHHPFqm1PUsaEY8Z8MwRE53VIppVk5pLx7QZf28
         W67r5zg8OVMUa+O6H+t6/5kBEsCOwCvPSDSYnv5/5rgiHRs3PhXFTUtOk7dPbQDX6Klp
         Tvchs4u3W6ORXDEU2q625lDuk0Ly3Sru66mEy/E0bzCfxUhv1uWYKTLYK3R2p9eTyLM+
         8UXdW8mzAjcFkMqEARFwCoP2cJ3A9xmARGIrsMNnM2ifunim1vvZAmh55olrIOmY19rL
         LWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781437742; x=1782042542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nst4RlWH0dhLsxuUph3akJxwWh4r5iV9JHBzF1t7XFE=;
        b=G9LicxcYhmuatpV5ZQk+Ykfx8l75lzPLSIUQ6xvkRUtom6crSxemN2Yw30SvYJmLiH
         qc29gleJVe6UzILWFDJN4vLKvI1jZ5DmeWd8ElN1UWMyshUk97+ch3u4o/Ibbv33cV9a
         2228zEXJV1B9vwKKdxjRXgh4AQ5YvOt/vhyM6xkqyUux5uNzCULxkWP+Pznuyl1FZkwI
         vti5Khepy2tmAoynzkHfb98EJLBPwkdnVPnjPkIkvIQU7NadEGlMFDyBsfFzUcFe3Bky
         1Iv2cLli2qOMfqqH9aJdyuXoahvMq4XwfyZ+QCqt6uxPET6pqW7L7bt+hjr2RhLVQZey
         fhcg==
X-Forwarded-Encrypted: i=1; AFNElJ8MESOUQfQKKJfrd+S2Dt5S9nSem/Wj9cXvQz2RUsvrs+nU1qLosE3V0u9jsJfru2+Q8/cicodMRc+6SR6fL6d8A6PZXQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwLhC840LaKNN1TVRV+u4ud2ErDkKCVufbj9BCflDr3MItQJwFU
	YmSsjldTVomZ0ocUt0t6jwqFBD7yoUatSsJ+fo2fO4KCU6/Fu75R1MOII+OKtA==
X-Gm-Gg: Acq92OHj7dltVtFBBZdJkGiWzUwp1+ag1vViyxxNvNeMI7wGTKjWbUHt5JJQTfrYD9k
	PUBmH7LttZzhoPxD6S8UZ+4KfojFk7sxzqVv88U29fkohy+CNHkKYZc9IAlCGs0nMj2zPVlqn50
	kZacnnW2kp3Xe2S0ml0URotE0bqx9/slZKHeQT1TuILwIui3kMRuhfEpvpg4hwcmrGhKmme6Gzi
	Lv8PS74DNYU+Qi5+TSLRD2BEGdpEmtALiMzXz1kLjXuWAmfPHIAWSGZpScqG1tx+JspaCBuinTf
	mES+qSNZsJhpdk9slvJvolv9PhhaI3//RjWsc+zpqH2UFsipTkFxcwCLNxWIXSPkYmvDkC1IU99
	CRlETwtBfYWRXPqPH2rClHLlSUCxGeMiV08tkQbq5O9Mm9sAaYAP0QcXfrP4XVWWikjhRwTMa17
	4dJu5PMkr7LjLSCBxTEYwccamkurqUseHQRd1PokjXwUv9HvFUg9OLO05+2ZgbMwFhLuEl31L+i
	IZjNr7DpvGoiXOK
X-Received: by 2002:a17:90b:2dc4:b0:36d:b30b:14ed with SMTP id 98e67ed59e1d1-37a0156049bmr5522444a91.2.1781437741984;
        Sun, 14 Jun 2026 04:49:01 -0700 (PDT)
Received: from fedora ([2401:4900:79eb:8cfe:b4fc:6fb1:4b23:8420])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2179d743sm7388808a91.17.2026.06.14.04.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 04:49:01 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH 2/2] staging: octeon: add missing napi_disable in cvm_oct_rx_shutdown
Date: Sun, 14 Jun 2026 17:17:39 +0530
Message-ID: <20260614114739.87061-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260614114739.87061-1-ayushmukkanwar@gmail.com>
References: <20260614114739.87061-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvm_oct_rx_shutdown calls free_irq and netif_napi_del without
disabling the napi instance first. As the free_irq only waits
for completion of hard interrupt handlers, the napi poll
function could still be active. If cvm_oct_remove proceeds to
free the plat structure (which holds the NAPI instances), the
active poll function will access freed memory, resulting in a
use-after-free crash.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index cd36b5ba6f6c..3e9d58d32156 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -535,6 +535,8 @@ void cvm_oct_rx_shutdown(struct platform_device *pdev)
 		else
 			cvmx_write_csr(CVMX_POW_WQ_INT_THRX(i), 0);
 
+		napi_disable(&plat->rx_group[i].napi);
+
 		/* Free the interrupt handler */
 		free_irq(plat->rx_group[i].irq, &plat->rx_group[i].napi);
 
-- 
2.54.0

