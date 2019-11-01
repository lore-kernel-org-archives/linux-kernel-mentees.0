Return-Path: <SRS0=TMUh=YZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33A1CA9ECF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 16:05:00 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4EAC222CB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 16:05:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcjs1Zci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4EAC222CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 97C39EF2;
	Fri,  1 Nov 2019 16:05:00 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 07A91E3D
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 16:04:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C5056876
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 16:04:58 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l24so6751085pgh.10
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 01 Nov 2019 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=i2tLZxbCCHmnoEpOsO7B5VVDeMXO3toEiyrLWd0A38o=;
	b=hcjs1Zciuo/RTyzZa9A4iY9n/ubXJ+Fb5DeZf+wGjtKZhXalQQPjqr71znd3veulnS
	X2oTu6EaclBjH+E1XQ/PsJcCPBBEa4YseuLjPZXm2JgqsjNCPkqyvO+fnzrBqOwzaDYL
	GxBDgmjYDj74tdnnN6jsJqtQHW/qzBnwbVyM1Saqt6pGa1156QtgSV7cfUxw1N51hbPT
	6B7ZcAFV33q6fL4jxVJ2uuSzcNukM2ujBGw41jgTx86HWQ/AbLoJ5er70djeSRYfibDY
	/qTCBJJG66Bl6gDKulKI5JJVLj48F6EbttJgn4H2vx1jjkfzOHRyCJqc/18S+viGapNV
	nUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=i2tLZxbCCHmnoEpOsO7B5VVDeMXO3toEiyrLWd0A38o=;
	b=OS7dXzvVri8/j5WWYhO9FDGoJ+KIeYTKx+HOrQj7+rT8Et4T0M+WfzGQHjq4RisdW7
	y++qRNB1IPz04zi3dvMGyzcCEBpOA5a/2sVQmx7JhysPpir+hWDc0/tU1Bz0M33DRUQq
	tvanUCqj8izI92K+g+KTp1hdoMjNXvgoPyKtH83VT/0++8kzN7XODbzmHudfmz1Gj3Oq
	0QCFeNvujL44fX3eyQsslPf0c0gxgoaSkvSKYcDhSGDKlFKhHKe3GGYSHct+LmPfsziv
	2hGuSUHhYNI0XXYQys8nXHV5mRLN0oR7zCe4lzPXmJVE+O7+7D2jNRXNgOs64IGvj+6L
	doMQ==
X-Gm-Message-State: APjAAAVBn0W0VwOl6c0kXmT4pTD78GcVUpWXtTIK92TnLHxqa31N7cI5
	FdAiRbsOI27lgA8yjzbvOhKDZyRbDEf8Xg==
X-Google-Smtp-Source: APXvYqzyuU2zSVdXw9w/xHdHbDW8XzYjf4ymx6EbXXyY6gD+BnXvdPqnvvPYLfieTeYrESGHkZjzwQ==
X-Received: by 2002:a17:90a:345:: with SMTP id
	5mr16379796pjf.121.1572624298080; 
	Fri, 01 Nov 2019 09:04:58 -0700 (PDT)
Received: from localhost ([2402:3a80:1386:1fa1:cbdc:7851:d398:f27c])
	by smtp.gmail.com with ESMTPSA id a21sm5520798pjq.1.2019.11.01.09.04.57
	for <linux-kernel-mentees@lists.linuxfoundation.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 09:04:57 -0700 (PDT)
Date: Fri, 1 Nov 2019 21:34:54 +0530
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20191101160454.GA11565@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: [Linux-kernel-mentees] [PATCH] drivers: gpu: amdgpu: Remove @dev
 from amdgpu_gem_prime_export documentation
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Message-ID: <20191101160454.qgabZMAfW3QxwMlnw9rknpa9vnGDICr72Tl0R3rAbRI@z>

The function does not have a "dev" argument, so remove it from
the documentation. This fixes the following documentation
build warning:

./drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:335:
	warning: Excess function parameter 'dev' description in
	'amdgpu_gem_prime_export'

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 61f108ec2b5c..4917b548b7f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -321,7 +321,6 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
 
 /**
  * amdgpu_gem_prime_export - &drm_driver.gem_prime_export implementation
- * @dev: DRM device
  * @gobj: GEM BO
  * @flags: Flags such as DRM_CLOEXEC and DRM_RDWR.
  *
-- 
2.21.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
