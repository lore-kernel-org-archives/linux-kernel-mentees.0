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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11F4C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:48:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A1123103
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:48:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVVN+Gnj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9A1123103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7474E87C9F;
	Mon, 10 Aug 2020 18:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAz9X927sSpC; Mon, 10 Aug 2020 18:48:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC9B387C9A;
	Mon, 10 Aug 2020 18:48:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9135FC013C;
	Mon, 10 Aug 2020 18:48:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 396CAC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2046087C9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4SJmCc1It8N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:48:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 426AB87C9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:48:39 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p1so5505988pls.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 11:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UFkXMNSmTNidA9A5YWnDTPnXEb/2kdO1/ASlFsc8dvM=;
 b=qVVN+GnjofU8KfHOEcOGjvmOVVIEkMz18eoB4oCRlb5evyq7/tuA3Mx/pxzMBbBuLD
 INeF/J4L3CHkFFsvsdn31/HplgjOIpfVtFdcUWtuMGEeDZmIskRAJBs1ImULM8K+0B4g
 hlJto/QWL2z0UjQGjlLxr/uGc7Co9KJlSyVMqZpVRwgItKq0EC+x2yU6sc6h9ZAgZaYB
 X+xgBBmx7gjAzlik2owYXlshj8MYxuOIpO4VV/bLJxX9cUXRurZ9jlUPCxJCMkhqM7vJ
 8rHak05SgclBW0oE1Pp/cawLxsZ6ZcxZpxyaBQ4Q6mXjlJHQTqV+XLXp9rc+GiodA8cs
 zASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UFkXMNSmTNidA9A5YWnDTPnXEb/2kdO1/ASlFsc8dvM=;
 b=m7FqSfDGUh2pX0jxjWBfl+V7tqrgU7xjKgMRdHaIWVfQ1lksfgTuA953RoZCr2gmy0
 mq95pMVW6Qt8gR2j4YYvFLeP3c28AymR16PmaASDDrdHYDi0qhEftNLF0vZBorYov0lp
 n0tQ9HrlWIGXun5Zm9ZcAN0wI1ZmFttN2CNAIR0Rv04IPsNtSPLzvtyBg15xkMRf131h
 ypRb2JO6i5Rz7EAMdfWtPlkJcK7m6zZF+p/eRP1Jve6pNj97GNsP4cwnpckdhaevRmfj
 YHB+PqxMsrm9Tn0oCT19sN95bmfcz4RokOTVvWeLTTEAMTguaPBSdgBPFCG/0q1V7ea/
 HwUQ==
X-Gm-Message-State: AOAM530LH9F2/nWyTDrjyiHdy/cp4/f2WTEf5fMAW5I4SDZ1KgFV9HHt
 jVcxqnUDYpesYY02b82CoQ8=
X-Google-Smtp-Source: ABdhPJxfkPBL0NpQM17Qm6tARqBJ7n4ZnPoYBquI02W5sLUwXrHR46huyaBTSjlfBssn4e+VRRM9GA==
X-Received: by 2002:a17:90a:fd8c:: with SMTP id
 cx12mr641765pjb.157.1597085317803; 
 Mon, 10 Aug 2020 11:48:37 -0700 (PDT)
Received: from localhost.localdomain ([124.253.77.168])
 by smtp.googlemail.com with ESMTPSA id gz7sm243218pjb.45.2020.08.10.11.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 11:48:36 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 11 Aug 2020 00:18:28 +0530
Message-Id: <20200810184828.29297-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] Filesystems: Documentation: Replace
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
 Documentation/filesystems/journalling.rst | 66 +++++++++++------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/Documentation/filesystems/journalling.rst b/Documentation/filesystems/journalling.rst
index 58ce6b395206..7e2be2faf653 100644
--- a/Documentation/filesystems/journalling.rst
+++ b/Documentation/filesystems/journalling.rst
@@ -10,27 +10,27 @@ Details
 The journalling layer is easy to use. You need to first of all create a
 journal_t data structure. There are two calls to do this dependent on
 how you decide to allocate the physical media on which the journal
-resides. The :c:func:`jbd2_journal_init_inode` call is for journals stored in
-filesystem inodes, or the :c:func:`jbd2_journal_init_dev` call can be used
+resides. The jbd2_journal_init_inode() call is for journals stored in
+filesystem inodes, or the jbd2_journal_init_dev() call can be used
 for journal stored on a raw device (in a continuous range of blocks). A
 journal_t is a typedef for a struct pointer, so when you are finally
-finished make sure you call :c:func:`jbd2_journal_destroy` on it to free up
+finished make sure you call jbd2_journal_destroy() on it to free up
 any used kernel memory.
 
 Once you have got your journal_t object you need to 'mount' or load the
 journal file. The journalling layer expects the space for the journal
 was already allocated and initialized properly by the userspace tools.
-When loading the journal you must call :c:func:`jbd2_journal_load` to process
+When loading the journal you must call jbd2_journal_load() to process
 journal contents. If the client file system detects the journal contents
 does not need to be processed (or even need not have valid contents), it
-may call :c:func:`jbd2_journal_wipe` to clear the journal contents before
-calling :c:func:`jbd2_journal_load`.
+may call jbd2_journal_wipe() to clear the journal contents before
+calling jbd2_journal_load().
 
 Note that jbd2_journal_wipe(..,0) calls
-:c:func:`jbd2_journal_skip_recovery` for you if it detects any outstanding
-transactions in the journal and similarly :c:func:`jbd2_journal_load` will
-call :c:func:`jbd2_journal_recover` if necessary. I would advise reading
-:c:func:`ext4_load_journal` in fs/ext4/super.c for examples on this stage.
+jbd2_journal_skip_recovery() for you if it detects any outstanding
+transactions in the journal and similarly jbd2_journal_load() will
+call jbd2_journal_recover() if necessary. I would advise reading
+ext4_load_journal() in fs/ext4/super.c for examples on this stage.
 
 Now you can go ahead and start modifying the underlying filesystem.
 Almost.
@@ -39,57 +39,57 @@ You still need to actually journal your filesystem changes, this is done
 by wrapping them into transactions. Additionally you also need to wrap
 the modification of each of the buffers with calls to the journal layer,
 so it knows what the modifications you are actually making are. To do
-this use :c:func:`jbd2_journal_start` which returns a transaction handle.
+this use jbd2_journal_start() which returns a transaction handle.
 
-:c:func:`jbd2_journal_start` and its counterpart :c:func:`jbd2_journal_stop`,
+jbd2_journal_start() and its counterpart jbd2_journal_stop(),
 which indicates the end of a transaction are nestable calls, so you can
 reenter a transaction if necessary, but remember you must call
-:c:func:`jbd2_journal_stop` the same number of times as
-:c:func:`jbd2_journal_start` before the transaction is completed (or more
+jbd2_journal_stop() the same number of times as
+jbd2_journal_start() before the transaction is completed (or more
 accurately leaves the update phase). Ext4/VFS makes use of this feature to
 simplify handling of inode dirtying, quota support, etc.
 
 Inside each transaction you need to wrap the modifications to the
 individual buffers (blocks). Before you start to modify a buffer you
-need to call :c:func:`jbd2_journal_get_create_access()` /
-:c:func:`jbd2_journal_get_write_access()` /
-:c:func:`jbd2_journal_get_undo_access()` as appropriate, this allows the
+need to call jbd2_journal_get_create_access() /
+jbd2_journal_get_write_access() /
+jbd2_journal_get_undo_access() as appropriate, this allows the
 journalling layer to copy the unmodified
 data if it needs to. After all the buffer may be part of a previously
 uncommitted transaction. At this point you are at last ready to modify a
 buffer, and once you are have done so you need to call
-:c:func:`jbd2_journal_dirty_metadata`. Or if you've asked for access to a
+jbd2_journal_dirty_metadata(). Or if you've asked for access to a
 buffer you now know is now longer required to be pushed back on the
-device you can call :c:func:`jbd2_journal_forget` in much the same way as you
-might have used :c:func:`bforget` in the past.
+device you can call jbd2_journal_forget() in much the same way as you
+might have used bforget() in the past.
 
-A :c:func:`jbd2_journal_flush` may be called at any time to commit and
+A jbd2_journal_flush() may be called at any time to commit and
 checkpoint all your transactions.
 
-Then at umount time , in your :c:func:`put_super` you can then call
-:c:func:`jbd2_journal_destroy` to clean up your in-core journal object.
+Then at umount time , in your put_super() you can then call
+jbd2_journal_destroy() to clean up your in-core journal object.
 
 Unfortunately there a couple of ways the journal layer can cause a
 deadlock. The first thing to note is that each task can only have a
 single outstanding transaction at any one time, remember nothing commits
-until the outermost :c:func:`jbd2_journal_stop`. This means you must complete
+until the outermost jbd2_journal_stop(). This means you must complete
 the transaction at the end of each file/inode/address etc. operation you
 perform, so that the journalling system isn't re-entered on another
 journal. Since transactions can't be nested/batched across differing
 journals, and another filesystem other than yours (say ext4) may be
 modified in a later syscall.
 
-The second case to bear in mind is that :c:func:`jbd2_journal_start` can block
+The second case to bear in mind is that jbd2_journal_start() can block
 if there isn't enough space in the journal for your transaction (based
 on the passed nblocks param) - when it blocks it merely(!) needs to wait
 for transactions to complete and be committed from other tasks, so
-essentially we are waiting for :c:func:`jbd2_journal_stop`. So to avoid
-deadlocks you must treat :c:func:`jbd2_journal_start` /
-:c:func:`jbd2_journal_stop` as if they were semaphores and include them in
+essentially we are waiting for jbd2_journal_stop(). So to avoid
+deadlocks you must treat jbd2_journal_start() /
+jbd2_journal_stop() as if they were semaphores and include them in
 your semaphore ordering rules to prevent
-deadlocks. Note that :c:func:`jbd2_journal_extend` has similar blocking
-behaviour to :c:func:`jbd2_journal_start` so you can deadlock here just as
-easily as on :c:func:`jbd2_journal_start`.
+deadlocks. Note that jbd2_journal_extend() has similar blocking
+behaviour to jbd2_journal_start() so you can deadlock here just as
+easily as on jbd2_journal_start().
 
 Try to reserve the right number of blocks the first time. ;-). This will
 be the maximum number of blocks you are going to touch in this
@@ -116,8 +116,8 @@ called after each transaction commit. You can also use
 that need processing when the transaction commits.
 
 JBD2 also provides a way to block all transaction updates via
-:c:func:`jbd2_journal_lock_updates()` /
-:c:func:`jbd2_journal_unlock_updates()`. Ext4 uses this when it wants a
+jbd2_journal_lock_updates() /
+jbd2_journal_unlock_updates(). Ext4 uses this when it wants a
 window with a clean and stable fs for a moment. E.g.
 
 ::
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
