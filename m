Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337E11F4CBA
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Mar 2025 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742039593; cv=none; b=Lan/kx6VXSqehMRiz06JczK7toQ8dej89qyuJwPKQGeB6GruzPQm9Zp8Kj81/+D52Q7jNTcD5rvv0mHH8Z4TZwusC6RRDWzUOmDrkq8uii/CT8scENaX/YShBkZA5oaPhW8jrnqyeh30Cg6RxIZj9L2JLxTBKxtTR2/CZ85sD/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742039593; c=relaxed/simple;
	bh=jCIsUbojM8GGNQ9TWGqtaIdEb+WFr4/YRzN7pMtbxdg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dFdD2oLfmpkFq8olLZmpLB0xJPluLVR1bgctwfotp4tNCAYEB34iS2UUoLSJWlDrXz6mtxxFioQxEBGV3EDFks6xCY4cDpV49RDulK+NAf8C7MBpFsuVjLBAS2SvCzP5uR0g6Y+5KHpZSGCnuQeNZ0twffgirfHK3FiHkvxokfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=wiogVGvx; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="wiogVGvx"
Message-ID: <4a061ceb-8504-43ae-b1eb-a5ab43811de7@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742039581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/6DWrZP0BJl7yUQxfX+w5LV75EPaYNOf8tgfikWeYI=;
	b=wiogVGvxFXYs/yu/9A804lHOYIwktZ4HOs9e6GR5KS1NxCjL8gI0FJson9X7I5CzGQvErB
	txYqfhYI8b4U7PTE9CIJcK/37pcdDzWHSPSYud1BUyJt4qtaCOBR5su3lNTBhNC6vzMk8G
	7K0ExtSJ4X1LtIszeCUelaRYN64BqxcksL5A3R3Lz4Vw9WFeJgraoQfUjSkDA1eOVAPn4s
	v06blf05lX0d0sWLRg5bITO0m40iN8dUhWOhrbZeVIIk+vWr48QyBZY3N+LaGzvKkcDtRs
	ZB+xKfofzBZ388PuMXOiIOvzFbkvVmMt/WQd80xxV76+FwJuZ3HdcHvrttSvMg==
Date: Sat, 15 Mar 2025 12:52:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in try_to_migrate_one /
 zap_page_range_single
To: syzbot+419c4b42acc36c420ad3@syzkaller.appspotmail.com
Cc: akpm@linux-foundation.org, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 syzkaller-bugs@googlegroups.com, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org
References: <67b44eb7.050a0220.173698.004a.GAE@google.com>
Content-Language: en-US
In-Reply-To: <67b44eb7.050a0220.173698.004a.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hello!

This seems like a recurrent complaint from KCSAN (other examples are
[1], [2]). 

From what I understand looking at the source code, imprecise reporting 
of the maximum resident set size is considered to be acceptable.

Annotating `hiwater_rss` as `__data_racy` [3] should make KCSAN happy. 
Would this be an acceptable change? Another possibility would be making 
the update from `update_hiwater_rss` atomic, but it doesn't seem worth 
the potential slowdown.

Let me know if my proposal works for you.

Thanks!

[1] https://syzkaller.appspot.com/bug?extid=73d65fc86d6338db5990
[2] https://syzkaller.appspot.com/bug?extid=31cd52ba68feee156393
[3] https://docs.kernel.org/dev-tools/kcsan.html#selective-analysis
