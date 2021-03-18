Return-Path: <SRS0=jPrV=IQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDC5C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 19:03:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 012F764E90
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 19:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 012F764E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9B98429B;
	Thu, 18 Mar 2021 19:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VkU1iaQKWJnW; Thu, 18 Mar 2021 19:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A92384144;
	Thu, 18 Mar 2021 19:03:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6244C000F;
	Thu, 18 Mar 2021 19:03:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91461C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 19:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30AE74EE09
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 19:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5fBPkC_n3DJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 19:03:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98B6F4ECF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 19:03:10 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id g15so4150556pfq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 12:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1c4OGaWUIP+EeOgRZNX/L92rARgGSMjnglYTu8KlUXQ=;
 b=iKe5yb3gfMQM/F92hDt4/yb6o2Z7PwB73T6j4kXOMZJlkF1ZBQQkicI80Y8Y/JpI8h
 hci+Xywgj/jeDUlZyPEtph9Z4/TAaF3RDI4MJ4himuC1O3Z4QnVHnvWEBj1ylfhyKZhF
 6NPtHqMjizNNdJAotzku1xhNmtQCfaSvJIgvcGC385vbSXwfs8VxIys7fw4N1p1tUqLA
 qkVWC1TYLWJsU96mueDlas6EGg5ErFoivfHEaGwpU2VDkcHqybGkRJ5sJF0n97Xee226
 oVMPxDgxhmCtnS8lYu/eOG9p0T9lzwGo8hbyWR83FSSJVIvY10QJUS8vb/cDNUgPDbiH
 I2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1c4OGaWUIP+EeOgRZNX/L92rARgGSMjnglYTu8KlUXQ=;
 b=gI79XuwvYGHJBvqJoe+TmDwmKLPgUCnNOof3dGp6Zm2SWGVI4SZLJLGbctf75sau+H
 YQRx3HyoNUH6HPDOr8vBxdP0vV+dt8E8y8I6nfCJSXZTpSyPqnu4kO9UFWVvr143ys+l
 F5utFolmJoYf1vO/ix5LjV5i8dv8Vm5tFrBgy9wHHj8j9zJiRfKMTjbypNvumDuYdUWb
 8k9X5A5gfL+5bPf8w6yLAsZyAV5j1Hek9nxfx2b95p2n1XNbI1cIoMQOmmJ+xC917Ufl
 AbXYCW4NM2lvNTAJ9PxE9zrI6AQk8b27lRKmxlarUf3KTV53dfOF8z9x7/IkQ+EBMK1W
 F0eQ==
X-Gm-Message-State: AOAM530jDdA4Op9Hz/vkcWs2Msn0cR4yqwK8Msp+ZC5YOyGNnVGFsMBs
 rjVS72vdk+4XVL7RLHM20Bg=
X-Google-Smtp-Source: ABdhPJwyBFUrZvY01QenLa/MBgj/q9pOlVt6s00npekYbIt6OxApsBpRX2D5s6ZN2ofv8f2pD1+rjg==
X-Received: by 2002:a05:6a00:78c:b029:1f5:d587:1701 with SMTP id
 g12-20020a056a00078cb02901f5d5871701mr5402163pfu.59.1616094189818; 
 Thu, 18 Mar 2021 12:03:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6aa2:3e25:28b1:e7b3:767e])
 by smtp.gmail.com with ESMTPSA id gw20sm3011103pjb.3.2021.03.18.12.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 12:03:09 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Subject: [PATCH v2] docs: document all error message types in checkpatch
Date: Fri, 19 Mar 2021 00:33:03 +0530
Message-Id: <20210318190303.4454-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

All the error message types now have a verbose description.

Also there are two new groups of message types:

- Macros, Attributes and Symbols
- Functions and Variables

Rearrange the message types to fit these new groups as needed.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---

Changes in v2:
- Replace 4.10 kernel doc links by latest

 Documentation/dev-tools/checkpatch.rst | 316 ++++++++++++++++++++++---
 1 file changed, 278 insertions(+), 38 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 2671e54c8320..8ccd63a18e10 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -280,43 +280,12 @@ API usage
     However this is not always the case (See signal.h).
     This message type is emitted only for includes from arch/.
 
-  **ARRAY_SIZE**
-    The ARRAY_SIZE(foo) macro should be preferred over
-    sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
-    array.
-
-    The macro is defined in include/linux/kernel.h::
-
-      #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
-
   **AVOID_BUG**
     BUG() or BUG_ON() should be avoided totally.
     Use WARN() and WARN_ON() instead, and handle the "impossible"
     error condition as gracefully as possible.
     See: https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on
 
-  **AVOID_EXTERNS**
-    Function prototypes don't need to be declared extern in .h
-    files.  It's assumed by the compiler and is unnecessary.
-
-  **AVOID_L_PREFIX**
-    Local symbol names that are prefixed with `.L` should be avoided,
-    as this has special meaning for the assembler; a symbol entry will
-    not be emitted into the symbol table.  This can prevent `objtool`
-    from generating correct unwind info.
-
-    Symbols with STB_LOCAL binding may still be used, and `.L` prefixed
-    local symbol names are still generally usable within a function,
-    but `.L` prefixed local symbol names should not be used to denote
-    the beginning or end of code regions via
-    `SYM_CODE_START_LOCAL`/`SYM_CODE_END`
-
-  **BIT_MACRO**
-    Defines like: 1 << <digit> could be BIT(digit).
-    The BIT() macro is defined in include/linux/bitops.h::
-
-      #define BIT(nr)         (1UL << (nr))
-
   **CONSIDER_KSTRTO**
     The simple_strtol(), simple_strtoll(), simple_strtoul(), and
     simple_strtoull() functions explicitly ignore overflows, which
@@ -325,6 +294,22 @@ API usage
     correct replacements.
     See: https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
 
+  **LOCKDEP**
+    lockdep_no_validate class is reserved for device->mutex.
+
+  **MALFORMED_INCLUDE**
+    The #include statement has a malformed path.  This has happened
+    because the author has included a double slash "//" in the pathname
+    accidentally.
+
+  **USE_LOCKDEP**
+    lockdep_assert_held() annotations should be preferred over
+    assertions based on spin_is_locked()
+    See: https://www.kernel.org/doc/html/latest/locking/lockdep-design.html#annotations
+
+  **UAPI_INCLUDE**
+    No #include statements in include/uapi should use a uapi/ path.
+
 
 Comment style
 -------------
@@ -353,7 +338,6 @@ Comment style
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
 
 
-
 Commit message
 --------------
 
@@ -397,6 +381,35 @@ Commit message
     source patch.
     See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
 
+  **DIFF_IN_COMMIT_MSG**
+    Avoid having diff content in commit message.
+    This causes problems when one tries to apply a file containing both
+    the changelog and the diff because patch(1) tries to apply the diff
+    which it found in the changelog.
+    See: https://lore.kernel.org/lkml/20150611134006.9df79a893e3636019ad2759e@linux-foundation.org/
+
+  **GERRIT_CHANGE_ID**
+    To be picked up by gerrit, the footer of the commit message might
+    have a Change-Id like::
+
+      Change-Id: Ic8aaa0728a43936cd4c6e1ed590e01ba8f0fbf5b
+      Signed-off-by: A. U. Thor <author@example.com>
+
+    The Change-Id line must be removed before submitting.
+
+  **GIT_COMMIT_ID**
+    The proper way to reference a commit id is:
+    commit <12+ chars of sha1> ("<title line>")
+
+    An example may be::
+
+      Commit e21d2170f36602ae2708 ("video: remove unnecessary
+      platform_set_drvdata()") removed the unnecessary
+      platform_set_drvdata(), but left the variable "dev" unused,
+      delete it.
+
+    See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
+
 
 Comparison style
 ----------------
@@ -426,6 +439,148 @@ Comparison style
     side of the test should be avoided.
 
 
+Macros, Attributes and Symbols
+------------------------------
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
+  **CONST_READ_MOSTLY**
+    When a variable is tagged with the __read_mostly annotation, it is a
+    signal to the compiler that accesses to the variable will be mostly
+    reads and rarely(but NOT never) a write.
+
+    const __read_mostly does not make any sense as const data is already
+    read-only.  The __read_mostly annotation thus should be removed.
+
+  **DATE_TIME**
+    It is generally desirable that building the same source code with
+    the same set of tools is reproducible, i.e. the output is always
+    exactly the same.
+
+    The kernel does *not* use the ``__DATE__`` and ``__TIME__`` macros,
+    and enables warnings if they are used as they can lead to
+    non-deterministic builds.
+    See: https://www.kernel.org/doc/html/latest/kbuild/reproducible-builds.html#timestamps
+
+  **DEFINE_ARCH_HAS**
+    The ARCH_HAS_xyz or ARCH_HAVE_xyz patterns are totally wrong.
+
+    For big conceptual features use Kconfig symbols instead.  And for
+    smaller things where we have compatibility fallback functions but
+    want architectures able to override them with optimized ones one
+    function at a time, we should either use weak functions (appropriate
+    for some cases), or the symbol that protects them should the
+    SAME SYMBOL WE USE.
+    See: http://lkml.iu.edu/hypermail/linux/kernel/1309.3/01646.html
+
+  **INIT_ATTRIBUTE**
+    Const init definitions should use __initconst instead of
+    __initdata.
+
+    Similarly init definitions without const require a separate
+    use of const.
+
+  **INLINE_LOCATION**
+    The inline keyword should sit between storage class and type.
+
+    For example, the following segment::
+
+      inline static int example_function(void)
+      {
+              ...
+      }
+
+    should be::
+
+      static inline int example_function(void)
+      {
+              ...
+      }
+
+  **MULTISTATEMENT_MACRO_USE_DO_WHILE**
+    Macros with multiple statements should be enclosed in a
+    do - while block.  Same should also be the case for macros
+    starting with `if` to avoid logic defects::
+
+      #define macrofun(a, b, c)                 \
+        do {                                    \
+                if (a == 5)                     \
+                        do_this(b, c);          \
+        } while (0)
+
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#macros-enums-and-rtl
+
+  **WEAK_DECLARATION**
+    Using weak declarations like __attribute__((weak)) or __weak
+    can have unintended link defects.  Avoid using them.
+
+
+Functions and Variables
+-----------------------
+
+  **CAMELCASE**
+    Avoid CamelCase Identifiers.
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#naming
+
+  **FUNCTION_WITHOUT_ARGS**
+    Function declarations without arguments like::
+
+      int foo()
+
+    should be::
+
+      int foo(void)
+
+  **GLOBAL_INITIALISERS**
+    Global variables should not be initialized explicitly to
+    0 (or NULL, false, etc.).  Your compiler (or rather your
+    loader, which is responsible for zeroing out the relevant
+    sections) automatically does it for you.
+
+  **INITIALISED_STATIC**
+    Static variables should not be initialized explicitly to zero.
+    Your compiler (or rather your loader) automatically does
+    it for you.
+
+  **RETURN_PARENTHESES**
+    return is not a function and as such doesn't need parentheses::
+
+      return (bar);
+
+    can simply be::
+
+      return bar;
+
+
 Spacing and Brackets
 --------------------
 
@@ -439,7 +594,7 @@ Spacing and Brackets
     and put the closing brace first::
 
       if (x is true) {
-        we do y
+              we do y
       }
 
     This applies for all non-functional blocks.
@@ -448,7 +603,7 @@ Spacing and Brackets
 
       int function(int x)
       {
-        body of function
+              body of function
       }
 
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces
@@ -485,29 +640,114 @@ Spacing and Brackets
 
       printk(KERN_INFO "bar");
 
+  **ELSE_AFTER_BRACE**
+    `else {` should follow the closing block `}` on the same line.
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces
+
   **LINE_SPACING**
     Vertical space is wasted given the limited number of lines an
     editor window can display when multiple blank lines are used.
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
 
+  **OPEN_BRACE**
+    The opening brace should be following the function definitions on the
+    next line.  For any non functional block it should be on the same line
+    as the last construct.
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces
+
+  **POINTER_LOCATION**
+    When using pointer data or a function that returns a pointer type,
+    the preferred use of * is adjacent to the data name or function name
+    and not adjacent to the type name.
+    Examples::
+
+      char *linux_banner;
+      unsigned long long memparse(char *ptr, char **retptr);
+      char *match_strdup(substring_t *s);
+
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
+
   **SPACING**
     Whitespace style used in the kernel sources is described in kernel docs.
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
 
+  **SWITCH_CASE_INDENT_LEVEL**
+    switch should be at the same indent as case.
+    Example::
+
+      switch (suffix) {
+      case 'G':
+      case 'g':
+              mem <<= 30;
+              break;
+      case 'M':
+      case 'm':
+              mem <<= 20;
+              break;
+      case 'K':
+      case 'k':
+              mem <<= 10;
+              /* fall through */
+      default:
+              break;
+      }
+
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#indentation
+
   **TRAILING_WHITESPACE**
     Trailing whitespace should always be removed.
     Some editors highlight the trailing whitespace and cause visual
     distractions when editing files.
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
 
+  **WHILE_AFTER_BRACE**
+    while should follow the closing bracket on the same line::
+
+      do {
+              ...
+      } while(something);
+
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces
+
 
 Others
 ------
 
-  **CAMELCASE**
-    Avoid CamelCase Identifiers.
-    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#naming
-
   **CONFIG_DESCRIPTION**
     Kconfig symbols should have a help text which fully describes
     it.
+
+  **CORRUPTED_PATCH**
+    The patch seems to be corrupted or lines are wrapped.
+    Please regenerate the patch file before sending to the maintainer.
+
+  **DOS_LINE_ENDINGS**
+    For DOS-formatted patches, there are extra ^M symbols at the end of
+    the line.  These should be removed.
+
+  **EXECUTE_PERMISSIONS**
+    There is no reason for source files to be executable.  The executable
+    bit can be removed safely.
+
+  **NON_OCTAL_PERMISSIONS**
+    Permission bits should use 4 digit octal permissions (like 0700 or 0444).
+    Avoid using any other base like decimal.
+
+  **NOT_UNIFIED_DIFF**
+    The patchfile does not appear to be in unified-diff format.  Please
+    regenerate the patch before sending to the maintainer.
+
+  **PRINTF_0XDECIMAL**
+    Prefixing Ox with decimal output is defective and should be corrected.
+
+  **TRAILING_STATEMENTS**
+    Trailing statements (for example after any conditional) should be
+    on the next line.
+    Like::
+
+      if (x == y) break;
+
+    should be::
+
+      if (x == y)
+              break;
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
