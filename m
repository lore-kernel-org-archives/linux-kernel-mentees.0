Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E0DC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD4B3206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjH5trZQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD4B3206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C9948746E;
	Sun, 24 May 2020 17:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NeS4rCynO7oE; Sun, 24 May 2020 17:21:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F1638701C;
	Sun, 24 May 2020 17:21:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DDDCC0178;
	Sun, 24 May 2020 17:21:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 663FCC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5FDE288007
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xl+eEmyhaATS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 018D787F50
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:52 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id s69so7580466pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jz3lWMt4CYhyOafD0/4S2N0AqmLaZCBO+DnEOpOB/6E=;
 b=OjH5trZQ/Nlr8u+XaieE9cJnCFcur8YKd0LIVeWil7iEf4U/oheiSZEPG/KuuxuVK2
 w3G1eT8hWr/1c23WY6dpYJRVb2dNxiGiOIkP04eIy+t7/Hb83+U90wCsFpbzSt61PudR
 NdVpEOX5i+L/+5dygFA/JUwSniFiUHCQHuQlKFLthcw52a6zy+c4pjRVx9iSDzKVXtRj
 a4G/xTYVaeTUqEMaDgtViwOXDL3WS2qwpLd3VuP2HfUc/cY/CFtpNqFBhOfyn3rDEV/7
 2m3HFd50FZB8nfz6Q73ZHDSITfbHQOyZmqIIX3smgqnKEyZSRbvKTIRBIn5r5ee1LFOg
 E3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jz3lWMt4CYhyOafD0/4S2N0AqmLaZCBO+DnEOpOB/6E=;
 b=t0w4YHPSnm8bFgE9cCMTDG1VirMQ5uHdPcwPSthqi0+ym7PRVXDdeDiChLCI3Rc4Tp
 003JJwEBG/epFOeU/W4k7LAoRo7YIGidfe8bAxP+C523QMoxWDpvVLdYt0jZkQ3ulNd4
 RWOQ3Ivr663fcfPd8Dq8SK2RdNJ5ipRdB8h9+I7lEWczU3AiGNt3rBZdBYol5/8gFEf/
 by/XQXJZAUPg3lCkhGit6iz3J92Fu4mXON21qtDMLaDv5DVk/uG2+bT6c7SsCzOh0HA2
 fmdWVyzgmj86wu4fiuG4hI4KnMxjo3UN7TogUCiFKEIdUuaUFTM9QDGJhgDW7EYQ3Rg3
 mizg==
X-Gm-Message-State: AOAM532b4gU5n8/0XW2OwRKeMlQsozVNd2grf1Nk4qpDlvGryCGlrgs+
 xHYUxQxb6CKk1xM+lDoioDZkxByLE+Y=
X-Google-Smtp-Source: ABdhPJx/P06ssciFFaifgHQMCkEZayOlzFB8lki51diJaIDLQ4lOG0PlHNRA3lfa6c6BlzJyzY5u5w==
X-Received: by 2002:a17:902:6ac2:: with SMTP id
 i2mr24980813plt.18.1590340912479; 
 Sun, 24 May 2020 10:21:52 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:52 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:26 +0530
Message-Id: <20200524171935.2504-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 21/30] parsing_c: parser_c: Reflect
	Macrodecl attributes
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

Macrodecl attributes are added to the C AST. Parse these attributes in
the C parser and place them in the C AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index aedde179..dadf675f 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1600,10 +1600,11 @@ decl2:
        match $1 with
 	 Some (sto,stoii) ->
 	   MacroDecl
-	     ((sto, fst $2, $4, true), (snd $2::$3::$5::$6::fakeInfo()::stoii))
+             ((sto, fst $2, $4, [], true),
+              (snd $2::$3::$5::$6::fakeInfo()::stoii))
        | None ->
 	   MacroDecl
-	     ((NoSto, fst $2, $4, true), [snd $2;$3;$5;$6;fakeInfo()]) }
+             ((NoSto, fst $2, $4, [], true), [snd $2;$3;$5;$6;fakeInfo()]) }
 
  | storage_const_opt TMacroDecl TOPar argument_list TCPar end_attributes
    TPtVirg
@@ -1611,10 +1612,12 @@ decl2:
        match $1 with
 	 Some (sto,stoii) ->
 	   MacroDecl
-	     ((sto, fst $2, $4, true), (snd $2::$3::$5::$7::fakeInfo()::stoii))
+	     ((sto, fst $2, $4, $6, true),
+              (snd $2::$3::$5::$7::fakeInfo()::stoii))
        | None ->
 	   MacroDecl
-	     ((NoSto, fst $2, $4, true), [snd $2;$3;$5;$7;fakeInfo()]) }
+	     ((NoSto, fst $2, $4, $6, true),
+              [snd $2;$3;$5;$7;fakeInfo()]) }
 
  | storage_const_opt
      TMacroDecl TOPar argument_list TCPar teq initialize TPtVirg
@@ -2265,7 +2268,9 @@ cpp_other:
                    ($5::iistart::snd sto)))
        else
 	 Declaration
-	   (MacroDecl((NoSto, fst $1, $3, true), [snd $1;$2;$4;$5;fakeInfo()]))
+	   (MacroDecl
+             ((NoSto, fst $1, $3, Ast_c.noattr, true),
+               [snd $1;$2;$4;$5;fakeInfo()]))
            (* old: MacroTop (fst $1, $3,    [snd $1;$2;$4;$5])  *)
      }
 
@@ -2295,7 +2300,9 @@ cpp_other:
                    ($6::iistart::snd sto)))
        else
 	 Declaration
-	   (MacroDecl((NoSto, fst $1, $3, true), [snd $1;$2;$4;$6;fakeInfo()]))
+	   (MacroDecl
+             ((NoSto, fst $1, $3, $5, true),
+              [snd $1;$2;$4;$6;fakeInfo()]))
            (* old: MacroTop (fst $1, $3,    [snd $1;$2;$4;$5])  *)
      }
 
@@ -2321,7 +2328,9 @@ cpp_other:
  /*(* TCParEOL to fix the end-of-stream bug of ocamlyacc *)*/
  | identifier TOPar argument_list TCParEOL
      { Declaration
-	 (MacroDecl ((NoSto, fst $1, $3, false), [snd $1;$2;$4;fakeInfo()])) }
+	 (MacroDecl
+           ((NoSto, fst $1, $3, Ast_c.noattr, false),
+            [snd $1;$2;$4;fakeInfo()])) }
 
   /*(* ex: EXPORT_NO_SYMBOLS; *)*/
  | identifier TPtVirg { EmptyDef [snd $1;$2] }
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
