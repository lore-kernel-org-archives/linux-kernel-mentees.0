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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4AEC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 18:34:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36C5D206DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 18:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnQdeME9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36C5D206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F33E689460;
	Mon,  6 Jul 2020 18:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xpzGwpYc1hGY; Mon,  6 Jul 2020 18:34:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A00DF89445;
	Mon,  6 Jul 2020 18:34:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9416FC0891;
	Mon,  6 Jul 2020 18:34:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A236AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8A32789445
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EvZ1gEQEtFO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:34:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2619C89461
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:34:57 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id gc9so10664633pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 11:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZsEH9GB4QLFFmyWG76IABNXZSgpM1RjJGPOIkiiU5Q8=;
 b=WnQdeME9ikGfZFnhbuUMVks6mz2VLpBoALevc0j7CPEhcQYN286bS4XpydcK3KIL/A
 awCk4zrTgZ4w3satk5FXvtgjmg3uh+V3RhX69Pt3mFNYv0zEuaqLCVE9vkZsgAvNTzD0
 u6NHX0Em7tAyrwQCJDLwa2ubTguYp/xZV51uw2AT9rracGL316Gr/kASQDyEVGiYLdhM
 utGCIW5JoihT2nmRoc9+bFSl78j3eMOsYHjOXvjboIev6X0Eeye1RCzShzO5RUz8gErC
 qD8geN/sdUf2Eo4ofndJsa9AOO9lN8ElNosmnAUqLsizlHCi85WkUF9Gtj8tWdwGG1Xk
 rcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZsEH9GB4QLFFmyWG76IABNXZSgpM1RjJGPOIkiiU5Q8=;
 b=U5YE/P84uBgyr3diivOs9f/g/Vfq2bkBhzHJJa1xaF+EmJ5xHmtsK7DNVX8ezEh9yi
 zrsVKb1jooNc3yBscG52Rf8cErUwa1ZPgwhN3MbqW0osDvj+jsZTGHpyiZ3np94WJzBl
 SgWzz6fpsp6s5P351vq0oGZhfad5+BVgMccc0qkSBbMqOD8jCo2wSyqANYlWUXvlj2Wi
 3ZNkGpqlhLTI5OaX7WqH9F3t20jI+3IkvMEhffanp1iXkYFqvUCIiR/YHk7jLvnSJekH
 LacbZr3BijNDaspFU3P7dGUfFdAvT79cCl9wP/wAJQru3X2cx8onFnM3WHf+/Ib/O21j
 Oiig==
X-Gm-Message-State: AOAM533NaQTo75zHX7HmpH9SnMbVddmpg3T+wc/CmQU3tbl+Nqnkh/NK
 mERHqfur6cj+PZb0Q4DYK30=
X-Google-Smtp-Source: ABdhPJw+1lKh2DCfiBPza3tQXTwuS+U7plcQ18oIP0lIgMSa5JofucC0xpLYMXBziaEUk2JeNpL0PQ==
X-Received: by 2002:a17:90a:22ab:: with SMTP id
 s40mr460587pjc.27.1594060496633; 
 Mon, 06 Jul 2020 11:34:56 -0700 (PDT)
Received: from localhost.localdomain ([210.56.100.149])
 by smtp.googlemail.com with ESMTPSA id oc6sm177281pjb.43.2020.07.06.11.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 11:34:56 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Date: Tue,  7 Jul 2020 00:04:37 +0530
Message-Id: <20200706183437.7239-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] Security: Documentation: Replace
	deprecated :c:func: Usage
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

Replace :c:func: with ``func()`` as the previous usage is deprecated.
Remove an extra ')' to fix broken cross reference.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
V1: Change the subject line and remove deprecated :c:func: usage
---
 Documentation/security/credentials.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/security/credentials.rst b/Documentation/security/credentials.rst
index 282e79feee6a..77b534f61c2a 100644
--- a/Documentation/security/credentials.rst
+++ b/Documentation/security/credentials.rst
@@ -453,9 +453,9 @@ still at this point.
 
 When replacing the group list, the new list must be sorted before it
 is added to the credential, as a binary search is used to test for
-membership.  In practice, this means :c:func:`groups_sort` should be
-called before :c:func:`set_groups` or :c:func:`set_current_groups`.
-:c:func:`groups_sort)` must not be called on a ``struct group_list`` which
+membership.  In practice, this means ``groups_sort()`` should be
+called before ``set_groups()`` or ``set_current_groups()``.
+``groups_sort()`` must not be called on a ``struct group_list`` which
 is shared as it may permute elements as part of the sorting process
 even if the array is already sorted.
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
