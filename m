Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD76833AD99
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783752; cv=none; b=K50I19Y93AE0WC1fN3X6XsfJYTtr9LOlpNDS33IjCr9A6dCy3E6UbSACXgmcsqZy9/PPNgW+2vnXNgC0r41JyaScrc8o8kZBTOyZR9FU+HMnNIAyLFLAout87QEe4piolMhzlFiX/lgR1BHVyPC6Jh5Nf8r1QS6b8Ye/ueyloHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783752; c=relaxed/simple;
	bh=zf27bKXVRn0YFfmYbxhnrXsspQ2CJPFQ3uw7zvsKqUw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pkggvy3UhZv0rUx57RRBfXTBuvzvLaJXpDrw5tT422qCG8BNXXQivEsfE6jBfPnGWUB+eoW1VPscF0wqNP2RdmssFKYK9HsiL8bZLBMHnuyRIlnke809AkdF/N0irZILc4m3WadScIiV1ngzw6eQmGo2kbszeIavUarzzFCFd0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fl7R+t/x; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fl7R+t/x"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C6914096A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iW-BNUWbYJ99 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 17:42:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DF1B40969
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DF1B40969
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fl7R+t/x
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8DF1B40969
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:42:30 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2984dfae043so460505ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 09:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764783749; x=1765388549; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XeAhmehvdhvlBdc02jry8jySSCOQI2N6rqZ8L6A7FUg=;
        b=fl7R+t/xtHXqiC05hf2wQxIymeo/pOoY/XLTAvcUQYgouUEQE/9dXeQweCLJVozsjA
         c6TQ/Smq28RIiC5ot6brb/x3LUNtpVg3wRlWqmIrnbZwTWc1QQcMYNPnTyuZ5GNE9mGX
         UGYS2fNaQ/R8vQCW9jDpZ5DJAP74O/ZQRVGxSU0RnmgxawWExy9ZYBj1iFpp0eg9orIc
         Mw/H0+Xk8k0JfIzO6xsMtY5VKFy5v3TuBKA8rBYZuhzYTT0XTMWjf6/DfYD8ecqhiu0b
         n7NGto+/FQdztAbrPhiBhLPUclCrJcBcQAJYT2pGkKc05C6l+Jv9MLagKXOEpDY8Wi3w
         +wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764783749; x=1765388549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeAhmehvdhvlBdc02jry8jySSCOQI2N6rqZ8L6A7FUg=;
        b=KpCb5qxDjdTVqdccrRigHK7y64z4RXqDz2PkRtGMcARWtZ31NTxwqc1EId+4TfiWNu
         aaye3rldxYnunDftGSlPasqqzbJN0Dx01P6Jp5yeyaSGatE2LEFz/hn5HvBfIyaXHJAQ
         6mpehvHRDEhTrp1KO4t/l2usYX08eUy01aCNbysjwNAe2LWKZJnMWYOZM5FTrNbBoay3
         RAOk/QAWbDBZx/ZINti+RLas0JuAZdbXZIdHei22PpcUXC9V1cvxUaoGsk7TheQHxwhq
         XYbm3683xOSqZFRUnewbv4lXZtYIH2Mjb9duNrCjhQLNq8YDMUBobCQRjlhLIXrDjhdF
         f/Bw==
X-Gm-Message-State: AOJu0YyjDm17nOm2dNIUPXFzsrpUfmKZ8aBJdQACqldO0xQIWINLJd3h
	qpAqsdJdu8edR76EHzM/HdA63EP9AeXTgd8ussE/fB/PiHlMyN8YUkouWWLIwYse
X-Gm-Gg: ASbGncs3HXq8ZL6amrOEGCwHV+sfM2CPxdsnedvsvqbMlj3aG0aQdKRwASflFERo2Yx
	lMvlczoj+aeV61LEYA2n+gGpib/7H2lhXSKbavTrrAa47kDegvBirlMxvcuR4jrPz4esCXhzZhO
	ECR/iBvIwKWohdw/SH/LlglST0EfOdOtzFYjV3kmkuMbQnd1lhp4dZG1AearAh6qFskNqC9Bm8P
	6XyiVBU+u7g0g96XYbhgIk//gVPT6+hv342/QrC3hE4lS2obTnnvya2w44leufChGOdcafz54/O
	2yauobZN6M0OBaLudSvhrg+0bGp3Dx5wT5coXZtDxKb0Us48egzOvBPw1M0+5KpOjVkHC29kABK
	dLUnkYJzb+IcuSvd7YfzM7XPZgdawaobEoMYJHd35pwXKMV5pixCU1N+H+d4sKfPb/x7iwcF4w/
	k3t9yJJD+8ccAQ/NGkFy4=
X-Google-Smtp-Source: AGHT+IFCJ/6FMxi6z/HzwPq4FUAbIfVntMHygrl0Bj9u5XG7QZet9gEnE0ujTtKKnt9ZqcGVnY0AAw==
X-Received: by 2002:a17:902:cccd:b0:295:96bc:868c with SMTP id d9443c01a7336-29d682bf2d6mr41038255ad.5.1764783749129;
        Wed, 03 Dec 2025 09:42:29 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb275a3sm192469735ad.66.2025.12.03.09.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:42:28 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: rv: fix deadlink
Date: Wed,  3 Dec 2025 23:11:54 +0530
Message-Id: <20251203174155.48751-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file 'da_monitor_synthesis.rst' has been renamed to 'monitor_synthesis.rst'.

This change was made in https://lore.kernel.org/all/20250725203425.275466334@kernel.org/
and merged in commit 'f40a7c060207090f41998025fcd1cfad06ea2780'

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/trace/rv/da_monitor_instrumentation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst b/Documentation/trace/rv/da_monitor_instrumentation.rst
index 6c67c7b57811..b847c58a96b6 100644
--- a/Documentation/trace/rv/da_monitor_instrumentation.rst
+++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
@@ -168,4 +168,4 @@ The probes then need to be detached at the disable phase.
 
 The wip monitor is presented in::
 
-  Documentation/trace/rv/da_monitor_synthesis.rst
+  Documentation/trace/rv/monitor_synthesis.rst
-- 
2.34.1

