Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E41E0092
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 21:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731100928; cv=none; b=ZLRcwhQtwSle5zomHD586Aju2aTjifMdaxEptbfnYME66jLcerJwh0gY4ZwgdVrKreyYK+3PUd3xizBMQbJE3RDjTNWsBSUIFrrEU16bcKi3tz0A37SfndnyKMN/zSxBB66eZowVImDd5vYvYWwYCHLnFeW7UmAZNnYgDhLoH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731100928; c=relaxed/simple;
	bh=tgXJh3XRRK9yCYpYIy2cKjBM6UWh1IfIQ7+irJcbel0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jHVOwZAQK6PPRWUdTeYgZK3PVZBT8wtVd9syq7HfbFACFc/feq9AbYFpRXIx/3L5yEImXCduLQGNvgpn4HgXXLiXc9PrEprU73zFJiN+AlLqA6nMl91WSEPlOv9SELu5bzmD3q11nyUcecpZ0MFYrHDvW0eLj7urvAQtF48t/Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEvPkYfB; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEvPkYfB"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50867412EC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 21:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3-iqgryfUSI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Nov 2024 21:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4366F40B93
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4366F40B93
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nEvPkYfB
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4366F40B93
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 21:22:06 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-720d5ada03cso2650127b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 08 Nov 2024 13:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731100925; x=1731705725; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIJNpgzllF0luBBdwCdbbhKpUYPl641j+I8yTy1pQhg=;
        b=nEvPkYfB+l+1THjnKzATGzbKIYxLi9FQJXLP7ptIH8098WXoZ+XOByCiPmk17ynfoF
         EINz1AquCM70tHFI2bYUBtsLyNLPZBdtQ4WlNuyLnPsfNIHWjnzte+HomVZpGy3+ENMX
         JLjbuaLkFkJC398Cukg0woCW6qutYvn3tNQ/M6ZRKS6OH4w4pZgrNt5hfn0a8xCL7mdM
         /A2zp0JwJh8QWMHmhWIzb0lPR0U+9PMawYGHXtdn/pYS6TBOziVMyK1qhWzxECy1/QnN
         cFE/nLWateraWo6Z1HclHlfo6pkUV1TMyc/VC3RM3VDsqXAOQEN2OvXfjWgsK2b5VgKv
         erwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731100925; x=1731705725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIJNpgzllF0luBBdwCdbbhKpUYPl641j+I8yTy1pQhg=;
        b=WcVDZz77yaYeVYfu2MSfxQunjHRsyLt9rYK4OjwFmTilIDYJCOJcB7sTD+udIa5my/
         KEpLIOKMhMBtmIss5+HXqNN691PcfVQNsvCM/yVhbxCkV9ZlYFVMwfktqhwV0fOxgnls
         rhWrSc9ihGIR6lGi31vnB+RwYoC9dZHIQab8tFA11ZSeBJnKnzyKeiMMmNXAHQL3yFrI
         I8r808djVuzPxGcz4GJpEjwAdlhBqZk5OeNIA1W9gTDtnje+KcRGsFjwGCon1XSj+T71
         CZf1cnngx8HgwXlZNdn7TJjdgrQhYSwDy/O2MVUHHAVwVtdQNrRRAx/Ym4wkWiO+KRp9
         0eBw==
X-Gm-Message-State: AOJu0YzR6aMko/LADiJljM9uxIu8tsysTgdF3HgbwWI/EV2tVA1WVsiZ
	YMLsp5Y5h5sZv21hJPofKXCrTDLuQJj0PRYydQ3PMeU+9VrVbM6VeWCk1X53
X-Google-Smtp-Source: AGHT+IEJSOSqCoEiLbDmGxkTwgRA85tStmV6AjEYt3tk0HUllCvqvyC0E6GvttSnoac0a8U2/G/PkQ==
X-Received: by 2002:a05:6a20:244c:b0:1dc:2a02:913b with SMTP id adf61e73a8af0-1dc2a02928fmr3185727637.15.1731100925000;
        Fri, 08 Nov 2024 13:22:05 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f643a60sm3972595a12.56.2024.11.08.13.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 13:22:04 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH] docs: hwmon: Fix typos in sch5627 and max31827
Date: Fri,  8 Nov 2024 14:22:01 -0700
Message-Id: <20241108212201.144482-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some typos in hwmon/sch5627 and hwmon/max31827 reported by
checkpatch.pl. These changes are purely documentation cleanup with no
functional modifications.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/hwmon/max31827.rst | 2 +-
 Documentation/hwmon/sch5627.rst  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/max31827.rst b/Documentation/hwmon/max31827.rst
index 9c11a9518c67..6cc5088b26b7 100644
--- a/Documentation/hwmon/max31827.rst
+++ b/Documentation/hwmon/max31827.rst
@@ -136,7 +136,7 @@ PEC Support
 
 When reading a register value, the PEC byte is computed and sent by the chip.
 
-PEC on word data transaction respresents a signifcant increase in bandwitdh
+PEC on word data transaction represents a significant increase in bandwidth
 usage (+33% for both write and reads) in normal conditions.
 
 Since this operation implies there will be an extra delay to each
diff --git a/Documentation/hwmon/sch5627.rst b/Documentation/hwmon/sch5627.rst
index 8639dff234fc..5f521c6e90ab 100644
--- a/Documentation/hwmon/sch5627.rst
+++ b/Documentation/hwmon/sch5627.rst
@@ -39,7 +39,7 @@ Controlling fan speed
 ---------------------
 
 The SCH5627 allows for partially controlling the fan speed. If a temperature
-channel excedes tempX_max, all fans are forced to maximum speed. The same is not
+channel exceeds tempX_max, all fans are forced to maximum speed. The same is not
 true for tempX_crit, presumably some other measures to cool down the system are
 take in this case.
 In which way the value of fanX_min affects the fan speed is currently unknown.
-- 
2.34.1

