Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D119EC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A728120720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLu/XASn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A728120720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88C2286250;
	Mon, 11 May 2020 10:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6jZjIyOoO9x; Mon, 11 May 2020 10:09:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 14ABF869C9;
	Mon, 11 May 2020 10:09:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02FEEC0176;
	Mon, 11 May 2020 10:09:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24A5DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 221A1869C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqIOtXQLLMkg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C9CF786250
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:07 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s11so857015pgv.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OPOEdbrp0+m25ziKK0qnI+Kfqtq0LVSPDHJCMCSV4uI=;
 b=JLu/XASn1/ptDxd9k9atM5fCBYOy0PtcHvhrdpbU0xYhG2dHXCNEBDqEp3iEPiBqT2
 +K/gbpq2nrjXjIVbmGpXhJytsji9Av6AyDlknbvk2GtgR+t9RtO1fbxsT2+VTHuJI34g
 1IlutDcJxri+uxzCW8ElEFsAf6G1dx5tRjuIhTOlzlgoc80QVpxK7vz+3e4/ETcZx/aC
 vERvpmRnK/QBlTiGPdcKVx1nUpUs1Ntr6o7cJgQrbeKZhwwsu1i++63ZY1+dDOYJn/e4
 FXAuU+0jNdGGAhfzdnL2eTxmg43iFLCGkkrzzn6vN+pmghWj/N8CSG4q4oOgBjFoO+kx
 TvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OPOEdbrp0+m25ziKK0qnI+Kfqtq0LVSPDHJCMCSV4uI=;
 b=f8HGcpdu49IULgZZEm84j/AdxDm8BlF/Bh7sX7bSU6RmChow2FFEdSop9KmQz0rY46
 5BrafztD/lQWjmo9kUjSKisSkX4LTnSYtnKhCqu0ldxC7cwpX5meCAi4+hJD9odwpvN8
 9G393ySdSWRl9l/vJt7SrEDU0dyFl/4jJbE7jMerEOYiLgNTbB6OA93uCBHHgvS50uRM
 R5j4jZomz2tDw3qw3/BcylZkr0thBpWvh2vNcTiCbS0iLwClbpllF+d31431OS8ZBEK0
 Hu6LnYTKX1HfvDc52Wbk6emaRFZWJXF3P2+NB7PqcxtAToqIDQlqzDQ5j38Uti8foKsW
 izhQ==
X-Gm-Message-State: AGi0PubjuUY431OVVGHv6bbWY05Ow1h9GagvJlEHK7TzGpL72LrY0fme
 rdvUO0gH3h16lTFvXgnZptPGvYWyoZo=
X-Google-Smtp-Source: APiQypIWAXPMULfLMGzCW+ptwFnStu/qK6p5H/x3kpoUNrvkZFBkruYRnkym4iuEhNo0+WsIlTV4jA==
X-Received: by 2002:a62:1994:: with SMTP id 142mr14718827pfz.259.1589191747389; 
 Mon, 11 May 2020 03:09:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:07 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:06 +0530
Message-Id: <20200511100715.19819-24-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 23/32] parsing_c: type_annoter_c:
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
