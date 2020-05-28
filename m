Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89E8C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D248212CC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4JQkInV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D248212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 62F5C86B08;
	Thu, 28 May 2020 12:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8PUIz5difzL; Thu, 28 May 2020 12:25:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1552885ABF;
	Thu, 28 May 2020 12:25:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 011A8C088D;
	Thu, 28 May 2020 12:25:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E13F7C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CB0F188D90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naENh4Z3IAdy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C3E3A88C30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:30 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id ci21so3137624pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EuaS5Onylm7y9OnVpbHrxgUexCsuvS51b9zNiFw/YOQ=;
 b=U4JQkInVvvQhTvMXTd0lCYi7M8PVeq/yJp+jelxP0XMn9qIi0gOlFOxwsfoz4VVhfd
 mR6/7FauKJIXZyNNEaM+FLhHNrg2rdRSsmt5F6tI0LmRFqYSeIYO2Fk9aDoAB42H0J2S
 kJneJsz6wOjKzSTgUaIvHIGsnhOtvyoMdWK9BAfrMowndilhWiJFlFMeWM6Ls6ofKv9A
 LBUb8EQFRcpNjUGSCiobNzAhu4efeyzBdtnHMYN2nKuADfjt9bVyC+JVmLo6X9ozEI2X
 YWtNVBdHTA9rj2WM07z2VQazO+yxoj9d7D52HbHGGJgkmde0gMCLi17sAf7I+akzIRq+
 S1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EuaS5Onylm7y9OnVpbHrxgUexCsuvS51b9zNiFw/YOQ=;
 b=o9AXAkBGu5PQ3Ai6cG4p1/+08H78gGkCBY+GVLCCJpQy200EzlKumYRXle02LlYeUm
 tDxGd6S8HmLLFZ0dp5H8SD4NBTlce+EOc73NvrnBihE4aOtD9KuRTArHBPBVTCILwYNq
 JA0MV3MHpesTyZUf9eA+NfgkS6aJ75K8p8sEyIdwA+7o/AO8UBNC7gylLIjP2j+PxeGY
 amY7PDnK90zsz54FFN/AHow0m9YHpMMp3eV9q4RqOBPL3t7MqhO9ksfHf2kFg8BZvN55
 TKIBzaVvL7FMgOyn9nh5u8HJQxWDGUpEaMJmyj2Ib1TKuLsB/QzLn5ZpCeQRMzfRRKet
 tNow==
X-Gm-Message-State: AOAM530HfwN00p3O2U6dl/GYlyR8eCzK+Wvc/gi3WFMlIDSf7MqZrcLo
 JlGYnyqI1L2EiUxkQ0SkJ0E=
X-Google-Smtp-Source: ABdhPJx6buMGLwp1TFouiPKIKKocQFMrrAEao7rSZH+HoQ7UibqGd+4AQGf+NhaY111Zm5cKnZ40CQ==
X-Received: by 2002:a17:902:fe81:: with SMTP id
 x1mr3248626plm.239.1590668730261; 
 Thu, 28 May 2020 05:25:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:29 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:16 +0530
Message-Id: <20200528122428.4212-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 14/25] parsing_c: visitor_c: Add
	vk_attribute and vk_attribute_s
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

vk_attribute and vk_attribute_s were not declared in visitor_c.mli.
Declare these functions in visitor_c.mli to use these outside of
visitor_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/visitor_c.mli | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/parsing_c/visitor_c.mli b/parsing_c/visitor_c.mli
index 1a76b87c..85551fca 100644
--- a/parsing_c/visitor_c.mli
+++ b/parsing_c/visitor_c.mli
@@ -86,6 +86,7 @@ val vk_ident_list_splitted : visitor_c -> (name, il) Common.either list -> unit
 
 val vk_exec_code_list_splitted :
     visitor_c -> (exec_code, il) Common.either list -> unit
+val vk_attribute       : visitor_c -> attribute -> unit
 val vk_attrs_splitted :
     visitor_c -> (attribute, il) Common.either list -> unit
 
@@ -205,6 +206,8 @@ val vk_exec_code_list_splitted_s :
     visitor_c_s ->
       (exec_code, il) Common.either list ->
 	(exec_code, il) Common.either list
+
+val vk_attribute_s : visitor_c_s -> attribute -> attribute
 val vk_attrs_splitted_s :
     visitor_c_s ->
       (attribute, il) Common.either list ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
