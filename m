Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F0AC2BD09
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 11:40:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5211D2054F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 11:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Me/qyZBS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5211D2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 343E9203D1;
	Wed,  4 Dec 2019 11:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5zCG+0d-Rd7; Wed,  4 Dec 2019 11:40:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8BC9820034;
	Wed,  4 Dec 2019 11:40:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73A73C18DD;
	Wed,  4 Dec 2019 11:40:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EB4FC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 11:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 068B22039D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 11:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRyPT9cmsWKp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 11:40:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 54E6220034
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 11:40:26 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id z21so2883816pjq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 03:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MiINZFBs6khm8b6mMvNgRfbiNCwT+6tcCMZMlP4kWDc=;
 b=Me/qyZBSUoJ5Yl8xik+dzd9PoLPKurXbWAK5IuDKz16oS33rkFiSIjiWXmBze6iCsM
 Jne5T9ATfzpHc0zuyNlxcV2tYKp2hGvA/Myv0d8Gvp5qbMUKaf+oOagxtRN1AoRl8h1s
 c4joqbPyJ052UENlBmxfA4VQ2/6uJWt0Gh9t5W+92GX0KaASvJlU8WhF0BgDhlYgfooM
 SgH7MMcdlpMUl5tFPFWAYynyVbZelnR8rpoBMOGouSryqhbGJjl3/1RzkPd4snbzGTf9
 QF2RjmVYtu8MJ/uNZjUBIrrTPQaJNY3r6ISAM1Uiwpd0+ckOtHBh0/erxbzJcJLSHcJy
 aQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MiINZFBs6khm8b6mMvNgRfbiNCwT+6tcCMZMlP4kWDc=;
 b=TtcR+MKHo0rKjkdmFfWqIcCFwatb+gizUdFLjf/hQX2PX3tkX8Au2Zb5iWbxVWoGFX
 uAlz3iz6CA8WpaDXrXeTZ6vZUMnanWSgIjmf7So2YxI6gU2VMXl6MjUtv3uraCiXsTou
 I5w0V2cSeljH5rw9DwFoCl2xZhGZ70bMzwnlY9eEWPbUaZEUgVMHEALWPBcgdh1XaBZ4
 ZE8E1lVUgqbIZgiRb9am8lgfBHXBH5KG3eG/+rlTqwj0VsHZHCSU0J+V/joovwfCrC9l
 pLgd5dRAapdM3jZeZgIkdLyIYGwyasp3W8sQRdmUGrgbic+7MZzLklbYWrk4nRQkJ/1F
 PYaA==
X-Gm-Message-State: APjAAAVAhX7BJ79Y/y22NkqD+snirK8mmZdZ8LBniie3Wr0r2sWqDvxO
 YopYSIYBPMzBXtojki8nvsI=
X-Google-Smtp-Source: APXvYqxbyKEe4NNTHMvIbBya6nrH5aA6meS8Jca0dWLee3ljlkLjOW9+RLRsuqUHi4HkvCGin53VnA==
X-Received: by 2002:a17:902:aa49:: with SMTP id
 c9mr3007884plr.220.1575459625813; 
 Wed, 04 Dec 2019 03:40:25 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:6ac:96e0:e497:614f:d1b6:6930])
 by smtp.googlemail.com with ESMTPSA id s2sm8162694pfb.109.2019.12.04.03.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 03:40:25 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: aelior@marvell.com
Date: Wed,  4 Dec 2019 17:10:13 +0530
Message-Id: <20191204114013.31726-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 GR-everest-linux-l2@marvell.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: [Linux-kernel-mentees] [PATCH] drivers: net: qlogic: apply
	alloc_cast.cocci to qlogic/qed/qed_roce.c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

coccicheck reports that qlogic/qed/qed_roce.c can be patched with the
semantic patch alloc_cast.cocci. The casts on the function
dma_alloc_coherent can be removed. Apply the semantic patch and perform
formatting changes as required.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 drivers/net/ethernet/qlogic/qed/qed_roce.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_roce.c b/drivers/net/ethernet/qlogic/qed/qed_roce.c
index e49fada85410..5fbdab8b6fcd 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_roce.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_roce.c
@@ -736,9 +736,9 @@ static int qed_roce_sp_destroy_qp_responder(struct qed_hwfn *p_hwfn,
 
 	p_ramrod = &p_ent->ramrod.roce_destroy_qp_resp;
 
-	p_ramrod_res = (struct roce_destroy_qp_resp_output_params *)
-	    dma_alloc_coherent(&p_hwfn->cdev->pdev->dev, sizeof(*p_ramrod_res),
-			       &ramrod_res_phys, GFP_KERNEL);
+	p_ramrod_res = dma_alloc_coherent(&p_hwfn->cdev->pdev->dev,
+					  sizeof(*p_ramrod_res),
+					  &ramrod_res_phys, GFP_KERNEL);
 
 	if (!p_ramrod_res) {
 		rc = -ENOMEM;
@@ -790,8 +790,7 @@ static int qed_roce_sp_destroy_qp_requester(struct qed_hwfn *p_hwfn,
 	if (!qp->req_offloaded)
 		return 0;
 
-	p_ramrod_res = (struct roce_destroy_qp_req_output_params *)
-		       dma_alloc_coherent(&p_hwfn->cdev->pdev->dev,
+	p_ramrod_res = dma_alloc_coherent(&p_hwfn->cdev->pdev->dev,
 					  sizeof(*p_ramrod_res),
 					  &ramrod_res_phys, GFP_KERNEL);
 	if (!p_ramrod_res) {
@@ -872,10 +871,10 @@ int qed_roce_query_qp(struct qed_hwfn *p_hwfn,
 	}
 
 	/* Send a query responder ramrod to FW to get RQ-PSN and state */
-	p_resp_ramrod_res = (struct roce_query_qp_resp_output_params *)
-	    dma_alloc_coherent(&p_hwfn->cdev->pdev->dev,
-			       sizeof(*p_resp_ramrod_res),
-			       &resp_ramrod_res_phys, GFP_KERNEL);
+	p_resp_ramrod_res =
+		dma_alloc_coherent(&p_hwfn->cdev->pdev->dev,
+				   sizeof(*p_resp_ramrod_res),
+				   &resp_ramrod_res_phys, GFP_KERNEL);
 	if (!p_resp_ramrod_res) {
 		DP_NOTICE(p_hwfn,
 			  "qed query qp failed: cannot allocate memory (ramrod)\n");
@@ -920,8 +919,7 @@ int qed_roce_query_qp(struct qed_hwfn *p_hwfn,
 	}
 
 	/* Send a query requester ramrod to FW to get SQ-PSN and state */
-	p_req_ramrod_res = (struct roce_query_qp_req_output_params *)
-			   dma_alloc_coherent(&p_hwfn->cdev->pdev->dev,
+	p_req_ramrod_res = dma_alloc_coherent(&p_hwfn->cdev->pdev->dev,
 					      sizeof(*p_req_ramrod_res),
 					      &req_ramrod_res_phys,
 					      GFP_KERNEL);
-- 
2.21.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
