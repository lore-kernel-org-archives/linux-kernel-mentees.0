Return-Path: <SRS0=VniB=G7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CAAC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jan 2021 14:38:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204F164DD9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jan 2021 14:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 204F164DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D46002036B;
	Thu, 28 Jan 2021 14:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1X4J2F2rBAK; Thu, 28 Jan 2021 14:38:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9345E2E0E6;
	Thu, 28 Jan 2021 14:38:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 904EBC0FA8;
	Thu, 28 Jan 2021 14:38:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 830C9C08A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7D6548738E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGU4sNybHBP8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B9A1F873D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:09 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id t25so4430755pga.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 06:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EDdxocjLESUoQzH4ykE01V0K/R1a4JtrnLAxdtWyf3Q=;
 b=R2iodUO0QUdVkWFnsoiYHe0tNcW9ghSIlK32J3ERmEhwjp1Y0ML0WpWBGzKO/1oDIt
 Qh4W54Goya1oguS6A/tJUhGS8VLLH75ikCyYQwbPOR19leN62xERIgCaus3ofVsuioi4
 eiuEB+uAhI1k93cWpVLRr764FKUoohXQLIK1KQfUnBZBJfqo+YcGNlVQ2Dhaq0MJWn6H
 zNkjC6kmdYgZqOyl15YNWdd6uqHfhitDEbEezDVRcHOCnHugecXMcXyVpGEbO4yZWpuG
 sod/SWzJbJsJKvizZqLGsLFkZ4imO8b32BXFvx5PVXPPL2O2E39818bBrX+JYxJeogi2
 MgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EDdxocjLESUoQzH4ykE01V0K/R1a4JtrnLAxdtWyf3Q=;
 b=hL6JxfUdai8CiMs/j6/aIp7+4MRkiP12GnmaXRCcHKph6cPW4hPfWmJ9D2qe8vo/Rz
 f4ggHNkYQmQS0pqszBWkWhw/883CL7KMXQ4rTTrqL1rSfYTqILuhps4I2a39lg1Y84dE
 fVLv8MqRxk7PpS3RmGHqyENuKEljl3rT9q/1WV4temiNVWR4vbHjK4juykOoozMd9dLw
 eTdeyQxkYq1atK20Wf1Ax9vksfDI6ikgr3bHIRGC0Sl+p/VeGh/xz22hIrjnF5tjv5xm
 yzU9+Yq6mrmBrTYTBjfu1IITNw7/GCs9XiKkqvlOXtMHx65UoHOiClB6YsGvhpsTtxIl
 vT2Q==
X-Gm-Message-State: AOAM530aMwmHhlCQmaocs+ful2tBBBiJ+zaqXNPmk2d78GYOwz9TqLhT
 XVMS0kIEr5sw2lOVY6YxUDc=
X-Google-Smtp-Source: ABdhPJyVmBhLY0P5WRIv/g4ybGcMwjZMhP6tSQJd9LRkV9Mt98xMtp30Jzfy3J0ajuF2hD5PT1zvWA==
X-Received: by 2002:a63:b550:: with SMTP id u16mr16696873pgo.448.1611844689184; 
 Thu, 28 Jan 2021 06:38:09 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:686d:e9f6:a78b:e60e:9585])
 by smtp.gmail.com with ESMTPSA id w14sm5358621pjl.38.2021.01.28.06.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:38:08 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Thu, 28 Jan 2021 20:08:01 +0530
Message-Id: <20210128143802.15888-3-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128143802.15888-1-dwaipayanray1@gmail.com>
References: <20210128143802.15888-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 2/3] docs: add documentation for
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

Only a few test descriptions are added and the rest
will be added later over time to document all the
message types emitted by checkpatch.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 269 +++++++++++++++++++++++++
 1 file changed, 269 insertions(+)
 create mode 100644 Documentation/dev-tools/checkpatch.rst

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
new file mode 100644
index 000000000000..bb23f4dad11e
--- /dev/null
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -0,0 +1,269 @@
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
+	=== 4 Type Descriptions
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
+
+:LINE_SPACING:
+  Vertical space is wasted given the limited number of lines an
+  editor window can display when multiple blank lines are used.
+
+:MISSING_SIGN_OFF:
+  The patch is missing a Signed-off-by line.  A signed-off-by
+  line should be added according to Developer's certificate of
+  Origin.
+  ref: `Documentation/process/submitting-patches.rst`
+
+:NO_AUTHOR_SIGN_OFF:
+  The author of the patch has not signed off the patch.  It is
+  required that a simple sign off line should be present at the
+  end of explanation of the patch to denote that the author has
+  written it or otherwise has the rights to pass it on as an open
+  source patch.
+
+:TRAILING_WHITESPACE:
+  Trailing whitespace should always be removed.
+  Some editors highlight the trailing whitespace and cause visual
+  distractions when editing files.
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
