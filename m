Return-Path: <SRS0=Zzie=JT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37D6C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Apr 2021 19:18:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B09B61428
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Apr 2021 19:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B09B61428
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5D1606C0;
	Thu, 22 Apr 2021 19:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EXmy63t8SJxS; Thu, 22 Apr 2021 19:18:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id C67B16061C;
	Thu, 22 Apr 2021 19:18:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABD42C000E;
	Thu, 22 Apr 2021 19:18:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99156C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 19:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FF3483CB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 19:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lCugB_PyPM2L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 19:18:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65A9583CAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 19:18:48 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id s20so8194356plr.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 12:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5Za5n3a0YABSf07Khq0oVNO/kC0EVX6Kl40bV12WKk8=;
 b=d4XVUb+9XJDQHLYmpREVNXpjl4iZax1b5RAXppZ7XAO2V7pW4gbddcOvFdixE0ergO
 Olh5glGIwWBGUS9Ud3cDuXRZ6O6FZPIVViVpPjV5WABSqe7xCrCuRMz1sKjQX4BUdm4U
 ghNb265AlK6a229T2GMlSlm75a0pKttYM2ib32PVaYgZRdqB6aRt1qwGjg5A5CRKel4C
 aWr8p7F7P+HkJgt0QfihtxXketiu4gsWRIKSFfNENTNch7jTlgvYC/1EvOSI3GOM0+Y4
 Lr/fr6UCW5TZwZrmk/VABEgqQOC0ZYVaGtqXHQhVJVzWRt+itIOks6+eW4v9Zq1ZD2td
 Seng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5Za5n3a0YABSf07Khq0oVNO/kC0EVX6Kl40bV12WKk8=;
 b=R16bDUBs/fyo6em/fl6HXCRW/ZOl6sSGixJiGZ4jYNJyQkfkzkRzRvTkJFtAQcQpEY
 68T0NDfDhenZZPJObVuyBZCUx7YieQSFE7xr+TKSoLA1tpEgHvISJpaJBqP4TEE3uMBX
 J8hL2Km+ZdcuQG7yu0hzKTV7Y4OE2nQx6bo8NcupPHmNBT1HwWRtRzc9UiKq3BD1hzCO
 5TeliR/SM/7CFz6sLVs9IqKB720VGrjUtOzHOXdUaADVDNUH8DKl2DMqBEfFxBVnKvha
 vOp+fbX6oV8Y9XVA7CAV3pREm/G1KEDdEMt29QX6K6ixJQxi2W0+so9KG7agUypMuzow
 TlIA==
X-Gm-Message-State: AOAM530gQDtd2lEx9vk2FSvhaV2eMzlP1ZvXTkbNPwo+Cd1hGiGV4wTB
 LcgzNhjOEqH8xAHXad/5iWs=
X-Google-Smtp-Source: ABdhPJx+GNvMPhj15qxg395ej+yjJHsEM25MarkleNyHuF3vfTq3EGOCl6/QUyLO1AiWHixRkucHxA==
X-Received: by 2002:a17:90b:1948:: with SMTP id
 nk8mr298832pjb.154.1619119127714; 
 Thu, 22 Apr 2021 12:18:47 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:7d79:366e:c8a9:ca38])
 by smtp.googlemail.com with ESMTPSA id t19sm8228505pjs.1.2021.04.22.12.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:18:47 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Subject: [RFC] scripts: kernel-doc: reduce repeated regex expressions into
 variables
Date: Fri, 23 Apr 2021 00:48:39 +0530
Message-Id: <20210422191839.6119-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
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
 scripts/kernel-doc | 89 ++++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 2a85d34fdcd0..579c9fdd275f 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -406,6 +406,7 @@ my $doc_inline_sect = '\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)';
 my $doc_inline_end = '^\s*\*/\s*$';
 my $doc_inline_oneline = '^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\s*$';
 my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
+my $pointer_function = qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};
 
 my %parameterdescs;
 my %parameterdesc_start_lines;
@@ -694,7 +695,7 @@ sub output_function_man(%) {
 	    $post = ");";
 	}
 	$type = $args{'parametertypes'}{$parameter};
-	if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
+	if ($type =~ m/$pointer_function/) {
 	    # pointer-to-function
 	    print ".BI \"" . $parenth . $1 . "\" " . " \") (" . $2 . ")" . $post . "\"\n";
 	} else {
@@ -974,7 +975,7 @@ sub output_function_rst(%) {
 	$count++;
 	$type = $args{'parametertypes'}{$parameter};
 
-	if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
+	if ($type =~ m/$pointer_function/) {
 	    # pointer-to-function
 	    print $1 . $parameter . ") (" . $2 . ")";
 	} else {
@@ -1210,8 +1211,14 @@ sub dump_struct($$) {
     my $decl_type;
     my $members;
     my $type = qr{struct|union};
+    my $packed = qr{__packed};
+    my $aligned = qr{__aligned};
+    my $cacheline_aligned_in_smp = qr{____cacheline_aligned_in_smp};
+    my $cacheline_aligned = qr{____cacheline_aligned};
+    my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;
     # For capturing struct/union definition body, i.e. "{members*}qualifiers*"
-    my $definition_body = qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
+    my $definition_body = qr{\{(.*)\}(?:\s*(?:$packed|$aligned|$cacheline_aligned_in_smp|$cacheline_aligned|$attribute))*};
+    my $struct_members = qr{($type)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;};
 
     if ($x =~ /($type)\s+(\w+)\s*$definition_body/) {
 	$decl_type = $1;
@@ -1235,27 +1242,27 @@ sub dump_struct($$) {
 	# strip comments:
 	$members =~ s/\/\*.*?\*\///gos;
 	# strip attributes
-	$members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)/ /gi;
-	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
-	$members =~ s/\s*__packed\s*/ /gos;
+	$members =~ s/\s*$attribute/ /gi;
+	$members =~ s/\s*$aligned\s*\([^;]*\)/ /gos;
+	$members =~ s/\s*$packed\s*/ /gos;
 	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
-	$members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
-	$members =~ s/\s*____cacheline_aligned/ /gos;
+	$members =~ s/\s*$cacheline_aligned_in_smp/ /gos;
+	$members =~ s/\s*$cacheline_aligned/ /gos;
 
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
@@ -1315,7 +1322,7 @@ sub dump_struct($$) {
 				}
 			}
 		}
-		$members =~ s/(struct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/$newmember/;
+		$members =~ s/$struct_members/$newmember/;
 	}
 
 	# Ignore other nested elements, like enums
@@ -1555,8 +1562,9 @@ sub create_parameterlist($$$$) {
     my $param;
 
     # temporarily replace commas inside function pointer definition
-    while ($args =~ /(\([^\),]+),/) {
-	$args =~ s/(\([^\),]+),/$1#/g;
+    my $arg_expr = qr{\([^\),]+};
+    while ($args =~ /$arg_expr,/) {
+	$args =~ s/($arg_expr),/$1#/g;
     }
 
     foreach my $arg (split($splitter, $args)) {
@@ -1808,8 +1816,11 @@ sub dump_function($$) {
     # - parport_register_device (function pointer parameters)
     # - atomic_set (macro)
     # - pci_match_device, __copy_to_user (long return type)
+    my $name = qr{[a-zA-Z0-9_~:]+};
+    my $prototype_end1 = qr{\(([^\(]*)\)};
+    my $prototype_end2 = qr{\(([^\{]*)\)};
 
-    if ($define && $prototype =~ m/^()([a-zA-Z0-9_~:]+)\s+/) {
+    if ($define && $prototype =~ m/^()($name)\s+/) {
         # This is an object-like macro, it has no return type and no parameter
         # list.
         # Function-like macros are not allowed to have spaces between
@@ -1817,23 +1828,23 @@ sub dump_function($$) {
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
+    } elsif ($prototype =~ m/^()($name)\s*$prototype_end1/ ||
+	$prototype =~ m/^(\w+)\s+($name)\s*$prototype_end1/ ||
+	$prototype =~ m/^(\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
+	$prototype =~ m/^(\w+\s+\w+)\s+($name)\s*$prototype_end1/ ||
+	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
+	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end1/ ||
+	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
+	$prototype =~ m/^()($name)\s*$prototype_end2/ ||
+	$prototype =~ m/^(\w+)\s+($name)\s*$prototype_end2/ ||
+	$prototype =~ m/^(\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
+	$prototype =~ m/^(\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
+	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
+	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
+	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
+	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
+	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
+	$prototype =~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*($name)\s*$prototype_end2/)  {
 	$return_type = $1;
 	$declaration_name = $2;
 	my $args = $3;
@@ -2110,12 +2121,12 @@ sub process_name($$) {
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
@@ -2125,8 +2136,8 @@ sub process_name($$) {
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
