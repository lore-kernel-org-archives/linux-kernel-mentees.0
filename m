Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88312C7C8A4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA73206BF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gC1P9nbK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EA73206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 40B4786365;
	Mon, 27 Apr 2020 12:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzLOT2Z+CwJn; Mon, 27 Apr 2020 12:09:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3D9C08620F;
	Mon, 27 Apr 2020 12:09:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D780C1D87;
	Mon, 27 Apr 2020 12:09:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2793BC1D7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0B70F85F37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnSFNbF9TmXv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6EA9285F44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:27 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id p8so8597621pgi.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j1X1BGRFEACGTmkgMLbAYX8AfqdFOueU9TLXrHGZrhc=;
 b=gC1P9nbKWV7TftXMyzOgcakYqTjZppJKuiUonrjLPGvdP5yKWjckaNf9toqKm5gaHa
 LDwNVG9bDh8Zb8KyKGNOrbaQsKo04nWa9+5Ioge63akSyEQEf/nUU0l/WijbArWf/2/Y
 loyEiqe3mCqClLDmQ3RnZouSHNtM90zKMsrjKihCgFz8IQceLB1H9DSrwGJljQi9cxXX
 PBgjdEuHPDcymfRQVzzXqb7Krucfw2RGA0iGw4W/g8wd17FPHnp/ddLGNjB9j9YVwCbT
 w0TSqRPraPBUUEplEjwA2v57N78vtESg3yR860JGeu7aEkdXt9Kciml/V4M6pH8fxUSn
 LkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j1X1BGRFEACGTmkgMLbAYX8AfqdFOueU9TLXrHGZrhc=;
 b=InknmekX9thwO4dLunrthycbjEN3h8I13rCOVIEG7nj72/OJ/JiI2eVOmXX1nyqzVY
 BB8C5QjC5TR0vY0MaHnjUXKosnSNUpJlU0gMYLk3rgJLj+eefzVCng6/ELPAfry2QoM8
 Kq5e2uvIgTgBvau0lVVFAp/mo7gQ3wRAk+/ZORT6uDaGFyUQOTTlfqwxM8Ih+L7cubiD
 KfTBrAkW0a6WpMLoObTSD/Kp1IAjkHv00bY38dkfVy5zB1F4+Lc71KtaNKKeWDZik2xL
 FAcMWBUrEFwwKAEOL29NxUU/e8CRZxjYmmmpNu93omIXY8OEhfr16+n6i6DndeqobkBu
 aexA==
X-Gm-Message-State: AGi0PuaoTjbvGkmET0CqfT/O4hc/JUHvxnmMZrbd4RrCvzO/zeVm1Y6i
 49zF+38TcLfZibPRKlvVB6vFCmvdhi4=
X-Google-Smtp-Source: APiQypKkic0dpqhJ8rytHQQhi0em5iQAMux0paFOLyBaMVuszsT0WvKu+PeqSCTVAAa1TKoMP4CMTA==
X-Received: by 2002:a62:2c92:: with SMTP id
 s140mr12042167pfs.223.1587989367033; 
 Mon, 27 Apr 2020 05:09:27 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:26 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:21 +0530
Message-Id: <20200427120834.380-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 10/23] parsing_cocci: iso_pattern:
	Reflect Parameter attributes
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

Parameter attributes are added to the SmPL AST. Reflect these changes in
iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/iso_pattern.ml | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index 9df21fb9..09a39bdf 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -1165,10 +1165,24 @@ let match_maker checks_needed context_required whencode_allowed =
 	if not(checks_needed) || not(context_required) || is_context p
 	then
 	  match (up,Ast0.unwrap p) with
-	    (Ast0.VoidParam(tya),Ast0.VoidParam(tyb)) -> match_typeC tya tyb
-	  | (Ast0.Param(tya,ida),Ast0.Param(tyb,idb)) ->
-	      conjunct_bindings (match_typeC tya tyb)
-		(match_option match_ident ida idb)
+	    (Ast0.VoidParam(tya,attra),Ast0.VoidParam(tyb,attrb)) ->
+               if
+                (List.length attra = List.length attrb &&
+                 List.fold_left2 (fun p a b -> p && mcode_equal a b) true
+                 attra attrb)
+               then
+                 match_typeC tya tyb
+               else return false
+	  | (Ast0.Param(tya,ida,attra),Ast0.Param(tyb,idb,attrb)) ->
+               if
+                (List.length attra = List.length attrb &&
+                 List.fold_left2 (fun p a b -> p && mcode_equal a b) true
+                 attra attrb)
+              then
+	        conjunct_bindings (match_typeC tya tyb)
+		  (match_option match_ident ida idb)
+              else
+                return false
 	  | (Ast0.PComma(c1),Ast0.PComma(c)) -> check_mcode c1 c
 	  | (Ast0.Pdots(d1),Ast0.Pdots(d)) -> check_mcode d1 d
 	  | (Ast0.OptParam(parama),Ast0.OptParam(paramb)) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
