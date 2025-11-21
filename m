Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF85A2DC331
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723556; cv=none; b=RGrcfOsWTEhmQFH1CeW9I70ZtTrHNTdIQuBsR47mh6kkzYH5VH4q1Or50AQD2wMHlNGXeBfCcCtsHcrJC2asXBGQdvM94+cyhKYkAU0vgnrfh0QQs4MwCgfHCY92MRQaYdZFt/ZQ61d9J/3znIWwSS5ZZIvOAporuNUOwpX/tfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723556; c=relaxed/simple;
	bh=tc4+3u98bEPniH2AnCqnRxAw+TsOXyTMjGdUFMaQLs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=PdiPL5Fsw8sKBrQlKkUOefIOkf1A7PtY/7YGpEylF0CdbQszyE1oo+Sxg3j9E7/6KNhUxUZeUvjTUnkAfFriuH/jA4rAUWlME6qm8IfpWga97dpLEcLwf9lwihEKRz+YsXRkJe38zvbzgb+Zn7HXs8zBXxrGBfTzU5inqktW/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=bAa/55CM; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="bAa/55CM"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16794410DE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 11:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-6Mur5kHdyC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Nov 2025 11:12:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=98.137.64.147; helo=sonic301-21.consmr.mail.gq1.yahoo.com; envelope-from=adelodunolaoluwa@yahoo.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52DD3410CB
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52DD3410CB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=bAa/55CM
Received: from sonic301-21.consmr.mail.gq1.yahoo.com (sonic301-21.consmr.mail.gq1.yahoo.com [98.137.64.147])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 52DD3410CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 21 Nov 2025 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763723552; bh=ZpzbArORoQiUT8YXESlTdmN5tbyuCnxl92H5GVY/kYE=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=bAa/55CMGaoFL7FwwFpv/HTeoHkRfk1okzKBZ2gPKjpHHeGRMDOCmkl3S9IxnbOwi7mAuQvFMV9PqyUNJtRnrMEIJS/t1pRWwR0YVsEqV/8RevEr36HcNqgC4yf5BJkQudiOaWt/86DTlzqjTqW2apjqOxgqa1jbAWRSWCtxMQt2Pmwl1cjaIAgKWk54OlSatj+IwET4iMy6UNEIu+Ol8H+lYvBLKqFpMrcafYXZtrjWUdKUbeqU2cwXzB7pdGMEq0wnlU9FASyO6RNS3AWmJ9Jvk8BaOnyb5jacgLFkCHE5mhV3z+2Dm04+ACc+yV3fpURaUkxTE6dDFcFWA6Jdww==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1763723552; bh=WP0p1aG9ZPyb6ryKgWg74zjeApU+Qgv761pf5GF48yH=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=aAlpqAnJx1rjemuUlOcUFnOGqrl/dudeuCfGlWaaINICxfIRT/pcHXRqaNOZfmTUFcRncPrpOkRkfCVJAF6fYxZU0QJqRhHOsEICSwHzJy52iEcYwUxTaLC6e0J0vtnRS/rCgcTojSgnbQz3u6PG+9Cj3sAATyNKBNqcXBL/f5yvoxVe+xxZhjnxpyTvGJsFb+qdavOrY3dCeUZg2YZNMOcTcxthQKFKdveheBttocVI1Z+O/Lagmm+3YdbljTxF/uPEFPp1n32AJlGWqRYchSSFKxM6qSEA6G5w9Y7swMpU0IEX+Og13NMIkfN8qidP6cgdUjnLpP1tk3ua/1AR8w==
X-YMail-OSG: Xx0Kks0VM1lGKyITh0GG3v_gJtAto7gyfJ5TyJ.gS1qMdTHGh8Fyg30l7c8W.24
 vNKlaGDONlDwlf4ChAl1L1I4xwnT37wSF2C1v7T6Y2TVmcDvF5EHxhF0NeTMiN18RKe6.s4hgtb4
 jK2gk51TEKa3kURb0TM4L_pPs.dilx_txjlHTbdTwuXUoLuoNJS_wKeOFOdqxCDgztP9OeOKN01R
 AaNHAjM1UhgNG1OdNkXJb58WkhV7cP4AhhE_qzRHmH40Wa_Jgf37ee3OFhD0aBeZhqJpe9xQchJt
 Etd8jhPooUot0tsA2hUzJPWYv6bb_LlixfOEv.Hpz8raB5Eif9c9hnaE7voRRfhu3rEvDN3But.P
 kYoC46uat4HNVc7ib9xNEblR1ew1G_MnJjKP6hrM_1lZwjpT9WhWwo_Q9u7xujO_22Jr4eCkk_Md
 F0g_jRu1wxnBuV6o0t1Okxy6DBU4FdyknzPh9J9zDB86saSTRPRxpr1nYslkBgTB9K7SNDjAOR33
 nnP6k46iTxM9qDbyxuKzg672IKJSuf73ILFOHwNhhdc1S8gTLaWkmPnurtuz6ot8aikF5.VmzDDK
 WfqrodwGRBwbbEjBewguJMDL0TE4oO3L_Cw4havUUMONh.GxIzp8NWz.lKuOc29TwwRsSlPIsNlJ
 8mHxGygnbj7pToNqbQGSvRGCsO0ylqWlBcRq_ekvywQqKIh_0JySNsNU4DzFQhOmXYIBB0Xd7hZo
 cICieoB2AIPoluDPMxuWxLsWSOar2CqUtqOdMZolR___sZL84cseYApBZKvO.UOs.thx2d22ERG8
 l2PT5foZPjDG__mvAh9eC2dMjILbR2qgkGzudNLW7f48iKwEjac9EbG_SfJNt83oU9.K0vAGT7V2
 ykt.cfWYlsG4osMngFZCE6l7P0ENeIedjYBn9Qm5cPJWKbOh7cbRT8xtiiBl0KCUlANavTH_WSmv
 cG2Oo.cDuqyeILDKbwxNLuHwruJ6Jx7Oq7XbfNT.AdqRETBR3j_oRTc4TlzfXWjXAHWxp2oDMOiA
 Y3UMX959j9mde3YHwvv6VVl8LlYJYHHACpmNjAT2ifC.euFPuOe_0R2.IagjlSob.yykcUxUEDBN
 WADL8C61ZWIeWubxTNR9F2E9hydqysqwiFXyzoNO0n8SsrWE.KQiLVMaMFP9mtZ7ws4jDu59GYpc
 5hDuRLB8eTAG4UpSNXLGCCymwqTmBd.lRp0bCWYJB0Ia3JXeO_o1kw6hAT07A_j8vmsrO6lAGU9P
 a2_RBqHLeLpdDUHSL8XNpQglfOYK_C_HVVc5wL4kWwhkzRTaTdcskWnIqJbF3Gh5YCFEHeHmDpPS
 34M7mPvx4iAdDVOt0HvCUjblP_ZQgXDvgbIDf0bT_tTLT8rM7z2S6QsHFByg40rY313euyWdEPce
 hibsCd3Z0Sztq236Ur.Qa_njf7rPa4yEuhGT491.uiDEj.DzdyFn0uGbnGIWdeHFmp_7VYTY0HL8
 rzTouHWjIN47nAiSeMwEB.hhIbHHYKcIiJS3hnHd5.YV3JtoCXS7rLKTTHlC_LEX9DK4j61LR_ef
 DPf_wXrKiF1mRtOMbESq2Axbr670j0HNy5fo7KMmiaL4qsP_nTKM3NwzKpQrigorsd0hPPyB1sla
 qHJ.qgaeDQF0pm_kGgzDyAzrbdk5JfvNWTX9l5iKYsIoGBaUlaTCbQRYn9DUnux1pNurcDOYQhV_
 rAytAiR25iKeQoYTOhJB9dLXxjFXVfnP43CNXPqwznIQ7ESXWDFLbM.MUvYa668c5Kfj_QcwfwTF
 4az_GVxy3R6J0BnmBBYETUsdeQH5ycR0SGWBUwV7swManR0D7W6HDgyztYJJpmXPnIprPpEzPuz3
 XPvUkcCro8xh6ZBzOrzhGIZhhv79wNcaSeuJH4sKo46hjPnB2WeEsh.dsXfylZz0oZrCxcgFzmhr
 vJm7qu89NDxbXwSkjnmrInDnSfyvVNEv9RHwPX7UuXvjfFmsVld6IDYdEIBlEMDwRSXwNchpPz1V
 ZJj90948Qosnr_cdTibvGsqBHolHUG_86NLR8tBqQt1w6h_PreiluCVkv771zs5CsvYfaWCJvvPx
 1bNu95V1KZjNF7YrN16SrQUBGURYSwz07da.tErQRR20ZjxyNFVIhbd4E5IqiZrzvAMkOqoXJRZa
 0XrIE_AI1wpDnWj7alz5oLodzoxTGVYz74odzplM6H5VqtPCfpgQf2uqTIPn_.dvBKN69PX4oIn2
 P1NioxtRhJBOSNBnw2MtkN6vqB6FZuy7DrBdwpdwJRM_YEvBMwM7_uwZHPKlVrUzB3OOnPKS.x4y
 Nh_zp4VQo.ZiMCQ--
X-Sonic-MF: <adelodunolaoluwa@yahoo.com>
X-Sonic-ID: a24d1958-2383-41e2-8435-84fac2b73af1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.gq1.yahoo.com with HTTP; Fri, 21 Nov 2025 11:12:32 +0000
Received: by hermes--production-bf1-694dc9467b-4n74z (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4f59f4ac5a1cd13c29c4f181447596b5;
          Fri, 21 Nov 2025 11:12:27 +0000 (UTC)
From: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Sunday Adelodun <adelodunolaoluwa@yahoo.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] android: binderfs: add missing parameters in binder_ctl_ioctl()'s doc
Date: Fri, 21 Nov 2025 12:12:02 +0100
Message-ID: <20251121111203.21800-1-adelodunolaoluwa@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20251121111203.21800-1-adelodunolaoluwa.ref@yahoo.com>

The kernel-doc comment for binder_ctl_ioctl() lacks descriptions for the
@file, @cmd, and @arg parameters, which triggers warnings during
documentation builds.

Add the missing parameter descriptions to keep the
kernel-doc consistent and free of warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes:
https://lore.kernel.org/oe-kbuild-all/202511201725.ni2HZ2PP-lkp@intel.com/
Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
---
 drivers/android/binderfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index be8e64eb39ec..47f6d1e5971e 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -224,6 +224,9 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
 
 /**
  * binder_ctl_ioctl - handle binder device node allocation requests
+ * @file: The file pointer for the binder-control device node.
+ * @cmd: The ioctl command.
+ * @arg: The ioctl argument.
  *
  * The request handler for the binder-control device. All requests operate on
  * the binderfs mount the binder-control device resides in:
-- 
2.43.0

