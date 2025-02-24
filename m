Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404FF23BD1B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 13:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402232; cv=none; b=mOLK/PWZ/vd7D+pDULNiunMD5JE8sqSdJH9Qe0PN7JTYLEgFZdLNwFsWaxE39UtrZ4c7eEleddpMpO8fJh5ZTIRajbCFLOKJG7whWFtis+AhcZKr/lvDv54Ae1kQrtmVcAEsmuNtcqpLwfQtwB849YQm/Igv5/M7HYKMil1fV+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402232; c=relaxed/simple;
	bh=3WH7N5b2mLwHCzKQItZCh++HaF1mtPPWYK1ByZIVs+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=byHuvZa/wUi2Y2tN7BGUHR6Kot3tofZy4SNixPf/GWPRdqa2rkm+U+Vzcq5ZXYyQHFqFUVRQQubkfdB3HqAd6pHYbzZ0jQcRJ10M+VlYFoK/ax25cFwK0N2LdqQTOJzTgbtqYMXckfoOAfeoy/TbyoSOcSMtVy3DogPlJuillAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHS4zgrR; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHS4zgrR"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6A360623
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 13:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWKPbViJzzzf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2025 13:03:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=leo.fthirata@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7B5F605C9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7B5F605C9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iHS4zgrR
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D7B5F605C9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 13:03:49 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-221050f3f00so95725145ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 24 Feb 2025 05:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740402229; x=1741007029; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K2yGA1NhGbMJI9b6zgvWTEkXn51K+UPXbLwr9O6ldtY=;
        b=iHS4zgrR6UnKjRRlAUbKx8x+gK4svWvwtrfRmwVDbnLb4Gg3ahS5hj5XIT3vo7ghaV
         oUGZho42uwft3acygKYqgeSnhMu26j1wQdulDy4sqMD9ocYWP5Iy9VlF7MXmqmzUnvjV
         kqfuuap37q2nj178CuGF53UzWZ3exTdJoJDrynLPftl/5w1eJ9PMZLHy4sDY/AWHjyzQ
         8LgvcJCjkL7DFUwbKGYPv2AfF5tRmOmlGQWXKwGKblV9AUwrYSyGVKRRimDfihx8b3PP
         RqQSGqABhQW5ivCZfXhfD3FrF+VA7yIdvnNftf7aExHnCNHkX6WtYgqDsL/T14164by8
         PO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740402229; x=1741007029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2yGA1NhGbMJI9b6zgvWTEkXn51K+UPXbLwr9O6ldtY=;
        b=T2PJYqk62KVB38CQw/mRwO9PM/k1SRrh+bn+FCYrVruDmR3cnyqhMpapfg9ZwcZL9j
         tLGktAaBSAeAorAWem+m2+jl22xDsyBNSmR1v7U0SVCLNDIO549l9R2PB/CL90t6C/9M
         +XdXb1ONjeKCMKdpWTwBeg+Hks8wfnu8ANfYX9zBawHdmasQ/Ul6xHz/g04o5y4XBI6J
         L23DdDrzPB8NLrDWLWDu3TYNWuRl7hGqJgYqpZbpIyq4QpdNh1Cc/8HeInOe9pxvrwB5
         klVcvAaeB3BGDSJeKJYu+H1Zd3weN3oJLBJ358w4c4ApG33a2mibAMMWZ9pnVKMOq9Iw
         /32g==
X-Forwarded-Encrypted: i=1; AJvYcCXBv5FEN7TYdnddTkLZ7LMp1FUqlaVA3p0i2u1LzeRLAerYdXKnIpNbxljvTJI7+LVL1nA8Xm4fa3P76Li685o2c0QHmg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzVmjHKo7zexNrQ3pydMGaDVpoR1o/4JWFabU8UtNvjoP7rqBHX
	qcN76YZ5DqurDVJNj2BPicvflZ65n7VuJjjR7RTfYsHb3LbpLz6I
X-Gm-Gg: ASbGnct8C/uil4omzcyHw3fnzEGg8AKL/iJC4tbHIh3RIhP0KvAmT+8TuAE0KpKzoTp
	mCfD/OsIClWbkS8z/sZPf4hpeiOrRuWoCpX/+Xk5BXxhBVEJzSYrTIsl5EjjOJECEEndpWEi1iS
	2nrYmOZY19ddng3zbuiZ/OIps1Avtw9rsoujX/aj87rpdDu8t2hcFp89+oTqLIT7UuaS9MnKWyg
	3CGO0RwvzjsqURL15tQtJXrgOU2JxU7B5B7xPIwNzS6h8CZ7pElxydlLxnU28UbTKaBQTuOtE4K
	vA8+3MadAzu4/RU8OxhP
X-Google-Smtp-Source: AGHT+IGgDwE3drF3XPiR4PgO0QiIq/gzYst8UaIiUyo9KJCwD6vSvTrQUc35zV8OFRAWRZHDZB7oIw==
X-Received: by 2002:a17:903:32c5:b0:21f:658b:8ed5 with SMTP id d9443c01a7336-2219ff30c91mr211707465ad.6.1740402228768;
        Mon, 24 Feb 2025 05:03:48 -0800 (PST)
Received: from dev.. ([2804:14d:887:95a9:942:b4ba:d811:bd8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d53491besm180097185ad.14.2025.02.24.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:03:48 -0800 (PST)
From: Leonardo Felipe Takao Hirata <leo.fthirata@gmail.com>
X-Google-Original-From: Leonardo Felipe Takao Hirata <leofthirata@gmail.com>
To: david@redhat.com,
	osalvador@suse.de,
	shuah@kernel.org
Cc: Leonardo Felipe Takao Hirata <leofthirata@gmail.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] selftests/memory-hotplug: debugging improvement
Date: Mon, 24 Feb 2025 10:03:00 -0300
Message-ID: <20250224130341.10613-1-leofthirata@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Formats testing messages to improve debugging:
- Inserts alignment tabs with printf for testing results
- Changes messages to improve readability and understanding

Signed-off-by: Leonardo Felipe Takao Hirata <leofthirata@gmail.com>
---
 .../memory-hotplug/mem-on-off-test.sh         | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
index 611be86eaf3d..7a2eea366c1b 100755
--- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
+++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
@@ -143,6 +143,11 @@ online_all_offline_memory()
 	done
 }
 
+print_status()
+{
+	printf '\t\t%-37s   %12s\n' "$1" "$2"
+}
+
 error=-12
 priority=0
 # Run with default of ratio=2 for Kselftest run
@@ -184,16 +189,16 @@ echo "Test scope: $ratio% hotplug memory"
 # Online all hot-pluggable memory
 #
 hotpluggable_num=`hotpluggable_offline_memory | wc -l`
-echo -e "\t online all hot-pluggable memory in offline state:"
+echo -e "Changing all OFFLINE hot-pluggable memory blocks to ONLINE:\n"
 if [ "$hotpluggable_num" -gt 0 ]; then
 	for memory in `hotpluggable_offline_memory`; do
-		echo "offline->online memory$memory"
+		echo -e "\t\tOFFLINE -> ONLINE memory block ($memory)"
 		if ! online_memory_expect_success $memory; then
 			retval=1
 		fi
 	done
 else
-	echo -e "\t\t SKIPPED - no hot-pluggable memory in offline state"
+	echo -e "\t\t SKIPPED - no hot-pluggable memory in OFFLINE state"
 fi
 
 #
@@ -201,16 +206,16 @@ fi
 #
 hotpluggable_num=`hotpluggable_online_memory | wc -l`
 target=`echo "a=$hotpluggable_num*$ratio; if ( a%100 ) a/100+1 else a/100" | bc`
-echo -e "\t offline $ratio% hot-pluggable memory in online state"
-echo -e "\t trying to offline $target out of $hotpluggable_num memory block(s):"
+echo -e "\nOFFLINE $ratio% hot-pluggable memory in ONLINE state ($target memory block(s))"
+echo -e "Changing $target out of $hotpluggable_num OFFLINE memory block(s) to ONLINE:\n"
 for memory in `hotpluggable_online_memory`; do
 	if [ "$target" -gt 0 ]; then
-		echo "online->offline memory$memory"
+		tmp="ONLINE -> OFFLINE memory block (${memory})"
 		if offline_memory_expect_success $memory &>/dev/null; then
 			target=$(($target - 1))
-			echo "-> Success"
+			print_status "$tmp" "[SUCCESS]"
 		else
-			echo "-> Failure"
+			print_status "$tmp" "[FAILURE]"
 		fi
 	fi
 done
-- 
2.43.0

