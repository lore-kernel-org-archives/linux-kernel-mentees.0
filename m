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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38EACA9ECF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 16:39:03 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3BFD21734
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 16:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmLI6Xfp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3BFD21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 984E8CC4;
	Fri,  1 Nov 2019 16:39:03 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DF025CBB
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 16:39:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A2147466
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 16:39:01 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id a18so3464006plm.10
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 01 Nov 2019 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=Jop3Dux9Tb3Ov/yAM9BwP8Zp0TbIeSOkimu79QY77es=;
	b=nmLI6Xfp4DCOu0L6Y0a6idgMpzE/ZCS6AXaU1AX1lBJkSSFLMJJMyEXVX43sofP8BM
	jpb6lCY0BXFwGWAUBFoseAhpp0yqARTfCsjnqJA9xYnkS6S4ljXOCZi8VT3nbPgFaB+T
	oaNDXQZ3C6efLroLoE88iCbEW3/60zoCWd7FzL6fpipnd5Z3qm7QW9X3sxlilgIw8TCQ
	bPkHhNVix3KT43TwaGSq5ed93dFCXDBNHyT8FnTLUNVak1Kbe7sJJnT2r4TUQOPyH4k/
	rCMS4rR9q2RQWxq2qxEPIWyLtpPP5PK7bDvzBDGOOpf2imwnhteMOjPbLHLvUefhj0XP
	oa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=Jop3Dux9Tb3Ov/yAM9BwP8Zp0TbIeSOkimu79QY77es=;
	b=etvbfc2FUXqN9TVp/A7tLCR3NRxvuiwskNo09AcGDxEBBf/rUzMNYzd0SFnFOPTB+S
	Fxsq0E6zGkaHQzjFrfyKfjM8aFHPQNBJL1rvrA2zdzUjWbr7GS7Kr+kEMkwVAvg7L9k7
	WB4PqqLiqnpohzAuZPDtyzylg1E4FZ7Hh+Zfu94DzFXp1edhnApvfBiExboxLMaDg2W6
	B4+mmUOGkbQvoERTk+8P4+et9o1Qnt2PlaJ7sje3Nyq3KLd8oBbYYscE4eqD5LkR3ELS
	91CLASpma4GZj/5T9LyNDSK0P/8OQxVivSMoHLF+PvP95PrghbuTcDUpjk0Q5p/LrV6A
	IKnQ==
X-Gm-Message-State: APjAAAV4XKv1IY2I0jjI5B/R9Ja9BcSbPibRIyOnn3x/Tp/Vsv8W0XxQ
	5oocmdEuQyga7oLvOMlwE30=
X-Google-Smtp-Source: APXvYqwikFR65XxVHQmNND6nn1yvtJkPX4KG/6KXxiGf1DsHPC00SF/oqM0MfFi79t8JfXr2DGcWdQ==
X-Received: by 2002:a17:902:161:: with SMTP id
	88mr12645499plb.253.1572626341042; 
	Fri, 01 Nov 2019 09:39:01 -0700 (PDT)
Received: from localhost ([2402:3a80:1386:1fa1:cbdc:7851:d398:f27c])
	by smtp.gmail.com with ESMTPSA id
	m15sm6319676pgv.58.2019.11.01.09.38.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 09:39:00 -0700 (PDT)
Date: Fri, 1 Nov 2019 22:08:56 +0530
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: linux-kernel@vger.kernel.org
Message-ID: <20191101163856.GA13800@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: David1.Zhou@amd.com, airlied@linux.ie, Felix.Kuehling@amd.com,
	ray.huang@amd.com, daniel@ffwll.ch, alexander.deucher@amd.com,
	linux-kernel-mentees@lists.linuxfoundation.org, christian.koenig@amd.com
Subject: [Linux-kernel-mentees] [PATCH] drivers: gpu: drm: amd: amdgpu: Add
 @level to amdgpu_vm_bo_param documentation
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
Message-ID: <20191101163856.rlRIqNDn1vE3kJ0MLuoMk7ZAd9YG29GoQwPojeQqYgk@z>

The documentation for this function is missing the function parameter
"level", so add it. This fixes the following warning:

./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:821:
	warning: Function parameter or member 'level'
	not described in 'amdgpu_vm_bo_param'

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 5251352f5922..6f6a9be11d84 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -813,6 +813,7 @@ static int amdgpu_vm_clear_bo(struct amdgpu_device *adev,
  *
  * @adev: amdgpu_device pointer
  * @vm: requesting vm
+ * @level: VMPT level
  * @bp: resulting BO allocation parameters
  */
 static void amdgpu_vm_bo_param(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-- 
2.21.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
