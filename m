Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D649C433EB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 16:55:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D837F2067D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 16:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QThq7T/N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D837F2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BD75788C64;
	Mon, 13 Jul 2020 16:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMrr8y5rUuge; Mon, 13 Jul 2020 16:55:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F16C88E0D;
	Mon, 13 Jul 2020 16:55:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B21EC088E;
	Mon, 13 Jul 2020 16:55:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D315CC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C1306868E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xz-JHFtDDVWm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C896A86A5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:55:17 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e22so14276634edq.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Vg5seoeyahxUOJ1a2of2OSXbNHc8+N6IhRiLy4XR8Ps=;
 b=QThq7T/NhE4spupA48w9flKBPIUZMsJ+uy1wChEjqmd9cLUhJNeozt9BNv1EslTKul
 9FzUYVh1psv92TVnmY05kmXxx7YOjo4zsDzZUATn9e4zIhaa/IU/l64wBzjWvrwDbAdT
 yMVtRLi35HfG89vS3VWmX51PcL78Kumuk1a4Y+mb2X5zojZOcrMRGnHmOxMBpNMDphyn
 WM6skKGt7eauq9PMF4fMY/WlqUw991iJ1Ytz1rk4085GlJxA7KXFCo39uIxgjXQ9fuJN
 3z5H1aRueRaa67gizAbiKT/8yQ6CvE9P5qTMm1ibl2NWyp9eZcuTPcv+4+0VHPs7z+dy
 9v1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Vg5seoeyahxUOJ1a2of2OSXbNHc8+N6IhRiLy4XR8Ps=;
 b=M/0gblPhPVKvNbDTW0eGENe3gzQBIFjWzZQMnDpXlLvLNXBqS+oG8ko0XmMebEzqhQ
 JMltDh59zm3S9uv6vRUkBBKQfW8l6PdLFgY/+dIwbQkfJ19ZDjkudVnD8CRmOQWM9K4P
 g7vyd6kzHokHcWe3o/hWDpKsH+62D7RlFAjTmaafDQ5IQcPXJoG49Lj30OLyso0lb0Jn
 qz18PHORGNwtECdO1PxjfFWJ2JZOb2Ck8zu/1iFvyoQdxLh/NhhUXpH5FZL+JzVwKGIV
 Yd0rGOGRtAOdqCVcEtsCrEFM+l6tftX+LDmVpsOlj8aJO6XXWDj13cAxOExq2PVEpPbz
 pBpw==
X-Gm-Message-State: AOAM531NCxQIkm6fQxkrrRgfL1guDls9crJmqsItw9PSGLow+1YFW7zU
 bU/TRh03Y61OQ6HwWp2/Wq4=
X-Google-Smtp-Source: ABdhPJwiuJGYBhFGQzVTlihXWfzHv/j6TtpsUC2ukWbQvIDZs82x6qtdrhI4g0KTxQkpdk5UBwbo4Q==
X-Received: by 2002:aa7:d58c:: with SMTP id r12mr365600edq.160.1594659316271; 
 Mon, 13 Jul 2020 09:55:16 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id w3sm11838938edq.65.2020.07.13.09.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 09:55:15 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: skhan@linuxfoundation.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Date: Mon, 13 Jul 2020 19:55:29 +0200
Message-Id: <20200713175529.29715-5-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713175529.29715-1-refactormyself@gmail.com>
References: <20200713175529.29715-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH 12/14 v3] PCI/AER: Check the return
	value of pcie_capability_read_*()
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

On failure pcie_capability_read_dword() sets it's last parameter,
val to 0.
However, with Patch 14/14, it is possible that val is set to ~0 on
failure. This would introduce a bug because (x & x) == (~0 & x).

This bug can be avoided if the return value of pcie_capability_read_word
is checked to confirm success.

Check the return value of pcie_capability_read_word() to ensure success.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/pcie/aer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 3acf56683915..f4beb47c622c 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -800,6 +800,7 @@ static bool is_error_source(struct pci_dev *dev, struct aer_err_info *e_info)
 	int aer = dev->aer_cap;
 	u32 status, mask;
 	u16 reg16;
+	int ret;
 
 	/*
 	 * When bus id is equal to 0, it might be a bad id
@@ -828,8 +829,8 @@ static bool is_error_source(struct pci_dev *dev, struct aer_err_info *e_info)
 		return false;
 
 	/* Check if AER is enabled */
-	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &reg16);
-	if (!(reg16 & PCI_EXP_AER_FLAGS))
+	ret = pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &reg16);
+	if (ret || !(reg16 & PCI_EXP_AER_FLAGS))
 		return false;
 
 	if (!aer)
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
