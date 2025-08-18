Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98E02D24B7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755539632; cv=none; b=JOqv8DY0I+PDXPjX6xuH1rwMEh4Hr7H9RAn2iqV9hP/krEN8LJIXqXnMpBWoNHanRSQPvvMm3wJS3asjGOP9s71Dh8V1yyDFL6lTfyhXAowRf1VKypV4ZwQuBt/JNWB+QGxpBxLKkOeLKhGA63UrMrtYE0FPzgGwPflzYmFr8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755539632; c=relaxed/simple;
	bh=HJIUb4G5YI+Rixd/D2ApFQOK4mZ88TMso8AJjwTrMlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kbMeLQD/08KMuYo97/l44hDXTVgLaQBmHqs9b7LEfmHzWn3Mnc5WnxG3VzJG2Xxwnb52bEprIiofsG/YOfgDIL/GnVx4ePETH7houl5gMSGSAJHxOm/h+LDc8oA6rJZNGmDn54p8nRp7MOsMp4S7qPvxSiDyer8N0p8LOf2qipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yi4khDPH; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yi4khDPH"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70A6A406C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 17:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lloh4toN-pa0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 17:53:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3E36406B7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3E36406B7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yi4khDPH
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E3E36406B7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 17:53:49 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76e39ec6f30so3433242b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 10:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755539629; x=1756144429; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9c4GNojMcxWdoHKIoocPUw00TeAK1QWc4rtBiWWbTGg=;
        b=Yi4khDPHCnmCADIdp6KYoBKxtA6oANiPkjJsjCFawy02TZ8Lj61FxkXgNNAO0OpmxK
         X/DbSUelCUDmfIZu0qlheypg+WGpuTt4814aEXOClqsvrInqgivh/vRaXdhxLPzHOiy2
         jqZ7gmyvWwNw4uIIrtJn6Z8pepr6r7ZQqTffBppE2oG2ZtnxxA/HhvDEhZ7ekIPuqn8a
         galaW0I32l2Y9H2QXsFGIcgpYNAtz07A/pmsfy0d1Rn0b5UyxRYLuc2+qfiO91EApsI8
         oQF17TnGhwT8kpmfUstopS87Gwt+arwbfwK/FCA4VXkFAnJ6HfrBHTDoEmAJC1Y8rMAk
         N0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755539629; x=1756144429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9c4GNojMcxWdoHKIoocPUw00TeAK1QWc4rtBiWWbTGg=;
        b=Cx3QNfMQetQ9N3+31d5II4Dv1v+r8+1A1RD9e4XJm93QfwarURoa4kZrxSakqSDvBs
         1G1puqveOKeDHsAh97h6uKXxsLQ2r21iCr9NPGqrHPkWHjuQEg2TGyvWbzj4uBvxr9vu
         EW5Yl6Jck0m2TI/n4azz0CZOcLEd9403WZOVZzaEESN8ebYGoSXF1Y0MCbInb7l0xoro
         gC1Q/fhM8wgQfJlfiXnWLHJTqQ1qLpdaDNVeUwBRfalu95IdzFLbri1GKNZln65gbGv7
         3um1krMiA5K8CKPdVrj98JhJnTiLzwz3UcBfH07PXDHAFvoOgKF0KcT7lwCSDLgCiKuB
         RT9w==
X-Forwarded-Encrypted: i=1; AJvYcCWy6X8Ug3WddBSz0PX7Tzmw/mXrWt5KzEPCuU+hXaGS0eToZUmPyp1ser+QIANCWtoNKD8n3/XI2V+q6kWYVq/35cIGVA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxt8sNmdhskICBYw56cjeADyJZNpZGyMM2vC1m+rke+nAllPxiy
	irJSkWvHLR1qfC18TO5pNf73J38ssp3GvYOvkdNil32LsR6YLcFjTYka
X-Gm-Gg: ASbGncuYlQ+8R6mb2ScPBsbcfer999GiZE08OpGmGuWIoARoPhXjfX/4/T/W/Z6R9lq
	9ZggC+ert2EnWn4i7i3S8g+SF9OCfBC1UuGWDTgNZcxnkYpXWK2ej3wCh3PycNFvg30kZcPeyul
	rZTFWE5AkMOJBjm77FCMkaFlf5h42CKFUJzt/oPKPrNpl4lY1DQJEPGEc8fPVQL43UTVVubZWpq
	7Re33QV7ndGyfgRYjWfMNeZLGorQe2rT9CbM5Ses9LI+K8TPUb9dYdwfBbVw8haUVJOjfS2R37f
	LAgL3paoBKXeiUzBdJt7e1Q38VzRVAtpG+puteybdCNH/vNdoKeer3yn02F4+1i4d27fSg+0C84
	bu/F8q9jdUWIcKEOiVhaz2hWyMKbC
X-Google-Smtp-Source: AGHT+IGimQ0BQxI4HtYUvNmSf65iLZ6R75oRZQfjucpMXUHBcrTZ+pSB/uB+jU0Oaqu0OvBWl6QukA==
X-Received: by 2002:a05:6a00:1806:b0:76e:3a11:d24f with SMTP id d2e1a72fcca58-76e516de72dmr10789522b3a.15.1755539628773;
        Mon, 18 Aug 2025 10:53:48 -0700 (PDT)
Received: from lkmp.. ([223.237.184.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d22e9sm248437b3a.8.2025.08.18.10.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 10:53:48 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org
Cc: dan.j.williams@intel.com,
	dave@stgolabs.net,
	dave.jiang@intel.com,
	jonathan.cameron@huawei.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	linux-cxl@vger.kernel.org,
	alison.schofield@intel.com,
	gourry@gourry.net,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	corbet@lwn.net,
	rakuram.e96@gmail.com
Subject: [PATCH v3] Documentation/driver-api: Fix typo error in cxl
Date: Mon, 18 Aug 2025 23:23:34 +0530
Message-ID: <20250818175335.5312-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the following typo errors

intersparsed ==> interspersed
in Documentation/driver-api/cxl/platform/bios-and-efi.rst

---
Changelog:

Changes since v2:
- Fixed Signed-off-by line to include fullname
  (feedback from Jonathan Corbet)

Changes since v1:
- Dropped fix for page-allocator.rst as requested by Gregory

Suggested-by: Gregory Price <gourry@gourry.net> 
Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/cxl/platform/bios-and-efi.rst b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
index 645322632cc9..a9aa0ccd92af 100644
--- a/Documentation/driver-api/cxl/platform/bios-and-efi.rst
+++ b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
@@ -202,7 +202,7 @@ future and such a configuration should be avoided.
 
 Memory Holes
 ------------
-If your platform includes memory holes intersparsed between your CXL memory, it
+If your platform includes memory holes interspersed between your CXL memory, it
 is recommended to utilize multiple decoders to cover these regions of memory,
 rather than try to program the decoders to accept the entire range and expect
 Linux to manage the overlap.
-- 
2.43.0

