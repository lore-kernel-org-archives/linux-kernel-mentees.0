Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64DEC2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 12:49:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B7222064C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 12:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r55YOKxK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B7222064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 70ADF8440A;
	Tue, 21 Jan 2020 12:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7icWHdGG6mFb; Tue, 21 Jan 2020 12:49:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC65F834BC;
	Tue, 21 Jan 2020 12:49:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C51CEC0176;
	Tue, 21 Jan 2020 12:49:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85AE4C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7410E2037A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBjQ3PnPET-S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:49:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id EF24C20107
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:49:33 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p9so1290890plk.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 04:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSX3p7g/5+mGyY0QbppVn7Dy3rth1hiQMkYqW3UKtds=;
 b=r55YOKxKOjaGqMzpf9rvWrfHzXFrtKq54xZ8ZzKZz1tZHG4xSG/F51ZBV3dq9Wk69H
 RJSYJfopA9X1NU6lvr1ibkGo36C3YbtKms0oS3DWTE8eHI0tUVTDqOCrv0Ke3UypAmkm
 xbr/7cfk35tSzR7c+OhOixYeLDlg0Fu8WDZXrsUxY7P3AA2rjnQRWAckuhe46ST6nCVC
 pHDXke+7++2GLBxqFOf4Trj6FvBDJgZlxSNlbcJNpcrjALVR68JgIv/V1qTwezkRaK4s
 s4XryJ5AXaufZIdbF3dAlBPjZS1HzShnIFxwKBsGoMt28sPpRo3ime+JC9DkLEp6Mzta
 GGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSX3p7g/5+mGyY0QbppVn7Dy3rth1hiQMkYqW3UKtds=;
 b=XOQL8iCKqsF72MCjYmRX+2wMnsg6/PxgnuHWPW1EUxu1C7yYDF1Jr98JL1XAe1Az29
 RLIzhxo7JdnitBGoe1P9A/WnfknKz7IVa5I1+iY4buTqJJJ0ejkTKp+5BwJIzvuJKQMK
 m+nulIY9gK+m5TqHNHIxrWSWRl9uAL8WcWhTwgeQhQOwbCX0qal0UJif8HFQAYNKV7UD
 A+ScyQTIPCNgUFQSQTojY6YQ9rHl1PS2a1yf/S16K4rmOiPuYS9PZd2Gos7zF0YJwjxR
 MooPauG6uExN9JSz3jSPJpEQ4fq+MZ4VnrGdoWT2TmLYceEHICUNqoxq0KTLv8d9ly78
 aVxA==
X-Gm-Message-State: APjAAAUzd233K7oVFsIVevdPeIlNdgzW8sO66toXKY7Lw9c/M657iobx
 PAY6AbKS5oPjbKhKrRxjNGQ=
X-Google-Smtp-Source: APXvYqyIgR5gRAKdFCfwzwpL3gmf4F8fFRm0thwpdBo9umSnXXwdljZ2jUZHu2uDPrRHEhaIz1yO4Q==
X-Received: by 2002:a17:902:b08e:: with SMTP id
 p14mr5446473plr.323.1579610973429; 
 Tue, 21 Jan 2020 04:49:33 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.201])
 by smtp.googlemail.com with ESMTPSA id g67sm44536999pfb.66.2020.01.21.04.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 04:49:32 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Jessica Yu <jeyu@kernel.org>
Date: Tue, 21 Jan 2020 18:17:46 +0530
Message-Id: <20200121124745.14864-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] kernel: module: Pass lockdep
	expression to RCU lists
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

modules is traversed using list_for_each_entry_rcu outside an
RCU read-side critical section but under the protection
of module_mutex or with preemption disabled.

Hence, add corresponding lockdep expression to silence false-positive
lockdep warnings, and harden RCU lists.

list_for_each_entry_rcu when traversed inside a preempt disabled
section, doesn't need an explicit lockdep expression since it is
implicitly checked for.

Add macro for the corresponding lockdep expression.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/module.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index b56f3224b161..2425f58159dd 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -84,6 +84,8 @@
  * 3) module_addr_min/module_addr_max.
  * (delete and add uses RCU list operations). */
 DEFINE_MUTEX(module_mutex);
+#define module_mutex_held() \
+	lockdep_is_held(&module_mutex)
 EXPORT_SYMBOL_GPL(module_mutex);
 static LIST_HEAD(modules);
 
@@ -214,7 +216,7 @@ static struct module *mod_find(unsigned long addr)
 {
 	struct module *mod;
 
-	list_for_each_entry_rcu(mod, &modules, list) {
+	list_for_each_entry_rcu(mod, &modules, list, module_mutex_held()) {
 		if (within_module(addr, mod))
 			return mod;
 	}
@@ -448,7 +450,7 @@ bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
 	if (each_symbol_in_section(arr, ARRAY_SIZE(arr), NULL, fn, data))
 		return true;
 
-	list_for_each_entry_rcu(mod, &modules, list) {
+	list_for_each_entry_rcu(mod, &modules, list, module_mutex_held()) {
 		struct symsearch arr[] = {
 			{ mod->syms, mod->syms + mod->num_syms, mod->crcs,
 			  NOT_GPL_ONLY, false },
@@ -616,7 +618,7 @@ static struct module *find_module_all(const char *name, size_t len,
 
 	module_assert_mutex_or_preempt();
 
-	list_for_each_entry_rcu(mod, &modules, list) {
+	list_for_each_entry_rcu(mod, &modules, list, module_mutex_held()) {
 		if (!even_unformed && mod->state == MODULE_STATE_UNFORMED)
 			continue;
 		if (strlen(mod->name) == len && !memcmp(mod->name, name, len))
@@ -2040,7 +2042,7 @@ void set_all_modules_text_rw(void)
 		return;
 
 	mutex_lock(&module_mutex);
-	list_for_each_entry_rcu(mod, &modules, list) {
+	list_for_each_entry_rcu(mod, &modules, list, module_mutex_held()) {
 		if (mod->state == MODULE_STATE_UNFORMED)
 			continue;
 
@@ -2059,7 +2061,7 @@ void set_all_modules_text_ro(void)
 		return;
 
 	mutex_lock(&module_mutex);
-	list_for_each_entry_rcu(mod, &modules, list) {
+	list_for_each_entry_rcu(mod, &modules, list, module_mutex_held()) {
 		/*
 		 * Ignore going modules since it's possible that ro
 		 * protection has already been disabled, otherwise we'll
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
