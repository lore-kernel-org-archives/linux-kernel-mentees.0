Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479D6C7EE2D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 May 2023 20:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5B29428AC;
	Sat, 13 May 2023 20:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5B29428AC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jfdhvxTI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFrdPURlkQwm; Sat, 13 May 2023 20:21:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A67B342888;
	Sat, 13 May 2023 20:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A67B342888
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91AE4C007A;
	Sat, 13 May 2023 20:21:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24067C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 May 2023 20:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E605E84239
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 May 2023 20:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E605E84239
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=jfdhvxTI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMFY0DtM2pkE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 May 2023 20:21:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1452583F1A
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1452583F1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 May 2023 20:21:20 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5068638856dso2583038a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 May 2023 13:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684009279; x=1686601279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phVfYEyjqUA1/8JzWnwWyJem9HZ6085CTPXJTMUib4g=;
 b=jfdhvxTIOPKnh+n2ESRxn+iltKq4nh61eRKsxsBV3oW1Ii/X7aBXAv5Nou7cNo3LDK
 RkQWrcskIMLc2WGI/FXV6llw+fSYLG8RM7SNaurWDObJLBtDDXxaJHfKN/k14P+q0wpT
 r/R1zhu7SRLCOUKIRIxnvf4WSrTNIEwiGlwlpJnN3XTtUBv87y2s3BfYYYOxyjIO9tCs
 MJDYr1yzY6cMjC8UXgHF6eC/UOXpuaiXRsfiKCRbj1/Z3s5TV+vNeMW/u1nrNA9I8zOp
 UrHGgaaaTZOkwa9wtKPliidEM/bI0RQnKBFKIYuLx+/HlLFhzNmVsMa8PGoYxEldKW9c
 GTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684009279; x=1686601279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phVfYEyjqUA1/8JzWnwWyJem9HZ6085CTPXJTMUib4g=;
 b=kEtyCZaJ+ntlsXnuaVpQ4GVkmiZ0mXRWwjb+dP2LIkhVHs3poaBpOHjV8lbFHiIOr1
 bom+gPxtOW634DScUu7mKyYcMa/7owwBsLPepxU+CGbD2WJogXXn49YUrNH1O0FmNjk0
 8//r3EF4UxOLW5yTQf72d1aJrcnAU93UPZRC4PLra6xP6RdmksAvprQ5tJo++U56ICM2
 6Iz9paaU3CQUEXPo0zGY+pUhMVYRVSKoe+JVrM60x2rzGPs3Jo85zXG8mFLWg2OZAwTd
 iXMPOlo8zd4wxwjAqN5QLRcnGRwiEMJvdIjtjNufp159ZdWCG3JvW0MJP1qt0qKpzfRk
 BCjQ==
X-Gm-Message-State: AC+VfDx5XItFaXlFIrOTFeP1qUnKZs5ThIC9pqb5ghaxHMgbtK52YIFh
 tGl+qvo5L1u5gILG6uMt2AJoeE4fQdGAMw==
X-Google-Smtp-Source: ACHHUZ6D50diLOr1mJEybUqQgqdZ/OhjmdX7JuUmJJIFtY8WY3xSxqG/VvvFG+eERIrAaYaD9xdCPg==
X-Received: by 2002:a05:6402:3482:b0:508:40a5:beb4 with SMTP id
 v2-20020a056402348200b0050840a5beb4mr28652324edc.3.1684009279137; 
 Sat, 13 May 2023 13:21:19 -0700 (PDT)
Received: from ivan-B550MH.. ([37.252.94.55]) by smtp.gmail.com with ESMTPSA id
 d14-20020a50fb0e000000b0050bc6d0e880sm5109637edq.61.2023.05.13.13.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 13:21:18 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: corbet@lwn.net, akpm@linux-foundation.org, perex@perex.cz, tiwai@suse.com,
 broonie@kernel.org, skhan@linuxfoundation.org
Subject: [PATCH 3/3] selftests: ALSA: Add test for the 'valsa' driver
Date: Sun, 14 May 2023 00:20:37 +0400
Message-Id: <20230513202037.158777-3-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Ivan Orlov <ivan.orlov0322@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
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

This test covers the new Virtual ALSA driver, including the capturing,
playback and ioctl redefinition functionalities. This test is also helpful
as an usage example of the 'valsa' driver.

We have a lot of different virtual media drivers, which can be used for
testing of the userspace applications and media subsystem middle layer.
However, all of them are aimed at testing the video functionality and
simulating the video devices. For audio devices we have only snd-dummy
module, which is good in simulating the correct behavior of an ALSA device.
I decided to write a tool, which would help to test the userspace ALSA
programs (and the PCM middle layer as well) under unusual circumstances
to figure out how they would behave. So I came up with this Virtual ALSA
Driver.

This new Virtual ALSA Driver has several features which can be useful
during the userspace ALSA applications testing/fuzzing, or testing/fuzzing
of the PCM middle layer. Not all of them can be implemented using the
existing virtual drivers (like dummy or loopback). Here is what can this
driver do:

- Simulate both capture and playback processes
- Generate random or pattern-based capture data
- Check the playback stream for containing the looped pattern
- Inject delays into the playback and capturing processes
- Inject errors during the PCM callbacks

Also, this driver can check the playback stream for containing the
predefined pattern, which is used in the corresponding selftest to check
the PCM middle layer data transferring functionality. Additionally, this
driver redefines the default RESET ioctl, and the selftest covers this PCM
API functionality as well.

After all, I think this driver would be a good start, and I believe in the
future we will see more virtual sound drivers.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 tools/testing/selftests/alsa/valsa-test.sh | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100755 tools/testing/selftests/alsa/valsa-test.sh

diff --git a/tools/testing/selftests/alsa/valsa-test.sh b/tools/testing/selftests/alsa/valsa-test.sh
new file mode 100755
index 000000000000..872dfac138c2
--- /dev/null
+++ b/tools/testing/selftests/alsa/valsa-test.sh
@@ -0,0 +1,55 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test for the 'valsa' virtual driver. It tests capture and playback functionalities,
+# as well as the 'reset' ioctl redefinition.
+
+uid=$(id -u)
+if [ $uid -ne 0 ]; then
+	echo "$0: Must be run as root"
+	exit 1
+fi
+
+if ! which modprobe > /dev/null 2>&1; then
+	echo "$0: You need modprobe installed"
+        exit 4
+fi
+
+if ! modinfo snd-valsa > /dev/null 2>&1; then
+	echo "$0: You must have the following enabled in your kernel:"
+	echo "CONFIG_SND_ALSAV=m"
+	exit 4
+fi
+
+modprobe snd-valsa
+
+if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
+	mount -t debugfs none /sys/kernel/debug
+
+	if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
+		echo "$0: Error mounting debugfs"
+		exit 4
+	fi
+fi
+
+success="1"
+arecord -D hw:CARD=valsa,DEV=0 -c 1 --buffer-size=8192 -f S16_LE -r 8000 --duration=4 out.wav
+
+if [[ $(< /sys/kernel/debug/valsa/ioctl_test) == "$success" ]]; then
+	echo "$0: ioctl test: success"
+else
+	echo "$0: ioctl test: fail"
+fi
+
+aplay -D hw:CARD=valsa,DEV=0 -c 1 --buffer-size=8192 -f S16_LE -r 8000 out.wav
+
+if [[ $(< /sys/kernel/debug/valsa/pc_test) == "$success" ]]; then
+	echo "$0: playback test: success"
+else
+	echo "$0: playback test: fail"
+fi
+
+rm -rf out.wav
+if ! rmmod snd-valsa > /dev/null 2>&1; then
+	echo "$0: Can't remove 'valsa' module: disable PulseAudio and unload it manually"
+fi
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
