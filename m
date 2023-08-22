Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFCBEE49AE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Aug 2023 21:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B77BB60B73;
	Tue, 22 Aug 2023 21:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B77BB60B73
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UqUEI3OM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVUcc6qtjikj; Tue, 22 Aug 2023 21:11:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 91D72607B0;
	Tue, 22 Aug 2023 21:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91D72607B0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D250C0039;
	Tue, 22 Aug 2023 21:11:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7070BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 21:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4ACC540500
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 21:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ACC540500
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=UqUEI3OM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06xvdbD8AthJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 21:11:43 +0000 (UTC)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FD05401F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 21:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FD05401F1
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6bd045336c6so3754036a34.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692738702; x=1693343502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5hmmfZRodgVUziWT2rRNyCsKFK03wrrtMH6RFV4QrmY=;
 b=UqUEI3OMZNGYZ1aL5oP7vcxf4qLZbnMEJSt1/rwVfbiCMKA2VKLEQaQR8VG91drnu8
 DO+0hY1KP4rcGzpP6HB/bmuKQmmwwkojJnc77G6NQGVbM5Pn967VFo6zX/D4hMZ8H001
 iCoV6JW4N+bfxNC6heqlpuCR4ir7bWmnf4fSHtFpXKB3OibDihvhvB/MVqOE0kfdBmCu
 aL3UTZ1ySL/xA//ThQBNanra/65VqllNQFfJE8qs7mR7hgJQK9odY8jikNYzK2oDL78K
 JS/ZuSVesD3Bp85htcK4H/yHuJ9X/6fAE/vZh39cuEgOpQvZdtqdhx//9NA/ZJhd+cVB
 He9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692738702; x=1693343502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5hmmfZRodgVUziWT2rRNyCsKFK03wrrtMH6RFV4QrmY=;
 b=J0Qy+7pQ6nZ81lil5PvxG4eXaVNw0XDAej+fwmL6dFUvJMycsx5fv8OUE+TWyc8NdE
 d+ki5M9nyB+MG3estDk70f6+nssvP4u0V8xHCeeTJfDVkAIx1RGEv0NvOkRuulHrI0/5
 HRNjGdvuqX9mtW//+SM3hK/lkqzOrrqTmTR7VPlj5nWbz1V4l225M6D6wYPN07hoY8N0
 9eXjnPNLnGQN3te5eBOjm4gMY/zKWKXPTZ83peE/ZhSIG9r3ZjmNLsKg/ZEWR2hoLwRw
 JdjpQgnUsKaSNSDiEf0QRQrZ5qLebtQDUxr9ic+NepQX/5ho6Povg0Edku4pShP7v5Va
 Dd8Q==
X-Gm-Message-State: AOJu0YzfqeyjOAtlfLvzEieeeAuAX+UpliG0ENDnz99bHElSQPNi8uka
 QJub5Fo7Oe1O3u2T7ZC8pWU=
X-Google-Smtp-Source: AGHT+IFF89IwZJQid3LfAPyFwS4w8gxatZJVKm3YeRg+V0F22TVIIacK8pU8cG3Ix9jYDnnQLBgpVA==
X-Received: by 2002:a05:6830:609:b0:6b9:2b25:459c with SMTP id
 w9-20020a056830060900b006b92b25459cmr12099312oti.28.1692738702243; 
 Tue, 22 Aug 2023 14:11:42 -0700 (PDT)
Received: from debian.lan ([168.227.196.240]) by smtp.gmail.com with ESMTPSA id
 q5-20020a9d4b05000000b006b871010cb1sm5084233otf.46.2023.08.22.14.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 14:11:41 -0700 (PDT)
From: "Ricardo B. Marliere" <rbmarliere@gmail.com>
To: shuah@kernel.org
Subject: [PATCH] selftests: fix dependency checker script
Date: Tue, 22 Aug 2023 18:09:40 -0300
Message-Id: <20230822210939.69767-1-rbmarliere@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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

This patch fixes inconsistencies in the parsing rules of the levels 1
and 2 of the kselftest_deps.sh.  It was added the levels 4 and 5 to
account for a few edge cases that are present in some tests, also some
minor identation styling have been fixed (s/    /\t/g).

Signed-off-by: Ricardo B. Marliere <rbmarliere@gmail.com>
---
 tools/testing/selftests/kselftest_deps.sh | 77 +++++++++++++++++++----
 1 file changed, 65 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kselftest_deps.sh b/tools/testing/selftests/kselftest_deps.sh
index 4bc14d9e8ff1..de59cc8f03c3 100755
--- a/tools/testing/selftests/kselftest_deps.sh
+++ b/tools/testing/selftests/kselftest_deps.sh
@@ -46,11 +46,11 @@ fi
 print_targets=0
 
 while getopts "p" arg; do
-    case $arg in
-        p)
+	case $arg in
+		p)
 		print_targets=1
 	shift;;
-    esac
+	esac
 done
 
 if [ $# -eq 0 ]
@@ -92,6 +92,10 @@ pass_cnt=0
 # Get all TARGETS from selftests Makefile
 targets=$(grep -E "^TARGETS +|^TARGETS =" Makefile | cut -d "=" -f2)
 
+# Initially, in LDLIBS related lines, the dep checker needs
+# to ignore lines containing the following strings:
+filter="\$(VAR_LDLIBS)\|pkg-config\|PKG_CONFIG\|IOURING_EXTRA_LIBS"
+
 # Single test case
 if [ $# -eq 2 ]
 then
@@ -100,6 +104,8 @@ then
 	l1_test $test
 	l2_test $test
 	l3_test $test
+	l4_test $test
+	l5_test $test
 
 	print_results $1 $2
 	exit $?
@@ -113,7 +119,7 @@ fi
 # Append space at the end of the list to append more tests.
 
 l1_tests=$(grep -r --include=Makefile "^LDLIBS" | \
-		grep -v "VAR_LDLIBS" | awk -F: '{print $1}')
+		grep -v "$filter" | awk -F: '{print $1}' | uniq)
 
 # Level 2: LDLIBS set dynamically.
 #
@@ -126,7 +132,7 @@ l1_tests=$(grep -r --include=Makefile "^LDLIBS" | \
 # Append space at the end of the list to append more tests.
 
 l2_tests=$(grep -r --include=Makefile ": LDLIBS" | \
-		grep -v "VAR_LDLIBS" | awk -F: '{print $1}')
+		grep -v "$filter" | awk -F: '{print $1}' | uniq)
 
 # Level 3
 # memfd and others use pkg-config to find mount and fuse libs
@@ -138,11 +144,32 @@ l2_tests=$(grep -r --include=Makefile ": LDLIBS" | \
 #	VAR_LDLIBS := $(shell pkg-config fuse --libs 2>/dev/null)
 
 l3_tests=$(grep -r --include=Makefile "^VAR_LDLIBS" | \
-		grep -v "pkg-config" | awk -F: '{print $1}')
+		grep -v "pkg-config\|PKG_CONFIG" | awk -F: '{print $1}' | uniq)
 
-#echo $l1_tests
-#echo $l2_1_tests
-#echo $l3_tests
+# Level 4
+# some tests may fall back to default using `|| echo -l<libname>`
+# if pkg-config doesn't find the libs, instead of using VAR_LDLIBS
+# as per level 3 checks.
+# e.g:
+# netfilter/Makefile
+#	LDLIBS += $(shell $(HOSTPKG_CONFIG) --libs libmnl 2>/dev/null || echo -lmnl)
+l4_tests=$(grep -r --include=Makefile "^LDLIBS" | \
+		grep "pkg-config\|PKG_CONFIG" | awk -F: '{print $1}' | uniq)
+
+# Level 5
+# some tests may use IOURING_EXTRA_LIBS to add extra libs to LDLIBS,
+# which in turn may be defined in a sub-Makefile
+# e.g.:
+# mm/Makefile
+#	$(OUTPUT)/gup_longterm: LDLIBS += $(IOURING_EXTRA_LIBS)
+l5_tests=$(grep -r --include=Makefile "LDLIBS +=.*\$(IOURING_EXTRA_LIBS)" | \
+	awk -F: '{print $1}' | uniq)
+
+#echo l1_tests $l1_tests
+#echo l2_tests $l2_tests
+#echo l3_tests $l3_tests
+#echo l4_tests $l4_tests
+#echo l5_tests $l5_tests
 
 all_tests
 print_results $1 $2
@@ -164,24 +191,32 @@ all_tests()
 	for test in $l3_tests; do
 		l3_test $test
 	done
+
+	for test in $l4_tests; do
+		l4_test $test
+	done
+
+	for test in $l5_tests; do
+		l5_test $test
+	done
 }
 
 # Use same parsing used for l1_tests and pick libraries this time.
 l1_test()
 {
 	test_libs=$(grep --include=Makefile "^LDLIBS" $test | \
-			grep -v "VAR_LDLIBS" | \
+			grep -v "$filter" | \
 			sed -e 's/\:/ /' | \
 			sed -e 's/+/ /' | cut -d "=" -f 2)
 
 	check_libs $test $test_libs
 }
 
-# Use same parsing used for l2__tests and pick libraries this time.
+# Use same parsing used for l2_tests and pick libraries this time.
 l2_test()
 {
 	test_libs=$(grep --include=Makefile ": LDLIBS" $test | \
-			grep -v "VAR_LDLIBS" | \
+			grep -v "$filter" | \
 			sed -e 's/\:/ /' | sed -e 's/+/ /' | \
 			cut -d "=" -f 2)
 
@@ -197,6 +232,24 @@ l3_test()
 	check_libs $test $test_libs
 }
 
+l4_test()
+{
+	test_libs=$(grep --include=Makefile "^VAR_LDLIBS\|^LDLIBS" $test | \
+			grep "\(pkg-config\|PKG_CONFIG\).*|| echo " | \
+			sed -e 's/.*|| echo //' | sed -e 's/)$//')
+
+	check_libs $test $test_libs
+}
+
+l5_test()
+{
+	tests=$(find $(dirname "$test") -type f -name "*.mk")
+	test_libs=$(grep "^IOURING_EXTRA_LIBS +\?=" $tests | \
+			cut -d "=" -f 2)
+
+	check_libs $test $test_libs
+}
+
 check_libs()
 {
 
-- 
2.40.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
