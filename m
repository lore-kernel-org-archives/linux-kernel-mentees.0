Return-Path: <SRS0=vIBS=4A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A7EC3B186
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 07:03:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2239E20724
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 07:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTd7o/yY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2239E20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD47C878B3;
	Wed, 12 Feb 2020 07:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rS1hWiFaRUOc; Wed, 12 Feb 2020 07:03:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4CA6F878A0;
	Wed, 12 Feb 2020 07:03:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F1B4C1D88;
	Wed, 12 Feb 2020 07:03:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DFDAC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4695B834E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Er3_cfDuHVW6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:03:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A396D834D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:03:46 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a6so599516plm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 23:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=0Uq9w8KRDPv2naiVGbzo1YruGuVK6eQQzWbOQYDeecw=;
 b=MTd7o/yYKoH1T6IbIIfsMprL4SAKxKNCgAZN5w35hXijDO9FHWh/oKlGsuq/htmkEF
 RLZzE8Djc6VkpDIMBJ+d7Uo3AGMWg10CotBhic4+GPYe+ULGt8msLWV8wbwdsFaXVvu9
 WHDMgF3h1aWYC/9eysN+J9tkQ6uOG72e0Woh3Gu6O5PF82+maktcY1QHKqsQ9n//+r8N
 VoZS4d3rPmKHaTUdUQW6Gxu2/DMfAGeRQtbEPpjaWdKJLgWaTUuMYdndvGNHh/fzU9/Q
 m0KyFcP28tAM5iG1BQqiEBuB3SNnMwU8kd6t7PcOhFunE2lOiFZt27xwK3rlkPJ1wUbM
 iuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=0Uq9w8KRDPv2naiVGbzo1YruGuVK6eQQzWbOQYDeecw=;
 b=MwY1o+quE0CexHyUCCA8EYaWmvhytUWM+iDe1rl4UBB+nf7X40NHYEF1WHQveCjRI5
 XhjXdWUDz2rAPGspgJuslo+Yzv5QwUvxaP9xXfpDM7X5S/h6Q2O4iPdE5U1upGjDbNN7
 9GWt5i28g3bNdy8Bk+F1vaO0BAsNjJg3dw5Df5AayjOdqpxP8lkUuIaLYgwnzm+qkjiS
 QVcKE5slmf7by6BGTipvqHBRH76OvcFx0DRe7BJSWhCgSxgcNKrkuNaZRpPUvyL30J9L
 EVG06zX/n2h2MjkRouCno9eJPsmCxGSJA7ztgWJURkGB2THF4kWXDqQxX2hYFydiy/nX
 COxg==
X-Gm-Message-State: APjAAAWz5vc6aFl2nCe1LVWq6msxUZBKpIjHw56DR+uZXaOlNA/CaYlh
 TW9DPEjhmFUuhuAPHXA5vYo=
X-Google-Smtp-Source: APXvYqxQkodvD6nB6JcwuOH1UJKapBinVfko7R6dPHJlDBd1FUj31O2XhtMRfbrarwSigqtb2G/bzg==
X-Received: by 2002:a17:90a:394d:: with SMTP id
 n13mr8404083pjf.1.1581491026134; 
 Tue, 11 Feb 2020 23:03:46 -0800 (PST)
Received: from workstation-portable ([103.211.17.79])
 by smtp.gmail.com with ESMTPSA id y197sm6830998pfc.79.2020.02.11.23.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 23:03:45 -0800 (PST)
Date: Wed, 12 Feb 2020 12:33:37 +0530
From: Amol Grover <frextrite@gmail.com>
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200212070337.GC14453@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.24.1
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 openipmi-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 RESEND] ipmi: msghandler: Pass
 lockdep expression to RCU lists
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

intf->cmd_rcvrs is traversed with list_for_each_entry_rcu
outside an RCU read-side critical section but under the
protection of intf->cmd_rcvrs_mutex.

ipmi_interfaces is traversed using list_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of ipmi_interfaces_mutex.

Hence, add the corresponding lockdep expression to the list traversal
primitive to silence false-positive lockdep warnings, and
harden RCU lists.

Add macro for the corresponding lockdep expression to make the code
clean and concise.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
v3:
- Remove rcu_read_lock_held() from lockdep expression since it is
  implicitly checked.
- Remove unintended macro usage.
 
v2:
- Fix sparse error
  CHECK: Alignment should match open parenthesis

 drivers/char/ipmi/ipmi_msghandler.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index cad9563f8f48..64ba16dcb681 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -618,6 +618,8 @@ static DEFINE_MUTEX(ipmidriver_mutex);
 
 static LIST_HEAD(ipmi_interfaces);
 static DEFINE_MUTEX(ipmi_interfaces_mutex);
+#define ipmi_interfaces_mutex_held() \
+	lockdep_is_held(&ipmi_interfaces_mutex)
 static struct srcu_struct ipmi_interfaces_srcu;
 
 /*
@@ -1321,7 +1323,8 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 	 * synchronize_srcu()) then free everything in that list.
 	 */
 	mutex_lock(&intf->cmd_rcvrs_mutex);
-	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
+	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
+				lockdep_is_held(&intf->cmd_rcvrs_mutex)) {
 		if (rcvr->user == user) {
 			list_del_rcu(&rcvr->link);
 			rcvr->next = rcvrs;
@@ -1599,7 +1602,8 @@ static struct cmd_rcvr *find_cmd_rcvr(struct ipmi_smi *intf,
 {
 	struct cmd_rcvr *rcvr;
 
-	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
+	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
+				lockdep_is_held(&intf->cmd_rcvrs_mutex)) {
 		if ((rcvr->netfn == netfn) && (rcvr->cmd == cmd)
 					&& (rcvr->chans & (1 << chan)))
 			return rcvr;
@@ -1614,7 +1618,8 @@ static int is_cmd_rcvr_exclusive(struct ipmi_smi *intf,
 {
 	struct cmd_rcvr *rcvr;
 
-	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
+	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
+				lockdep_is_held(&intf->cmd_rcvrs_mutex)) {
 		if ((rcvr->netfn == netfn) && (rcvr->cmd == cmd)
 					&& (rcvr->chans & chans))
 			return 0;
@@ -3450,7 +3455,8 @@ int ipmi_add_smi(struct module         *owner,
 	/* Look for a hole in the numbers. */
 	i = 0;
 	link = &ipmi_interfaces;
-	list_for_each_entry_rcu(tintf, &ipmi_interfaces, link) {
+	list_for_each_entry_rcu(tintf, &ipmi_interfaces, link,
+				ipmi_interfaces_mutex_held()) {
 		if (tintf->intf_num != i) {
 			link = &tintf->link;
 			break;
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
