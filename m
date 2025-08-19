Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8122A1DED77
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755588625; cv=none; b=NWsNNQhGV7qvvI4jKwsYnRAOPsN2cKZf4/hLEKGHbVUTauWVJWE1hVCWeozLXm1PZKlXjLAF22PHwMeVSfSfEP4jgvlVtrFQgWRY56GA8LIVcMspLA/UUU47IculNA4f5UpceXbMyz2TVVRUcQs9/L8WfoUxQIAnO7rcXEHQNQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755588625; c=relaxed/simple;
	bh=5SWrOqsOjRXtQmZBkktmi7W8AxcP0JV2xVyFi1knU3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gAU5v5SqzNgHsre3JpHLezPzKfruie9I6ZIKm/CBA+0RPSGY8ASqkf6FWcB3vS02E8OQACxS14QGdA3WAuZYCinVoaj4Lw6UQtbafC5tSrG+Fw/4KaSGu/NVFqpEvTRHioUv9uvLbrmwOdW6LKZRUMg34iW7g4nk9Div56IewB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRUyqV7L; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRUyqV7L"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0840C4031F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 07:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bowPtDjmkGo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 07:30:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CAC8402F7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CAC8402F7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gRUyqV7L
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3CAC8402F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 07:30:23 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b9d41c3a44so820600f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755588621; x=1756193421; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ/4MiuH+uKPxmrL1oBiKZlLklwBZnyUMBYuRZJW6Rg=;
        b=gRUyqV7LPnXvTx92mB1Dp1clf1TvAveurtUpfCOBPjb6EbZctNjq/OZjaGupVCzY+s
         mtoywRVBQxv8dtCJIrrKWWxAxe7aP4aBfaFJJ7tCMG7PwjH9Ztypd1YWpGIom4PZWUX6
         Irg1GdQTMXmbZG9GrjYL0eBsVchKkZCreCFaldIom1fiEFtCaGNmuWgFkXMFx8t3jGC3
         debRa589oFN2LAZqf4Yr4z+QVM1I3qqBHDs82tsPl9BZMTqhN2NKGeb7TdCsNEYcZre0
         UCzAjdtjpTK6AAMAsUQ42tI5Ckt2WKhDmFFHuAvVYQ7OcEHw7bcBpFTUAKAPRoqJbMq6
         bu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755588621; x=1756193421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZ/4MiuH+uKPxmrL1oBiKZlLklwBZnyUMBYuRZJW6Rg=;
        b=L9EX1Z60tf8lDedPvq11Jo7MbUbnrWNREQ4G4hfnxHEVFhAjR9UNmIAIDDk6Q5p1GE
         DoYgtXFkOBAK3rkE/PWhxbVPAugh+fTgr0ZzCps28GQhyTfbvQjzFu4hpM3hmZwQgYY+
         znJfpzsPgzhAjdmijTMG7MMMsdRVZKKGfhhmrsAm2EJ6uk1jc+C3yWj4H0GK4PdvNXJk
         v8Vw16vcF9ErKiTf4ZfghmLE0eJl4TP9sj26/FTZUKj9lVT6eywNw3anDX5wJD7lynfF
         gYkWbc3cVgoFQApp9xghyr9jqjXM8MfcEQizI4C2Vnwbi3ekcuHSzIft2XB8/h9xXgF4
         E/TQ==
X-Gm-Message-State: AOJu0YxaDeTI8nP1GC/ByYZoDF2LaqtzmgSgvzXTpvGMBKgd9dugT0uz
	Pee63hgd1aVmG9b6vFmSNGSTCbh/p98maLIoSvfTZhNaeILaehmmEDvQ
X-Gm-Gg: ASbGncs/AqY5qLbxkFq1KzHXVTPBJsa4eRj5sWY7TF3KW9tG7JkSYHbj/jSKfQG27/v
	ipLxAqH0bpuX6kECnJUUFr4mJKkyUDS+LaR62Ws5FJbhsjQ2+w3Yqe0JRLWkiPbTDD36T3DoeKS
	8vsjWwKWI5VzniBejPUBmtPcZua+Ic+KRz1gMIh5bgbSgmee45SgWet2msQtv0Lye/EXvGUA76z
	cWBkxSHyPyjuCLgKDeI/XkzMXRi48HU1kjwvsc8/kfvoPb1e1ykUOZxQXT+GHx1sCnuEcfFz3n6
	QxzlTc7qpaqYAYWsRZs3iwx3p6KbrL7Epl0JvwisbXvCgBLVPdMUSfg7LKbnflXg07CNAdoX6Ym
	Nu/B+cKIWeb/roe2QbbOPJygMxA==
X-Google-Smtp-Source: AGHT+IGv6czHuUnpXLot4prHKRHjCN3RGKKWdPoEbqzzyH5T85wFHsShB48xmwxssxWxNbqyfd5i7Q==
X-Received: by 2002:a05:6000:2307:b0:3b9:1677:471f with SMTP id ffacd0b85a97d-3c0e9f00014mr478984f8f.1.1755588620884;
        Tue, 19 Aug 2025 00:30:20 -0700 (PDT)
Received: from bhk ([41.231.66.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm2423425f8f.52.2025.08.19.00.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 00:30:20 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH v2] selftests:ftrace:Improved event description
Date: Tue, 19 Aug 2025 08:28:56 +0100
Message-ID: <20250819073015.125292-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-Changed pid to PID to make it more clear

-Changed 'restricts' to 'restrict' instead to align with imperative form

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
Changelog:

Changes since v1:
- Changed patch title to align with conventions.

- Reverted a typo in event/event-pid.tc "Event tracing" => "event
  tracing"

- Changed patch development to 6.17-rc2 from 6.16-rc7

 tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc | 2 +-
 tools/testing/selftests/ftrace/test.d/event/event-pid.tc    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc b/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc
index 9933ed24f901..aa83be738e69 100644
--- a/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc
+++ b/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
-# description: event tracing - restricts events based on pid notrace filtering
+# description: event tracing - restrict events based on PID notrace filtering
 # requires: set_event events/sched set_event_pid set_event_notrace_pid
 # flags: instance
 
diff --git a/tools/testing/selftests/ftrace/test.d/event/event-pid.tc b/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
index 7f5f97dffdc3..90ba7c794062 100644
--- a/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
+++ b/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
-# description: event tracing - restricts events based on pid
+# description: event tracing - restrict events based on PID
 # requires: set_event set_event_pid events/sched
 # flags: instance
 
-- 
2.50.1

