Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0FE29827B
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 18:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024224; cv=none; b=ZgieHTDt0fyOm0u5ATh9GTC01pmmq8D7khQ5/d3fqhNHIEum0gZcIvJNDeN+C5xFCIbvegNZaTdZsT/+MSb7pVjv2luTfyyvsZ0g4ZPXy9ulIUe8cG/TElKGJmdWTEu5Uicj1qPoQkroQMrbPWD2EzEt+yLLWATDSueTQ6hFvdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024224; c=relaxed/simple;
	bh=0ojk3OmS08CSe+W0zcrgYl9JC/vymBwmSPVtv8lHsZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BKtpMjtFkg9FnVIijUKz6c+MF2H9nB+MUvV0xQJZlBZtuNPOhxrDkA90Nye5xvhqHedHwoMpjd0MUFz1KsJUBE0VIaIv/a8g+zLOkCo2swzRTACVnxBmITE2pNjfTmqSn3T2m+CnFvXR4WnRpW2N0+z1LizR6SQGqZgtOLancGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bre9wu8y; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bre9wu8y"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7376e311086so258337b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748024222; x=1748629022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zw/MOjfFz4K8rbGZR8XgD40DBGzetjJhkkywW+GhA0c=;
        b=bre9wu8yDtK2/lKriVjYIBnDQZVK3VBHIw9jeUywpP29r9A2fZZvANvlV34ecCiZTq
         kxKE1EH9I1ILfet/skpQk5XQh6N5Y8cvGlnAGrJOQeqSaVnHqvLKqo7mX4K9zB9yRq+4
         NvMlWsnAG0UpqhDDZ5RzUM83koUgmosaN3H/1B4NgwRPAHuyQXdYS23IDkGnuMKlKbhi
         /AHZS41Te/uItZoWj3RafJEloTQdaVGZ2zer0JKyllBg+C6b9tz8aBHlwdHB1/YQpZ8B
         XmGPmswnBaoIjMrJqxoBWkYhGQ48dbVc3hXgR0KeSzUSXuiN5cSaTlmZ2BIBLtONK6UW
         22hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024222; x=1748629022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zw/MOjfFz4K8rbGZR8XgD40DBGzetjJhkkywW+GhA0c=;
        b=Stllty0mb8jp+A6gD/WR6n0hYEkJRqUOsiKITdMV7MUCneHw4Z7Pa0mORbez95fWUY
         /FrrLpGoFzQFsRE0BHsnLs9FtN2NOSDlPfAhoxEcVDDkXWgpqo7nFA4hqh98F/DfSE/Q
         ZmofZI8T2gYbhREMjuYB0K4O51gDrMlYTjF5rqFicOM9S3x6VFtuQ1NYh0JTajxkyzaY
         QHVJsGtiZjQi/rcXDeghetTKhB7pyy9zeSd2m7wiRFS3uEF7yxOfJ8wAiI2byjDNvfkk
         cqiB8fb8LMgXupkHNKEKpwlriCretlR1Vl/FQ+au2N6djTp7MrvGUmMYkk0cwgYozBXO
         MISQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlMi6sC/d8sPAZ2/WXDCCDRCLcfEY7uIjeCUWxDYuQrhmwdmfdvWfPEsfLEAc+EDicUiXOyso4YAIwGbUKjSPWwb0Swg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx35CdTg0r+AZvcWNYdvY0yiZ4v2AjhNRrRHvQ/3qjijfQLFtoZ
	nuK4X79QSrxlifoJNbPrduz0EfjqTiR079jpNJKPmMmcNCPCymj78TtD7opFbDQj
X-Gm-Gg: ASbGncsdQ2vr3TpJDexJBIqGkTA5bLnqUAT82SSRrVhBHmd4aAc9bYTZtjlJBHWUU+h
	oNv0ioB75bQtvINp2V4j5L7UZww3R1SYIoTIjQu0tHuWHe/8H6d/5Ucd3jpGrHSlX+KCmifsHfo
	c7dmRyP5XPtIi2aauBNhp+l3o3yCjVEyHbu/Nl414dEBsnJ0IvnPZjNh7IZsXs1Uwfr90Q2HThb
	N3K+VkdEIE6cnMpGJ0gtK2Q89mcUKjw9C96Hgkv7M3ekoKCyEmrGBnphAi4ca6nPETGGa1dpjOO
	xdRFh9YvfjiIkfDb69Ucu93WjmqMsK3G9omAaH9IzOwmNfK3RIrZUHF72Yyrb6x+8w==
X-Google-Smtp-Source: AGHT+IEf1S7LbaPSzHV8k2IFf3PpHso3pvVQ+QAzZW4pDP/WKfKC7oWmOUIpUklfFxvE82AfwB0DEA==
X-Received: by 2002:a17:90b:33cc:b0:30e:9349:2d83 with SMTP id 98e67ed59e1d1-311102ca4f8mr86444a91.5.1748024211490;
        Fri, 23 May 2025 11:16:51 -0700 (PDT)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5bd3sm7633099a91.37.2025.05.23.11.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:16:51 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: skhan@linuxfoundation.org
Cc: pbonzini@redhat.com,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	rk0006818@gmail.com
Subject: [PATCH] selftests: kvm: Fix spelling of 'occurrences' in sparsebit.c comments
Date: Fri, 23 May 2025 23:43:52 +0530
Message-ID: <20250523181606.568320-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Corrected two instances of the misspelled word 'occurences' to
'occurrences' in comments explaining node invariants in sparsebit.c.
These comments describe core behavior of the data structure and
should be clear.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 tools/testing/selftests/kvm/lib/sparsebit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/sparsebit.c b/tools/testing/selftests/kvm/lib/sparsebit.c
index cfed9d26cc71..a99188f87a38 100644
--- a/tools/testing/selftests/kvm/lib/sparsebit.c
+++ b/tools/testing/selftests/kvm/lib/sparsebit.c
@@ -116,7 +116,7 @@
  *
  *   + A node with all mask bits set only occurs when the last bit
  *     described by the previous node is not equal to this nodes
- *     starting index - 1.  All such occurences of this condition are
+ *     starting index - 1.  All such occurrences of this condition are
  *     avoided by moving the setting of the nodes mask bits into
  *     the previous nodes num_after setting.
  *
@@ -592,7 +592,7 @@ static struct node *node_split(struct sparsebit *s, sparsebit_idx_t idx)
  *
  *   + A node with all mask bits set only occurs when the last bit
  *     described by the previous node is not equal to this nodes
- *     starting index - 1.  All such occurences of this condition are
+ *     starting index - 1.  All such occurrences of this condition are
  *     avoided by moving the setting of the nodes mask bits into
  *     the previous nodes num_after setting.
  */
-- 
2.43.0





This patch fixes two misspellings of the word 'occurrences' in comments within sparsebit.c used by the KVM selftests.

Fixing the spelling improves readability and clarity of the documented behavior.  
Only comment text has been changed — there are no modifications to the functional logic of the tests.

I would appreciate your review and any feedback you may have.

Thank you for your time and support.

Best regards,  
Rahul Kumar
