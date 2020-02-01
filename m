Return-Path: <SRS0=SV+z=3V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246F6C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Feb 2020 07:28:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC768206A2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Feb 2020 07:28:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="An9h9hQf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC768206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 96D3689EF3;
	Sat,  1 Feb 2020 07:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RddmGw1MWHI; Sat,  1 Feb 2020 07:28:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 16EAA89B65;
	Sat,  1 Feb 2020 07:28:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B1F5C0176;
	Sat,  1 Feb 2020 07:28:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45267C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Feb 2020 07:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3BA8F88CA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Feb 2020 07:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSUPJ64jrwTf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Feb 2020 07:28:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 83DD988CA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Feb 2020 07:28:02 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t6so3725061plj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jan 2020 23:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2tdGWkxDgfXpnJAdtjaUc34vzgvsJbHdiM8yHvDQB98=;
 b=An9h9hQfzeqnBoTwBSP5knDHWbGL/U1hHk77g4T1UX3kn2zFWcnPMO/w3oPqJx1OSC
 3MTc+fotYOu4KzvnZsmbBhg0OIb5bD/i5sOMK7CZrNwwbtHLjDM1N9ash0OPM2fVQGjY
 y3BoNY72E6Y8r7zUvP7fJupd3th8pb48FR7gsfMnUksabJlOldo+RT+m3xqr3S01Of/y
 cB4ZzdziuTbhmwdhGoKfPLwNdIwGkL/2xUfn+eGn3hzK0irwV9cHNRhvwu3mTPofKujQ
 pdfnKcFA9WWbnqKg+LfxDmblvHrme7l1Fpeb96LY1SKoAYhmLZ8odC+sW91PfTxEoWl4
 3ApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2tdGWkxDgfXpnJAdtjaUc34vzgvsJbHdiM8yHvDQB98=;
 b=KnCB7GXq6r3vd8vXNumn4N67RiJszgvwQ9e53CZ96f/o6y85IbhDxyHvO9qZRYZ/Qf
 PsN3DWnUk/kbBGA2lwMLff2LzOOp3efDFmTNBc5SgJiuX1lcr+t39XnEtftoLuqeuWbL
 mCnngSoBSy0ZZAjxuwMwn8EqBEZHr8lChGHRWrX1od/xjBfwQ5kkfApL3ZFRxQjqe7Uo
 CqVJLNVnONQYiu29F9SfGTdRItjhrCaBq+nidtGoxDQ8PAeKjrMv2Z0u3Rbcbjm6D4Hh
 EeWodA3tVRpjPMhW62FtHuR5a94XvUr7HWxs6Nmywp/RMax2MeOczJQjI1tWnxSxWRvz
 hENQ==
X-Gm-Message-State: APjAAAX7i4HaMVPS4Jzo7l5E+nktVlcoEmNR2X2q/jIP4+eY0ZCPQp/r
 dwQ+Z2L35UQPi4k5+wWuX6s=
X-Google-Smtp-Source: APXvYqwygurwb6XxragQeU2J4nosucSvNpYi7cYLGA2BgmCX8lvjSlMaH85x8gA+KWF9nQu0yGWQUQ==
X-Received: by 2002:a17:90a:5d85:: with SMTP id
 t5mr17043821pji.126.1580542082014; 
 Fri, 31 Jan 2020 23:28:02 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.237])
 by smtp.googlemail.com with ESMTPSA id h7sm13240735pfq.36.2020.01.31.23.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 23:28:01 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Date: Sat,  1 Feb 2020 12:57:04 +0530
Message-Id: <20200201072703.17330-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] tracing: Annotate ftrace_graph_hash
	pointer with __rcu
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

Fix following instances of sparse error
kernel/trace/ftrace.c:5664:29: error: incompatible types in comparison
kernel/trace/ftrace.c:5785:21: error: incompatible types in comparison
kernel/trace/ftrace.c:5864:36: error: incompatible types in comparison
kernel/trace/ftrace.c:5866:25: error: incompatible types in comparison

Use rcu_dereference_protected to access the __rcu annotated pointer.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/trace/ftrace.c | 2 +-
 kernel/trace/trace.h  | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 9bf1f2cd515e..959ded08dc13 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5596,7 +5596,7 @@ static const struct file_operations ftrace_notrace_fops = {
 
 static DEFINE_MUTEX(graph_lock);
 
-struct ftrace_hash *ftrace_graph_hash = EMPTY_HASH;
+struct ftrace_hash __rcu *ftrace_graph_hash = EMPTY_HASH;
 struct ftrace_hash *ftrace_graph_notrace_hash = EMPTY_HASH;
 
 enum graph_filter_type {
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 63bf60f79398..97dad3326020 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -950,22 +950,25 @@ extern void __trace_graph_return(struct trace_array *tr,
 				 unsigned long flags, int pc);
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-extern struct ftrace_hash *ftrace_graph_hash;
+extern struct ftrace_hash __rcu *ftrace_graph_hash;
 extern struct ftrace_hash *ftrace_graph_notrace_hash;
 
 static inline int ftrace_graph_addr(struct ftrace_graph_ent *trace)
 {
 	unsigned long addr = trace->func;
 	int ret = 0;
+	struct ftrace_hash *hash;
 
 	preempt_disable_notrace();
 
-	if (ftrace_hash_empty(ftrace_graph_hash)) {
+	hash = rcu_dereference_protected(ftrace_graph_hash, !preemptible());
+
+	if (ftrace_hash_empty(hash)) {
 		ret = 1;
 		goto out;
 	}
 
-	if (ftrace_lookup_ip(ftrace_graph_hash, addr)) {
+	if (ftrace_lookup_ip(hash, addr)) {
 
 		/*
 		 * This needs to be cleared on the return functions
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
