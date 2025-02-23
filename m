Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DBB17BA1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 04:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740284670; cv=none; b=rXeXUTRfWmPjhXI+ZO/3DsycD4oQF72Bp4zWmKvQ4zTKO5923CgAxsxP2xcP5urAK9oF6hv0wYyrkaXWP0mm6HC28SPLMqi6ZOLzxgSL2m/LHYLRoK9kRU2NVosUr1JND00T8NMkRwfmSx8c5Ovz1/HeWRBrz0ZKjSZ1PRvBNvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740284670; c=relaxed/simple;
	bh=4utJuDlOsvUYHCnvQ6QA0Gjx0TL5LAtKGca9nQJw+lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RthynprcJDIBYzEGsa7k8e1szo7TCvHYSbl8KSZdOwAgvCtACk/wlgXa/vpW8Jcbb6xqfAJwLlCUqDtNtQsgm6tBAq7ZcmjKB85Ctd8iFlmwm490ZVpan+vP/DQRVarWqRSn2y2k3gWEPkS6oy42jYp/WRu8y48xrvEAkK0pPEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5Ppokmx; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5Ppokmx"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0CAB4081B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 04:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwdDJQMB1Hhk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2025 04:24:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C11A407F2
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C11A407F2
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G5Ppokmx
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3C11A407F2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 23 Feb 2025 04:24:28 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-220d28c215eso51432275ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 20:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740284667; x=1740889467; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4utJuDlOsvUYHCnvQ6QA0Gjx0TL5LAtKGca9nQJw+lQ=;
        b=G5Ppokmx8TBRVpxpZEorTOsXqKhePE1aPKtxl5JghZ6V4v4fDTW8/7slt+qalft29Y
         +4SxuGm0pzxorCkE5WQoWj68JrVGbeZVswna/CkddviyNqluXwkHMW4IoWx1uEbV+IAj
         yQOMz6K/+aO6nLDkU8/LpqxfulGf0ca4eBtWhWBvumg9RpbAPBH9fG2mJzSfGgP2AoKh
         0dyTZFSPo/SbGzL33ih6WhOZbvhog/vbNSgPwAwdeBziSHNVLvEZkzXfwyr6ez0ambDY
         /VNWoXMry1143gas8FFcabsNwR9j+MmguWUbqGiB4q1VtYSU6JcFxTTnnqznR6TNQyZT
         yWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740284667; x=1740889467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4utJuDlOsvUYHCnvQ6QA0Gjx0TL5LAtKGca9nQJw+lQ=;
        b=C6I6hdHiXd7JAEIdt8nt/26diQLuH9qf1G4lcdWU9TMx8T9RkihYsAWX3B13Od2eAG
         y6ChC8BZpQZH+hQ26ClLtLBvld43qSPGdJ+wG9EY+FMrPLX8ANso+Ul3GcWzNU98QJtV
         1pwcjDMIct9eI6gYUB4F9RVsmUhSzd0XME56REe7UttDc7D8ePibQf9vizt7c/o00ya3
         ogfSBds2fcCozz3neXBP10++ySabIGlLWpXpFObgrIvse92KLPF4nY1ynZ1qmnHuSBjb
         6EvL0zIVLADT8oOiygz+DRHAwyFyvjzpL3C3JwIkUCI9U/I7OuNIQgIQRDxzCweB8mSU
         IAFg==
X-Forwarded-Encrypted: i=1; AJvYcCVMwcmzQaNlhb20E0hQDhRVCV+GVDszrVhKBv0ymckt6cqxbtGUNy5hK4W6z9NAUrKpR3lfvDvA5/iPys7rurlcb1zjHA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YweMrHkaD/78j64mFMgZ6uYYmyC2i04IjY4A6IRJ4dSyOMxC7Xl
	RKEpL7f6a+m+9OoYu52sa64w082ZHwiDavtFJnj8VEOQJpHo17Eh
X-Gm-Gg: ASbGnctYWpg2JKWz3I3vHakRKprvUkf/pF75cLaT/HVQFWy3rsRaG8kvuphKYNSX8Yn
	qnFURsLwtB5i92quW62bmKMr/7cGvaODvVwuzbefGlE1gfwMbAdl4lJqfM7ytEn9fdvbjfOGg+m
	eRbUbKM1lqxj2cfSOwfYkMFiqTJlDWthWHuBGORGjDEXL3gHk38pZeoFsVx0kqy2YARiAXJTkOM
	Cxc8sBaU9RPz+yk9hp5L108AnEDmuH+aZrBlqVkmmULpAble4WakzjG5H76MSSplnFZfP7bYwEs
	8PLkLKKarSXjhPNMMhnOydGe5J+29Q4F6HT3J1nf8rUEhoRw
X-Google-Smtp-Source: AGHT+IETNzBByeQOq7EpOZLfBRs/ixt5hXArruM21mHPF3nbXPJTnmlS5y+q4HGQ3M6zAW3jcsqWZA==
X-Received: by 2002:a17:902:fc48:b0:21f:61a5:67a5 with SMTP id d9443c01a7336-2219ffdde5fmr151052365ad.42.1740284667039;
        Sat, 22 Feb 2025 20:24:27 -0800 (PST)
Received: from ritvikos.localdomain ([2405:201:5501:4115:b161:5a88:9ecd:1b07])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d7c6f419sm155327335ad.200.2025.02.22.20.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 20:24:26 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 99211ED9140; Sun, 23 Feb 2025 09:51:12 +0530 (IST)
Date: Sun, 23 Feb 2025 09:51:12 +0530
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Seyediman Seyedarab <imandevel@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] selftests/mount: Close 'fd' when write fails
Message-ID: <Z7qiOE3EXo8BtdY8@ritvikos>
References: <20250222114709.50011-1-ritvikfoss@gmail.com>
 <20250222121249.50588-1-ritvikfoss@gmail.com>
 <zshes4xtyir7zrrybeqj2amrxyctwqnuvx2tqyktv4vsfstxqi@pvdq2rb5m47j>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zshes4xtyir7zrrybeqj2amrxyctwqnuvx2tqyktv4vsfstxqi@pvdq2rb5m47j>

Yes, the kernel will handle the 'fd' cleanup automatically, but
the existing implementation already closes it before exiting.
However, in case where write fails, its unhandled.
This patch addresses that gap :)

Nevertheless it's subjective indeed.
Thanks for reviewing!

Regards
Ritvik
