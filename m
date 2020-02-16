Return-Path: <SRS0=3/iO=4E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB73C7619B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 07:46:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81A6520857
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 07:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvH6S0Wn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81A6520857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5ED5686CD3;
	Sun, 16 Feb 2020 07:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpqgse6bEAh0; Sun, 16 Feb 2020 07:46:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 935DC86C6D;
	Sun, 16 Feb 2020 07:46:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8341CC0881;
	Sun, 16 Feb 2020 07:46:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACE72C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 07:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A83F486483
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 07:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-+0S2oSjMlp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 07:46:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9FA9A86252
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 07:46:42 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g6so5492216plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Feb 2020 23:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=oByV9jS19XUdDiBoEYoJppft+pgA1ruNja8UqbGBYtw=;
 b=mvH6S0Wn+R4DBaa/bm+lPKodAlaFM5RWw9xX1GJsVLJChd63V0Yg2fT4xjtIObmqzg
 Z2yLhoSff0JDX21k+YzsszOSoqEx3Zfrw/QqyiOBZio4zm3Cj4k0KybtuiHsntg6IGgI
 qxLkp8SmzJ7ZC5Uvbgz7wW9oisVrdVI/qxdcwgeMde+PGmaW4znevq8G/ksDcd9RxxYb
 gqfZFBZgUhT5gnrYkyQmbaNQIj7s2ZFtrXKuYE7hfQuZTw2jFPGqI/HUXWUQS6q5MFmw
 JwLDUXVJXcarpyCEbqV0/6lPkeNyE0LIbD902ABYYZdqXx9SCYcCXMT6Aw+HSHVgJUHT
 U+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=oByV9jS19XUdDiBoEYoJppft+pgA1ruNja8UqbGBYtw=;
 b=YpcqMh+dD75jgekH2DSvEyyT1JWzi/MmklFprD9EwJ9QuF0WoDHZjSdpOAcpA54xZ3
 HNU81KbGj5zr4c+hSfu+9rjTRiVPZKz8XV1Z86ahtQZdcuKoqYPeJjK7+nRHlpOtmN2n
 3PzsOpRTa5fTCIaslPd5KtpMX6ILdFujxZ6Zr1Ik1X42oZjCavrCehWgu8r3DY6XsWfJ
 TiuH1zHRet/Luud0N19JreetIMVZraGzZGaDLZQ5wWJye1PLQuIwZqxGlt2RHuX4XpTZ
 JaXionp3Z5/qPzbw/V40zHP8al4ilt1qQvUMmY3LUOociIq0AGKdjAGFkvPa/vP3EtcI
 9mdw==
X-Gm-Message-State: APjAAAWqeFxGfM8B7S2AQ4FCwQFXQWPhizZTYXPVSGPoJ+DXvAXWum+f
 TlsMKLXJyJljELdzCmwlCqg=
X-Google-Smtp-Source: APXvYqygKDR9NF8DXC4hNRUsBfv4iNeh3Fz8wOFoFRmjAKsRiVGzsTON6q2g3lZ79NfFKDth+vbx9A==
X-Received: by 2002:a17:90b:4382:: with SMTP id
 in2mr13521617pjb.29.1581839202177; 
 Sat, 15 Feb 2020 23:46:42 -0800 (PST)
Received: from workstation-portable ([103.211.17.250])
 by smtp.gmail.com with ESMTPSA id l18sm12272667pfe.96.2020.02.15.23.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 23:46:41 -0800 (PST)
Date: Sun, 16 Feb 2020 13:16:36 +0530
From: Amol Grover <frextrite@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Message-ID: <20200216074636.GB14025@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.24.1
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RESEND] lockdep: Pass lockdep
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

Data is traversed using hlist_for_each_entry_rcu outside an
RCU read-side critical section but under the protection
of either lockdep_lock or with irqs disabled.

Hence, add corresponding lockdep expression to silence false-positive
lockdep warnings, and harden RCU lists. Also add macro for
corresponding lockdep expression.

Two things to note:
- RCU traversals protected under both, irqs disabled and
graph lock, have both the checks in the lockdep expression.
- RCU traversals under the protection of just disabled irqs
don't have a corresponding lockdep expression as it is implicitly
checked for.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/locking/lockdep.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 32282e7112d3..696ad5d4daed 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -85,6 +85,8 @@ module_param(lock_stat, int, 0644);
  * code to recurse back into the lockdep code...
  */
 static arch_spinlock_t lockdep_lock = (arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
+#define graph_lock_held() \
+	arch_spin_is_locked(&lockdep_lock)
 static struct task_struct *lockdep_selftest_task_struct;
 
 static int graph_lock(void)
@@ -1009,7 +1011,7 @@ static bool __check_data_structures(void)
 	/* Check the chain_key of all lock chains. */
 	for (i = 0; i < ARRAY_SIZE(chainhash_table); i++) {
 		head = chainhash_table + i;
-		hlist_for_each_entry_rcu(chain, head, entry) {
+		hlist_for_each_entry_rcu(chain, head, entry, graph_lock_held()) {
 			if (!check_lock_chain_key(chain))
 				return false;
 		}
@@ -1124,7 +1126,8 @@ void lockdep_register_key(struct lock_class_key *key)
 	raw_local_irq_save(flags);
 	if (!graph_lock())
 		goto restore_irqs;
-	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
+	hlist_for_each_entry_rcu(k, hash_head, hash_entry,
+				 irqs_disabled() && graph_lock_held()) {
 		if (WARN_ON_ONCE(k == key))
 			goto out_unlock;
 	}
@@ -1203,7 +1206,8 @@ register_lock_class(struct lockdep_map *lock, unsigned int subclass, int force)
 	 * We have to do the hash-walk again, to avoid races
 	 * with another CPU:
 	 */
-	hlist_for_each_entry_rcu(class, hash_head, hash_entry) {
+	hlist_for_each_entry_rcu(class, hash_head, hash_entry,
+				 irqs_disabled() && graph_lock_held()) {
 		if (class->key == key)
 			goto out_unlock_set;
 	}
@@ -2858,7 +2862,7 @@ static inline struct lock_chain *lookup_chain_cache(u64 chain_key)
 	struct hlist_head *hash_head = chainhashentry(chain_key);
 	struct lock_chain *chain;
 
-	hlist_for_each_entry_rcu(chain, hash_head, entry) {
+	hlist_for_each_entry_rcu(chain, hash_head, entry, graph_lock_held()) {
 		if (READ_ONCE(chain->chain_key) == chain_key) {
 			debug_atomic_inc(chain_lookup_hits);
 			return chain;
@@ -4833,7 +4837,7 @@ static void remove_class_from_lock_chains(struct pending_free *pf,
 
 	for (i = 0; i < ARRAY_SIZE(chainhash_table); i++) {
 		head = chainhash_table + i;
-		hlist_for_each_entry_rcu(chain, head, entry) {
+		hlist_for_each_entry_rcu(chain, head, entry, graph_lock_held()) {
 			remove_class_from_lock_chain(pf, chain, class);
 		}
 	}
@@ -4993,7 +4997,7 @@ static void __lockdep_free_key_range(struct pending_free *pf, void *start,
 	/* Unhash all classes that were created by a module. */
 	for (i = 0; i < CLASSHASH_SIZE; i++) {
 		head = classhash_table + i;
-		hlist_for_each_entry_rcu(class, head, hash_entry) {
+		hlist_for_each_entry_rcu(class, head, hash_entry, graph_lock_held()) {
 			if (!within(class->key, start, size) &&
 			    !within(class->name, start, size))
 				continue;
@@ -5076,7 +5080,7 @@ static bool lock_class_cache_is_registered(struct lockdep_map *lock)
 
 	for (i = 0; i < CLASSHASH_SIZE; i++) {
 		head = classhash_table + i;
-		hlist_for_each_entry_rcu(class, head, hash_entry) {
+		hlist_for_each_entry_rcu(class, head, hash_entry, graph_lock_held()) {
 			for (j = 0; j < NR_LOCKDEP_CACHING_CLASSES; j++)
 				if (lock->class_cache[j] == class)
 					return true;
@@ -5181,7 +5185,8 @@ void lockdep_unregister_key(struct lock_class_key *key)
 		goto out_irq;
 
 	pf = get_pending_free();
-	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
+	hlist_for_each_entry_rcu(k, hash_head, hash_entry,
+				 irqs_disabled() && graph_lock_held()) {
 		if (k == key) {
 			hlist_del_rcu(&k->hash_entry);
 			found = true;
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
