Return-Path: <SRS0=DOtU=ID=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29358C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Mar 2021 18:20:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA1CB650A3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Mar 2021 18:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA1CB650A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D4468400F;
	Fri,  5 Mar 2021 18:20:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_nGanpqQAYJ; Fri,  5 Mar 2021 18:20:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF68783FF5;
	Fri,  5 Mar 2021 18:20:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B265C000B;
	Fri,  5 Mar 2021 18:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEE9EC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 18:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD09C4EC43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 18:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AxgUg_r_1gj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 18:20:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20D5C4EC41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Mar 2021 18:20:09 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id h4so1930316pgf.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Mar 2021 10:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3CVrexvlnJ9koHqsw9KISnLFg3fxWfnmtiSsGGgZ+Gc=;
 b=TlPYtjeJWQ1c3yJnKjXXITsVClv1F3kvPBiYsCoBCdz4D4EIpe/zbuA5XvPZFQXZSh
 2peqSH/mV3qxpe/mLX/DCYLJed3J4Go8mocRrlP9KCkvAxjawMlXZ40vxIPUpX3IsN6u
 f3rEt2iEvgKbE0362T8zKJGI4oMwQ61azL+jFF2heJkCujqJv6kQN9n/tlNnBJ6uyKQP
 XUqXpEDaGJewbJu+ad80v8yG8gfNQxfUSQYgoUcwExwX+eFpJWngK7ICpGOcmFxRXUgq
 XYqiMW8n2d5RWtYgrvQJxnxKBTft9Sds8zoy0GHmtD+5Z9jTFP8IyYORaJoR3EM+h6OP
 p7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3CVrexvlnJ9koHqsw9KISnLFg3fxWfnmtiSsGGgZ+Gc=;
 b=F2ohiKooPkesLn6SJa7ndXL51f4b6/5eEFBNZa4gCVHfbrlFRG2JU5gCItvoLRyvbw
 qwlzkaOtVxaKkXYFv+zWtEufgt3EU4QfoVClcPy017HWbtX16y9GMPL2acPzNrAxSA0x
 RsOGJABVXX/G9/tqc6Yv6vsh0QKxpb0TLqsgT9dp1Lyc0KoooahJYILADt/u1AVEChyq
 7pKfO8hLv4RicI2zGGd3BoczTsJZSvjswsBfiZavdcDZAv24v8qaY88kEsJHLGU3iG1K
 kKOlE+O4Jaa6hNmg8CMP4BxxeDavlC5CKkkMKlkEV3Y+m7CwXuuB18T0pQd7ZMUSoWrj
 2y7w==
X-Gm-Message-State: AOAM532O/TtkmHQ9aAinhCA5twDGqRIXVBz8eDOyJIMIuz75l8cj3yFE
 y4EJMkZpI7oH0j/WnUJcr9o=
X-Google-Smtp-Source: ABdhPJxF4cp8/nCAppH0weT0KuimOzvtzq1ghNdldIGUP+NU/zbPHXfFhVf1+8umlgbBW50RkHGzLQ==
X-Received: by 2002:a63:db10:: with SMTP id e16mr9966734pgg.234.1614968409376; 
 Fri, 05 Mar 2021 10:20:09 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:58af:ffb4:5a90:f2bc])
 by smtp.googlemail.com with ESMTPSA id mp19sm14581545pjb.2.2021.03.05.10.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 10:20:08 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Subject: [RFC] scripts: kernel-doc: fix attribute capture in function parsing
Date: Fri,  5 Mar 2021 23:50:00 +0530
Message-Id: <20210305182000.8363-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
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

Currently, kernel-doc warns for function prototype parsing on the
presence of additional attributes in the definition.

E.g., running kernel-doc -none on include/rdma/iw_cm.h causes this
warning:
"warning: cannot understand function prototype: 'const char *__attribute_const__ iwcm_reject_msg(int reason); '"

Here, the prototype parsing does not take into account the presence
of attribute, "__attribute_const__" before function name.

Provide a simple fix by adding "__attribute_const__" in the corresponding
regex expression.

A quick evaluation by running 'kernel-doc -none' on kernel-tree reveals
that no additional warning or error has been added or removed by the fix.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/kernel-doc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 68df17877384..8673dc783309 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1753,6 +1753,7 @@ sub dump_function($$) {
     my $prototype = shift;
     my $file = shift;
     my $noret = 0;
+    my $attribute_const = qr{__attribute_const__};
 
     print_lineno($new_start_line);
 
@@ -1808,7 +1809,7 @@ sub dump_function($$) {
 	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
 	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
 	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
+	$prototype =~ m/^(\w+\s+\w+\s*\*+$attribute_const?)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
 	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
 	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
 	$prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
