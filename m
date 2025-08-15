Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BAA5661
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755216602; cv=none; b=CnKWb9hdSjgtHMiY/yGTvyBkBWas4/HPHZYwA2F6MgRurGr1ViBoQ9d69NN620pjvHIKpbJoXsLqxxryuIHK94ldW2p9KYs5k66vXEwvCOo47XrEalDQjVd5gk2ObN+dNTGpqsI/MZfWifdgKBkafXJ+i90peRVxyigOzHa5lVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755216602; c=relaxed/simple;
	bh=LeLrLXcF4B2D/r502SwuoJI5Jqp2w+Ye/rStaLUoDi0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n2vzHXTkUSTL6SRXMWsMlBMVLuTqNogVA3ujlRhEv8Fl/wx+uv2rEkP/mVVXFzxPOsGizlYpmLix2DsB5WztFk1AXdPJdV3DNsv8bWWc/6ZJUGKQIhVGn88YKvGGN1XY7tqmKfBlv1/82YUf3xeS1ef0Vz8adNk7M4hHsu/WveU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7IuGm2D; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7IuGm2D"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E814039A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYaibc5yRISE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Aug 2025 00:10:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BBEF40397
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BBEF40397
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G7IuGm2D
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4BBEF40397
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:10:00 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e434a0118so94544b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 17:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755216599; x=1755821399; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlLxjN4pkp49jDBSQ7gXFAZ4FdqJj7SbFZCOba3BMhc=;
        b=G7IuGm2D6DzHq4Nr+HPtsB+4UK/C7HOSvkxnybjsWeR2+EkaazieElz1A4FEzRcsga
         lcFp+sIRmjCSuHzDySfaorS1AjN7E6BWOUOCP6gHw38MNrGxDgFxN7sRKmNgZwOsXR+2
         UNoYqpUYtUQ8fFKwCwsy+g1juKFbTojqMgUjimoZjan2ROWlsOKv8lM6RhpJKrw85mu2
         y2ojuLlfdtK6xP3XGGeHbxMqvClV90aehOXZ9AtCFIhFYK+0Z0U8/j8zba/+yx/JqDEA
         rkLE5j2fpfJ7OSsZWchvbauz6PL3SwJvbj+1ZAnq/fXOV4zD9tnE3p8XSpHur+5J5J0C
         XruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755216599; x=1755821399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlLxjN4pkp49jDBSQ7gXFAZ4FdqJj7SbFZCOba3BMhc=;
        b=ads8+Om2HML6IR/C800uu7GH8VQI2wgW9bcwdD7OMutL4x0dWMwFTe09u2bMukmcLe
         KeGn6KxlTLYNUO5vVupffYkTxgQpK3DrSbeb0ClpaQTOK5cT8ensH4ShD1iBDdQ2dohk
         u7J32S54/hoqCr83fapkdEorJt7ADcxa3psp7AMA35nHdLE0T9fpzqt5OoU8HVYQSthy
         UsuhK3JNHLCQecwPd8SOwJ+SujEgKZ2euRYJ7YS6olX7jC+nWuCqHoUWlgaHxL4/QxCC
         gefW+oLnVZQ3oanYKajygGUrdBHWK/rAoER64MtSQpNhd2xgb6qm8hp0DvifbzuIw6mE
         mD7w==
X-Forwarded-Encrypted: i=1; AJvYcCV0Yhlil4kCy8ibs/mSfMNsHzRMvb/KD4bJRnGgJ64rGMe9CJdvceqLA7d5fRzMyM5uogcdYHQQhjIInnFLi+Dc2ybRuA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzeAdSA5kd67K3LERJPeXmkz2nIknvzOlGCHmsRtjUZWzoXhd/P
	Ncy8I1Oc4Z1mzYHOxG+qm9uFjTHV5xFkdvXPE+wd6vrFoQ3c8Nts9qU8
X-Gm-Gg: ASbGncvUQtg3r0t1EQ8OBZ5R9yzXJzPGO37DZuof3mm0HqoZrOWgSxvwipOy+GEpU5S
	al3X8I6RLspiy+9JEzYnQpb+vkVMeNRV44/hh/f4S/MlzudIhyn5Z3oSac+GgCXuq7uJwePepSZ
	x2kbwxIye0qC9e3lKmI6RaC658qhRpxQDa9GmqfH47jgkWtA8n/tpb6ZEeIcsm3uJB2OeT5c++P
	fWJjpYxwTxxgCHaqxK8KEHO+bui4i8VewLId7UjwY1p17c+PpITuVejkGsnaHX8h8jNTB0Uuf9B
	SqkX5UxfG45ea67jwSIWBqXA8UfikLKKEwSC9q6z8sf/CO0B9DrTipxVmhOTFsSCTUzYENeogy4
	p7NGEQ+7dMZ2XdGmnNbJjUJ+iVgt6wK0=
X-Google-Smtp-Source: AGHT+IH4yIyU5+Vw7X3ZhdEpMKKKSLOLoQRegPY6V7frOv02QTJ899n6OOmUfl2yHMF7rrVED6sj5A==
X-Received: by 2002:a05:6a20:3c90:b0:23d:665b:cefe with SMTP id adf61e73a8af0-240d2d7d707mr315324637.9.1755216599521;
        Thu, 14 Aug 2025 17:09:59 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c2efd89aesm21367854b3a.106.2025.08.14.17.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 17:09:59 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH 1/6] selftests: filesystems: statmout: fix spelling mistake in output
Date: Fri, 15 Aug 2025 05:38:59 +0530
Message-Id: <20250815000859.112169-2-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815000859.112169-1-sohammetha01@gmail.com>
References: <20250815000859.112169-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo:

- didnt't -> didn't

in `tools/testing/selftests/filesystems/statmount/statmount_test.c`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 tools/testing/selftests/filesystems/statmount/statmount_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/statmount/statmount_test.c b/tools/testing/selftests/filesystems/statmount/statmount_test.c
index f048042e53e9..1278259231fc 100644
--- a/tools/testing/selftests/filesystems/statmount/statmount_test.c
+++ b/tools/testing/selftests/filesystems/statmount/statmount_test.c
@@ -545,7 +545,7 @@ static void test_statmount_mnt_opts(void)
 		return;
 	}
 
-	ksft_test_result_fail("didnt't find mount entry\n");
+	ksft_test_result_fail("didn't find mount entry\n");
 	free(sm);
 	free(line);
 }
-- 
2.34.1

