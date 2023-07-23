Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229CFC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Jul 2023 06:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E5A1414D8;
	Sun, 23 Jul 2023 06:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E5A1414D8
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Yv9vYGpE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxg9lxqTN7V5; Sun, 23 Jul 2023 06:42:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6D97A40868;
	Sun, 23 Jul 2023 06:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D97A40868
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E2D1C0072;
	Sun, 23 Jul 2023 06:42:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08903C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 06:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0C8960B00
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 06:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0C8960B00
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Yv9vYGpE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtwvopyIP_eX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 06:42:04 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB25A60AE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 06:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB25A60AE9
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6686708c986so3147210b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Jul 2023 23:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690094523; x=1690699323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f2Z4DK/biTW+DU3lNfXFXK1/9r53OdVKpygo77g5mjg=;
 b=Yv9vYGpEg5a3tvQJxB+jXbSpD6IfFyngrnmM3j1hGdo8+UUz8NN4V/bzttR70DoCct
 CjC0MV2b9CwglBgRo75pgYWiQvkUa5QvxaPADxKjlf7BX8241/Kt6pQMSZLXMQX0xvTI
 1iCPSPdgRSkReZGAm6R86afSmA31UtNbOSxMzjKlh4MssZl84Cj9Z9ywjAExeVdmS8jh
 uMGQ083Xo1TQVKOoRP5bouPenPsa4DVlQE77jbN/hurf2NQlJpR81hFZsICHZnbw9dcR
 dPpnnlHTSv0gRgDezDwSiCr4Ng2HkWNeUpxsWmIKd3eZinmAf5qXs/sDYZPC5t+OIpc7
 50Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690094523; x=1690699323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f2Z4DK/biTW+DU3lNfXFXK1/9r53OdVKpygo77g5mjg=;
 b=lFMMbBk1CtudXrVVD6nfnUFTm4Fr0D39yFqmBA3JZnryWSh92MKCaNNdK+H0Qc3krE
 DDRU618izqX5Fr0fxpJD865IwmLdvp2Dvi6/5VfsSzqbl4elsAv4dZpCilan3KNeAgAj
 7GNHOBKb9K8efodkbbIn8klXr/pT1pZmmMcSJWCrfFs96OOK//Vjp8iAGpO4IQ6LbP7v
 uW6XJKPha/VBP2eFdKdVe+dab+jHOLUMonAgChA6TKfZarWYOuh8Akx5lJFdf3PT84MZ
 vaNHNk9KuDKNA0562XJ6MW/ZgBEYtryMaxpYsrIYv/o2GF91Pw3disvFkiwn4jmYQvNA
 XXgw==
X-Gm-Message-State: ABy/qLZ2l8M/B9sKyr2ZLFb1i2qtQ73s9RLZtRKxtwU1cSZtsaIjvzzt
 GLqWmj+BoVeTmfMjzXen9eo=
X-Google-Smtp-Source: APBJJlEWT0Zrha6XrT67EXlC9BYYFmDhOxsUfSPgdpFRFVyxZ7h4ub6qpj/NTMtlIKG394UWmqRHIg==
X-Received: by 2002:aa7:88d5:0:b0:63a:ea82:b7b7 with SMTP id
 k21-20020aa788d5000000b0063aea82b7b7mr6444493pff.28.1690094523150; 
 Sat, 22 Jul 2023 23:42:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58e9:5a21:2ad8:393a:4253])
 by smtp.gmail.com with ESMTPSA id
 ff12-20020a056a002f4c00b005d22639b577sm5416817pfb.165.2023.07.22.23.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jul 2023 23:42:02 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: shuah@kernel.org
Subject: [PATCH v1] selftests: ipc: Updates the msgque test to use kselftest
 framework
Date: Sun, 23 Jul 2023 12:11:54 +0530
Message-Id: <20230723064154.89443-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Atul Kumar Pant <atulpant.linux@gmail.com>, linux-kselftest@vger.kernel.org
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

Updates the msgque test to print the pass or fail status after the
completion of the test.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---
 tools/testing/selftests/ipc/msgque.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftests/ipc/msgque.c
index 656c43c24044..513b1265bb75 100644
--- a/tools/testing/selftests/ipc/msgque.c
+++ b/tools/testing/selftests/ipc/msgque.c
@@ -9,6 +9,7 @@
 
 #include "../kselftest.h"
 
+#define NUM_TEST_CASES		1
 #define MAX_MSG_SIZE		32
 
 struct msg1 {
@@ -197,6 +198,7 @@ int main(int argc, char **argv)
 	int msg, pid, err;
 	struct msgque_data msgque;
 
+	ksft_set_plan(NUM_TEST_CASES);
 	if (getuid() != 0)
 		return ksft_exit_skip(
 				"Please run the test as root - Exiting.\n");
@@ -243,13 +245,16 @@ int main(int argc, char **argv)
 		printf("Failed to test queue: %d\n", err);
 		goto err_out;
 	}
+	ksft_test_result_pass("# Test Passed\n");
 	return ksft_exit_pass();
 
 err_destroy:
 	if (msgctl(msgque.msq_id, IPC_RMID, NULL)) {
 		printf("Failed to destroy queue: %d\n", -errno);
+		ksft_test_result_fail("# Test Failed\n");
 		return ksft_exit_fail();
 	}
 err_out:
+	ksft_test_result_fail("# Test Failed\n");
 	return ksft_exit_fail();
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
