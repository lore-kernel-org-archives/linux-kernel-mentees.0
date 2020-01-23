Return-Path: <SRS0=+2mV=3M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA8BC2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 12:10:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C44F02253D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 12:10:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4eKy3R8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C44F02253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A5A12869EB;
	Thu, 23 Jan 2020 12:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ApwyNUTJs7hc; Thu, 23 Jan 2020 12:10:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F6A980E9F;
	Thu, 23 Jan 2020 12:10:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B6D6C0176;
	Thu, 23 Jan 2020 12:10:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 458DAC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 12:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3F5FB883E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 12:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEDy4ksX-THa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 12:10:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A254F883E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 12:10:17 +0000 (UTC)
Received: from linux-8ccs (x2f7fea8.dyn.telefonica.de [2.247.254.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 368AE2253D;
 Thu, 23 Jan 2020 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579781417;
 bh=xVC+of4wwHUmBPk3J4W40b+AoZu4hwXIqW9ignswEJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W4eKy3R8Ayy+tpLYSr62z7a1B4h4BFSIyBoED+15X/BvAa8a3ydZvATj73fi9Hpxj
 qd7W6qYOq1/6VmSHRnQvmcLYLykfIfdFgBFaYUrSpYGtjk1bItgtB8LfdU/HvgBf/+
 6jZidqSQ2dhAoyNEQG8i7kFw4MW+hxqJ1TbEA6NE=
Date: Thu, 23 Jan 2020 13:10:10 +0100
From: Jessica Yu <jeyu@kernel.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200123121010.GA9011@linux-8ccs>
References: <20200121124745.14864-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121124745.14864-1-frextrite@gmail.com>
X-OS: Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Joel Fernandes <joel@joelfernandes.org>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] kernel: module: Pass lockdep
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

+++ Amol Grover [21/01/20 18:17 +0530]:
>modules is traversed using list_for_each_entry_rcu outside an
>RCU read-side critical section but under the protection
>of module_mutex or with preemption disabled.
>
>Hence, add corresponding lockdep expression to silence false-positive
>lockdep warnings, and harden RCU lists.
>
>list_for_each_entry_rcu when traversed inside a preempt disabled
>section, doesn't need an explicit lockdep expression since it is
>implicitly checked for.
>
>Add macro for the corresponding lockdep expression.
>
>Signed-off-by: Amol Grover <frextrite@gmail.com>

Hi Amol!

Masami already submitted a patch for this, it's been in linux-next for
a while. See commit bf08949cc8b9 ("modules: lockdep: Suppress
suspicious RCU usage warning").

Thanks!

Jessica

>---
> kernel/module.c | 12 +++++++-----
> 1 file changed, 7 insertions(+), 5 deletions(-)
>
>diff --git a/kernel/module.c b/kernel/module.c
>index b56f3224b161..2425f58159dd 100644
>--- a/kernel/module.c
>+++ b/kernel/module.c
>@@ -84,6 +84,8 @@
>  * 3) module_addr_min/module_addr_max.
>  * (delete and add uses RCU list operations). */
> DEFINE_MUTEX(module_mutex);
>+#define module_mutex_held() \
>+	lockdep_is_held(&module_mutex)
> EXPORT_SYMBOL_GPL(module_mutex);
> static LIST_HEAD(modules);
>
>@@ -214,7 +216,7 @@ static struct module *mod_find(unsigned long addr)
> {
> 	struct module *mod;
>
>-	list_for_each_entry_rcu(mod, &modules, list) {
>+	list_for_each_entry_rcu(mod, &modules, list, module_mutex_held()) {
> 		if (within_module(addr, mod))
> 			return mod;
> 	}
>@@ -448,7 +450,7 @@ bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
> 	if (each_symbol_in_section(arr, ARRAY_SIZE(arr), NULL, fn, data))
> 		return true;
>
>-	list_for_each_entry_rcu(mod, &modules, list) {
>+	list_for_each_entry_rcu(mod, &modules, list, module_mutex_held()) {
> 		struct symsearch arr[] = {
> 			{ mod->syms, mod->syms + mod->num_syms, mod->crcs,
> 			  NOT_GPL_ONLY, false },
>@@ -616,7 +618,7 @@ static struct module *find_module_all(const char *name, size_t len,
>
> 	module_assert_mutex_or_preempt();
>
>-	list_for_each_entry_rcu(mod, &modules, list) {
>+	list_for_each_entry_rcu(mod, &modules, list, module_mutex_held()) {
> 		if (!even_unformed && mod->state == MODULE_STATE_UNFORMED)
> 			continue;
> 		if (strlen(mod->name) == len && !memcmp(mod->name, name, len))
>@@ -2040,7 +2042,7 @@ void set_all_modules_text_rw(void)
> 		return;
>
> 	mutex_lock(&module_mutex);
>-	list_for_each_entry_rcu(mod, &modules, list) {
>+	list_for_each_entry_rcu(mod, &modules, list, module_mutex_held()) {
> 		if (mod->state == MODULE_STATE_UNFORMED)
> 			continue;
>
>@@ -2059,7 +2061,7 @@ void set_all_modules_text_ro(void)
> 		return;
>
> 	mutex_lock(&module_mutex);
>-	list_for_each_entry_rcu(mod, &modules, list) {
>+	list_for_each_entry_rcu(mod, &modules, list, module_mutex_held()) {
> 		/*
> 		 * Ignore going modules since it's possible that ro
> 		 * protection has already been disabled, otherwise we'll
>-- 
>2.24.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
