Return-Path: <SRS0=XQRh=HW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78D0C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Feb 2021 12:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 557D964EDE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Feb 2021 12:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 557D964EDE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E39183BBB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Feb 2021 12:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdBV0s19MmN8
	for <linux-kernel-mentees@archiver.kernel.org>;
	Sat, 20 Feb 2021 12:02:30 +0000 (UTC)
Received: by smtp1.osuosl.org (Postfix, from userid 1001)
	id 5FFF783AD9; Sat, 20 Feb 2021 12:02:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7C1783A15;
	Sat, 20 Feb 2021 12:02:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D544FC000A;
	Sat, 20 Feb 2021 12:02:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2EC1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Feb 2021 12:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E2270874DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Feb 2021 12:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXdSZ-+l4v0t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Feb 2021 12:02:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B0B38874C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Feb 2021 12:02:23 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id z68so7091604pgz.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Feb 2021 04:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QwTmp0t10gU6keU+dFoBJ3PuBW0qxuWqkC//wm7O0Mg=;
 b=rQlalVMthMNMt1D2RBNutpw9CbI1UhJbuLWAs1iti/cII77CEixe1OvUUjYQcfTUdF
 a8gKfJxdwgoeYXf8DFVjFrbBEVyel7M99389kg3Lcl04AQ5+Hg4/6CO1OL1fR+Z3P5pz
 ubdLcas1bFie1ENCoo0afea7B89RjaJThc4tlr4dY+Kf+wVfENtxr3sOgyxYCmiThNMA
 zDAKGz3AERnRnMbiwnculokMTxzoJjLOy9xj665xJ3Sqaak+mMTQ7o9/smY8Dp3/yqQ+
 9Rau2RGemYT6h/Y3WvAwmBBqXEFA7GVQPkW4Z+uAwDBDUjPxxf7r4VyONXmKF9flRUVt
 eHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QwTmp0t10gU6keU+dFoBJ3PuBW0qxuWqkC//wm7O0Mg=;
 b=CIs34B/rPUacZ5i9dRYIrtWys8qT6cEdVberBeXO1gaRIBuaD4AbaQ+1JbhK5DbCeW
 1DErazZMnZ91YEnoMHFjVmS79O1tX58z/P2GaL6l+3NQdsb9+IPGqhuWtYcdVqmh0Dhq
 zB6rkqBmYJJo9z5+YLY6pchYqw0iHdasrWlS1lAJtw0PlB5VO3lau8Wt5eOpkXurxjbT
 im76KdThvX4DGf+8dIu1LmcsWkaLJownU9H0s84EbuJJ+HbovKcXIRV283vWUKVf0Yxx
 hmkY/4YKgWgf6lIxNWgLMxIMxwTtxP9QquhsPVdrcK2DKV6Ga9+FUXAR7icPW8L/uUz5
 LYkQ==
X-Gm-Message-State: AOAM530Jyd70nretARdoN5BsnYRvzj5ZCOuQH2zAVzwZWj/A4lI5hIgC
 DEFrG061wZdrUUo6GdeInMI=
X-Google-Smtp-Source: ABdhPJze7kdnsKz5ku2rCC7Gs8Hg2I5p1zkafULceaHRv901UXKcAaQR/f8nFEjKhyesnhajt7ORlQ==
X-Received: by 2002:a63:587:: with SMTP id 129mr12437391pgf.233.1613822543023; 
 Sat, 20 Feb 2021 04:02:23 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6b3c:bf56:7f84:6ce5:cf93])
 by smtp.gmail.com with ESMTPSA id ml7sm6567046pjb.28.2021.02.20.04.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 04:02:22 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat, 20 Feb 2021 17:32:20 +0530
Message-Id: <20210220120220.32585-3-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210220120220.32585-1-dwaipayanray1@gmail.com>
References: <20210220120220.32585-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v5 2/2] docs: add documentation for
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

The checkpatch message types are grouped by usage. Under
each group the types are described briefly. 34 of such
types are documented.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 526 +++++++++++++++++++++++++
 Documentation/dev-tools/index.rst      |   1 +
 2 files changed, 527 insertions(+)
 create mode 100644 Documentation/dev-tools/checkpatch.rst

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
new file mode 100644
index 000000000000..d3c0fbf553c3
--- /dev/null
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -0,0 +1,526 @@
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
+	=== Introduction
+	=== Options
+	=== Message Levels
+	=== Type Descriptions
+
+Introduction
+============
+
+Checkpatch (scripts/checkpatch.pl) is a perl script which checks for trivial
+style violations in patches and optionally corrects them.  Checkpatch can
+also be run on file contexts and without the kernel tree.
+
+Checkpatch is not always right. Your judgement takes precedence over checkpatch
+messages.  If your code looks better with the violations, then its probably
+best left alone.
+
+
+Options
+=======
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
+   Enable quiet mode.
+
+ - -v,  --verbose
+   Enable verbose mode.  Additional verbose test descriptions are output
+   so as to provide information on why that particular message is shown.
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
+   Setting this flag effectively stops a message for a missing signed-off-by
+   line in a patch context.
+
+ - --patch
+
+   Treat FILE as a patch.  This is the default option and need not be
+   explicitly specified.
+
+ - --emacs
+
+   Set output to emacs compile window format.  This allows emacs users to jump
+   from the error in the compile window directly to the offending line in the
+   patch.
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
+   Every message emitted by checkpatch has an associated TYPE.  Add this flag
+   to display all the types in checkpatch.
+
+   Note that when this flag is active, checkpatch does not read the input FILE,
+   and no message is emitted.  Only a list of types in checkpatch is output.
+
+ - --types TYPE(,TYPE2...)
+
+   Only display messages with the given types.
+
+   Example::
+
+     ./scripts/checkpatch.pl mypatch.patch --types EMAIL_SUBJECT,BRACES
+
+ - --ignore TYPE(,TYPE2...)
+
+   Checkpatch will not emit messages for the specified types.
+
+   Example::
+
+     ./scripts/checkpatch.pl mypatch.patch --ignore EMAIL_SUBJECT,BRACES
+
+ - --show-types
+
+   By default checkpatch doesn't display the type associated with the messages.
+   Set this flag to show the message type in the output.
+
+ - --max-line-length=n
+
+   Set the max line length (default 100).  If a line exceeds the specified
+   length, a LONG_LINE message is emitted.
+
+
+   The message level is different for patch and file contexts.  For patches,
+   a WARNING is emitted.  While a milder CHECK is emitted for files.  So for
+   file contexts, the --strict flag must also be enabled.
+
+ - --min-conf-desc-length=n
+
+   Set the Kconfig entry minimum description length, if shorter, warn.
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
+   EXPERIMENTAL - Similar to --fix but input file is overwritten with fixes.
+
+   DO NOT USE this flag unless you are absolutely sure and you have a backup
+   in place.
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
+   Use the specified codespell file.
+   Default is '/usr/share/codespell/dictionary.txt'.
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
+Message Levels
+==============
+
+Messages in checkpatch are divided into three levels. The levels of messages
+in checkpatch denote the severity of the error. They are:
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
+Type Descriptions
+=================
+
+This section contains a description of all the message types in checkpatch.
+
+.. Types in this section are also parsed by checkpatch.
+.. The types are grouped into subsections based on use.
+
+
+Allocation style
+----------------
+
+  **ALLOC_ARRAY_ARGS**
+    The first argument for kcalloc or kmalloc_array should be the
+    number of elements.  sizeof() as the first argument is generally
+    wrong.
+    See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html
+
+  **ALLOC_SIZEOF_STRUCT**
+    The allocation style is bad.  In general for family of
+    allocation functions using sizeof() to get memory size,
+    constructs like::
+
+      p = alloc(sizeof(struct foo), ...)
+
+    should be::
+
+      p = alloc(sizeof(*p), ...)
+
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#allocating-memory
+
+  **ALLOC_WITH_MULTIPLY**
+    Prefer kmalloc_array/kcalloc over kmalloc/kzalloc with a
+    sizeof multiply.
+    See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html
+
+
+API usage
+---------
+
+  **ARCH_DEFINES**
+    Architecture specific defines should be avoided wherever
+    possible.
+
+  **ARCH_INCLUDE_LINUX**
+    Whenever asm/file.h is included and linux/file.h exists, a
+    conversion can be made when linux/file.h includes asm/file.h.
+    However this is not always the case (See signal.h).
+    This message type is emitted only for includes from arch/.
+
+  **ARRAY_SIZE**
+    The ARRAY_SIZE(foo) macro should be preferred over
+    sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
+    array.
+
+    The macro is defined in include/linux/kernel.h::
+
+      #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+
+  **AVOID_BUG**
+    BUG() or BUG_ON() should be avoided totally.
+    Use WARN() and WARN_ON() instead, and handle the "impossible"
+    error condition as gracefully as possible.
+    See: https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on
+
+  **AVOID_EXTERNS**
+    Function prototypes don't need to be declared extern in .h
+    files.  It's assumed by the compiler and is unnecessary.
+
+  **AVOID_L_PREFIX**
+    Local symbol names that are prefixed with `.L` should be avoided,
+    as this has special meaning for the assembler; a symbol entry will
+    not be emitted into the symbol table.  This can prevent `objtool`
+    from generating correct unwind info.
+
+    Symbols with STB_LOCAL binding may still be used, and `.L` prefixed
+    local symbol names are still generally usable within a function,
+    but `.L` prefixed local symbol names should not be used to denote
+    the beginning or end of code regions via
+    `SYM_CODE_START_LOCAL`/`SYM_CODE_END`
+
+  **BIT_MACRO**
+    Defines like: 1 << <digit> could be BIT(digit).
+    The BIT() macro is defined in include/linux/bitops.h::
+
+      #define BIT(nr)         (1UL << (nr))
+
+  **CONSIDER_KSTRTO**
+    The simple_strtol(), simple_strtoll(), simple_strtoul(), and
+    simple_strtoull() functions explicitly ignore overflows, which
+    may lead to unexpected results in callers.  The respective kstrtol(),
+    kstrtoll(), kstrtoul(), and kstrtoull() functions tend to be the
+    correct replacements.
+    See: https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
+
+
+Comment style
+-------------
+
+  **BLOCK_COMMENT_STYLE**
+    The comment style is i
+    ncorrect.  The preferred style for multi-
+    line comments is::
+
+      /*
+      * This is the preferred style
+      * for multi line comments.
+      */
+
+    The networking comment style is a bit different, with the first line
+    not empty like the former::
+
+      /* This is the preferred comment style
+      * for files in net/ and drivers/net/
+      */
+
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
+
+  **C99_COMMENTS**
+    C99 style single line comments (//) should not be used.
+    Prefer the block comment style instead.
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
+
+
+
+Commit message
+--------------
+
+  **BAD_SIGN_OFF**
+    The signed-off-by line does not fall in line with the standards
+    specified by the community.
+    See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
+
+  **BAD_STABLE_ADDRESS_STYLE**
+    The email format for stable is incorrect.
+    Some valid options for stable address are::
+
+      1. stable@vger.kernel.org
+      2. stable@kernel.org
+
+    For adding version info, the following comment style should be used::
+
+      stable@vger.kernel.org # version info
+
+  **COMMIT_COMMENT_SYMBOL**
+    Commit log lines starting with a '#' are ignored by git as
+    comments.  To solve this problem addition of a single space
+    infront of the log line is enough.
+
+  **COMMIT_MESSAGE**
+    The patch is missing a commit description.  A brief
+    description of the changes made by the patch should be added.
+    See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
+
+  **MISSING_SIGN_OFF**
+    The patch is missing a Signed-off-by line.  A signed-off-by
+    line should be added according to Developer's certificate of
+    Origin.
+    See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
+
+  **NO_AUTHOR_SIGN_OFF**
+    The author of the patch has not signed off the patch.  It is
+    required that a simple sign off line should be present at the
+    end of explanation of the patch to denote that the author has
+    written it or otherwise has the rights to pass it on as an open
+    source patch.
+    See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
+
+
+Comparison style
+----------------
+
+  **ASSIGN_IN_IF**
+    Do not use assignments in if condition.
+    Example::
+
+      if ((foo = bar(...)) < BAZ) {
+
+    should be written as::
+
+      foo = bar(...);
+      if (foo < BAZ) {
+
+  **BOOL_COMPARISON**
+    Comparisons of A to true and false are better written
+    as A and !A.
+    See: https://lore.kernel.org/lkml/1365563834.27174.12.camel@joe-AO722/
+
+  **COMPARISON_TO_NULL**
+    Comparisons to NULL in the form (foo == NULL) or (foo != NULL)
+    are better written as (!foo) and (foo).
+
+  **CONSTANT_COMPARISON**
+    Comparisons with a constant or upper case identifier on the left
+    side of the test should be avoided.
+
+
+Spacing and Brackets
+--------------------
+
+  **ASSIGNMENT_CONTINUATIONS**
+    Assignment operators should not be written at the start of a
+    line but should follow the operand at the previous line.
+
+  **BRACES**
+    The placement of braces is stylistically incorrect.
+    The preferred way is to put the opening brace last on the line,
+    and put the closing brace first::
+
+      if (x is true) {
+        we do y
+      }
+
+    This applies for all non-functional blocks.
+    However, there is one special case, namely functions: they have the
+    opening brace at the beginning of the next line, thus::
+
+      int function(int x)
+      {
+        body of function
+      }
+
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces
+
+  **BRACKET_SPACE**
+    Whitespace before opening bracket '[' is prohibited.
+    There are some exceptions:
+
+    1. With a type on the left::
+
+        ;int [] a;
+
+    2. At the beginning of a line for slice initialisers::
+
+        [0...10] = 5,
+
+    3. Inside a curly brace::
+
+        = { [0...10] = 5 }
+
+  **CODE_INDENT**
+    Code indent should use tabs instead of spaces.
+    Outside of comments, documentation and Kconfig,
+    spaces are never used for indentation.
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#indentation
+
+  **CONCATENATED_STRING**
+    Concatenated elements should have a space in between.
+    Example::
+
+      printk(KERN_INFO"bar");
+
+    should be::
+
+      printk(KERN_INFO "bar");
+
+  **LINE_SPACING**
+    Vertical space is wasted given the limited number of lines an
+    editor window can display when multiple blank lines are used.
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
+
+  **SPACING**
+    Whitespace style used in the kernel sources is described in kernel docs.
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
+
+  **TRAILING_WHITESPACE**
+    Trailing whitespace should always be removed.
+    Some editors highlight the trailing whitespace and cause visual
+    distractions when editing files.
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
+
+
+Others
+------
+
+  **CAMELCASE**
+    Avoid CamelCase Identifiers.
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#naming
+
+  **CONFIG_DESCRIPTION**
+    Kconfig symbols should have a help text which fully describes
+    it.
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 1b1cf4f5c9d9..43d28998118b 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -14,6 +14,7 @@ whole; patches welcome!
 .. toctree::
    :maxdepth: 2
 
+   checkpatch
    coccinelle
    sparse
    kcov
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
