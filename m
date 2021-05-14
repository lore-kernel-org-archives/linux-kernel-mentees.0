Return-Path: <SRS0=8/bg=KJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C29C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 May 2021 14:43:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C4161370
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 May 2021 14:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09C4161370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5E0540133;
	Fri, 14 May 2021 14:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WomqfZ_SiUxC; Fri, 14 May 2021 14:42:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5656F400A4;
	Fri, 14 May 2021 14:42:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B5FAC000E;
	Fri, 14 May 2021 14:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE4A7C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 14:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D579A84631
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 14:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CV7STpQTdo-S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 14:42:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3214843D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 14:42:55 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so1737986pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 May 2021 07:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+5VAehxotQaf0MdoTRxk7ubGUjnGk0bi6i0xDUEnFP4=;
 b=kFHG4PXCxyny33W2C4oFm+BTiYhvafaZ4yX8gf7TpFDj2284LOMQVj2NawbrVoR4If
 Q49ps0EgsTxSk7Xzz/xWmoA5ZfSNTknEmpUhGCSBG5/KU6DIKYKv0Otisf40i2GGzt7u
 /m3e4VlMgdztfGQaUWE5l4Kd/UKlKt0U56whYVf59Vfkag25EqJrjXsb6814ALBhaGQY
 QGeuLyBTMd+S49bnimZ7oZOnB+U2Qsg+lY0Rq/6rw74Ul2ke/PbcVZVOooffGkJVxeqT
 qDyLNKejz2D4Qyjmb7wUegBU/ZvBQMuSlq5qHAmreNHXsx2LSPLYACKFfJXVl8Mkq8dP
 iEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+5VAehxotQaf0MdoTRxk7ubGUjnGk0bi6i0xDUEnFP4=;
 b=WeXGOKX01xewlQGEBI3+ptATkNK27T59HssdL5AbNP1DmwxhUHEzrslvXJBsMlER3M
 NDee69uCiE5PCW8J5rboQkBxlqaLdaQaGVJk+5L5sElgnQ7vE/x2p7XGO1tWsE8eBWOc
 IpYzaUHOSU+iiEvAHxmsHKzGpYc0WSg/Dc8VLJMcoeEd3Z9CTPeGuqIVZQv2W80ffSyp
 ZSyw36+tEJhu7cyXAjzVOKMXBsSkmOqjULZw9I/0W5u9n4u69lMQUXwWpYmhgpi5C0Xo
 9AWh1lgRrnhPNCTMLSwdXz4A5gk+ZvFbMnuv6UNzFVNHBsHcni462wxg/pcuOKgz6i4e
 eLEQ==
X-Gm-Message-State: AOAM532POqICx8kf+/zhu/eoLojY5P9XlwvMg/He/yNRIddtpSnycqYF
 /rN5k1YR21Q0j5UWtTW7Is0=
X-Google-Smtp-Source: ABdhPJxUmG03i2gZWfUXZMPSl1l8h/jKrCOC8uD3eYBHapIX+GOhkm01EKvVSzD5ttZenZS2KE7hpA==
X-Received: by 2002:a17:90b:17cd:: with SMTP id
 me13mr11712751pjb.128.1621003374939; 
 Fri, 14 May 2021 07:42:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:3d36:ea03:6cce:19ef])
 by smtp.googlemail.com with ESMTPSA id k186sm4354592pgk.82.2021.05.14.07.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 07:42:54 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Subject: [RFC v4] scripts: kernel-doc: reduce repeated regex expressions into
 variables
Date: Fri, 14 May 2021 20:12:44 +0530
Message-Id: <20210514144244.25341-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <87bl9ujy2r.fsf@meer.lwn.net>
References: <87bl9ujy2r.fsf@meer.lwn.net>
Cc: linux-doc@vger.kernel.org, yashsri421@gmail.com,
 linux-kernel@vger.kernel.org, willy@infradead.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

There are some regex expressions in the kernel-doc script, which are used
repeatedly in the script.

Reduce such expressions into variables, which can be used everywhere.

A quick manual check found that no errors and warnings were added/removed
in this process.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v4:
- Fix htmldocs warning at function parsing, involving repeated $type2 identifiers capture
- Re-tested against all files in kernel tree

Changes in v3:
- Remove variables for separate qualifiers in "sub dump_struct"
- Make a common variable for all the qualifiers
- Make $attribute global variable to use it at "sub check_sections" as well

Changes in v2:
- Rename $pointer_function to $function_pointer
- Combine elsif-block expressions at "sub dump_function" into lesser regex expressions
- Combine $prototype_end1,$prototype_end2 expressions into a common $prototype_end

 scripts/kernel-doc | 71 ++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 37 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 4840e748fca8..7c4a6a507ac4 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -406,6 +406,8 @@ my $doc_inline_sect = '\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)';
 my $doc_inline_end = '^\s*\*/\s*$';
 my $doc_inline_oneline = '^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\s*$';
 my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
+my $function_pointer = qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};
+my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;
 
 my %parameterdescs;
 my %parameterdesc_start_lines;
@@ -694,7 +696,7 @@ sub output_function_man(%) {
 	    $post = ");";
 	}
 	$type = $args{'parametertypes'}{$parameter};
-	if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
+	if ($type =~ m/$function_pointer/) {
 	    # pointer-to-function
 	    print ".BI \"" . $parenth . $1 . "\" " . " \") (" . $2 . ")" . $post . "\"\n";
 	} else {
@@ -974,7 +976,7 @@ sub output_function_rst(%) {
 	$count++;
 	$type = $args{'parametertypes'}{$parameter};
 
-	if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
+	if ($type =~ m/$function_pointer/) {
 	    # pointer-to-function
 	    print $1 . $parameter . ") (" . $2 . ")";
 	} else {
@@ -1211,7 +1213,9 @@ sub dump_struct($$) {
     my $members;
     my $type = qr{struct|union};
     # For capturing struct/union definition body, i.e. "{members*}qualifiers*"
-    my $definition_body = qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
+    my $qualifiers = qr{$attribute|__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned};
+    my $definition_body = qr{\{(.*)\}\s*$qualifiers*};
+    my $struct_members = qr{($type)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;};
 
     if ($x =~ /($type)\s+(\w+)\s*$definition_body/) {
 	$decl_type = $1;
@@ -1235,27 +1239,27 @@ sub dump_struct($$) {
 	# strip comments:
 	$members =~ s/\/\*.*?\*\///gos;
 	# strip attributes
-	$members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)/ /gi;
+	$members =~ s/\s*$attribute/ /gi;
 	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
 	$members =~ s/\s*__packed\s*/ /gos;
 	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
 	$members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
 	$members =~ s/\s*____cacheline_aligned/ /gos;
 
+	my $args = qr{([^,)]+)};
 	# replace DECLARE_BITMAP
 	$members =~ s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1, __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;
-	$members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
+	$members =~ s/DECLARE_BITMAP\s*\($args,\s*$args\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
 	# replace DECLARE_HASHTABLE
-	$members =~ s/DECLARE_HASHTABLE\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[1 << (($2) - 1)\]/gos;
+	$members =~ s/DECLARE_HASHTABLE\s*\($args,\s*$args\)/unsigned long $1\[1 << (($2) - 1)\]/gos;
 	# replace DECLARE_KFIFO
-	$members =~ s/DECLARE_KFIFO\s*\(([^,)]+),\s*([^,)]+),\s*([^,)]+)\)/$2 \*$1/gos;
+	$members =~ s/DECLARE_KFIFO\s*\($args,\s*$args,\s*$args\)/$2 \*$1/gos;
 	# replace DECLARE_KFIFO_PTR
-	$members =~ s/DECLARE_KFIFO_PTR\s*\(([^,)]+),\s*([^,)]+)\)/$2 \*$1/gos;
-
+	$members =~ s/DECLARE_KFIFO_PTR\s*\($args,\s*$args\)/$2 \*$1/gos;
 	my $declaration = $members;
 
 	# Split nested struct/union elements as newer ones
-	while ($members =~ m/(struct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/) {
+	while ($members =~ m/$struct_members/) {
 		my $newmember;
 		my $maintype = $1;
 		my $ids = $4;
@@ -1315,7 +1319,7 @@ sub dump_struct($$) {
 				}
 			}
 		}
-		$members =~ s/(struct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/$newmember/;
+		$members =~ s/$struct_members/$newmember/;
 	}
 
 	# Ignore other nested elements, like enums
@@ -1555,8 +1559,9 @@ sub create_parameterlist($$$$) {
     my $param;
 
     # temporarily replace commas inside function pointer definition
-    while ($args =~ /(\([^\),]+),/) {
-	$args =~ s/(\([^\),]+),/$1#/g;
+    my $arg_expr = qr{\([^\),]+};
+    while ($args =~ /$arg_expr,/) {
+	$args =~ s/($arg_expr),/$1#/g;
     }
 
     foreach my $arg (split($splitter, $args)) {
@@ -1707,7 +1712,7 @@ sub check_sections($$$$$) {
 		foreach $px (0 .. $#prms) {
 			$prm_clean = $prms[$px];
 			$prm_clean =~ s/\[.*\]//;
-			$prm_clean =~ s/__attribute__\s*\(\([a-z,_\*\s\(\)]*\)\)//i;
+			$prm_clean =~ s/$attribute//i;
 			# ignore array size in a parameter string;
 			# however, the original param string may contain
 			# spaces, e.g.:  addr[6 + 2]
@@ -1809,8 +1814,14 @@ sub dump_function($$) {
     # - parport_register_device (function pointer parameters)
     # - atomic_set (macro)
     # - pci_match_device, __copy_to_user (long return type)
-
-    if ($define && $prototype =~ m/^()([a-zA-Z0-9_~:]+)\s+/) {
+    my $name = qr{[a-zA-Z0-9_~:]+};
+    my $prototype_end1 = qr{[^\(]*};
+    my $prototype_end2 = qr{[^\{]*};
+    my $prototype_end = qr{\(($prototype_end1|$prototype_end2)\)};
+    my $type1 = qr{[\w\s]+};
+    my $type2 = qr{$type1\*+};
+
+    if ($define && $prototype =~ m/^()($name)\s+/) {
         # This is an object-like macro, it has no return type and no parameter
         # list.
         # Function-like macros are not allowed to have spaces between
@@ -1818,23 +1829,9 @@ sub dump_function($$) {
         $return_type = $1;
         $declaration_name = $2;
         $noret = 1;
-    } elsif ($prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
-	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
-	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
-	$prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
-	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
-	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
-	$prototype =~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/)  {
+    } elsif ($prototype =~ m/^()($name)\s*$prototype_end/ ||
+	$prototype =~ m/^($type1)\s+($name)\s*$prototype_end/ ||
+	$prototype =~ m/^($type2+)\s*($name)\s*$prototype_end/)  {
 	$return_type = $1;
 	$declaration_name = $2;
 	my $args = $3;
@@ -2111,12 +2108,12 @@ sub process_name($$) {
     } elsif (/$doc_decl/o) {
 	$identifier = $1;
 	my $is_kernel_comment = 0;
-	my $decl_start = qr{\s*\*};
+	my $decl_start = qr{$doc_com};
 	# test for pointer declaration type, foo * bar() - desc
 	my $fn_type = qr{\w+\s*\*\s*}; 
 	my $parenthesis = qr{\(\w*\)};
 	my $decl_end = qr{[-:].*};
-	if (/^$decl_start\s*([\w\s]+?)$parenthesis?\s*$decl_end?$/) {
+	if (/^$decl_start([\w\s]+?)$parenthesis?\s*$decl_end?$/) {
 	    $identifier = $1;
 	}
 	if ($identifier =~ m/^(struct|union|enum|typedef)\b\s*(\S*)/) {
@@ -2126,8 +2123,8 @@ sub process_name($$) {
 	}
 	# Look for foo() or static void foo() - description; or misspelt
 	# identifier
-	elsif (/^$decl_start\s*$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
-	    /^$decl_start\s*$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
+	elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
+	    /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
 	    $identifier = $1;
 	    $decl_type = 'function';
 	    $identifier =~ s/^define\s+//;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
