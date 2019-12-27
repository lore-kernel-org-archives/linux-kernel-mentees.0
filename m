Return-Path: <SRS0=KBRW=2R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5F5C2D0C0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Dec 2019 01:00:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33B12080D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Dec 2019 01:00:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0tf8yE5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A33B12080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 72D89204F4;
	Fri, 27 Dec 2019 01:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJqrWbpULLv2; Fri, 27 Dec 2019 01:00:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 51BEF20487;
	Fri, 27 Dec 2019 01:00:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38B2DC18DD;
	Fri, 27 Dec 2019 01:00:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB9D6C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B72A187327
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgKU6nT72P5e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 96ED387143
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:46 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s64so13641579pgb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 17:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yWOe5wokD7PXE5eb2l014Cgkgdh+K2uUczGe6c1Zn5M=;
 b=G0tf8yE5BzwsGri54YqX9qkHwBzqAb1SlIAHjCgD1XEA9GVAb4Aai1Z7esmISMxhLw
 bS6Su/TS75k27tdZvxtBFF1JCvIRihvsk9b7vDjqAbECygQ6fxeDx6kbaBi+qEzdaCFi
 vhp1Jpdjv6GGvEY1b4C81NwDj+eX6NBZb6z6zDbFNNbseKK8wG50eQrsw1qcY2ddRqC0
 zWyGndClawbvL4oK1+78JT9P6Kvn/6VlGjnO/y+t5/K0Kw7zGBTozye30Galz/07aoiF
 5H3/qBB9olu2cgaWOMaFSnF4rhVHbFyBnGK+uyza5fqtFUnb3L+rvc76LOqtav+tObDj
 AzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yWOe5wokD7PXE5eb2l014Cgkgdh+K2uUczGe6c1Zn5M=;
 b=faEv5UQOuV21Wid8ebvYIClhKxewECKY8BcatY1pxCl6mRQK60GIT/34F9kXxWDZ7g
 CS/Ken2HU5O0uCBN4zmbel23PVRUmUyeErqMQLj6H4lTTw9IQa46AHsk68GnUi9sn4nl
 iC9yw4sWTJhmJbfuy7LDaEYRZORbVTYdbof/rx11CV0rg+w0Q6s7QOWVFPoCSOefDxQ+
 WyMZTf/nvnomSzRlm7bqD46ac6GexY5n6L/Pb9VT0bKmHgdIbD7DV3Q/eLlLSfdLkCq5
 UuX1zBkvEd86QavGlkAmMf7Za/Zph1G+4DyurAaBzHo8iVutNCxHzhWcK91fOVqZW1Nz
 qixw==
X-Gm-Message-State: APjAAAXaF1sqzyixOSRexHhQKlXNtftjVOW5IqmUBUqFZio4cbmuzNvu
 IaMf/2M7BAF00yRHrjm0yaY=
X-Google-Smtp-Source: APXvYqxXnYvMF50GmyIIVzf5l5l/GfR2e8sXtXBVWFxftnmTZ9bmTVmV+IDX95lRuqgGIKvs7BIYgA==
X-Received: by 2002:aa7:96c7:: with SMTP id h7mr50263431pfq.211.1577408445697; 
 Thu, 26 Dec 2019 17:00:45 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id 65sm39640144pfu.140.2019.12.26.17.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 17:00:45 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Date: Thu, 26 Dec 2019 22:00:33 -0300
Message-Id: <20191227010035.854913-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] Documentation: fs: Fix warnings
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following warnings:

fs/debugfs/inode.c:423: WARNING: Inline literal start-string without end-string.
fs/debugfs/inode.c:502: WARNING: Inline literal start-string without end-string.
fs/debugfs/inode.c:534: WARNING: Inline literal start-string without end-string.
fs/debugfs/inode.c:627: WARNING: Inline literal start-string without end-string.
fs/debugfs/file.c:496: WARNING: Inline literal start-string without end-string.
fs/debugfs/file.c:502: WARNING: Inline literal start-string without end-string.
fs/debugfs/file.c:581: WARNING: Inline literal start-string without end-string.
fs/debugfs/file.c:587: WARNING: Inline literal start-string without end-string.
fs/debugfs/file.c:846: WARNING: Inline literal start-string without end-string.
fs/debugfs/file.c:852: WARNING: Inline literal start-string without end-string.
fs/debugfs/file.c:899: WARNING: Inline literal start-string without end-string.
fs/debugfs/file.c:905: WARNING: Inline literal start-string without end-string.
fs/debugfs/file.c:1091: WARNING: Inline literal start-string without end-string.
fs/debugfs/file.c:1097: WARNING: Inline literal start-string without end-string

By replacing %ERR_PTR with ERR_PTR.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 fs/debugfs/file.c  | 21 ++++++++++-----------
 fs/debugfs/inode.c |  9 ++++-----
 2 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index dede25247b81..8be46add9105 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -496,10 +496,10 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_u32_wo, NULL, debugfs_u32_set, "%llu\n");
  * This function will return a pointer to a dentry if it succeeds.  This
  * pointer must be passed to the debugfs_remove() function when the file is
  * to be removed (no automatic cleanup happens if your module is unloaded,
- * you are responsible here.)  If an error occurs, %ERR_PTR(-ERROR) will be
+ * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
- * If debugfs is not enabled in the kernel, the value %ERR_PTR(-ENODEV) will
+ * If debugfs is not enabled in the kernel, the value ERR_PTR(-ENODEV) will
  * be returned.
  */
 struct dentry *debugfs_create_u32(const char *name, umode_t mode,
@@ -581,10 +581,10 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_ulong_wo, NULL, debugfs_ulong_set, "%llu\n");
  * This function will return a pointer to a dentry if it succeeds.  This
  * pointer must be passed to the debugfs_remove() function when the file is
  * to be removed (no automatic cleanup happens if your module is unloaded,
- * you are responsible here.)  If an error occurs, %ERR_PTR(-ERROR) will be
+ * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
- * If debugfs is not enabled in the kernel, the value %ERR_PTR(-ENODEV) will
+ * If debugfs is not enabled in the kernel, the value ERR_PTR(-ENODEV) will
  * be returned.
  */
 struct dentry *debugfs_create_ulong(const char *name, umode_t mode,
@@ -846,10 +846,10 @@ static const struct file_operations fops_bool_wo = {
  * This function will return a pointer to a dentry if it succeeds.  This
  * pointer must be passed to the debugfs_remove() function when the file is
  * to be removed (no automatic cleanup happens if your module is unloaded,
- * you are responsible here.)  If an error occurs, %ERR_PTR(-ERROR) will be
+ * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
- * If debugfs is not enabled in the kernel, the value %ERR_PTR(-ENODEV) will
+ * If debugfs is not enabled in the kernel, the value ERR_PTR(-ENODEV) will
  * be returned.
  */
 struct dentry *debugfs_create_bool(const char *name, umode_t mode,
@@ -899,10 +899,10 @@ static const struct file_operations fops_blob = {
  * This function will return a pointer to a dentry if it succeeds.  This
  * pointer must be passed to the debugfs_remove() function when the file is
  * to be removed (no automatic cleanup happens if your module is unloaded,
- * you are responsible here.)  If an error occurs, %ERR_PTR(-ERROR) will be
+ * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
- * If debugfs is not enabled in the kernel, the value %ERR_PTR(-ENODEV) will
+ * If debugfs is not enabled in the kernel, the value ERR_PTR(-ENODEV) will
  * be returned.
  */
 struct dentry *debugfs_create_blob(const char *name, umode_t mode,
@@ -1091,10 +1091,10 @@ static const struct file_operations fops_regset32 = {
  * This function will return a pointer to a dentry if it succeeds.  This
  * pointer must be passed to the debugfs_remove() function when the file is
  * to be removed (no automatic cleanup happens if your module is unloaded,
- * you are responsible here.)  If an error occurs, %ERR_PTR(-ERROR) will be
+ * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
- * If debugfs is not enabled in the kernel, the value %ERR_PTR(-ENODEV) will
+ * If debugfs is not enabled in the kernel, the value ERR_PTR(-ENODEV) will
  * be returned.
  */
 struct dentry *debugfs_create_regset32(const char *name, umode_t mode,
@@ -1158,4 +1158,3 @@ struct dentry *debugfs_create_devm_seqfile(struct device *dev, const char *name,
 				   &debugfs_devm_entry_ops);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_devm_seqfile);
-
diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index f4d8df5e4714..dc6cffc4feba 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -423,7 +423,7 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
  * This function will return a pointer to a dentry if it succeeds.  This
  * pointer must be passed to the debugfs_remove() function when the file is
  * to be removed (no automatic cleanup happens if your module is unloaded,
- * you are responsible here.)  If an error occurs, %ERR_PTR(-ERROR) will be
+ * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
  * If debugfs is not enabled in the kernel, the value -%ENODEV will be
@@ -502,7 +502,7 @@ EXPORT_SYMBOL_GPL(debugfs_create_file_unsafe);
  * This function will return a pointer to a dentry if it succeeds.  This
  * pointer must be passed to the debugfs_remove() function when the file is
  * to be removed (no automatic cleanup happens if your module is unloaded,
- * you are responsible here.)  If an error occurs, %ERR_PTR(-ERROR) will be
+ * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
  * If debugfs is not enabled in the kernel, the value -%ENODEV will be
@@ -534,7 +534,7 @@ EXPORT_SYMBOL_GPL(debugfs_create_file_size);
  * This function will return a pointer to a dentry if it succeeds.  This
  * pointer must be passed to the debugfs_remove() function when the file is
  * to be removed (no automatic cleanup happens if your module is unloaded,
- * you are responsible here.)  If an error occurs, %ERR_PTR(-ERROR) will be
+ * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
  * If debugfs is not enabled in the kernel, the value -%ENODEV will be
@@ -627,7 +627,7 @@ EXPORT_SYMBOL(debugfs_create_automount);
  * This function will return a pointer to a dentry if it succeeds.  This
  * pointer must be passed to the debugfs_remove() function when the symbolic
  * link is to be removed (no automatic cleanup happens if your module is
- * unloaded, you are responsible here.)  If an error occurs, %ERR_PTR(-ERROR)
+ * unloaded, you are responsible here.)  If an error occurs, ERR_PTR(-ERROR)
  * will be returned.
  *
  * If debugfs is not enabled in the kernel, the value -%ENODEV will be
@@ -906,4 +906,3 @@ static int __init debugfs_init(void)
 	return retval;
 }
 core_initcall(debugfs_init);
-
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
