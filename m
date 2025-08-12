Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4722C15B5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755031910; cv=none; b=TCV7mTV863o//jGLgnjqLK2Zkv8XTFICniqqm/U9Kw7rLrLbAZvwTJsrl3NC6q5fJrUQor5VKNXy+2MYcF2ppDBaxSmxlnbumHQna045wInJXktqL1g7zoMThq/P5+lU3dUGQLo+gxTMcYEl+LDpg5YD4E1ytYkFtmdIg/W31Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755031910; c=relaxed/simple;
	bh=72/rW/U9hfSGKa/EluNbR0vaerLlksMsoG8Uz/YysFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TDl/gXsUgPyVozRXTK2KrOQcbBVXd+kh9J6PLqUdc33nYwOxsQRbQbDBeV/5+s6JnlPL0ovyhn03/ukfVHdYlwoGcbLaOwWp4vQzPfE+jYBI89K5xmLu8REMsFLNez069ZhMr04KW5m3LUZPVRY1XHdIO7+lrdrqj4IoZ3dOtuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZIzr/yT; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZIzr/yT"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04ED583E1F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.487
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yx_WnWpK6I1k for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 20:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4289F83F6A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4289F83F6A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XZIzr/yT
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4289F83F6A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:51:48 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b4255b4d8f9so4008721a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 13:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755031907; x=1755636707; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAt0IjQcmWPsXVdAdFWYUtQj6oXeDL0Qo9K0VCGCNPg=;
        b=XZIzr/yTU1iPE1ww3d/OWtumYFrd0PXTJBn2EteZmbzd3q8tnV1NVeGvp9iFfdl/3Y
         BFzmML1XCKmiL2yGOZsVTUmz+hXCt8lslUxwEVu0l1TW8wH052CBmP2wZPjqR6nXJRjO
         qiuy1CWQUXyp0l/kavgVoSE3IniuCR04cVBDHu042+Efh0DD4pA86KHMFTVtSVEVB0H9
         ueFSiKNoM+hjFBO43G0LoVCgnHlVBfOkV8PiJsccs51tHe6LB+jA1HSR84qh2Ni24gVD
         qp/3qvVosXYjskssMsD9vNoyi+eSj5ax5Vw4RjUA6XR4ETSP+kr4+sVUxv7h1XUoKGd/
         i6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755031907; x=1755636707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAt0IjQcmWPsXVdAdFWYUtQj6oXeDL0Qo9K0VCGCNPg=;
        b=c+0GQXtt11Y6DSL/vQ+QJX7QuWiCkmnVd4McGkczQdnIqRu2vXxHAOn8GNs9y/ZDx7
         1R7Z9GwYt5Xnk7HT8iaiCRghoJqFd2QV9/hVvOhGPl6sYHyIWkt52kyvh0gJkkwDLPI8
         4XdxDS42dgZ/DoKgT9gsSHqj++/bwBSNFaUGA1/wnnBZRz1ewr/aQPfUyRutQ9T727aP
         hF1ubBCgrnsHKu0r8vMyCgzWs/o4aAPIgcNcVvVEmLeSA8HYJz2gFPiA2ktG4HdMNZpP
         l/NES7W8KJqa0Kfumus4tdek7ETH++yiXdThEZNyEZ0RhH2R4mNJQyY84Ms2OrcjiM3/
         ZK+g==
X-Gm-Message-State: AOJu0YwugKft93Z95gRdy4CXaWNu+RXWRP21e3NGcB/ZxnsIg21JUuVb
	fTwr0hOENAqEVG9F6jN1F4uc/rQLe2YjMA+N14qECqd4ptghAXKNhV4u
X-Gm-Gg: ASbGncubuP4o/iKt8ivk0KKRl8/qwnOq0wnmUAPNHlV3zoDJwt8vinteub/jv89iGZH
	C77uAhAyzbyLtS62e9l7zx/dL770vUZm+G9CBHJGmQP6tqr+On/uxcCvnh0dHN6OjmQVaDAEA9X
	bS1UEAcA0jjQBk/iQ5C3KMrYIOUzwkmGidwAhcpiJEUR6u9xAWG9xBrmupvoYgcvYcLN4D2nIy+
	lpKkPmZcnw5D3EkOWsOlBBf8z1hgACrNXqr0aMti3x/qxgNWv/PwMl5ZqBeI36ocH3Xo+ptDATB
	uCkreDHsuzJO58ZciEfQJzm+B+aJ/JBGr0frv/doIW18mObX5paoBnu29I3T0DgyvYIN9WyPasI
	81wQZ5hEKLY5Ddq3px6yMgSnoA9p06g4=
X-Google-Smtp-Source: AGHT+IGsXUIDB/PAF2iTQW2I+RaNPeuCiwYjXE6+sYMw9pUYocPZrUTfjUalk1qA+n2hBLrmTyn1bw==
X-Received: by 2002:a17:90a:dfcf:b0:31f:335d:3424 with SMTP id 98e67ed59e1d1-321d0e66003mr603651a91.27.1755031907429;
        Tue, 12 Aug 2025 13:51:47 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cccsm76048a91.18.2025.08.12.13.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:51:46 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthew Sakai <msakai@redhat.com>
Subject: [PATCH v2 4/9] docs: device-mapper: fixed spelling mistakes in documentation
Date: Wed, 13 Aug 2025 02:19:47 +0530
Message-Id: <20250812204952.73136-2-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812204952.73136-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typos

- flushs -> flushes
- explicitely -> explicitly

in `Documentation/admin-guide/device-mapper/delay.rst`, and

- approriate -> appropriate

in `Documentation/admin-guide/device-mapper/vdo-design.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/device-mapper/delay.rst      | 8 ++++----
 Documentation/admin-guide/device-mapper/vdo-design.rst | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/delay.rst b/Documentation/admin-guide/device-mapper/delay.rst
index 4d667228e744..a1e673c0e782 100644
--- a/Documentation/admin-guide/device-mapper/delay.rst
+++ b/Documentation/admin-guide/device-mapper/delay.rst
@@ -3,7 +3,7 @@ dm-delay
 ========
 
 Device-Mapper's "delay" target delays reads and/or writes
-and/or flushs and optionally maps them to different devices.
+and/or flushes and optionally maps them to different devices.
 
 Arguments::
 
@@ -18,7 +18,7 @@ Table line has to either have 3, 6 or 9 arguments:
    to write and flush operations on optionally different write_device with
    optionally different sector offset
 
-9: same as 6 arguments plus define flush_offset and flush_delay explicitely
+9: same as 6 arguments plus define flush_offset and flush_delay explicitly
    on/with optionally different flush_device/flush_offset.
 
 Offsets are specified in sectors.
@@ -40,7 +40,7 @@ Example scripts
 	#!/bin/sh
 	#
 	# Create mapped device delaying write and flush operations for 400ms and
-	# splitting reads to device $1 but writes and flushs to different device $2
+	# splitting reads to device $1 but writes and flushes to different device $2
 	# to different offsets of 2048 and 4096 sectors respectively.
 	#
 	dmsetup create delayed --table "0 `blockdev --getsz $1` delay $1 2048 0 $2 4096 400"
@@ -48,7 +48,7 @@ Example scripts
 ::
 	#!/bin/sh
 	#
-	# Create mapped device delaying reads for 50ms, writes for 100ms and flushs for 333ms
+	# Create mapped device delaying reads for 50ms, writes for 100ms and flushes for 333ms
 	# onto the same backing device at offset 0 sectors.
 	#
 	dmsetup create delayed --table "0 `blockdev --getsz $1` delay $1 0 50 $2 0 100 $1 0 333"
diff --git a/Documentation/admin-guide/device-mapper/vdo-design.rst b/Documentation/admin-guide/device-mapper/vdo-design.rst
index 3cd59decbec0..faa0ecd4a5ae 100644
--- a/Documentation/admin-guide/device-mapper/vdo-design.rst
+++ b/Documentation/admin-guide/device-mapper/vdo-design.rst
@@ -600,7 +600,7 @@ lock and return itself to the pool.
 All storage within vdo is managed as 4KB blocks, but it can accept writes
 as small as 512 bytes. Processing a write that is smaller than 4K requires
 a read-modify-write operation that reads the relevant 4K block, copies the
-new data over the approriate sectors of the block, and then launches a
+new data over the appropriate sectors of the block, and then launches a
 write operation for the modified data block. The read and write stages of
 this operation are nearly identical to the normal read and write
 operations, and a single data_vio is used throughout this operation.
-- 
2.34.1

