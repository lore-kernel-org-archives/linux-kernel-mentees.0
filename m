Return-Path: <SRS0=5TG3=7J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A4EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 May 2020 00:34:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D531D207CB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 May 2020 00:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="Fsp134TQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D531D207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 90E4886840;
	Wed, 27 May 2020 00:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmDhXXlA8eix; Wed, 27 May 2020 00:34:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 62BB3867CC;
	Wed, 27 May 2020 00:34:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4922CC0888;
	Wed, 27 May 2020 00:34:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7394C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 May 2020 00:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DF3A4204E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 May 2020 00:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Olxy2nBf3BY9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 May 2020 00:34:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by silver.osuosl.org (Postfix) with ESMTPS id A406720005
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 May 2020 00:34:25 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id m44so17860996qtm.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 17:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mq62GKb+a6uI+kRh3uk1w4mJxevGSsQXqoT6TNUJtKU=;
 b=Fsp134TQ7ts6VmjtGPWLw/8pcYBl5mf3YGy3/ugLjZWeWLH9WV5b+ca9T9kOjAMf7a
 sw5TPCeQE7mLzQU5m+epgt79iYBYCkzA6CDn2lD2ZKpD/CNQUiRC4/IK2cLOulw4IclN
 ZB+GpDT/Qs9+fANsZGrmxiyChMn7WelXygAYfgtnEk6yVF14bOgtvMSUrWm9Z20zX9H0
 MQb9zfjtYEUTRJV61OCuW1gZUCwGOWPv8B5whJDWlljeGzUbZ6UFjABYB9vk2izKWBly
 QvmiWi+g3H2NEHGFKSxX8G6y656HaQCbz3VnQ3NyKPs4AxTf/+JCQ7CMH5kxGen1i6Zw
 UhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mq62GKb+a6uI+kRh3uk1w4mJxevGSsQXqoT6TNUJtKU=;
 b=c/1m75YS+1OZa47Nb1TqLj0freEC9aviRn5zzJw1vXntJZrEuNrPGtxguNyAbDDxBv
 Zz5lJN/IkdbpuIhvUgkf0SVOOxSL32+E/WHSSOMe6Vcbm3FRSaDwcCUEgymN+/vnmHyX
 tqONjKEYrnNdrm+RGy/pv94xIl7fA2JkRbqMKyT3TbYDX7IYHrlruiQC5VxmQs7QPut5
 PIQM7ts59+9vIbnyRFigMfWVZob1vrFspbXPNrwCOmd/CmbcH5vAbj7F8MHrvZDuyufc
 irniGCZFOzwWiOTtHOt8SSpyeVmLB+HuujC8NC+wy7Ee7KZi3J+SAcW/g4ZKPQQiT4f6
 k4yA==
X-Gm-Message-State: AOAM531P2LHo/ovhOCl6aa5Ui9lhnGKN7sQ1M+Jwtq7lrjC0ZCzfUzTH
 VJScSdYoSTMIrlYfvQk6n6RhMw==
X-Google-Smtp-Source: ABdhPJwJlQUfbYhgP9H9HncZXgvR0jCIXllQbBglRLefb6mmcd3qtbB+BjdM5ZoIFi76MyRNuAH6oQ==
X-Received: by 2002:ac8:5045:: with SMTP id h5mr1641523qtm.259.1590539664497; 
 Tue, 26 May 2020 17:34:24 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id y185sm647153qkd.83.2020.05.26.17.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 17:34:23 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org
Date: Tue, 26 May 2020 21:34:20 -0300
Message-Id: <20200527003420.34790-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [fixup v2] kunit: use --build_dir=.kunit as
	default
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

To make KUnit easier to use, and to avoid overwriting object and
.config files, the default KUnit build directory is set to .kunit

Fixed up minor merge conflicts - Shuah Khan <skhan@linuxfoundation.org>

Fixed this identation error exchanging spaces for tabs between lines
248 and 252:

tools/testing/kunit/kunit.py run --defconfig

  File "tools/testing/kunit/kunit.py", line 254
    if not linux:
                ^
TabError: inconsistent use of tabs and spaces in indentation

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=205221
---
version after merge on kunit brach:
v1:
 * fix identation (tabs instead of spaces)

v2:
 * fix v1 changelog description: fix identation
   (spaces instead of tabs, lines 248-252);
 * add python error message on commit message;
 * fix Link tag on commit message.
---
 tools/testing/kunit/kunit.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index b01838b6f5f9..b3490271a103 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -169,7 +169,7 @@ def add_common_opts(parser):
 	parser.add_argument('--build_dir',
 			    help='As in the make command, it specifies the build '
 			    'directory.',
-			    type=str, default='', metavar='build_dir')
+                            type=str, default='.kunit', metavar='build_dir')
 	parser.add_argument('--make_options',
 			    help='X=Y make option, can be repeated.',
 			    action='append')
@@ -245,12 +245,11 @@ def main(argv, linux=None):
 	cli_args = parser.parse_args(argv)
 
 	if cli_args.subcommand == 'run':
-		if cli_args.build_dir:
-			if not os.path.exists(cli_args.build_dir):
-				os.mkdir(cli_args.build_dir)
-			kunit_kernel.kunitconfig_path = os.path.join(
-				cli_args.build_dir,
-				kunit_kernel.kunitconfig_path)
+		if not os.path.exists(cli_args.build_dir):
+			os.mkdir(cli_args.build_dir)
+		kunit_kernel.kunitconfig_path = os.path.join(
+			cli_args.build_dir,
+			kunit_kernel.kunitconfig_path)
 
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
