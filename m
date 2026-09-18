Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DB23C584B
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Sep 2026 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712451; cv=none; b=IwdLxLs3ipl5qPKJBmO14GbfSVTu+DesVKPU0nJjV1PHafoxkr1bQcEfpw/Lnv2fOxfl0mHOHS2QkPf3Gl2ML3S9YfWCaVzoBPqMBdwiDHaDfI8arFnmrSsya8AVFXXvNWaftZkD5V8Iuq8XMmODetjl5jx0HvFTyxv8CZdjjRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712451; c=relaxed/simple;
	bh=noTLfj6qvE4G/3YGJrqQ+X+o+vSSS9003cx7Jk2ZdtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rls85CsfQgejulh4ZGOnOQWkKzBwKBFBv08+Zm6KOjsUIqp+0dPVTVk2kzY5SfE2O1JBqHhQlD6yxupn4f3Oih1rbpWwsF+cas/i4LS9k/Ew8hdxm/+EZbplQZjxMthWBmMMMqkHuoGEuLMUITkh8pbcfFU6+AVgfoGTM5YKh6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czZmqhIh; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czZmqhIh"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so351513a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Sep 2026 23:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789712449; x=1790317249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csLwFhMu2XInJLQYNP1JrwM1YZ634u6gItc/PhWTvTQ=;
        b=czZmqhIhXPG/uFNrIrjSwBTiYakQ7G21NNzmectfNCDdDaEI8DzTJXZR7Hf6lRqYVt
         G3SGppfLALDuPhJyavXtKU0ji5nwvD+26WA2a8mkgUNyLsLEzYBaNEgRSPghy0jcKZp3
         9NWql55ZaATGiShl3uzVysBUOgK7z9Vm2WCkc62RnK32DMmVOAB62lB2TbU6RBeLnwxt
         u+pPaHBR9CUXG8pJisG1xc7oy743fCiynnGrjNLKBsJwRmf/fkHB6Rzl+g0xvpoAoB3b
         RXd3Ay8Bx9/nCFLMlHPc5ZZhoqBsY8++xyrFr8nt3YZM0x356DB7FCYxXTA2V4CTXpMx
         W7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712449; x=1790317249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csLwFhMu2XInJLQYNP1JrwM1YZ634u6gItc/PhWTvTQ=;
        b=mtv2ZCB6uD+MVrkApSQIWnN1zf6WvcfJE1jLo7r87VJiCNBMrj8MTzLC1j9hGf2JzY
         7iRY6nM1bl/ICR/0pP920/4MCsypNdXBu9zGLNIwQOnYKSRUM5YJYBAcjJwsD6lFYlzs
         q9OwMKOuHrZSWSPWYlsi7Ju6ws9RA/1v+k1kzqRoAymU4XtR5Py5uECKz/xWQUArz6UK
         5WTXTgvBSqBY3zu/i9+9kWvVxhcCUWXEyz0PYKvb2WP7zBsPLvE+i0db2iCf+5hx6BWg
         CPUcGNIVXl+5YEbo4asVgyW5/hViLZOcOg8CFrFSiFp0IBYyV1qZHwuvXSPniKkUaO4v
         2S9w==
X-Forwarded-Encrypted: i=1; AKwUvBxZfwJyR7gGlxsvKofz7kHjw+YN+GJFKm//noEf+fbuJQrP1+5QJcQh1mJIcaw3oaVBl7GWJHs7BLtidLdSvxzZ9+xmCw==@lists.linux.dev
X-Gm-Message-State: AFuF++klp/nIkv3lgPei6OWvUmB0yVjIvzukjkUqFsyOtRGfgssdUnWh
	ymDtQWb46TAaG5U/s0h7167Fk1rbDVoHuuabFs28b4jA4LJGKAdYLx+G
X-Gm-Gg: AYBFou0J99rzaakDSJCsKFnRx+C/96P/XMw39KDWRXRVMkMwzox629ci1aVhyyxlNcq
	xj5ef9AAuSGfpRfRSc10OAw57ACsNX+SN3VESmp+OhAifPxkGI0r0gazM++5Vn3Q5/OyT3j9+RX
	kvpt7npbAIuUFr54+/kwnzn1rlY3v38wPuEFG6t+NPuL5FgAPPytvJxebwy9F3FOiDmWUPWin1W
	xbX9TyOukBCvTSLskGPtI9pmxeWAolYjmGDGQiwWVwgZ+jYBrn5SKyrnf8wWRKF8kjg2QYG+MMg
	18riJF4fXUnpis0xR1g06fS2kZPF9d79jJo4ZU9ajCIuyCTWiRx/TvPw9FSQo0HW75AzX9awidP
	Qralwep9xCSw/O1OuibpjcjTEQKRi0/xLoW6PBFoIoEndoWvxxNPM1qCfue369y2or1irk4Zmhh
	G3uzN1ry8y9DWCCHfzgflyG+aUkM3OllxlpzPINtZLR1ekoDTaUuvMMywF2vLL6ZXJWc/j69a+8
	g6psgKqv1Fs
X-Received: by 2002:a17:90b:4484:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e54b66cf5mr3597578a91.3.1789712449109;
        Thu, 17 Sep 2026 23:20:49 -0700 (PDT)
Received: from mo-Inspiron-5559.. ([2001:fb1:d8:ce84:354e:5319:44a6:6a2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e361b7266sm8675903a91.13.2026.09.17.23.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:20:48 -0700 (PDT)
From: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	inux-trace-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	woradorn.laon@gmail.com
Subject: [PATCH] tracing/selftests: Fix incorrect invocation of exit_fail
Date: Fri, 18 Sep 2026 13:19:13 +0700
Message-ID: <20260918061913.28069-1-woradorn.laon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all `exit fail` and `exit_fail;` with exit_fail to keep the
usage of exit_fail consistent across the ftrace selftests. This also
reduces warning messsege such as 'exit: Illegal number: fail'
in test logs.

Signed-off-by: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
---
 .../ftrace/test.d/00basic/ringbuffer_subbuf_size.tc         | 6 +++---
 .../testing/selftests/ftrace/test.d/00basic/trace_marker.tc | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_subbuf_size.tc b/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_subbuf_size.tc
index d44d09a33a74..8cfe59d32b1f 100644
--- a/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_subbuf_size.tc
+++ b/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_subbuf_size.tc
@@ -60,7 +60,7 @@ test_buffer() {
 	# the size must be greater than or equal to page_size - data_offset
 	page_size=$((page_size-data_offset))
 	if [ $size -lt $page_size ]; then
-		exit fail
+		exit_fail
 	fi
 
 	# Now add a little more the meta data overhead will overflow
@@ -71,14 +71,14 @@ test_buffer() {
 	new_str=`awk ' /tracing_mark_write:/ { sub(/^.*tracing_mark_write: /,"");printf "%s", $0; exit}' trace`
 
 	if [ "$new_str" = "$str" ]; then
-		exit fail;
+		exit_fail
 	fi
 
 	# Make sure the entire line can be found
 	new_str=`awk ' /tracing_mark_write:/ { sub(/^.*tracing_mark_write: /,"");printf "%s", $0; }' trace`
 
 	if [ "$new_str" != "$str" ]; then
-		exit fail;
+		exit_fail
 	fi
 }
 
diff --git a/tools/testing/selftests/ftrace/test.d/00basic/trace_marker.tc b/tools/testing/selftests/ftrace/test.d/00basic/trace_marker.tc
index 9aa0db2b84fc..1986c1bf1606 100644
--- a/tools/testing/selftests/ftrace/test.d/00basic/trace_marker.tc
+++ b/tools/testing/selftests/ftrace/test.d/00basic/trace_marker.tc
@@ -68,14 +68,14 @@ test_buffer() {
 	new_str=`awk ' /tracing_mark_write:/ { sub(/^.*tracing_mark_write: /,"");printf "%s", $0; exit}' trace`
 
 	if [ "$new_str" = "$str" ]; then
-		exit fail;
+		exit_fail
 	fi
 
 	# Make sure the entire line can be found
 	new_str=`awk ' /tracing_mark_write:/ { sub(/^.*tracing_mark_write: /,"");printf "%s", $0; }' trace`
 
 	if [ "$new_str" != "$str" ]; then
-		exit fail;
+		exit_fail
 	fi
 }
 
-- 
2.43.0

