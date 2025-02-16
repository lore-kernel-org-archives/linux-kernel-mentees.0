Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA318DB25
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739707361; cv=none; b=IKJplv6Djt+Uk2YlJJqG5q0mRe0t4o+dUjKtUl7pcO68sZ71hhTYXzqHHZYNPXa8op5qcq8Ffx84gLT1bvtKKna6MvXEF5sLuTKwezsMqUU+iPGvl8t1h9hht3BClv278ri6m/wTmPsjsPE+EYwCP4zMBHGmS/XurJkmKU7e1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739707361; c=relaxed/simple;
	bh=hZ8/iVQ5s08p2V4vsm0sdgPhGPjrrIjdgmny8XSe5Qs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c3Ej6CAGNJbxHKGKonTMEPadPA0uhLAjkEWbNNMdJYDnbkuo+PZ5SJF1cJisYGdH7fJLZt8+EWSD8qBNBITQyQajh7sQAELsV7g9NJ9RYARYv8svmpuHWiD1rLvjlYxynAFIdnVfNHk3zdR1cG1Ak5AcAolX5L0Fr6GUM5V9JPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhJAraws; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhJAraws"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE2A81D11
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 12:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ad0gSTnI5_wr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2025 12:02:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=duttaditya18@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4962881F05
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4962881F05
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QhJAraws
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4962881F05
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 12:02:36 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-220d39a5627so50558755ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 04:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739707355; x=1740312155; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82WigbKU8K6bF5i7jEXR0EoBUFDRYWWxYd/tjoD8mAs=;
        b=QhJArawsA4c/QFdbhjHJBDeLjef+WFOj9W5u0NLNvHhMg/IDqK0L79C/prKwdrqIMD
         4v70YIKGay9uVMBHtfpf6ZA3qfM4/YA6vcBoFOk8YNlz94IyUzFoQmAAszDbzUGMOpoy
         svQkpBRBbA/Q1d8KgZ26Fr14Xe4aS7VzlASx4jqCJ60Lvp/ZM3iviGBD5hXIj9G/MiVH
         xzxlQTO19JzlRH8ePmPTfBZWjUf0Guw0qN2pD9Q1pjgXRpoWIihW9nqynHAKjm3GvK20
         e6lDX+rwpbsIHGuIARyX+hyjZpjWX1khFUibXidBY5xOaSbWhz2CtltPT5z7w486Er/v
         qOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739707355; x=1740312155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82WigbKU8K6bF5i7jEXR0EoBUFDRYWWxYd/tjoD8mAs=;
        b=D/HeJEeAKXys55vFN2fX3CHt5xfc7JwbTu4u/VnS6gzMs4SUaRmbBQ0nztMAKvAFkj
         Dj8m4ZDJE5JrN9cRVMifgp0nlII/6Jj8HSg7jkwMPXSI9zIIumhJX17PlABM9vg15+dW
         gdJQnkf0W74d9kCAOKWW48Br8Vlyvumuc6S+5nkZV5esKFARE10axtO4yaHepDsYx/np
         lFfSPMq58HtwdGGDp0K4dMP2DQuYINr/HxY1YjgxBjvruFOfMGjCcWR57Ox6qDZ779ZI
         9kZ6HGuiosfkw2KH6wMDwmYBNVEl8nHosgEBrSK01ckR4eMMv7bQNPBvw/FU2zj3TqRz
         hOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMofAIJWpvSDrJjv3LZZoO+VAMAZqzpYtlnTovS7FRz7l7Kd2BxrVc+2ujq/1aq/ptX38/HXJslr6duAouxw5jZZ6mnw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyQZZAJW+TR2v78eAELppFtNuAm1zc/wV9StYODcIHyPn8CLNJZ
	C0XgFuJ/lNBbziC/gXlPt+U9XjHEY1BRMBPXVMmufhi8zqW4qL1L
X-Gm-Gg: ASbGncsyVLmM1RAaEjpC9jP1IFuI8tjrF5qS4lLS179p7oRnTv7NUZXqY35DqmeDP9s
	Vt3GXIUOYt8t59Wy1LYLZBMXB6dQDf9/d4YRR16EIjusv70DiAYE4Vanpn0Bj0rlcZUjaUtuNop
	GtQbKnrzENi+cXIKZMpzSplxsstODEslVqgEUNCq2yem22Hjs2+UZF+B26MHdt8KRXr/OIyczzL
	wBaF0aVDAgrQDRC0mPAPoBfUx2t337Zy1jH2r2DiGpyVbq5dlSz8TYhK35XivE/yBhs+1i0wamD
	6aCke2K4kmQDNXSpcag=
X-Google-Smtp-Source: AGHT+IErcCjOiHya8dVFasaPJCiSrh08Dpt+kq1hL0br1lZQvSwuAwOU/Wv3CBTQ2n9JWQBjRD9s0w==
X-Received: by 2002:a05:6a21:6b05:b0:1ed:e7cc:ee89 with SMTP id adf61e73a8af0-1ee8cc0335fmr10408406637.26.1739707355394;
        Sun, 16 Feb 2025 04:02:35 -0800 (PST)
Received: from pop-os.. ([2401:4900:65bb:caef:d8d2:fa8c:9c6d:c932])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324256896csm6181753b3a.40.2025.02.16.04.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:02:34 -0800 (PST)
From: Aditya Dutt <duttaditya18@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	cgroups@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH] selftests: make shell scripts POSIX-compliant
Date: Sun, 16 Feb 2025 17:32:25 +0530
Message-Id: <20250216120225.324468-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes include:
- Replaced [[ ... ]] with [ ... ]
- Replaced == with =
- Replaced printf -v with cur=$(printf ...).
- Replaced echo -e with printf "%b\n" ...

The above mentioned are Bash/GNU extensions and are not part of POSIX.
Using shells like dash or non-GNU coreutils may produce errors.
They have been replaced with POSIX-compatible alternatives.

Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---

I have made sure to only change the files that specifically have the
/bin/sh shebang.
I have referred to https://mywiki.wooledge.org/Bashism for information
on what is and what isn't POSIX-compliant.

 tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh   | 10 +++++-----
 tools/testing/selftests/kexec/kexec_common_lib.sh     |  2 +-
 tools/testing/selftests/kexec/test_kexec_file_load.sh |  2 +-
 tools/testing/selftests/net/veth.sh                   | 10 +++++-----
 tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh   |  2 +-
 tools/testing/selftests/zram/zram_lib.sh              |  2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh b/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
index 3f45512fb512..00416248670f 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
@@ -11,24 +11,24 @@ skip_test() {
 	exit 4 # ksft_skip
 }
 
-[[ $(id -u) -eq 0 ]] || skip_test "Test must be run as root!"
+[ $(id -u) -eq 0 ] || skip_test "Test must be run as root!"
 
 # Find cpuset v1 mount point
 CPUSET=$(mount -t cgroup | grep cpuset | head -1 | awk -e '{print $3}')
-[[ -n "$CPUSET" ]] || skip_test "cpuset v1 mount point not found!"
+[ -n "$CPUSET" ] || skip_test "cpuset v1 mount point not found!"
 
 #
 # Create a test cpuset, put a CPU and a task there and offline that CPU
 #
 TDIR=test$$
-[[ -d $CPUSET/$TDIR ]] || mkdir $CPUSET/$TDIR
+[ -d $CPUSET/$TDIR ] || mkdir $CPUSET/$TDIR
 echo 1 > $CPUSET/$TDIR/cpuset.cpus
 echo 0 > $CPUSET/$TDIR/cpuset.mems
 sleep 10&
 TASK=$!
 echo $TASK > $CPUSET/$TDIR/tasks
 NEWCS=$(cat /proc/$TASK/cpuset)
-[[ $NEWCS != "/$TDIR" ]] && {
+[ $NEWCS != "/$TDIR" ] && {
 	echo "Unexpected cpuset $NEWCS, test FAILED!"
 	exit 1
 }
@@ -38,7 +38,7 @@ sleep 0.5
 echo 1 > /sys/devices/system/cpu/cpu1/online
 NEWCS=$(cat /proc/$TASK/cpuset)
 rmdir $CPUSET/$TDIR
-[[ $NEWCS != "/" ]] && {
+[ $NEWCS != "/" ] && {
 	echo "cpuset $NEWCS, test FAILED!"
 	exit 1
 }
diff --git a/tools/testing/selftests/kexec/kexec_common_lib.sh b/tools/testing/selftests/kexec/kexec_common_lib.sh
index 641ef05863b2..b65616ea67f8 100755
--- a/tools/testing/selftests/kexec/kexec_common_lib.sh
+++ b/tools/testing/selftests/kexec/kexec_common_lib.sh
@@ -96,7 +96,7 @@ get_secureboot_mode()
 	local secureboot_mode=0
 	local system_arch=$(get_arch)
 
-	if [ "$system_arch" == "ppc64le" ]; then
+	if [ "$system_arch" = "ppc64le" ]; then
 		get_ppc64_secureboot_mode
 		secureboot_mode=$?
 	else
diff --git a/tools/testing/selftests/kexec/test_kexec_file_load.sh b/tools/testing/selftests/kexec/test_kexec_file_load.sh
index c9ccb3c93d72..072e03c8b1c3 100755
--- a/tools/testing/selftests/kexec/test_kexec_file_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_file_load.sh
@@ -226,7 +226,7 @@ get_secureboot_mode
 secureboot=$?
 
 # Are there pe and ima signatures
-if [ "$(get_arch)" == 'ppc64le' ]; then
+if [ "$(get_arch)" = 'ppc64le' ]; then
 	pe_signed=0
 else
 	check_for_pesig
diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 6bb7dfaa30b6..e86f102f9028 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -137,7 +137,7 @@ __change_channels()
 	local i
 
 	while true; do
-		printf -v cur '%(%s)T'
+		cur=$(printf '%(%s)T')
 		[ $cur -le $end ] || break
 
 		for i in `seq 1 $CPUS`; do
@@ -157,7 +157,7 @@ __send_data() {
 	local end=$1
 
 	while true; do
-		printf -v cur '%(%s)T'
+		cur=$(printf '%(%s)T')
 		[ $cur -le $end ] || break
 
 		ip netns exec $NS_SRC ./udpgso_bench_tx -4 -s 1000 -M 300 -D $BM_NET_V4$DST
@@ -166,7 +166,7 @@ __send_data() {
 
 do_stress() {
 	local end
-	printf -v end '%(%s)T'
+	cur=$(printf '%(%s)T')
 	end=$((end + $STRESS))
 
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 3 tx 3
@@ -198,8 +198,8 @@ do_stress() {
 
 usage() {
 	echo "Usage: $0 [-h] [-s <seconds>]"
-	echo -e "\t-h: show this help"
-	echo -e "\t-s: run optional stress tests for the given amount of seconds"
+	printf "%b\n" "\t-h: show this help"
+	printf "%b\n" "\t-s: run optional stress tests for the given amount of seconds"
 }
 
 STRESS=0
diff --git a/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh b/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
index 874c11953bb6..18fdf88936f0 100755
--- a/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
@@ -36,7 +36,7 @@ done
 
 eeh_disable_vfs
 
-if [ "$tested" == 0 ] ; then
+if [ "$tested" = 0 ] ; then
 	echo "No VFs with EEH aware drivers found, skipping"
 	exit $KSELFTESTS_SKIP
 fi
diff --git a/tools/testing/selftests/zram/zram_lib.sh b/tools/testing/selftests/zram/zram_lib.sh
index 21ec1966de76..923dbeb64eaf 100755
--- a/tools/testing/selftests/zram/zram_lib.sh
+++ b/tools/testing/selftests/zram/zram_lib.sh
@@ -37,7 +37,7 @@ kernel_gte()
 
 	if [ $kernel_major -gt $major ]; then
 		return 0
-	elif [[ $kernel_major -eq $major && $kernel_minor -ge $minor ]]; then
+	elif [ $kernel_major -eq $major && $kernel_minor -ge $minor ]; then
 		return 0
 	fi
 
-- 
2.34.1

