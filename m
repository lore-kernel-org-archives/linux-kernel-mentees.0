Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F059426ED4E
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 20:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621447; cv=none; b=GznSs7Ag3EDoiax7XDeUMb+sjyqA1ynw3Bvvoq7NQBt43MpZ+LsXAuTdiv6ac0Dqx4u7n121fDv5C27+Ugsx0dC8qX3RDo84PtM6VfRhpUQm7xKfTDGtclskiTqizwweVw1gcyMR2IlQ/fYlHJFOiA6PzIcq4N7oWqJUPuoKLnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621447; c=relaxed/simple;
	bh=vVfNmKLReJIr6irlUJCgyzFE5CUHU9PZFq34vRHt61o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFgytaz0JxV02CdSyfdyzHlQAaf1ih2vqbVZm29cnzhh9ZR8+V4fUn2ZXJ483JPtk4MpsYHrDCKeCBOx4ZQdWQdTh7J50rPU/D3a8Y/KtaeQW6n7LFeOVOAmFXjQbnyoRv+CD1427eP/4AG611/okngaUgIjfEcS93WWO8zFTA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZ7sFuHK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZ7sFuHK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so5620545b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Dec 2025 12:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621445; x=1765226245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YG0Pj+z2EKpXJyRhBzodicaoMUh26LjSMTkBpeRy1U=;
        b=eZ7sFuHKnJwczAo7Vq08G30d8tdjm64IDte9BablzafpOMPbMHvR8BmWNAL6fIBw76
         ucJfYCD4tfuoxxd55a4vauUDPm+LGsShvLPGcKS6uzHchpW4J4ydP8w+LPCfgU9zsNLn
         7xlFQHN3D52BHr9KiDn45HDNISgzA4Cg5lJZwTABmlUfPwZ5yd+2dV3vLq7x5GaRDlbK
         x2wtL7v2j/7uSInm2/LjBxO8Fg0AhBEC5ee1kdBJ+LLwYMJPXzHTO29FTU7Y87OPA9Pr
         3EOPWUBD2ii5t6PMVqWUDk+IbrggRsjL8rxSbEstR/Eda4KyOa3kIuc91eh1ZyArKfYF
         L1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621445; x=1765226245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4YG0Pj+z2EKpXJyRhBzodicaoMUh26LjSMTkBpeRy1U=;
        b=gfNqPW3+V9z0hOS+n5/QwWCubjNIdJ+NUHTsLPVTyt2WT+/6dSPbSkV1D+PE+02JnU
         a4Ai50nKqDLpoHwLWOUkci7TDU8CcLuhQqJb15CoENsB3Zgr8tweSDdrKTiJZCsVt8mi
         h0HzYEtZDtsF7hK1rKPcwgSEVLBUYehflUWmSj6O6CCOqW8pkZC95GESHhoMlg8DKzpX
         ipDOtM+BXuzSc8QLWQy5Jt6ChR/h7P6ZDoCPReP+lXBA4XpvAyEbYWtGGn/6c7dD2JzH
         y1Y88DCjZE6MeBTwkqRtzIXEBh45fOPBow8LrE1FxQc9b/g4rE0tLQ9cxoWNkc+IelUy
         E5jA==
X-Forwarded-Encrypted: i=1; AJvYcCW605epQH6kPJExkiVIZBRp0foyTFVuHNkdrNdB/P3QN8NMzRTJgKm7VugDy6nGSmyhXuNpPY8myiGPZPKTy6X0qemk2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+odjCdiR/MFeynf1IW1nVc5KYPVtGqD53wg1ZAdkQiyR2Zptp
	u5dvvR1TgrSrrTpkYEVL4+yjDRux6TZIv1hQ0tRbog6RcfivtYicyUda
X-Gm-Gg: ASbGncuYBgAVpU3QPdYqss852L8oykEqhCJWvyWxo95lsvk7tadLb+U6HnvWYpPfn3J
	+1XPrC2ezdS3YAJC/SpQLtNrXLrSDB8fwTi3xVn48wM4BUVtR9QSSvfEd7eX5mCdFmiIVATXNHL
	U68IqsdX49evG5WC+zLur1slX12dSbuQ/k9b4XGJfXD+INil29xmv3RWs3/yAbD5hy8TACOa0ty
	w+P3iC9dUB+sXHAJPCsDz43xdPsDBU1vQEUeagbEDF5dhSJX1+Ddwd6Yu8JFkvndO3Z+sK0QZYj
	LFLjLKyneIhEWquZkMVUw6Gp3L1oNwQwxu5oJvoLdmfxDWVzKkTImijO5eRgbmjs+hS1AvDJyjG
	2XiDO5TqiBdyaXHRY4f7JSbQPDY4S8IYMr7miIIqkmwf9dF/51XWderT7JDbpnb6nPkTxxjEnKo
	+73U0Paf+XBFg+TRzWhkjscgTsMsRxntCTrF0=
X-Google-Smtp-Source: AGHT+IGAwif/XA27nFNIUswvTaFJ8lE0FRoQzMPjwLoR6UR1PITdFn89NrHKtlo6fdOYcbELASwJkg==
X-Received: by 2002:a05:6a20:a107:b0:350:ee00:3cc1 with SMTP id adf61e73a8af0-36150f05d99mr45878699637.30.1764621445196;
        Mon, 01 Dec 2025 12:37:25 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:24 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
Date: Tue,  2 Dec 2025 02:07:09 +0530
Message-ID: <20251201203715.17768-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series focuses on addressing various coding style issues in
the dummy_hcd USB gadget driver. The changes includes adding relevant
comments, improving readability, and ensuring consistency with kernel
coding conventions.

Clint George (6):
  usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with octal (0444)
  usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
  usb: gadget: dummy_hcd: document ISO endpoint allocation pattern
  usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
  usb: gadget: dummy_hcd: remove unnecessary parentheses
  usb: gadget: dummy_hcd: move function braces

 drivers/usb/gadget/udc/dummy_hcd.c | 52 ++++++++++++------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

---

Testing:
- Ran compiler testing with no new warnings detected.
- Ensured the module builds and inserts cleanly without issues.
- Used Static Analysis tools to confirm no new issues were introduced.

Please review the changes and let me know if any modifications
or further testing of the module is required.

As part of my LKMP mentorship i have to complete 5 patches as a criteria
for graduation and thus have focused on working on such
beginner-friendly patches so that not only do i get the required number
of patches but also get familiar with the process of kernel
developement. Thus, while this patch series doesn't address the max_stream value
exceeding problem that triggers the BUG() API, i will take some time to
dig deeper and truly understand the problem and fix it and not just
paper-over the problem.

Again, i am very grateful for your feedback greg and alan to guide a
beginner like me. 

Thanks,
Clint

-- 
2.43.0

