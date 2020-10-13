Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFCFC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:07:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC26206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:07:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6UZTlb4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC26206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6DBCA87A65;
	Tue, 13 Oct 2020 06:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94WbLkTg+YiW; Tue, 13 Oct 2020 06:07:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B0E2086E45;
	Tue, 13 Oct 2020 06:07:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E708C0052;
	Tue, 13 Oct 2020 06:07:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EF3AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E41F927404
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKfjy1ODpnIA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:07:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id EF39B20508
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:07:39 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id p21so1484422pju.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 23:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T6f9kNUdfkG2QadmXxVwgsolF3YBAlPzdWd74LtzlX4=;
 b=e6UZTlb4RxPKzJrrDyxBeyAz3xA6rZ+cpF/b/87T7NnCtoku4ymkhvaPs4uywKXakg
 UXkWuuOE5Mywi3cg9tovTOr1OvzpZfdHdvaoQliAFbCYdhn127OstfOlA4tE8PGtsRVE
 La2NcpFj1kmqyB1hiK+RVYbOgP6Hh/iPIM3/8qJAU8W0sIP23qTNthz7bM2XNLaWdrJ4
 Q2GiGmzuZFRqc2HNh9ZbEytQV312ewiqwqT+9IgjczR770bD/al1QjiKdSwVfFykBOZm
 EavbbZ9ExqTEIJAM4ps076lqh18fP/f/4Q/vuuDHEvbOcAhWTnFR/lFvWLCHCRngsaDj
 XHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T6f9kNUdfkG2QadmXxVwgsolF3YBAlPzdWd74LtzlX4=;
 b=KqbKoQQ1JEQbZgtIUkEDEu3KaWT7QmwqlHIPmnWDKN02iQKWC43w3ZMPG0oGQ2eFHv
 o/zVLOVYUFCI3xW5Fu4uIGxKZ5IgLGI3f54D4ju59e0RVXe/FeSlhh1xSlxoMYgCDgmS
 6ihS0PEcdZGLa8IpMY1HqQuNf8/Jxy9gqoVjo42BRy9nKTx+hxbz8O3274SdMcx+4o05
 X/J1r38ZBLP7kglI8GZuqXohYCxxwnG0pRk/qw4ui7IXyk3QwAF7/SPvTpX0x8MC5PKi
 VwA1YcCyehXuiytjzJ6p+08eJ0QeyaW6ThmlLwLsJ1V9wtDa1Lgw0gMRYEEMUnRRYyiO
 zDOQ==
X-Gm-Message-State: AOAM533sy6WQJ7HP1nsbAalxNjF2H4VDAeBcF4gUHwQub00LlXxQ+RJO
 t0LUdAF6b+hR388gNnynaXQ=
X-Google-Smtp-Source: ABdhPJxwHLJLhJUTtxvvxlTZ9wwh3bP1MHz8s/8RP4Rmh5Nstl0McesUGqQPL4oc29X3ebb4RO9njA==
X-Received: by 2002:a17:90a:6fe5:: with SMTP id
 e92mr23517589pjk.98.1602569259221; 
 Mon, 12 Oct 2020 23:07:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6854:a1e4:e3df:76ee:38b8])
 by smtp.gmail.com with ESMTPSA id j5sm23965244pjb.56.2020.10.12.23.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 23:07:38 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 13 Oct 2020 11:37:14 +0530
Message-Id: <20201013060714.33713-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix missing
	whitespace in formatted email
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

Commit 0c01921e56f9 ("checkpatch: add new warnings to author signoff
checks.") introduced new checks for author sign off. The format_email
procedure was modified to add comment blocks to the formatted email. But
no space was added between the email address and mail comment.

This causes wrong email formatting in cases where the email is in the form
"author@example.com (Comment block)". The space between the address and
comment block is removed, which causes incorrect parsing of the
formatted email.

An evaluation on checkpatch brought up this case. For example,
on commit 1129d31b55d5 ("ima: Fix ima digest hash table key calculation"),
the following warning was reported:

WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
system concerns)' might be better as 'David.Laight@aculab.com(big endian
system concerns)'

Add a single space in between the address and comment when the
extracted comment is not empty.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..f1a4e61917eb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1221,7 +1221,9 @@ sub format_email {
 	} else {
 		$formatted_email = "$name$name_comment <$address>";
 	}
-	$formatted_email .= "$comment";
+	if ("$comment" ne "") {
+		$formatted_email .= " $comment";
+	}
 	return $formatted_email;
 }
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
