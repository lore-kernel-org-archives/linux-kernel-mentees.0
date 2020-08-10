Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5C9C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:30:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E69520734
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpYwIQfP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E69520734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1172B20370;
	Mon, 10 Aug 2020 18:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRwL0W2S929v; Mon, 10 Aug 2020 18:30:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1C24020364;
	Mon, 10 Aug 2020 18:30:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04E94C013C;
	Mon, 10 Aug 2020 18:30:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CD26C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7892F86928
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYIZ0IssfMfL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:30:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 75C858691E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:30:28 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id 2so407679pjx.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 11:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2OIsK5oRYNh3UgYHl5k4iCZ2BKaBevjiQpD2X1y9m8=;
 b=XpYwIQfPiyLKWe43oojfboSYoSVGOYhztjOAJhIFmI8yfxNr/f6cnS6nhKIKn+wapG
 rMB+mYS0ko4mki1JO/Ii2PNhAecJb7gyXaivKkq5Etra2O4m2VJGjBasYhUUx6oWlkW3
 A+35EgUWTSkvvqn1/vZDi+E2b48yQuZrs1VB1T4u02HPXv5ztWDl5usCP+rHmcAUlIzp
 7roAGRDTDwi7QHkuxFTp8MAiiaaOH0V0ktDNipiGX2XajJd4ieO96qBdCTnYLSUj/3zl
 8neQtilCbGvSQ/FgP1wqto5PHPTOp0RBqCBuw8XUx8lVWZXu9lHWwsxbXBzU7ew9R9g+
 GDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2OIsK5oRYNh3UgYHl5k4iCZ2BKaBevjiQpD2X1y9m8=;
 b=OG2hzdUtprJYtVWd+CkiCKeSodJlrrAPMWp1VnS3zRtDMAQVKNW99JWPt+rObRVhnk
 c5D2wVZKd5rLZlqvvyx1fC4xwjvyDjeENkPSHf9jFsnBgaF11/QFZOnlOXyJ6ddy2NJs
 sXgSudXjb+OlwFx9WxpfZY68O0EaYPItYcyMEtP8SWPkygOv1lEqWAxY6243ZCph5Ffd
 gdirjTypuhFB2eZ+g09rE2Z4q1w+hxYWQzriB9CaZ/F6rLCB7NW9dLGIOWIwHfcOuRxZ
 aZq1s3nNNfRemIW1wmWyg4xbgZycyN20ejBj8UnR5TkEvirh0R3L0X4LajGgx593GlmQ
 4xfw==
X-Gm-Message-State: AOAM530sObEfe1j+uV3criqaZOFf0aNcDI88gr1RZXEs2W8/Pd8R9KUc
 jk97R1ytXwz+aFwOFbVX8vM=
X-Google-Smtp-Source: ABdhPJy9+5d0bxXiVRrwvKe+9OAis/5X3NdYthP8+EI850W24qJtDry9Bu3XQyygQswKmKSGaPktjQ==
X-Received: by 2002:a17:90b:4b03:: with SMTP id
 lx3mr578360pjb.143.1597084227927; 
 Mon, 10 Aug 2020 11:30:27 -0700 (PDT)
Received: from localhost.localdomain ([124.253.77.168])
 by smtp.googlemail.com with ESMTPSA id w3sm23876106pff.56.2020.08.10.11.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 11:30:27 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 11 Aug 2020 00:00:19 +0530
Message-Id: <20200810183019.22170-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] Core-api: Documentation: Replace
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

Replace :c:func: with func() as the previous usage is deprecated.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 Documentation/core-api/idr.rst | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/core-api/idr.rst b/Documentation/core-api/idr.rst
index a2738050c4f0..2eb5afdb9931 100644
--- a/Documentation/core-api/idr.rst
+++ b/Documentation/core-api/idr.rst
@@ -20,48 +20,48 @@ only ID allocation, and as a result is much more memory-efficient.
 IDR usage
 =========
 
-Start by initialising an IDR, either with :c:func:`DEFINE_IDR`
-for statically allocated IDRs or :c:func:`idr_init` for dynamically
+Start by initialising an IDR, either with DEFINE_IDR()
+for statically allocated IDRs or idr_init() for dynamically
 allocated IDRs.
 
-You can call :c:func:`idr_alloc` to allocate an unused ID.  Look up
-the pointer you associated with the ID by calling :c:func:`idr_find`
-and free the ID by calling :c:func:`idr_remove`.
+You can call idr_alloc() to allocate an unused ID.  Look up
+the pointer you associated with the ID by calling idr_find()
+and free the ID by calling idr_remove().
 
 If you need to change the pointer associated with an ID, you can call
-:c:func:`idr_replace`.  One common reason to do this is to reserve an
+idr_replace().  One common reason to do this is to reserve an
 ID by passing a ``NULL`` pointer to the allocation function; initialise the
 object with the reserved ID and finally insert the initialised object
 into the IDR.
 
 Some users need to allocate IDs larger than ``INT_MAX``.  So far all of
 these users have been content with a ``UINT_MAX`` limit, and they use
-:c:func:`idr_alloc_u32`.  If you need IDs that will not fit in a u32,
+idr_alloc_u32().  If you need IDs that will not fit in a u32,
 we will work with you to address your needs.
 
 If you need to allocate IDs sequentially, you can use
-:c:func:`idr_alloc_cyclic`.  The IDR becomes less efficient when dealing
+idr_alloc_cyclic().  The IDR becomes less efficient when dealing
 with larger IDs, so using this function comes at a slight cost.
 
 To perform an action on all pointers used by the IDR, you can
-either use the callback-based :c:func:`idr_for_each` or the
-iterator-style :c:func:`idr_for_each_entry`.  You may need to use
-:c:func:`idr_for_each_entry_continue` to continue an iteration.  You can
-also use :c:func:`idr_get_next` if the iterator doesn't fit your needs.
+either use the callback-based idr_for_each() or the
+iterator-style idr_for_each_entry().  You may need to use
+idr_for_each_entry_continue() to continue an iteration.  You can
+also use idr_get_next() if the iterator doesn't fit your needs.
 
-When you have finished using an IDR, you can call :c:func:`idr_destroy`
+When you have finished using an IDR, you can call idr_destroy()
 to release the memory used by the IDR.  This will not free the objects
 pointed to from the IDR; if you want to do that, use one of the iterators
 to do it.
 
-You can use :c:func:`idr_is_empty` to find out whether there are any
+You can use idr_is_empty() to find out whether there are any
 IDs currently allocated.
 
 If you need to take a lock while allocating a new ID from the IDR,
 you may need to pass a restrictive set of GFP flags, which can lead
 to the IDR being unable to allocate memory.  To work around this,
-you can call :c:func:`idr_preload` before taking the lock, and then
-:c:func:`idr_preload_end` after the allocation.
+you can call idr_preload() before taking the lock, and then
+idr_preload_end() after the allocation.
 
 .. kernel-doc:: include/linux/idr.h
    :doc: idr sync
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
