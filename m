Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E46EC33CA2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 12:18:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EDA2072A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 12:18:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyJDmw1n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27EDA2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E977388454;
	Fri, 10 Jan 2020 12:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mee+d4hT9ve0; Fri, 10 Jan 2020 12:18:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B562A8844E;
	Fri, 10 Jan 2020 12:18:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA68CC1796;
	Fri, 10 Jan 2020 12:18:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7ED4FC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6852B2035D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBxohcuDJCgA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:18:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 5CC6820341
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:18:43 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p9so795920plk.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 04:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=34rCBCNBrLFlE6OZuubd6Z6OlOWhV0HGucVsYoePbqA=;
 b=AyJDmw1nfTmU38bLxh+Zgeu6ZVenlE9iZh5wgKN+xTCCcVbRXd9o/heLIU/pN6gucy
 +x5Tsci0dO8ZhS0dQsBFg5t6DZIgfpU5hJ3dQgkh4Hr0FvQ3c1MCVSdIux67XzFt1JAN
 swqPk6+jTakkB2XfeIbBenGxQxjLc+3Vu0tDUnHnT0MFTrjWU9bMvxEumVbT2V0IH2k3
 NKMn8E3yiX+w12LiWcL2SWzxnYU4T0LCidiwLYIKi9lxQzBvfqDxICtapnipP+9jxEuS
 TohB1N+FcisEX8rLBfH9FIqKIemfV8QvJoxW17SQIC8NKLfxpFYpoySyD9/uqs5nLHRv
 HPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=34rCBCNBrLFlE6OZuubd6Z6OlOWhV0HGucVsYoePbqA=;
 b=a5Lu42ZejL4akdw0SxVCi2IDzC8tRz68uFvABFFFuZ17fDT/7faH4FtaimbnpA0JYw
 8YHKkU0lqRHu8Dv6HWlIjmOSkyZFTXeqB2g8Hu7lN28WI3FoSmDcsF8VdKyqZCdYTwHA
 Img5Vg/8iI/Hbo1phuDgqshc6R4uTQixaRb/sbKkxJGu7R979Bk/jxAtr+vxEqNNseXn
 pd73Y+5+NGu+7IATwpm0x3YTyNIVRU7ssbHzExDED1OjVbR8ZRkJCo8q8JbkEAy9Rizj
 W0BKpHXmSFmO3Zm19EVCOkcJSpNivJ7rtNYcVfy9IUU+u7nSbaYQCu8h5qPRUUFb5xAp
 +W4A==
X-Gm-Message-State: APjAAAV1gGKOXNT0CyptTMVVpOSGo9hsfOtdrhrnGlBFtbdx5BYsBosN
 8boBSGYa/Knte17zRpUFKFY=
X-Google-Smtp-Source: APXvYqwC+PRY9JeuUX6ytka2wfVtRm/TMSWCLgftycjUZOj9TUHFQKY/Dli2kVHoe5tJT3gd4K9HVw==
X-Received: by 2002:a17:90a:10c8:: with SMTP id
 b8mr4336581pje.92.1578658722987; 
 Fri, 10 Jan 2020 04:18:42 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.220])
 by smtp.googlemail.com with ESMTPSA id
 m128sm2774523pfm.183.2020.01.10.04.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 04:18:42 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 10 Jan 2020 17:43:42 +0530
Message-Id: <20200110121341.31522-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 openipmi-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] drivers: char: ipmi:
	ipmi_msghandler: Pass lockdep expression to RCU lists
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
 drivers/char/ipmi/ipmi_msghandler.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index cad9563f8f48..7eff0335bc82 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -35,6 +35,8 @@
 #include <linux/nospec.h>
 
 #define IPMI_DRIVER_VERSION "39.2"
+#define cmd_rcvrs_mutex_held() \
+	lockdep_is_held(&intf->cmd_rcvrs_mutex)
 
 static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
 static int ipmi_init_msghandler(void);
@@ -618,6 +620,8 @@ static DEFINE_MUTEX(ipmidriver_mutex);
 
 static LIST_HEAD(ipmi_interfaces);
 static DEFINE_MUTEX(ipmi_interfaces_mutex);
+#define ipmi_interfaces_mutex_held() \
+	lockdep_is_held(&ipmi_interfaces_mutex)
 static struct srcu_struct ipmi_interfaces_srcu;
 
 /*
@@ -1321,7 +1325,8 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 	 * synchronize_srcu()) then free everything in that list.
 	 */
 	mutex_lock(&intf->cmd_rcvrs_mutex);
-	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
+	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
+					cmd_rcvrs_mutex_held()) {
 		if (rcvr->user == user) {
 			list_del_rcu(&rcvr->link);
 			rcvr->next = rcvrs;
@@ -1599,7 +1604,8 @@ static struct cmd_rcvr *find_cmd_rcvr(struct ipmi_smi *intf,
 {
 	struct cmd_rcvr *rcvr;
 
-	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
+	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
+			rcu_read_lock_held() || cmd_rcvrs_mutex_held()) {
 		if ((rcvr->netfn == netfn) && (rcvr->cmd == cmd)
 					&& (rcvr->chans & (1 << chan)))
 			return rcvr;
@@ -1614,7 +1620,8 @@ static int is_cmd_rcvr_exclusive(struct ipmi_smi *intf,
 {
 	struct cmd_rcvr *rcvr;
 
-	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
+	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
+					cmd_rcvrs_mutex_held()) {
 		if ((rcvr->netfn == netfn) && (rcvr->cmd == cmd)
 					&& (rcvr->chans & chans))
 			return 0;
@@ -3450,7 +3457,8 @@ int ipmi_add_smi(struct module         *owner,
 	/* Look for a hole in the numbers. */
 	i = 0;
 	link = &ipmi_interfaces;
-	list_for_each_entry_rcu(tintf, &ipmi_interfaces, link) {
+	list_for_each_entry_rcu(tintf, &ipmi_interfaces, link,
+					ipmi_interfaces_mutex_held()) {
 		if (tintf->intf_num != i) {
 			link = &tintf->link;
 			break;
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
