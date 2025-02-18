Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242E71BEF78
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 21:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739913708; cv=none; b=hmByldQ03aXPS+HuGmc4E1LDgE6eSjEnS9n5/sk0mll52ewI1yzcsWIGW+ru7flmVD0aAf5dBermKnViwduW7L5vyIIDLo4miXSI5kubPj1fghLcaXazKe3vAFT8h39aGvMny2T5I4t1DsMuw38sE22scB3utPco5MkD9WGQLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739913708; c=relaxed/simple;
	bh=9ZXR/UegNSYFkVyBV3mAl6h0OC8oO7OjCk7UEoajhQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nLIvqZheHchxdU9mXRveCF0gvI3jFd0ieyD4Dz4aemIPZNk9lsPPyLJfd2wbjsvMZPnITmsvtqJhLhIcxJ4A2fcaSVvz9PAs+2JneEtRnDTdcY5dWhbXDDxZlka/p0BvNTghQmNov/QXY6uf1glBkYpzLCO47BTDyB2qEYYdnhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqwf2P44; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqwf2P44"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220c92c857aso3883275ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 13:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739913706; x=1740518506; darn=lists.linux.dev;
        h=content-transfer-encoding:signed-off-by:mime-version:message-id
         :date:subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YgGSnITBh/OY5xM1TqoNGaQf6WlJBBaRc6tj0P3/bI=;
        b=aqwf2P440CkOavXfm5tlWZrYi5ddjx7cmzo2hldZBNqblcvUOHiV0Og6uQGlxKQQj7
         6O9aIBwdGvIJn3wRUhhh+qaUDrDSmKX7xY2mSwUauzvTe59aFfhUxQu0BNNJpTOZjU/Y
         1PZvOtZlSbXYtSppPb0Hbx9IaNK9gk1Nkutrw7EhM/xgBY7dPrfpQP/TuELa1OOWoevs
         mYlBkAvNK/fEleAeD7Knf+F3pyjQYkP7ohPns80AdL+fMhgijBkBZM/xq5F6nlvCLmpJ
         Ejnnr5OZ+ya+l15pwcGBv0YoOnj4rUebXupbQBwSv6ZB4zhuwcDmh2mLo4oRehL+fdiV
         CX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913706; x=1740518506;
        h=content-transfer-encoding:signed-off-by:mime-version:message-id
         :date:subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YgGSnITBh/OY5xM1TqoNGaQf6WlJBBaRc6tj0P3/bI=;
        b=fya4zcEuO95Kp22VL0Q6vngCy7ClloeEoASt4dQPkbDWK7uFZOK8By1sFPbnresXAZ
         0m2TkG9WvfKHJCYaOnP9LjxyTouSBk/G5lAe0MVr8SVrYR68KoWQplJREEZhSmiOm56Z
         41/L6OHEShQFijSPeicIAlbELZL5Fv1XPQ2RAu6LdamVZAz4m7uIqAQrQSrBGmY5zaJ6
         r3k5f+9ONw15QA7BGyKae1m7t4+JbLMTnNXmFG/1N4HfW7FL8eiREMc8JP1ujblVQhJQ
         N/7xgmuoTKNna9jxPGPVj74jZHfKcEPPCyquAasFCYLyWbadR+juiAvpw3/OnGXWdfWT
         w8vg==
X-Gm-Message-State: AOJu0YyT93XlP7SwP0oBDfjFmEq7bUBmq1hbJqC6JJGOr/3felLLzOLl
	4K5iwK7fA0oeTPfGva66q2F/OJGsbDX3PKqnmrlhiwWyepAPrvC2
X-Gm-Gg: ASbGncsbnXYxFSWN7NVJJdceRYwg8JFvjYk0LkEx6/9Vx41AbAGUkSKAHFZtkHMkEQc
	XxjD0EjCfXw3IP35O8oAH3EeDC/SWJEnZpOvWAy4rnczn0ortGBCksZZ/fsR9ERRSxOILvWXnXu
	9YGPRBlfoHDqJ2m+klmow2K4kRMSegOZkOUxPTij7tz0mNFLfNm2s5HqdNMLsmIXpqpQvyW0gXX
	26wl5m3chniyJgD7mDPdzq4NibN3Jo54lhODxU+ZPKJB+4e45iQs6ouZ9sYsl8IagkliYpOYCpX
	KktgOeAQOhJhFTvg5Wn2mSbEKIKPEi3P38NOQdhS/NmCXG5QlPexzo53hGJThOrlU4oriWil5A=
	=
X-Google-Smtp-Source: AGHT+IF2W1k1ssg9MXvqdUOe3nsa1g98vCJTND8J+en8nWqJOgcrQ9879nPUGUgQic8mHvktCGTP+g==
X-Received: by 2002:a17:902:ce0f:b0:220:fe36:650c with SMTP id d9443c01a7336-2216f11a1eemr22367835ad.23.1739913706310;
        Tue, 18 Feb 2025 13:21:46 -0800 (PST)
Received: from node0.suho-242436.threadtune-pg0.utah.cloudlab.us ([128.110.217.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545cf6bsm93394715ad.123.2025.02.18.13.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:21:45 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumya Hoque <sumyahoque2012@gmail.com>
Subject: [PATCH] Documentation:FS:Fix minor typos in filesystems/f2fs.rst
Date: Tue, 18 Feb 2025 21:21:42 +0000
Message-Id: <20250218212142.557462-1-sumyahoque2012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
Content-Transfer-Encoding: 8bit

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index fb7d2ee022bc..412b0949143b 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -310,7 +310,7 @@ nocompress_extension=%s	 Support adding specified extension, so that f2fs can di
 			 nocompress extension will be treated as special cases and will not be compressed.
 			 Don't allow use '*' to specifie all file in nocompress extension.
 			 After add nocompress_extension, the priority should be:
-			 dir_flag < comp_extention,nocompress_extension < comp_file_flag,no_comp_file_flag.
+			 dir_flag < comp_extension,nocompress_extension < comp_file_flag,no_comp_file_flag.
 			 See more in compression sections.
 
 compress_chksum		 Support verifying chksum of raw data in compressed cluster.
-- 
2.34.1

