Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7233919DF53
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  1 Nov 2024 14:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730472787; cv=none; b=RzNhHgAO3v4R0PVY+Fd6lNzSBPsU1m8mGLF/hWwFifs5qfO1XG/gEzouDfrkJZtIRmssbFeskgQP8rI9v0elJH60KOs8OdY/RP/t1BzyqtH//QlDxxvA8gzB6L3C5oIMzsDMHqfLJnuq0Ax+Rt9U/WchaURmbJb39U3ype0wUto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730472787; c=relaxed/simple;
	bh=gdzhFJW7AghxABWVWepa1mAQS2QMNTrl4Nn1B5gwzVY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L5os5bJVQFpY48pZxq69qLfLg0VxRIZckT3EDpfpLbGzNcVi8MsrvGm5UnIEYJ4ocAUtApzILojXUplW21tTQGe1v+IxaUKdYzCRlioTO/BR9Gmy859QvgoAngm2L+L3RcW0bnpwn6PZT0UC6jSbkjxNgHn9aD6Z0ogGnFF9inU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwoTr/X9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwoTr/X9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-210e5369b7dso21431565ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 01 Nov 2024 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730472785; x=1731077585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5SX5NqdV5GfRyEJ/smcBZMTNvaT7jRpEZDUb9kdB6o=;
        b=gwoTr/X986yPj8NPoRaL+0YrTWdM9DJIrCvsW/+nDmWT+9EPJv0lULF+VVFckZkXYz
         osSmjlZ2a2gE3G0ik+Ttm88vZQEKsQ6TxF54Pndlo/HBCIYHrQ3i6W3jWZ1n8qParJjw
         nCny8gICKFNkLDEMHOVAIsnUgQAtamjwe6Kp0yJ0dI08NFbqDJIWiBbZVShSTWS3BiiW
         6O4CeQJHMMahknsHDTUTgOu2Ct3D13WJblO6vIlXGD0cPl9xV9PF1pK5Pb2p2mzlD855
         cziUvgtOrjDSm+Px1a/wQ5PZT5hMk2jz4LWJMnz0SxiRHywULHUH/MX0VO9E3e5TFaka
         ibVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730472785; x=1731077585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5SX5NqdV5GfRyEJ/smcBZMTNvaT7jRpEZDUb9kdB6o=;
        b=kcCBaiqj/kQXYt3GT5stFlaFT3gvLUupdNmcK7CTH4MXijD+0DKKsBdNqZ7zOAQ2sd
         lzlqkvT88nOllnUVYiBLNlDMzcn9sr2TFXeYyCB/QTsSUsMGOSgGEKRTc5AppIAYhxdq
         Tj4JX94qLB7gmgnlq16bxUO+fTbWBpibLXISBQCZJDN9/GxejXuXMDOLYRY8oE4O2y6D
         k4uk8bo4HzK8rvKgKa11a+Ygcn97DGKa63Zld+FXbgdz4WFff1+CGJiOuLRQN4Imtfg3
         sPgoYn5ZLHLf2N4o63XoEOt2R8OZwvRcN7S04bsvW22N+yqlpYRrKgJWB152V95l6iw9
         yuFw==
X-Forwarded-Encrypted: i=1; AJvYcCVOCXt+Y6nM+iuMRHdraDVzN1gJzQamAilsivn13j/To7aYOUMubk6Tpuri+oQ2Rey2JG3LdZYQo8PaVXVzJnJHCpR4Gg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNVoTMb/EU5Xj9iO68IAvWzvS1ldq7dpgT1/nP6VWfEkC9aS9c
	8PzVPAij92qSySzKOGe6Y3QS36CIKV4a05JrNqXSGQm59i4qUViP
X-Google-Smtp-Source: AGHT+IHMaIYJQgvi+rHO0tIXu0CPB3KdYCWQUoyyOm6bR46LXVj7R6WnhRRAdrqyBe/DGrH+2xhERA==
X-Received: by 2002:a17:90b:4c0f:b0:2e2:e660:96d5 with SMTP id 98e67ed59e1d1-2e94c2e2121mr5434450a91.24.1730472784661;
        Fri, 01 Nov 2024 07:53:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:5e:dc6d:d4a9:3dbd:7f84:6140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fbfb021sm5038090a91.49.2024.11.01.07.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:53:04 -0700 (PDT)
From: Amit Vadhavana <av2082000@gmail.com>
To: todd.e.brandt@linux.intel.com,
	skhan@linuxfoundation.org,
	ricardo@marliere.net
Cc: av2082000@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pm-graph: Refactor installation script
Date: Fri,  1 Nov 2024 20:22:41 +0530
Message-Id: <20241101145241.10326-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change installation script to ensure that the terminal returns to the
original directory after the installation process completes.

Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
 tools/power/pm-graph/install_latest_from_github.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/power/pm-graph/install_latest_from_github.sh b/tools/power/pm-graph/install_latest_from_github.sh
index eaa332399d36..aaf3515400ed 100755
--- a/tools/power/pm-graph/install_latest_from_github.sh
+++ b/tools/power/pm-graph/install_latest_from_github.sh
@@ -4,6 +4,9 @@
 # Script which clones and installs the latest pm-graph
 # from http://github.com/intel/pm-graph.git
 
+# Save the current directory
+CURRENT_DIR=$(pwd)
+
 OUT=`mktemp -d 2>/dev/null`
 if [ -z "$OUT" -o ! -e $OUT ]; then
 	echo "ERROR: mktemp failed to create folder"
@@ -36,3 +39,6 @@ else
 	echo "INSTALL FAILED"
 fi
 cleanup
+
+# Return to the original directory
+cd "$CURRENT_DIR"
-- 
2.25.1

