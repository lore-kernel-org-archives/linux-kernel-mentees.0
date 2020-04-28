Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4869FC83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 181F720730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ziby3/na"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 181F720730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 18E0288299;
	Tue, 28 Apr 2020 17:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4WMbKCDWmSw; Tue, 28 Apr 2020 17:03:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B2EDE86E1A;
	Tue, 28 Apr 2020 17:03:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF4BFC0864;
	Tue, 28 Apr 2020 17:03:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A4D9C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 852D9875CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id suYMeBw0EsIa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 98762875A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:03 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f8so8633185plt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwqNogG8vHxP252WZiCGBfjwezgxLB4uDA3affNqJMs=;
 b=Ziby3/naw6SZNptK0ZCBVret6THiTk8NCdfOVQcL5pEDkMbyA1d7jUSkxWmk0HXY5a
 jJHoKYpNRlBD7203vjBRGyoFScDVApy335ZCctijofMroleVwbUBcFExE4Bh8qKB7Fvs
 xOM2d2hVIw5s8oQkDNs4dqMrOdZqcU37y9YbA8ltmHtyLO5lgMc6GjecVo+qg2uSnoqa
 rUbV8h+/5Ep67626NCrJXtaOl7/IlcFeGeryJSEQpCpIvrqwOzg4yhqpSfgXgYXczIhw
 Qxj77NtLP/mxuZAIPE2bfXsPX0wEblxwXCKo4CaN9OlZxTPGRLd7mWVpc5TrTUCYFuXR
 yv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwqNogG8vHxP252WZiCGBfjwezgxLB4uDA3affNqJMs=;
 b=Kc2IxqpcNndSaJvfe3/X8qH78RoyDJy7Lllyn1ucaGdDW5TJcyuKaFYFGtuIehU92p
 KpuB7RT/6keMlHp99Y5djRqw6cUB0BXtmOcG1dF4UvqoQYMNgXnrd0rCy6JGm52jncp+
 iSnbNpIpjR9d76w4f++o2Wa3yOi7UfNTos5xuPGr5alVnzHvltE/pvgHJXFDj34HaVFT
 CoG01zOsTFnsO94DCA1lpUf79F/SdjOsPyg37jvLGsLmqIY6H5S2caPZvv22vlusucSM
 UEqeWtFR5gqmMOIJqpiuNZEAubRXJUrDWNT7LUU9P3p+ye5Tsi3uIbWPfggzxpBwxFdU
 w16Q==
X-Gm-Message-State: AGi0Puaxc1o5oMYrGFh2aZ+LJJszdKJeg/7aEh8LCzSC3hPnvsI/9iCr
 QNIN8PfkX8ojOTf1GnxVGS9dR6Ok3Zg=
X-Google-Smtp-Source: APiQypLqDo69KGOp9D2CpPc5C6DkVAEWYZSECiOGBRVjy40VelsGnjmcTYJWLy4Hl9WyIlNhn77BCA==
X-Received: by 2002:a17:90a:c297:: with SMTP id
 f23mr6397287pjt.21.1588093382259; 
 Tue, 28 Apr 2020 10:03:02 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:01 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:01 +0530
Message-Id: <20200428170228.7002-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 05/32] parsing_cocci: unparse_ast0:
	Reflect cast attributes
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
unparse_ast0.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unparse_ast0.ml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
index fdaf6cfa..7f554b37 100644
--- a/parsing_cocci/unparse_ast0.ml
+++ b/parsing_cocci/unparse_ast0.ml
@@ -221,8 +221,10 @@ let rec expression e =
 	  expression exp; mcode print_string pt; ident field
       | Ast0.RecordPtAccess(exp,ar,field) ->
 	  expression exp; mcode print_string ar; ident field
-      | Ast0.Cast(lp,ty,rp,exp) ->
+      | Ast0.Cast(lp,ty,attr,rp,exp) ->
 	  mcode print_string_box lp; typeC ty; close_box();
+	  (if not (attr = []) then print_string " ");
+	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
 	  mcode print_string rp; expression exp
       | Ast0.SizeOfExpr(szf,exp) ->
 	  mcode print_string szf; expression exp
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
