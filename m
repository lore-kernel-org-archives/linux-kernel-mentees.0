Return-Path: <SRS0=tq4P=G5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5971EC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 18:35:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F30C72223D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 18:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F30C72223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9AFF2853E5;
	Tue, 26 Jan 2021 18:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQqzpXrj809r; Tue, 26 Jan 2021 18:35:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB19584CEB;
	Tue, 26 Jan 2021 18:35:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4DE3C0FA7;
	Tue, 26 Jan 2021 18:35:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9759C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B88D386FC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUkZs5nvcd8c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 971EB86E5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:28 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id e9so10265321plh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 10:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fEoQgmlIteiP2Bdgma/lmcfMudXbPnUa3fIWsY5chGo=;
 b=mxE+9zvPuOy0BHKavlLVNCuaYpSmyrK/yIQF/w6kZZzpYp67oW3wLHvmqQB92RVLEJ
 5PUOr1xfZnVYJBX1AyWFNzBTfOgbyU/UK72NpGsjBXX4NNPA1avyKRmVj0unNT4FRFNk
 ksKoJC34mCOxqh3MFl4/WuDKQoAEEJB/SxO7h9U2Jb7AOFYeuCzZVfUBYk4QSxeB0dKJ
 ErqinPM+SVMKpM+Kvkwl1/dtDY02T5EdCG5pny8fZ/K4TWs8RtSRFA762DfrzuPp/7Wz
 7PB/Iynq3zAWl5TX1cD8YfZZ2S1u0zwnnBvV173aRRktBJa+Cv8qGfPSNnTbt8ZhIre1
 VYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fEoQgmlIteiP2Bdgma/lmcfMudXbPnUa3fIWsY5chGo=;
 b=lu95Ivy5Le2NzBSWx3fiNS333WlfdJLxl+Go8oPke3VZ2FppaxfKRTO9ovaIMwAoFH
 OOt64Uu6aJFMYMRTM+gse76dlWxw8WJ7s3h2ugr6vOCoisjU8DuAG7IAvE7BR0nquZhX
 xut6X2+KOljBAiBhIf9XZhv8s4QGaScvXzBxaqBGqYxh0odJHkiXxMfdZEcGPaI2Mi74
 cRAby6EYvCYKjZH+CHoH8kbYpH5E/cXbsmbbkz8V65iwyfE3EOvSD2dQ66sgy+/fFbwp
 KDM5pSKsOu5MNadlOsMatTLJFg/XZkfrMJWpwgHL6fMnhmLH2Hn4Bx1UFJTPmOIE28ak
 a77Q==
X-Gm-Message-State: AOAM532MVGc9bjlVzQgUDHcz/D1GIbcDVe5koOZ/Qn4hlzi7bZ74MYIJ
 GTfCugJgDU0koyGU+He1VEM=
X-Google-Smtp-Source: ABdhPJzaUYbjPxfmNBdgPKABSLNzHF7/qN2fO0u7bvXL64F472CxKn457Zf0VlxoqmqxOAheEThNEw==
X-Received: by 2002:a17:902:59c1:b029:df:fd49:f08d with SMTP id
 d1-20020a17090259c1b02900dffd49f08dmr7410656plj.76.1611686128051; 
 Tue, 26 Jan 2021 10:35:28 -0800 (PST)
Received: from localhost.localdomain ([49.37.2.129])
 by smtp.gmail.com with ESMTPSA id a31sm19713654pgb.93.2021.01.26.10.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 10:35:27 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed, 27 Jan 2021 00:05:20 +0530
Message-Id: <20210126183521.26535-3-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126183521.26535-1-dwaipayanray1@gmail.com>
References: <20210126183521.26535-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH RFC 2/3] docs: add documentation for
	checkpatch
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

Add documentation for kernel script checkpatch.pl.
This documentation is also parsed by checkpatch to
enable a verbose mode.

The test descriptions are potentially incomplete
and will be added over time to document all the
message types in checkpatch.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 283 +++++++++++++++++++++++++
 1 file changed, 283 insertions(+)
 create mode 100644 Documentation/dev-tools/checkpatch.rst

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
new file mode 100644
index 000000000000..b0f1cab108c8
--- /dev/null
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -0,0 +1,283 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==========
+Checkpatch
+==========
+
+This document describes the kernel script checkpatch.pl.
+
+.. Table of Contents
+
+	=== 1 Introduction
+	=== 2 Options
+	=== 3 Message Levels
+  === 4 Type Descriptions
+
+1 Introduction
+--------------
+
+Checkpatch (scripts/checkpatch.pl) is a perl script which checks for trivial style
+violations in patches and optionally corrects them.  Checkpatch can also be run on
+file contexts and without the kernel tree.
+
+It should be noted that checkpatch may not be always right.  At times the human
+judgement should take preference over what checkpatch has to say.  If your code looks
+better with the violations, then its probably best left alone.
+
+
+2 Options
+---------
+
+This section will describe the options checkpatch can be run with.
+
+Usage::
+
+  ./scripts/checkpatch.pl [OPTION]... [FILE]...
+
+Available options:
+
+ - -q,  --quiet
+
+   Enable quiet mode.  All information messages are disabled.  Only the
+   messages and a summary report is output.
+
+ - --no-tree
+
+   Run checkpatch without the kernel tree.
+
+ - --no-signoff
+
+   Disable the 'Signed-off-by' line check.  The sign-off is a simple line at
+   the end of the explanation for the patch, which certifies that you wrote it
+   or otherwise have the right to pass it on as an open-source patch.
+
+   Example::
+
+	 Signed-off-by: Random J Developer <random@developer.example.org>
+
+   Setting this flag effectively stops a message for a missing signed-off-by line
+   in a patch context.
+
+ - --patch
+
+   Treat FILE as a patch.  This is the default option and need not be
+   explicitly specified.
+
+ - --emacs
+
+   Set output to emacs compile window format.  This allows emacs users to jump
+   from the error in the compile window directly to the offending line in the patch.
+
+ - --terse
+
+   Output only one line per report.
+
+ - --showfile
+
+   Show the diffed file position instead of the input file position.
+
+ - -g,  --git
+
+   Treat FILE as a single commit or a git revision range.
+
+   Single commit with:
+
+   - <rev>
+   - <rev>^
+   - <rev>~n
+
+   Multiple commits with:
+
+   - <rev1>..<rev2>
+   - <rev1>...<rev2>
+   - <rev>-<count>
+
+ - -f,  --file
+
+   Treat FILE as a regular source file.  This option must be used when running
+   checkpatch on source files in the kernel.
+
+ - --subjective,  --strict
+
+   Enable stricter tests in checkpatch.  By default the tests emitted as CHECK
+   do not activate by default.  Use this flag to activate the CHECK tests.
+
+ - --list-types
+
+   Every message emitted by checkpatch has an associated TYPE.  Add this flag to
+   display all the types in checkpatch.
+
+   Note that when this flag is active, checkpatch does not read the input FILE, and
+   no message is emitted.  Only a list of types in checkpatch is output.
+
+ - --types TYPE(,TYPE2...)
+
+   Only display messages with the given types.
+
+   Example::
+
+     ./scripts/checkpatch.pl mypatch.patch --types EMAIL_SUBJECT,NO_AUTHOR_SIGN_OFF
+
+ - --ignore TYPE(,TYPE2...)
+
+   Strip off messages with the given types.
+
+   Example::
+
+     ./scripts/checkpatch.pl mypatch.patch --ignore EMAIL_SUBJECT,NO_AUTHOR_SIGN_OFF
+
+ - --show-types
+
+   By default checkpatch doesn't display the type associated with the messages.
+   Set this flag to show the message type in the output.
+
+ - --max-line-length=n
+
+   Set the max line length (default 100).  On exceeding the given length, a message
+   is emitted.
+
+   The message level is different for patch and file contexts.  For patches, a WARNING is
+   emitted.  While a milder CHECK is emitted for files.  So for file contexts, the --strict
+   flag must also be enabled.
+
+ - --min-conf-desc-length=n
+
+   Set the min description length, if shorter, warn.
+
+ - --tab-size=n
+
+   Set the number of spaces for tab (default 8).
+
+ - --root=PATH
+
+   PATH to the kernel tree root.
+
+   This option must be specified when invoking checkpatch from outside
+   the kernel root.
+
+ - --no-summary
+
+   Suppress the per file summary.
+
+ - --mailback
+
+   Only produce a report in case of Warnings or Errors.  Milder Checks are
+   excluded from this.
+
+ - --summary-file
+
+   Include the filename in summary.
+
+ - --debug KEY=[0|1]
+
+   Turn on/off debugging of KEY, where KEY is one of 'values', 'possible',
+   'type', and 'attr' (default is all off).
+
+ - --fix
+
+   This is an EXPERIMENTAL feature.  If correctable errors exists, a file
+   <inputfile>.EXPERIMENTAL-checkpatch-fixes is created which has the
+   automatically fixable errors corrected.
+
+ - --fix-inplace
+
+   EXPERIMENTAL - Similar to --fix but the input file is overwritten with fixes.
+
+   DO NOT USE this flag unless you are absolutely sure and you have a backup in place.
+
+ - --ignore-perl-version
+
+   Override checking of perl version.  Runtime errors maybe encountered after
+   enabling this flag if the perl version does not meet the minimum specified.
+
+ - --codespell
+
+   Use the codespell dictionary for checking spelling errors.
+
+ - --codespellfile
+
+   Use the specified codespell file.  Default is '/usr/share/codespell/dictionary.txt'.
+
+ - --typedefsfile
+
+   Read additional types from this file.
+
+ - --color[=WHEN]
+
+   Use colors 'always', 'never', or only when output is a terminal ('auto').
+   Default is 'auto'.
+
+ - --kconfig-prefix=WORD
+
+   Use WORD as a prefix for Kconfig symbols (default is `CONFIG_`).
+
+ - -h, --help, --version
+
+   Display the help text.
+
+3 Message Levels
+----------------
+
+Messages in checkpatch are divided into three levels. The levels of messages in
+checkpatch denote the severity of the error. They are:
+
+ - ERROR
+
+   This is the most strict level.  Messages of type ERROR must be taken
+   seriously as they denote things that are very likely to be wrong.
+
+ - WARNING
+
+   This is the next stricter level.  Messages of type WARNING requires a
+   more careful review.  But it is milder than an ERROR.
+
+ - CHECK
+
+   This is the mildest level.  These are things which may require some thought.
+
+4 Type Descriptions
+-------------------
+
+This section contains a description of all the message types in checkpatch.
+
+.. Types in this section are also parsed by checkpatch.
+.. Please keep the types sorted alphabetically.
+.. CHECKPATCH_START
+
+EMAIL_SUBJECT
+
+  The subject line should describe the change not the tool used to find
+  the change.  Consider a patch entitled:
+
+  'Fix warning detected by tool <some tool>'.
+
+  This is potentially a bad practice and the actual changes should be
+  summarised in the subject line.
+
+MISSING_SIGN_OFF
+
+  The patch is missing a Signed-off-by line.  This error must be taken
+  care of and a Signed-off-by line should be added according to
+  Developer's certificate of Origin.
+
+NO_AUTHOR_SIGN_OFF
+
+  The author of the patch has not signed off the patch.  It is required
+  that a simple sign off line should be present at the end of explanation
+  of the patch to denote that the author has written it or otherwise has
+  the rights to pass it on as an open source patch.
+
+  Sometimes this particular warning can also occur when both email address
+  and name of the author do not match the sign off line because checkpatch
+  has no mechanism to say if it is the same person.
+
+  Consider::
+
+    From: John Doe <john.doe@example.com>
+    ...
+    Signed-off-by: J. Doe <john@example2.com>
+
+  While these may point that both the persons are same, checkpatch cannot
+  understand that and in such cases this warning can be ignored.
+
+.. CHECKPATCH_END
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
