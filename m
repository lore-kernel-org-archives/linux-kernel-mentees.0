Return-Path: <SRS0=7LP4=7S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398D6C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF34206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdcLp7iV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF34206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CFA8088254;
	Fri,  5 Jun 2020 13:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxewdpATfHfK; Fri,  5 Jun 2020 13:44:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5FBBB8770C;
	Fri,  5 Jun 2020 13:44:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FCF8C0888;
	Fri,  5 Jun 2020 13:44:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5580C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9485388254
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wh44qFZ4Jexm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3FD3A8770C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:50 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id b7so3300529pju.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bcxNryKY3UmRddk1qamJbMBVRoDXa6JrWytYdE8m7ME=;
 b=AdcLp7iV6Bqa5kL7HNLqhPB2bswhM3yfmJI1RtoyEQh4FwJi9aJgs9MOI5Y0ZuBnWP
 XIDSHDXv8wxr5neaKz7uOmqO066I3uMRQUsIPTsrDWwEgtEfwkMK93mP7V8uvUXOMEwl
 j9tw6vzPCCQ7gsQ1AlwcWnPmeXPngHp6i64rXQNiFPKusI1bLDlRVEdhvYXYqOMvc+kx
 DVL0hau3qK+2BjbyzLjUDmy0ow/HqEjMzqFxmfTFo3mnmWjzz+EYDZImiinzuO3/7pxp
 2z8xORjPtFtfXIrUyt9ymR+SXe3MZTPIZho306Jd7ZCrz8gNERAIt4XCbKUdhmYDqSpg
 HdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bcxNryKY3UmRddk1qamJbMBVRoDXa6JrWytYdE8m7ME=;
 b=K4IpTO5NhD4dnbHFLXftZ8Zf30vzsnloZZspYOkeY6o2Tqbpl+mOSzWkGxYpSbzXqq
 lzdohULT94Y+r1ed8bMo1w7+F/0mbp3gWXEsZnZZnB2C+VezuweJhRoPEeIaQvxJH18b
 mpQqfbTWvZ7y9xCjbl96FPOt5nWeEsF69WUYD3MjIO+RBwLciT3cxuDmW1Jb1iUMBu/l
 iVgDUPU3dktHSyT4WW4uERFHS4ws3h+GlZjDsSAFb2weyiZXD4+fMlaOv2Nlf8MQCK9n
 fcIpnzGyqZP9mgBilDlyaOX6PrGAd3/IZFb5Rt514Tgi3IUGzvdmynpC1dTsz4n59vGR
 NyAw==
X-Gm-Message-State: AOAM5338NLiK7vpcX+5Ptgq/+iE3rOj8PcCN7Y2QlXc09zwe73ddBfY1
 Eg5FBocqEF3A8kHO38Lpda8=
X-Google-Smtp-Source: ABdhPJydzUUt0w0lfe1m8wgjET4wYAui4Q5fr+dFnP6xn8MzbwFfUGFbv89Ygy53FJFTfuvURY98vw==
X-Received: by 2002:a17:90a:d103:: with SMTP id
 l3mr3313822pju.194.1591364689804; 
 Fri, 05 Jun 2020 06:44:49 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:49 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:20 +0530
Message-Id: <20200605134322.15307-13-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 12/14] parsing_c: parser:
	cpp_other end attributes production
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

Add a production for a macro call in the cpp_other rule of Coccinelle's
C parser. This parses the following C code from Linux v5.6-rc7
successfully:

  arch/x86/kernel/irq_64.c:

	DEFINE_PER_CPU_PAGE_ALIGNED(struct irq_stack, irq_stack_backing_store) __visible;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 71e58e5b..9cd8761e 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -2182,7 +2182,8 @@ cpp_other:
     * the rule are slightly different, they can't be statement and so expr
     * at the top, only decl or function definition.
     *)*/
- | identifier TOPar argument_list TCPar TPtVirg
+
+ | identifier TOPar argument_list TCPar end_attributes_opt TPtVirg
      {
        if args_are_params $3
        then
@@ -2202,16 +2203,17 @@ cpp_other:
 	 Declaration(
 	 DeclList ([{v_namei = Some (id,NoInit); v_type = ty;
                       v_storage = unwrap sto; v_local = NotLocalDecl;
-                      v_attr = attrs; v_endattr = Ast_c.noattr;
+                      v_attr = attrs; v_endattr = $5;
 		      v_type_bis = ref None;
                     },[]],
-                   ($5::iistart::snd sto)))
+                   ($6::iistart::snd sto)))
        else
 	 Declaration
-	   (MacroDecl((NoSto, fst $1, $3, true), [snd $1;$2;$4;$5;fakeInfo()]))
+	   (MacroDecl((NoSto, fst $1, $3, true), [snd $1;$2;$4;$6;fakeInfo()]))
            (* old: MacroTop (fst $1, $3,    [snd $1;$2;$4;$5])  *)
      }
 
+
  /* cheap solution for functions with no return type.  Not really a
        cpp_other, but avoids conflicts */
  | identifier TOPar argument_list TCPar compound {
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
