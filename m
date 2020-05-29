Return-Path: <SRS0=FjTm=7L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA02C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D5020B80
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAOOT5Lj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D5020B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E7A5988495;
	Fri, 29 May 2020 12:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peqe1v7Jkv7Q; Fri, 29 May 2020 12:10:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 062668848A;
	Fri, 29 May 2020 12:10:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E822FC0893;
	Fri, 29 May 2020 12:10:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E7BDC0890
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 57482850DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5CVt_A-PLGq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 547FB87464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:56 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id s88so692848pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OPOEdbrp0+m25ziKK0qnI+Kfqtq0LVSPDHJCMCSV4uI=;
 b=EAOOT5LjKWfFRNI3CNQQDCgj0P8ImY01RwJ4JkMauV3e8T+1anlJE6DUxRx2AGaoat
 DehaI2x+k2NRfFSeSZ7OFhYQxkDUNnLxzc7q5qc+4s8+hp7gtOVd7r/evchdvG6p7i9p
 pc/8fTyJDlV3CmnPD37Oj1P0loaTDokyxWy2sIQHCtAQn6bcZFkacy2aIuftKbx6+Bbv
 DGftNY/BRJJeD7kOrJcM6FwKXPFo9C7eLDcGPOmBR9E8CGFMzHn9sYcbnqeeFi3dLPVq
 Vb6XqpKQrfpKpWCHp/V6QUpaw0DUrUmnYq+zgvYeEmikEOF+qo5D0CqniPDRmBuK0m2s
 3RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OPOEdbrp0+m25ziKK0qnI+Kfqtq0LVSPDHJCMCSV4uI=;
 b=ZKt0cTkW+AJtjl0qcldvvOcon7PxWAjshIiAt2YJl7BdtGy0J104nw5CsfIWc+s4gn
 NVasVRrVXlUm0kmiAT7brnbhtrDA/awOQsws6lbxxWvLJjkI/QTdNiqShhqXM6U2N2lS
 R4kp0IbnakLdS2FtqrhxUkIgVmMo3tI3rJ2o0xHYRCkTyQ5+XThxXRFJxMkxdwK/F1Tn
 hwST30YPpvBAhVUM6vod0ErCsGssNZ73bub5hHJPjHSEwYFASb5XsAEB8DePOdfPXU/m
 Rk+rgam4WYmrhtJifvIqMvj44+q6N8oC2drSMgsfzb2HumBq+UN/YNUrcPTv92eQ6opp
 fzcA==
X-Gm-Message-State: AOAM532BAWM0gKHLh/qRuQ3ykzd5Idq+gW59LVuuIGBRGFkJHZPa9EsO
 zaXYPKroBTSMQZ9uvtwx9R8=
X-Google-Smtp-Source: ABdhPJxQGd7qupC9jCb8XA95V6MRrJnLKH6BCguHGRFRlfOWTKP6E9VPLNN65aoFIwN2KTYw0oqw3g==
X-Received: by 2002:a17:902:c40c:: with SMTP id
 k12mr8373148plk.11.1590754195880; 
 Fri, 29 May 2020 05:09:55 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:55 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:53 +0530
Message-Id: <20200529120703.31145-24-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 23/32] parsing_c: type_annoter_c:
	Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
type_annoter_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/type_annoter_c.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_c/type_annoter_c.ml b/parsing_c/type_annoter_c.ml
index dfd363b2..dce9753c 100644
--- a/parsing_c/type_annoter_c.ml
+++ b/parsing_c/type_annoter_c.ml
@@ -525,7 +525,7 @@ let rec is_simple_expr expr =
       true
   | Binary (e1, op, e2) ->
       true
-  | Cast (t, e) ->
+  | Cast (t, a, e) ->
       true
   | ParenExpr (e) -> is_simple_expr e
 
@@ -961,7 +961,7 @@ let annotater_expr_visitor_subpart = (fun (k,bigf) expr ->
 
 
     (* -------------------------------------------------- *)
-    | Cast (t, e) ->
+    | Cast (t, e, a) ->
         k expr;
         (* todo: if infer, can "push" info ? add_types_expr [t] e ? *)
         make_info_def_fix (Lib.al_type t)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
