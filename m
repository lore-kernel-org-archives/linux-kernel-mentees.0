Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DA12FB2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 02:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727058324; cv=none; b=h6zyjVB94DVQ3kSk3pgnMjh54MD5tulothRCqyCcufJSTMaQ390QdNQ2f7kuHVeoiUY/lpxyQqbht7e26LvL4Ot45N5xr45iY8MI2VyB83I/BlZWMBDiZZ3WJpcW/8UlOwi2fGqzkWzu0BFtDj/E2EV3ErDR6xwFQ5O5AdX+SmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727058324; c=relaxed/simple;
	bh=xhXbNvM++7qKbgPSVqhFDU2ZhXaHlORv7ZNSLZePNZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KD1077MmIxA1afzan5Xu2n9meNzeTm4baHJvakjCruRlWOukjCpBK7CHplb1TnsS60eHemzEeRpff2RzhgbzTnoiuz7TCJFEmhQpvc0XgJtpmn4qlEKBsVZ+LK6SXowpwXKU25p680ZBssaEqkMMj+ax1romSaiM3Ep0jzE+g8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeCD5INo; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeCD5INo"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1E83405F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 02:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXxt7qPPhA2Z for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Sep 2024 02:25:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=leocstone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D41C0405E9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D41C0405E9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eeCD5INo
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D41C0405E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 02:25:21 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20543fdb7acso30026875ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 19:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727058321; x=1727663121; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7aLKOb5llbH39oSD2wqFg2ImH5K/xs1d/3DhTSvBAM=;
        b=eeCD5INo9pZefVspl4eSq3vv9Od8md9M2OCyqdZ5FCskeInK0ymE15Dkn32lH5Ujat
         dRjSfBPmAPP+jOKeFVHvIsLQLW0tPfsr6ImECMxIoV49Rsb72UtysDT18YM+iTe1JSp2
         aJSIlMfudNCc0GTMPnqZkRaAEq0ygPs/LjvakL5npiTKw/0FB0Vi/7pkLtgbN6w0VdC4
         lJ1LJM7d50heBEgrpaiHKF5akFQK88Pqmo+3Ufxvz7vcNgM/1yfIR6dg5gyBfgdftmK0
         MZK27vUCjtT5mq4JSX7Trll0/DG3f+aG6VBiA3bu9g2ViGglJ3K2G7d717HciFx0QKsN
         ypSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727058321; x=1727663121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7aLKOb5llbH39oSD2wqFg2ImH5K/xs1d/3DhTSvBAM=;
        b=HTrRBmZ2fJBDOhCKFk7N/idC3E1s/UJtKu8koPgy8xQvV+wbXor2nK3Og8pNVc2pVo
         6kk3RXhhQ7mHPdlZaPke0S5EoD0mEKIzVNlT2ThdihUaTSh2A43CwqpkWagk9er7/jIW
         g2VSC6YKhM6ZYK9QXu58tFNWMGPUXehVm+LcZlhSNAFOm6gkWE3YccltAF85jKsbKO/R
         eff+WT/4h9XT+44Zjm/sDHHc1iim8SaLRDTdjKtF1V66Trh1pY7wDucN387PV1vqqSIB
         YSbItj+fbvlt4SJ901CSt34+6S/4sfl0UyjXfaEhBkMOkaK0vjbo4N05FYCtYcO9v5Nc
         Q1Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXgTzGX/dQmUgW8tEYJJ1Ym3hQXMNnI4BS5O0X4YbOTm8H2n+6jHzo9PkBarWwnSBSNVSKpDI+eVFRdkjmM8Vs+FzYznQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxn1tbsIhlWZU4cTSGZlzxlOddyPW0Po+pTLQWLkalIM+saL7ye
	6b/rEN00UkoHa991fNuPM08k0dqQObj5P+WLUcT0o/3pRsg3JyJk
X-Google-Smtp-Source: AGHT+IHMe8B9R9yeowkpYMpdwCkp3LhabZm8IJy9oinfaIcj2oqUQXGLPn9cSkJoTdRgN+hp5ZNI4g==
X-Received: by 2002:a17:902:d503:b0:202:3324:68bd with SMTP id d9443c01a7336-208d84421afmr140151485ad.43.1727058320760;
        Sun, 22 Sep 2024 19:25:20 -0700 (PDT)
Received: from tc (c-67-171-216-181.hsd1.or.comcast.net. [67.171.216.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079473e8a2sm124613895ad.251.2024.09.22.19.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 19:25:20 -0700 (PDT)
Date: Sun, 22 Sep 2024 19:25:18 -0700
From: Leo Stone <leocstone@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: Leo Stone <leocstone@gmail.com>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, akpm@linux-foundation.org, 
	ruanjinjie@huawei.com
Subject: [PATCH v2] mm/damon: fix sparse warning for zero initializer
Message-ID: <xriwklcwjpwcz7eiavo6f7envdar4jychhsk6sfkj5klaznb6b@j6vrvr2sxjht>
References: <20240921195511.364023-1-leocstone@gmail.com>
 <20240922151121.469051-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922151121.469051-1-sj@kernel.org>

sparse warns about zero initializing an array with {0,}, change it to
the equivalent {0}.

Fixes the sparse warning:
mm/damon/tests/vaddr-kunit.h:69:47: warning: missing braces around initializer

Fixes: 17ccae8bb5c9 ("mm/damon: add kunit tests")
Signed-off-by: Leo Stone <leocstone@gmail.com>
---
v2: Added fixes tag. Thank you! 
---
 mm/damon/tests/vaddr-kunit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/damon/tests/vaddr-kunit.h b/mm/damon/tests/vaddr-kunit.h
index a339d117150f..3dad8dfd9005 100644
--- a/mm/damon/tests/vaddr-kunit.h
+++ b/mm/damon/tests/vaddr-kunit.h
@@ -66,7 +66,7 @@ static int __link_vmas(struct maple_tree *mt, struct vm_area_struct *vmas,
 static void damon_test_three_regions_in_vmas(struct kunit *test)
 {
        static struct mm_struct mm;
-       struct damon_addr_range regions[3] = {0,};
+       struct damon_addr_range regions[3] = {0};
        /* 10-20-25, 200-210-220, 300-305, 307-330 */
        struct vm_area_struct vmas[] = {
                (struct vm_area_struct) {.vm_start = 10, .vm_end = 20},
--
2.43.0
