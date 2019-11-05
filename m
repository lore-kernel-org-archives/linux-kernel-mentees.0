Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FE7CA9EDB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 07:33:50 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99673217F4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 07:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3HPrMC7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99673217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1F909114B;
	Tue,  5 Nov 2019 07:33:50 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 31ED4FFA
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 07:33:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C4912189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 07:33:48 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r4so14514254pfl.7
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 04 Nov 2019 23:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=EkRYu0Ekf5R2bAPpf2M/JWgiEhUz2V6dE5+p9ovzqsg=;
	b=d3HPrMC75mRX351XBI/x/rQuJGxRTDxpBbKEGhWDBVyK2zxOn0eoqWVxyUqmcbr+9C
	73Skipj6XHhgaJTp/Vy4rVRAE7U5Z6WnHenkPSZQqMox5hjC4DxlxEHkjiFWnlyA/xWW
	UH9+G+C3+ytczurXKdx+v6DHkfKk4mQ2IX2up1xcBo/q5eDV+LuHmMXKTAfGcflTiyKg
	AVKtdDrleO1ZGJTb8OhAXVeN4XhZcp8FaxFJqL/oDfRdn7mhrBywU60UdftPFiU5q6Fe
	BN9HcIAhxug2GRnXwoz3vDSrBKyvl9KcQmJOredL1QikFFPG/P+lb539ip7YvwqZA9Ay
	Smwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=EkRYu0Ekf5R2bAPpf2M/JWgiEhUz2V6dE5+p9ovzqsg=;
	b=csSbhKeSYZeIQReeQli+X4BZx9AT3MnG998y/M1NRli12zC25GM5UySUX3NuHgSMR1
	1EfmIpT62p/bNqwQ+FCLDdQPwXlKN0X/6Ew2Hx96ejz0u06mBpk5/f3tGH1JDeqlUua0
	0B+UM+QngbGAzH38GW8t0/z5PqQnPwx7+7hVjOEddOm4iHLUyhovq9dqNA9cpOAxXojW
	teLcZ6X+JjZZqzN3H2H/yUnTxAnEPQ1havIIJFIPlZNr6Bb7tZ+GzAPZ85mUA+0Y+oN9
	kONROOtPlA2qD6rGnEclFPrmjjsK82zMgX54h0uK3R9m8ynOiO86Zwd/FghSiI4R7Wu1
	M3kA==
X-Gm-Message-State: APjAAAXfrUGF7d/fHGJjzHLXuPxh2tLJq0koirqXuZqYiOuEpkg7JOjr
	tYOaRi02R8o5LAxznUkpJbY=
X-Google-Smtp-Source: APXvYqwQ4vOxO6VPaaSag5ZJl4fhRn/9AbcTHJw1a6Md4uNaoeUjlBZIMOfvPZujEWUvbPl62b0ZhQ==
X-Received: by 2002:a63:7158:: with SMTP id b24mr34646870pgn.153.1572939228246;
	Mon, 04 Nov 2019 23:33:48 -0800 (PST)
Received: from workstation-kernel-dev ([139.5.253.184])
	by smtp.gmail.com with ESMTPSA id
	b9sm19581266pfp.77.2019.11.04.23.33.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 23:33:47 -0800 (PST)
Date: Tue, 5 Nov 2019 13:03:40 +0530
From: Amol Grover <frextrite@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>, Jonathan Corbet <corbet@lwn.net>
Message-ID: <20191105073340.GA3682@workstation-kernel-dev>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>, rcu@vger.kernel.org,
	Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] Documentation: RCU: whatisRCU:
 Fix formatting for section 2
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

Convert RCU API methods text to sub-headings and
add footnote linking to 2 literary notes
under rcu_dereference() section for improved UX

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 Documentation/RCU/whatisRCU.rst | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
index ae40c8bcc56c..4c6f1f595757 100644
--- a/Documentation/RCU/whatisRCU.rst
+++ b/Documentation/RCU/whatisRCU.rst
@@ -150,6 +150,7 @@ later.  See the kernel docbook documentation for more info, or look directly
 at the function header comments.
 
 rcu_read_lock()
+^^^^^^^^^^^^^^^
 
 	void rcu_read_lock(void);
 
@@ -164,6 +165,7 @@ rcu_read_lock()
 	longer-term references to data structures.
 
 rcu_read_unlock()
+^^^^^^^^^^^^^^^^^
 
 	void rcu_read_unlock(void);
 
@@ -172,6 +174,7 @@ rcu_read_unlock()
 	read-side critical sections may be nested and/or overlapping.
 
 synchronize_rcu()
+^^^^^^^^^^^^^^^^^
 
 	void synchronize_rcu(void);
 
@@ -225,6 +228,7 @@ synchronize_rcu()
 	checklist.txt for some approaches to limiting the update rate.
 
 rcu_assign_pointer()
+^^^^^^^^^^^^^^^^^^^^
 
 	void rcu_assign_pointer(p, typeof(p) v);
 
@@ -245,6 +249,7 @@ rcu_assign_pointer()
 	the _rcu list-manipulation primitives such as list_add_rcu().
 
 rcu_dereference()
+^^^^^^^^^^^^^^^^^
 
 	typeof(p) rcu_dereference(p);
 
@@ -280,7 +285,7 @@ rcu_dereference()
 	unnecessary overhead on Alpha CPUs.
 
 	Note that the value returned by rcu_dereference() is valid
-	only within the enclosing RCU read-side critical section [1].
+	only within the enclosing RCU read-side critical section [1]_.
 	For example, the following is -not- legal::
 
 		rcu_read_lock();
@@ -304,9 +309,9 @@ rcu_dereference()
 	at any time, including immediately after the rcu_dereference().
 	And, again like rcu_assign_pointer(), rcu_dereference() is
 	typically used indirectly, via the _rcu list-manipulation
-	primitives, such as list_for_each_entry_rcu() [2].
+	primitives, such as list_for_each_entry_rcu() [2]_.
 
-	[1] The variant rcu_dereference_protected() can be used outside
+..	[1] The variant rcu_dereference_protected() can be used outside
 	of an RCU read-side critical section as long as the usage is
 	protected by locks acquired by the update-side code.  This variant
 	avoids the lockdep warning that would happen when using (for
@@ -319,7 +324,8 @@ rcu_dereference()
 	a lockdep splat is emitted.  See Documentation/RCU/Design/Requirements/Requirements.rst
 	and the API's code comments for more details and example usage.
 
-	[2] If the list_for_each_entry_rcu() instance might be used by
+
+..	[2] If the list_for_each_entry_rcu() instance might be used by
 	update-side code as well as by RCU readers, then an additional
 	lockdep expression can be added to its list of arguments.
 	For example, given an additional "lock_is_held(&mylock)" argument,
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
