Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C981BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 18:01:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96EF1206DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 18:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lczN2dwK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96EF1206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6CB5488B2D;
	Mon,  6 Jul 2020 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oED4ATm45nqd; Mon,  6 Jul 2020 18:01:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6359288B29;
	Mon,  6 Jul 2020 18:01:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FD0FC0893;
	Mon,  6 Jul 2020 18:01:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 459ADC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 339438818B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdbHqE7bnOPR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:01:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A6AA686CD3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:01:08 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id k71so13624294pje.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 11:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=djAl3AiMl95A7tE1GRS5XYxCZQGbUXsP2I8xEBywBB4=;
 b=lczN2dwKgjJqgmZU9M4XpXNMalpvtMpGu/Oi+D1cgovOrzX6O7YWltbYZIju6O5AHg
 47dxvpu8CtZ0ky7l60tSyFAWg2S5+iMWbyjAkjmPAIH8z+MgJVf0tO/3tdjytWc25YzI
 EoyXmUvx6GpacOgSmVoVt/uL9YycNV2FAPSy62YW7/zeF67f8iJ0uuLRPvp2wt6H00n4
 h8wxgdeS5OCktiFQunqnaLSfc9U7hHhmfvRcMArDwArp8dP07CNiwSo63cYHo8mRiI1n
 Qd9why3o5/6wsMkPDHMXqPecBi7TTxtYa/AlfgjceVXvAilJ2ERBdoCDJfne/qgeNAjL
 YQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=djAl3AiMl95A7tE1GRS5XYxCZQGbUXsP2I8xEBywBB4=;
 b=qGPeNlvqpCXREwRsXong/3MppUkuWF7Jnn1FzH58C9rHypc/RNttENVzmiSgYbX/rX
 8Yer0An9irAXzxBobxqzq2oh9MpEOWNrKlYRZfeezXJspv6YWyiSI3zS+pkIY5qe/1B3
 t+MjEbyOqoHO8esFlCJfefMwsqzdn5PcqZdSmYUoHIwpACnvMf2AwQZRXQw2kCoHKHSD
 t55fwk5psmwsujoARKiifQiIZJFo4r+jxZy+IPUhH3tZpuYc3pyn6oYen+cW3vH1+epZ
 rY+BlR/Vcd5W+eMJMgyUa95Z+zyMyqU9ONssJ3d1tFXl4T9aaJm6wlR/G0QoUNOOHdtX
 otQQ==
X-Gm-Message-State: AOAM533WkL6+Sgn/YJNEqtH6kN7wFrgfKL5ylWTmSM4iJ4zuLwEoGAAu
 xGoJ2zIl7F9ysLB3UfPlZWA=
X-Google-Smtp-Source: ABdhPJwUceFmVA5F4c6ztnllLeBjbpj1RuvDse72uGenn1kyt+4hf6SjsfGLcs3Ft62WYWY2llzMwA==
X-Received: by 2002:a17:902:ab8e:: with SMTP id
 f14mr43782566plr.80.1594058468118; 
 Mon, 06 Jul 2020 11:01:08 -0700 (PDT)
Received: from localhost.localdomain ([210.56.100.149])
 by smtp.googlemail.com with ESMTPSA id d18sm133046pjv.25.2020.07.06.11.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 11:01:07 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Date: Mon,  6 Jul 2020 23:30:10 +0530
Message-Id: <20200706180010.29032-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] Security: Documentation: fix: `make
	htmldocs` warnings
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

Remove extra ')' after function name to fix warnings.
It solves following warning :
WARNING: Unparseable C cross-reference: 'groups_sort)'
Invalid C declaration: Expected end of definition. [error at 11]

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 Documentation/security/credentials.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/security/credentials.rst b/Documentation/security/credentials.rst
index 282e79feee6a..d51e42b92395 100644
--- a/Documentation/security/credentials.rst
+++ b/Documentation/security/credentials.rst
@@ -455,7 +455,7 @@ When replacing the group list, the new list must be sorted before it
 is added to the credential, as a binary search is used to test for
 membership.  In practice, this means :c:func:`groups_sort` should be
 called before :c:func:`set_groups` or :c:func:`set_current_groups`.
-:c:func:`groups_sort)` must not be called on a ``struct group_list`` which
+:c:func:`groups_sort` must not be called on a ``struct group_list`` which
 is shared as it may permute elements as part of the sorting process
 even if the array is already sorted.
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
